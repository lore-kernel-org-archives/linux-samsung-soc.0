From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 4/7] media: s5p-mfc: add iommu support
Date: Tue, 24 May 2016 15:31:27 +0200
Message-ID: <1464096690-23605-5-git-send-email-m.szyprowski@samsung.com>
References: <1464096690-23605-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1464096690-23605-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Uli Middelberg <uli-3Mif0c9/FFI3ibs+7tISlw@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds support for IOMMU to s5p-mfc device driver. MFC firmware
is limited and it cannot use the default configuration. If IOMMU is
available, the patch disables the default DMA address space
configuration and creates a new address space of size limited to 256M
and base address set to 0x20000000.

For now the same address space is shared by both 'left' and 'right'
memory channels, because the DMA/IOMMU frameworks do not support
configuring them separately. This is not optimal, but besides limiting
total address space available has no other drawbacks (MFC firmware
supports 256M of address space per each channel).

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c       | 24 ++++++++
 drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h | 79 ++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index fff5f43..6ee620e 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -30,6 +30,7 @@
 #include "s5p_mfc_dec.h"
 #include "s5p_mfc_enc.h"
 #include "s5p_mfc_intr.h"
+#include "s5p_mfc_iommu.h"
 #include "s5p_mfc_opr.h"
 #include "s5p_mfc_cmd.h"
 #include "s5p_mfc_pm.h"
@@ -1084,6 +1085,22 @@ static int s5p_mfc_configure_dma_memory(struct s5p_mfc_dev *mfc_dev)
 	struct device *dev = &mfc_dev->plat_dev->dev;
 
 	/*
+	 * When IOMMU is available, we cannot use the default configuration,
+	 * because of MFC firmware requirements: address space limited to
+	 * 256M and non-zero default start address.
+	 * This is still simplified, not optimal configuration, but for now
+	 * IOMMU core doesn't allow to configure device's IOMMUs channel
+	 * separately.
+	 */
+	if (exynos_is_iommu_available(dev)) {
+		int ret = exynos_configure_iommu(dev, S5P_MFC_IOMMU_DMA_BASE,
+						 S5P_MFC_IOMMU_DMA_SIZE);
+		if (ret == 0)
+			mfc_dev->mem_dev_l = mfc_dev->mem_dev_r = dev;
+		return ret;
+	}
+
+	/*
 	 * Create and initialize virtual devices for accessing
 	 * reserved memory regions.
 	 */
@@ -1103,6 +1120,13 @@ static int s5p_mfc_configure_dma_memory(struct s5p_mfc_dev *mfc_dev)
 
 static void s5p_mfc_unconfigure_dma_memory(struct s5p_mfc_dev *mfc_dev)
 {
+	struct device *dev = &mfc_dev->plat_dev->dev;
+
+	if (exynos_is_iommu_available(dev)) {
+		exynos_unconfigure_iommu(dev);
+		return;
+	}
+
 	device_unregister(mfc_dev->mem_dev_l);
 	device_unregister(mfc_dev->mem_dev_r);
 }
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h b/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
new file mode 100644
index 0000000..5d1d1c2
--- /dev/null
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
@@ -0,0 +1,79 @@
+/*
+ * Copyright (C) 2015 Samsung Electronics Co.Ltd
+ * Authors: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef S5P_MFC_IOMMU_H_
+#define S5P_MFC_IOMMU_H_
+
+#define S5P_MFC_IOMMU_DMA_BASE	0x20000000lu
+#define S5P_MFC_IOMMU_DMA_SIZE	SZ_256M
+
+#ifdef CONFIG_EXYNOS_IOMMU
+
+#include <asm/dma-iommu.h>
+
+static inline bool exynos_is_iommu_available(struct device *dev)
+{
+	return dev->archdata.iommu != NULL;
+}
+
+static inline void exynos_unconfigure_iommu(struct device *dev)
+{
+	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+
+	arm_iommu_detach_device(dev);
+	arm_iommu_release_mapping(mapping);
+}
+
+static inline int exynos_configure_iommu(struct device *dev,
+					 unsigned int base, unsigned int size)
+{
+	struct dma_iommu_mapping *mapping = NULL;
+	int ret;
+
+	/* Disable the default mapping created by device core */
+	if (to_dma_iommu_mapping(dev))
+		exynos_unconfigure_iommu(dev);
+
+	mapping = arm_iommu_create_mapping(dev->bus, base, size);
+	if (IS_ERR(mapping)) {
+		pr_warn("Failed to create IOMMU mapping for device %s\n",
+			dev_name(dev));
+		return PTR_ERR(mapping);
+	}
+
+	ret = arm_iommu_attach_device(dev, mapping);
+	if (ret) {
+		pr_warn("Failed to attached device %s to IOMMU_mapping\n",
+				dev_name(dev));
+		arm_iommu_release_mapping(mapping);
+		return ret;
+	}
+
+	return 0;
+}
+
+#else
+
+static inline bool exynos_is_iommu_available(struct device *dev)
+{
+	return false;
+}
+
+static inline int exynos_configure_iommu(struct device *dev,
+					 unsigned int base, unsigned int size)
+{
+	return -ENOSYS;
+}
+
+static inline void exynos_unconfigure_iommu(struct device *dev) { }
+
+#endif
+
+#endif /* S5P_MFC_IOMMU_H_ */
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

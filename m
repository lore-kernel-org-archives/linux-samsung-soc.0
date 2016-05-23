From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/5] drm/exynos: iommu: add support for ARM64 specific code for
 IOMMU glue
Date: Mon, 23 May 2016 12:50:44 +0200
Message-ID: <1464000644-12227-6-git-send-email-m.szyprowski@samsung.com>
References: <1464000644-12227-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44441 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752076AbcEWKvB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 May 2016 06:51:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7M005PDM4XYU60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 May 2016 11:50:57 +0100 (BST)
In-reply-to: <1464000644-12227-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch adds support for ARM 64bit architecture with IOMMU-DMA glue
code, so Exynos DRM can be now used on Exynos 5433 with IOMMU enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig            |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  7 +---
 drivers/gpu/drm/exynos/exynos_drm_iommu.h | 55 +++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index d814b30..343813a 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -15,7 +15,7 @@ if DRM_EXYNOS
 
 config DRM_EXYNOS_IOMMU
 	bool
-	depends on EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
+	depends on EXYNOS_IOMMU
 	default y
 
 comment "CRTCs"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 21c719e..1b148ca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -159,12 +159,7 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
 		 dev_name(private->dma_dev));
 
-	/*
-	 * create mapping to manage iommu table and set a pointer to iommu
-	 * mapping structure to iommu_mapping of private data.
-	 * also this iommu_mapping can be used to check if iommu is supported
-	 * or not.
-	 */
+	/* create common IOMMU mapping for all devices attached to Exynos DRM */
 	ret = drm_create_iommu_mapping(dev);
 	if (ret < 0) {
 		DRM_ERROR("failed to create iommu mapping.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.h b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
index e54031f..411b5d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
@@ -49,6 +49,61 @@ static inline void __exynos_iommu_detach(struct exynos_drm_private *priv,
 	arm_iommu_detach_device(dev);
 }
 
+#elif defined(CONFIG_ARM64) && defined(CONFIG_IOMMU_DMA)
+#include <linux/dma-iommu.h>
+
+static inline int __exynos_iommu_create_mapping(struct exynos_drm_private *priv,
+					unsigned long start, unsigned long size)
+{
+	struct iommu_domain *domain;
+	int ret;
+
+	domain = iommu_domain_alloc(priv->dma_dev->bus);
+	if (!domain)
+		return -ENOMEM;
+
+	ret = iommu_get_dma_cookie(domain);
+	if (ret)
+		goto free_domain;
+
+	ret = iommu_dma_init_domain(domain, start, size);
+	if (ret)
+		goto put_cookie;
+
+	priv->mapping = domain;
+	return 0;
+
+put_cookie:
+	iommu_put_dma_cookie(domain);
+free_domain:
+	iommu_domain_free(domain);
+	return ret;
+}
+
+static inline void __exynos_iommu_release_mapping(struct exynos_drm_private *priv)
+{
+	struct iommu_domain *domain = priv->mapping;
+
+	iommu_put_dma_cookie(domain);
+	iommu_domain_free(domain);
+	priv->mapping = NULL;
+}
+
+static inline int __exynos_iommu_attach(struct exynos_drm_private *priv,
+					struct device *dev)
+{
+	struct iommu_domain *domain = priv->mapping;
+
+	return iommu_attach_device(domain, dev);
+}
+
+static inline void __exynos_iommu_detach(struct exynos_drm_private *priv,
+					 struct device *dev)
+{
+	struct iommu_domain *domain = priv->mapping;
+
+	iommu_detach_device(domain, dev);
+}
 #else
 #error Unsupported architecture and IOMMU/DMA-mapping glue code
 #endif
-- 
1.9.2

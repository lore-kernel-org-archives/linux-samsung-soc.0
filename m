From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 4/5] drm/exynos: iommu: move ARM specific code to
 exynos_drm_iommu.h
Date: Fri, 17 Jun 2016 09:54:26 +0200
Message-ID: <1466150067-8065-5-git-send-email-m.szyprowski@samsung.com>
References: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32968 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322AbcFQHyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 03:54:45 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8W00JHFON6PP30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2016 08:54:42 +0100 (BST)
In-reply-to: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch moves all ARM 32bit DMA-mapping/IOMMU dependant code from
exynos_drm_iommu.c to .h, to let it compile conditionally and prepare
for adding support for other architectures/IOMMU glue code (like ARM
64bit with IOMMU-DMA glue). Later, when ARM 32bit and 64bit will be
unified, this code can be removed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 39 +++++--------------------------
 drivers/gpu/drm/exynos/exynos_drm_iommu.h | 36 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index 0229bad43bd1..0f373702414e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -14,9 +14,6 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
-#include <linux/kref.h>
-
-#include <asm/dma-iommu.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_iommu.h"
@@ -45,33 +42,22 @@ static inline void clear_dma_max_seg_size(struct device *dev)
  */
 int drm_create_iommu_mapping(struct drm_device *drm_dev)
 {
-	struct dma_iommu_mapping *mapping = NULL;
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	mapping = arm_iommu_create_mapping(&platform_bus_type,
-			EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
-
-	if (IS_ERR(mapping))
-		return PTR_ERR(mapping);
-
-	priv->mapping = mapping;
-
-	return 0;
+	return __exynos_iommu_create_mapping(priv, EXYNOS_DEV_ADDR_START,
+					     EXYNOS_DEV_ADDR_SIZE);
 }
 
 /*
  * drm_release_iommu_mapping - release iommu mapping structure
  *
  * @drm_dev: DRM device
- *
- * if mapping->kref becomes 0 then all things related to iommu mapping
- * will be released
  */
 void drm_release_iommu_mapping(struct drm_device *drm_dev)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	arm_iommu_release_mapping(priv->mapping);
+	__exynos_iommu_release_mapping(priv);
 }
 
 /*
@@ -89,9 +75,6 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	int ret;
 
-	if (!priv->mapping)
-		return 0;
-
 	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
 		DRM_ERROR("Device %s lacks support for IOMMU\n",
 			  dev_name(subdrv_dev));
@@ -102,15 +85,9 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (ret)
 		return ret;
 
-	if (subdrv_dev->archdata.mapping)
-		arm_iommu_detach_device(subdrv_dev);
-
-	ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
-	if (ret < 0) {
-		DRM_DEBUG_KMS("failed iommu attach.\n");
+	ret = __exynos_iommu_attach(priv, subdrv_dev);
+	if (ret)
 		clear_dma_max_seg_size(subdrv_dev);
-		return ret;
-	}
 
 	return 0;
 }
@@ -128,11 +105,7 @@ void drm_iommu_detach_device(struct drm_device *drm_dev,
 				struct device *subdrv_dev)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
-	struct dma_iommu_mapping *mapping = priv->mapping;
-
-	if (!mapping || !mapping->domain)
-		return;
 
-	arm_iommu_detach_device(subdrv_dev);
+	__exynos_iommu_detach(priv, subdrv_dev);
 	clear_dma_max_seg_size(subdrv_dev);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.h b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
index 5ffebe02ee4d..22e1df2ac62e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
@@ -17,6 +17,42 @@
 
 #ifdef CONFIG_DRM_EXYNOS_IOMMU
 
+#if defined(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+
+static inline int __exynos_iommu_create_mapping(struct exynos_drm_private *priv,
+					unsigned long start, unsigned long size)
+{
+	priv->mapping = arm_iommu_create_mapping(&platform_bus_type, start,
+						 size);
+	return IS_ERR(priv->mapping);
+}
+
+static inline void
+__exynos_iommu_release_mapping(struct exynos_drm_private *priv)
+{
+	arm_iommu_release_mapping(priv->mapping);
+}
+
+static inline int __exynos_iommu_attach(struct exynos_drm_private *priv,
+					struct device *dev)
+{
+	if (dev->archdata.mapping)
+		arm_iommu_detach_device(dev);
+
+	return arm_iommu_attach_device(dev, priv->mapping);
+}
+
+static inline void __exynos_iommu_detach(struct exynos_drm_private *priv,
+					 struct device *dev)
+{
+	arm_iommu_detach_device(dev);
+}
+
+#else
+#error Unsupported architecture and IOMMU/DMA-mapping glue code
+#endif
+
 int drm_create_iommu_mapping(struct drm_device *drm_dev);
 
 void drm_release_iommu_mapping(struct drm_device *drm_dev);
-- 
1.9.1

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/5] drm/exynos: iommu: move dma_params configuration code
 to separate functions
Date: Fri, 17 Jun 2016 09:54:23 +0200
Message-ID: <1466150067-8065-2-git-send-email-m.szyprowski@samsung.com>
References: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61768 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755044AbcFQHyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 03:54:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8W0053GON4GA10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2016 08:54:40 +0100 (BST)
In-reply-to: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Move code for managing DMA max segment size parameter to separate
functions. This patch also replaces devm_kzalloc() with kzalloc() and
adds proper kfree call. devm_kzalloc() cannot be used for dma_params
structure, because it will be freed on driver remove not on device
release. This means in case of Exynos DRM being compiled as module and
loaded 2 times, a user-after-free issue will happen.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index 7ca09ee19656..1e82529e0c41 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -21,6 +21,23 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_iommu.h"
 
+static inline int configure_dma_max_seg_size(struct device *dev)
+{
+	if (!dev->dma_parms)
+		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
+	if (!dev->dma_parms)
+		return -ENOMEM;
+
+	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+	return 0;
+}
+
+static inline void clear_dma_max_seg_size(struct device *dev)
+{
+	kfree(dev->dma_parms);
+	dev->dma_parms = NULL;
+}
+
 /*
  * drm_create_iommu_mapping - create a mapping structure
  *
@@ -80,13 +97,10 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (!priv->mapping)
 		return 0;
 
-	subdrv_dev->dma_parms = devm_kzalloc(subdrv_dev,
-					sizeof(*subdrv_dev->dma_parms),
-					GFP_KERNEL);
-	if (!subdrv_dev->dma_parms)
-		return -ENOMEM;
 
-	dma_set_max_seg_size(subdrv_dev, 0xffffffffu);
+	ret = configure_dma_max_seg_size(subdrv_dev);
+	if (ret)
+		return ret;
 
 	if (subdrv_dev->archdata.mapping)
 		arm_iommu_detach_device(subdrv_dev);
@@ -94,6 +108,7 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 	ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
 	if (ret < 0) {
 		DRM_DEBUG_KMS("failed iommu attach.\n");
+		clear_dma_max_seg_size(subdrv_dev);
 		return ret;
 	}
 
@@ -119,4 +134,5 @@ void drm_iommu_detach_device(struct drm_device *drm_dev,
 		return;
 
 	arm_iommu_detach_device(subdrv_dev);
+	clear_dma_max_seg_size(subdrv_dev);
 }
-- 
1.9.1

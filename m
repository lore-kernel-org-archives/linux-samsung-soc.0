From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/5] drm/exynos: iommu: remove unused entries from
 exynos_drm_private strcuture
Date: Fri, 17 Jun 2016 09:54:25 +0200
Message-ID: <1466150067-8065-4-git-send-email-m.szyprowski@samsung.com>
References: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36842 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754013AbcFQHyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 03:54:44 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8W00C62ON53F00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2016 08:54:41 +0100 (BST)
In-reply-to: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch removes unused entries from exynos_drm_private strcuture.
da_start/da_space_size were only used in drm_create_iommu_mapping()
function and never set to other value than the defaults. Instead use
default values directly in arm_iommu_create_mapping() call.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   | 2 --
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 9 ++-------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index cc33ec9296e7..b39d521f093d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -224,8 +224,6 @@ struct exynos_drm_private {
 	struct drm_property *plane_zpos_property;
 
 	struct device *dma_dev;
-	unsigned long da_start;
-	unsigned long da_space_size;
 	void *mapping;
 
 	unsigned int pipe;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index 36dde9691274..0229bad43bd1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -48,13 +48,8 @@ int drm_create_iommu_mapping(struct drm_device *drm_dev)
 	struct dma_iommu_mapping *mapping = NULL;
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	if (!priv->da_start)
-		priv->da_start = EXYNOS_DEV_ADDR_START;
-	if (!priv->da_space_size)
-		priv->da_space_size = EXYNOS_DEV_ADDR_SIZE;
-
-	mapping = arm_iommu_create_mapping(&platform_bus_type, priv->da_start,
-						priv->da_space_size);
+	mapping = arm_iommu_create_mapping(&platform_bus_type,
+			EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 
 	if (IS_ERR(mapping))
 		return PTR_ERR(mapping);
-- 
1.9.1

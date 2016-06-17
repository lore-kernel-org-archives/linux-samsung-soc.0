From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/5] drm/exynos: iommu: add a check if all sub-devices have
 iommu controller
Date: Fri, 17 Jun 2016 09:54:24 +0200
Message-ID: <1466150067-8065-3-git-send-email-m.szyprowski@samsung.com>
References: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59119 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755253AbcFQHyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 03:54:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8W00KHVON5H900@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 Jun 2016 08:54:41 +0100 (BST)
In-reply-to: <1466150067-8065-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch adds a check if all devices belonging to Exynos DRM have the
same dma_map_ops set. This is required to enable operation with IOMMU
enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index 1e82529e0c41..36dde9691274 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -97,6 +97,11 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (!priv->mapping)
 		return 0;
 
+	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
+		DRM_ERROR("Device %s lacks support for IOMMU\n",
+			  dev_name(subdrv_dev));
+		return -EINVAL;
+	}
 
 	ret = configure_dma_max_seg_size(subdrv_dev);
 	if (ret)
-- 
1.9.1

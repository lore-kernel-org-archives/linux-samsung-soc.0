From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: IOMMU support should not be selectable by user
Date: Tue, 20 Jan 2015 15:31:14 +0100
Message-ID: <1421764274-26398-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44031 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbbATObW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 09:31:22 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIH005L4CIXLMA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jan 2015 14:35:21 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

If system provides IOMMU feature, Exynos DRM should use it by default,
because the Exynos DRM subdrivers don't work correctly when Exynos IOMMU
driver has been enabled and no IOMMU support has been compiled into Exynos
DRM driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 7f9f6f9e9b7e..39fe490efcd4 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -13,10 +13,9 @@ config DRM_EXYNOS
 	  If M is selected the module will be called exynosdrm.
 
 config DRM_EXYNOS_IOMMU
-	bool "EXYNOS DRM IOMMU Support"
+	bool
 	depends on DRM_EXYNOS && EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
-	help
-	  Choose this option if you want to use IOMMU feature for DRM.
+	default y
 
 config DRM_EXYNOS_DMABUF
 	bool "EXYNOS DRM DMABUF"
-- 
1.9.2

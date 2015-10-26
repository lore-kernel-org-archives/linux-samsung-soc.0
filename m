From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/7] drm/exynos: abstract out common dependency
Date: Mon, 26 Oct 2015 13:03:43 +0100
Message-ID: <1445861025-23266-6-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30629 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753588AbbJZMEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT0098ATIQAE20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:04:02 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

All options depends on DRM_EXYNOS so it can be moved to enclosing if clause.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index c0dc056..25351d0 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -11,14 +11,16 @@ config DRM_EXYNOS
 	  Choose this option if you have a Samsung SoC EXYNOS chipset.
 	  If M is selected the module will be called exynosdrm.
 
+if DRM_EXYNOS
+
 config DRM_EXYNOS_IOMMU
 	bool
-	depends on DRM_EXYNOS && EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
+	depends on EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
 	default y
 
 config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
-	depends on DRM_EXYNOS && !FB_S3C
+	depends on !FB_S3C
 	select FB_MODE_HELPERS
 	select MFD_SYSCON
 	help
@@ -26,20 +28,19 @@ config DRM_EXYNOS_FIMD
 
 config DRM_EXYNOS5433_DECON
 	bool "Exynos5433 DRM DECON"
-	depends on DRM_EXYNOS
 	help
 	  Choose this option if you want to use Exynos5433 DECON for DRM.
 
 config DRM_EXYNOS7_DECON
 	bool "Exynos7 DRM DECON"
-	depends on DRM_EXYNOS && !FB_S3C
+	depends on !FB_S3C
 	select FB_MODE_HELPERS
 	help
 	  Choose this option if you want to use Exynos DECON for DRM.
 
 config DRM_EXYNOS_DPI
 	bool "EXYNOS DRM parallel output support"
-	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON)
+	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	select DRM_PANEL
 	default n
 	help
@@ -47,7 +48,7 @@ config DRM_EXYNOS_DPI
 
 config DRM_EXYNOS_DSI
 	bool "EXYNOS DRM MIPI-DSI driver support"
-	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON)
+	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	default n
@@ -56,7 +57,7 @@ config DRM_EXYNOS_DSI
 
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON)
+	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
@@ -64,32 +65,30 @@ config DRM_EXYNOS_DP
 
 config DRM_EXYNOS_MIXER
 	bool "Exynos DRM Mixer"
-	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_TV
+	depends on !VIDEO_SAMSUNG_S5P_TV
 	help
 	  Choose this option if you want to use Exynos Mixer for DRM.
 
 config DRM_EXYNOS_HDMI
 	bool "Exynos DRM HDMI"
-	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_TV && (DRM_EXYNOS_MIXER || DRM_EXYNOS5433_DECON)
+	depends on !VIDEO_SAMSUNG_S5P_TV && (DRM_EXYNOS_MIXER || DRM_EXYNOS5433_DECON)
 	help
 	  Choose this option if you want to use Exynos HDMI for DRM.
 
 config DRM_EXYNOS_VIDI
 	bool "Exynos DRM Virtual Display"
-	depends on DRM_EXYNOS
 	help
 	  Choose this option if you want to use Exynos VIDI for DRM.
 
 config DRM_EXYNOS_G2D
 	bool "Exynos DRM G2D"
-	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_G2D
+	depends on !VIDEO_SAMSUNG_S5P_G2D
 	select FRAME_VECTOR
 	help
 	  Choose this option if you want to use Exynos G2D for DRM.
 
 config DRM_EXYNOS_IPP
 	bool "Exynos DRM IPP"
-	depends on DRM_EXYNOS
 	help
 	  Choose this option if you want to use IPP feature for DRM.
 
@@ -113,6 +112,8 @@ config DRM_EXYNOS_GSC
 
 config DRM_EXYNOS_MIC
 	bool "Exynos DRM MIC"
-	depends on (DRM_EXYNOS && DRM_EXYNOS5433_DECON)
+	depends on DRM_EXYNOS5433_DECON
 	help
 	  Choose this option if you want to use Exynos MIC for DRM.
+
+endif
-- 
1.9.1

From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/7] drm/exynos: simplify Kconfig component names
Date: Mon, 26 Oct 2015 13:03:45 +0100
Message-ID: <1445861025-23266-8-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30629 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753613AbbJZMEK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:10 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT0098JTISAL20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:04:04 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Many Exynos DRM sub-options mentions Exynos DRM in their titles.
It is redundant and can be safely shortened. The patch additionally
makes some entries more descriptive.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 86ff8ab..fbc28fa 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -21,7 +21,7 @@ config DRM_EXYNOS_IOMMU
 comment "CRTCs"
 
 config DRM_EXYNOS_FIMD
-	bool "Exynos DRM FIMD"
+	bool "FIMD"
 	depends on !FB_S3C
 	select FB_MODE_HELPERS
 	select MFD_SYSCON
@@ -29,32 +29,32 @@ config DRM_EXYNOS_FIMD
 	  Choose this option if you want to use Exynos FIMD for DRM.
 
 config DRM_EXYNOS5433_DECON
-	bool "Exynos5433 DRM DECON"
+	bool "DECON on Exynos5433"
 	help
 	  Choose this option if you want to use Exynos5433 DECON for DRM.
 
 config DRM_EXYNOS7_DECON
-	bool "Exynos7 DRM DECON"
+	bool "DECON on Exynos7"
 	depends on !FB_S3C
 	select FB_MODE_HELPERS
 	help
 	  Choose this option if you want to use Exynos DECON for DRM.
 
 config DRM_EXYNOS_MIXER
-	bool "Exynos DRM Mixer"
+	bool "Mixer"
 	depends on !VIDEO_SAMSUNG_S5P_TV
 	help
 	  Choose this option if you want to use Exynos Mixer for DRM.
 
 config DRM_EXYNOS_VIDI
-	bool "Exynos DRM Virtual Display"
+	bool "Virtual Display"
 	help
 	  Choose this option if you want to use Exynos VIDI for DRM.
 
 comment "Encoders and Bridges"
 
 config DRM_EXYNOS_DPI
-	bool "EXYNOS DRM parallel output support"
+	bool "Parallel output"
 	depends on DRM_EXYNOS_FIMD
 	select DRM_PANEL
 	default n
@@ -62,7 +62,7 @@ config DRM_EXYNOS_DPI
 	  This enables support for Exynos parallel output.
 
 config DRM_EXYNOS_DSI
-	bool "EXYNOS DRM MIPI-DSI driver support"
+	bool "MIPI-DSI host"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON
 	select DRM_MIPI_DSI
 	select DRM_PANEL
@@ -71,7 +71,7 @@ config DRM_EXYNOS_DSI
 	  This enables support for Exynos MIPI-DSI device.
 
 config DRM_EXYNOS_DP
-	bool "EXYNOS DRM DP driver support"
+	bool "Display Port"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	default DRM_EXYNOS
 	select DRM_PANEL
@@ -79,13 +79,13 @@ config DRM_EXYNOS_DP
 	  This enables support for DP device.
 
 config DRM_EXYNOS_HDMI
-	bool "Exynos DRM HDMI"
+	bool "HDMI"
 	depends on !VIDEO_SAMSUNG_S5P_TV && (DRM_EXYNOS_MIXER || DRM_EXYNOS5433_DECON)
 	help
 	  Choose this option if you want to use Exynos HDMI for DRM.
 
 config DRM_EXYNOS_MIC
-	bool "Exynos DRM MIC"
+	bool "Mobile Image Compressor"
 	depends on DRM_EXYNOS5433_DECON
 	help
 	  Choose this option if you want to use Exynos MIC for DRM.
@@ -93,31 +93,31 @@ config DRM_EXYNOS_MIC
 comment "Sub-drivers"
 
 config DRM_EXYNOS_G2D
-	bool "Exynos DRM G2D"
+	bool "G2D"
 	depends on !VIDEO_SAMSUNG_S5P_G2D
 	select FRAME_VECTOR
 	help
 	  Choose this option if you want to use Exynos G2D for DRM.
 
 config DRM_EXYNOS_IPP
-	bool "Exynos DRM IPP"
+	bool "Image Post Processor"
 	help
 	  Choose this option if you want to use IPP feature for DRM.
 
 config DRM_EXYNOS_FIMC
-	bool "Exynos DRM FIMC"
+	bool "FIMC"
 	depends on DRM_EXYNOS_IPP && MFD_SYSCON
 	help
 	  Choose this option if you want to use Exynos FIMC for DRM.
 
 config DRM_EXYNOS_ROTATOR
-	bool "Exynos DRM Rotator"
+	bool "Rotator"
 	depends on DRM_EXYNOS_IPP
 	help
 	  Choose this option if you want to use Exynos Rotator for DRM.
 
 config DRM_EXYNOS_GSC
-	bool "Exynos DRM GSC"
+	bool "GScaler"
 	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !ARCH_MULTIPLATFORM
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
-- 
1.9.1

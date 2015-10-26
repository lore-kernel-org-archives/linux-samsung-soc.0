From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/7] drm/exynos: re-arrange Kconfig entries
Date: Mon, 26 Oct 2015 13:03:44 +0100
Message-ID: <1445861025-23266-7-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48912 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753588AbbJZMEF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:05 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT0009NTISML20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:04:04 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Exynos DRM driver have quite big number of components and options.
The patch re-arranges them into three logical groups:
- CRTCs,
- Encoders and Bridges,
- Sub-drivers.
It should make driver options more clear.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 25351d0..86ff8ab 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -18,6 +18,8 @@ config DRM_EXYNOS_IOMMU
 	depends on EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
 	default y
 
+comment "CRTCs"
+
 config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
 	depends on !FB_S3C
@@ -38,9 +40,22 @@ config DRM_EXYNOS7_DECON
 	help
 	  Choose this option if you want to use Exynos DECON for DRM.
 
+config DRM_EXYNOS_MIXER
+	bool "Exynos DRM Mixer"
+	depends on !VIDEO_SAMSUNG_S5P_TV
+	help
+	  Choose this option if you want to use Exynos Mixer for DRM.
+
+config DRM_EXYNOS_VIDI
+	bool "Exynos DRM Virtual Display"
+	help
+	  Choose this option if you want to use Exynos VIDI for DRM.
+
+comment "Encoders and Bridges"
+
 config DRM_EXYNOS_DPI
 	bool "EXYNOS DRM parallel output support"
-	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
+	depends on DRM_EXYNOS_FIMD
 	select DRM_PANEL
 	default n
 	help
@@ -63,22 +78,19 @@ config DRM_EXYNOS_DP
 	help
 	  This enables support for DP device.
 
-config DRM_EXYNOS_MIXER
-	bool "Exynos DRM Mixer"
-	depends on !VIDEO_SAMSUNG_S5P_TV
-	help
-	  Choose this option if you want to use Exynos Mixer for DRM.
-
 config DRM_EXYNOS_HDMI
 	bool "Exynos DRM HDMI"
 	depends on !VIDEO_SAMSUNG_S5P_TV && (DRM_EXYNOS_MIXER || DRM_EXYNOS5433_DECON)
 	help
 	  Choose this option if you want to use Exynos HDMI for DRM.
 
-config DRM_EXYNOS_VIDI
-	bool "Exynos DRM Virtual Display"
+config DRM_EXYNOS_MIC
+	bool "Exynos DRM MIC"
+	depends on DRM_EXYNOS5433_DECON
 	help
-	  Choose this option if you want to use Exynos VIDI for DRM.
+	  Choose this option if you want to use Exynos MIC for DRM.
+
+comment "Sub-drivers"
 
 config DRM_EXYNOS_G2D
 	bool "Exynos DRM G2D"
@@ -110,10 +122,4 @@ config DRM_EXYNOS_GSC
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
 
-config DRM_EXYNOS_MIC
-	bool "Exynos DRM MIC"
-	depends on DRM_EXYNOS5433_DECON
-	help
-	  Choose this option if you want to use Exynos MIC for DRM.
-
 endif
-- 
1.9.1

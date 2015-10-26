From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/7] drm/exynos: separate Mixer and HDMI drivers
Date: Mon, 26 Oct 2015 13:03:42 +0100
Message-ID: <1445861025-23266-5-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30629 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753517AbbJZMEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:08 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT0098MTIPJK20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:04:01 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Latest Exynos SoCs does not have Mixer IP, but they still have HDMI IP.
Their drivers should be configurable separately.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig          | 8 +++++++-
 drivers/gpu/drm/exynos/Makefile         | 3 ++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 16cb1f7..c0dc056 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -62,9 +62,15 @@ config DRM_EXYNOS_DP
 	help
 	  This enables support for DP device.
 
+config DRM_EXYNOS_MIXER
+	bool "Exynos DRM Mixer"
+	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_TV
+	help
+	  Choose this option if you want to use Exynos Mixer for DRM.
+
 config DRM_EXYNOS_HDMI
 	bool "Exynos DRM HDMI"
-	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_TV
+	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_TV && (DRM_EXYNOS_MIXER || DRM_EXYNOS5433_DECON)
 	help
 	  Choose this option if you want to use Exynos HDMI for DRM.
 
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 02aecfe..6496532 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -14,7 +14,8 @@ exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o exynos_dp_reg.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o exynos_mixer.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_MIXER)	+= exynos_mixer.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_G2D)	+= exynos_drm_g2d.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_IPP)	+= exynos_drm_ipp.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 0a05117..ba4de7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -531,8 +531,10 @@ static struct platform_driver *const exynos_drm_kms_drivers[] = {
 #ifdef CONFIG_DRM_EXYNOS_DSI
 	&dsi_driver,
 #endif
-#ifdef CONFIG_DRM_EXYNOS_HDMI
+#ifdef CONFIG_DRM_EXYNOS_MIXER
 	&mixer_driver,
+#endif
+#ifdef CONFIG_DRM_EXYNOS_HDMI
 	&hdmi_driver,
 #endif
 #ifdef CONFIG_DRM_EXYNOS_VIDI
-- 
1.9.1

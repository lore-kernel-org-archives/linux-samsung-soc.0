From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/3] drm/exynos: fix typos in hdmi and mixer
Date: Wed,  1 Apr 2015 15:29:01 +0200
Message-ID: <1427894943-9010-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:36807 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753324AbbDAN3O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 09:29:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo@padovan.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Use the correct spelling for 'progressive'.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
 drivers/gpu/drm/exynos/regs-mixer.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 3511fcc..20e2ce7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2022,7 +2022,7 @@ static void hdmi_mode_set(struct exynos_drm_display *display,
 	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%s\n",
 		m->hdisplay, m->vdisplay,
 		m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
-		"INTERLACED" : "PROGERESSIVE");
+		"INTERLACED" : "PROGRESSIVE");
 
 	/* preserve mode information for later use. */
 	drm_mode_copy(&hdata->current_mode, mode);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index aa5b6e1..5ab0e32 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -267,7 +267,7 @@ static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
 
 	/* choosing between interlace and progressive mode */
 	val = (ctx->interlace ? MXR_CFG_SCAN_INTERLACE :
-				MXR_CFG_SCAN_PROGRASSIVE);
+				MXR_CFG_SCAN_PROGRESSIVE);
 
 	if (ctx->mxr_ver != MXR_VER_128_0_0_184) {
 		/* choosing between proper HD and SD mode */
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index 5f32e1a..ac60260 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -101,7 +101,7 @@
 #define MXR_CFG_GRP0_ENABLE		(1 << 4)
 #define MXR_CFG_VP_ENABLE		(1 << 3)
 #define MXR_CFG_SCAN_INTERLACE		(0 << 2)
-#define MXR_CFG_SCAN_PROGRASSIVE	(1 << 2)
+#define MXR_CFG_SCAN_PROGRESSIVE	(1 << 2)
 #define MXR_CFG_SCAN_NTSC		(0 << 1)
 #define MXR_CFG_SCAN_PAL		(1 << 1)
 #define MXR_CFG_SCAN_SD			(0 << 0)
-- 
2.0.5

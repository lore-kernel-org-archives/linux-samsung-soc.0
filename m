From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 08/10] drm/exynos/mixer: pass actual mode on MIXER to
 encoder
Date: Wed, 06 Sep 2017 12:36:58 +0200
Message-ID: <1504694220-15818-9-git-send-email-a.hajda@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103731eucas1p2a9e4a72215d719fcb0b98096de7bd86f@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51609 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753084AbdIFKhe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 06:37:34 -0400
In-reply-to: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

MIXER in SoCs prior to Exynos5420 supports only 4 video modes:
720x480, 720x576, 1280x720, 1920x1080. Support for other modes can be
enabled by manipulating timings of HDMI. To allow it MIXER must pass
actual video mode to HDMI, the proper way to do it is to modify
adjusted_mode property in crtc::mode_fixup callback. Adding such callback
allows also to simplify mixer_cfg_scan code - choosing mode is performed
already in crtc::mode_fixup. mode_fixup is also better place to check
interlace flag.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 70 +++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index f6ea9d9..5aae82b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -115,6 +115,7 @@ struct mixer_context {
 	struct clk		*sclk_hdmi;
 	struct clk		*mout_mixer;
 	enum mixer_version_id	mxr_ver;
+	int			scan_value;
 };
 
 struct mixer_drv_data {
@@ -367,23 +368,11 @@ static void mixer_cfg_scan(struct mixer_context *ctx, int width, int height)
 	val = test_bit(MXR_BIT_INTERLACE, &ctx->flags) ?
 		MXR_CFG_SCAN_INTERLACE : MXR_CFG_SCAN_PROGRESSIVE;
 
-	/* setup display size */
-	if (ctx->mxr_ver == MXR_VER_128_0_0_184) {
+	if (ctx->mxr_ver == MXR_VER_128_0_0_184)
 		mixer_reg_write(ctx, MXR_RESOLUTION,
 			MXR_MXR_RES_HEIGHT(height) | MXR_MXR_RES_WIDTH(width));
-	} else {
-		/* choosing between proper HD and SD mode */
-		if (height <= 480)
-			val |= MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
-		else if (height <= 576)
-			val |= MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD;
-		else if (height <= 720)
-			val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
-		else if (height <= 1080)
-			val |= MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD;
-		else
-			val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
-	}
+	else
+		val |= ctx->scan_value;
 
 	mixer_reg_writemask(ctx, MXR_CFG, val, MXR_CFG_SCAN_MASK);
 }
@@ -467,11 +456,6 @@ static void mixer_commit(struct mixer_context *ctx)
 {
 	struct drm_display_mode *mode = &ctx->crtc->base.state->adjusted_mode;
 
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
-	else
-		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
-
 	mixer_cfg_scan(ctx, mode->hdisplay, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
 	mixer_run(ctx);
@@ -1033,6 +1017,51 @@ static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
 	return MODE_BAD;
 }
 
+static bool mixer_mode_fixup(struct exynos_drm_crtc *crtc,
+		   const struct drm_display_mode *mode,
+		   struct drm_display_mode *adjusted_mode)
+{
+	struct mixer_context *ctx = crtc->ctx;
+	int width = mode->hdisplay, height = mode->vdisplay, i;
+
+	struct {
+		int hdisplay, vdisplay, htotal, vtotal, scan_val;
+	} static const modes[] = {
+		{ 720, 480, 858, 525, MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD },
+		{ 720, 576, 864, 625, MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD },
+		{ 1280, 720, 1650, 750, MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD },
+		{ 1920, 1080, 2200, 1125, MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD }
+	};
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
+	else
+		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
+
+	if (ctx->mxr_ver == MXR_VER_128_0_0_184)
+		return true;
+
+	for (i = 0; i < ARRAY_SIZE(modes); ++i)
+		if (width <= modes[i].hdisplay && height <= modes[i].vdisplay) {
+			ctx->scan_value = modes[i].scan_val;
+			if (width < modes[i].hdisplay ||
+			    height < modes[i].vdisplay) {
+				adjusted_mode->hdisplay = modes[i].hdisplay;
+				adjusted_mode->hsync_start = modes[i].hdisplay;
+				adjusted_mode->hsync_end = modes[i].htotal;
+				adjusted_mode->htotal = modes[i].htotal;
+				adjusted_mode->vdisplay = modes[i].vdisplay;
+				adjusted_mode->vsync_start = modes[i].vdisplay;
+				adjusted_mode->vsync_end = modes[i].vtotal;
+				adjusted_mode->vtotal = modes[i].vtotal;
+			}
+
+			return true;
+		}
+
+	return false;
+}
+
 static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.enable			= mixer_enable,
 	.disable		= mixer_disable,
@@ -1043,6 +1072,7 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.disable_plane		= mixer_disable_plane,
 	.atomic_flush		= mixer_atomic_flush,
 	.mode_valid		= mixer_mode_valid,
+	.mode_fixup		= mixer_mode_fixup,
 };
 
 static const struct mixer_drv_data exynos5420_mxr_drv_data = {
-- 
2.7.4

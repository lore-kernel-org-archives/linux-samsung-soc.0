From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 3/7] drm/exynos: mixer: set window priority based on zpos
Date: Wed, 16 Dec 2015 13:21:44 +0100
Message-ID: <1450268508-15028-4-git-send-email-m.szyprowski@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:61908 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413AbbLPMWQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 07:22:16 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZG00FRVAD14480@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2015 12:22:13 +0000 (GMT)
In-reply-to: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

'zpos' plane property is configurable, so adjust hardware layers
priority based on the zpos value. 'zpos' value shifted by one can be
used directly as hw priority value and stored to the registers, because
mixer accepts priority values from 1 to 15 (0 means that layer is
disabled).

This patch also changes the default layer priority to match already
exposed initial zpos values. The initial configuration is now:
[top] video > gfx layer1 > gfx layer0 [bottom].

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 39 +++++++++++++++++++----------------
 drivers/gpu/drm/exynos/regs-mixer.h   |  3 +++
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 0dceeb2b532c..c0d128bc084b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -117,19 +117,22 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.pixel_formats = mixer_formats,
 		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
-		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE,
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE |
+				EXYNOS_DRM_PLANE_CAP_ZPOS,
 	}, {
 		.zpos = 1,
 		.type = DRM_PLANE_TYPE_CURSOR,
 		.pixel_formats = mixer_formats,
 		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
-		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE,
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE |
+				EXYNOS_DRM_PLANE_CAP_ZPOS,
 	}, {
 		.zpos = 2,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.pixel_formats = vp_formats,
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
-		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE,
+		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE |
+				EXYNOS_DRM_PLANE_CAP_ZPOS,
 	},
 };
 
@@ -372,7 +375,7 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
 }
 
 static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
-				bool enable)
+			    unsigned int priority, bool enable)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
 	u32 val = enable ? ~0 : 0;
@@ -380,15 +383,24 @@ static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
 	switch (win) {
 	case 0:
 		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP0_ENABLE);
+		mixer_reg_writemask(res, MXR_LAYER_CFG,
+				    MXR_LAYER_CFG_GRP0_VAL(priority),
+				    MXR_LAYER_CFG_GRP0_MASK);
 		break;
 	case 1:
 		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP1_ENABLE);
+		mixer_reg_writemask(res, MXR_LAYER_CFG,
+				    MXR_LAYER_CFG_GRP1_VAL(priority),
+				    MXR_LAYER_CFG_GRP1_MASK);
 		break;
 	case 2:
 		if (ctx->vp_enabled) {
 			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
 			mixer_reg_writemask(res, MXR_CFG, val,
 				MXR_CFG_VP_ENABLE);
+			mixer_reg_writemask(res, MXR_LAYER_CFG,
+					    MXR_LAYER_CFG_VP_VAL(priority),
+					    MXR_LAYER_CFG_VP_MASK);
 
 			/* control blending of graphic layer 0 */
 			mixer_reg_writemask(res, MXR_GRAPHIC_CFG(0), val,
@@ -511,7 +523,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, plane->index, true);
+	mixer_cfg_layer(ctx, plane->index, state->zpos + 1, true);
 	mixer_run(ctx);
 
 	mixer_vsync_set_update(ctx, true);
@@ -626,7 +638,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, win, true);
+	mixer_cfg_layer(ctx, win, state->zpos + 1, true);
 
 	/* layer update mandatory for mixer 16.0.33.0 */
 	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
@@ -674,17 +686,8 @@ static void mixer_win_reset(struct mixer_context *ctx)
 	mixer_reg_writemask(res, MXR_STATUS, MXR_STATUS_16_BURST,
 		MXR_STATUS_BURST_MASK);
 
-	/* setting default layer priority: layer1 > layer0 > video
-	 * because typical usage scenario would be
-	 * layer1 - OSD
-	 * layer0 - framebuffer
-	 * video - video overlay
-	 */
-	val = MXR_LAYER_CFG_GRP1_VAL(3);
-	val |= MXR_LAYER_CFG_GRP0_VAL(2);
-	if (ctx->vp_enabled)
-		val |= MXR_LAYER_CFG_VP_VAL(1);
-	mixer_reg_write(res, MXR_LAYER_CFG, val);
+	/* reset default layer priority */
+	mixer_reg_write(res, MXR_LAYER_CFG, 0);
 
 	/* setting background color */
 	mixer_reg_write(res, MXR_BG_COLOR0, 0x008080);
@@ -982,7 +985,7 @@ static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
 	spin_lock_irqsave(&res->reg_slock, flags);
 	mixer_vsync_set_update(mixer_ctx, false);
 
-	mixer_cfg_layer(mixer_ctx, plane->index, false);
+	mixer_cfg_layer(mixer_ctx, plane->index, 0, false);
 
 	mixer_vsync_set_update(mixer_ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index ac60260c2389..dbdbc0af3358 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -145,8 +145,11 @@
 
 /* bit for MXR_LAYER_CFG */
 #define MXR_LAYER_CFG_GRP1_VAL(x)	MXR_MASK_VAL(x, 11, 8)
+#define MXR_LAYER_CFG_GRP1_MASK		MXR_LAYER_CFG_GRP1_VAL(~0)
 #define MXR_LAYER_CFG_GRP0_VAL(x)	MXR_MASK_VAL(x, 7, 4)
+#define MXR_LAYER_CFG_GRP0_MASK		MXR_LAYER_CFG_GRP0_VAL(~0)
 #define MXR_LAYER_CFG_VP_VAL(x)		MXR_MASK_VAL(x, 3, 0)
+#define MXR_LAYER_CFG_VP_MASK		MXR_LAYER_CFG_VP_VAL(~0)
 
 #endif /* SAMSUNG_REGS_MIXER_H */
 
-- 
1.9.2

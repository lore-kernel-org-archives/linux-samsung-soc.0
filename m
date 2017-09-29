From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 01/11] drm/exynos/mixer: abstract out output mode setup
 code
Date: Fri, 29 Sep 2017 12:05:32 +0200
Message-ID: <20170929100542.12849-2-a.hajda@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
        <CGME20170929100546eucas1p2c06bf97d6961259c617b1e6d3a63f081@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42633 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbdI2KFt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 06:05:49 -0400
In-reply-to: <20170929100542.12849-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Mode setup code is called from video plane update and mixer plane update.
Let's group it together in mixer_commit function like in case of other
Exynos CRTCs.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 002755415e00..499ebdca4fed 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -473,6 +473,22 @@ static void mixer_stop(struct mixer_context *ctx)
 		usleep_range(10000, 12000);
 }
 
+static void mixer_commit(struct mixer_context *ctx)
+{
+	struct drm_display_mode *mode = &ctx->crtc->base.state->adjusted_mode;
+
+	/* setup display size */
+	if (ctx->mxr_ver == MXR_VER_128_0_0_184) {
+		u32 val  = MXR_MXR_RES_HEIGHT(mode->vdisplay)
+			 | MXR_MXR_RES_WIDTH(mode->hdisplay);
+		mixer_reg_write(&ctx->mixer_res, MXR_RESOLUTION, val);
+	}
+
+	mixer_cfg_scan(ctx, mode->vdisplay);
+	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
+	mixer_run(ctx);
+}
+
 static void vp_video_buffer(struct mixer_context *ctx,
 			    struct exynos_drm_plane *plane)
 {
@@ -553,11 +569,9 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
 	vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);
 
-	mixer_cfg_scan(ctx, mode->vdisplay);
-	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
 	mixer_cfg_layer(ctx, plane->index, priority, true);
 	mixer_cfg_vp_blend(ctx);
-	mixer_run(ctx);
+	mixer_commit(ctx);
 
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 
@@ -638,14 +652,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win),
 			fb->pitches[0] / fb->format->cpp[0]);
 
-	/* setup display size */
-	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
-		win == DEFAULT_WIN) {
-		val  = MXR_MXR_RES_HEIGHT(mode->vdisplay);
-		val |= MXR_MXR_RES_WIDTH(mode->hdisplay);
-		mixer_reg_write(res, MXR_RESOLUTION, val);
-	}
-
 	val  = MXR_GRP_WH_WIDTH(state->src.w);
 	val |= MXR_GRP_WH_HEIGHT(state->src.h);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
@@ -660,18 +666,15 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	/* set buffer address to mixer */
 	mixer_reg_write(res, MXR_GRAPHIC_BASE(win), dma_addr);
 
-	mixer_cfg_scan(ctx, mode->vdisplay);
-	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
 	mixer_cfg_layer(ctx, win, priority, true);
 	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->format->format));
+	mixer_commit(ctx);
 
 	/* layer update mandatory for mixer 16.0.33.0 */
 	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
 		ctx->mxr_ver == MXR_VER_128_0_0_184)
 		mixer_layer_update(ctx);
 
-	mixer_run(ctx);
-
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 
 	mixer_regs_dump(ctx);
-- 
2.14.1

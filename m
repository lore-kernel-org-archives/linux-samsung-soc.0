From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 02/10] drm/exynos/mixer: move mode commit to enable callback
Date: Wed, 06 Sep 2017 12:36:52 +0200
Message-ID: <1504694220-15818-3-git-send-email-a.hajda@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103728eucas1p24e0495f4f1a7534df3d649b0a9c8aff0@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35931 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753076AbdIFKhb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 06:37:31 -0400
In-reply-to: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Mode commit should not be called for every plane separately. It is enough
to call it once in enable callback. The change requires also that
interlace check should be moved to mixer_commit. It should be done in
the same patch to avoid regression.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 499ebdc..ae89e53 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -477,6 +477,11 @@ static void mixer_commit(struct mixer_context *ctx)
 {
 	struct drm_display_mode *mode = &ctx->crtc->base.state->adjusted_mode;
 
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
+	else
+		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
+
 	/* setup display size */
 	if (ctx->mxr_ver == MXR_VER_128_0_0_184) {
 		u32 val  = MXR_MXR_RES_HEIGHT(mode->vdisplay)
@@ -494,7 +499,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
 {
 	struct exynos_drm_plane_state *state =
 				to_exynos_plane_state(plane->base.state);
-	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
 	unsigned int priority = state->base.normalized_zpos + 1;
@@ -509,8 +513,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	luma_addr[0] = exynos_drm_fb_dma_addr(fb, 0);
 	chroma_addr[0] = exynos_drm_fb_dma_addr(fb, 1);
 
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
+	if (test_bit(MXR_BIT_INTERLACE, &ctx->flags)) {
 		if (is_tiled) {
 			luma_addr[1] = luma_addr[0] + 0x40;
 			chroma_addr[1] = chroma_addr[0] + 0x40;
@@ -519,7 +522,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
 			chroma_addr[1] = chroma_addr[0] + fb->pitches[0];
 		}
 	} else {
-		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
 		luma_addr[1] = 0;
 		chroma_addr[1] = 0;
 	}
@@ -571,7 +573,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_layer(ctx, plane->index, priority, true);
 	mixer_cfg_vp_blend(ctx);
-	mixer_commit(ctx);
 
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 
@@ -591,7 +592,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 {
 	struct exynos_drm_plane_state *state =
 				to_exynos_plane_state(plane->base.state);
-	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
 	unsigned int priority = state->base.normalized_zpos + 1;
@@ -637,11 +637,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 		+ (state->src.x * fb->format->cpp[0])
 		+ (state->src.y * fb->pitches[0]);
 
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
-	else
-		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
-
 	spin_lock_irqsave(&res->reg_slock, flags);
 
 	/* setup format */
@@ -668,7 +663,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_layer(ctx, win, priority, true);
 	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->format->format));
-	mixer_commit(ctx);
 
 	/* layer update mandatory for mixer 16.0.33.0 */
 	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
@@ -1021,6 +1015,8 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 	}
 	mixer_win_reset(ctx);
 
+	mixer_commit(ctx);
+
 	mixer_vsync_set_update(ctx, true);
 
 	set_bit(MXR_BIT_POWERED, &ctx->flags);
-- 
2.7.4

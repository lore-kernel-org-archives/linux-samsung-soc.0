From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/7] drm/exynos: rename zpos to index
Date: Wed, 16 Dec 2015 13:21:42 +0100
Message-ID: <1450268508-15028-2-git-send-email-m.szyprowski@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65483 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932551AbbLPMWP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 07:22:15 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZG00IRDAD1I280@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2015 12:22:13 +0000 (GMT)
In-reply-to: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

This patch renames zpos entry to index, because in most places it is
used as index for selecting hardware layer/window instead of
configurable layer position. This will later enable to make the zpos
property configurable.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         | 14 +++++++-------
 8 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index c7362b99ce28..88d022ad5280 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -256,7 +256,7 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	decon_shadow_protect_win(ctx, plane->zpos, true);
+	decon_shadow_protect_win(ctx, plane->index, true);
 }
 
 #define BIT_VAL(x, e, s) (((x) & ((1 << ((e) - (s) + 1)) - 1)) << (s))
@@ -270,7 +270,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 				to_exynos_plane_state(plane->base.state);
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_framebuffer *fb = state->base.fb;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 	unsigned int bpp = fb->bits_per_pixel >> 3;
 	unsigned int pitch = fb->pitches[0];
 	dma_addr_t dma_addr = exynos_drm_fb_dma_addr(fb, 0);
@@ -320,7 +320,7 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 				struct exynos_drm_plane *plane)
 {
 	struct decon_context *ctx = crtc->ctx;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
@@ -344,7 +344,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	decon_shadow_protect_win(ctx, plane->zpos, false);
+	decon_shadow_protect_win(ctx, plane->index, false);
 
 	if (ctx->out_type == IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
@@ -502,7 +502,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[win].zpos = win;
 		ctx->configs[win].type = decon_win_types[tmp];
 
-		ret = exynos_plane_init(drm_dev, &ctx->planes[win],
+		ret = exynos_plane_init(drm_dev, &ctx->planes[win], i,
 					1 << ctx->pipe, &ctx->configs[win]);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index c47f9af8170b..8911f965b06c 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -393,7 +393,7 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	decon_shadow_protect_win(ctx, plane->zpos, true);
+	decon_shadow_protect_win(ctx, plane->index, true);
 }
 
 static void decon_update_plane(struct exynos_drm_crtc *crtc,
@@ -407,7 +407,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned long val, alpha;
 	unsigned int last_x;
 	unsigned int last_y;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 	unsigned int bpp = fb->bits_per_pixel >> 3;
 	unsigned int pitch = fb->pitches[0];
 
@@ -498,7 +498,7 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 				struct exynos_drm_plane *plane)
 {
 	struct decon_context *ctx = crtc->ctx;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 	u32 val;
 
 	if (ctx->suspended)
@@ -525,7 +525,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	decon_shadow_protect_win(ctx, plane->zpos, false);
+	decon_shadow_protect_win(ctx, plane->index, false);
 }
 
 static void decon_init(struct decon_context *ctx)
@@ -657,7 +657,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[i].zpos = i;
 		ctx->configs[i].type = decon_win_types[i];
 
-		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
 					1 << ctx->pipe, &ctx->configs[i]);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 82bbd7f4b316..588b6763f9c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -76,7 +76,7 @@ to_exynos_plane_state(struct drm_plane_state *state)
  * Exynos drm common overlay structure.
  *
  * @base: plane object
- * @zpos: order of overlay layer(z position).
+ * @index: hardware index of the overlay layer
  *
  * this structure is common to exynos SoC and its contents would be copied
  * to hardware specific overlay info.
@@ -85,7 +85,7 @@ to_exynos_plane_state(struct drm_plane_state *state)
 struct exynos_drm_plane {
 	struct drm_plane base;
 	const struct exynos_drm_plane_config *config;
-	unsigned int zpos;
+	unsigned int index;
 	struct drm_framebuffer *pending_fb;
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2e2247126581..6ae1b1e55783 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -630,7 +630,7 @@ static void fimd_atomic_begin(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	fimd_shadow_protect_win(ctx, plane->zpos, true);
+	fimd_shadow_protect_win(ctx, plane->index, true);
 }
 
 static void fimd_atomic_flush(struct exynos_drm_crtc *crtc,
@@ -641,7 +641,7 @@ static void fimd_atomic_flush(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	fimd_shadow_protect_win(ctx, plane->zpos, false);
+	fimd_shadow_protect_win(ctx, plane->index, false);
 }
 
 static void fimd_update_plane(struct exynos_drm_crtc *crtc,
@@ -654,7 +654,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 	unsigned int bpp = fb->bits_per_pixel >> 3;
 	unsigned int pitch = fb->pitches[0];
 
@@ -740,7 +740,7 @@ static void fimd_disable_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 
 	if (ctx->suspended)
 		return;
@@ -944,7 +944,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
 		ctx->configs[i].zpos = i;
 		ctx->configs[i].type = fimd_win_types[i];
-		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
 					1 << ctx->pipe, &ctx->configs[i]);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 427aeec78a28..fd6cb4cee01a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -280,7 +280,7 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs,
+		      unsigned int index, unsigned long possible_crtcs,
 		      const struct exynos_drm_plane_config *config)
 {
 	int err;
@@ -299,7 +299,7 @@ int exynos_plane_init(struct drm_device *dev,
 
 	drm_plane_helper_add(&exynos_plane->base, &plane_helper_funcs);
 
-	exynos_plane->zpos = config->zpos;
+	exynos_plane->index = index;
 	exynos_plane->config = config;
 
 	if (config->type == DRM_PLANE_TYPE_OVERLAY)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 0dd096548284..9aafad164cdf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -10,6 +10,6 @@
  */
 
 int exynos_plane_init(struct drm_device *dev,
-		      struct exynos_drm_plane *exynos_plane,
+		      struct exynos_drm_plane *exynos_plane, unsigned int index,
 		      unsigned long possible_crtcs,
 		      const struct exynos_drm_plane_config *config);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index c1d33d5cbb15..adad4dc84b81 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -461,7 +461,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		plane_config.zpos = i;
 		plane_config.type = vidi_win_types[i];
 
-		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
 					1 << ctx->pipe, &plane_config);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index dfb35e2da4db..0dceeb2b532c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -511,7 +511,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, plane->zpos, true);
+	mixer_cfg_layer(ctx, plane->index, true);
 	mixer_run(ctx);
 
 	mixer_vsync_set_update(ctx, true);
@@ -537,7 +537,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
 	unsigned long flags;
-	unsigned int win = plane->zpos;
+	unsigned int win = plane->index;
 	unsigned int x_ratio = 0, y_ratio = 0;
 	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
@@ -956,12 +956,12 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc,
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
 
-	DRM_DEBUG_KMS("win: %d\n", plane->zpos);
+	DRM_DEBUG_KMS("win: %d\n", plane->index);
 
 	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
 		return;
 
-	if (plane->zpos > 1 && mixer_ctx->vp_enabled)
+	if (plane->index > 1 && mixer_ctx->vp_enabled)
 		vp_video_buffer(mixer_ctx, plane);
 	else
 		mixer_graph_buffer(mixer_ctx, plane);
@@ -974,7 +974,7 @@ static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
 	unsigned long flags;
 
-	DRM_DEBUG_KMS("win: %d\n", plane->zpos);
+	DRM_DEBUG_KMS("win: %d\n", plane->index);
 
 	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
 		return;
@@ -982,7 +982,7 @@ static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
 	spin_lock_irqsave(&res->reg_slock, flags);
 	mixer_vsync_set_update(mixer_ctx, false);
 
-	mixer_cfg_layer(mixer_ctx, plane->zpos, false);
+	mixer_cfg_layer(mixer_ctx, plane->index, false);
 
 	mixer_vsync_set_update(mixer_ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
@@ -1160,7 +1160,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 		if (i == VP_DEFAULT_WIN && !ctx->vp_enabled)
 			continue;
 
-		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
 					1 << ctx->pipe, &plane_configs[i]);
 		if (ret)
 			return ret;
-- 
1.9.2

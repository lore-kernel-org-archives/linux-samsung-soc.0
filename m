From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 2/3] drm/exynos: use generic code for managing zpos plane
 property
Date: Tue, 12 Jan 2016 14:39:19 +0100
Message-ID: <1452605960-21194-3-git-send-email-m.szyprowski@samsung.com>
References: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41052 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762280AbcALNj4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2016 08:39:56 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0U00343DYICE10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2016 13:39:54 +0000 (GMT)
In-reply-to: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

This patch replaces zpos property handling custom code in Exynos DRM
driver with calls to generic DRM code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 66 +++++++------------------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  6 ++-
 3 files changed, 18 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 17b5ded72ff1..816537886e4e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -64,7 +64,6 @@ struct exynos_drm_plane_state {
 	struct exynos_drm_rect src;
 	unsigned int h_ratio;
 	unsigned int v_ratio;
-	unsigned int zpos;
 };
 
 static inline struct exynos_drm_plane_state *
@@ -217,7 +216,6 @@ struct exynos_drm_private {
 	 * this array is used to be aware of which crtc did it request vblank.
 	 */
 	struct drm_crtc *crtc[MAX_CRTC];
-	struct drm_property *plane_zpos_property;
 
 	unsigned long da_start;
 	unsigned long da_space_size;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index d86227236f55..a434d3a6bb90 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -137,9 +137,9 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 
 	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
 	if (exynos_state) {
-		exynos_state->zpos = exynos_plane->config->zpos;
 		plane->state = &exynos_state->base;
 		plane->state->plane = plane;
+		plane->state->zpos = exynos_plane->config->zpos;
 	}
 }
 
@@ -155,7 +155,6 @@ exynos_drm_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
-	copy->zpos = exynos_state->zpos;
 	return &copy->base;
 }
 
@@ -168,43 +167,6 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
 	kfree(old_exynos_state);
 }
 
-static int exynos_drm_plane_atomic_set_property(struct drm_plane *plane,
-						struct drm_plane_state *state,
-						struct drm_property *property,
-						uint64_t val)
-{
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_plane_state *exynos_state =
-					to_exynos_plane_state(state);
-	struct exynos_drm_private *dev_priv = plane->dev->dev_private;
-	const struct exynos_drm_plane_config *config = exynos_plane->config;
-
-	if (property == dev_priv->plane_zpos_property &&
-	    (config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS))
-		exynos_state->zpos = val;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
-static int exynos_drm_plane_atomic_get_property(struct drm_plane *plane,
-					  const struct drm_plane_state *state,
-					  struct drm_property *property,
-					  uint64_t *val)
-{
-	const struct exynos_drm_plane_state *exynos_state =
-		container_of(state, const struct exynos_drm_plane_state, base);
-	struct exynos_drm_private *dev_priv = plane->dev->dev_private;
-
-	if (property == dev_priv->plane_zpos_property)
-		*val = exynos_state->zpos;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -213,8 +175,6 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.reset		= exynos_drm_plane_reset,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
-	.atomic_set_property = exynos_drm_plane_atomic_set_property,
-	.atomic_get_property = exynos_drm_plane_atomic_get_property,
 };
 
 static int
@@ -302,20 +262,21 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 };
 
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
-					      unsigned int zpos)
+					      unsigned int zpos, bool immutable)
 {
 	struct drm_device *dev = plane->dev;
-	struct exynos_drm_private *dev_priv = dev->dev_private;
 	struct drm_property *prop;
 
-	prop = dev_priv->plane_zpos_property;
-	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "zpos",
-						 0, MAX_PLANE - 1);
-		if (!prop)
-			return;
-
-		dev_priv->plane_zpos_property = prop;
+	if (immutable) {
+		if (!dev->mode_config.zpos_immutable_property)
+			if (drm_mode_create_zpos_immutable_property(dev))
+				return;
+		prop = dev->mode_config.zpos_immutable_property;
+	} else {
+		if (!dev->mode_config.zpos_property)
+			if (drm_mode_create_zpos_property(dev))
+				return;
+		prop = dev->mode_config.zpos_property;
 	}
 
 	drm_object_attach_property(&plane->base, prop, zpos);
@@ -344,7 +305,8 @@ int exynos_plane_init(struct drm_device *dev,
 	exynos_plane->index = index;
 	exynos_plane->config = config;
 
-	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos);
+	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos,
+			   !(config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index b5fbc1cbf024..d00c201773c9 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -478,6 +478,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
+	unsigned int priority = state->base.normalized_zpos + 1;
 	unsigned long flags;
 	dma_addr_t luma_addr[2], chroma_addr[2];
 	bool tiled_mode = false;
@@ -562,7 +563,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, plane->index, state->zpos + 1, true);
+	mixer_cfg_layer(ctx, plane->index, priority, true);
 	mixer_cfg_vp_blend(ctx);
 	mixer_run(ctx);
 
@@ -587,6 +588,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
+	unsigned int priority = state->base.normalized_zpos + 1;
 	unsigned long flags;
 	unsigned int win = plane->index;
 	unsigned int x_ratio = 0, y_ratio = 0;
@@ -678,7 +680,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, win, state->zpos + 1, true);
+	mixer_cfg_layer(ctx, win, priority, true);
 	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
 
 	/* layer update mandatory for mixer 16.0.33.0 */
-- 
1.9.2

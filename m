From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v6 3/4] drm/exynos: use generic code for managing zpos plane property
Date: Thu, 21 Jul 2016 10:52:02 +0200
Message-ID: <1469091123-4909-4-git-send-email-benjamin.gaignard@linaro.org>
References: <1469091123-4909-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:36338 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbcGUIw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 04:52:26 -0400
Received: by mail-wm0-f47.google.com with SMTP id q128so14326830wma.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 01:52:25 -0700 (PDT)
In-Reply-To: <1469091123-4909-1-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, vincent.abriou@st.com, fabien.dessenne@st.com, linux-samsung-soc@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch replaces zpos property handling custom code in Exynos DRM
driver with calls to generic DRM code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: vincent.abriou@st.com
Cc: fabien.dessenne@st.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 67 +++++--------------------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  6 ++-
 3 files changed, 13 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b39d521..7f1a49d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -64,7 +64,6 @@ struct exynos_drm_plane_state {
 	struct exynos_drm_rect src;
 	unsigned int h_ratio;
 	unsigned int v_ratio;
-	unsigned int zpos;
 };
 
 static inline struct exynos_drm_plane_state *
@@ -221,7 +220,6 @@ struct exynos_drm_private {
 	 * this array is used to be aware of which crtc did it request vblank.
 	 */
 	struct drm_crtc *crtc[MAX_CRTC];
-	struct drm_property *plane_zpos_property;
 
 	struct device *dma_dev;
 	void *mapping;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 77f12c0..7f32419 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -139,9 +139,9 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 
 	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
 	if (exynos_state) {
-		exynos_state->zpos = exynos_plane->config->zpos;
 		plane->state = &exynos_state->base;
 		plane->state->plane = plane;
+		plane->state->zpos = exynos_plane->config->zpos;
 	}
 }
 
@@ -157,7 +157,6 @@ exynos_drm_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
-	copy->zpos = exynos_state->zpos;
 	return &copy->base;
 }
 
@@ -170,43 +169,6 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
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
@@ -215,8 +177,6 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.reset		= exynos_drm_plane_reset,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
-	.atomic_set_property = exynos_drm_plane_atomic_set_property,
-	.atomic_get_property = exynos_drm_plane_atomic_get_property,
 };
 
 static int
@@ -304,23 +264,13 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 };
 
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
-					      unsigned int zpos)
+					      bool immutable)
 {
-	struct drm_device *dev = plane->dev;
-	struct exynos_drm_private *dev_priv = dev->dev_private;
-	struct drm_property *prop;
-
-	prop = dev_priv->plane_zpos_property;
-	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "zpos",
-						 0, MAX_PLANE - 1);
-		if (!prop)
-			return;
-
-		dev_priv->plane_zpos_property = prop;
-	}
-
-	drm_object_attach_property(&plane->base, prop, zpos);
+	/* FIXME */
+	if (immutable)
+		drm_plane_create_zpos_immutable_property(plane, 0);
+	else
+		drm_plane_create_zpos_property(plane, 0, 0, MAX_PLANE - 1);
 }
 
 int exynos_plane_init(struct drm_device *dev,
@@ -346,7 +296,8 @@ int exynos_plane_init(struct drm_device *dev,
 	exynos_plane->index = index;
 	exynos_plane->config = config;
 
-	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos);
+	exynos_plane_attach_zpos_property(&exynos_plane->base,
+			   !(config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 74a4269..e1d47f9 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -477,6 +477,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
+	unsigned int priority = state->base.normalized_zpos + 1;
 	unsigned long flags;
 	dma_addr_t luma_addr[2], chroma_addr[2];
 	bool tiled_mode = false;
@@ -561,7 +562,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, plane->index, state->zpos + 1, true);
+	mixer_cfg_layer(ctx, plane->index, priority, true);
 	mixer_cfg_vp_blend(ctx);
 	mixer_run(ctx);
 
@@ -586,6 +587,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
 	struct drm_framebuffer *fb = state->base.fb;
+	unsigned int priority = state->base.normalized_zpos + 1;
 	unsigned long flags;
 	unsigned int win = plane->index;
 	unsigned int x_ratio = 0, y_ratio = 0;
@@ -677,7 +679,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	mixer_cfg_scan(ctx, mode->vdisplay);
 	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
-	mixer_cfg_layer(ctx, win, state->zpos + 1, true);
+	mixer_cfg_layer(ctx, win, priority, true);
 	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
 
 	/* layer update mandatory for mixer 16.0.33.0 */
-- 
1.9.1

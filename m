From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 2/5] drm/exynos: mixer: introduce mixer_layer_blending()
Date: Sun, 22 Nov 2015 17:09:41 +0100
Message-ID: <1448208584-6621-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45593 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751711AbbKVQK2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 11:10:28 -0500
In-Reply-To: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This analyses the current layer configuration (which layers
are enabled, which have alpha-pixelformat, etc.) and setups
blending accordingly.

We currently disable all kinds of blending for the bottom-most
layer, since configuration of the mixer background is not
yet exposed.
Also blending is only enabled when the layer has a pixelformat
with alpha attached.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 88 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/regs-mixer.h   |  1 +
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 2c1cea3..ec77aad 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -174,6 +174,21 @@ static const u8 filter_cr_horiz_tap4[] = {
 	70,	59,	48,	37,	27,	19,	11,	5,
 };
 
+static inline bool is_alpha_format(const struct mixer_context* ctx, unsigned int win)
+{
+	const struct drm_plane_state *state = ctx->planes[win].base.state;
+	const struct drm_framebuffer *fb = state->fb;
+
+	switch (fb->pixel_format) {
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_ARGB4444:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static inline u32 vp_reg_read(struct mixer_resources *res, u32 reg_id)
 {
 	return readl(res->vp_regs + reg_id);
@@ -331,6 +346,79 @@ static void mixer_layer_priority(struct mixer_context *ctx)
 	mixer_reg_write(&ctx->mixer_res, MXR_LAYER_CFG, val);
 }
 
+/* Configure blending for bottom-most layer. */
+static void mixer_bottom_layer(struct mixer_context *ctx,
+		const struct layer_cfg *cfg)
+{
+	u32 val;
+	struct mixer_resources *res = &ctx->mixer_res;
+
+	if (cfg->index == 2) {
+		val = 0; /* use defaults for video layer */
+		mixer_reg_write(res, MXR_VIDEO_CFG, val);
+	} else {
+		val = MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
+
+		/* Don't blend bottom-most layer onto the mixer background. */
+		mixer_reg_writemask(res, MXR_GRAPHIC_CFG(cfg->index),
+				    val, MXR_GRP_CFG_MISC_MASK);
+	}
+}
+
+static void mixer_general_layer(struct mixer_context *ctx,
+		const struct layer_cfg *cfg)
+{
+	u32 val;
+	struct mixer_resources *res = &ctx->mixer_res;
+
+	if (is_alpha_format(ctx, cfg->index)) {
+		val  = MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
+		val |= MXR_GRP_CFG_BLEND_PRE_MUL;
+		val |= MXR_GRP_CFG_PIXEL_BLEND_EN; /* blending based on pixel alpha */
+
+		/* The video layer never has an alpha pixelformat. */
+		mixer_reg_writemask(res, MXR_GRAPHIC_CFG(cfg->index),
+				    val, MXR_GRP_CFG_MISC_MASK);
+	} else {
+		if (cfg->index == 2) {
+			/*
+			 * No blending at the moment since the NV12/NV21 pixelformats don't
+			 * have an alpha channel. However the mixer supports a global alpha
+			 * value for a layer. Once this functionality is exposed, we can
+			 * support blending of the video layer through this.
+			 */
+			val = 0;
+			mixer_reg_write(res, MXR_VIDEO_CFG, val);
+		} else {
+			val = MXR_GRP_CFG_COLOR_KEY_DISABLE;
+			mixer_reg_writemask(res, MXR_GRAPHIC_CFG(cfg->index),
+					    val, MXR_GRP_CFG_MISC_MASK);
+		}
+	}
+}
+
+static void mixer_layer_blending(struct mixer_context *ctx, unsigned int enable_state)
+{
+	unsigned int i, index;
+	bool bottom_layer = false;
+
+	for (i = 0; i < ctx->num_layer; ++i) {
+		index = ctx->layer_cfg[i].index;
+
+		/* Skip layer if it's not enabled. */
+		if (!(enable_state & (1 << index)))
+			continue;
+
+		/* Bottom layer needs special handling. */
+		if (bottom_layer) {
+			mixer_general_layer(ctx, &ctx->layer_cfg[i]);
+		} else {
+			mixer_bottom_layer(ctx, &ctx->layer_cfg[i]);
+			bottom_layer = true;
+		}
+	}
+}
+
 static void mixer_vsync_set_update(struct mixer_context *ctx, bool enable)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index ac60260..118872e 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -113,6 +113,7 @@
 #define MXR_GRP_CFG_BLEND_PRE_MUL	(1 << 20)
 #define MXR_GRP_CFG_WIN_BLEND_EN	(1 << 17)
 #define MXR_GRP_CFG_PIXEL_BLEND_EN	(1 << 16)
+#define MXR_GRP_CFG_MISC_MASK		((3 << 16) | (3 << 20))
 #define MXR_GRP_CFG_FORMAT_VAL(x)	MXR_MASK_VAL(x, 11, 8)
 #define MXR_GRP_CFG_FORMAT_MASK		MXR_GRP_CFG_FORMAT_VAL(~0)
 #define MXR_GRP_CFG_ALPHA_VAL(x)	MXR_MASK_VAL(x, 7, 0)
-- 
2.4.9

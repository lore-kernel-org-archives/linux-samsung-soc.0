From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/5] drm/exynos: mixer: refactor layer setup
Date: Wed,  6 May 2015 15:36:46 +0200
Message-ID: <1430919410-9917-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34785 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751266AbbEFNht (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 09:37:49 -0400
In-Reply-To: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

First step in allowing a more generic way to setup complex
blending for the different layers.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 90 ++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 4a1656b..e4a5e76 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -63,6 +63,11 @@ struct mixer_resources {
 	struct clk		*mout_mixer;
 };
 
+struct layer_config {
+	unsigned int index;
+	unsigned int priority;
+};
+
 enum mixer_version_id {
 	MXR_VER_0_0_0_16,
 	MXR_VER_16_0_33_0,
@@ -75,6 +80,8 @@ struct mixer_context {
 	struct drm_device	*drm_dev;
 	struct exynos_drm_crtc	*crtc;
 	struct exynos_drm_plane	planes[MIXER_WIN_NR];
+	const struct layer_config *layer_config;
+	unsigned int num_layer;
 	int			pipe;
 	bool			interlace;
 	bool			powered;
@@ -95,6 +102,40 @@ struct mixer_drv_data {
 	bool					has_sclk;
 };
 
+/*
+ * The default layer priorities. A higher priority means that
+ * the layer is at the top of layer stack.
+ * The current configuration assumes the following usage scenario:
+ * layer1: OSD [top]
+ * layer0: main framebuffer
+ * video layer: video overlay [bottom]
+ * Note that the video layer is only usable when the
+ * video processor is available.
+ */
+
+static const struct layer_config default_layer_config[] = {
+	{
+		.index = 0,			/* layer0 */
+		.priority = 1
+	}, {
+		.index = 1,			/* layer1 */
+		.priority = 2
+	}
+};
+
+static const struct layer_config vp_layer_config[] = {
+	{
+		.index = 2,			/* video layer */
+		.priority = 1
+	}, {
+		.index = 0,			/* layer0 */
+		.priority = 2
+	}, {
+		.index = 1,			/* layer1 */
+		.priority = 3
+	}
+};
+
 static const u8 filter_y_horiz_tap8[] = {
 	0,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
 	-1,	-1,	-1,	-1,	-1,	0,	0,	0,
@@ -253,6 +294,34 @@ static void vp_default_filter(struct mixer_resources *res)
 		filter_cr_horiz_tap4, sizeof(filter_cr_horiz_tap4));
 }
 
+static void mixer_layer_priority(struct mixer_context *ctx)
+{
+	u32 val = 0;
+	unsigned int i, priority;
+
+	for (i = 0; i < ctx->num_layer; ++i) {
+		priority = ctx->layer_config[i].priority;
+		BUG_ON(priority > 15);
+
+		switch (ctx->layer_config[i].index) {
+		case 0:
+			val |= MXR_LAYER_CFG_GRP0_VAL(priority);
+			break;
+		case 1:
+			val |= MXR_LAYER_CFG_GRP1_VAL(priority);
+			break;
+		case 2:
+			val |= MXR_LAYER_CFG_VP_VAL(priority);
+			break;
+		default:
+			BUG_ON(true);
+			break;
+		}
+	}
+
+	mixer_reg_write(&ctx->mixer_res, MXR_LAYER_CFG, val);
+}
+
 static void mixer_vsync_set_update(struct mixer_context *ctx, bool enable)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
@@ -654,17 +723,7 @@ static void mixer_win_reset(struct mixer_context *ctx)
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
+	mixer_layer_priority(ctx);
 
 	/* setting background color */
 	mixer_reg_write(res, MXR_BG_COLOR0, 0x008080);
@@ -1274,6 +1333,15 @@ static int mixer_probe(struct platform_device *pdev)
 	ctx->vp_enabled = drv->is_vp_enabled;
 	ctx->has_sclk = drv->has_sclk;
 	ctx->mxr_ver = drv->version;
+
+	if (drv->is_vp_enabled) {
+		ctx->layer_config = vp_layer_config;
+		ctx->num_layer = ARRAY_SIZE(vp_layer_config);
+	} else {
+		ctx->layer_config = default_layer_config;
+		ctx->num_layer = ARRAY_SIZE(default_layer_config);
+	}
+
 	init_waitqueue_head(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
 
-- 
2.0.5

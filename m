From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 1/5] drm/exynos: mixer: refactor layer setup
Date: Sun, 22 Nov 2015 17:09:40 +0100
Message-ID: <1448208584-6621-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45589 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752427AbbKVQKF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 11:10:05 -0500
In-Reply-To: <1448208584-6621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

First step in allowing a more generic way to setup complex
blending for the different layers.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 84 ++++++++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 7498c6e..2c1cea3 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -63,6 +63,11 @@ struct mixer_resources {
 	struct clk		*mout_mixer;
 };
 
+struct layer_cfg {
+	unsigned int index;
+	unsigned int priority;
+};
+
 enum mixer_version_id {
 	MXR_VER_0_0_0_16,
 	MXR_VER_16_0_33_0,
@@ -92,6 +97,8 @@ struct mixer_context {
 	struct drm_device	*drm_dev;
 	struct exynos_drm_crtc	*crtc;
 	struct exynos_drm_plane	planes[MIXER_WIN_NR];
+	const struct layer_cfg	*layer_cfg;
+	unsigned int		num_layer;
 	int			pipe;
 	unsigned long		flags;
 	bool			interlace;
@@ -110,6 +117,34 @@ struct mixer_drv_data {
 	bool					has_sclk;
 };
 
+/*
+ * The default layer priorities for non-VP (video processor)
+ * and VP mixer configurations.
+ *
+ * A higher priority means that the layer is at the top of
+ * the layer stack.
+ * Configurations have to be specified with its entries
+ * sorted with increasing priority.
+ *
+ * The default config assumes the following usage scenario:
+ * layer1: OSD [top]
+ * layer0: main framebuffer
+ * video layer: video overlay [bottom]
+ * Note that the video layer is only usable when the
+ * VP is available.
+ */
+
+static const struct layer_cfg nonvp_default_cfg[] = {
+	{ .index = 0, .priority = 1 },		/* layer0 */
+	{ .index = 1, .priority = 2 },		/* layer1 */
+};
+
+static const struct layer_cfg vp_default_cfg[] = {
+	{ .index = 2, .priority = 1 },		/* video layer */
+	{ .index = 0, .priority = 2 },		/* layer0 */
+	{ .index = 1, .priority = 3 },		/* layer1 */
+};
+
 static const u8 filter_y_horiz_tap8[] = {
 	0,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
 	-1,	-1,	-1,	-1,	-1,	0,	0,	0,
@@ -268,6 +303,34 @@ static void vp_default_filter(struct mixer_resources *res)
 		filter_cr_horiz_tap4, sizeof(filter_cr_horiz_tap4));
 }
 
+static void mixer_layer_priority(struct mixer_context *ctx)
+{
+	u32 val = 0;
+	unsigned int i, priority;
+
+	for (i = 0; i < ctx->num_layer; ++i) {
+		priority = ctx->layer_cfg[i].priority;
+		BUG_ON(priority > 15);
+
+		switch (ctx->layer_cfg[i].index) {
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
@@ -673,17 +736,7 @@ static void mixer_win_reset(struct mixer_context *ctx)
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
@@ -1209,6 +1262,15 @@ static int mixer_probe(struct platform_device *pdev)
 	ctx->vp_enabled = drv->is_vp_enabled;
 	ctx->has_sclk = drv->has_sclk;
 	ctx->mxr_ver = drv->version;
+
+	if (drv->is_vp_enabled) {
+		ctx->layer_cfg = vp_default_cfg;
+		ctx->num_layer = ARRAY_SIZE(vp_default_cfg);
+	} else {
+		ctx->layer_cfg = nonvp_default_cfg;
+		ctx->num_layer = ARRAY_SIZE(nonvp_default_cfg);
+	}
+
 	init_waitqueue_head(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
 
-- 
2.4.9

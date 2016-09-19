From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 1/2] drm/exynos: mixer: convert booleans to flags in mixer context
Date: Mon, 19 Sep 2016 15:53:02 +0200
Message-ID: <1474293183-9918-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1474293183-9918-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39266 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1759473AbcISNxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 09:53:14 -0400
In-Reply-To: <1474293183-9918-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The mixer context struct already has a 'flags' field, so
we can use it to store the 'interlace', 'vp_enabled' and
'has_sclk' booleans.
We use the non-atomic helper functions to access these bits.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 54 +++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9a48aa1..1e78d57 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -73,6 +73,9 @@ enum mixer_version_id {
 enum mixer_flag_bits {
 	MXR_BIT_POWERED,
 	MXR_BIT_VSYNC,
+	MXR_BIT_INTERLACE,
+	MXR_BIT_VP_ENABLED,
+	MXR_BIT_HAS_SCLK,
 };
 
 static const uint32_t mixer_formats[] = {
@@ -98,9 +101,6 @@ struct mixer_context {
 	struct exynos_drm_plane	planes[MIXER_WIN_NR];
 	int			pipe;
 	unsigned long		flags;
-	bool			interlace;
-	bool			vp_enabled;
-	bool			has_sclk;
 
 	struct mixer_resources	mixer_res;
 	enum mixer_version_id	mxr_ver;
@@ -346,7 +346,7 @@ static void mixer_vsync_set_update(struct mixer_context *ctx, bool enable)
 	mixer_reg_writemask(res, MXR_STATUS, enable ?
 			MXR_STATUS_SYNC_ENABLE : 0, MXR_STATUS_SYNC_ENABLE);
 
-	if (ctx->vp_enabled)
+	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
 		vp_reg_write(res, VP_SHADOW_UPDATE, enable ?
 			VP_SHADOW_UPDATE_ENABLE : 0);
 }
@@ -357,8 +357,8 @@ static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
 	u32 val;
 
 	/* choosing between interlace and progressive mode */
-	val = (ctx->interlace ? MXR_CFG_SCAN_INTERLACE :
-				MXR_CFG_SCAN_PROGRESSIVE);
+	val = test_bit(MXR_BIT_INTERLACE, &ctx->flags) ?
+		MXR_CFG_SCAN_INTERLACE : MXR_CFG_SCAN_PROGRESSIVE;
 
 	if (ctx->mxr_ver != MXR_VER_128_0_0_184) {
 		/* choosing between proper HD and SD mode */
@@ -436,9 +436,10 @@ static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
 		mixer_reg_writemask(res, MXR_LAYER_CFG,
 				    MXR_LAYER_CFG_GRP1_VAL(priority),
 				    MXR_LAYER_CFG_GRP1_MASK);
+
 		break;
 	case VP_DEFAULT_WIN:
-		if (ctx->vp_enabled) {
+		if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
 			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
 			mixer_reg_writemask(res, MXR_CFG, val,
 				MXR_CFG_VP_ENABLE);
@@ -501,7 +502,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	chroma_addr[0] = exynos_drm_fb_dma_addr(fb, 1);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		ctx->interlace = true;
+		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
 		if (tiled_mode) {
 			luma_addr[1] = luma_addr[0] + 0x40;
 			chroma_addr[1] = chroma_addr[0] + 0x40;
@@ -510,7 +511,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 			chroma_addr[1] = chroma_addr[0] + fb->pitches[0];
 		}
 	} else {
-		ctx->interlace = false;
+		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
 		luma_addr[1] = 0;
 		chroma_addr[1] = 0;
 	}
@@ -518,7 +519,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	spin_lock_irqsave(&res->reg_slock, flags);
 
 	/* interlace or progressive scan mode */
-	val = (ctx->interlace ? ~0 : 0);
+	val = (test_bit(MXR_BIT_INTERLACE, &ctx->flags) ? ~0 : 0);
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_LINE_SKIP);
 
 	/* setup format */
@@ -541,7 +542,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 
 	vp_reg_write(res, VP_DST_WIDTH, state->crtc.w);
 	vp_reg_write(res, VP_DST_H_POSITION, state->crtc.x);
-	if (ctx->interlace) {
+	if (test_bit(MXR_BIT_INTERLACE, &ctx->flags)) {
 		vp_reg_write(res, VP_DST_HEIGHT, state->crtc.h / 2);
 		vp_reg_write(res, VP_DST_V_POSITION, state->crtc.y / 2);
 	} else {
@@ -636,9 +637,9 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	src_y_offset = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		ctx->interlace = true;
+		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
 	else
-		ctx->interlace = false;
+		__clear_bit(MXR_BIT_INTERLACE, &ctx->flags);
 
 	spin_lock_irqsave(&res->reg_slock, flags);
 
@@ -733,7 +734,7 @@ static void mixer_win_reset(struct mixer_context *ctx)
 	mixer_reg_write(res, MXR_BG_COLOR1, 0x008080);
 	mixer_reg_write(res, MXR_BG_COLOR2, 0x008080);
 
-	if (ctx->vp_enabled) {
+	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
 		/* configuration of Video Processor Registers */
 		vp_win_reset(ctx);
 		vp_default_filter(res);
@@ -742,7 +743,7 @@ static void mixer_win_reset(struct mixer_context *ctx)
 	/* disable all layers */
 	mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_GRP0_ENABLE);
 	mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_GRP1_ENABLE);
-	if (ctx->vp_enabled)
+	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
 		mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_VP_ENABLE);
 
 	spin_unlock_irqrestore(&res->reg_slock, flags);
@@ -767,7 +768,7 @@ static irqreturn_t mixer_irq_handler(int irq, void *arg)
 		val &= ~MXR_INT_STATUS_VSYNC;
 
 		/* interlace scan need to check shadow register */
-		if (ctx->interlace) {
+		if (test_bit(MXR_BIT_INTERLACE, &ctx->flags)) {
 			base = mixer_reg_read(res, MXR_GRAPHIC_BASE(0));
 			shadow = mixer_reg_read(res, MXR_GRAPHIC_BASE_S(0));
 			if (base != shadow)
@@ -867,7 +868,7 @@ static int vp_resources_init(struct mixer_context *mixer_ctx)
 		return -ENODEV;
 	}
 
-	if (mixer_ctx->has_sclk) {
+	if (test_bit(MXR_BIT_HAS_SCLK, &mixer_ctx->flags)) {
 		mixer_res->sclk_mixer = devm_clk_get(dev, "sclk_mixer");
 		if (IS_ERR(mixer_res->sclk_mixer)) {
 			dev_err(dev, "failed to get clock 'sclk_mixer'\n");
@@ -917,7 +918,7 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
 		return ret;
 	}
 
-	if (mixer_ctx->vp_enabled) {
+	if (test_bit(MXR_BIT_VP_ENABLED, &mixer_ctx->flags)) {
 		/* acquire vp resources: regs, irqs, clocks */
 		ret = vp_resources_init(mixer_ctx);
 		if (ret) {
@@ -1160,7 +1161,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 		return ret;
 
 	for (i = 0; i < MIXER_WIN_NR; i++) {
-		if (i == VP_DEFAULT_WIN && !ctx->vp_enabled)
+		if (i == VP_DEFAULT_WIN && !test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
 			continue;
 
 		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
@@ -1215,10 +1216,13 @@ static int mixer_probe(struct platform_device *pdev)
 
 	ctx->pdev = pdev;
 	ctx->dev = dev;
-	ctx->vp_enabled = drv->is_vp_enabled;
-	ctx->has_sclk = drv->has_sclk;
 	ctx->mxr_ver = drv->version;
 
+	if (drv->is_vp_enabled)
+		__set_bit(MXR_BIT_VP_ENABLED, &ctx->flags);
+	if (drv->has_sclk)
+		__set_bit(MXR_BIT_HAS_SCLK, &ctx->flags);
+
 	platform_set_drvdata(pdev, ctx);
 
 	ret = component_add(&pdev->dev, &mixer_component_ops);
@@ -1244,9 +1248,9 @@ static int __maybe_unused exynos_mixer_suspend(struct device *dev)
 
 	clk_disable_unprepare(res->hdmi);
 	clk_disable_unprepare(res->mixer);
-	if (ctx->vp_enabled) {
+	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
 		clk_disable_unprepare(res->vp);
-		if (ctx->has_sclk)
+		if (test_bit(MXR_BIT_HAS_SCLK, &ctx->flags))
 			clk_disable_unprepare(res->sclk_mixer);
 	}
 
@@ -1269,14 +1273,14 @@ static int __maybe_unused exynos_mixer_resume(struct device *dev)
 		DRM_ERROR("Failed to prepare_enable the hdmi clk [%d]\n", ret);
 		return ret;
 	}
-	if (ctx->vp_enabled) {
+	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
 		ret = clk_prepare_enable(res->vp);
 		if (ret < 0) {
 			DRM_ERROR("Failed to prepare_enable the vp clk [%d]\n",
 				  ret);
 			return ret;
 		}
-		if (ctx->has_sclk) {
+		if (test_bit(MXR_BIT_HAS_SCLK, &ctx->flags)) {
 			ret = clk_prepare_enable(res->sclk_mixer);
 			if (ret < 0) {
 				DRM_ERROR("Failed to prepare_enable the " \
-- 
2.7.3

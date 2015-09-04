From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 10/10] drm/exynos: add pm_runtime to DECON 7
Date: Fri,  4 Sep 2015 17:15:52 -0300
Message-ID: <1441397752-6672-11-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f194.google.com ([209.85.160.194]:34603 "EHLO
	mail-yk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760503AbbIDUQV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:21 -0400
Received: by ykcm128 with SMTP id m128so2769866ykc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:20 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with
proper refcnt instead of rely on specific flags to track the enabled
state.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 125 ++++++++++++-----------------
 1 file changed, 53 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index e4646e2..517ba7a 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -54,7 +54,6 @@ struct decon_context {
 	void __iomem			*regs;
 	unsigned long			irq_flags;
 	bool				i80_if;
-	bool				suspended;
 	int				pipe;
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
@@ -85,9 +84,6 @@ static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	atomic_set(&ctx->wait_vsync_event, 1);
 
 	/*
@@ -119,13 +115,8 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 	}
 
 	/* Wait for vsync, as disable channel takes effect at next vsync */
-	if (ch_enabled) {
-		unsigned int state = ctx->suspended;
-
-		ctx->suspended = 0;
+	if (ch_enabled)
 		decon_wait_for_vblank(ctx->crtc);
-		ctx->suspended = state;
-	}
 }
 
 static int decon_ctx_initialize(struct decon_context *ctx,
@@ -180,9 +171,6 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
 	u32 val, clkdiv;
 
-	if (ctx->suspended)
-		return;
-
 	/* nothing to do if we haven't set the mode yet */
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return;
@@ -244,9 +232,6 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (ctx->suspended)
-		return -EPERM;
-
 	if (!test_and_set_bit(0, &ctx->irq_flags)) {
 		val = readl(ctx->regs + VIDINTCON0);
 
@@ -269,9 +254,6 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (ctx->suspended)
-		return;
-
 	if (test_and_clear_bit(0, &ctx->irq_flags)) {
 		val = readl(ctx->regs + VIDINTCON0);
 
@@ -399,9 +381,6 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	decon_shadow_protect_win(ctx, plane->zpos, true);
 }
 
@@ -419,9 +398,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int bpp = state->fb->bits_per_pixel >> 3;
 	unsigned int pitch = state->fb->pitches[0];
 
-	if (ctx->suspended)
-		return;
-
 	/*
 	 * SHADOWCON/PRTCON register is used for enabling timing.
 	 *
@@ -518,9 +494,6 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	unsigned int win = plane->zpos;
 	u32 val;
 
-	if (ctx->suspended)
-		return;
-
 	/* protect windows */
 	decon_shadow_protect_win(ctx, win, true);
 
@@ -539,9 +512,6 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	decon_shadow_protect_win(ctx, plane->zpos, false);
 }
 
@@ -565,39 +535,9 @@ static void decon_init(struct decon_context *ctx)
 static void decon_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	int ret;
-
-	if (!ctx->suspended)
-		return;
-
-	ctx->suspended = false;
 
 	pm_runtime_get_sync(ctx->dev);
 
-	ret = clk_prepare_enable(ctx->pclk);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->aclk);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->eclk);
-	if  (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->vclk);
-	if  (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
-		return;
-	}
-
 	decon_init(ctx);
 
 	/* if vblank was enabled status, enable it again. */
@@ -612,9 +552,6 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	int i;
 
-	if (ctx->suspended)
-		return;
-
 	/*
 	 * We need to make sure that all windows are disabled before we
 	 * suspend that connector. Otherwise we might try to scan from
@@ -623,14 +560,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < WINDOWS_NR; i++)
 		decon_disable_plane(crtc, &ctx->planes[i]);
 
-	clk_disable_unprepare(ctx->vclk);
-	clk_disable_unprepare(ctx->eclk);
-	clk_disable_unprepare(ctx->aclk);
-	clk_disable_unprepare(ctx->pclk);
-
 	pm_runtime_put_sync(ctx->dev);
-
-	ctx->suspended = true;
 }
 
 static const struct exynos_drm_crtc_ops decon_crtc_ops = {
@@ -756,7 +686,6 @@ static int decon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->dev = dev;
-	ctx->suspended = true;
 
 	i80_if_timings = of_get_child_by_name(dev->of_node, "i80-if-timings");
 	if (i80_if_timings)
@@ -851,11 +780,63 @@ static int decon_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos7_decon_suspend(struct device *dev)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ctx->vclk);
+	clk_disable_unprepare(ctx->eclk);
+	clk_disable_unprepare(ctx->aclk);
+	clk_disable_unprepare(ctx->pclk);
+
+	return 0;
+}
+
+static int exynos7_decon_resume(struct device *dev)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(ctx->pclk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the pclk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->aclk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the aclk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->eclk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the eclk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->vclk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the vclk [%d]\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos7_decon_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos7_decon_suspend, exynos7_decon_resume,
+			   NULL)
+};
+
 struct platform_driver decon_driver = {
 	.probe		= decon_probe,
 	.remove		= decon_remove,
 	.driver		= {
 		.name	= "exynos-decon",
+		.pm	= &exynos7_decon_pm_ops,
 		.of_match_table = decon_driver_dt_match,
 	},
 };
-- 
2.1.0

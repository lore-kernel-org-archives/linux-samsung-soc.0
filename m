From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 07/10] drm/exynos: add pm_runtime to FIMD
Date: Fri,  4 Sep 2015 17:15:49 -0300
Message-ID: <1441397752-6672-8-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:35720 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760503AbbIDUQO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:14 -0400
Received: by ykek143 with SMTP id k143so2769308yke.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:14 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let pm_runtime handle the enabling/disabling of the device with proper
refcnt instead of rely on specific flags to track the enabled state.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  1 -
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 91 +++++++++++----------------
 3 files changed, 37 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 79b2b22..838a9c1 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -478,7 +478,6 @@ static struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.commit			= decon_commit,
 	.enable_vblank		= decon_enable_vblank,
 	.disable_vblank		= decon_disable_vblank,
-	.commit			= decon_commit,
 	.atomic_begin		= decon_atomic_begin,
 	.update_plane		= decon_update_plane,
 	.disable_plane		= decon_disable_plane,
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f3826dc..e4646e2 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -637,7 +637,6 @@ static const struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.enable = decon_enable,
 	.disable = decon_disable,
 	.mode_fixup = decon_mode_fixup,
-	.commit = decon_commit,
 	.enable_vblank = decon_enable_vblank,
 	.disable_vblank = decon_disable_vblank,
 	.wait_for_vblank = decon_wait_for_vblank,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0bbe537..0f17ae0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -160,7 +160,6 @@ struct fimd_context {
 	u32				vidout_con;
 	u32				i80ifcon;
 	bool				i80_if;
-	bool				suspended;
 	int				pipe;
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
@@ -209,9 +208,6 @@ static int fimd_enable_vblank(struct exynos_drm_crtc *crtc)
 	struct fimd_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (ctx->suspended)
-		return -EPERM;
-
 	if (!test_and_set_bit(0, &ctx->irq_flags)) {
 		val = readl(ctx->regs + VIDINTCON0);
 
@@ -241,9 +237,6 @@ static void fimd_disable_vblank(struct exynos_drm_crtc *crtc)
 	struct fimd_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (ctx->suspended)
-		return;
-
 	if (test_and_clear_bit(0, &ctx->irq_flags)) {
 		val = readl(ctx->regs + VIDINTCON0);
 
@@ -264,9 +257,6 @@ static void fimd_wait_for_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	atomic_set(&ctx->wait_vsync_event, 1);
 
 	/*
@@ -339,14 +329,12 @@ static void fimd_clear_channels(struct exynos_drm_crtc *crtc)
 		int pipe = ctx->pipe;
 
 		/* ensure that vblank interrupt won't be reported to core */
-		ctx->suspended = false;
 		ctx->pipe = -1;
 
 		fimd_enable_vblank(ctx->crtc);
 		fimd_wait_for_vblank(ctx->crtc);
 		fimd_disable_vblank(ctx->crtc);
 
-		ctx->suspended = true;
 		ctx->pipe = pipe;
 	}
 
@@ -394,9 +382,6 @@ static void fimd_commit(struct exynos_drm_crtc *crtc)
 	void *timing_base = ctx->regs + driver_data->timing_base;
 	u32 val, clkdiv;
 
-	if (ctx->suspended)
-		return;
-
 	/* nothing to do if we haven't set the mode yet */
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return;
@@ -630,9 +615,6 @@ static void fimd_atomic_begin(struct exynos_drm_crtc *crtc,
 {
 	struct fimd_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	fimd_shadow_protect_win(ctx, plane->zpos, true);
 }
 
@@ -641,9 +623,6 @@ static void fimd_atomic_flush(struct exynos_drm_crtc *crtc,
 {
 	struct fimd_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	fimd_shadow_protect_win(ctx, plane->zpos, false);
 }
 
@@ -659,9 +638,6 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int bpp = state->fb->bits_per_pixel >> 3;
 	unsigned int pitch = state->fb->pitches[0];
 
-	if (ctx->suspended)
-		return;
-
 	offset = plane->src_x * bpp;
 	offset += plane->src_y * pitch;
 
@@ -743,9 +719,6 @@ static void fimd_disable_plane(struct exynos_drm_crtc *crtc,
 	struct fimd_context *ctx = crtc->ctx;
 	unsigned int win = plane->zpos;
 
-	if (ctx->suspended)
-		return;
-
 	fimd_enable_video_output(ctx, win, false);
 
 	if (ctx->driver_data->has_shadowcon)
@@ -755,27 +728,9 @@ static void fimd_disable_plane(struct exynos_drm_crtc *crtc,
 static void fimd_enable(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	int ret;
-
-	if (!ctx->suspended)
-		return;
-
-	ctx->suspended = false;
 
 	pm_runtime_get_sync(ctx->dev);
 
-	ret = clk_prepare_enable(ctx->bus_clk);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(ctx->lcd_clk);
-	if  (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
-		return;
-	}
-
 	/* if vblank was enabled status, enable it again. */
 	if (test_and_clear_bit(0, &ctx->irq_flags))
 		fimd_enable_vblank(ctx->crtc);
@@ -788,9 +743,6 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 	struct fimd_context *ctx = crtc->ctx;
 	int i;
 
-	if (ctx->suspended)
-		return;
-
 	/*
 	 * We need to make sure that all windows are disabled before we
 	 * suspend that connector. Otherwise we might try to scan from
@@ -805,12 +757,7 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 
 	writel(0, ctx->regs + VIDCON0);
 
-	clk_disable_unprepare(ctx->lcd_clk);
-	clk_disable_unprepare(ctx->bus_clk);
-
 	pm_runtime_put_sync(ctx->dev);
-
-	ctx->suspended = true;
 }
 
 static void fimd_trigger(struct device *dev)
@@ -1019,7 +966,6 @@ static int fimd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->dev = dev;
-	ctx->suspended = true;
 	ctx->driver_data = drm_fimd_get_driver_data(pdev);
 
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
@@ -1129,12 +1075,49 @@ static int fimd_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos_fimd_suspend(struct device *dev)
+{
+	struct fimd_context *ctx = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ctx->lcd_clk);
+	clk_disable_unprepare(ctx->bus_clk);
+
+	return 0;
+}
+
+static int exynos_fimd_resume(struct device *dev)
+{
+	struct fimd_context *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(ctx->bus_clk);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the bus clk [%d]\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ctx->lcd_clk);
+	if  (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the lcd clk [%d]\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops exynos_fimd_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_fimd_suspend, exynos_fimd_resume, NULL)
+};
+
 struct platform_driver fimd_driver = {
 	.probe		= fimd_probe,
 	.remove		= fimd_remove,
 	.driver		= {
 		.name	= "exynos4-fb",
 		.owner	= THIS_MODULE,
+		.pm	= &exynos_fimd_pm_ops,
 		.of_match_table = fimd_driver_dt_match,
 	},
 };
-- 
2.1.0

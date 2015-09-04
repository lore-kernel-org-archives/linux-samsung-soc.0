From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 09/10] drm/exynos: add pm_runtime to DECON 5433
Date: Fri,  4 Sep 2015 17:15:51 -0300
Message-ID: <1441397752-6672-10-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f196.google.com ([209.85.160.196]:36170 "EHLO
	mail-yk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760503AbbIDUQT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:19 -0400
Received: by ykcf206 with SMTP id f206so2757290ykc.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:18 -0700 (PDT)
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
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 89 ++++++++++++---------------
 1 file changed, 39 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 838a9c1..f0b7804 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -35,7 +35,6 @@ struct decon_context {
 	struct clk			*clks[6];
 	unsigned long			irq_flags;
 	int				pipe;
-	bool				suspended;
 
 #define BIT_CLKS_ENABLED		0
 #define BIT_IRQS_ENABLED		1
@@ -65,9 +64,6 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (ctx->suspended)
-		return -EPERM;
-
 	if (test_and_set_bit(0, &ctx->irq_flags)) {
 		val = VIDINTCON0_INTEN;
 		if (ctx->i80_if)
@@ -85,9 +81,6 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	if (test_and_clear_bit(0, &ctx->irq_flags))
 		writel(0, ctx->addr + DECON_VIDINTCON0);
 }
@@ -105,9 +98,6 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	struct drm_display_mode *mode = &crtc->base.mode;
 	u32 val;
 
-	if (ctx->suspended)
-		return;
-
 	/* enable clock gate */
 	val = CMU_CLKGAGE_MODE_SFR_F | CMU_CLKGAGE_MODE_MEM_F;
 	writel(val, ctx->addr + DECON_CMU);
@@ -230,9 +220,6 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	decon_shadow_protect_win(ctx, plane->zpos, true);
 }
 
@@ -246,9 +233,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int pitch = state->fb->pitches[0];
 	u32 val;
 
-	if (ctx->suspended)
-		return;
-
 	val = COORDINATE_X(plane->crtc_x) | COORDINATE_Y(plane->crtc_y);
 	writel(val, ctx->addr + DECON_VIDOSDxA(win));
 
@@ -293,9 +277,6 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	unsigned int win = plane->zpos;
 	u32 val;
 
-	if (ctx->suspended)
-		return;
-
 	decon_shadow_protect_win(ctx, win, true);
 
 	/* window disable */
@@ -316,9 +297,6 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
-		return;
-
 	decon_shadow_protect_win(ctx, plane->zpos, false);
 
 	if (ctx->i80_if)
@@ -351,22 +329,9 @@ static void decon_swreset(struct decon_context *ctx)
 static void decon_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	int ret;
-	int i;
-
-	if (!ctx->suspended)
-		return;
-
-	ctx->suspended = false;
 
 	pm_runtime_get_sync(ctx->dev);
 
-	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
-		ret = clk_prepare_enable(ctx->clks[i]);
-		if (ret < 0)
-			goto err;
-	}
-
 	set_bit(BIT_CLKS_ENABLED, &ctx->enabled);
 
 	/* if vblank was enabled status, enable it again. */
@@ -376,11 +341,6 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 	decon_commit(ctx->crtc);
 
 	return;
-err:
-	while (--i >= 0)
-		clk_disable_unprepare(ctx->clks[i]);
-
-	ctx->suspended = true;
 }
 
 static void decon_disable(struct exynos_drm_crtc *crtc)
@@ -388,9 +348,6 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	int i;
 
-	if (ctx->suspended)
-		return;
-
 	/*
 	 * We need to make sure that all windows are disabled before we
 	 * suspend that connector. Otherwise we might try to scan from
@@ -401,14 +358,9 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 
 	decon_swreset(ctx);
 
-	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++)
-		clk_disable_unprepare(ctx->clks[i]);
-
 	clear_bit(BIT_CLKS_ENABLED, &ctx->enabled);
 
 	pm_runtime_put_sync(ctx->dev);
-
-	ctx->suspended = true;
 }
 
 void decon_te_irq_handler(struct exynos_drm_crtc *crtc)
@@ -475,7 +427,6 @@ err:
 static struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.enable			= decon_enable,
 	.disable		= decon_disable,
-	.commit			= decon_commit,
 	.enable_vblank		= decon_enable_vblank,
 	.disable_vblank		= decon_disable_vblank,
 	.atomic_begin		= decon_atomic_begin,
@@ -602,7 +553,6 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->suspended = true;
 	ctx->dev = dev;
 	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
 		ctx->i80_if = true;
@@ -669,6 +619,44 @@ static int exynos5433_decon_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos5433_decon_suspend(struct device *dev)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++)
+		clk_disable_unprepare(ctx->clks[i]);
+
+	return 0;
+}
+
+static int exynos5433_decon_resume(struct device *dev)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
+		ret = clk_prepare_enable(ctx->clks[i]);
+		if (ret < 0)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (--i >= 0)
+		clk_disable_unprepare(ctx->clks[i]);
+
+	return ret;
+}
+#endif
+
+static const struct dev_pm_ops exynos5433_decon_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos5433_decon_suspend, exynos5433_decon_resume,
+			   NULL)
+};
+
 static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
 	{ .compatible = "samsung,exynos5433-decon" },
 	{},
@@ -680,6 +668,7 @@ struct platform_driver exynos5433_decon_driver = {
 	.remove		= exynos5433_decon_remove,
 	.driver		= {
 		.name	= "exynos5433-decon",
+		.pm	= &exynos5433_decon_pm_ops,
 		.of_match_table = exynos5433_decon_driver_dt_match,
 	},
 };
-- 
2.1.0

From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2] drm/exynos: decon: clean up interface type
Date: Tue, 12 Apr 2016 15:21:35 +0900
Message-ID: <1460442095-3592-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33694 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755795AbcDLGVv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 02:21:51 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O5I01W1VCCCOK00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2016 15:21:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch cleans up interface type relevant codes.

Trigger mode is determinded only by i80 mode, which isn't
related to Display types - HDMI or Display controller.
So this patch makes the trigger mode to be set only in case of
i80 mode - For DECON-TV, HW Trigger mode is flaged mandatorily
because HDMI Timing Generator generates VSYNC signal
which works as a hardware trigger.

Changelog v2.
- If interface type is HDMI then set out_type to I80.
- fix compile warning.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 57 ++++++++++++++-------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 5245bc5..eacbb73 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -28,6 +28,10 @@
 #define WINDOWS_NR	3
 #define MIN_FB_WIDTH_FOR_16WORD_BURST	128
 
+#define IFTYPE_I80	(1 << 0)
+#define I80_HW_TRG	(1 << 1)
+#define IFTYPE_HDMI	(1 << 2)
+
 static const char * const decon_clks_name[] = {
 	"pclk",
 	"aclk_decon",
@@ -38,12 +42,6 @@ static const char * const decon_clks_name[] = {
 	"sclk_decon_eclk",
 };
 
-enum decon_iftype {
-	IFTYPE_RGB,
-	IFTYPE_I80,
-	IFTYPE_HDMI
-};
-
 enum decon_flag_bits {
 	BIT_CLKS_ENABLED,
 	BIT_IRQS_ENABLED,
@@ -61,7 +59,7 @@ struct decon_context {
 	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
 	int				pipe;
 	unsigned long			flags;
-	enum decon_iftype		out_type;
+	unsigned long			out_type;
 	int				first_win;
 };
 
@@ -95,7 +93,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 
 	if (!test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
 		val = VIDINTCON0_INTEN;
-		if (ctx->out_type == IFTYPE_I80)
+		if (ctx->out_type & IFTYPE_I80)
 			val |= VIDINTCON0_FRAMEDONE;
 		else
 			val |= VIDINTCON0_INTFRMEN;
@@ -119,7 +117,7 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 
 static void decon_setup_trigger(struct decon_context *ctx)
 {
-	u32 val = (ctx->out_type != IFTYPE_HDMI)
+	u32 val = !(ctx->out_type & I80_HW_TRG)
 		? TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
 		  TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
 		: TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
@@ -136,7 +134,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	if (ctx->out_type == IFTYPE_HDMI) {
+	if (ctx->out_type & IFTYPE_HDMI) {
 		m->crtc_hsync_start = m->crtc_hdisplay + 10;
 		m->crtc_hsync_end = m->crtc_htotal - 92;
 		m->crtc_vsync_start = m->crtc_vdisplay + 1;
@@ -151,17 +149,20 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 
 	/* lcd on and use command if */
 	val = VIDOUT_LCD_ON;
-	if (ctx->out_type == IFTYPE_I80)
+	if (ctx->out_type & IFTYPE_I80) {
 		val |= VIDOUT_COMMAND_IF;
-	else
+		decon_setup_trigger(ctx);
+	} else {
 		val |= VIDOUT_RGB_IF;
+	}
+
 	writel(val, ctx->addr + DECON_VIDOUTCON0);
 
 	val = VIDTCON2_LINEVAL(m->vdisplay - 1) |
 		VIDTCON2_HOZVAL(m->hdisplay - 1);
 	writel(val, ctx->addr + DECON_VIDTCON2);
 
-	if (ctx->out_type != IFTYPE_I80) {
+	if (!(ctx->out_type & IFTYPE_I80)) {
 		val = VIDTCON00_VBPD_F(
 				m->crtc_vtotal - m->crtc_vsync_end - 1) |
 			VIDTCON00_VFPD_F(
@@ -183,8 +184,6 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 		writel(val, ctx->addr + DECON_VIDTCON11);
 	}
 
-	decon_setup_trigger(ctx);
-
 	/* enable output and display signal */
 	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_ENVID_F, ~0);
 }
@@ -300,7 +299,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	val = dma_addr + pitch * state->src.h;
 	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
 
-	if (ctx->out_type != IFTYPE_HDMI)
+	if (!(ctx->out_type & IFTYPE_HDMI))
 		val = BIT_VAL(pitch - state->crtc.w * bpp, 27, 14)
 			| BIT_VAL(state->crtc.w * bpp, 13, 0);
 	else
@@ -348,7 +347,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 	for (i = ctx->first_win; i < WINDOWS_NR; i++)
 		decon_shadow_protect_win(ctx, i, false);
 
-	if (ctx->out_type == IFTYPE_I80)
+	if (ctx->out_type & IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
 }
 
@@ -374,7 +373,7 @@ static void decon_swreset(struct decon_context *ctx)
 
 	WARN(tries == 0, "failed to software reset DECON\n");
 
-	if (ctx->out_type != IFTYPE_HDMI)
+	if (!(ctx->out_type & IFTYPE_HDMI))
 		return;
 
 	writel(VIDCON0_CLKVALUP | VIDCON0_VLCKFREE, ctx->addr + DECON_VIDCON0);
@@ -383,7 +382,9 @@ static void decon_swreset(struct decon_context *ctx)
 	writel(VIDCON1_VCLK_RUN_VDEN_DISABLE, ctx->addr + DECON_VIDCON1);
 	writel(CRCCTRL_CRCEN | CRCCTRL_CRCSTART_F | CRCCTRL_CRCCLKEN,
 	       ctx->addr + DECON_CRCCTRL);
-	decon_setup_trigger(ctx);
+
+	if (ctx->out_type & IFTYPE_I80)
+		decon_setup_trigger(ctx);
 }
 
 static void decon_enable(struct exynos_drm_crtc *crtc)
@@ -509,7 +510,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	exynos_plane = &ctx->planes[ctx->first_win];
-	out_type = (ctx->out_type == IFTYPE_HDMI) ? EXYNOS_DISPLAY_TYPE_HDMI
+	out_type = (ctx->out_type & IFTYPE_HDMI) ? EXYNOS_DISPLAY_TYPE_HDMI
 						  : EXYNOS_DISPLAY_TYPE_LCD;
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 					ctx->pipe, out_type,
@@ -617,11 +618,11 @@ static const struct dev_pm_ops exynos5433_decon_pm_ops = {
 static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
 	{
 		.compatible = "samsung,exynos5433-decon",
-		.data = (void *)IFTYPE_RGB
+		.data = (void *)I80_HW_TRG
 	},
 	{
 		.compatible = "samsung,exynos5433-decon-tv",
-		.data = (void *)IFTYPE_HDMI
+		.data = (void *)(I80_HW_TRG | IFTYPE_HDMI)
 	},
 	{},
 };
@@ -644,12 +645,14 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	ctx->dev = dev;
 
 	of_id = of_match_device(exynos5433_decon_driver_dt_match, &pdev->dev);
-	ctx->out_type = (enum decon_iftype)of_id->data;
+	ctx->out_type = (unsigned long)of_id->data;
 
-	if (ctx->out_type == IFTYPE_HDMI)
+	if (ctx->out_type & IFTYPE_HDMI) {
 		ctx->first_win = 1;
-	else if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
-		ctx->out_type = IFTYPE_I80;
+		ctx->out_type |= IFTYPE_I80;
+	} else if (of_get_child_by_name(dev->of_node, "i80-if-timings")) {
+		ctx->out_type |= IFTYPE_I80;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
 		struct clk *clk;
@@ -674,7 +677,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-			(ctx->out_type == IFTYPE_I80) ? "lcd_sys" : "vsync");
+			(ctx->out_type & IFTYPE_I80) ? "lcd_sys" : "vsync");
 	if (!res) {
 		dev_err(dev, "cannot find IRQ resource\n");
 		return -ENXIO;
-- 
1.9.1

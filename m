From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 10/10] drm/exynos/decon5433: add support for DECON-TV
Date: Tue, 20 Oct 2015 11:22:41 +0200
Message-ID: <1445332961-25419-11-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46489 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752724AbbJTJXf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 05:23:35 -0400
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

DECON-TV IP is responsible for generating video stream which is transferred
to HDMI IP. It is almost fully compatible with DECON IP.

The patch is based on initial work of Hyungwon Hwang.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 154 ++++++++++++++++----------
 include/video/exynos5433_decon.h              |  29 +++++
 2 files changed, 122 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 3c9aa4e..fbe1b31 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 
@@ -37,6 +38,12 @@ static const char * const decon_clks_name[] = {
 	"sclk_decon_eclk",
 };
 
+enum decon_iftype {
+	IFTYPE_RGB,
+	IFTYPE_I80,
+	IFTYPE_HDMI
+};
+
 enum decon_flag_bits {
 	BIT_CLKS_ENABLED,
 	BIT_IRQS_ENABLED,
@@ -53,7 +60,8 @@ struct decon_context {
 	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
 	int				pipe;
 	unsigned long			flags;
-	bool				i80_if;
+	enum decon_iftype		out_type;
+	int				first_win;
 };
 
 static const uint32_t decon_formats[] = {
@@ -80,7 +88,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 
 	if (test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
 		val = VIDINTCON0_INTEN;
-		if (ctx->i80_if)
+		if (ctx->out_type == IFTYPE_I80)
 			val |= VIDINTCON0_FRAMEDONE;
 		else
 			val |= VIDINTCON0_INTFRMEN;
@@ -104,8 +112,11 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 
 static void decon_setup_trigger(struct decon_context *ctx)
 {
-	u32 val = TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
-			TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN;
+	u32 val = (ctx->out_type != IFTYPE_HDMI)
+		? TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
+		  TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
+		: TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
+		  TRIGCON_HWTRIGMASK_I80_RGB | TRIGCON_HWTRIGEN_I80_RGB;
 	writel(val, ctx->addr + DECON_TRIGCON);
 }
 
@@ -118,13 +129,22 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
+	if (ctx->out_type == IFTYPE_HDMI) {
+		m->crtc_hsync_start = m->crtc_hdisplay + 10;
+		m->crtc_hsync_end = m->crtc_htotal - 92;
+		m->crtc_vsync_start = m->crtc_vdisplay + 1;
+		m->crtc_vsync_end = m->crtc_vsync_start + 1;
+	}
+
+	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID, 0);
+
 	/* enable clock gate */
 	val = CMU_CLKGAGE_MODE_SFR_F | CMU_CLKGAGE_MODE_MEM_F;
 	writel(val, ctx->addr + DECON_CMU);
 
 	/* lcd on and use command if */
 	val = VIDOUT_LCD_ON;
-	if (ctx->i80_if)
+	if (ctx->out_type == IFTYPE_I80)
 		val |= VIDOUT_COMMAND_IF;
 	else
 		val |= VIDOUT_RGB_IF;
@@ -134,7 +154,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 		VIDTCON2_HOZVAL(m->hdisplay - 1);
 	writel(val, ctx->addr + DECON_VIDTCON2);
 
-	if (!ctx->i80_if) {
+	if (ctx->out_type != IFTYPE_I80) {
 		val = VIDTCON00_VBPD_F(
 				m->crtc_vtotal - m->crtc_vsync_end - 1) |
 			VIDTCON00_VFPD_F(
@@ -159,15 +179,9 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	decon_setup_trigger(ctx);
 
 	/* enable output and display signal */
-	val = VIDCON0_ENVID | VIDCON0_ENVID_F;
-	writel(val, ctx->addr + DECON_VIDCON0);
+	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_ENVID_F, ~0);
 }
 
-#define COORDINATE_X(x)		(((x) & 0xfff) << 12)
-#define COORDINATE_Y(x)		((x) & 0xfff)
-#define OFFSIZE(x)		(((x) & 0x3fff) << 14)
-#define PAGEWIDTH(x)		((x) & 0x3fff)
-
 static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 				 struct drm_framebuffer *fb)
 {
@@ -238,6 +252,10 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 	decon_shadow_protect_win(ctx, plane->zpos, true);
 }
 
+#define BIT_VAL(x, e, s) (((x) & ((1 << ((e) - (s) + 1)) - 1)) << (s))
+#define COORDINATE_X(x) BIT_VAL((x), 23, 12)
+#define COORDINATE_Y(x) BIT_VAL((x), 11, 0)
+
 static void decon_update_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
@@ -271,8 +289,12 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	val = plane->dma_addr[0] + pitch * plane->crtc_h;
 	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
 
-	val = OFFSIZE(pitch - plane->crtc_w * bpp)
-		| PAGEWIDTH(plane->crtc_w * bpp);
+	if (ctx->out_type != IFTYPE_HDMI)
+		val = BIT_VAL(pitch - plane->crtc_w * bpp, 27, 14)
+			| BIT_VAL(plane->crtc_w * bpp, 13, 0);
+	else
+		val = BIT_VAL(pitch - plane->crtc_w * bpp, 29, 15)
+			| BIT_VAL(plane->crtc_w * bpp, 14, 0);
 	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
 
 	decon_win_set_pixfmt(ctx, win, state->fb);
@@ -314,7 +336,7 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
 
 	decon_shadow_protect_win(ctx, plane->zpos, false);
 
-	if (ctx->i80_if)
+	if (ctx->out_type == IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
 }
 
@@ -339,6 +361,17 @@ static void decon_swreset(struct decon_context *ctx)
 	}
 
 	WARN(tries == 0, "failed to software reset DECON\n");
+
+	if (ctx->out_type != IFTYPE_HDMI)
+		return;
+
+	writel(VIDCON0_CLKVALUP | VIDCON0_VLCKFREE, ctx->addr + DECON_VIDCON0);
+	decon_set_bits(ctx, DECON_CMU,
+		       CMU_CLKGAGE_MODE_SFR_F | CMU_CLKGAGE_MODE_MEM_F, ~0);
+	writel(VIDCON1_VCLK_RUN_VDEN_DISABLE, ctx->addr + DECON_VIDCON1);
+	writel(CRCCTRL_CRCEN | CRCCTRL_CRCSTART_F | CRCCTRL_CRCCLKEN,
+	       ctx->addr + DECON_CRCCTRL);
+	decon_setup_trigger(ctx);
 }
 
 static void decon_enable(struct exynos_drm_crtc *crtc)
@@ -387,7 +420,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	 * suspend that connector. Otherwise we might try to scan from
 	 * a destroyed buffer later.
 	 */
-	for (i = 0; i < WINDOWS_NR; i++)
+	for (i = ctx->first_win; i < WINDOWS_NR; i++)
 		decon_disable_plane(crtc, &ctx->planes[i]);
 
 	decon_swreset(ctx);
@@ -461,25 +494,30 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct exynos_drm_plane *exynos_plane;
+	enum exynos_drm_output_type out_type;
 	enum drm_plane_type type;
-	unsigned int zpos;
+	unsigned int win;
 	int ret;
 
 	ctx->drm_dev = drm_dev;
 	ctx->pipe = priv->pipe++;
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = exynos_plane_get_type(zpos, CURSOR_WIN);
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
+	for (win = ctx->first_win; win < WINDOWS_NR; win++) {
+		int tmp = (win == ctx->first_win) ? 0 : win;
+
+		type = exynos_plane_get_type(tmp, CURSOR_WIN);
+		ret = exynos_plane_init(drm_dev, &ctx->planes[win],
 				1 << ctx->pipe, type, decon_formats,
-				ARRAY_SIZE(decon_formats), zpos);
+				ARRAY_SIZE(decon_formats), win);
 		if (ret)
 			return ret;
 	}
 
-	exynos_plane = &ctx->planes[DEFAULT_WIN];
+	exynos_plane = &ctx->planes[ctx->first_win];
+	out_type = (ctx->out_type == IFTYPE_HDMI) ? EXYNOS_DISPLAY_TYPE_HDMI
+						  : EXYNOS_DISPLAY_TYPE_LCD;
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
-					ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
+					ctx->pipe, out_type,
 					&decon_crtc_ops, ctx);
 	if (IS_ERR(ctx->crtc)) {
 		ret = PTR_ERR(ctx->crtc);
@@ -513,27 +551,7 @@ static const struct component_ops decon_component_ops = {
 	.unbind = decon_unbind,
 };
 
-static irqreturn_t decon_vsync_irq_handler(int irq, void *dev_id)
-{
-	struct decon_context *ctx = dev_id;
-	u32 val;
-
-	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags))
-		goto out;
-
-	val = readl(ctx->addr + DECON_VIDINTCON1);
-	if (val & VIDINTCON1_INTFRMPEND) {
-		drm_crtc_handle_vblank(&ctx->crtc->base);
-
-		/* clear */
-		writel(VIDINTCON1_INTFRMPEND, ctx->addr + DECON_VIDINTCON1);
-	}
-
-out:
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t decon_lcd_sys_irq_handler(int irq, void *dev_id)
+static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 {
 	struct decon_context *ctx = dev_id;
 	u32 val;
@@ -543,8 +561,10 @@ static irqreturn_t decon_lcd_sys_irq_handler(int irq, void *dev_id)
 		goto out;
 
 	val = readl(ctx->addr + DECON_VIDINTCON1);
-	if (val & VIDINTCON1_INTFRMDONEPEND) {
-		for (win = 0 ; win < WINDOWS_NR ; win++) {
+	val &= VIDINTCON1_INTFRMDONEPEND | VIDINTCON1_INTFRMPEND;
+
+	if (val) {
+		for (win = ctx->first_win; win < WINDOWS_NR ; win++) {
 			struct exynos_drm_plane *plane = &ctx->planes[win];
 
 			if (!plane->pending_fb)
@@ -554,16 +574,29 @@ static irqreturn_t decon_lcd_sys_irq_handler(int irq, void *dev_id)
 		}
 
 		/* clear */
-		writel(VIDINTCON1_INTFRMDONEPEND,
-				ctx->addr + DECON_VIDINTCON1);
+		writel(val, ctx->addr + DECON_VIDINTCON1);
 	}
 
 out:
 	return IRQ_HANDLED;
 }
 
+static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
+	{
+		.compatible = "samsung,exynos5433-decon",
+		.data = (void *)IFTYPE_RGB
+	},
+	{
+		.compatible = "samsung,exynos5433-decon-tv",
+		.data = (void *)IFTYPE_HDMI
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos5433_decon_driver_dt_match);
+
 static int exynos5433_decon_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *of_id;
 	struct device *dev = &pdev->dev;
 	struct decon_context *ctx;
 	struct resource *res;
@@ -576,8 +609,14 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 
 	__set_bit(BIT_SUSPENDED, &ctx->flags);
 	ctx->dev = dev;
-	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
-		ctx->i80_if = true;
+
+	of_id = of_match_device(exynos5433_decon_driver_dt_match, &pdev->dev);
+	ctx->out_type = (enum decon_iftype)of_id->data;
+
+	if (ctx->out_type == IFTYPE_HDMI)
+		ctx->first_win = 1;
+	else if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
+		ctx->out_type = IFTYPE_I80;
 
 	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
 		struct clk *clk;
@@ -602,15 +641,14 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-			ctx->i80_if ? "lcd_sys" : "vsync");
+			(ctx->out_type == IFTYPE_I80) ? "lcd_sys" : "vsync");
 	if (!res) {
 		dev_err(dev, "cannot find IRQ resource\n");
 		return -ENXIO;
 	}
 
-	ret = devm_request_irq(dev, res->start, ctx->i80_if ?
-			decon_lcd_sys_irq_handler : decon_vsync_irq_handler, 0,
-			"drm_decon", ctx);
+	ret = devm_request_irq(dev, res->start, decon_irq_handler, 0,
+			       "drm_decon", ctx);
 	if (ret < 0) {
 		dev_err(dev, "lcd_sys irq request failed\n");
 		return ret;
@@ -641,12 +679,6 @@ static int exynos5433_decon_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
-	{ .compatible = "samsung,exynos5433-decon" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, exynos5433_decon_driver_dt_match);
-
 struct platform_driver exynos5433_decon_driver = {
 	.probe		= exynos5433_decon_probe,
 	.remove		= exynos5433_decon_remove,
diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
index 3696575..c1c1ca1 100644
--- a/include/video/exynos5433_decon.h
+++ b/include/video/exynos5433_decon.h
@@ -82,6 +82,8 @@
 
 /* VIDCON0 */
 #define VIDCON0_SWRESET			(1 << 28)
+#define VIDCON0_CLKVALUP		(1 << 14)
+#define VIDCON0_VLCKFREE		(1 << 5)
 #define VIDCON0_STOP_STATUS		(1 << 2)
 #define VIDCON0_ENVID			(1 << 1)
 #define VIDCON0_ENVID_F			(1 << 0)
@@ -137,6 +139,13 @@
 /* DECON_UPDATE */
 #define STANDALONE_UPDATE_F		(1 << 0)
 
+/* DECON_VIDCON1 */
+#define VIDCON1_VCLK_MASK		(0x3 << 9)
+#define VIDCON1_VCLK_RUN_VDEN_DISABLE	(0x3 << 9)
+#define VIDCON1_VCLK_HOLD		(0x0 << 9)
+#define VIDCON1_VCLK_RUN		(0x1 << 9)
+
+
 /* DECON_VIDTCON00 */
 #define VIDTCON00_VBPD_F(x)		(((x) & 0xfff) << 16)
 #define VIDTCON00_VFPD_F(x)		((x) & 0xfff)
@@ -159,7 +168,27 @@
 #define TRIGCON_TRIGEN_PER_F		(1 << 31)
 #define TRIGCON_TRIGEN_F		(1 << 30)
 #define TRIGCON_TE_AUTO_MASK		(1 << 29)
+#define TRIGCON_WB_SWTRIGCMD		(1 << 28)
+#define TRIGCON_SWTRIGCMD_W4BUF		(1 << 26)
+#define TRIGCON_TRIGMODE_W4BUF		(1 << 25)
+#define TRIGCON_SWTRIGCMD_W3BUF		(1 << 21)
+#define TRIGCON_TRIGMODE_W3BUF		(1 << 20)
+#define TRIGCON_SWTRIGCMD_W2BUF		(1 << 16)
+#define TRIGCON_TRIGMODE_W2BUF		(1 << 15)
+#define TRIGCON_SWTRIGCMD_W1BUF		(1 << 11)
+#define TRIGCON_TRIGMODE_W1BUF		(1 << 10)
+#define TRIGCON_SWTRIGCMD_W0BUF		(1 << 6)
+#define TRIGCON_TRIGMODE_W0BUF		(1 << 5)
+#define TRIGCON_HWTRIGMASK_I80_RGB	(1 << 4)
+#define TRIGCON_HWTRIGEN_I80_RGB	(1 << 3)
+#define TRIGCON_HWTRIG_INV_I80_RGB	(1 << 2)
 #define TRIGCON_SWTRIGCMD		(1 << 1)
 #define TRIGCON_SWTRIGEN		(1 << 0)
 
+/* DECON_CRCCTRL */
+#define CRCCTRL_CRCCLKEN		(0x1 << 2)
+#define CRCCTRL_CRCSTART_F		(0x1 << 1)
+#define CRCCTRL_CRCEN			(0x1 << 0)
+#define CRCCTRL_MASK			(0x7)
+
 #endif /* EXYNOS_REGS_DECON_H */
-- 
1.9.1

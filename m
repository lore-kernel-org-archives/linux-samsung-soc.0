From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/7] drm/exynos/decon5433: use mode info stored in CRTC to
 detect i80 mode
Date: Tue, 18 Apr 2017 14:40:02 +0200
Message-ID: <1492519203-23537-7-git-send-email-a.hajda@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
 <CGME20170418124014eucas1p1d2048b0f624f0536a35c3be7f20026b6@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24193 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753094AbdDRMkU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 08:40:20 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOL00GCQV71W890@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Apr 2017 13:40:15 +0100 (BST)
In-reply-to: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Since panel's mode of work is propagated properly from panel to DECON,
there is no need to use redundant private property. The only issue with
such approach is that check for required interrupts should be postponed
until panel communicate its requirements - ie to atomic_check.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 98 ++++++++++++++++-----------
 1 file changed, 57 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 237b4c9..7a09e03 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -34,9 +34,8 @@
 #define WINDOWS_NR	3
 #define MIN_FB_WIDTH_FOR_16WORD_BURST	128
 
-#define IFTYPE_I80	(1 << 0)
-#define I80_HW_TRG	(1 << 1)
-#define IFTYPE_HDMI	(1 << 2)
+#define I80_HW_TRG	(1 << 0)
+#define IFTYPE_HDMI	(1 << 1)
 
 static const char * const decon_clks_name[] = {
 	"pclk",
@@ -58,7 +57,9 @@ struct decon_context {
 	struct regmap			*sysreg;
 	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
 	unsigned int			irq;
-	unsigned int			te_irq;
+	unsigned int			irq_vsync;
+	unsigned int			irq_lcd_sys;
+	unsigned int			irq_te;
 	unsigned long			out_type;
 	int				first_win;
 	spinlock_t			vblank_lock;
@@ -91,7 +92,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	u32 val;
 
 	val = VIDINTCON0_INTEN;
-	if (ctx->out_type & IFTYPE_I80)
+	if (crtc->i80_mode)
 		val |= VIDINTCON0_FRAMEDONE;
 	else
 		val |= VIDINTCON0_INTFRMEN | VIDINTCON0_FRAMESEL_FP;
@@ -100,7 +101,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 
 	enable_irq(ctx->irq);
 	if (!(ctx->out_type & I80_HW_TRG))
-		enable_irq(ctx->te_irq);
+		enable_irq(ctx->irq_te);
 
 	return 0;
 }
@@ -110,7 +111,7 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 
 	if (!(ctx->out_type & I80_HW_TRG))
-		disable_irq_nosync(ctx->te_irq);
+		disable_irq_nosync(ctx->irq_te);
 	disable_irq_nosync(ctx->irq);
 
 	writel(0, ctx->addr + DECON_VIDINTCON0);
@@ -140,7 +141,7 @@ static u32 decon_get_frame_count(struct decon_context *ctx, bool end)
 
 	switch (status & (VIDCON1_VSTATUS_MASK | VIDCON1_I80_ACTIVE)) {
 	case VIDCON1_VSTATUS_VS:
-		if (!(ctx->out_type & IFTYPE_I80))
+		if (!(ctx->crtc->i80_mode))
 			--frm;
 		break;
 	case VIDCON1_VSTATUS_BP:
@@ -167,7 +168,7 @@ static u32 decon_get_vblank_counter(struct exynos_drm_crtc *crtc)
 
 static void decon_setup_trigger(struct decon_context *ctx)
 {
-	if (!(ctx->out_type & (IFTYPE_I80 | I80_HW_TRG)))
+	if (!ctx->crtc->i80_mode && !(ctx->out_type & I80_HW_TRG))
 		return;
 
 	if (!(ctx->out_type & I80_HW_TRG)) {
@@ -207,7 +208,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	val = VIDOUT_LCD_ON;
 	if (interlaced)
 		val |= VIDOUT_INTERLACE_EN_F;
-	if (ctx->out_type & IFTYPE_I80) {
+	if (crtc->i80_mode) {
 		val |= VIDOUT_COMMAND_IF;
 	} else {
 		val |= VIDOUT_RGB_IF;
@@ -223,7 +224,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 			VIDTCON2_HOZVAL(m->hdisplay - 1);
 	writel(val, ctx->addr + DECON_VIDTCON2);
 
-	if (!(ctx->out_type & IFTYPE_I80)) {
+	if (!crtc->i80_mode) {
 		int vbp = m->crtc_vtotal - m->crtc_vsync_end;
 		int vfp = m->crtc_vsync_start - m->crtc_vdisplay;
 
@@ -456,7 +457,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	int i;
 
 	if (!(ctx->out_type & I80_HW_TRG))
-		synchronize_irq(ctx->te_irq);
+		synchronize_irq(ctx->irq_te);
 	synchronize_irq(ctx->irq);
 
 	/*
@@ -511,6 +512,22 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 		clk_disable_unprepare(ctx->clks[i]);
 }
 
+static int decon_atomic_check(struct exynos_drm_crtc *crtc,
+		struct drm_crtc_state *state)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	ctx->irq = crtc->i80_mode ? ctx->irq_lcd_sys : ctx->irq_vsync;
+
+	if (ctx->irq)
+		return 0;
+
+	dev_err(ctx->dev, "Panel requires %s mode, but appropriate interrupt is not provided.\n",
+			crtc->i80_mode ? "command" : "video");
+
+	return -EINVAL;
+}
+
 static const struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.enable			= decon_enable,
 	.disable		= decon_disable,
@@ -521,6 +538,7 @@ static const struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.update_plane		= decon_update_plane,
 	.disable_plane		= decon_disable_plane,
 	.atomic_flush		= decon_atomic_flush,
+	.atomic_check		= decon_atomic_check,
 };
 
 static int decon_bind(struct device *dev, struct device *master, void *data)
@@ -670,19 +688,22 @@ static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
 MODULE_DEVICE_TABLE(of, exynos5433_decon_driver_dt_match);
 
 static int decon_conf_irq(struct decon_context *ctx, const char *name,
-		irq_handler_t handler, unsigned long int flags, bool required)
+		irq_handler_t handler, unsigned long int flags)
 {
 	struct platform_device *pdev = to_platform_device(ctx->dev);
 	int ret, irq = platform_get_irq_byname(pdev, name);
 
 	if (irq < 0) {
-		if (irq == -EPROBE_DEFER)
+		switch (irq) {
+		case -EPROBE_DEFER:
+			return irq;
+		case -ENODATA:
+		case -ENXIO:
+			return 0;
+		default:
+			dev_err(ctx->dev, "IRQ %s get failed, %d\n", name, irq);
 			return irq;
-		if (required)
-			dev_err(ctx->dev, "cannot get %s IRQ\n", name);
-		else
-			irq = 0;
-		return irq;
+		}
 	}
 	irq_set_status_flags(irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(ctx->dev, irq, handler, flags, "drm_decon", ctx);
@@ -710,11 +731,8 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	ctx->out_type = (unsigned long)of_device_get_match_data(dev);
 	spin_lock_init(&ctx->vblank_lock);
 
-	if (ctx->out_type & IFTYPE_HDMI) {
+	if (ctx->out_type & IFTYPE_HDMI)
 		ctx->first_win = 1;
-	} else if (of_get_child_by_name(dev->of_node, "i80-if-timings")) {
-		ctx->out_type |= IFTYPE_I80;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
 		struct clk *clk;
@@ -738,25 +756,23 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 		return PTR_ERR(ctx->addr);
 	}
 
-	if (ctx->out_type & IFTYPE_I80) {
-		ret = decon_conf_irq(ctx, "lcd_sys", decon_irq_handler, 0, true);
-		if (ret < 0)
-			return ret;
-		ctx->irq = ret;
+	ret = decon_conf_irq(ctx, "vsync", decon_irq_handler, 0);
+	if (ret < 0)
+		return ret;
+	ctx->irq_vsync = ret;
 
-		ret = decon_conf_irq(ctx, "te", decon_te_irq_handler,
-				     IRQF_TRIGGER_RISING, false);
-		if (ret < 0)
-			return ret;
-		if (ret) {
-			ctx->te_irq = ret;
-			ctx->out_type &= ~I80_HW_TRG;
-		}
-	} else {
-		ret = decon_conf_irq(ctx, "vsync", decon_irq_handler, 0, true);
-		if (ret < 0)
-			return ret;
-		ctx->irq = ret;
+	ret = decon_conf_irq(ctx, "lcd_sys", decon_irq_handler, 0);
+	if (ret < 0)
+		return ret;
+	ctx->irq_lcd_sys = ret;
+
+	ret = decon_conf_irq(ctx, "te", decon_te_irq_handler,
+			IRQF_TRIGGER_RISING);
+	if (ret < 0)
+		return ret;
+	if (ret) {
+		ctx->irq_te = ret;
+		ctx->out_type &= ~I80_HW_TRG;
 	}
 
 	if (ctx->out_type & I80_HW_TRG) {
-- 
2.7.4

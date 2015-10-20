From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 07/10] drm/exynos/decon5433: merge different flag fields
Date: Tue, 20 Oct 2015 11:22:38 +0200
Message-ID: <1445332961-25419-8-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38215 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753468AbbJTJX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 05:23:29 -0400
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

Driver uses four different fields for internal flags. They can be merged
into one.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 61 +++++++++++++--------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 722c11a..265a77f 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -37,6 +37,13 @@ static const char * const decon_clks_name[] = {
 	"sclk_decon_eclk",
 };
 
+enum decon_flag_bits {
+	BIT_CLKS_ENABLED,
+	BIT_IRQS_ENABLED,
+	BIT_WIN_UPDATED,
+	BIT_SUSPENDED
+};
+
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
@@ -44,15 +51,9 @@ struct decon_context {
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	void __iomem			*addr;
 	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
-	unsigned long			irq_flags;
 	int				pipe;
-	bool				suspended;
-
-#define BIT_CLKS_ENABLED		0
-#define BIT_IRQS_ENABLED		1
-	unsigned long			enabled;
+	unsigned long			flags;
 	bool				i80_if;
-	atomic_t			win_updated;
 };
 
 static const uint32_t decon_formats[] = {
@@ -74,10 +75,10 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return -EPERM;
 
-	if (test_and_set_bit(0, &ctx->irq_flags)) {
+	if (test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
 		val = VIDINTCON0_INTEN;
 		if (ctx->i80_if)
 			val |= VIDINTCON0_FRAMEDONE;
@@ -94,10 +95,10 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	if (test_and_clear_bit(0, &ctx->irq_flags))
+	if (test_and_clear_bit(BIT_IRQS_ENABLED, &ctx->flags))
 		writel(0, ctx->addr + DECON_VIDINTCON0);
 }
 
@@ -114,7 +115,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	struct drm_display_mode *m = &crtc->base.mode;
 	u32 val;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
 	/* enable clock gate */
@@ -231,7 +232,7 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
 	decon_shadow_protect_win(ctx, plane->zpos, true);
@@ -247,7 +248,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int pitch = state->fb->pitches[0];
 	u32 val;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
 	val = COORDINATE_X(plane->crtc_x) | COORDINATE_Y(plane->crtc_y);
@@ -289,7 +290,7 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	struct decon_context *ctx = crtc->ctx;
 	unsigned int win = plane->zpos;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
 	decon_shadow_protect_win(ctx, win, true);
@@ -308,13 +309,13 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
 	decon_shadow_protect_win(ctx, plane->zpos, false);
 
 	if (ctx->i80_if)
-		atomic_set(&ctx->win_updated, 1);
+		set_bit(BIT_WIN_UPDATED, &ctx->flags);
 }
 
 static void decon_swreset(struct decon_context *ctx)
@@ -346,11 +347,9 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 	int ret;
 	int i;
 
-	if (!ctx->suspended)
+	if (!test_and_clear_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	ctx->suspended = false;
-
 	pm_runtime_get_sync(ctx->dev);
 
 	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++) {
@@ -359,10 +358,10 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 			goto err;
 	}
 
-	set_bit(BIT_CLKS_ENABLED, &ctx->enabled);
+	set_bit(BIT_CLKS_ENABLED, &ctx->flags);
 
 	/* if vblank was enabled status, enable it again. */
-	if (test_and_clear_bit(0, &ctx->irq_flags))
+	if (test_and_clear_bit(BIT_IRQS_ENABLED, &ctx->flags))
 		decon_enable_vblank(ctx->crtc);
 
 	decon_commit(ctx->crtc);
@@ -372,7 +371,7 @@ err:
 	while (--i >= 0)
 		clk_disable_unprepare(ctx->clks[i]);
 
-	ctx->suspended = true;
+	set_bit(BIT_SUSPENDED, &ctx->flags);
 }
 
 static void decon_disable(struct exynos_drm_crtc *crtc)
@@ -380,7 +379,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	int i;
 
-	if (ctx->suspended)
+	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
 	/*
@@ -396,21 +395,21 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < ARRAY_SIZE(decon_clks_name); i++)
 		clk_disable_unprepare(ctx->clks[i]);
 
-	clear_bit(BIT_CLKS_ENABLED, &ctx->enabled);
+	clear_bit(BIT_CLKS_ENABLED, &ctx->flags);
 
 	pm_runtime_put_sync(ctx->dev);
 
-	ctx->suspended = true;
+	set_bit(BIT_SUSPENDED, &ctx->flags);
 }
 
 void decon_te_irq_handler(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
+	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags))
 		return;
 
-	if (atomic_add_unless(&ctx->win_updated, -1, 0))
+	if (test_and_clear_bit(BIT_WIN_UPDATED, &ctx->flags))
 		decon_set_bits(ctx, DECON_TRIGCON, TRIGCON_SWTRIGCMD, ~0);
 
 	drm_crtc_handle_vblank(&ctx->crtc->base);
@@ -520,7 +519,7 @@ static irqreturn_t decon_vsync_irq_handler(int irq, void *dev_id)
 	struct decon_context *ctx = dev_id;
 	u32 val;
 
-	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
+	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags))
 		goto out;
 
 	val = readl(ctx->addr + DECON_VIDINTCON1);
@@ -541,7 +540,7 @@ static irqreturn_t decon_lcd_sys_irq_handler(int irq, void *dev_id)
 	u32 val;
 	int win;
 
-	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
+	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags))
 		goto out;
 
 	val = readl(ctx->addr + DECON_VIDINTCON1);
@@ -576,7 +575,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->suspended = true;
+	__set_bit(BIT_SUSPENDED, &ctx->flags);
 	ctx->dev = dev;
 	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
 		ctx->i80_if = true;
-- 
1.9.1

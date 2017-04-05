From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 8/9] drm/exynos/decon5433: kill BIT_SUSPENDED flag
Date: Wed, 05 Apr 2017 09:28:36 +0200
Message-ID: <1491377317-8042-9-git-send-email-a.hajda@samsung.com>
References: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
 <CGME20170405072845eucas1p2d8c7305eddf3cb92869e3449e9511ce4@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28484 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753993AbdDEH24 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:28:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00B9YE3Y9J20@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 08:28:46 +0100 (BST)
In-reply-to: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Exynos tracked suspend state to prevent touching disabled HW. After
fixing disable order in HDMI and moving TE handling to DECON it is
not needed anymore - all IRQ handlers and callbacks touching HW
are called only with enabled DECON.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 38 ---------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index b81c12b..1cb4b86 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -47,10 +47,6 @@ static const char * const decon_clks_name[] = {
 	"sclk_decon_eclk",
 };
 
-enum decon_flag_bits {
-	BIT_SUSPENDED
-};
-
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
@@ -62,7 +58,6 @@ struct decon_context {
 	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
 	unsigned int			irq;
 	unsigned int			te_irq;
-	unsigned long			flags;
 	unsigned long			out_type;
 	int				first_win;
 	spinlock_t			vblank_lock;
@@ -94,9 +89,6 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	u32 val;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return -EPERM;
-
 	val = VIDINTCON0_INTEN;
 	if (ctx->out_type & IFTYPE_I80)
 		val |= VIDINTCON0_FRAMEDONE;
@@ -116,9 +108,6 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	if (!(ctx->out_type & I80_HW_TRG))
 		disable_irq_nosync(ctx->te_irq);
 	disable_irq_nosync(ctx->irq);
@@ -172,9 +161,6 @@ static u32 decon_get_vblank_counter(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return 0;
-
 	return decon_get_frame_count(ctx, false);
 }
 
@@ -205,9 +191,6 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	bool interlaced = false;
 	u32 val;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	if (ctx->out_type & IFTYPE_HDMI) {
 		m->crtc_hsync_start = m->crtc_hdisplay + 10;
 		m->crtc_hsync_end = m->crtc_htotal - 92;
@@ -331,9 +314,6 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	decon_shadow_protect(ctx, true);
 }
 
@@ -354,9 +334,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	dma_addr_t dma_addr = exynos_drm_fb_dma_addr(fb, 0);
 	u32 val;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	if (crtc->base.mode.flags & DRM_MODE_FLAG_INTERLACE) {
 		val = COORDINATE_X(state->crtc.x) |
 			COORDINATE_Y(state->crtc.y / 2);
@@ -407,9 +384,6 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	struct decon_context *ctx = crtc->ctx;
 	unsigned int win = plane->index;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
 }
 
@@ -418,9 +392,6 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 	struct decon_context *ctx = crtc->ctx;
 	unsigned long flags;
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	spin_lock_irqsave(&ctx->vblank_lock, flags);
 
 	decon_shadow_protect(ctx, false);
@@ -474,9 +445,6 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	if (!test_and_clear_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	pm_runtime_get_sync(ctx->dev);
 
 	exynos_drm_pipe_clk_enable(crtc, true);
@@ -495,9 +463,6 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 		synchronize_irq(ctx->te_irq);
 	synchronize_irq(ctx->irq);
 
-	if (test_bit(BIT_SUSPENDED, &ctx->flags))
-		return;
-
 	/*
 	 * We need to make sure that all windows are disabled before we
 	 * suspend that connector. Otherwise we might try to scan from
@@ -511,8 +476,6 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	exynos_drm_pipe_clk_enable(crtc, false);
 
 	pm_runtime_put_sync(ctx->dev);
-
-	set_bit(BIT_SUSPENDED, &ctx->flags);
 }
 
 static irqreturn_t decon_te_irq_handler(int irq, void *dev_id)
@@ -750,7 +713,6 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	__set_bit(BIT_SUSPENDED, &ctx->flags);
 	ctx->dev = dev;
 	ctx->out_type = (unsigned long)of_device_get_match_data(dev);
 	spin_lock_init(&ctx->vblank_lock);
-- 
2.7.4

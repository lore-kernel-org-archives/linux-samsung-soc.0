From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/9] drm/exynos/decon5433: kill BIT_CLKS_ENABLED flag
Date: Wed, 05 Apr 2017 09:28:34 +0200
Message-ID: <1491377317-8042-7-git-send-email-a.hajda@samsung.com>
References: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
 <CGME20170405072843eucas1p19e426556ce611b8c28715dd648478458@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14477 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753993AbdDEH2y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:28:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00JZTE3WD410@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 08:28:45 +0100 (BST)
In-reply-to: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

The flag was used to check if IRQ handlers can touch HW. Since driver
enables IRQs only if hardware is enabled the flag becomes redundant.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index dc2e69a..2629a59 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -48,7 +48,6 @@ static const char * const decon_clks_name[] = {
 };
 
 enum decon_flag_bits {
-	BIT_CLKS_ENABLED,
 	BIT_WIN_UPDATED,
 	BIT_SUSPENDED
 };
@@ -486,8 +485,6 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 
 	exynos_drm_pipe_clk_enable(crtc, true);
 
-	set_bit(BIT_CLKS_ENABLED, &ctx->flags);
-
 	decon_swreset(ctx);
 
 	decon_commit(ctx->crtc);
@@ -515,8 +512,6 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 
 	decon_swreset(ctx);
 
-	clear_bit(BIT_CLKS_ENABLED, &ctx->flags);
-
 	exynos_drm_pipe_clk_enable(crtc, false);
 
 	pm_runtime_put_sync(ctx->dev);
@@ -528,8 +523,7 @@ static irqreturn_t decon_te_irq_handler(int irq, void *dev_id)
 {
 	struct decon_context *ctx = dev_id;
 
-	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags) ||
-	    (ctx->out_type & I80_HW_TRG))
+	if (ctx->out_type & I80_HW_TRG)
 		return IRQ_HANDLED;
 
 	decon_set_bits(ctx, DECON_TRIGCON, TRIGCON_SWTRIGCMD, ~0);
@@ -654,9 +648,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 	struct decon_context *ctx = dev_id;
 	u32 val;
 
-	if (!test_bit(BIT_CLKS_ENABLED, &ctx->flags))
-		goto out;
-
 	val = readl(ctx->addr + DECON_VIDINTCON1);
 	val &= VIDINTCON1_INTFRMDONEPEND | VIDINTCON1_INTFRMPEND;
 
@@ -672,7 +663,6 @@ static irqreturn_t decon_irq_handler(int irq, void *dev_id)
 		decon_handle_vblank(ctx);
 	}
 
-out:
 	return IRQ_HANDLED;
 }
 
-- 
2.7.4

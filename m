From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/9] drm/exynos/decon5433: kill BIT_IRQS_ENABLED flag
Date: Wed, 05 Apr 2017 09:28:33 +0200
Message-ID: <1491377317-8042-6-git-send-email-a.hajda@samsung.com>
References: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
 <CGME20170405072843eucas1p1303d7f8b3fbb9339ff258121b503e7ed@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28484 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753791AbdDEH2z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:28:55 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00B9WE3W9J20@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 08:28:45 +0100 (BST)
In-reply-to: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Since DECON uses enable_irq/disable_irq to full control IRQs,
there is no point in having flags to trace it separately.
As a bonus condition for software trigger becomes always true,
so it can be removed.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 5bdf1a0..dc2e69a 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -49,7 +49,6 @@ static const char * const decon_clks_name[] = {
 
 enum decon_flag_bits {
 	BIT_CLKS_ENABLED,
-	BIT_IRQS_ENABLED,
 	BIT_WIN_UPDATED,
 	BIT_SUSPENDED
 };
@@ -112,8 +111,6 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	if (!(ctx->out_type & I80_HW_TRG))
 		enable_irq(ctx->te_irq);
 
-	set_bit(BIT_IRQS_ENABLED, &ctx->flags);
-
 	return 0;
 }
 
@@ -121,7 +118,6 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
-	clear_bit(BIT_IRQS_ENABLED, &ctx->flags);
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
@@ -536,9 +532,7 @@ static irqreturn_t decon_te_irq_handler(int irq, void *dev_id)
 	    (ctx->out_type & I80_HW_TRG))
 		return IRQ_HANDLED;
 
-	if (test_and_clear_bit(BIT_WIN_UPDATED, &ctx->flags) ||
-	    test_bit(BIT_IRQS_ENABLED, &ctx->flags))
-		decon_set_bits(ctx, DECON_TRIGCON, TRIGCON_SWTRIGCMD, ~0);
+	decon_set_bits(ctx, DECON_TRIGCON, TRIGCON_SWTRIGCMD, ~0);
 
 	return IRQ_HANDLED;
 }
-- 
2.7.4

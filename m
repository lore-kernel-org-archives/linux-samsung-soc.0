From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/9] drm/exynos/decon5433: always do sw-trigger when vblanks
 enabled
Date: Wed, 05 Apr 2017 09:28:29 +0200
Message-ID: <1491377317-8042-2-git-send-email-a.hajda@samsung.com>
References: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
 <CGME20170405072842eucas1p131cf311f5f6c368547e7fa5190193492@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14477 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753462AbdDEH2q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:28:46 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00KVPE3V0T10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 08:28:43 +0100 (BST)
In-reply-to: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

When vblanks are enabled userspace and/or kernel can expect vblank
interrupt at declared period of time. To generate vblank interrupt
image transfer must be triggered. This patch fixes vblank timeouts
in case of sw-trigger mode.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 42e8f8c..028a657 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -49,6 +49,7 @@ static const char * const decon_clks_name[] = {
 
 enum decon_flag_bits {
 	BIT_CLKS_ENABLED,
+	BIT_IRQS_ENABLED,
 	BIT_WIN_UPDATED,
 	BIT_SUSPENDED
 };
@@ -104,6 +105,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 		val |= VIDINTCON0_INTFRMEN | VIDINTCON0_FRAMESEL_FP;
 
 	writel(val, ctx->addr + DECON_VIDINTCON0);
+	set_bit(BIT_IRQS_ENABLED, &ctx->flags);
 
 	return 0;
 }
@@ -112,6 +114,7 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
+	clear_bit(BIT_IRQS_ENABLED, &ctx->flags);
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
@@ -518,7 +521,8 @@ static void decon_te_irq_handler(struct exynos_drm_crtc *crtc)
 	    (ctx->out_type & I80_HW_TRG))
 		return;
 
-	if (test_and_clear_bit(BIT_WIN_UPDATED, &ctx->flags))
+	if (test_and_clear_bit(BIT_WIN_UPDATED, &ctx->flags) ||
+	    test_bit(BIT_IRQS_ENABLED, &ctx->flags))
 		decon_set_bits(ctx, DECON_TRIGCON, TRIGCON_SWTRIGCMD, ~0);
 }
 
-- 
2.7.4

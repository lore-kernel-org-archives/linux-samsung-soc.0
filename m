From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/9] drm/exynos/decon5433: kill BIT_WIN_UPDATED flag
Date: Wed, 05 Apr 2017 09:28:35 +0200
Message-ID: <1491377317-8042-8-git-send-email-a.hajda@samsung.com>
References: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
 <CGME20170405072844eucas1p28b2de9bbc54b86a3787aa0f108ed975c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22733 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753462AbdDEH2s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:28:48 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00EY4E3X2510@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 08:28:45 +0100 (BST)
In-reply-to: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

The flag was used to trigger software update in TE IRQ handler only
if framebuffers were replaced. Since TE update is triggered always
when VBLANKs are enabled and after framebuffer replacement VBLANKs
are always enabled the flag becomes redundant.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 2629a59..b81c12b 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -48,7 +48,6 @@ static const char * const decon_clks_name[] = {
 };
 
 enum decon_flag_bits {
-	BIT_WIN_UPDATED,
 	BIT_SUSPENDED
 };
 
@@ -428,9 +427,6 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 
 	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 
-	if (ctx->out_type & IFTYPE_I80)
-		set_bit(BIT_WIN_UPDATED, &ctx->flags);
-
 	ctx->frame_id = decon_get_frame_count(ctx, true);
 
 	exynos_crtc_handle_event(crtc);
-- 
2.7.4

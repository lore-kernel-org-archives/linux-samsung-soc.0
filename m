From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2] drm/exynos/decon5433: set STANDALONE_UPDATE_F also if
 planes are disabled
Date: Fri, 13 Jan 2017 09:42:59 +0100
Message-ID: <1484296979-17195-1-git-send-email-a.hajda@samsung.com>
References: <1484295026-16435-1-git-send-email-a.hajda@samsung.com>
 <CGME20170113084308eucas1p24db5cafc0cc94556beaabfc4cfde8200@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12484 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751218AbdAMInM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 03:43:12 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJP0046OMVXI050@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jan 2017 08:43:09 +0000 (GMT)
In-reply-to: <1484295026-16435-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

STANDALONE_UPDATE_F should be set if something changed in plane configurations,
including plane disable.
The patch fixes page-faults bugs, caused by decon still using framebuffers
of disabled planes.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2: fixed clear-bit code (Thx Marek)
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index ef7fcb5..77a614d 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -46,7 +46,8 @@ enum decon_flag_bits {
 	BIT_CLKS_ENABLED,
 	BIT_IRQS_ENABLED,
 	BIT_WIN_UPDATED,
-	BIT_SUSPENDED
+	BIT_SUSPENDED,
+	BIT_REQUEST_UPDATE
 };
 
 struct decon_context {
@@ -313,6 +314,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	/* window enable */
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, ~0);
+	set_bit(BIT_REQUEST_UPDATE, &ctx->flags);
 }
 
 static void decon_disable_plane(struct exynos_drm_crtc *crtc,
@@ -325,6 +327,7 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 		return;
 
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
+	set_bit(BIT_REQUEST_UPDATE, &ctx->flags);
 }
 
 static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
@@ -339,8 +342,10 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 		decon_shadow_protect_win(ctx, i, false);
 
 	/* update iff there are active windows */
-	if (crtc->base.state->plane_mask)
+	if (test_bit(BIT_REQUEST_UPDATE, &ctx->flags)) {
 		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
+		clear_bit(BIT_REQUEST_UPDATE, &ctx->flags);
+	}
 
 	if (ctx->out_type & IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
-- 
2.7.4

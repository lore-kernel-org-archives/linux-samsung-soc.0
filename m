From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/7] drm/exynos/decon5433: do not protect window in plane
 disable
Date: Wed, 23 Mar 2016 14:15:18 +0100
Message-ID: <1458738918-32054-8-git-send-email-a.hajda@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55709 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755145AbcCWNPh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:15:37 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H002T4U5YCG90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:15:35 +0000 (GMT)
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

decon_atomic_begin and decon_atomic_flush protects all windows already.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 120efd8..c8c921c 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -329,12 +329,7 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	decon_shadow_protect_win(ctx, win, true);
-
-	/* window disable */
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
-
-	decon_shadow_protect_win(ctx, win, false);
 }
 
 static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
-- 
1.9.1

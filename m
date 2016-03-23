From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/7] drm/exynos/decon5433: fix DECON standalone update
Date: Wed, 23 Mar 2016 14:15:16 +0100
Message-ID: <1458738918-32054-6-git-send-email-a.hajda@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37550 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755559AbcCWNP5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:15:57 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00FSSU5XTS90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:15:33 +0000 (GMT)
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

DECON should be updated after un-protecting windows and after changing
output parameters, otherwise image is not displayed in case of HDMI path.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index ab9154e..7fec656 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -191,6 +191,8 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 
 	/* enable output and display signal */
 	decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_ENVID_F, ~0);
+
+	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 }
 
 static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
@@ -316,9 +318,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	/* window enable */
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, ~0);
-
-	/* standalone update */
-	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 }
 
 static void decon_disable_plane(struct exynos_drm_crtc *crtc,
@@ -336,9 +335,6 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
 
 	decon_shadow_protect_win(ctx, win, false);
-
-	/* standalone update */
-	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 }
 
 static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
@@ -352,6 +348,9 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 	for (i = ctx->first_win; i < WINDOWS_NR; i++)
 		decon_shadow_protect_win(ctx, i, false);
 
+	/* standalone update */
+	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
+
 	if (ctx->out_type == IFTYPE_I80)
 		set_bit(BIT_WIN_UPDATED, &ctx->flags);
 }
@@ -463,8 +462,10 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 		decon_shadow_protect_win(ctx, win, true);
 		decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
 		decon_shadow_protect_win(ctx, win, false);
-		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 	}
+
+	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
+
 	/* TODO: wait for possible vsync */
 	msleep(50);
 
-- 
1.9.1

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 05/22] drm/exynos: exynos7-decon: remove excessive check
Date: Mon, 30 Nov 2015 14:53:20 +0100
Message-ID: <1448891617-18830-6-git-send-email-m.szyprowski@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54549 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754043AbbK3Nxs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:48 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM009RXRXMABB0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:46 +0000 (GMT)
In-reply-to: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Display area is already checked by exynos plane core, so there is no
need for such check in driver code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 38d7762ebdcb..4db04f244c17 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -394,7 +394,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
 	struct drm_plane_state *state = plane->base.state;
 	int padding;
 	unsigned long val, alpha;
@@ -436,15 +435,6 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
 			plane->crtc_w, plane->crtc_h);
 
-	/*
-	 * OSD position.
-	 * In case the window layout goes of LCD layout, DECON fails.
-	 */
-	if ((plane->crtc_x + plane->crtc_w) > mode->hdisplay)
-		plane->crtc_x = mode->hdisplay - plane->crtc_w;
-	if ((plane->crtc_y + plane->crtc_h) > mode->vdisplay)
-		plane->crtc_y = mode->vdisplay - plane->crtc_h;
-
 	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
 		VIDOSDxA_TOPLEFT_Y(plane->crtc_y);
 	writel(val, ctx->regs + VIDOSD_A(win));
-- 
1.9.2

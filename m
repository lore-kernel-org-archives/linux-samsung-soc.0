From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 16/25] drm/exynos: mixer: use ratio precalculated in
 exynos_state
Date: Tue, 10 Nov 2015 14:23:32 +0100
Message-ID: <1447161821-1877-17-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11119 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753111AbbKJNY6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:58 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00GMRP9JV0A0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:55 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Common plane code already calculates and checks for supported scalling
modes, so additional code in mixer driver can be now removed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index cdec3c1827c6..467e98044751 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -531,33 +531,6 @@ static void mixer_layer_update(struct mixer_context *ctx)
 	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
 }
 
-static int mixer_setup_scale(const struct exynos_drm_plane *plane,
-		unsigned int *x_ratio, unsigned int *y_ratio)
-{
-	struct exynos_drm_plane_state *state =
-				to_exynos_plane_state(plane->base.state);
-
-	if (state->crtc.w != state->src.w) {
-		if (state->crtc.w == 2 * state->src.w)
-			*x_ratio = 1;
-		else
-			goto fail;
-	}
-
-	if (state->crtc.h != state->src.h) {
-		if (state->crtc.h == 2 * state->src.h)
-			*y_ratio = 1;
-		else
-			goto fail;
-	}
-
-	return 0;
-
-fail:
-	DRM_DEBUG_KMS("only 2x width/height scaling of plane supported\n");
-	return -ENOTSUPP;
-}
-
 static void mixer_graph_buffer(struct mixer_context *ctx,
 			       struct exynos_drm_plane *plane)
 {
@@ -597,9 +570,9 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 		return;
 	}
 
-	/* check if mixer supports requested scaling setup */
-	if (mixer_setup_scale(plane, &x_ratio, &y_ratio))
-		return;
+	/* ratio is already checked by common plane code */
+	x_ratio = state->h_ratio == (1 << 15);
+	y_ratio = state->v_ratio == (1 << 15);
 
 	dst_x_offset = state->crtc.x;
 	dst_y_offset = state->crtc.y;
-- 
1.9.2

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 7/7] drm/exynos: mixer: unify a check for video-processor
 window
Date: Wed, 16 Dec 2015 13:21:48 +0100
Message-ID: <1450268508-15028-8-git-send-email-m.szyprowski@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12880 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932862AbbLPMWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 07:22:19 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZG00IORAD3G480@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Dec 2015 12:22:16 +0000 (GMT)
In-reply-to: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Always use macro instead of hard-coded '2' value in conditions related
to video processor window. Additional checks are not needed, because
video layer is registered only when video processor is available.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 31a9a228744e..bf148dc3623c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -438,7 +438,7 @@ static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
 				    MXR_LAYER_CFG_GRP1_VAL(priority),
 				    MXR_LAYER_CFG_GRP1_MASK);
 		break;
-	case 2:
+	case VP_DEFAULT_WIN:
 		if (ctx->vp_enabled) {
 			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
 			mixer_reg_writemask(res, MXR_CFG, val,
@@ -990,7 +990,7 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc,
 	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
 		return;
 
-	if (plane->index > 1 && mixer_ctx->vp_enabled)
+	if (plane->index == VP_DEFAULT_WIN)
 		vp_video_buffer(mixer_ctx, plane);
 	else
 		mixer_graph_buffer(mixer_ctx, plane);
-- 
1.9.2

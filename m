From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] drm/exynos: mixer: properly update all planes on the same
 vblank event
Date: Tue, 05 Jan 2016 13:52:52 +0100
Message-ID: <1451998373-13708-4-git-send-email-m.szyprowski@samsung.com>
References: <1451998373-13708-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45707 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbcAEMxJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jan 2016 07:53:09 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0H00MXFD4IQO40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jan 2016 12:53:07 +0000 (GMT)
In-reply-to: <1451998373-13708-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

This patch also moves mixer_vsync_set_update() to newly introduced
mixer_atomic_begin/flush callbacks. This ensures that all mixer planes
will be updated on the same vsync event.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index bf148dc3623c..b5fbc1cbf024 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -516,7 +516,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	}
 
 	spin_lock_irqsave(&res->reg_slock, flags);
-	mixer_vsync_set_update(ctx, false);
 
 	/* interlace or progressive scan mode */
 	val = (ctx->interlace ? ~0 : 0);
@@ -567,7 +566,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	mixer_cfg_vp_blend(ctx);
 	mixer_run(ctx);
 
-	mixer_vsync_set_update(ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 
 	mixer_regs_dump(ctx);
@@ -642,7 +640,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 		ctx->interlace = false;
 
 	spin_lock_irqsave(&res->reg_slock, flags);
-	mixer_vsync_set_update(ctx, false);
 
 	/* setup format */
 	mixer_reg_writemask(res, MXR_GRAPHIC_CFG(win),
@@ -691,7 +688,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	mixer_run(ctx);
 
-	mixer_vsync_set_update(ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 
 	mixer_regs_dump(ctx);
@@ -718,7 +714,6 @@ static void mixer_win_reset(struct mixer_context *ctx)
 	unsigned long flags;
 
 	spin_lock_irqsave(&res->reg_slock, flags);
-	mixer_vsync_set_update(ctx, false);
 
 	mixer_reg_writemask(res, MXR_CFG, MXR_CFG_DST_HDMI, MXR_CFG_DST_MASK);
 
@@ -749,7 +744,6 @@ static void mixer_win_reset(struct mixer_context *ctx)
 	if (ctx->vp_enabled)
 		mixer_reg_writemask(res, MXR_CFG, 0, MXR_CFG_VP_ENABLE);
 
-	mixer_vsync_set_update(ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 }
 
@@ -980,6 +974,16 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
+static void mixer_atomic_begin(struct exynos_drm_crtc *crtc)
+{
+	struct mixer_context *mixer_ctx = crtc->ctx;
+
+	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
+		return;
+
+	mixer_vsync_set_update(mixer_ctx, false);
+}
+
 static void mixer_update_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
@@ -1009,12 +1013,18 @@ static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
 		return;
 
 	spin_lock_irqsave(&res->reg_slock, flags);
-	mixer_vsync_set_update(mixer_ctx, false);
-
 	mixer_cfg_layer(mixer_ctx, plane->index, 0, false);
+	spin_unlock_irqrestore(&res->reg_slock, flags);
+}
+
+static void mixer_atomic_flush(struct exynos_drm_crtc *crtc)
+{
+	struct mixer_context *mixer_ctx = crtc->ctx;
+
+	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
+		return;
 
 	mixer_vsync_set_update(mixer_ctx, true);
-	spin_unlock_irqrestore(&res->reg_slock, flags);
 }
 
 static void mixer_wait_for_vblank(struct exynos_drm_crtc *crtc)
@@ -1055,6 +1065,8 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 
 	pm_runtime_get_sync(ctx->dev);
 
+	mixer_vsync_set_update(ctx, false);
+
 	mixer_reg_writemask(res, MXR_STATUS, ~0, MXR_STATUS_SOFT_RESET);
 
 	if (test_bit(MXR_BIT_VSYNC, &ctx->flags)) {
@@ -1063,6 +1075,8 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 	}
 	mixer_win_reset(ctx);
 
+	mixer_vsync_set_update(ctx, true);
+
 	set_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
@@ -1113,8 +1127,10 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
 	.wait_for_vblank	= mixer_wait_for_vblank,
+	.atomic_begin		= mixer_atomic_begin,
 	.update_plane		= mixer_update_plane,
 	.disable_plane		= mixer_disable_plane,
+	.atomic_flush		= mixer_atomic_flush,
 	.atomic_check		= mixer_atomic_check,
 };
 
-- 
1.9.2

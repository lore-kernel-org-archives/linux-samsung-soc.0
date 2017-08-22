From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 8/9] drm/exynos: consistent use of cpp
Date: Tue, 22 Aug 2017 16:19:43 +0200
Message-ID: <20170822141944.8138-9-tjakobi@math.uni-bielefeld.de>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55885 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932513AbdHVOYV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 10:24:21 -0400
In-Reply-To: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

A recent commit (272725c7db4da1fd3229d944fc76d2e98e3a144e) has removed
the use of 'bits_per_pixel' in DRM. However the corresponding Exynos
driver code still uses the ambiguous 'bpp', even though it is now
initialized from fb->cpp[0].

Consistenly use 'cpp' in FIMD, DECON7 and DECON5433 drivers.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 12 ++++++------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  6 +++---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 62b50e0685b0..66ceca0af2a0 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -286,7 +286,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 		return;
 	}
 
-	DRM_DEBUG_KMS("bpp = %u\n", fb->format->cpp[0] * 8);
+	DRM_DEBUG_KMS("cpp = %u\n", fb->format->cpp[0]);
 
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
@@ -329,7 +329,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_framebuffer *fb = state->base.fb;
 	unsigned int win = plane->index;
-	unsigned int bpp = fb->format->cpp[0];
+	unsigned int cpp = fb->format->cpp[0];
 	unsigned int pitch = fb->pitches[0];
 	dma_addr_t dma_addr = exynos_drm_fb_dma_addr(fb, 0);
 	u32 val;
@@ -365,11 +365,11 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
 
 	if (!(ctx->out_type & IFTYPE_HDMI))
-		val = BIT_VAL(pitch - state->crtc.w * bpp, 27, 14)
-			| BIT_VAL(state->crtc.w * bpp, 13, 0);
+		val = BIT_VAL(pitch - state->crtc.w * cpp, 27, 14)
+			| BIT_VAL(state->crtc.w * cpp, 13, 0);
 	else
-		val = BIT_VAL(pitch - state->crtc.w * bpp, 29, 15)
-			| BIT_VAL(state->crtc.w * bpp, 14, 0);
+		val = BIT_VAL(pitch - state->crtc.w * cpp, 29, 15)
+			| BIT_VAL(state->crtc.w * cpp, 14, 0);
 	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
 
 	decon_win_set_pixfmt(ctx, win, fb);
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 3e88269fdc2e..4662d55ed988 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -321,7 +321,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 		break;
 	}
 
-	DRM_DEBUG_KMS("bpp = %d\n", fb->format->cpp[0] * 8);
+	DRM_DEBUG_KMS("cpp = %d\n", fb->format->cpp[0]);
 
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
@@ -398,7 +398,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned int last_x;
 	unsigned int last_y;
 	unsigned int win = plane->index;
-	unsigned int bpp = fb->format->cpp[0];
+	unsigned int cpp = fb->format->cpp[0];
 	unsigned int pitch = fb->pitches[0];
 
 	if (ctx->suspended)
@@ -418,7 +418,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	val = (unsigned long)exynos_drm_fb_dma_addr(fb, 0);
 	writel(val, ctx->regs + VIDW_BUF_START(win));
 
-	padding = (pitch / bpp) - fb->width;
+	padding = (pitch / cpp) - fb->width;
 
 	/* buffer size */
 	writel(fb->width + padding, ctx->regs + VIDW_WHOLE_X(win));
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e88597f6d356..9b83d1846589 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -718,13 +718,13 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
 	unsigned int win = plane->index;
-	unsigned int bpp = fb->format->cpp[0];
+	unsigned int cpp = fb->format->cpp[0];
 	unsigned int pitch = fb->pitches[0];
 
 	if (ctx->suspended)
 		return;
 
-	offset = state->src.x * bpp;
+	offset = state->src.x * cpp;
 	offset += state->src.y * pitch;
 
 	/* buffer start address */
@@ -743,8 +743,8 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 			state->crtc.w, state->crtc.h);
 
 	/* buffer size */
-	buf_offsize = pitch - (state->crtc.w * bpp);
-	line_size = state->crtc.w * bpp;
+	buf_offsize = pitch - (state->crtc.w * cpp);
+	line_size = state->crtc.w * cpp;
 	val = VIDW_BUF_SIZE_OFFSET(buf_offsize) |
 		VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
 		VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
-- 
2.13.0

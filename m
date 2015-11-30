From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 16/22] drm/exynos: add fb pointer to exynos_drm_plane_state
Date: Mon, 30 Nov 2015 14:53:31 +0100
Message-ID: <1448891617-18830-17-git-send-email-m.szyprowski@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:49874 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754257AbbK3Nx5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:57 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM00AUZRXT8QB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:53 +0000 (GMT)
In-reply-to: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Add framebuffer pointer to exynos_drm_plane_state and tell drivers to use
it. This lets common plane code to set temporary framebuffer in the
future and drivers will use it without additional changes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h       | 8 ++++++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 2 ++
 drivers/gpu/drm/exynos/exynos_mixer.c         | 4 ++--
 6 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 189ee5ca0a7a..1f705bede7dd 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -269,7 +269,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	struct exynos_drm_plane_state *state =
 				to_exynos_plane_state(plane->base.state);
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_framebuffer *fb = state->fb;
 	unsigned int win = plane->zpos;
 	unsigned int bpp = fb->bits_per_pixel >> 3;
 	unsigned int pitch = fb->pitches[0];
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index c47f9af8170b..17aa11702a40 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -402,7 +402,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	struct exynos_drm_plane_state *state =
 				to_exynos_plane_state(plane->base.state);
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_framebuffer *fb = state->fb;
 	int padding;
 	unsigned long val, alpha;
 	unsigned int last_x;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 82bbd7f4b316..bb2e449a20c3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -53,9 +53,12 @@ struct exynos_drm_rect {
  *       (clipped to visible part).
  * @h_ratio: horizontal scaling ratio, 16.16 fixed point
  * @v_ratio: vertical scaling ratio, 16.16 fixed point
+ * @fb: framebuffer with image data to be displayed (drivers should use this
+ *      instead of .base->fb)
  *
- * this structure consists plane state data that will be applied to hardware
- * specific overlay info.
+ * This structure consists plane state data that will be applied to hardware
+ * specific overlay info. Some data is duplicated (comparing with base state)
+ * to let common code to modify it for internal use.
  */
 
 struct exynos_drm_plane_state {
@@ -64,6 +67,7 @@ struct exynos_drm_plane_state {
 	struct exynos_drm_rect src;
 	unsigned int h_ratio;
 	unsigned int v_ratio;
+	struct drm_framebuffer *fb;
 };
 
 static inline struct exynos_drm_plane_state *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2e2247126581..0046495173f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -650,7 +650,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	struct exynos_drm_plane_state *state =
 				to_exynos_plane_state(plane->base.state);
 	struct fimd_context *ctx = crtc->ctx;
-	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_framebuffer *fb = state->fb;
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 427aeec78a28..8a1242b5a938 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -117,6 +117,8 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	exynos_state->crtc.w = actual_w;
 	exynos_state->crtc.h = actual_h;
 
+	exynos_state->fb = state->fb;
+
 	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
 			exynos_state->crtc.x, exynos_state->crtc.y,
 			exynos_state->crtc.w, exynos_state->crtc.h);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index dfb35e2da4db..787aa03f4359 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -425,7 +425,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 				to_exynos_plane_state(plane->base.state);
 	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
-	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_framebuffer *fb = state->fb;
 	unsigned long flags;
 	dma_addr_t luma_addr[2], chroma_addr[2];
 	bool tiled_mode = false;
@@ -535,7 +535,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 				to_exynos_plane_state(plane->base.state);
 	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
 	struct mixer_resources *res = &ctx->mixer_res;
-	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_framebuffer *fb = state->fb;
 	unsigned long flags;
 	unsigned int win = plane->zpos;
 	unsigned int x_ratio = 0, y_ratio = 0;
-- 
1.9.2

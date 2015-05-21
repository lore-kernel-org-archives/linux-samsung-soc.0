From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v6 09/12] drm/exynos: remove exported functions from exynos_drm_plane
Date: Thu, 21 May 2015 17:02:48 -0300
Message-ID: <1432238571-31621-10-git-send-email-gustavo@padovan.org>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33716 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756538AbbEUUD2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 16:03:28 -0400
Received: by qkgv12 with SMTP id v12so65014422qkg.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2015 13:03:28 -0700 (PDT)
In-Reply-To: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that no one is using the functions exported by exynos_drm_plane due
to the atomic conversion we can make remove some of the them or make them
static.

v2: remove unused exynos_drm_crtc

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 91 +++++++++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_plane.h | 11 ----
 2 files changed, 38 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index e952cbd..c6e5114 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -62,35 +62,12 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 	return size;
 }
 
-int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
-{
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	int nr;
-	int i;
-
-	nr = exynos_drm_fb_get_buf_cnt(fb);
-	for (i = 0; i < nr; i++) {
-		struct exynos_drm_gem_buf *buffer = exynos_drm_fb_buffer(fb, i);
-
-		if (!buffer) {
-			DRM_DEBUG_KMS("buffer is null\n");
-			return -EFAULT;
-		}
-
-		exynos_plane->dma_addr[i] = buffer->dma_addr + fb->offsets[i];
-
-		DRM_DEBUG_KMS("buffer: %d, dma_addr = 0x%lx\n",
-				i, (unsigned long)exynos_plane->dma_addr[i]);
-	}
-
-	return 0;
-}
-
-void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
-			  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-			  unsigned int crtc_w, unsigned int crtc_h,
-			  uint32_t src_x, uint32_t src_y,
-			  uint32_t src_w, uint32_t src_h)
+static void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
+				  struct drm_framebuffer *fb,
+				  int crtc_x, int crtc_y,
+				  unsigned int crtc_w, unsigned int crtc_h,
+				  uint32_t src_x, uint32_t src_y,
+				  uint32_t src_w, uint32_t src_h)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	unsigned int actual_w;
@@ -145,24 +122,6 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 	plane->crtc = crtc;
 }
 
-void
-exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
-		     struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-		     unsigned int crtc_w, unsigned int crtc_h,
-		     uint32_t src_x, uint32_t src_y,
-		     uint32_t src_w, uint32_t src_h)
-{
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-
-	exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
-			      crtc_w, crtc_h, src_x >> 16, src_y >> 16,
-			      src_w >> 16, src_h >> 16);
-
-	if (exynos_crtc->ops->win_commit)
-		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
-}
-
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -175,22 +134,48 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 static int exynos_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
-	return exynos_check_plane(plane, state->fb);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	int nr;
+	int i;
+
+	nr = exynos_drm_fb_get_buf_cnt(state->fb);
+	for (i = 0; i < nr; i++) {
+		struct exynos_drm_gem_buf *buffer =
+					exynos_drm_fb_buffer(state->fb, i);
+
+		if (!buffer) {
+			DRM_DEBUG_KMS("buffer is null\n");
+			return -EFAULT;
+		}
+
+		exynos_plane->dma_addr[i] = buffer->dma_addr +
+					    state->fb->offsets[i];
+
+		DRM_DEBUG_KMS("buffer: %d, dma_addr = 0x%lx\n",
+				i, (unsigned long)exynos_plane->dma_addr[i]);
+	}
+
+	return 0;
 }
 
 static void exynos_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = plane->state;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(state->crtc);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 
 	if (!state->crtc)
 		return;
 
-	exynos_update_plane(plane, state->crtc, state->fb,
-			    state->crtc_x, state->crtc_y,
-			    state->crtc_w, state->crtc_h,
-			    state->src_x >> 16, state->src_y >> 16,
-			    state->src_w >> 16, state->src_h >> 16);
+	exynos_plane_mode_set(plane, state->crtc, state->fb,
+			      state->crtc_x, state->crtc_y,
+			      state->crtc_w, state->crtc_h,
+			      state->src_x >> 16, state->src_y >> 16,
+			      state->src_w >> 16, state->src_h >> 16);
+
+	if (exynos_crtc->ops->win_commit)
+		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
 }
 
 static void exynos_plane_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 560ca71..8c88ae9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -9,17 +9,6 @@
  *
  */
 
-int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb);
-void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
-			   struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-			   unsigned int crtc_w, unsigned int crtc_h,
-			   uint32_t src_x, uint32_t src_y,
-			   uint32_t src_w, uint32_t src_h);
-void exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
-			struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-			unsigned int crtc_w, unsigned int crtc_h,
-			uint32_t src_x, uint32_t src_y,
-			uint32_t src_w, uint32_t src_h);
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
 		      unsigned long possible_crtcs, enum drm_plane_type type,
-- 
2.1.0

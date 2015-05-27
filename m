From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v8 10/14] drm/exynos: remove exported functions from exynos_drm_plane
Date: Wed, 27 May 2015 17:56:19 -0300
Message-ID: <1432760183-4342-11-git-send-email-gustavo@padovan.org>
References: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:36038 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbbE0U5D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 16:57:03 -0400
Received: by vnbg190 with SMTP id g190so2612449vnb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 13:57:02 -0700 (PDT)
In-Reply-To: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that no one is using the functions exported by exynos_drm_plane due
to the atomic conversion we can make remove some of the them or make them
static.

v2: remove unused exynos_drm_crtc

v3: fix checkpatch error (reported by Joonyoung)

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 98 +++++++++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_plane.h | 11 ----
 3 files changed, 43 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 13c13b5..b3a69df 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -104,7 +104,7 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 	}
 }
 
-static int exynos_crtc_atomic_begin(struct drm_crtc *crtc)
+static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index e052c72..54a83ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -62,38 +62,13 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 	return size;
 }
 
-int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
-{
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	int nr;
-	int i;
-
-	if (!fb)
-		return 0;
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
+static void exynos_plane_mode_set(struct drm_plane *plane,
+				  struct drm_crtc *crtc,
+				  struct drm_framebuffer *fb,
+				  int crtc_x, int crtc_y,
+				  unsigned int crtc_w, unsigned int crtc_h,
+				  uint32_t src_x, uint32_t src_y,
+				  uint32_t src_w, uint32_t src_h)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	unsigned int actual_w;
@@ -148,24 +123,6 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
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
@@ -178,22 +135,51 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 static int exynos_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
-	return exynos_check_plane(plane, state->fb);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	int nr;
+	int i;
+
+	if (!state->fb)
+		return 0;
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

From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v8 02/14] drm/exynos: atomic phase 1: use drm_plane_helper_update()
Date: Wed, 27 May 2015 17:56:11 -0300
Message-ID: <1432760183-4342-3-git-send-email-gustavo@padovan.org>
References: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f43.google.com ([209.85.216.43]:45607 "EHLO
	mail-vn0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbbE0U4h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 16:56:37 -0400
Received: by vnbg7 with SMTP id g7so2610801vnb.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 13:56:37 -0700 (PDT)
In-Reply-To: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Rip out the check from exynos_update_plane() and create
exynos_check_plane() for the check phase enabling use to use
the atomic helpers to call our check and update phases when updating
planes.

Update all users of exynos_update_plane() accordingly to call
exynos_check_plane() before.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>y
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 31 ++++++++++++------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 40 +++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_plane.h |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 363b019..ba44c9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -116,6 +116,7 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
+	int ret;
 
 	/* when framebuffer changing is requested, crtc's dpms should be on */
 	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
@@ -123,12 +124,17 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 		return -EPERM;
 	}
 
+	ret = exynos_check_plane(crtc->primary, fb);
+	if (ret)
+		return ret;
+
 	crtc_w = fb->width - x;
 	crtc_h = fb->height - y;
+	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
+			    crtc_w, crtc_h, x << 16, y << 16,
+			    crtc_w << 16, crtc_h << 16);
 
-	return exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-				   crtc_w, crtc_h, x << 16, y << 16,
-				   crtc_w << 16, crtc_h << 16);
+	return 0;
 }
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
@@ -165,7 +171,6 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct drm_framebuffer *old_fb = crtc->primary->fb;
 	unsigned int crtc_w, crtc_h;
 	int ret;
 
@@ -184,6 +189,10 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 		goto out;
 	}
 
+	ret = exynos_check_plane(crtc->primary, fb);
+	if (ret)
+		goto out;
+
 	ret = drm_vblank_get(dev, exynos_crtc->pipe);
 	if (ret) {
 		DRM_DEBUG("failed to acquire vblank counter\n");
@@ -202,17 +211,9 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 	crtc->primary->fb = fb;
 	crtc_w = fb->width - crtc->x;
 	crtc_h = fb->height - crtc->y;
-	ret = exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-				  crtc_w, crtc_h, crtc->x << 16, crtc->y << 16,
-				  crtc_w << 16, crtc_h << 16);
-	if (ret) {
-		crtc->primary->fb = old_fb;
-		spin_lock_irq(&dev->event_lock);
-		exynos_crtc->event = NULL;
-		drm_vblank_put(dev, exynos_crtc->pipe);
-		spin_unlock_irq(&dev->event_lock);
-		return ret;
-	}
+	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
+			    crtc_w, crtc_h, crtc->x << 16, crtc->y << 16,
+			    crtc_w << 16, crtc_h << 16);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index b1180fb..b218b7a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -144,21 +144,15 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 	plane->crtc = crtc;
 }
 
-int
+void
 exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		     struct drm_framebuffer *fb, int crtc_x, int crtc_y,
 		     unsigned int crtc_w, unsigned int crtc_h,
 		     uint32_t src_x, uint32_t src_y,
 		     uint32_t src_w, uint32_t src_h)
 {
-
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	int ret;
-
-	ret = exynos_check_plane(plane, fb);
-	if (ret < 0)
-		return ret;
 
 	exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
 			      crtc_w, crtc_h, src_x >> 16, src_y >> 16,
@@ -166,8 +160,6 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	if (exynos_crtc->ops->win_commit)
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
-
-	return 0;
 }
 
 static int exynos_disable_plane(struct drm_plane *plane)
@@ -183,11 +175,37 @@ static int exynos_disable_plane(struct drm_plane *plane)
 }
 
 static struct drm_plane_funcs exynos_plane_funcs = {
-	.update_plane	= exynos_update_plane,
+	.update_plane	= drm_plane_helper_update,
 	.disable_plane	= exynos_disable_plane,
 	.destroy	= drm_plane_cleanup,
 };
 
+static int exynos_plane_atomic_check(struct drm_plane *plane,
+				     struct drm_plane_state *state)
+{
+	return exynos_check_plane(plane, state->fb);
+}
+
+static void exynos_plane_atomic_update(struct drm_plane *plane,
+				       struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = plane->state;
+
+	if (!state->crtc)
+		return;
+
+	exynos_update_plane(plane, state->crtc, state->fb,
+			    state->crtc_x, state->crtc_y,
+			    state->crtc_w, state->crtc_h,
+			    state->src_x >> 16, state->src_y >> 16,
+			    state->src_w >> 16, state->src_h >> 16);
+}
+
+static const struct drm_plane_helper_funcs plane_helper_funcs = {
+	.atomic_check = exynos_plane_atomic_check,
+	.atomic_update = exynos_plane_atomic_update,
+};
+
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 					      unsigned int zpos)
 {
@@ -223,6 +241,8 @@ int exynos_plane_init(struct drm_device *dev,
 		return err;
 	}
 
+	drm_plane_helper_add(&exynos_plane->base, &plane_helper_funcs);
+
 	exynos_plane->zpos = zpos;
 
 	if (type == DRM_PLANE_TYPE_OVERLAY)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index f360590..560ca71 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -15,7 +15,7 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			   unsigned int crtc_w, unsigned int crtc_h,
 			   uint32_t src_x, uint32_t src_y,
 			   uint32_t src_w, uint32_t src_h);
-int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
+void exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 			struct drm_framebuffer *fb, int crtc_x, int crtc_y,
 			unsigned int crtc_w, unsigned int crtc_h,
 			uint32_t src_x, uint32_t src_y,
-- 
2.1.0

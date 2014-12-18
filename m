From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 23/29] drm/exynos: atomic phase 1: use drm_plane_helper_update()
Date: Thu, 18 Dec 2014 11:58:49 -0200
Message-ID: <1418911135-5207-24-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:53060 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbaLROAc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 09:00:32 -0500
Received: by mail-qc0-f177.google.com with SMTP id x3so857861qcv.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 06:00:32 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Rip out the check from exynos_update_plane() and create
exynos_check_plane() for the check phase enabling use to use
the atomic helpers to call our check and update phases when updating
planes.

Update all users of exynos_update_plane() accordingly to call
exynos_check_plane() before.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 32 +++++++++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 37 ++++++++++++++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_plane.h |  2 +-
 3 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index a85c451..74980c5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -119,6 +119,7 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
+	int ret;
 
 	/* when framebuffer changing is requested, crtc's dpms should be on */
 	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
@@ -126,11 +127,16 @@ static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 		return -EPERM;
 	}
 
+	ret = exynos_check_plane(crtc->primary, fb);
+	if (ret)
+		return ret;
+
 	crtc_w = fb->width - x;
 	crtc_h = fb->height - y;
+	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
+			    crtc_w, crtc_h, x, y, crtc_w, crtc_h);
 
-	return exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-				   crtc_w, crtc_h, x, y, crtc_w, crtc_h);
+	return 0;
 }
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
@@ -168,7 +174,6 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct exynos_drm_private *dev_priv = dev->dev_private;
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct drm_framebuffer *old_fb = crtc->primary->fb;
 	unsigned int crtc_w, crtc_h;
 	int ret = -EINVAL;
 
@@ -181,6 +186,10 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 	mutex_lock(&dev->struct_mutex);
 
 	if (event) {
+		ret = exynos_check_plane(crtc->primary, fb);
+		if (ret)
+			goto out;
+
 		/*
 		 * the pipe from user always is 0 so we can set pipe number
 		 * of current owner to event.
@@ -203,20 +212,9 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 		crtc->primary->fb = fb;
 		crtc_w = fb->width - crtc->x;
 		crtc_h = fb->height - crtc->y;
-		ret = exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-					  crtc_w, crtc_h, crtc->x, crtc->y,
-					  crtc_w, crtc_h);
-		if (ret) {
-			crtc->primary->fb = old_fb;
-
-			spin_lock_irq(&dev->event_lock);
-			drm_vblank_put(dev, exynos_crtc->pipe);
-			list_del(&event->base.link);
-			atomic_set(&exynos_crtc->pending_flip, 0);
-			spin_unlock_irq(&dev->event_lock);
-
-			goto out;
-		}
+		exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
+				    crtc_w, crtc_h, crtc->x, crtc->y,
+				    crtc_w, crtc_h);
 	}
 out:
 	mutex_unlock(&dev->struct_mutex);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 358cff6..0568589 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -171,21 +171,15 @@ void exynos_plane_dpms(struct drm_plane *plane, int mode)
 	}
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
@@ -193,8 +187,6 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	if (exynos_crtc->ops->win_commit)
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
-
-	return 0;
 }
 
 static int exynos_disable_plane(struct drm_plane *plane)
@@ -230,12 +222,35 @@ static int exynos_plane_set_property(struct drm_plane *plane,
 }
 
 static struct drm_plane_funcs exynos_plane_funcs = {
-	.update_plane	= exynos_update_plane,
+	.update_plane	= drm_plane_helper_update,
 	.disable_plane	= exynos_disable_plane,
 	.destroy	= exynos_plane_destroy,
 	.set_property	= exynos_plane_set_property,
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
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane)
 {
 	struct drm_device *dev = plane->dev;
@@ -275,6 +290,8 @@ struct drm_plane *exynos_plane_init(struct drm_device *dev,
 		return ERR_PTR(err);
 	}
 
+	drm_plane_helper_add(&exynos_plane->base, &plane_helper_funcs);
+
 	if (type == DRM_PLANE_TYPE_PRIMARY)
 		exynos_plane->zpos = DEFAULT_ZPOS;
 	else
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 59d4075..2abe827 100644
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
1.9.3

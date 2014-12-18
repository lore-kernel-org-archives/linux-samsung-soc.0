From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 11/29] drm/exynos: unify plane update on exynos_update_plane()
Date: Thu, 18 Dec 2014 11:58:37 -0200
Message-ID: <1418911135-5207-12-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:40166 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLRN7o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:44 -0500
Received: by mail-qa0-f54.google.com with SMTP id k15so819164qaq.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:43 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

We can safely use the exynos_update_plane() to update the plane
framebuffer for both the overlay and primary planes.

Note that this patch removes a call to manager->ops->commit() in
exynos_drm_crtc_mode_set_commit(). The commit() call is used only by the
fimd driver to set underlying timings and need only in full modeset
operations. For plane update only win_commit is needed.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 17 ++---------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.h |  5 +++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index a43e25d..4c8bd4d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -117,12 +117,9 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
 					  struct drm_framebuffer *old_fb)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
-	int ret;
 
 	/* when framebuffer changing is requested, crtc's dpms should be on */
 	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
@@ -133,18 +130,8 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
 	crtc_w = fb->width - x;
 	crtc_h = fb->height - y;
 
-	ret = exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
-				    crtc_w, crtc_h, x, y, crtc_w, crtc_h);
-	if (ret)
-		return ret;
-
-	if (manager->ops->win_commit)
-		manager->ops->win_commit(manager, exynos_plane->zpos);
-
-	if (manager->ops->commit)
-		manager->ops->commit(manager);
-
-	return 0;
+	return exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
+				   crtc_w, crtc_h, x, y, crtc_w, crtc_h);
 }
 
 static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index aa9cc9a..dadd306 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -165,7 +165,7 @@ void exynos_plane_dpms(struct drm_plane *plane, int mode)
 	}
 }
 
-static int
+int
 exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		     struct drm_framebuffer *fb, int crtc_x, int crtc_y,
 		     unsigned int crtc_w, unsigned int crtc_h,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 3c23989..d25c079 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -14,6 +14,11 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			  unsigned int crtc_w, unsigned int crtc_h,
 			  uint32_t src_x, uint32_t src_y,
 			  uint32_t src_w, uint32_t src_h);
+int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
+			struct drm_framebuffer *fb, int crtc_x, int crtc_y,
+			unsigned int crtc_w, unsigned int crtc_h,
+			uint32_t src_x, uint32_t src_y,
+			uint32_t src_w, uint32_t src_h);
 void exynos_plane_dpms(struct drm_plane *plane, int mode);
 struct drm_plane *exynos_plane_init(struct drm_device *dev,
 				    unsigned long possible_crtcs,
-- 
1.9.3

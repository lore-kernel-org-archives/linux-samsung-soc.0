From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v3 02/11] drm/exynos: atomic phase 1: use drm_plane_helper_disable()
Date: Fri,  3 Apr 2015 15:09:34 -0300
Message-ID: <1428084583-14616-3-git-send-email-gustavo@padovan.org>
References: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f49.google.com ([209.85.213.49]:34942 "EHLO
	mail-yh0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087AbbDCSJw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 14:09:52 -0400
Received: by yhfw71 with SMTP id w71so29823460yhf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 11:09:52 -0700 (PDT)
In-Reply-To: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The atomic helper to disable planes also uses the optional
.atomic_disable() helper. The unique operation it does is calling
.win_disable()

exynos_drm_fb_get_buf_cnt() needs a fb check too to avoid a null pointer.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index d346d1e..470456d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -136,7 +136,7 @@ unsigned int exynos_drm_fb_get_buf_cnt(struct drm_framebuffer *fb)
 
 	exynos_fb = to_exynos_fb(fb);
 
-	return exynos_fb->buf_cnt;
+	return exynos_fb ? exynos_fb->buf_cnt : 0;
 }
 
 struct drm_framebuffer *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 5a37816..2152a24 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -158,21 +158,9 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
 }
 
-static int exynos_disable_plane(struct drm_plane *plane)
-{
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);
-
-	if (exynos_crtc->ops->win_disable)
-		exynos_crtc->ops->win_disable(exynos_crtc,
-					      exynos_plane->zpos);
-
-	return 0;
-}
-
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_plane_helper_update,
-	.disable_plane	= exynos_disable_plane,
+	.disable_plane	= drm_plane_helper_disable,
 	.destroy	= drm_plane_cleanup,
 };
 
@@ -194,9 +182,21 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 			    state->src_w >> 16, state->src_h >> 16);
 }
 
+static void exynos_plane_atomic_disable(struct drm_plane *plane,
+				        struct drm_plane_state *old_state)
+{
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(old_state->crtc);
+
+	if (exynos_crtc->ops->win_disable)
+		exynos_crtc->ops->win_disable(exynos_crtc,
+					      exynos_plane->zpos);
+}
+
 static const struct drm_plane_helper_funcs plane_helper_funcs = {
 	.atomic_check = exynos_plane_atomic_check,
 	.atomic_update = exynos_plane_atomic_update,
+	.atomic_disable = exynos_plane_atomic_disable,
 };
 
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
-- 
2.1.0

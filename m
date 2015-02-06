From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 09/14] drm/exynos: atomic phase 1: use drm_plane_helper_disable()
Date: Fri,  6 Feb 2015 17:37:53 -0200
Message-ID: <1423251478-17043-10-git-send-email-gustavo@padovan.org>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:59778 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754237AbbBFTkZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 14:40:25 -0500
Received: by mail-qa0-f49.google.com with SMTP id v8so12408194qal.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 11:40:24 -0800 (PST)
In-Reply-To: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

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
index 3d7c749..5d3243e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -159,21 +159,9 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
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
 
@@ -195,9 +183,21 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
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
1.9.3

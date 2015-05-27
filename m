From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v8 03/14] drm/exynos: atomic phase 1: use drm_plane_helper_disable()
Date: Wed, 27 May 2015 17:56:12 -0300
Message-ID: <1432760183-4342-4-git-send-email-gustavo@padovan.org>
References: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f51.google.com ([209.85.216.51]:39079 "EHLO
	mail-vn0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbbE0U4k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 16:56:40 -0400
Received: by vnbf1 with SMTP id f1so2577579vnb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 13:56:40 -0700 (PDT)
In-Reply-To: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The atomic helper to disable planes also uses the optional
.atomic_disable() helper. The unique operation it does is calling
.win_disable()

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index b218b7a..a0fdfe2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -67,6 +67,9 @@ int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
 	int nr;
 	int i;
 
+	if (!fb)
+		return 0;
+
 	nr = exynos_drm_fb_get_buf_cnt(fb);
 	for (i = 0; i < nr; i++) {
 		struct exynos_drm_gem_buf *buffer = exynos_drm_fb_buffer(fb, i);
@@ -162,21 +165,9 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
 }
 
-static int exynos_disable_plane(struct drm_plane *plane)
-{
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);
-
-	if (exynos_crtc && exynos_crtc->ops->win_disable)
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
 
@@ -201,9 +192,24 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 			    state->src_w >> 16, state->src_h >> 16);
 }
 
+static void exynos_plane_atomic_disable(struct drm_plane *plane,
+					struct drm_plane_state *old_state)
+{
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(old_state->crtc);
+
+	if (!old_state->crtc)
+		return;
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

From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 10/29] drm/exynos: remove exynos_plane_commit() wrapper
Date: Thu, 18 Dec 2014 11:58:36 -0200
Message-ID: <1418911135-5207-11-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:47846 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLRN7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:40 -0500
Received: by mail-qc0-f170.google.com with SMTP id x3so884298qcv.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:40 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

It's doing nothing but calling exynos_crtc->ops->win_commit(), so let's
call this directly to avoid extra layers of abstraction.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  |  4 +++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 15 +++++----------
 drivers/gpu/drm/exynos/exynos_drm_plane.h |  1 -
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index e946b5f5..a43e25d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -59,10 +59,12 @@ static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct exynos_drm_manager *manager = exynos_crtc->manager;
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
 
 	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 
-	exynos_plane_commit(crtc->primary);
+	if (manager->ops->win_commit)
+		manager->ops->win_commit(manager, exynos_plane->zpos);
 
 	if (manager->ops->commit)
 		manager->ops->commit(manager);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 4fe3c2b..aa9cc9a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -139,15 +139,6 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 	return 0;
 }
 
-void exynos_plane_commit(struct drm_plane *plane)
-{
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_manager *manager = to_exynos_crtc(plane->crtc)->manager;
-
-	if (manager->ops->win_commit)
-		manager->ops->win_commit(manager, exynos_plane->zpos);
-}
-
 void exynos_plane_dpms(struct drm_plane *plane, int mode)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
@@ -181,6 +172,9 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		     uint32_t src_x, uint32_t src_y,
 		     uint32_t src_w, uint32_t src_h)
 {
+
+	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	int ret;
 
 	ret = exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
@@ -189,7 +183,8 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	if (ret < 0)
 		return ret;
 
-	exynos_plane_commit(plane);
+	if (manager->ops->win_commit)
+		manager->ops->win_commit(manager, exynos_plane->zpos);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 0d1986b..3c23989 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -14,7 +14,6 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			  unsigned int crtc_w, unsigned int crtc_h,
 			  uint32_t src_x, uint32_t src_y,
 			  uint32_t src_w, uint32_t src_h);
-void exynos_plane_commit(struct drm_plane *plane);
 void exynos_plane_dpms(struct drm_plane *plane, int mode);
 struct drm_plane *exynos_plane_init(struct drm_device *dev,
 				    unsigned long possible_crtcs,
-- 
1.9.3

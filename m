From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 12/14] drm/exynos: make exynos_plane_mode_set() static
Date: Tue,  3 Feb 2015 17:14:29 -0200
Message-ID: <1422990871-21355-13-git-send-email-gustavo@padovan.org>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:56568 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966015AbbBCTRF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 14:17:05 -0500
Received: by mail-qg0-f50.google.com with SMTP id j5so4088589qga.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Feb 2015 11:17:05 -0800 (PST)
In-Reply-To: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

It is not used outside of the plane scope anymore.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 11 ++++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.h |  5 -----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 0980c84..c0c53d6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -91,11 +91,12 @@ int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
 	return 0;
 }
 
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
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 8361606..8cdca0d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -10,11 +10,6 @@
  */
 
 int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb);
-void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
-			   struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-			   unsigned int crtc_w, unsigned int crtc_h,
-			   uint32_t src_x, uint32_t src_y,
-			   uint32_t src_w, uint32_t src_h);
 void exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 			struct drm_framebuffer *fb, int crtc_x, int crtc_y,
 			unsigned int crtc_w, unsigned int crtc_h,
-- 
1.9.3

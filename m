From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 22/29] drm/exynos: create exynos_check_plane()
Date: Thu, 18 Dec 2014 11:58:48 -0200
Message-ID: <1418911135-5207-23-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:39525 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752287AbaLROAX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 09:00:23 -0500
Received: by mail-qa0-f51.google.com with SMTP id k15so790549qaq.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 06:00:22 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Split update plane in two parts, an initial check part that can fail
and the update part that can't fail.

This is a important step for the upcoming atomic modesetting support.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 11 ++++++++--
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 34 +++++++++++++++++++------------
 drivers/gpu/drm/exynos/exynos_drm_plane.h | 11 +++++-----
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 357fcd5..a85c451 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -92,6 +92,7 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
+	int ret;
 
 	/*
 	 * copy the mode data adjusted by mode_fixup() into crtc->mode
@@ -99,10 +100,16 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	 */
 	memcpy(&crtc->mode, adjusted_mode, sizeof(*adjusted_mode));
 
+	ret = exynos_check_plane(crtc->primary, fb);
+	if (ret < 0)
+		return ret;
+
 	crtc_w = fb->width - x;
 	crtc_h = fb->height - y;
-	return exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
-				     crtc_w, crtc_h, x, y, crtc_w, crtc_h);
+	exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
+			      crtc_w, crtc_h, x, y, crtc_w, crtc_h);
+
+	return 0;
 }
 
 static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 95442e6..358cff6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drmP.h>
 
 #include <drm/exynos_drm.h>
+#include <drm/drm_plane_helper.h>
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_fb.h"
@@ -61,16 +62,9 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 	return size;
 }
 
-int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
-			  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-			  unsigned int crtc_w, unsigned int crtc_h,
-			  uint32_t src_x, uint32_t src_y,
-			  uint32_t src_w, uint32_t src_h)
+int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	unsigned int actual_w;
-	unsigned int actual_h;
 	int nr;
 	int i;
 
@@ -89,6 +83,20 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 				i, (unsigned long)exynos_plane->dma_addr[i]);
 	}
 
+	return 0;
+}
+
+void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
+			  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
+			  unsigned int crtc_w, unsigned int crtc_h,
+			  uint32_t src_x, uint32_t src_y,
+			  uint32_t src_w, uint32_t src_h)
+{
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	unsigned int actual_w;
+	unsigned int actual_h;
+
 	actual_w = exynos_plane_get_size(crtc_x, crtc_w, crtc->mode.hdisplay);
 	actual_h = exynos_plane_get_size(crtc_y, crtc_h, crtc->mode.vdisplay);
 
@@ -135,8 +143,6 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	if (exynos_crtc->ops->win_mode_set)
 		exynos_crtc->ops->win_mode_set(exynos_crtc, exynos_plane);
-
-	return 0;
 }
 
 void exynos_plane_dpms(struct drm_plane *plane, int mode)
@@ -177,12 +183,14 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	int ret;
 
-	ret = exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
-			crtc_w, crtc_h, src_x >> 16, src_y >> 16,
-			src_w >> 16, src_h >> 16);
+	ret = exynos_check_plane(plane, fb);
 	if (ret < 0)
 		return ret;
 
+	exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
+			      crtc_w, crtc_h, src_x >> 16, src_y >> 16,
+			      src_w >> 16, src_h >> 16);
+
 	if (exynos_crtc->ops->win_commit)
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index d25c079..59d4075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -9,11 +9,12 @@
  *
  */
 
-int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
-			  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
-			  unsigned int crtc_w, unsigned int crtc_h,
-			  uint32_t src_x, uint32_t src_y,
-			  uint32_t src_w, uint32_t src_h);
+int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb);
+void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
+			   struct drm_framebuffer *fb, int crtc_x, int crtc_y,
+			   unsigned int crtc_w, unsigned int crtc_h,
+			   uint32_t src_x, uint32_t src_y,
+			   uint32_t src_w, uint32_t src_h);
 int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 			struct drm_framebuffer *fb, int crtc_x, int crtc_y,
 			unsigned int crtc_w, unsigned int crtc_h,
-- 
1.9.3

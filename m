From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 05/17] drm/exynos: atomic phase 1: add .mode_set_nofb() callback
Date: Mon,  1 Jun 2015 12:04:43 -0300
Message-ID: <1433171095-23773-6-git-send-email-gustavo@padovan.org>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f53.google.com ([209.85.216.53]:38164 "EHLO
	mail-vn0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbbFAPFQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:16 -0400
Received: by vnbf190 with SMTP id f190so16444833vnb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:15 -0700 (PDT)
In-Reply-To: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The new atomic infrastructure needs the .mode_set_nofb() callback to
update CRTC timings before setting any plane.

v2: remove WARN_ON(!crtc->state) from mode_set_nofb

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 63 ++++----------------------------
 1 file changed, 7 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index ba44c9b..75eb61b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -62,9 +62,6 @@ static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 
 	if (exynos_crtc->ops->win_commit)
 		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
-
-	if (exynos_crtc->ops->commit)
-		exynos_crtc->ops->commit(exynos_crtc);
 }
 
 static bool
@@ -81,60 +78,13 @@ exynos_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 	return true;
 }
 
-static int
-exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
-			  struct drm_display_mode *adjusted_mode, int x, int y,
-			  struct drm_framebuffer *old_fb)
-{
-	struct drm_framebuffer *fb = crtc->primary->fb;
-	unsigned int crtc_w;
-	unsigned int crtc_h;
-	int ret;
-
-	/*
-	 * copy the mode data adjusted by mode_fixup() into crtc->mode
-	 * so that hardware can be seet to proper mode.
-	 */
-	memcpy(&crtc->mode, adjusted_mode, sizeof(*adjusted_mode));
-
-	ret = exynos_check_plane(crtc->primary, fb);
-	if (ret < 0)
-		return ret;
-
-	crtc_w = fb->width - x;
-	crtc_h = fb->height - y;
-	exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
-			      crtc_w, crtc_h, x, y, crtc_w, crtc_h);
-
-	return 0;
-}
-
-static int exynos_drm_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
-					  struct drm_framebuffer *old_fb)
+static void
+exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct drm_framebuffer *fb = crtc->primary->fb;
-	unsigned int crtc_w;
-	unsigned int crtc_h;
-	int ret;
-
-	/* when framebuffer changing is requested, crtc's dpms should be on */
-	if (exynos_crtc->dpms > DRM_MODE_DPMS_ON) {
-		DRM_ERROR("failed framebuffer changing request.\n");
-		return -EPERM;
-	}
 
-	ret = exynos_check_plane(crtc->primary, fb);
-	if (ret)
-		return ret;
-
-	crtc_w = fb->width - x;
-	crtc_h = fb->height - y;
-	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-			    crtc_w, crtc_h, x << 16, y << 16,
-			    crtc_w << 16, crtc_h << 16);
-
-	return 0;
+	if (exynos_crtc->ops->commit)
+		exynos_crtc->ops->commit(exynos_crtc);
 }
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
@@ -159,8 +109,9 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.prepare	= exynos_drm_crtc_prepare,
 	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
-	.mode_set	= exynos_drm_crtc_mode_set,
-	.mode_set_base	= exynos_drm_crtc_mode_set_base,
+	.mode_set	= drm_helper_crtc_mode_set,
+	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
+	.mode_set_base	= drm_helper_crtc_mode_set_base,
 	.disable	= exynos_drm_crtc_disable,
 };
 
-- 
2.1.0

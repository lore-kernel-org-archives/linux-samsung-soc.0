From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 27/29] drm/exynos: atomic phase 1: add .mode_set_nofb() callback
Date: Thu, 18 Dec 2014 11:58:53 -0200
Message-ID: <1418911135-5207-28-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f178.google.com ([209.85.216.178]:41108 "EHLO
	mail-qc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752521AbaLROAk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 09:00:40 -0500
Received: by mail-qc0-f178.google.com with SMTP id b13so998988qcw.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 06:00:39 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The new atomic infrastructure needs the .mode_set_nofb() callback to
update CRTC timings before setting any plane.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 61 ++++++++------------------------
 1 file changed, 14 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index f231eb8..8d7fc7b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -84,15 +84,16 @@ exynos_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 	return true;
 }
 
-static int
-exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
-			  struct drm_display_mode *adjusted_mode, int x, int y,
-			  struct drm_framebuffer *old_fb)
+static void
+exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_framebuffer *fb = crtc->primary->fb;
-	unsigned int crtc_w;
-	unsigned int crtc_h;
-	int ret;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	struct drm_display_mode *adjusted_mode;
+
+	if (WARN_ON(!crtc->state))
+		return;
+
+	adjusted_mode = &crtc->state->adjusted_mode;
 
 	/*
 	 * copy the mode data adjusted by mode_fixup() into crtc->mode
@@ -100,43 +101,8 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	 */
 	memcpy(&crtc->mode, adjusted_mode, sizeof(*adjusted_mode));
 
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
-{
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
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
-
-	ret = exynos_check_plane(crtc->primary, fb);
-	if (ret)
-		return ret;
-
-	crtc_w = fb->width - x;
-	crtc_h = fb->height - y;
-	exynos_update_plane(crtc->primary, crtc, fb, 0, 0,
-			    crtc_w, crtc_h, x, y, crtc_w, crtc_h);
-
-	return 0;
+	if (exynos_crtc->ops->commit)
+		exynos_crtc->ops->commit(exynos_crtc);
 }
 
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
@@ -193,8 +159,9 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.prepare	= exynos_drm_crtc_prepare,
 	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
-	.mode_set	= exynos_drm_crtc_mode_set,
-	.mode_set_base	= exynos_drm_crtc_mode_set_base,
+	.mode_set	= drm_helper_crtc_mode_set,
+	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
+	.mode_set_base	= drm_helper_crtc_mode_set_base,
 	.disable	= exynos_drm_crtc_disable,
 	.atomic_begin	= exynos_crtc_atomic_begin,
 	.atomic_flush	= exynos_crtc_atomic_flush,
-- 
1.9.3

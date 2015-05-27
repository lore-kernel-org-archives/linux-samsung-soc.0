From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v8 12/14] drm/exynos: move exynos_drm_crtc_disable()
Date: Wed, 27 May 2015 17:56:21 -0300
Message-ID: <1432760183-4342-13-git-send-email-gustavo@padovan.org>
References: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:37477 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910AbbE0U5I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 16:57:08 -0400
Received: by vnbg190 with SMTP id g190so2609849vnb.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 13:57:08 -0700 (PDT)
In-Reply-To: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This is a preparation commit to move exynos_drm_crtc_disable() together
with the future exynos_drm_crtc_enable() that will come from the split of
exynos_drm_crtc_dpms() callback.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index b3a69df..df58704 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -50,6 +50,23 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 		drm_crtc_vblank_on(crtc);
 }
 
+static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
+{
+	struct drm_plane *plane;
+	int ret;
+
+	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+
+	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
+		if (plane->crtc != crtc)
+			continue;
+
+		ret = plane->funcs->disable_plane(plane);
+		if (ret)
+			DRM_ERROR("Failed to disable plane %d\n", ret);
+	}
+}
+
 static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
@@ -87,23 +104,6 @@ exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		exynos_crtc->ops->commit(exynos_crtc);
 }
 
-static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
-{
-	struct drm_plane *plane;
-	int ret;
-
-	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
-
-	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
-		if (plane->crtc != crtc)
-			continue;
-
-		ret = plane->funcs->disable_plane(plane);
-		if (ret)
-			DRM_ERROR("Failed to disable plane %d\n", ret);
-	}
-}
-
 static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
@@ -120,12 +120,12 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
 
 static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.dpms		= exynos_drm_crtc_dpms,
+	.disable	= exynos_drm_crtc_disable,
 	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
 	.mode_set	= drm_helper_crtc_mode_set,
 	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
 	.mode_set_base	= drm_helper_crtc_mode_set_base,
-	.disable	= exynos_drm_crtc_disable,
 	.atomic_begin	= exynos_crtc_atomic_begin,
 	.atomic_flush	= exynos_crtc_atomic_flush,
 };
-- 
2.1.0

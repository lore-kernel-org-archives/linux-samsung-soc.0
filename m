From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v9 15/18] drm/exynos: remove unnecessary calls to disable_plane()
Date: Thu, 28 May 2015 18:42:53 -0300
Message-ID: <1432849376-12828-16-git-send-email-gustavo@padovan.org>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:44768 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754878AbbE1Vn4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 17:43:56 -0400
Received: by vnbg129 with SMTP id g129so6364397vnb.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2015 14:43:55 -0700 (PDT)
In-Reply-To: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The planes are already disabled by the drm_atomic_helper_commit() code
so we don't need to disable the in these two places.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 11 -----------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c |  8 --------
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index dd8e454..b7c6d51 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -40,8 +40,6 @@ static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
 static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct drm_plane *plane;
-	int ret;
 
 	if (!exynos_crtc->enabled)
 		return;
@@ -57,15 +55,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_OFF);
 
 	exynos_crtc->enabled = false;
-
-	drm_for_each_legacy_plane(plane, &crtc->dev->mode_config.plane_list) {
-		if (plane->crtc != crtc)
-			continue;
-
-		ret = plane->funcs->disable_plane(plane);
-		if (ret)
-			DRM_ERROR("Failed to disable plane %d\n", ret);
-	}
 }
 
 static bool
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 0648ba4..7b89fd5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -81,17 +81,9 @@ static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
 {
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
 	struct exynos_drm_display *display = exynos_encoder->display;
-	struct drm_plane *plane;
-	struct drm_device *dev = encoder->dev;
 
 	if (display->ops->dpms)
 		display->ops->dpms(display, DRM_MODE_DPMS_OFF);
-
-	/* all planes connected to this encoder should be also disabled. */
-	drm_for_each_legacy_plane(plane, &dev->mode_config.plane_list) {
-		if (plane->crtc && (plane->crtc == encoder->crtc))
-			plane->funcs->disable_plane(plane);
-	}
 }
 
 static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
-- 
2.1.0

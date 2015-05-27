From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v8 08/14] drm/exynos: atomic phase 3: use atomic .set_config helper
Date: Wed, 27 May 2015 17:56:17 -0300
Message-ID: <1432760183-4342-9-git-send-email-gustavo@padovan.org>
References: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f41.google.com ([209.85.216.41]:33156 "EHLO
	mail-vn0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbbE0U44 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 May 2015 16:56:56 -0400
Received: by vnbf190 with SMTP id f190so2591272vnb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2015 13:56:55 -0700 (PDT)
In-Reply-To: <1432760183-4342-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that phase 1 and 2 are complete switch .set_config helper to
use the atomic one.

v2: also remove .prepare() callback

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index fe77516..c490064 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -50,11 +50,6 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 		drm_crtc_vblank_on(crtc);
 }
 
-static void exynos_drm_crtc_prepare(struct drm_crtc *crtc)
-{
-	/* drm framework doesn't check NULL. */
-}
-
 static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
@@ -111,7 +106,6 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 
 static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.dpms		= exynos_drm_crtc_dpms,
-	.prepare	= exynos_drm_crtc_prepare,
 	.commit		= exynos_drm_crtc_commit,
 	.mode_fixup	= exynos_drm_crtc_mode_fixup,
 	.mode_set	= drm_helper_crtc_mode_set,
@@ -193,7 +187,7 @@ static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
 }
 
 static struct drm_crtc_funcs exynos_crtc_funcs = {
-	.set_config	= drm_crtc_helper_set_config,
+	.set_config	= drm_atomic_helper_set_config,
 	.page_flip	= exynos_drm_crtc_page_flip,
 	.destroy	= exynos_drm_crtc_destroy,
 	.reset = drm_atomic_helper_crtc_reset,
-- 
2.1.0

From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v9 13/18] drm/exynos: add exynos specific .atomic_commit()
Date: Thu, 28 May 2015 18:42:51 -0300
Message-ID: <1432849376-12828-14-git-send-email-gustavo@padovan.org>
References: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:41964 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754868AbbE1Vnu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 17:43:50 -0400
Received: by vnbg62 with SMTP id g62so6396902vnb.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2015 14:43:49 -0700 (PDT)
In-Reply-To: <1432849376-12828-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

exynos needs to update planes with the crtc enabled (mainly for the FIMD
case) so this specific atomic commit changes the order of
drm_atomic_helper_commit_modeset_enables() and
drm_atomic_helper_commit_planes() to commit planes after we enable crtc
and encoders.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 05d229c..b11047c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <uapi/drm/exynos_drm.h>
 
@@ -270,7 +271,31 @@ static int exynos_atomic_commit(struct drm_device *dev,
 				struct drm_atomic_state *state,
 				bool async)
 {
-	return drm_atomic_helper_commit(dev, state, false);
+	int ret;
+
+	ret = drm_atomic_helper_prepare_planes(dev, state);
+	if (ret)
+		return ret;
+
+	/*
+	 * This is the point of no return
+	 */
+
+	drm_atomic_helper_swap_state(dev, state);
+
+	drm_atomic_helper_commit_modeset_disables(dev, state);
+
+	drm_atomic_helper_commit_modeset_enables(dev, state);
+
+	drm_atomic_helper_commit_planes(dev, state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+
+	drm_atomic_state_free(state);
+
+	return 0;
 }
 
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
-- 
2.1.0

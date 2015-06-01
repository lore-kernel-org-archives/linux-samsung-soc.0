From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 08/17] drm/exynos: atomic phase 3: atomic updates of planes
Date: Mon,  1 Jun 2015 12:04:46 -0300
Message-ID: <1433171095-23773-9-git-send-email-gustavo@padovan.org>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f48.google.com ([209.85.216.48]:34078 "EHLO
	mail-vn0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752860AbbFAPFY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:24 -0400
Received: by vnbf129 with SMTP id f129so16481683vnb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:23 -0700 (PDT)
In-Reply-To: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that phase 1 and 2 are complete we can switch the update/disable_plane
callbacks to their atomic version.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 3 +++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 142eb4e..19c0642 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_atomic_helper.h>
 #include <uapi/drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
@@ -268,6 +269,8 @@ static void exynos_drm_output_poll_changed(struct drm_device *dev)
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
 	.fb_create = exynos_user_fb_create,
 	.output_poll_changed = exynos_drm_output_poll_changed,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 void exynos_drm_mode_config_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 42fcaca..fc332b4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -168,8 +168,8 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 }
 
 static struct drm_plane_funcs exynos_plane_funcs = {
-	.update_plane	= drm_plane_helper_update,
-	.disable_plane	= drm_plane_helper_disable,
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
 	.destroy	= drm_plane_cleanup,
 	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-- 
2.1.0

From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 06/10] drm/exynos: atomic phase 3: atomic updates of planes
Date: Fri, 27 Mar 2015 12:58:56 -0300
Message-ID: <1427471939-27345-7-git-send-email-gustavo@padovan.org>
References: <1427471939-27345-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f176.google.com ([209.85.216.176]:33644 "EHLO
	mail-qc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932474AbbC0P7R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 11:59:17 -0400
Received: by qcbjx9 with SMTP id jx9so20250557qcb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2015 08:59:16 -0700 (PDT)
In-Reply-To: <1427471939-27345-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that phase 1 and 2 are complete we can switch the update/disable_plane
callbacks to their atomic version.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 3 +++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 470456d..b83ceea 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -16,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_atomic_helper.h>
 #include <uapi/drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
@@ -309,6 +310,8 @@ static void exynos_drm_output_poll_changed(struct drm_device *dev)
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
 	.fb_create = exynos_user_fb_create,
 	.output_poll_changed = exynos_drm_output_poll_changed,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 void exynos_drm_mode_config_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 3cd628e..e83908a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -160,8 +160,8 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
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

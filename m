From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v4 6/8] drm/exynos: remove exynos_plane_destroy()
Date: Wed,  1 Apr 2015 13:02:10 -0300
Message-ID: <1427904132-15677-7-git-send-email-gustavo@padovan.org>
References: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33761 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751702AbbDAQCe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 12:02:34 -0400
Received: by qgfa8 with SMTP id a8so46511903qgf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 09:02:33 -0700 (PDT)
In-Reply-To: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The .destroy() callback for exynos can be replaced by drm_plane_cleanup().
The only extra operation on exynos_plane_destroy() was a call to
exynos_plane_disable() but the plane is already disabled by a earlier call
to drm_framebuffer_remove().

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 2fbac9b..2b0479e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -178,16 +178,10 @@ static int exynos_disable_plane(struct drm_plane *plane)
 	return 0;
 }
 
-static void exynos_plane_destroy(struct drm_plane *plane)
-{
-	exynos_disable_plane(plane);
-	drm_plane_cleanup(plane);
-}
-
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= exynos_update_plane,
 	.disable_plane	= exynos_disable_plane,
-	.destroy	= exynos_plane_destroy,
+	.destroy	= drm_plane_cleanup,
 };
 
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
-- 
2.1.0

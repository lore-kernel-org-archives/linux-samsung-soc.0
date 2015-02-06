From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 05/14] drm/exynos: remove exynos_plane_destroy()
Date: Fri,  6 Feb 2015 17:37:49 -0200
Message-ID: <1423251478-17043-6-git-send-email-gustavo@padovan.org>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:51099 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbBFTkP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 14:40:15 -0500
Received: by mail-qc0-f175.google.com with SMTP id c9so13653563qcz.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 11:40:15 -0800 (PST)
In-Reply-To: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

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
index 3847545..4367379 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -179,16 +179,10 @@ static int exynos_disable_plane(struct drm_plane *plane)
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
1.9.3

From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 04/14] drm/exynos: make zpos property immutable
Date: Fri,  6 Feb 2015 17:37:48 -0200
Message-ID: <1423251478-17043-5-git-send-email-gustavo@padovan.org>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:39564 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbBFTkN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 14:40:13 -0500
Received: by mail-qg0-f46.google.com with SMTP id j5so12872539qga.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 11:40:12 -0800 (PST)
In-Reply-To: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

We already set each plane zpos at init, after that changes to zpos are
not expected. This patch turns zpos into a read-only property so now it is
impossible to set zpos.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 8292819..3847545 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -185,27 +185,10 @@ static void exynos_plane_destroy(struct drm_plane *plane)
 	drm_plane_cleanup(plane);
 }
 
-static int exynos_plane_set_property(struct drm_plane *plane,
-				     struct drm_property *property,
-				     uint64_t val)
-{
-	struct drm_device *dev = plane->dev;
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_private *dev_priv = dev->dev_private;
-
-	if (property == dev_priv->plane_zpos_property) {
-		exynos_plane->zpos = val;
-		return 0;
-	}
-
-	return -EINVAL;
-}
-
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= exynos_update_plane,
 	.disable_plane	= exynos_disable_plane,
 	.destroy	= exynos_plane_destroy,
-	.set_property	= exynos_plane_set_property,
 };
 
 static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
@@ -217,8 +200,8 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 
 	prop = dev_priv->plane_zpos_property;
 	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "zpos", 0,
-						 MAX_PLANE - 1);
+		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
+						 "zpos", 0, MAX_PLANE - 1);
 		if (!prop)
 			return;
 
-- 
1.9.3

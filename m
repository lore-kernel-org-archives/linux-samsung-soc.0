From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v4 5/8] drm/exynos: make zpos property immutable
Date: Wed,  1 Apr 2015 13:02:09 -0300
Message-ID: <1427904132-15677-6-git-send-email-gustavo@padovan.org>
References: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:34662 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752576AbbDAQCb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 12:02:31 -0400
Received: by qcay5 with SMTP id y5so44833513qca.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 09:02:31 -0700 (PDT)
In-Reply-To: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

We already set each plane zpos at init, after that changes to zpos are
not expected. This patch turns zpos into a read-only property so now it is
impossible to set zpos.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 504bd6e..2fbac9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -184,27 +184,10 @@ static void exynos_plane_destroy(struct drm_plane *plane)
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
@@ -216,8 +199,8 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 
 	prop = dev_priv->plane_zpos_property;
 	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "zpos", 0,
-						 MAX_PLANE - 1);
+		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
+						 "zpos", 0, MAX_PLANE - 1);
 		if (!prop)
 			return;
 
-- 
2.1.0

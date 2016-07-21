From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v6 2/4] drm: sti: use generic zpos for plane
Date: Thu, 21 Jul 2016 10:52:01 +0200
Message-ID: <1469091123-4909-3-git-send-email-benjamin.gaignard@linaro.org>
References: <1469091123-4909-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38681 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbcGUIwX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 04:52:23 -0400
Received: by mail-wm0-f42.google.com with SMTP id o80so16333526wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 01:52:22 -0700 (PDT)
In-Reply-To: <1469091123-4909-1-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, vincent.abriou@st.com, fabien.dessenne@st.com, linux-samsung-soc@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

remove private zpos property and use instead the generic new.
zpos range is now fixed per plane type and normalized before
being using in mixer.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: vincent.abriou@st.com
Cc: fabien.dessenne@st.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/sti/sti_cursor.c |  4 +--
 drivers/gpu/drm/sti/sti_gdp.c    |  4 +--
 drivers/gpu/drm/sti/sti_hqvdp.c  |  4 +--
 drivers/gpu/drm/sti/sti_mixer.c  |  9 ++---
 drivers/gpu/drm/sti/sti_plane.c  | 78 +++++++++++++++-------------------------
 drivers/gpu/drm/sti/sti_plane.h  |  7 +---
 6 files changed, 38 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index a263bbb..3b53f7f 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -349,8 +349,8 @@ struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = sti_cursor_destroy,
-	.set_property = sti_plane_set_property,
-	.reset = drm_atomic_helper_plane_reset,
+	.set_property = drm_atomic_helper_plane_set_property,
+	.reset = sti_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_cursor_late_register,
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index bf63086..b8d942c 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -886,8 +886,8 @@ struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = sti_gdp_destroy,
-	.set_property = sti_plane_set_property,
-	.reset = drm_atomic_helper_plane_reset,
+	.set_property = drm_atomic_helper_plane_set_property,
+	.reset = sti_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_gdp_late_register,
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index b032322..b5ee783 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1254,8 +1254,8 @@ struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = sti_hqvdp_destroy,
-	.set_property = sti_plane_set_property,
-	.reset = drm_atomic_helper_plane_reset,
+	.set_property = drm_atomic_helper_plane_set_property,
+	.reset = sti_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_hqvdp_late_register,
diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index 1885c7a..7d9aea8 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -239,13 +239,10 @@ static void sti_mixer_set_background_area(struct sti_mixer *mixer,
 
 int sti_mixer_set_plane_depth(struct sti_mixer *mixer, struct sti_plane *plane)
 {
-	int plane_id, depth = plane->zorder;
+	int plane_id, depth = plane->drm_plane.state->normalized_zpos;
 	unsigned int i;
 	u32 mask, val;
 
-	if ((depth < 1) || (depth > GAM_MIXER_NB_DEPTH_LEVEL))
-		return 1;
-
 	switch (plane->desc) {
 	case STI_GDP_0:
 		plane_id = GAM_DEPTH_GDP0_ID;
@@ -278,8 +275,8 @@ int sti_mixer_set_plane_depth(struct sti_mixer *mixer, struct sti_plane *plane)
 			break;
 	}
 
-	mask |= GAM_DEPTH_MASK_ID << (3 * (depth - 1));
-	plane_id = plane_id << (3 * (depth - 1));
+	mask |= GAM_DEPTH_MASK_ID << (3 * depth);
+	plane_id = plane_id << (3 * depth);
 
 	DRM_DEBUG_DRIVER("%s %s depth=%d\n", sti_mixer_to_str(mixer),
 			 sti_plane_to_str(plane), depth);
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 0cf3335..ca4b371 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -14,15 +14,6 @@
 #include "sti_drv.h"
 #include "sti_plane.h"
 
-/* (Background) < GDP0 < GDP1 < HQVDP0 < GDP2 < GDP3 < (ForeGround) */
-enum sti_plane_desc sti_plane_default_zorder[] = {
-	STI_GDP_0,
-	STI_GDP_1,
-	STI_HQVDP_0,
-	STI_GDP_2,
-	STI_GDP_3,
-};
-
 const char *sti_plane_to_str(struct sti_plane *plane)
 {
 	switch (plane->desc) {
@@ -96,59 +87,46 @@ void sti_plane_update_fps(struct sti_plane *plane,
 			 plane->fps_info.fips_str);
 }
 
-int sti_plane_set_property(struct drm_plane *drm_plane,
-			   struct drm_property *property,
-			   uint64_t val)
+static int sti_plane_get_default_zpos(enum drm_plane_type type)
 {
-	struct drm_device *dev = drm_plane->dev;
-	struct sti_private *private = dev->dev_private;
-	struct sti_plane *plane = to_sti_plane(drm_plane);
-
-	DRM_DEBUG_DRIVER("\n");
-
-	if (property == private->plane_zorder_property) {
-		plane->zorder = val;
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
 		return 0;
+	case DRM_PLANE_TYPE_OVERLAY:
+		return 1;
+	case DRM_PLANE_TYPE_CURSOR:
+		return 7;
 	}
+	return 0;
+}
 
-	return -EINVAL;
+void sti_plane_reset(struct drm_plane *plane)
+{
+	drm_atomic_helper_plane_reset(plane);
+	plane->state->zpos = sti_plane_get_default_zpos(plane->type);
 }
 
-static void sti_plane_attach_zorder_property(struct drm_plane *drm_plane)
+static void sti_plane_attach_zorder_property(struct drm_plane *drm_plane,
+					     enum drm_plane_type type)
 {
-	struct drm_device *dev = drm_plane->dev;
-	struct sti_private *private = dev->dev_private;
-	struct sti_plane *plane = to_sti_plane(drm_plane);
-	struct drm_property *prop;
-
-	prop = private->plane_zorder_property;
-	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "zpos", 1,
-						 GAM_MIXER_NB_DEPTH_LEVEL);
-		if (!prop)
-			return;
-
-		private->plane_zorder_property = prop;
+	int zpos = sti_plane_get_default_zpos(type);
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_plane_create_zpos_property(drm_plane, zpos, 0, 6);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		drm_plane_create_zpos_immutable_property(drm_plane, zpos);
+		break;
 	}
-
-	drm_object_attach_property(&drm_plane->base, prop, plane->zorder);
 }
 
 void sti_plane_init_property(struct sti_plane *plane,
 			     enum drm_plane_type type)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(sti_plane_default_zorder); i++)
-		if (sti_plane_default_zorder[i] == plane->desc)
-			break;
-
-	plane->zorder = i + 1;
-
-	if (type == DRM_PLANE_TYPE_OVERLAY)
-		sti_plane_attach_zorder_property(&plane->drm_plane);
+	sti_plane_attach_zorder_property(&plane->drm_plane, type);
 
-	DRM_DEBUG_DRIVER("drm plane:%d mapped to %s with zorder:%d\n",
-			 plane->drm_plane.base.id,
-			 sti_plane_to_str(plane), plane->zorder);
+	DRM_DEBUG_DRIVER("drm plane:%d mapped to %s\n",
+			 plane->drm_plane.base.id, sti_plane_to_str(plane));
 }
diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
index e0ea1dd..ce3e8d6 100644
--- a/drivers/gpu/drm/sti/sti_plane.h
+++ b/drivers/gpu/drm/sti/sti_plane.h
@@ -66,14 +66,12 @@ struct sti_fps_info {
  * @plane:              drm plane it is bound to (if any)
  * @desc:               plane type & id
  * @status:             to know the status of the plane
- * @zorder:             plane z-order
  * @fps_info:           frame per second info
  */
 struct sti_plane {
 	struct drm_plane drm_plane;
 	enum sti_plane_desc desc;
 	enum sti_plane_status status;
-	int zorder;
 	struct sti_fps_info fps_info;
 };
 
@@ -82,10 +80,7 @@ void sti_plane_update_fps(struct sti_plane *plane,
 			  bool new_frame,
 			  bool new_field);
 
-int sti_plane_set_property(struct drm_plane *drm_plane,
-			   struct drm_property *property,
-			   uint64_t val);
-
 void sti_plane_init_property(struct sti_plane *plane,
 			     enum drm_plane_type type);
+void sti_plane_reset(struct drm_plane *plane);
 #endif
-- 
1.9.1

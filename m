From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 1/4] drm: add generic zpos property
Date: Wed, 11 May 2016 14:31:18 +0200
Message-ID: <1462969881-2447-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37649 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751775AbcEKMce (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:32:34 -0400
Received: by mail-wm0-f51.google.com with SMTP id a17so79997468wme.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 May 2016 05:32:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, vincent.abriou@st.com, fabien.dessenne@st.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds support for generic plane's zpos property property with
well-defined semantics:
- added zpos properties to plane and plane state structures
- added helpers for normalizing zpos properties of given set of planes
- well defined semantics: planes are sorted by zpos values and then plane
  id value if zpos equals

Normalized zpos values are calculated automatically when generic
muttable zpos property has been initialized. Drivers can simply use
plane_state->normalized_zpos in their atomic_check and/or plane_update
callbacks without any additional calls to DRM core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Compare to Marek's original patch zpos property is now specific to each
plane and no more to the core.
Normalize function take care of the range of per plane defined range
before set normalized_zpos.

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
 Documentation/DocBook/gpu.tmpl      |  10 ++
 drivers/gpu/drm/Makefile            |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c |   6 +
 drivers/gpu/drm/drm_blend.c         | 283 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |   3 +
 include/drm/drm_crtc.h              |  25 ++++
 6 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_blend.c

diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu.tmpl
index 9dd48f7..0df6abb 100644
--- a/Documentation/DocBook/gpu.tmpl
+++ b/Documentation/DocBook/gpu.tmpl
@@ -2151,6 +2151,16 @@ void intel_crt_init(struct drm_device *dev)
 		the underlying hardware).</td>
 	</tr>
 	<tr>
+	<td valign="top" > "zpos" </td>
+	<td valign="top" >RANGE</td>
+	<td valign="top" >Min= driver dependent, Max= driver dependent</td>
+	<td valign="top" >Plane</td>
+	<td valign="top" >Plane's 'z' position during blending operation (0 for background, highest for frontmost).
+		If two planes assigned to same CRTC have equal zpos values, the plane with higher plane
+		id is treated as closer to front. Can be IMMUTABLE if driver doesn't support changing
+		planes' order. Exact value range is driver dependent.</td>
+	</tr>
+	<tr>
 	<td rowspan="20" valign="top" >i915</td>
 	<td rowspan="2" valign="top" >Generic</td>
 	<td valign="top" >"Broadcast RGB"</td>
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2bd3e5a..df88253 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -2,7 +2,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-drm-y       :=	drm_auth.o drm_bufs.o drm_cache.o \
+drm-y       :=	drm_auth.o drm_bufs.o drm_blend.o drm_cache.o \
 		drm_context.o drm_dma.o \
 		drm_fops.o drm_gem.o drm_ioctl.o drm_irq.o \
 		drm_lock.o drm_memory.o drm_drv.o drm_vm.o \
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 997fd21..f10652f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -32,6 +32,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <linux/fence.h>
 
+#include "drm_crtc_internal.h"
+
 /**
  * DOC: overview
  *
@@ -587,6 +589,10 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 	struct drm_plane_state *plane_state;
 	int i, ret = 0;
 
+	ret = drm_atomic_helper_normalize_zpos(dev, state);
+	if (ret)
+		return ret;
+
 	for_each_plane_in_state(state, plane, plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs;
 
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
new file mode 100644
index 0000000..a4d3b4c
--- /dev/null
+++ b/drivers/gpu/drm/drm_blend.c
@@ -0,0 +1,283 @@
+/*
+ * Copyright (C) 2016 Samsung Electronics Co.Ltd
+ * Authors:
+ *	Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * DRM core plane blending related functions
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that copyright
+ * notice and this permission notice appear in supporting documentation, and
+ * that the name of the copyright holders not be used in advertising or
+ * publicity pertaining to distribution of the software without specific,
+ * written prior permission.  The copyright holders make no representations
+ * about the suitability of this software for any purpose.  It is provided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
+ * OF THIS SOFTWARE.
+ */
+#include <drm/drmP.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_crtc.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+
+#include "drm_internal.h"
+
+/**
+ * drm_plane_atomic_set_zpos_property - set plane zpos property
+ * @plane: drm plane
+ * @state: drm plane state
+ * @property: must be the zpos property associated to the plane
+ * @val: zpos value to be set
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_atomic_set_zpos_property(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				       struct drm_property *property,
+				       uint64_t val)
+{
+	struct drm_mode_object *obj = &plane->base;
+	int i;
+
+	for (i = 0; i < obj->properties->count; i++) {
+		if (obj->properties->properties[i] == property) {
+			state->zpos = val;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_plane_atomic_set_zpos_property);
+
+/**
+ * drm_plane_atomic_get_zpos_property - set plane zpos property
+ * @plane: drm plane
+ * @state: drm plane state
+ * @property: must be the zpos property associated to the plane
+ * @val: zpos value to be retrieve
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_atomic_get_zpos_property(struct drm_plane *plane,
+				       const struct drm_plane_state *state,
+				       struct drm_property *property,
+				       uint64_t *val)
+{
+	struct drm_mode_object *obj = &plane->base;
+	int i;
+
+	for (i = 0; i < obj->properties->count; i++) {
+		if (obj->properties->properties[i] == property) {
+			*val = state->zpos;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_plane_atomic_get_zpos_property);
+
+/**
+ * drm_plane_create_zpos_property - create mutable zpos property
+ * @plane: drm plane
+ * @min: minimal possible value of zpos property
+ * @max: maximal possible value of zpos property
+ *
+ * This function initializes generic mutable zpos property and enables support
+ * for it in drm core. Drivers can then attach this property to planes to enable
+ * support for configurable planes arrangement during blending operation.
+ * Once mutable zpos property has been enabled, the DRM core will automatically
+ * calculate drm_plane_state->normalized_zpos values. Usually min should be set
+ * to 0 and max to maximal number of planes for given crtc - 1.
+ *
+ * If zpos of some planes cannot be changed (like fixed background or
+ * cursor/topmost planes), driver should adjust min/max values and assign those
+ * planes immutable zpos property with lower or higher values (for more
+ * information, see drm_mode_create_zpos_immutable_property() function). In such
+ * case driver should also assign proper initial zpos values for all planes in
+ * its plane_reset() callback, so the planes will be always sorted properly.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_zpos_property(struct drm_plane *plane,
+				   unsigned int min, unsigned int max)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, 0, "zpos", min, max);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, min);
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_zpos_property);
+
+/**
+ * drm_plane_create_zpos_immutable_property - create immuttable zpos property
+ * @plane: drm plane
+ * @min: minimal possible value of zpos property
+ * @max: maximal possible value of zpos property
+ *
+ * This function initializes generic immutable zpos property and enables
+ * support for it in drm core. Using this property driver lets userspace
+ * to get the arrangement of the planes for blending operation and notifies
+ * it that the hardware (or driver) doesn't support changing of the planes'
+ * order.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
+					     unsigned int min, unsigned int max)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, DRM_MODE_PROP_IMMUTABLE,
+					 "zpos", min, max);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, min);
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_zpos_immutable_property);
+
+static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
+{
+	const struct drm_plane_state *sa = *(struct drm_plane_state **)a;
+	const struct drm_plane_state *sb = *(struct drm_plane_state **)b;
+
+	if (sa->zpos != sb->zpos)
+		return sa->zpos - sb->zpos;
+	else
+		return sa->plane->base.id - sb->plane->base.id;
+}
+
+/**
+ * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zpos values
+ * @crtc: crtc with planes, which have to be considered for normalization
+ * @crtc_state: new atomic state to apply
+ *
+ * This function checks new states of all planes assigned to given crtc and
+ * calculates normalized zpos value for them. Planes are compared first by their
+ * zpos values, then by plane id (if zpos equals). Plane with lowest zpos value
+ * is at the bottom. The plane_state->normalized_zpos is then filled with unique
+ * values from 0 to number of active planes in crtc minus one.
+ *
+ * RETURNS
+ * Zero for success or -errno
+ */
+int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
+					  struct drm_crtc_state *crtc_state)
+{
+	struct drm_atomic_state *state = crtc_state->state;
+	struct drm_device *dev = crtc->dev;
+	int total_planes = dev->mode_config.num_total_plane;
+	struct drm_plane_state **states;
+	struct drm_plane *plane;
+	int i, zpos, n = 0;
+	int ret = 0;
+
+	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
+			 crtc->base.id, crtc->name);
+
+	states = kmalloc(total_planes * sizeof(*states), GFP_KERNEL);
+	if (!states)
+		return -ENOMEM;
+
+	/*
+	 * Normalization process might create new states for planes which
+	 * normalized_zpos has to be recalculated.
+	 */
+	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
+		struct drm_plane_state *plane_state =
+			drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state)) {
+			ret = PTR_ERR(plane_state);
+			goto done;
+		}
+		states[n++] = plane_state;
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
+				 plane->base.id, plane->name,
+				 plane_state->zpos);
+	}
+
+	sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL);
+
+	for (i = 0, zpos = 0; i < n; i++, zpos++) {
+		plane = states[i]->plane;
+
+		zpos = max_t(int, zpos, states[i]->zpos);
+
+		states[i]->normalized_zpos = zpos;
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
+				 plane->base.id, plane->name, zpos);
+	}
+	crtc_state->zpos_changed = true;
+
+done:
+	kfree(states);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);
+
+/**
+ * drm_atomic_helper_normalize_zpos - calculate normalized zpos values for all
+ *				      crtcs
+ * @dev: DRM device
+ * @state: atomic state of DRM device
+ *
+ * This function calculates normalized zpos value for all modified planes in
+ * the provided atomic state of DRM device. For more information, see
+ * drm_atomic_helper_crtc_normalize_zpos() function.
+ *
+ * RETURNS
+ * Zero for success or -errno
+ */
+int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *plane_state;
+	int i, ret = 0;
+
+	for_each_plane_in_state(state, plane, plane_state, i) {
+		crtc = plane_state->crtc;
+		if (!crtc)
+			continue;
+		if (plane->state->zpos != plane_state->zpos) {
+			crtc_state =
+				drm_atomic_get_existing_crtc_state(state, crtc);
+			crtc_state->zpos_changed = true;
+		}
+	}
+
+	for_each_crtc_in_state(state, crtc, crtc_state, i) {
+		if (crtc_state->plane_mask != crtc->state->plane_mask ||
+		    crtc_state->zpos_changed) {
+			ret = drm_atomic_helper_crtc_normalize_zpos(crtc,
+								    crtc_state);
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index a78c138..37d9068 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -42,3 +42,6 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 int drm_mode_atomic_ioctl(struct drm_device *dev,
 			  void *data, struct drm_file *file_priv);
 
+/* drm_blend.c */
+int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
+				     struct drm_atomic_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index d1559cd..ad63fdc 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -305,6 +305,7 @@ struct drm_plane_helper_funcs;
  * @mode_changed: crtc_state->mode or crtc_state->enable has been changed
  * @active_changed: crtc_state->active has been toggled.
  * @connectors_changed: connectors to this crtc have been updated
+ * @zpos_changed: zpos values of planes on this crtc have been updated
  * @color_mgmt_changed: color management properties have changed (degamma or
  *	gamma LUT or CSC matrix)
  * @plane_mask: bitmask of (1 << drm_plane_index(plane)) of attached planes
@@ -340,6 +341,7 @@ struct drm_crtc_state {
 	bool mode_changed : 1;
 	bool active_changed : 1;
 	bool connectors_changed : 1;
+	bool zpos_changed : 1;
 	bool color_mgmt_changed : 1;
 
 	/* attached planes bitmask:
@@ -1263,6 +1265,9 @@ struct drm_connector {
  *	plane (in 16.16)
  * @src_w: width of visible portion of plane (in 16.16)
  * @src_h: height of visible portion of plane (in 16.16)
+ * @zpos: priority of the given plane on crtc (optional)
+ * @normalized_zpos: normalized value of zpos: unique, range from 0 to N-1
+ *	 for given crtc
  * @state: backpointer to global drm_atomic_state
  */
 struct drm_plane_state {
@@ -1283,6 +1288,10 @@ struct drm_plane_state {
 	/* Plane rotation */
 	unsigned int rotation;
 
+	/* Plane zpos */
+	unsigned int zpos;
+	unsigned int normalized_zpos;
+
 	struct drm_atomic_state *state;
 };
 
@@ -2554,6 +2563,22 @@ extern struct drm_property *drm_mode_create_rotation_property(struct drm_device
 extern unsigned int drm_rotation_simplify(unsigned int rotation,
 					  unsigned int supported_rotations);
 
+int drm_plane_atomic_set_zpos_property(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				       struct drm_property *property,
+				       uint64_t val);
+
+int drm_plane_atomic_get_zpos_property(struct drm_plane *plane,
+				       const struct drm_plane_state *state,
+				       struct drm_property *property,
+				       uint64_t *val);
+
+int drm_plane_create_zpos_property(struct drm_plane *plane,
+				   unsigned int min, unsigned int max);
+int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
+					     unsigned int min,
+					     unsigned int max);
+
 /* Helpers */
 
 static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
-- 
1.9.1

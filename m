From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v7 1/4] drm: add generic zpos property
Date: Thu, 28 Jul 2016 10:07:47 +0200
Message-ID: <1469693270-24814-2-git-send-email-benjamin.gaignard@linaro.org>
References: <1469693270-24814-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:35960 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750946AbcG1IIw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jul 2016 04:08:52 -0400
Received: by mail-wm0-f41.google.com with SMTP id q128so241076896wma.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2016 01:08:52 -0700 (PDT)
In-Reply-To: <1469693270-24814-1-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, vincent.abriou@st.com, fabien.dessenne@st.com, linux-samsung-soc@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

=46rom: Marek Szyprowski <m.szyprowski@samsung.com>

version 7:
remove useless EXPORT_SYMBOL()
better z-order wording in Documentation

version 6:
- add zpos in gpu documentation file
- merge Ville patch about zpos initial value and API improvement.
  I have split Ville patch between zpos core and drivers

version 5:
- remove zpos range check and comeback to 0 to N-1
  normalization algorithm

version 4:
- make sure that normalized zpos value is stay
  in the defined property range and warn user if not

This patch adds support for generic plane's zpos property property with
well-defined semantics:
- added zpos properties to plane and plane state structures
- added helpers for normalizing zpos properties of given set of planes
- well defined semantics: planes are sorted by zpos values and then pla=
ne
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
Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
 Documentation/gpu/kms-properties.csv |   1 +
 drivers/gpu/drm/Makefile             |   2 +-
 drivers/gpu/drm/drm_atomic.c         |   4 +
 drivers/gpu/drm/drm_atomic_helper.c  |   7 +
 drivers/gpu/drm/drm_blend.c          | 239 +++++++++++++++++++++++++++=
++++++++
 drivers/gpu/drm/drm_crtc_internal.h  |   4 +
 include/drm/drm_crtc.h               |  30 +++++
 7 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_blend.c

diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/k=
ms-properties.csv
index b6fcaf6..4c5ce3e 100644
--- a/Documentation/gpu/kms-properties.csv
+++ b/Documentation/gpu/kms-properties.csv
@@ -17,6 +17,7 @@ DRM,Generic,=E2=80=9Crotation=E2=80=9D,BITMASK,"{ 0, =
""rotate-0"" }, { 1, ""rotate-90"" }, {
 ,,=E2=80=9CCRTC_H=E2=80=9D,RANGE,"Min=3D0, Max=3DUINT_MAX",Plane,Scano=
ut CRTC (destination) height (atomic)
 ,,=E2=80=9CFB_ID=E2=80=9D,OBJECT,DRM_MODE_OBJECT_FB,Plane,Scanout fram=
ebuffer (atomic)
 ,,=E2=80=9CCRTC_ID=E2=80=9D,OBJECT,DRM_MODE_OBJECT_CRTC,Plane,CRTC tha=
t plane is attached to (atomic)
+,,=E2=80=9Czpos=E2=80=9D,RANGE,"Min=3D0, Max=3DUINT_MAX","Plane,Z-orde=
r of the plane.Planes with higher Z-order values are displayed on top, =
planes with identical Z-order values are display in an undefined order"
 ,DVI-I,=E2=80=9Csubconnector=E2=80=9D,ENUM,"{ =E2=80=9CUnknown=E2=80=9D=
, =E2=80=9CDVI-D=E2=80=9D, =E2=80=9CDVI-A=E2=80=9D }",Connector,TBD
 ,,=E2=80=9Cselect subconnector=E2=80=9D,ENUM,"{ =E2=80=9CAutomatic=E2=80=
=9D, =E2=80=9CDVI-D=E2=80=9D, =E2=80=9CDVI-A=E2=80=9D }",Connector,TBD
 ,TV,=E2=80=9Csubconnector=E2=80=9D,ENUM,"{ ""Unknown"", ""Composite"",=
 ""SVIDEO"", ""Component"", ""SCART"" }",Connector,TBD
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e3dba6f..7fbcf3f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -2,7 +2,7 @@
 # Makefile for the drm device driver.  This driver provides support fo=
r the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
=20
-drm-y       :=3D	drm_auth.o drm_bufs.o drm_cache.o \
+drm-y       :=3D	drm_auth.o drm_bufs.o drm_blend.o drm_cache.o \
 		drm_context.o drm_dma.o \
 		drm_fops.o drm_gem.o drm_ioctl.o drm_irq.o \
 		drm_lock.o drm_memory.o drm_drv.o drm_vm.o \
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.=
c
index 9359be4..8ddd8bc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -712,6 +712,8 @@ int drm_atomic_plane_set_property(struct drm_plane =
*plane,
 		state->src_h =3D val;
 	} else if (property =3D=3D config->rotation_property) {
 		state->rotation =3D val;
+	} else if (property =3D=3D plane->zpos_property) {
+		state->zpos =3D val;
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
@@ -768,6 +770,8 @@ drm_atomic_plane_get_property(struct drm_plane *pla=
ne,
 		*val =3D state->src_h;
 	} else if (property =3D=3D config->rotation_property) {
 		*val =3D state->rotation;
+	} else if (property =3D=3D plane->zpos_property) {
+		*val =3D state->zpos;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val=
);
 	} else {
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
index de7fddc..20be86d 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -32,6 +32,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <linux/fence.h>
=20
+#include "drm_crtc_internal.h"
+
 /**
  * DOC: overview
  *
@@ -592,6 +594,10 @@ drm_atomic_helper_check_planes(struct drm_device *=
dev,
 	struct drm_plane_state *plane_state;
 	int i, ret =3D 0;
=20
+	ret =3D drm_atomic_helper_normalize_zpos(dev, state);
+	if (ret)
+		return ret;
+
 	for_each_plane_in_state(state, plane, plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs;
=20
@@ -2955,6 +2961,7 @@ void __drm_atomic_helper_crtc_duplicate_state(str=
uct drm_crtc *crtc,
 	state->planes_changed =3D false;
 	state->connectors_changed =3D false;
 	state->color_mgmt_changed =3D false;
+	state->zpos_changed =3D false;
 	state->event =3D NULL;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
new file mode 100644
index 0000000..e519261
--- /dev/null
+++ b/drivers/gpu/drm/drm_blend.c
@@ -0,0 +1,239 @@
+/*
+ * Copyright (C) 2016 Samsung Electronics Co.Ltd
+ * Authors:
+ *	Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * DRM core plane blending related functions
+ *
+ * Permission to use, copy, modify, distribute, and sell this software=
 and its
+ * documentation for any purpose is hereby granted without fee, provid=
ed that
+ * the above copyright notice appear in all copies and that both that =
copyright
+ * notice and this permission notice appear in supporting documentatio=
n, and
+ * that the name of the copyright holders not be used in advertising o=
r
+ * publicity pertaining to distribution of the software without specif=
ic,
+ * written prior permission.  The copyright holders make no representa=
tions
+ * about the suitability of this software for any purpose.  It is prov=
ided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS S=
OFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN=
 NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRE=
CT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS=
 OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OT=
HER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PE=
RFORMANCE
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
+ * drm_plane_create_zpos_property - create mutable zpos property
+ * @plane: drm plane
+ * @zpos: initial value of zpos property
+ * @min: minimal possible value of zpos property
+ * @max: maximal possible value of zpos property
+ *
+ * This function initializes generic mutable zpos property and enables=
 support
+ * for it in drm core. Drivers can then attach this property to planes=
 to enable
+ * support for configurable planes arrangement during blending operati=
on.
+ * Once mutable zpos property has been enabled, the DRM core will auto=
matically
+ * calculate drm_plane_state->normalized_zpos values. Usually min shou=
ld be set
+ * to 0 and max to maximal number of planes for given crtc - 1.
+ *
+ * If zpos of some planes cannot be changed (like fixed background or
+ * cursor/topmost planes), driver should adjust min/max values and ass=
ign those
+ * planes immutable zpos property with lower or higher values (for mor=
e
+ * information, see drm_mode_create_zpos_immutable_property() function=
). In such
+ * case driver should also assign proper initial zpos values for all p=
lanes in
+ * its plane_reset() callback, so the planes will be always sorted pro=
perly.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_zpos_property(struct drm_plane *plane,
+				   unsigned int zpos,
+				   unsigned int min, unsigned int max)
+{
+	struct drm_property *prop;
+
+	prop =3D drm_property_create_range(plane->dev, 0, "zpos", min, max);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, zpos);
+
+	plane->zpos_property =3D prop;
+
+	if (plane->state) {
+		plane->state->zpos =3D zpos;
+		plane->state->normalized_zpos =3D zpos;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_zpos_property);
+
+/**
+ * drm_plane_create_zpos_immutable_property - create immuttable zpos p=
roperty
+ * @plane: drm plane
+ * @zpos: value of zpos property
+ *
+ * This function initializes generic immutable zpos property and enabl=
es
+ * support for it in drm core. Using this property driver lets userspa=
ce
+ * to get the arrangement of the planes for blending operation and not=
ifies
+ * it that the hardware (or driver) doesn't support changing of the pl=
anes'
+ * order.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
+					     unsigned int zpos)
+{
+	struct drm_property *prop;
+
+	prop =3D drm_property_create_range(plane->dev, DRM_MODE_PROP_IMMUTABL=
E,
+					 "zpos", zpos, zpos);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, zpos);
+
+	plane->zpos_property =3D prop;
+
+	if (plane->state) {
+		plane->state->zpos =3D zpos;
+		plane->state->normalized_zpos =3D zpos;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_zpos_immutable_property);
+
+static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
+{
+	const struct drm_plane_state *sa =3D *(struct drm_plane_state **)a;
+	const struct drm_plane_state *sb =3D *(struct drm_plane_state **)b;
+
+	if (sa->zpos !=3D sb->zpos)
+		return sa->zpos - sb->zpos;
+	else
+		return sa->plane->base.id - sb->plane->base.id;
+}
+
+/**
+ * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zpos v=
alues
+ * @crtc: crtc with planes, which have to be considered for normalizat=
ion
+ * @crtc_state: new atomic state to apply
+ *
+ * This function checks new states of all planes assigned to given crt=
c and
+ * calculates normalized zpos value for them. Planes are compared firs=
t by their
+ * zpos values, then by plane id (if zpos equals). Plane with lowest z=
pos value
+ * is at the bottom. The plane_state->normalized_zpos is then filled w=
ith unique
+ * values from 0 to number of active planes in crtc minus one.
+ *
+ * RETURNS
+ * Zero for success or -errno
+ */
+static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc=
,
+					  struct drm_crtc_state *crtc_state)
+{
+	struct drm_atomic_state *state =3D crtc_state->state;
+	struct drm_device *dev =3D crtc->dev;
+	int total_planes =3D dev->mode_config.num_total_plane;
+	struct drm_plane_state **states;
+	struct drm_plane *plane;
+	int i, n =3D 0;
+	int ret =3D 0;
+
+	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
+			 crtc->base.id, crtc->name);
+
+	states =3D kmalloc_array(total_planes, sizeof(*states), GFP_TEMPORARY=
);
+	if (!states)
+		return -ENOMEM;
+
+	/*
+	 * Normalization process might create new states for planes which
+	 * normalized_zpos has to be recalculated.
+	 */
+	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
+		struct drm_plane_state *plane_state =3D
+			drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state)) {
+			ret =3D PTR_ERR(plane_state);
+			goto done;
+		}
+		states[n++] =3D plane_state;
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
+				 plane->base.id, plane->name,
+				 plane_state->zpos);
+	}
+
+	sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL);
+
+	for (i =3D 0; i < n; i++) {
+		plane =3D states[i]->plane;
+
+		states[i]->normalized_zpos =3D i;
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
+				 plane->base.id, plane->name, i);
+	}
+	crtc_state->zpos_changed =3D true;
+
+done:
+	kfree(states);
+	return ret;
+}
+
+/**
+ * drm_atomic_helper_normalize_zpos - calculate normalized zpos values=
 for all
+ *				      crtcs
+ * @dev: DRM device
+ * @state: atomic state of DRM device
+ *
+ * This function calculates normalized zpos value for all modified pla=
nes in
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
+	int i, ret =3D 0;
+
+	for_each_plane_in_state(state, plane, plane_state, i) {
+		crtc =3D plane_state->crtc;
+		if (!crtc)
+			continue;
+		if (plane->state->zpos !=3D plane_state->zpos) {
+			crtc_state =3D
+				drm_atomic_get_existing_crtc_state(state, crtc);
+			crtc_state->zpos_changed =3D true;
+		}
+	}
+
+	for_each_crtc_in_state(state, crtc, crtc_state, i) {
+		if (crtc_state->plane_mask !=3D crtc->state->plane_mask ||
+		    crtc_state->zpos_changed) {
+			ret =3D drm_atomic_helper_crtc_normalize_zpos(crtc,
+								    crtc_state);
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_=
crtc_internal.h
index b248e22..3ea72e1 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -129,3 +129,7 @@ int drm_atomic_remove_fb(struct drm_framebuffer *fb=
);
=20
 int drm_modeset_register_all(struct drm_device *dev);
 void drm_modeset_unregister_all(struct drm_device *dev);
+
+/* drm_blend.c */
+int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
+				     struct drm_atomic_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 9e6ab4a..533c889 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -308,6 +308,7 @@ struct drm_plane_helper_funcs;
  * @mode_changed: crtc_state->mode or crtc_state->enable has been chan=
ged
  * @active_changed: crtc_state->active has been toggled.
  * @connectors_changed: connectors to this crtc have been updated
+ * @zpos_changed: zpos values of planes on this crtc have been updated
  * @color_mgmt_changed: color management properties have changed (dega=
mma or
  *	gamma LUT or CSC matrix)
  * @plane_mask: bitmask of (1 << drm_plane_index(plane)) of attached p=
lanes
@@ -344,6 +345,7 @@ struct drm_crtc_state {
 	bool mode_changed : 1;
 	bool active_changed : 1;
 	bool connectors_changed : 1;
+	bool zpos_changed : 1;
 	bool color_mgmt_changed : 1;
=20
 	/* attached planes bitmask:
@@ -1396,6 +1398,9 @@ struct drm_connector {
  * @src_w: width of visible portion of plane (in 16.16)
  * @src_h: height of visible portion of plane (in 16.16)
  * @rotation: rotation of the plane
+ * @zpos: priority of the given plane on crtc (optional)
+ * @normalized_zpos: normalized value of zpos: unique, range from 0 to=
 N-1
+ *	where N is the number of active planes for given crtc
  * @state: backpointer to global drm_atomic_state
  */
 struct drm_plane_state {
@@ -1416,6 +1421,10 @@ struct drm_plane_state {
 	/* Plane rotation */
 	unsigned int rotation;
=20
+	/* Plane zpos */
+	unsigned int zpos;
+	unsigned int normalized_zpos;
+
 	struct drm_atomic_state *state;
 };
=20
@@ -1675,6 +1684,7 @@ enum drm_plane_type {
  * @properties: property tracking for this plane
  * @type: type of plane (overlay, primary, cursor)
  * @state: current atomic state for this plane
+ * @zpos_property: zpos property for this plane
  * @helper_private: mid-layer private data
  */
 struct drm_plane {
@@ -1716,6 +1726,8 @@ struct drm_plane {
 	const struct drm_plane_helper_funcs *helper_private;
=20
 	struct drm_plane_state *state;
+
+	struct drm_property *zpos_property;
 };
=20
 /**
@@ -2774,6 +2786,24 @@ extern void drm_crtc_enable_color_mgmt(struct dr=
m_crtc *crtc,
 				       uint degamma_lut_size,
 				       bool has_ctm,
 				       uint gamma_lut_size);
+
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
+				   unsigned int zpos,
+				   unsigned int min, unsigned int max);
+
+int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
+					     unsigned int zpos);
+
 /* Helpers */
 struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 					     uint32_t id, uint32_t type);
--=20
1.9.1

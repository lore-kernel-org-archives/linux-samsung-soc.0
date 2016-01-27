From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 1/5] drm: add generic zpos property
Date: Wed, 27 Jan 2016 15:44:39 +0100
Message-ID: <1453905883-6807-2-git-send-email-m.szyprowski@samsung.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51140 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932725AbcA0Oo5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2016 09:44:57 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1M00I9D8YUEM10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jan 2016 14:44:55 +0000 (GMT)
In-reply-to: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

This patch adds support for generic plane's zpos property property with
well-defined semantics:
- added zpos properties to drm core and plane state structures
- added helpers for normalizing zpos properties of given set of planes
- well defined semantics: planes are sorted by zpos values and then pla=
ne
  id value if zpos equals

Normalized zpos values are calculated automatically when generic
muttable zpos property has been initialized. Drivers can simply use
plane_state->normalized_zpos in their atomic_check and/or plane_update
callbacks without any additional calls to DRM core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 Documentation/DocBook/gpu.tmpl      |  14 ++-
 drivers/gpu/drm/Makefile            |   2 +-
 drivers/gpu/drm/drm_atomic.c        |   4 +
 drivers/gpu/drm/drm_atomic_helper.c |   6 +
 drivers/gpu/drm/drm_blend.c         | 227 ++++++++++++++++++++++++++++=
++++++++
 drivers/gpu/drm/drm_crtc_internal.h |   3 +
 include/drm/drm_crtc.h              |  17 +++
 7 files changed, 270 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_blend.c

diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu=
=2Etmpl
index a8669330b456..ae7d913adf60 100644
--- a/Documentation/DocBook/gpu.tmpl
+++ b/Documentation/DocBook/gpu.tmpl
@@ -1816,7 +1816,7 @@ void intel_crt_init(struct drm_device *dev)
 	<td valign=3D"top" >Description/Restrictions</td>
 	</tr>
 	<tr>
-	<td rowspan=3D"37" valign=3D"top" >DRM</td>
+	<td rowspan=3D"38" valign=3D"top" >DRM</td>
 	<td valign=3D"top" >Generic</td>
 	<td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
 	<td valign=3D"top" >BITMASK</td>
@@ -2068,7 +2068,7 @@ void intel_crt_init(struct drm_device *dev)
 	<td valign=3D"top" >property to suggest an Y offset for a connector</=
td>
 	</tr>
 	<tr>
-	<td rowspan=3D"3" valign=3D"top" >Optional</td>
+	<td rowspan=3D"4" valign=3D"top" >Optional</td>
 	<td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
 	<td valign=3D"top" >ENUM</td>
 	<td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" }</td>
@@ -2092,6 +2092,16 @@ void intel_crt_init(struct drm_device *dev)
 	<td valign=3D"top" >TBD</td>
 	</tr>
 	<tr>
+	<td valign=3D"top" > "zpos" </td>
+	<td valign=3D"top" >RANGE</td>
+	<td valign=3D"top" >Min=3D0, Max=3D driver dependent</td>
+	<td valign=3D"top" >Plane</td>
+	<td valign=3D"top" >Plane's 'z' position during blending operation (0=
 for background, highest for frontmost).
+		If two planes assigned to same CRTC have equal zpos values, the plan=
e with higher plane
+		id is treated as closer to front. Can be IMMUTABLE if driver doesn't=
 support changing
+		planes' order. Exact value range is driver dependent.</td>
+	</tr>
+	<tr>
 	<td rowspan=3D"20" valign=3D"top" >i915</td>
 	<td rowspan=3D"2" valign=3D"top" >Generic</td>
 	<td valign=3D"top" >"Broadcast RGB"</td>
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 61766dec6a8d..eeefaba1c092 100644
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
index 3f74193885f1..a19201efb7d1 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -630,6 +630,8 @@ int drm_atomic_plane_set_property(struct drm_plane =
*plane,
 		state->src_h =3D val;
 	} else if (property =3D=3D config->rotation_property) {
 		state->rotation =3D val;
+	} else if (property =3D=3D config->zpos_property) {
+		state->zpos =3D val;
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
@@ -686,6 +688,8 @@ drm_atomic_plane_get_property(struct drm_plane *pla=
ne,
 		*val =3D state->src_h;
 	} else if (property =3D=3D config->rotation_property) {
 		*val =3D state->rotation;
+	} else if (property =3D=3D config->zpos_property) {
+		*val =3D state->zpos;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val=
);
 	} else {
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
index 53db2d9120be..9fbfb672b317 100644
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
@@ -530,6 +532,10 @@ drm_atomic_helper_check_planes(struct drm_device *=
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
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
new file mode 100644
index 000000000000..cdcb647c8ed9
--- /dev/null
+++ b/drivers/gpu/drm/drm_blend.c
@@ -0,0 +1,227 @@
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
+#include <linux/slab.h>
+#include <linux/sort.h>
+#include <linux/export.h>
+#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_atomic.h>
+
+#include "drm_internal.h"
+
+/**
+ * drm_mode_create_zpos_property - create muttable zpos property
+ * @dev: DRM device
+ * @min: minimal possible value of zpos property
+ * @max: maximal possible value of zpos property
+ *
+ * This function initializes generic muttable zpos property and enable=
s support
+ * for it in drm core. Drivers can then attach this property to planes=
 to enable
+ * support for configurable planes arrangement during blending operati=
on.
+ * Once muttable zpos property has been enabled, the DRM core will aut=
omatically
+ * calculate drm_plane_state->normalized_zpos values. Usually min shou=
ld be set
+ * to 0 and max to maximal number of planes for given crtc - 1.
+ *
+ * If zpos of some planes cannot be changed (like fixed backgroud or
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
+int drm_mode_create_zpos_property(struct drm_device *dev, unsigned int=
 min,
+				  unsigned int max)
+{
+	struct drm_property *prop;
+
+	prop =3D drm_property_create_range(dev, 0, "zpos", min, max);
+	if (!prop)
+		return -ENOMEM;
+
+	dev->mode_config.zpos_property =3D prop;
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_zpos_property);
+
+/**
+ * drm_mode_create_zpos_immutable_property - create immuttable zpos pr=
operty
+ * @dev: DRM device
+ * @min: minimal possible value of zpos property
+ * @max: maximal possible value of zpos property
+ *
+ * This function initializes generic immuttable zpos property and enab=
les
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
+int drm_mode_create_zpos_immutable_property(struct drm_device *dev,
+					    unsigned int min, unsigned int max)
+{
+	struct drm_property *prop;
+
+	prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "zpo=
s",
+					 min, max);
+	if (!prop)
+		return -ENOMEM;
+
+	dev->mode_config.zpos_immutable_property =3D prop;
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_zpos_immutable_property);
+
+static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
+{
+	const struct drm_plane_state *sa =3D *(struct drm_plane_state **)a;
+	const struct drm_plane_state *sb =3D *(struct drm_plane_state **)b;
+	int zpos_a =3D (sa->zpos << 16) + sa->plane->base.id;
+	int zpos_b =3D (sb->zpos << 16) + sb->plane->base.id;
+
+	return zpos_a - zpos_b;
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
ith uniqe
+ * values from 0 to number of active planes in crtc minus one.
+ *
+ * RETURNS
+ * Zero for success or -errno
+ */
+int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
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
+	states =3D kmalloc(total_planes * sizeof(*states), GFP_KERNEL);
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
+			goto fail;
+		}
+		states[n++] =3D plane_state;
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
+				 plane->base.id, plane->name, plane_state->zpos);
+	}
+
+	sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL);
+
+	for (i =3D 0; i < n; i++) {
+		plane =3D states[i]->plane;
+		states[i]->normalized_zpos =3D i;
+		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
+				 plane->base.id, plane->name, i);
+	}
+	crtc_state->zpos_changed =3D true;
+
+fail:
+	kfree(states);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);
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
+	/*
+	 * If zpos_property is not initialized, then it makes no sense
+	 * to calculate normalized zpos values.
+	 */
+	if (!dev->mode_config.zpos_property)
+		return 0;
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
index 247dc8b62564..c87cd956b74b 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -42,3 +42,6 @@ int drm_atomic_get_property(struct drm_mode_object *o=
bj,
 int drm_mode_atomic_ioctl(struct drm_device *dev,
 			  void *data, struct drm_file *file_priv);
=20
+/* drm_blend.c */
+int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
+				     struct drm_atomic_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index c65a212db77e..4f32a358d631 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -305,6 +305,7 @@ struct drm_plane_helper_funcs;
  * @mode_changed: crtc_state->mode or crtc_state->enable has been chan=
ged
  * @active_changed: crtc_state->active has been toggled.
  * @connectors_changed: connectors to this crtc have been updated
+ * @zpos_changed: zpos values of planes on this crtc have been updated
  * @plane_mask: bitmask of (1 << drm_plane_index(plane)) of attached p=
lanes
  * @connector_mask: bitmask of (1 << drm_connector_index(connector)) o=
f attached connectors
  * @last_vblank_count: for helpers and drivers to capture the vblank o=
f the
@@ -332,6 +333,7 @@ struct drm_crtc_state {
 	bool mode_changed : 1;
 	bool active_changed : 1;
 	bool connectors_changed : 1;
+	bool zpos_changed : 1;
=20
 	/* attached planes bitmask:
 	 * WARNING: transitional helpers do not maintain plane_mask so
@@ -1247,6 +1249,9 @@ struct drm_connector {
  *	plane (in 16.16)
  * @src_w: width of visible portion of plane (in 16.16)
  * @src_h: height of visible portion of plane (in 16.16)
+ * @zpos: priority of the given plane on crtc (optional)
+ * @normalized_zpos: normalized value of zpos: uniqe, range from 0 to
+ *	(number of planes - 1) for given crtc
  * @state: backpointer to global drm_atomic_state
  */
 struct drm_plane_state {
@@ -1267,6 +1272,10 @@ struct drm_plane_state {
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
@@ -2087,6 +2096,8 @@ struct drm_mode_config {
 	struct drm_property *tile_property;
 	struct drm_property *plane_type_property;
 	struct drm_property *rotation_property;
+	struct drm_property *zpos_property;
+	struct drm_property *zpos_immutable_property;
 	struct drm_property *prop_src_x;
 	struct drm_property *prop_src_y;
 	struct drm_property *prop_src_w;
@@ -2488,6 +2499,12 @@ extern struct drm_property *drm_mode_create_rota=
tion_property(struct drm_device
 extern unsigned int drm_rotation_simplify(unsigned int rotation,
 					  unsigned int supported_rotations);
=20
+extern int drm_mode_create_zpos_property(struct drm_device *dev,
+					 unsigned int min, unsigned int max);
+extern int drm_mode_create_zpos_immutable_property(struct drm_device *=
dev,
+						   unsigned int min,
+						   unsigned int max);
+
 /* Helpers */
=20
 static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
--=20
1.9.2

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/3] drm: add generic zpos property
Date: Tue, 12 Jan 2016 14:39:18 +0100
Message-ID: <1452605960-21194-2-git-send-email-m.szyprowski@samsung.com>
References: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12002 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759355AbcALNj4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2016 08:39:56 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0U00L95DYHK210@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2016 13:39:53 +0000 (GMT)
In-reply-to: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
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
---
 Documentation/DocBook/gpu.tmpl      |  14 ++++-
 drivers/gpu/drm/drm_atomic.c        |   4 ++
 drivers/gpu/drm/drm_atomic_helper.c | 116 ++++++++++++++++++++++++++++=
++++++++
 drivers/gpu/drm/drm_crtc.c          |  53 ++++++++++++++++
 include/drm/drm_crtc.h              |  14 +++++
 5 files changed, 199 insertions(+), 2 deletions(-)

diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu=
=2Etmpl
index 6c6e81a9eaf4..f6b7236141b6 100644
--- a/Documentation/DocBook/gpu.tmpl
+++ b/Documentation/DocBook/gpu.tmpl
@@ -2004,7 +2004,7 @@ void intel_crt_init(struct drm_device *dev)
 	<td valign=3D"top" >Description/Restrictions</td>
 	</tr>
 	<tr>
-	<td rowspan=3D"37" valign=3D"top" >DRM</td>
+	<td rowspan=3D"38" valign=3D"top" >DRM</td>
 	<td valign=3D"top" >Generic</td>
 	<td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
 	<td valign=3D"top" >BITMASK</td>
@@ -2256,7 +2256,7 @@ void intel_crt_init(struct drm_device *dev)
 	<td valign=3D"top" >property to suggest an Y offset for a connector</=
td>
 	</tr>
 	<tr>
-	<td rowspan=3D"3" valign=3D"top" >Optional</td>
+	<td rowspan=3D"4" valign=3D"top" >Optional</td>
 	<td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
 	<td valign=3D"top" >ENUM</td>
 	<td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" }</td>
@@ -2280,6 +2280,16 @@ void intel_crt_init(struct drm_device *dev)
 	<td valign=3D"top" >TBD</td>
 	</tr>
 	<tr>
+	<td valign=3D"top" > "zpos" </td>
+	<td valign=3D"top" >RANGE</td>
+	<td valign=3D"top" >Min=3D0, Max=3D255</td>
+	<td valign=3D"top" >Plane</td>
+	<td valign=3D"top" >Plane's 'z' position during blending (0 for backg=
round, 255 for frontmost).
+		If two planes assigned to same CRTC have equal zpos values, the plan=
e with higher plane
+		id is treated as closer to front. Can be IMMUTABLE if driver doesn't=
 support changing
+		planes' order.</td>
+	</tr>
+	<tr>
 	<td rowspan=3D"20" valign=3D"top" >i915</td>
 	<td rowspan=3D"2" valign=3D"top" >Generic</td>
 	<td valign=3D"top" >"Broadcast RGB"</td>
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.=
c
index 6a21e5c378c1..97bb069cb6a3 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -614,6 +614,8 @@ int drm_atomic_plane_set_property(struct drm_plane =
*plane,
 		state->src_h =3D val;
 	} else if (property =3D=3D config->rotation_property) {
 		state->rotation =3D val;
+	} else if (property =3D=3D config->zpos_property) {
+		state->zpos =3D val;
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
@@ -670,6 +672,8 @@ drm_atomic_plane_get_property(struct drm_plane *pla=
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
index d0d4b2ff7c21..257946fac94b 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -31,6 +31,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <linux/fence.h>
+#include <linux/sort.h>
=20
 /**
  * DOC: overview
@@ -507,6 +508,117 @@ drm_atomic_helper_check_modeset(struct drm_device=
 *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
=20
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
+					      struct drm_crtc_state *crtc_state)
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
+fail:
+	kfree(states);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);
+
+static int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
+					    struct drm_atomic_state *state)
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
+
 /**
  * drm_atomic_helper_check_planes - validate state object for planes c=
hanges
  * @dev: DRM device
@@ -532,6 +644,10 @@ drm_atomic_helper_check_planes(struct drm_device *=
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
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 62fa95fa5471..54a21e7c1ca5 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -5880,6 +5880,59 @@ struct drm_property *drm_mode_create_rotation_pr=
operty(struct drm_device *dev,
 EXPORT_SYMBOL(drm_mode_create_rotation_property);
=20
 /**
+ * drm_mode_create_zpos_property - create muttable zpos property
+ * @dev: DRM device
+ *
+ * This function initializes generic muttable zpos property and enable=
s support
+ * for it in drm core. Drivers can then attach this property to planes=
 to enable
+ * support for configurable planes arrangement during blending operati=
on.
+ * Drivers can also use drm_atomic_helper_normalize_zpos() function to=
 calculate
+ * drm_plane_state->normalized_zpos values.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_create_zpos_property(struct drm_device *dev)
+{
+	struct drm_property *prop;
+
+	prop =3D drm_property_create_range(dev, 0, "zpos", 0, 255);
+	if (!prop)
+		return -ENOMEM;
+
+	dev->mode_config.zpos_property =3D prop;
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_zpos_property);
+
+/**
+ * drm_plane_create_zpos_property - create immuttable zpos property
+ * @dev: DRM device
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
+int drm_mode_create_zpos_immutable_property(struct drm_device *dev)
+{
+	struct drm_property *prop;
+
+	prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "zpo=
s",
+					 0, 255);
+	if (!prop)
+		return -ENOMEM;
+
+	dev->mode_config.zpos_immutable_property =3D prop;
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_zpos_immutable_property);
+
+/**
  * DOC: Tile group
  *
  * Tile groups are used to represent tiled monitors with a unique
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 3b040b355472..0607ad2ce918 100644
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
  * @last_vblank_count: for helpers and drivers to capture the vblank o=
f the
  * 	update to ensure framebuffer cleanup isn't done too early
@@ -331,6 +332,7 @@ struct drm_crtc_state {
 	bool mode_changed : 1;
 	bool active_changed : 1;
 	bool connectors_changed : 1;
+	bool zpos_changed : 1;
=20
 	/* attached planes bitmask:
 	 * WARNING: transitional helpers do not maintain plane_mask so
@@ -1243,6 +1245,9 @@ struct drm_connector {
  *	plane (in 16.16)
  * @src_w: width of visible portion of plane (in 16.16)
  * @src_h: height of visible portion of plane (in 16.16)
+ * @zpos: priority of the given plane on crtc (optional)
+ * @normalized_zpos: normalized value of zpos: uniqe, range from 0 to
+ *	(number of planes - 1) for given crtc
  * @state: backpointer to global drm_atomic_state
  */
 struct drm_plane_state {
@@ -1263,6 +1268,10 @@ struct drm_plane_state {
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
@@ -2083,6 +2092,8 @@ struct drm_mode_config {
 	struct drm_property *tile_property;
 	struct drm_property *plane_type_property;
 	struct drm_property *rotation_property;
+	struct drm_property *zpos_property;
+	struct drm_property *zpos_immutable_property;
 	struct drm_property *prop_src_x;
 	struct drm_property *prop_src_y;
 	struct drm_property *prop_src_w;
@@ -2484,6 +2495,9 @@ extern struct drm_property *drm_mode_create_rotat=
ion_property(struct drm_device
 extern unsigned int drm_rotation_simplify(unsigned int rotation,
 					  unsigned int supported_rotations);
=20
+extern int drm_mode_create_zpos_property(struct drm_device *dev);
+extern int drm_mode_create_zpos_immutable_property(struct drm_device *=
dev);
+
 /* Helpers */
=20
 static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
--=20
1.9.2

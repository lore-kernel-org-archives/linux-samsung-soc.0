From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/3] drm: add generic zpos property
Date: Mon, 11 Jan 2016 16:14:15 +0100
Message-ID: <20160111151415.GA8076@phenom.ffwll.local>
References: <1452510185-22801-1-git-send-email-m.szyprowski@samsung.com>
 <1452510185-22801-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33615 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758434AbcAKPOP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 10:14:15 -0500
Received: by mail-wm0-f67.google.com with SMTP id u188so26687722wmu.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2016 07:14:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1452510185-22801-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

On Mon, Jan 11, 2016 at 12:03:03PM +0100, Marek Szyprowski wrote:
> This patch adds support for generic plane's zpos property property wi=
th
> well-defined semantics:
> - added zpos properties to drm core and plane state structures
> - added helpers for normalizing zpos properties of given set of plane=
s
> - well defined semantics: planes are sorted by zpos values and then p=
lane
>   id value if zpos equals
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/DocBook/gpu.tmpl      | 14 +++++++++--
>  drivers/gpu/drm/drm_atomic.c        |  4 ++++
>  drivers/gpu/drm/drm_atomic_helper.c | 45 +++++++++++++++++++++++++++=
++++++++
>  drivers/gpu/drm/drm_crtc.c          | 47 +++++++++++++++++++++++++++=
++++++++++
>  include/drm/drm_atomic_helper.h     |  2 ++
>  include/drm/drm_crtc.h              | 12 ++++++++++
>  6 files changed, 122 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/g=
pu.tmpl
> index 6c6e81a9eaf4..e81acd999891 100644
> --- a/Documentation/DocBook/gpu.tmpl
> +++ b/Documentation/DocBook/gpu.tmpl
> @@ -2004,7 +2004,7 @@ void intel_crt_init(struct drm_device *dev)
>  	<td valign=3D"top" >Description/Restrictions</td>
>  	</tr>
>  	<tr>
> -	<td rowspan=3D"37" valign=3D"top" >DRM</td>
> +	<td rowspan=3D"38" valign=3D"top" >DRM</td>
>  	<td valign=3D"top" >Generic</td>
>  	<td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
>  	<td valign=3D"top" >BITMASK</td>
> @@ -2256,7 +2256,7 @@ void intel_crt_init(struct drm_device *dev)
>  	<td valign=3D"top" >property to suggest an Y offset for a connector=
</td>
>  	</tr>
>  	<tr>
> -	<td rowspan=3D"3" valign=3D"top" >Optional</td>
> +	<td rowspan=3D"4" valign=3D"top" >Optional</td>
>  	<td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
>  	<td valign=3D"top" >ENUM</td>
>  	<td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" }</td=
>
> @@ -2280,6 +2280,16 @@ void intel_crt_init(struct drm_device *dev)
>  	<td valign=3D"top" >TBD</td>
>  	</tr>
>  	<tr>
> +	<td valign=3D"top" > "zpos" </td>
> +	<td valign=3D"top" >RANGE</td>
> +	<td valign=3D"top" >Min=3D0, Max=3D255</td>
> +	<td valign=3D"top" >Plane</td>
> +	<td valign=3D"top" >Plane's 'z' position during blending (0 for bac=
kground, 255 for frontmost).
> +		If two planes assigned to same CRTC have equal zpos values, the pl=
ane with higher plane
> +		id is treated as closer to front. Can be IMMUTABLE if driver doesn=
't support changing
> +		planes' order.</td>
> +	</tr>
> +	<tr>
>  	<td rowspan=3D"20" valign=3D"top" >i915</td>
>  	<td rowspan=3D"2" valign=3D"top" >Generic</td>
>  	<td valign=3D"top" >"Broadcast RGB"</td>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomi=
c.c
> index 6a21e5c378c1..97bb069cb6a3 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -614,6 +614,8 @@ int drm_atomic_plane_set_property(struct drm_plan=
e *plane,
>  		state->src_h =3D val;
>  	} else if (property =3D=3D config->rotation_property) {
>  		state->rotation =3D val;
> +	} else if (property =3D=3D config->zpos_property) {
> +		state->zpos =3D val;
>  	} else if (plane->funcs->atomic_set_property) {
>  		return plane->funcs->atomic_set_property(plane, state,
>  				property, val);
> @@ -670,6 +672,8 @@ drm_atomic_plane_get_property(struct drm_plane *p=
lane,
>  		*val =3D state->src_h;
>  	} else if (property =3D=3D config->rotation_property) {
>  		*val =3D state->rotation;
> +	} else if (property =3D=3D config->zpos_property) {
> +		*val =3D state->zpos;
>  	} else if (plane->funcs->atomic_get_property) {
>  		return plane->funcs->atomic_get_property(plane, state, property, v=
al);
>  	} else {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> index 268d37f26960..167d32346e2f 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <linux/fence.h>
> +#include <linux/sort.h>
> =20
>  /**
>   * DOC: overview
> @@ -2781,3 +2782,47 @@ void drm_atomic_helper_connector_destroy_state=
(struct drm_connector *connector,
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
> +
> +static int __drm_atomic_helper_plane_zpos_cmp(const void *a, const v=
oid *b)
> +{
> +	const struct drm_plane *pa =3D *(struct drm_plane **)a;
> +	const struct drm_plane *pb =3D *(struct drm_plane **)b;
> +	int zpos_a =3D 0, zpos_b =3D 0;
> +
> +	if (pa->state)
> +		zpos_a =3D pa->state->zpos << 16;
> +	if (pb->state)
> +		zpos_b =3D pb->state->zpos << 16;
> +
> +	zpos_a +=3D pa->base.id;
> +	zpos_b +=3D pb->base.id;
> +
> +	return zpos_a - zpos_b;
> +}
> +
> +/**
> + * drm_atomic_helper_normalize_zpos - calculate normalized zpos valu=
es
> + * @planes: arrays of pointer to planes to consider for normalizatio=
n
> + * @count: number of planes in the above array
> + *
> + * This function takes arrays of pointers to planes and calculates n=
ormalized
> + * zpos value for them taking into account each planes[i]->state->zp=
os value
> + * and plane's id. Planes are compared first by their zpos values, t=
hen in case
> + * they equal, by plane id. Plane with lowest zpos value is at the b=
ottom.
> + * The plane[i]->state->normalized_zpos is then filled with uniqe va=
lues from 0
> + * to count-1.
> + * Note: a side effect of this function is the fact that the planes =
array will
> + * be modified (sorted). It is up to the caller to construct planes =
array with
> + * all planes that have been assigned to given crtc.
> + */
> +void drm_atomic_helper_normalize_zpos(struct drm_plane *planes[], in=
t count)
> +{
> +	int i;
> +
> +	sort(planes, count, sizeof(struct drm_plane *),
> +	     __drm_atomic_helper_plane_zpos_cmp, NULL);
> +	for (i =3D 0; i < count; i++)
> +		if (planes[i]->state)
> +			planes[i]->state->normalized_zpos =3D i;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 62fa95fa5471..e33866084b70 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -5880,6 +5880,53 @@ struct drm_property *drm_mode_create_rotation_=
property(struct drm_device *dev,
>  EXPORT_SYMBOL(drm_mode_create_rotation_property);
> =20
>  /**
> + * drm_mode_create_zpos_property - create muttable zpos property
> + * @dev: DRM device
> + *
> + * This function initializes generic muttable zpos property and enab=
les support
> + * for it in drm core. Drivers can then attach this property to plan=
es to enable
> + * support for configurable planes arrangement during blending opera=
tion.
> + * Drivers can also use drm_atomic_helper_normalize_zpos() function =
to calculate
> + * drm_plane_state->normalized_zpos values.

Should also document return value semantics. Same for all the others wi=
th
non-void return value. But I have some more thoughts about the helper
interface itself (in reply to patch 2) so maybe that should wait a bit
until that's settled.
-Daniel

> + */
> +int drm_mode_create_zpos_property(struct drm_device *dev)
> +{
> +	struct drm_property *prop;
> +
> +	prop =3D drm_property_create_range(dev, 0, "zpos", 0, 255);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.zpos_property =3D prop;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_zpos_property);
> +
> +/**
> + * drm_plane_create_zpos_property - create immuttable zpos property
> + * @dev: DRM device
> + *
> + * This function initializes generic immuttable zpos property and en=
ables
> + * support for it in drm core. Using this property driver lets users=
pace
> + * to get the arrangement of the planes for blending operation and n=
otifies
> + * it that the hardware (or driver) doesn't support changing of the =
planes'
> + * order.
> + */
> +int drm_mode_create_zpos_immutable_property(struct drm_device *dev)
> +{
> +	struct drm_property *prop;
> +
> +	prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "z=
pos",
> +					 0, 255);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.zpos_immutable_property =3D prop;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_zpos_immutable_property);
> +
> +/**
>   * DOC: Tile group
>   *
>   * Tile groups are used to represent tiled monitors with a unique
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic=
_helper.h
> index a286cce98720..2a7ade5ad8bd 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -141,6 +141,8 @@ __drm_atomic_helper_connector_destroy_state(struc=
t drm_connector *connector,
>  void drm_atomic_helper_connector_destroy_state(struct drm_connector =
*connector,
>  					  struct drm_connector_state *state);
> =20
> +void drm_atomic_helper_normalize_zpos(struct drm_plane *planes[], in=
t count);
> +
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently at=
tached to CRTC
>   * @plane: the loop cursor
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 3b040b355472..13035e2c5e51 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1243,6 +1243,9 @@ struct drm_connector {
>   *	plane (in 16.16)
>   * @src_w: width of visible portion of plane (in 16.16)
>   * @src_h: height of visible portion of plane (in 16.16)
> + * @zpos: priority of the given plane on crtc (optional)
> + * @normalized_zpos: normalized value of zpos: uniqe, range from 0 t=
o
> + *	(number of planes - 1) for given crtc
>   * @state: backpointer to global drm_atomic_state
>   */
>  struct drm_plane_state {
> @@ -1263,6 +1266,10 @@ struct drm_plane_state {
>  	/* Plane rotation */
>  	unsigned int rotation;
> =20
> +	/* Plane zpos */
> +	unsigned int zpos;
> +	unsigned int normalized_zpos;
> +
>  	struct drm_atomic_state *state;
>  };
> =20
> @@ -2083,6 +2090,8 @@ struct drm_mode_config {
>  	struct drm_property *tile_property;
>  	struct drm_property *plane_type_property;
>  	struct drm_property *rotation_property;
> +	struct drm_property *zpos_property;
> +	struct drm_property *zpos_immutable_property;
>  	struct drm_property *prop_src_x;
>  	struct drm_property *prop_src_y;
>  	struct drm_property *prop_src_w;
> @@ -2484,6 +2493,9 @@ extern struct drm_property *drm_mode_create_rot=
ation_property(struct drm_device
>  extern unsigned int drm_rotation_simplify(unsigned int rotation,
>  					  unsigned int supported_rotations);
> =20
> +extern int drm_mode_create_zpos_property(struct drm_device *dev);
> +extern int drm_mode_create_zpos_immutable_property(struct drm_device=
 *dev);
> +
>  /* Helpers */
> =20
>  static inline struct drm_plane *drm_plane_find(struct drm_device *de=
v,
> --=20
> 1.9.2
>=20

--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

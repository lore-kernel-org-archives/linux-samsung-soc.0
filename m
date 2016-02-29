From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 4/5] drm: add generic blending related properties
Date: Mon, 29 Feb 2016 17:23:12 +0200
Message-ID: <20160229152312.GY15993@intel.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
 <1453905883-6807-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:51158 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752059AbcB2PXS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Feb 2016 10:23:18 -0500
Content-Disposition: inline
In-Reply-To: <1453905883-6807-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

On Wed, Jan 27, 2016 at 03:44:42PM +0100, Marek Szyprowski wrote:
> This patch adds code and documentation for the following blending
> related properties: 'alpha', 'blending' and 'alpha_premult'.
>=20
> 'alpha' property defines plane's transparency used for some blending
> modes.
>=20
> 'alpha_premult' property defines if RGB pixel data in the framebuffer
> contains values pre-multiplied by its alpha value or full range RGB
> values (0-255), which needs to be multiplied by pixel alpha value for
> blending operation.
>=20
> 'blending' property selects blending mode - by selecting one of the
> predefined values, user can select a pair of factors, which will be
> used in the generic blending equation. For more information, see
> the kerneldoc for the added code.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/DocBook/gpu.tmpl |  47 +++++++++++++++++-
>  drivers/gpu/drm/drm_atomic.c   |  12 +++++
>  drivers/gpu/drm/drm_blend.c    | 110 +++++++++++++++++++++++++++++++=
++++++++++
>  include/drm/drm_crtc.h         |  15 ++++++
>  include/uapi/drm/drm_mode.h    | 101 +++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 283 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/g=
pu.tmpl
> index ae7d913adf60..e5197368e68f 100644
> --- a/Documentation/DocBook/gpu.tmpl
> +++ b/Documentation/DocBook/gpu.tmpl
> @@ -1110,6 +1110,22 @@ int max_width, max_height;</synopsis>
>      </sect2>
>    </sect1>
> =20
> +  <!-- Internals: plane blending -->
> +
> +  <sect1 id=3D"drm-plane-blending">
> +    <title>Plane blending</title>
> +
> +    <sect2>
> +      <title>Plane Blending Overview</title>
> +!Pinclude/uapi/drm/drm_mode.h Generic plane blending operation
> +    </sect2>
> +    <sect2>
> +      <title>Blending Function Reference</title>
> +!Iinclude/uapi/drm/drm_mode.h
> +!Edrivers/gpu/drm/drm_blend.c
> +    </sect2>
> +  </sect1>
> +
>    <!-- Internals: kms initialization and cleanup -->
> =20
>    <sect1 id=3D"drm-kms-init">
> @@ -1816,7 +1832,7 @@ void intel_crt_init(struct drm_device *dev)
>  	<td valign=3D"top" >Description/Restrictions</td>
>  	</tr>
>  	<tr>
> -	<td rowspan=3D"38" valign=3D"top" >DRM</td>
> +	<td rowspan=3D"41" valign=3D"top" >DRM</td>
>  	<td valign=3D"top" >Generic</td>
>  	<td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
>  	<td valign=3D"top" >BITMASK</td>
> @@ -2068,7 +2084,7 @@ void intel_crt_init(struct drm_device *dev)
>  	<td valign=3D"top" >property to suggest an Y offset for a connector=
</td>
>  	</tr>
>  	<tr>
> -	<td rowspan=3D"4" valign=3D"top" >Optional</td>
> +	<td rowspan=3D"7" valign=3D"top" >Optional</td>
>  	<td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
>  	<td valign=3D"top" >ENUM</td>
>  	<td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" }</td=
>
> @@ -2102,6 +2118,33 @@ void intel_crt_init(struct drm_device *dev)
>  		planes' order. Exact value range is driver dependent.</td>
>  	</tr>
>  	<tr>
> +	<td valign=3D"top" > "alpha" </td>
> +	<td valign=3D"top" >RANGE</td>
> +	<td valign=3D"top" >Min=3D0, Max=3D driver dependent</td>
> +	<td valign=3D"top" >Plane</td>
> +	<td valign=3D"top" >Plane's alpha value (transparency) for blending=
 operation. Used in some blending modes. </td>
> +	</tr>
> +	<tr>
> +	<td valign=3D"top" > "alpha_premult" </td>
> +	<td valign=3D"top" >BOOL</td>
> +	<td valign=3D"top" >Min=3D0, Max=3D1</td>
> +	<td valign=3D"top" >Plane</td>
> +	<td valign=3D"top" >Indicates the range of the RGB data of the fram=
ebuffer attached to the given plane.
> +		When enabled, RGB values fits the range from 0 to pixel's alpha va=
lue. When disabled, RGB
> +		values are from 0 to 255 range and during blending operations they=
 will be multiplied by
> +		the pixel's alpha value first before computing result of blending =
equations. Value of this
> +		property is used in some blending modes and only when user attache=
s framebuffer with pixel
> +		format, which contains non-binary alpha channel.</td>

I have a hard to figure out what that is saying. The fact that it goes
on talking about ranges of the RGB values is IMO just confusing.

I'm pretty sure I've suggested it before, but I would just make this
some kind of 'alpha_premultiply' which when enabled will perform the
premultiplication, and when disabled it won't.

Description could IMO be something as simple as=20
"Premultiply the source RGB values with the source alpha before blendin=
g?"

> +	</tr>
> +	<tr>
> +	<td valign=3D"top" > "blending" </td>
> +	<td valign=3D"top" >ENUM</td>
> +	<td valign=3D"top" >{ "disabled", "pixel-alpha", "const-alpha" "pix=
el-const-alpha" }</td>
> +	<td valign=3D"top" >Plane</td>
> +	<td valign=3D"top" >Selects algorithm used in plane blending operat=
ion. For more information, see
> +		DRM_BLEND_* symbolic constant documentation. </td>
> +	</tr>
> +	<tr>
>  	<td rowspan=3D"20" valign=3D"top" >i915</td>
>  	<td rowspan=3D"2" valign=3D"top" >Generic</td>
>  	<td valign=3D"top" >"Broadcast RGB"</td>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomi=
c.c
> index a19201efb7d1..a85da144fd95 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -632,6 +632,12 @@ int drm_atomic_plane_set_property(struct drm_pla=
ne *plane,
>  		state->rotation =3D val;
>  	} else if (property =3D=3D config->zpos_property) {
>  		state->zpos =3D val;
> +	} else if (property =3D=3D config->alpha_property) {
> +		state->alpha =3D val;
> +	} else if (property =3D=3D config->alpha_premult_property) {
> +		state->alpha_premult =3D val;
> +	} else if (property =3D=3D config->blending_property) {
> +		state->blending =3D val;
>  	} else if (plane->funcs->atomic_set_property) {
>  		return plane->funcs->atomic_set_property(plane, state,
>  				property, val);
> @@ -690,6 +696,12 @@ drm_atomic_plane_get_property(struct drm_plane *=
plane,
>  		*val =3D state->rotation;
>  	} else if (property =3D=3D config->zpos_property) {
>  		*val =3D state->zpos;
> +	} else if (property =3D=3D config->alpha_property) {
> +		*val =3D state->alpha;
> +	} else if (property =3D=3D config->alpha_premult_property) {
> +		*val =3D state->alpha_premult;
> +	} else if (property =3D=3D config->blending_property) {
> +		*val =3D state->blending;
>  	} else if (plane->funcs->atomic_get_property) {
>  		return plane->funcs->atomic_get_property(plane, state, property, v=
al);
>  	} else {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.=
c
> index cdcb647c8ed9..eb7996a848df 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -99,6 +99,116 @@ int drm_mode_create_zpos_immutable_property(struc=
t drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_mode_create_zpos_immutable_property);
> =20
> +/**
> + * drm_mode_create_blending_property - create generic blending prope=
rty
> + * @dev: DRM device
> + * @supported_blendings: array of supported blending modes
> + * @supported_blendings_count: size of @supported_blendings array
> + *
> + * This function initializes generic blending property to selected s=
ubset
> + * of supported blending modes. Drivers can then attach this propert=
y to
> + * planes to let userspace to configure different blending modes. Fo=
r more
> + * information on blending modes, see DRM_BLEND_* defines.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_blending_property(struct drm_device *dev,
> +				      unsigned int *supported_blendings,
> +				      unsigned int supported_blendings_count)
> +{
> +	struct drm_property *prop;
> +	static const struct drm_prop_enum_list all_values[] =3D {
> +		{ DRM_BLEND_DISABLED,		"disabled" },
> +		{ DRM_BLEND_PIXEL_ALPHA,	"pixel-alpha" },
> +		{ DRM_BLEND_CONST_ALPHA,	"const-alpha" },
> +		{ DRM_BLEND_PIXEL_CONST_ALPHA,	"pixel-const-alpha" },
> +	};

Why do we need these names for the modes? Can't we just use the real
GLesque things? They would at least tell you waht it's going to instead
of having to guess. Also these are clearly missing needed stuff
(eg. src=3D1.0 dst=3D1.0-src alpha)

> +	struct drm_prop_enum_list *values;
> +	int i, j;
> +
> +	values =3D kmalloc(supported_blendings_count * sizeof(*values),
> +			 GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < supported_blendings_count; i++) {
> +		for (j =3D 0; j < ARRAY_SIZE(all_values); j++) {
> +			if (all_values[j].type =3D=3D supported_blendings[i]) {
> +				values[i].type =3D supported_blendings[i];
> +				values[i].name =3D all_values[j].name;
> +				break;
> +			}
> +		}
> +	}
> +
> +	prop =3D drm_property_create_enum(dev, 0, "blending", values,
> +					supported_blendings_count);
> +	kfree(values);
> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.blending_property =3D prop;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_blending_property);
> +
> +/**
> + * drm_mode_create_alpha_property - create plane alpha property
> + * @dev: DRM device
> + * @max: maximal possible value of alpha property
> + *
> + * This function initializes generic plane's alpha property. It's va=
lue is used
> + * for blending operations, depending on selected blending mode. For=
 more
> + * information, see DRM_BLEND_* modes and its documentation. Maximum=
 alpha value
> + * is determined by the driver.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_alpha_property(struct drm_device *dev, unsigned =
int max)
> +{
> +	struct drm_property *prop;
> +
> +	prop =3D drm_property_create_range(dev, 0, "alpha", 0, max);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.alpha_property =3D prop;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_alpha_property);
> +
> +/**
> + * drm_mode_create_alpha_premult_property - create muttable zpos pro=
perty
> + * @dev: DRM device
> + *
> + * This function initializes generic plane's alpha pre-multiplicatio=
n property.
> + * This property indicates the range of the RGB data of the framebuf=
fer attached
> + * to the given plane. When enabled, RGB values fits the range from =
0 to pixel's
> + * alpha value. When disabled, RGB values are from 0 to 255 range an=
d during
> + * blending operations they will be multiplied by the pixel's alpha =
value first
> + * before computing result of blending equations. Value of this prop=
erty is used
> + * only when user attaches framebuffer with pixel format, which cont=
ains
> + * non-binary alpha channel (for example: DRM_FORMAT_ARGB8888).
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_alpha_premult_property(struct drm_device *dev)
> +{
> +	struct drm_property *prop;
> +
> +	prop =3D drm_property_create_bool(dev, 0, "alpha_premult");
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	dev->mode_config.alpha_premult_property =3D prop;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_alpha_premult_property);
> +
>  static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
>  {
>  	const struct drm_plane_state *sa =3D *(struct drm_plane_state **)a;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 702f4f28f580..47ae79483a19 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1276,6 +1276,11 @@ struct drm_plane_state {
>  	unsigned int zpos;
>  	unsigned int normalized_zpos;
> =20
> +	/* Plane blending */
> +	unsigned int blending;
> +	unsigned int alpha;
> +	bool alpha_premult;
> +
>  	struct drm_atomic_state *state;
>  };
> =20
> @@ -2098,6 +2103,9 @@ struct drm_mode_config {
>  	struct drm_property *rotation_property;
>  	struct drm_property *zpos_property;
>  	struct drm_property *zpos_immutable_property;
> +	struct drm_property *blending_property;
> +	struct drm_property *alpha_property;
> +	struct drm_property *alpha_premult_property;
>  	struct drm_property *prop_src_x;
>  	struct drm_property *prop_src_y;
>  	struct drm_property *prop_src_w;
> @@ -2505,6 +2513,13 @@ extern int drm_mode_create_zpos_immutable_prop=
erty(struct drm_device *dev,
>  						   unsigned int min,
>  						   unsigned int max);
> =20
> +extern int drm_mode_create_blending_property(struct drm_device *dev,
> +				      unsigned int *supported_blendings,
> +				      unsigned int supported_blendings_count);
> +extern int drm_mode_create_alpha_property(struct drm_device *dev,
> +					  unsigned int max);
> +extern int drm_mode_create_alpha_premult_property(struct drm_device =
*dev);
> +
>  /* Helpers */
> =20
>  static inline struct drm_plane *drm_plane_find(struct drm_device *de=
v,
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.=
h
> index 50adb46204c2..6da7076a3856 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -596,4 +596,105 @@ struct drm_mode_destroy_blob {
>  	__u32 blob_id;
>  };
> =20
> +/**
> + * DOC: Generic plane blending operation
> + *
> + * Planes attached to one CRTC are blended by the hardware to produc=
e the final
> + * result on the display. The order of planes during blending operat=
ion is
> + * determined by 'zpos' property. When order of plane for blending o=
peration is
> + * determined, then framebuffers of all planes are placed on the dis=
play area
> + * according to the configured position and target size.
> + *
> + * Then one of the selected blending procedure is applied to each pi=
xel on the
> + * display area to compute the final result of the blending. The ble=
nding
> + * procedure is similar to the well known glBlendFunc() API.
> + *
> + * The generic equation for blending is:
> + * outputRGB =3D sF * sRGB + dF * dRGB
> + *
> + * @sRGB: are RGB values of blended plane
> + *
> + * @dRGB: are RGB values of plane's background (result of previous b=
lending or
> + * 	RGB pixel values of deeper planes).
> + *
> + * @sF and @dF: are one of DRM_FACTOR_* symbolic constants.
> + *
> + * Blending mode then defined as DRM_BLEND(sF, dF), which selects re=
spective
> + * factors for the above equation. For more information, see drm_ble=
nd_mode
> + * enum.
> + */
> +
> +/**
> + * enum drm_blend_factor - factors for defining plane blending formu=
la
> + * @DRM_FACTOR_ZERO: constant zero
> + * @DRM_FACTOR_ONE: constant one
> + * @DRM_FACTOR_SRC_ALPHA: pixel alpha value
> + * @DRM_FACTOR_ONE_MINUS_SRC_ALPHA: 1 - DRM_FACTOR_SRC_ALPHA
> + * @DRM_FACTOR_CONST_ALPHA: constant alpha (plane's property)
> + * @DRM_FACTOR_ONE_MINUS_CONST_ALPHA: 1 - DRM_FACTOR_CONST_ALPHA
> + * @DRM_FACTOR_SRC_CONST_ALPHA: pixel alpha value multiplied by plan=
e's
> + *				constant alpha
> + * @DRM_FACTOR_ONE_MINUS_SRC_CONST_ALPHA: 1 - DRM_FACTOR_SRC_CONST_A=
LPHA
> + *
> + * Values of this enum are used to define plane blending formula. Tw=
o factors
> + * have to be selected - one for source plane and one for destinatio=
n
> + * (background).
> + */
> +enum drm_blend_factor {
> +	DRM_FACTOR_ZERO,
> +	DRM_FACTOR_ONE,
> +	DRM_FACTOR_SRC_ALPHA,
> +	DRM_FACTOR_ONE_MINUS_SRC_ALPHA,
> +	DRM_FACTOR_CONST_ALPHA,
> +	DRM_FACTOR_ONE_MINUS_CONST_ALPHA,
> +	DRM_FACTOR_SRC_CONST_ALPHA,
> +	DRM_FACTOR_ONE_MINUS_SRC_CONST_ALPHA,
> +};
> +
> +#define DRM_BLEND(s, d) ((d << 16) | (s))
> +
> +/**
> + * enum drm_blend_mode - predefined blending modes
> + * @DRM_BLEND_S_ONE_D_ZERO: no transparency; per-pixel and plane's a=
lpha is
> + *	ignored regardless of the selected pixel format.
> + * @DRM_BLEND_S_SRC_ALPHA_D_ONE_MINUS_SRC_ALPHA: blending with per-p=
ixel alpha;
> + *	plane's alpha is ignored, aplies only when pixel format defines a=
lpha
> + *	channel, otherwise same as @DRM_BLEND_DISABLED and
> + *	@DRM_BLEND_S_ONE_D_ZERO.
> + * @DRM_BLEND_S_CONST_ALPHA_D_ONE_MINUS_CONST_ALPHA: blending with c=
onstant
> + *	alpha; per-pixel alpha is ignored regardless of the selected pixe=
l
> + *	format.
> + * @DRM_BLEND_S_SRC_CONST_ALPHA_D_ONE_MINUS_SRC_CONST_ALPHA: blendin=
g with both
> + *	per-pixel and plane's alpha; aplies only when pixel format define=
s alpha
> + *	channel, otherwise same as @DRM_BLEND_CONST_ALPHA and
> + *	@DRM_BLEND_S_CONST_ALPHA_D_ONE_MINUS_CONST_ALPHA
> + * @DRM_BLEND_DISABLED: same as @DRM_BLEND_S_ONE_D_ZERO
> + * @DRM_BLEND_PIXEL_ALPHA: same as @DRM_BLEND_S_SRC_ALPHA_D_ONE_MINU=
S_SRC_ALPHA,
> + * @DRM_BLEND_CONST_ALPHA: same as
> + *	@DRM_BLEND_S_CONST_ALPHA_D_ONE_MINUS_CONST_ALPHA,
> + * @DRM_BLEND_PIXEL_CONST_ALPHA: same as
> + *	@DRM_BLEND_S_SRC_CONST_ALPHA_D_ONE_MINUS_SRC_CONST_ALPHA,
> + *
> + * Values of this enum can be set to 'blend' plane's property. The a=
ctual
> + * value of each blending mode consists of two drm_blend_factor valu=
es
> + * encoded on lower 16 bits for source plane and higher 16 bits for =
destiantion
> + * (background).
> + */
> +enum drm_blend_mode {
> +	DRM_BLEND_S_ONE_D_ZERO =3D DRM_BLEND(DRM_FACTOR_ONE, DRM_FACTOR_ZER=
O),
> +	DRM_BLEND_S_SRC_ALPHA_D_ONE_MINUS_SRC_ALPHA =3D
> +		DRM_BLEND(DRM_FACTOR_SRC_ALPHA,
> +			  DRM_FACTOR_ONE_MINUS_SRC_ALPHA),
> +	DRM_BLEND_S_CONST_ALPHA_D_ONE_MINUS_CONST_ALPHA =3D
> +		DRM_BLEND(DRM_FACTOR_CONST_ALPHA,
> +			  DRM_FACTOR_ONE_MINUS_CONST_ALPHA),
> +	DRM_BLEND_S_SRC_CONST_ALPHA_D_ONE_MINUS_SRC_CONST_ALPHA =3D
> +		DRM_BLEND(DRM_FACTOR_SRC_CONST_ALPHA,
> +			  DRM_FACTOR_ONE_MINUS_SRC_CONST_ALPHA),
> +	DRM_BLEND_DISABLED =3D DRM_BLEND_S_ONE_D_ZERO,
> +	DRM_BLEND_PIXEL_ALPHA =3D DRM_BLEND_S_SRC_ALPHA_D_ONE_MINUS_SRC_ALP=
HA,
> +	DRM_BLEND_CONST_ALPHA =3D DRM_BLEND_S_CONST_ALPHA_D_ONE_MINUS_CONST=
_ALPHA,
> +	DRM_BLEND_PIXEL_CONST_ALPHA =3D DRM_BLEND_S_SRC_CONST_ALPHA_D_ONE_M=
INUS_SRC_CONST_ALPHA,
> +};
> +
>  #endif
> --=20
> 1.9.2

--=20
Ville Syrj=C3=A4l=C3=A4
Intel OTC

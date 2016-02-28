From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 2/5] drm/exynos: use generic code for managing zpos
 plane property
Date: Mon, 29 Feb 2016 08:27:23 +0900
Message-ID: <56D3825B.4030803@samsung.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
 <1453905883-6807-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55135 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755085AbcB1X11 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Feb 2016 18:27:27 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O3A0079R6HOBE00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Feb 2016 08:27:24 +0900 (KST)
In-reply-to: <1453905883-6807-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com



2016=EB=85=84 01=EC=9B=94 27=EC=9D=BC 23:44=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch replaces zpos property handling custom code in Exynos DRM
> driver with calls to generic DRM code.

It'd be better to go to drm-misc.

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 -
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 68 ++++++++-------------=
----------
>  drivers/gpu/drm/exynos/exynos_mixer.c     |  6 ++-
>  3 files changed, 20 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 17b5ded72ff1..816537886e4e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -64,7 +64,6 @@ struct exynos_drm_plane_state {
>  	struct exynos_drm_rect src;
>  	unsigned int h_ratio;
>  	unsigned int v_ratio;
> -	unsigned int zpos;
>  };
> =20
>  static inline struct exynos_drm_plane_state *
> @@ -217,7 +216,6 @@ struct exynos_drm_private {
>  	 * this array is used to be aware of which crtc did it request vbla=
nk.
>  	 */
>  	struct drm_crtc *crtc[MAX_CRTC];
> -	struct drm_property *plane_zpos_property;
> =20
>  	unsigned long da_start;
>  	unsigned long da_space_size;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/=
drm/exynos/exynos_drm_plane.c
> index d86227236f55..3a486939168e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -137,9 +137,9 @@ static void exynos_drm_plane_reset(struct drm_pla=
ne *plane)
> =20
>  	exynos_state =3D kzalloc(sizeof(*exynos_state), GFP_KERNEL);
>  	if (exynos_state) {
> -		exynos_state->zpos =3D exynos_plane->config->zpos;
>  		plane->state =3D &exynos_state->base;
>  		plane->state->plane =3D plane;
> +		plane->state->zpos =3D exynos_plane->config->zpos;
>  	}
>  }
> =20
> @@ -155,7 +155,6 @@ exynos_drm_plane_duplicate_state(struct drm_plane=
 *plane)
>  		return NULL;
> =20
>  	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
> -	copy->zpos =3D exynos_state->zpos;
>  	return &copy->base;
>  }
> =20
> @@ -168,43 +167,6 @@ static void exynos_drm_plane_destroy_state(struc=
t drm_plane *plane,
>  	kfree(old_exynos_state);
>  }
> =20
> -static int exynos_drm_plane_atomic_set_property(struct drm_plane *pl=
ane,
> -						struct drm_plane_state *state,
> -						struct drm_property *property,
> -						uint64_t val)
> -{
> -	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> -	struct exynos_drm_plane_state *exynos_state =3D
> -					to_exynos_plane_state(state);
> -	struct exynos_drm_private *dev_priv =3D plane->dev->dev_private;
> -	const struct exynos_drm_plane_config *config =3D exynos_plane->conf=
ig;
> -
> -	if (property =3D=3D dev_priv->plane_zpos_property &&
> -	    (config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS))
> -		exynos_state->zpos =3D val;
> -	else
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
> -static int exynos_drm_plane_atomic_get_property(struct drm_plane *pl=
ane,
> -					  const struct drm_plane_state *state,
> -					  struct drm_property *property,
> -					  uint64_t *val)
> -{
> -	const struct exynos_drm_plane_state *exynos_state =3D
> -		container_of(state, const struct exynos_drm_plane_state, base);
> -	struct exynos_drm_private *dev_priv =3D plane->dev->dev_private;
> -
> -	if (property =3D=3D dev_priv->plane_zpos_property)
> -		*val =3D exynos_state->zpos;
> -	else
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -
>  static struct drm_plane_funcs exynos_plane_funcs =3D {
>  	.update_plane	=3D drm_atomic_helper_update_plane,
>  	.disable_plane	=3D drm_atomic_helper_disable_plane,
> @@ -213,8 +175,6 @@ static struct drm_plane_funcs exynos_plane_funcs =
=3D {
>  	.reset		=3D exynos_drm_plane_reset,
>  	.atomic_duplicate_state =3D exynos_drm_plane_duplicate_state,
>  	.atomic_destroy_state =3D exynos_drm_plane_destroy_state,
> -	.atomic_set_property =3D exynos_drm_plane_atomic_set_property,
> -	.atomic_get_property =3D exynos_drm_plane_atomic_get_property,
>  };
> =20
>  static int
> @@ -302,20 +262,23 @@ static const struct drm_plane_helper_funcs plan=
e_helper_funcs =3D {
>  };
> =20
>  static void exynos_plane_attach_zpos_property(struct drm_plane *plan=
e,
> -					      unsigned int zpos)
> +					      unsigned int zpos, bool immutable)
>  {
>  	struct drm_device *dev =3D plane->dev;
> -	struct exynos_drm_private *dev_priv =3D dev->dev_private;
>  	struct drm_property *prop;
> =20
> -	prop =3D dev_priv->plane_zpos_property;
> -	if (!prop) {
> -		prop =3D drm_property_create_range(dev, 0, "zpos",
> -						 0, MAX_PLANE - 1);
> -		if (!prop)
> -			return;
> -
> -		dev_priv->plane_zpos_property =3D prop;
> +	if (immutable) {
> +		if (!dev->mode_config.zpos_immutable_property)
> +			if (drm_mode_create_zpos_immutable_property(dev, 0,
> +								MAX_PLANE - 1))
> +				return;
> +		prop =3D dev->mode_config.zpos_immutable_property;
> +	} else {
> +		if (!dev->mode_config.zpos_property)
> +			if (drm_mode_create_zpos_property(dev, 0,
> +							  MAX_PLANE - 1))
> +				return;
> +		prop =3D dev->mode_config.zpos_property;
>  	}
> =20
>  	drm_object_attach_property(&plane->base, prop, zpos);
> @@ -344,7 +307,8 @@ int exynos_plane_init(struct drm_device *dev,
>  	exynos_plane->index =3D index;
>  	exynos_plane->config =3D config;
> =20
> -	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos=
);
> +	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos=
,
> +			   !(config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS));
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index b5fbc1cbf024..d00c201773c9 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -478,6 +478,7 @@ static void vp_video_buffer(struct mixer_context =
*ctx,
>  	struct drm_display_mode *mode =3D &state->base.crtc->state->adjuste=
d_mode;
>  	struct mixer_resources *res =3D &ctx->mixer_res;
>  	struct drm_framebuffer *fb =3D state->base.fb;
> +	unsigned int priority =3D state->base.normalized_zpos + 1;
>  	unsigned long flags;
>  	dma_addr_t luma_addr[2], chroma_addr[2];
>  	bool tiled_mode =3D false;
> @@ -562,7 +563,7 @@ static void vp_video_buffer(struct mixer_context =
*ctx,
> =20
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> -	mixer_cfg_layer(ctx, plane->index, state->zpos + 1, true);
> +	mixer_cfg_layer(ctx, plane->index, priority, true);
>  	mixer_cfg_vp_blend(ctx);
>  	mixer_run(ctx);
> =20
> @@ -587,6 +588,7 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx,
>  	struct drm_display_mode *mode =3D &state->base.crtc->state->adjuste=
d_mode;
>  	struct mixer_resources *res =3D &ctx->mixer_res;
>  	struct drm_framebuffer *fb =3D state->base.fb;
> +	unsigned int priority =3D state->base.normalized_zpos + 1;
>  	unsigned long flags;
>  	unsigned int win =3D plane->index;
>  	unsigned int x_ratio =3D 0, y_ratio =3D 0;
> @@ -678,7 +680,7 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx,
> =20
>  	mixer_cfg_scan(ctx, mode->vdisplay);
>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
> -	mixer_cfg_layer(ctx, win, state->zpos + 1, true);
> +	mixer_cfg_layer(ctx, win, priority, true);
>  	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
> =20
>  	/* layer update mandatory for mixer 16.0.33.0 */
>=20

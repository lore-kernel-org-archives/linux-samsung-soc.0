From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 10/22] drm/exynos: introduce exynos_drm_plane_config
 structure
Date: Thu, 10 Dec 2015 20:47:32 +0900
Message-ID: <56696654.4000102@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-11-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49277 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751238AbbLJLrg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 06:47:36 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZ501UVB4RA8D10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Dec 2015 20:47:34 +0900 (KST)
In-reply-to: <1448891617-18830-11-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Marek,

2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch adds common structure for keeping plane configuration and
> capabilities data. This patch is inspired by similar code developed b=
y
> Tobias Jakobi.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 18 ++++++++---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 23 +++++++++-----
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       | 19 ++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 25 ++++++++++-----
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 34 +++++++++--------=
----
>  drivers/gpu/drm/exynos/exynos_drm_plane.h     |  7 ++---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 25 ++++++++++-----
>  drivers/gpu/drm/exynos/exynos_mixer.c         | 44 +++++++++++++++--=
----------
>  8 files changed, 121 insertions(+), 74 deletions(-)
>=20
<--snip-->
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_vidi.c
> index 3ce141236fad..90701647aef1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -30,7 +30,6 @@
> =20
>  /* vidi has totally three virtual windows. */
>  #define WINDOWS_NR		3
> -#define CURSOR_WIN		2
> =20
>  #define ctx_from_connector(c)	container_of(c, struct vidi_context, \
>  					connector)
> @@ -90,6 +89,12 @@ static const uint32_t formats[] =3D {
>  	DRM_FORMAT_NV12,
>  };
> =20
> +static const enum drm_plane_type vidi_win_types[WINDOWS_NR] =3D {
> +	DRM_PLANE_TYPE_PRIMARY,
> +	DRM_PLANE_TYPE_OVERLAY,
> +	DRM_PLANE_TYPE_CURSOR,
> +};
> +
>  static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
>  {
>  	struct vidi_context *ctx =3D crtc->ctx;
> @@ -442,17 +447,21 @@ static int vidi_bind(struct device *dev, struct=
 device *master, void *data)
>  	struct drm_device *drm_dev =3D data;
>  	struct drm_encoder *encoder =3D &ctx->encoder;
>  	struct exynos_drm_plane *exynos_plane;
> -	enum drm_plane_type type;
> -	unsigned int zpos;
> +	struct exynos_drm_plane_config plane_config =3D { 0 };
> +	unsigned int i;
>  	int pipe, ret;
> =20
>  	vidi_ctx_initialize(ctx, drm_dev);
> =20
> -	for (zpos =3D 0; zpos < WINDOWS_NR; zpos++) {
> -		type =3D exynos_plane_get_type(zpos, CURSOR_WIN);
> -		ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, formats,
> -					ARRAY_SIZE(formats), zpos);
> +	plane_config.pixel_formats =3D formats;
> +	plane_config.num_pixel_formats =3D ARRAY_SIZE(formats);
> +
> +	for (i =3D 0; i < WINDOWS_NR; i++) {
> +		plane_config.zpos =3D i;
> +		plane_config.type =3D vidi_win_types(i);

vidi_win_types is not really a function. So this should be 'vidi_win_ty=
pe[i]'
This is a trivial so I can fix it.

Thanks,
Inki Dae

> +
> +		ret =3D exynos_plane_init(drm_dev, &ctx->planes[i],
> +					1 << ctx->pipe, &plane_config);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 8d2ce13eb725..a229f86d221a 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -43,7 +43,6 @@
> =20
>  #define MIXER_WIN_NR		3
>  #define VP_DEFAULT_WIN		2
> -#define CURSOR_WIN		1
> =20
>  /* The pixelformats that are natively supported by the mixer. */
>  #define MXR_FORMAT_RGB565	4
> @@ -112,6 +111,25 @@ struct mixer_drv_data {
>  	bool					has_sclk;
>  };
> =20
> +static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_=
NR] =3D {
> +	{
> +		.zpos =3D 0,
> +		.type =3D DRM_PLANE_TYPE_PRIMARY,
> +		.pixel_formats =3D mixer_formats,
> +		.num_pixel_formats =3D ARRAY_SIZE(mixer_formats),
> +	}, {
> +		.zpos =3D 1,
> +		.type =3D DRM_PLANE_TYPE_CURSOR,
> +		.pixel_formats =3D mixer_formats,
> +		.num_pixel_formats =3D ARRAY_SIZE(mixer_formats),
> +	}, {
> +		.zpos =3D 2,
> +		.type =3D DRM_PLANE_TYPE_OVERLAY,
> +		.pixel_formats =3D vp_formats,
> +		.num_pixel_formats =3D ARRAY_SIZE(vp_formats),
> +	},
> +};
> +
>  static const u8 filter_y_horiz_tap8[] =3D {
>  	0,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
>  	-1,	-1,	-1,	-1,	-1,	0,	0,	0,
> @@ -1155,33 +1173,19 @@ static int mixer_bind(struct device *dev, str=
uct device *manager, void *data)
>  	struct mixer_context *ctx =3D dev_get_drvdata(dev);
>  	struct drm_device *drm_dev =3D data;
>  	struct exynos_drm_plane *exynos_plane;
> -	unsigned int zpos;
> +	unsigned int i;
>  	int ret;
> =20
>  	ret =3D mixer_initialize(ctx, drm_dev);
>  	if (ret)
>  		return ret;
> =20
> -	for (zpos =3D 0; zpos < MIXER_WIN_NR; zpos++) {
> -		enum drm_plane_type type;
> -		const uint32_t *formats;
> -		unsigned int fcount;
> -
> -		if (zpos =3D=3D VP_DEFAULT_WIN && !ctx->vp_enabled)
> +	for (i =3D 0; i < MIXER_WIN_NR; i++) {
> +		if (i =3D=3D VP_DEFAULT_WIN && !ctx->vp_enabled)
>  			continue;
> =20
> -		if (zpos < VP_DEFAULT_WIN) {
> -			formats =3D mixer_formats;
> -			fcount =3D ARRAY_SIZE(mixer_formats);
> -		} else {
> -			formats =3D vp_formats;
> -			fcount =3D ARRAY_SIZE(vp_formats);
> -		}
> -
> -		type =3D exynos_plane_get_type(zpos, CURSOR_WIN);
> -		ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
> -					1 << ctx->pipe, type, formats, fcount,
> -					zpos);
> +		ret =3D exynos_plane_init(drm_dev, &ctx->planes[i],
> +					1 << ctx->pipe, &plane_configs[i]);
>  		if (ret)
>  			return ret;
>  	}
>=20

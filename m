From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 5/5] drm/exynos: add support for blending properties
Date: Mon, 29 Feb 2016 08:31:52 +0900
Message-ID: <56D38368.1040806@samsung.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
 <1453905883-6807-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41152 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755085AbcB1Xby (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Feb 2016 18:31:54 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O3A007HN6P4BE00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Feb 2016 08:31:52 +0900 (KST)
In-reply-to: <1453905883-6807-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com



2016=EB=85=84 01=EC=9B=94 27=EC=9D=BC 23:44=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch adds support for blending related properties to Exynos DRM
> core and Exynos Mixer CRTC device.

To drm-misc.

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  5 +++
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 60 +++++++++++++++++++++=
++++++++++
>  2 files changed, 65 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 816537886e4e..b33d69b8bb38 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -92,6 +92,9 @@ struct exynos_drm_plane {
>  #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
>  #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
>  #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
> +#define EXYNOS_DRM_PLANE_CAP_PLANE_ALPHA	(1 << 3)
> +#define EXYNOS_DRM_PLANE_CAP_PREMULT_ALPHA	(1 << 4)
> +#define EXYNOS_DRM_PLANE_CAP_BLENDING	(1 << 5)
> =20
>  /*
>   * Exynos DRM plane configuration structure.
> @@ -100,6 +103,7 @@ struct exynos_drm_plane {
>   * @type: type of the plane (primary, cursor or overlay).
>   * @pixel_formats: supported pixel formats.
>   * @num_pixel_formats: number of elements in 'pixel_formats'.
> + * @blending_mode: default blending mode.
>   * @capabilities: supported features (see EXYNOS_DRM_PLANE_CAP_*)
>   */
> =20
> @@ -108,6 +112,7 @@ struct exynos_drm_plane_config {
>  	enum drm_plane_type type;
>  	const uint32_t *pixel_formats;
>  	unsigned int num_pixel_formats;
> +	unsigned int blending_mode;
>  	unsigned int capabilities;
>  };
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/=
drm/exynos/exynos_drm_plane.c
> index 3a486939168e..28502aac135f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -140,6 +140,9 @@ static void exynos_drm_plane_reset(struct drm_pla=
ne *plane)
>  		plane->state =3D &exynos_state->base;
>  		plane->state->plane =3D plane;
>  		plane->state->zpos =3D exynos_plane->config->zpos;
> +		plane->state->alpha =3D 255;
> +		plane->state->alpha_premult =3D 1;
> +		plane->state->blending =3D exynos_plane->config->blending_mode;
>  	}
>  }
> =20
> @@ -284,6 +287,53 @@ static void exynos_plane_attach_zpos_property(st=
ruct drm_plane *plane,
>  	drm_object_attach_property(&plane->base, prop, zpos);
>  }
> =20
> +static void exynos_plane_attach_alpha_property(struct drm_plane *pla=
ne)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +
> +	if (!dev->mode_config.alpha_property)
> +		if (drm_mode_create_alpha_property(dev, 255))
> +			return;
> +
> +	drm_object_attach_property(&plane->base,
> +				   dev->mode_config.alpha_property, 255);
> +}
> +
> +static void exynos_plane_attach_alpha_premult_property(struct drm_pl=
ane *plane)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +
> +	if (!dev->mode_config.alpha_premult_property)
> +		if (drm_mode_create_alpha_premult_property(dev)) {
> +			printk("failed to create alpha premult property\n");
> +			return;
> +		}
> +
> +	drm_object_attach_property(&plane->base,
> +				   dev->mode_config.alpha_premult_property, 1);
> +}
> +
> +static void exynos_plane_attach_blending_property(struct drm_plane *=
plane,
> +						  unsigned int blending_mode)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +	static unsigned int blending_modes[] =3D {
> +		DRM_BLEND_DISABLED,
> +		DRM_BLEND_PIXEL_ALPHA,
> +		DRM_BLEND_CONST_ALPHA,
> +		DRM_BLEND_PIXEL_CONST_ALPHA,
> +	};
> +
> +	if (!dev->mode_config.blending_property)
> +		if (drm_mode_create_blending_property(dev, blending_modes,
> +						ARRAY_SIZE(blending_modes)))
> +			return;
> +
> +	drm_object_attach_property(&plane->base,
> +				   dev->mode_config.blending_property,
> +				   blending_mode);
> +}
> +
>  int exynos_plane_init(struct drm_device *dev,
>  		      struct exynos_drm_plane *exynos_plane,
>  		      unsigned int index, unsigned long possible_crtcs,
> @@ -310,5 +360,15 @@ int exynos_plane_init(struct drm_device *dev,
>  	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos=
,
>  			   !(config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS));
> =20
> +	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_PLANE_ALPHA)
> +		exynos_plane_attach_alpha_property(&exynos_plane->base);
> +
> +	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_PREMULT_ALPHA)
> +		exynos_plane_attach_alpha_premult_property(&exynos_plane->base);
> +
> +	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_BLENDING)
> +		exynos_plane_attach_blending_property(&exynos_plane->base,
> +						      config->blending_mode);
> +
>  	return 0;
>  }
>=20

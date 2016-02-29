From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: refactor driver and device registration
 code
Date: Mon, 29 Feb 2016 17:52:31 +0900
Message-ID: <56D406CF.6070201@samsung.com>
References: <1455802457-4550-1-git-send-email-m.szyprowski@samsung.com>
 <1455802457-4550-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44122 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752292AbcB2Iwe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Feb 2016 03:52:34 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O3A02GOFWNKUA80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Feb 2016 17:52:32 +0900 (KST)
In-reply-to: <1455802457-4550-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

=46or 1 and 2, picked it up.

Thanks,
Inki Dae


2016=EB=85=84 02=EC=9B=94 18=EC=9D=BC 22:34=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch refactors driver and device registration by moving all dri=
vers
> to the common array. This way additional flags can be added later for
> new features. #ifdef-based code has been replaced by IS_ENABLED() mac=
ro
> usage.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 233 +++++++++++++++-------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h |   1 -
>  2 files changed, 107 insertions(+), 127 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> index 68f0f36f6e7e..5ab8f1240d7b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -495,69 +495,64 @@ static const struct dev_pm_ops exynos_drm_pm_op=
s =3D {
>  /* forward declaration */
>  static struct platform_driver exynos_drm_platform_driver;
> =20
> +struct exynos_drm_driver_info {
> +	struct platform_driver *driver;
> +	unsigned int flags;
> +};
> +
> +#define DRM_COMPONENT_DRIVER	BIT(0)	/* supports component framework =
*/
> +#define DRM_VIRTUAL_DEVICE	BIT(1)	/* create virtual platform device =
*/
> +
> +#define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
> +
>  /*
>   * Connector drivers should not be placed before associated crtc dri=
vers,
>   * because connector requires pipe number of its crtc during initial=
ization.
>   */
> -static struct platform_driver *const exynos_drm_kms_drivers[] =3D {
> -#ifdef CONFIG_DRM_EXYNOS_FIMD
> -	&fimd_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS5433_DECON
> -	&exynos5433_decon_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS7_DECON
> -	&decon_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_MIC
> -	&mic_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_DP
> -	&dp_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_DSI
> -	&dsi_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_MIXER
> -	&mixer_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_HDMI
> -	&hdmi_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_VIDI
> -	&vidi_driver,
> -#endif
> -};
> -
> -static struct platform_driver *const exynos_drm_non_kms_drivers[] =3D=
 {
> -#ifdef CONFIG_DRM_EXYNOS_G2D
> -	&g2d_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_FIMC
> -	&fimc_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_ROTATOR
> -	&rotator_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_GSC
> -	&gsc_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_IPP
> -	&ipp_driver,
> -#endif
> -	&exynos_drm_platform_driver,
> -};
> -
> -static struct platform_driver *const exynos_drm_drv_with_simple_dev[=
] =3D {
> -#ifdef CONFIG_DRM_EXYNOS_VIDI
> -	&vidi_driver,
> -#endif
> -#ifdef CONFIG_DRM_EXYNOS_IPP
> -	&ipp_driver,
> -#endif
> -	&exynos_drm_platform_driver,
> +static struct exynos_drm_driver_info exynos_drm_drivers[] =3D {
> +	{
> +		DRV_PTR(fimd_driver, CONFIG_DRM_EXYNOS_FIMD),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(exynos5433_decon_driver, CONFIG_DRM_EXYNOS5433_DECON),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(decon_driver, CONFIG_DRM_EXYNOS7_DECON),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(mixer_driver, CONFIG_DRM_EXYNOS_MIXER),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(mic_driver, CONFIG_DRM_EXYNOS_MIC),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(dp_driver, CONFIG_DRM_EXYNOS_DP),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(dsi_driver, CONFIG_DRM_EXYNOS_DSI),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(hdmi_driver, CONFIG_DRM_EXYNOS_HDMI),
> +		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(vidi_driver, CONFIG_DRM_EXYNOS_VIDI),
> +		DRM_COMPONENT_DRIVER | DRM_VIRTUAL_DEVICE
> +	}, {
> +		DRV_PTR(g2d_driver, CONFIG_DRM_EXYNOS_G2D),
> +	}, {
> +		DRV_PTR(fimc_driver, CONFIG_DRM_EXYNOS_FIMC),
> +	}, {
> +		DRV_PTR(rotator_driver, CONFIG_DRM_EXYNOS_ROTATOR),
> +	}, {
> +		DRV_PTR(gsc_driver, CONFIG_DRM_EXYNOS_GSC),
> +	}, {
> +		DRV_PTR(ipp_driver, CONFIG_DRM_EXYNOS_IPP),
> +		DRM_VIRTUAL_DEVICE
> +	}, {
> +		&exynos_drm_platform_driver,
> +		DRM_VIRTUAL_DEVICE
> +	}
>  };
> -#define PDEV_COUNT ARRAY_SIZE(exynos_drm_drv_with_simple_dev)
> =20
>  static int compare_dev(struct device *dev, void *data)
>  {
> @@ -569,11 +564,15 @@ static struct component_match *exynos_drm_match=
_add(struct device *dev)
>  	struct component_match *match =3D NULL;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_kms_drivers); ++i) {
> -		struct device_driver *drv =3D &exynos_drm_kms_drivers[i]->driver;
> +	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
> +		struct exynos_drm_driver_info *info =3D &exynos_drm_drivers[i];
>  		struct device *p =3D NULL, *d;
> =20
> -		while ((d =3D bus_find_device(&platform_bus_type, p, drv,
> +		if (!info->driver || !(info->flags & DRM_COMPONENT_DRIVER))
> +			continue;
> +
> +		while ((d =3D bus_find_device(&platform_bus_type, p,
> +					    &info->driver->driver,
>  					    (void *)platform_bus_type.match))) {
>  			put_device(p);
>  			component_match_add(dev, &match, compare_dev, d);
> @@ -630,91 +629,81 @@ static struct platform_driver exynos_drm_platfo=
rm_driver =3D {
>  	},
>  };
> =20
> -static struct platform_device *exynos_drm_pdevs[PDEV_COUNT];
> -
>  static void exynos_drm_unregister_devices(void)
>  {
> -	int i =3D PDEV_COUNT;
> +	int i;
> +
> +	for (i =3D ARRAY_SIZE(exynos_drm_drivers) - 1; i >=3D 0; --i) {
> +		struct exynos_drm_driver_info *info =3D &exynos_drm_drivers[i];
> +		struct device *dev;
> =20
> -	while (--i >=3D 0) {
> -		platform_device_unregister(exynos_drm_pdevs[i]);
> -		exynos_drm_pdevs[i] =3D NULL;
> +		if (!info->driver || !(info->flags & DRM_VIRTUAL_DEVICE))
> +			continue;
> +
> +		while ((dev =3D bus_find_device(&platform_bus_type, NULL,
> +					    &info->driver->driver,
> +					    (void *)platform_bus_type.match))) {
> +			put_device(dev);
> +			platform_device_unregister(to_platform_device(dev));
> +		}
>  	}
>  }
> =20
>  static int exynos_drm_register_devices(void)
>  {
> +	struct platform_device *pdev;
>  	int i;
> =20
> -	for (i =3D 0; i < PDEV_COUNT; ++i) {
> -		struct platform_driver *d =3D exynos_drm_drv_with_simple_dev[i];
> -		struct platform_device *pdev =3D
> -			platform_device_register_simple(d->driver.name, -1,
> -							NULL, 0);
> +	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
> +		struct exynos_drm_driver_info *info =3D &exynos_drm_drivers[i];
> =20
> -		if (!IS_ERR(pdev)) {
> -			exynos_drm_pdevs[i] =3D pdev;
> +		if (!info->driver || !(info->flags & DRM_VIRTUAL_DEVICE))
>  			continue;
> -		}
> -		while (--i >=3D 0) {
> -			platform_device_unregister(exynos_drm_pdevs[i]);
> -			exynos_drm_pdevs[i] =3D NULL;
> -		}
> =20
> -		return PTR_ERR(pdev);
> +		pdev =3D platform_device_register_simple(
> +					info->driver->driver.name, -1, NULL, 0);
> +		if (IS_ERR(pdev))
> +			goto fail;
>  	}
> =20
>  	return 0;
> +fail:
> +	exynos_drm_unregister_devices();
> +	return PTR_ERR(pdev);
>  }
> =20
> -static void exynos_drm_unregister_drivers(struct platform_driver * c=
onst *drv,
> -					  int count)
> +static void exynos_drm_unregister_drivers(void)
>  {
> -	while (--count >=3D 0)
> -		platform_driver_unregister(drv[count]);
> -}
> +	int i;
> =20
> -static int exynos_drm_register_drivers(struct platform_driver * cons=
t *drv,
> -				       int count)
> -{
> -	int i, ret;
> +	for (i =3D ARRAY_SIZE(exynos_drm_drivers) - 1; i >=3D 0; --i) {
> +		struct exynos_drm_driver_info *info =3D &exynos_drm_drivers[i];
> =20
> -	for (i =3D 0; i < count; ++i) {
> -		ret =3D platform_driver_register(drv[i]);
> -		if (!ret)
> +		if (!info->driver)
>  			continue;
> =20
> -		while (--i >=3D 0)
> -			platform_driver_unregister(drv[i]);
> -
> -		return ret;
> +		platform_driver_unregister(info->driver);
>  	}
> -
> -	return 0;
>  }
> =20
> -static inline int exynos_drm_register_kms_drivers(void)
> +static int exynos_drm_register_drivers(void)
>  {
> -	return exynos_drm_register_drivers(exynos_drm_kms_drivers,
> -					ARRAY_SIZE(exynos_drm_kms_drivers));
> -}
> +	int i, ret;
> =20
> -static inline int exynos_drm_register_non_kms_drivers(void)
> -{
> -	return exynos_drm_register_drivers(exynos_drm_non_kms_drivers,
> -					ARRAY_SIZE(exynos_drm_non_kms_drivers));
> -}
> +	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
> +		struct exynos_drm_driver_info *info =3D &exynos_drm_drivers[i];
> =20
> -static inline void exynos_drm_unregister_kms_drivers(void)
> -{
> -	exynos_drm_unregister_drivers(exynos_drm_kms_drivers,
> -					ARRAY_SIZE(exynos_drm_kms_drivers));
> -}
> +		if (!info->driver)
> +			continue;
> =20
> -static inline void exynos_drm_unregister_non_kms_drivers(void)
> -{
> -	exynos_drm_unregister_drivers(exynos_drm_non_kms_drivers,
> -					ARRAY_SIZE(exynos_drm_non_kms_drivers));
> +		ret =3D platform_driver_register(info->driver);
> +		if (ret)
> +			goto fail;
> +	}
> +	return 0;
> +fail:
> +	exynos_drm_unregister_drivers();
> +	return ret;
>  }
> =20
>  static int exynos_drm_init(void)
> @@ -725,19 +714,12 @@ static int exynos_drm_init(void)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D exynos_drm_register_kms_drivers();
> +	ret =3D exynos_drm_register_drivers();
>  	if (ret)
>  		goto err_unregister_pdevs;
> =20
> -	ret =3D exynos_drm_register_non_kms_drivers();
> -	if (ret)
> -		goto err_unregister_kms_drivers;
> -
>  	return 0;
> =20
> -err_unregister_kms_drivers:
> -	exynos_drm_unregister_kms_drivers();
> -
>  err_unregister_pdevs:
>  	exynos_drm_unregister_devices();
> =20
> @@ -746,8 +728,7 @@ err_unregister_pdevs:
> =20
>  static void exynos_drm_exit(void)
>  {
> -	exynos_drm_unregister_non_kms_drivers();
> -	exynos_drm_unregister_kms_drivers();
> +	exynos_drm_unregister_drivers();
>  	exynos_drm_unregister_devices();
>  }
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 17b5ded72ff1..34a139b2fb8d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -297,7 +297,6 @@ extern struct platform_driver dp_driver;
>  extern struct platform_driver dsi_driver;
>  extern struct platform_driver mixer_driver;
>  extern struct platform_driver hdmi_driver;
> -extern struct platform_driver exynos_drm_common_hdmi_driver;
>  extern struct platform_driver vidi_driver;
>  extern struct platform_driver g2d_driver;
>  extern struct platform_driver fimc_driver;
>=20

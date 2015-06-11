From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/3] drm/exynos: consolidate driver/device initialization
 code
Date: Thu, 11 Jun 2015 23:33:44 +0900
Message-ID: <55799C48.5060203@samsung.com>
References: <1433758542-9843-1-git-send-email-a.hajda@samsung.com>
 <1433758542-9843-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54121 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752432AbbFKOdr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 10:33:47 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPS02BFHB491A10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Jun 2015 23:33:45 +0900 (KST)
In-reply-to: <1433758542-9843-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 2015=EB=85=84 06=EC=9B=94 08=EC=9D=BC 19:15, Andrzej Hajda wrote:
> Code registering different drivers and simple platform devices was di=
spersed
> across multiple sub-modules. This patch moves it to one place. As a r=
esult
> initialization code is shorter and cleaner and should simplify furthe=
r
> development.

Applied all patches

Thanks,
Inki Dae

>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c  | 221 +++++++++++++++++++--=
----------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  17 ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c  |  27 ----
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c |  35 -----
>  4 files changed, 139 insertions(+), 161 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> index 08b9a8c..5c5a72a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -38,8 +38,6 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
> =20
> -static struct platform_device *exynos_drm_pdev;
> -
>  static DEFINE_MUTEX(drm_component_lock);
>  static LIST_HEAD(drm_component_list);
> =20
> @@ -527,7 +525,41 @@ static const struct component_master_ops exynos_=
drm_ops =3D {
>  	.unbind		=3D exynos_drm_unbind,
>  };
> =20
> +static int exynos_drm_platform_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match;
> +
> +	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> +	exynos_drm_driver.num_ioctls =3D ARRAY_SIZE(exynos_ioctls);
> +
> +	match =3D exynos_drm_match_add(&pdev->dev);
> +	if (IS_ERR(match)) {
> +		return PTR_ERR(match);
> +	}
> +
> +	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
> +					       match);
> +}
> +
> +static int exynos_drm_platform_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &exynos_drm_ops);
> +	return 0;
> +}
> +
> +static struct platform_driver exynos_drm_platform_driver =3D {
> +	.probe	=3D exynos_drm_platform_probe,
> +	.remove	=3D exynos_drm_platform_remove,
> +	.driver	=3D {
> +		.name	=3D "exynos-drm",
> +		.pm	=3D &exynos_drm_pm_ops,
> +	},
> +};
> +
>  static struct platform_driver *const exynos_drm_kms_drivers[] =3D {
> +#ifdef CONFIG_DRM_EXYNOS_VIDI
> +	&vidi_driver,
> +#endif
>  #ifdef CONFIG_DRM_EXYNOS_FIMD
>  	&fimd_driver,
>  #endif
> @@ -562,30 +594,109 @@ static struct platform_driver *const exynos_dr=
m_non_kms_drivers[] =3D {
>  #ifdef CONFIG_DRM_EXYNOS_IPP
>  	&ipp_driver,
>  #endif
> +	&exynos_drm_platform_driver,
>  };
> =20
> -static int exynos_drm_platform_probe(struct platform_device *pdev)
> +
> +static struct platform_driver *const exynos_drm_drv_with_simple_dev[=
] =3D {
> +#ifdef CONFIG_DRM_EXYNOS_VIDI
> +	&vidi_driver,
> +#endif
> +#ifdef CONFIG_DRM_EXYNOS_IPP
> +	&ipp_driver,
> +#endif
> +	&exynos_drm_platform_driver,
> +};
> +
> +#define PDEV_COUNT ARRAY_SIZE(exynos_drm_drv_with_simple_dev)
> +
> +static struct platform_device *exynos_drm_pdevs[PDEV_COUNT];
> +
> +static void exynos_drm_unregister_devices(void)
>  {
> -	struct component_match *match;
> +	int i =3D PDEV_COUNT;
> =20
> -	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> -	exynos_drm_driver.num_ioctls =3D ARRAY_SIZE(exynos_ioctls);
> +	while (--i >=3D 0) {
> +		platform_device_unregister(exynos_drm_pdevs[i]);
> +		exynos_drm_pdevs[i] =3D NULL;
> +	}
> +}
> =20
> -	match =3D exynos_drm_match_add(&pdev->dev);
> -	if (IS_ERR(match)) {
> -		return PTR_ERR(match);
> +static int exynos_drm_register_devices(void)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < PDEV_COUNT; ++i) {
> +		struct platform_driver *d =3D exynos_drm_drv_with_simple_dev[i];
> +		struct platform_device *pdev =3D
> +			platform_device_register_simple(d->driver.name,-1, NULL,
> +							0);
> +
> +		if (!IS_ERR(pdev)) {
> +			exynos_drm_pdevs[i] =3D pdev;
> +			continue;
> +		}
> +		while (--i >=3D 0) {
> +			platform_device_unregister(exynos_drm_pdevs[i]);
> +			exynos_drm_pdevs[i] =3D NULL;
> +		}
> +
> +		return PTR_ERR(pdev);
>  	}
> =20
> -	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
> -					       match);
> +	return 0;
>  }
> =20
> -static int exynos_drm_platform_remove(struct platform_device *pdev)
> +static void exynos_drm_unregister_drivers(struct platform_driver * c=
onst *drv,
> +					  int count)
>  {
> -	component_master_del(&pdev->dev, &exynos_drm_ops);
> +	while (--count >=3D 0)
> +		platform_driver_unregister(drv[count]);
> +}
> +
> +static int exynos_drm_register_drivers(struct platform_driver * cons=
t *drv,
> +				       int count)
> +{
> +	int i, ret;
> +
> +	for (i =3D 0; i < count; ++i) {
> +		ret =3D platform_driver_register(drv[i]);
> +		if (!ret)
> +			continue;
> +
> +		while (--i >=3D 0)
> +			platform_driver_unregister(drv[i]);
> +
> +		return ret;
> +	}
> +
>  	return 0;
>  }
> =20
> +static inline int exynos_drm_register_kms_drivers(void)
> +{
> +	return exynos_drm_register_drivers(exynos_drm_kms_drivers,
> +					ARRAY_SIZE(exynos_drm_kms_drivers));
> +}
> +
> +static inline int exynos_drm_register_non_kms_drivers(void)
> +{
> +	return exynos_drm_register_drivers(exynos_drm_non_kms_drivers,
> +					ARRAY_SIZE(exynos_drm_non_kms_drivers));
> +}
> +
> +static inline void exynos_drm_unregister_kms_drivers(void)
> +{
> +	exynos_drm_unregister_drivers(exynos_drm_kms_drivers,
> +					ARRAY_SIZE(exynos_drm_kms_drivers));
> +}
> +
> +static inline void exynos_drm_unregister_non_kms_drivers(void)
> +{
> +	exynos_drm_unregister_drivers(exynos_drm_non_kms_drivers,
> +					ARRAY_SIZE(exynos_drm_non_kms_drivers));
> +}
> +
>  static const char * const strings[] =3D {
>  	"samsung,exynos3",
>  	"samsung,exynos4",
> @@ -593,19 +704,10 @@ static const char * const strings[] =3D {
>  	"samsung,exynos7",
>  };
> =20
> -static struct platform_driver exynos_drm_platform_driver =3D {
> -	.probe	=3D exynos_drm_platform_probe,
> -	.remove	=3D exynos_drm_platform_remove,
> -	.driver	=3D {
> -		.name	=3D "exynos-drm",
> -		.pm	=3D &exynos_drm_pm_ops,
> -	},
> -};
> -
>  static int exynos_drm_init(void)
>  {
>  	bool is_exynos =3D false;
> -	int ret, i, j;
> +	int ret, i;
> =20
>  	/*
>  	 * Register device object only in case of Exynos SoC.
> @@ -624,79 +726,34 @@ static int exynos_drm_init(void)
>  	if (!is_exynos)
>  		return -ENODEV;
> =20
> -	exynos_drm_pdev =3D platform_device_register_simple("exynos-drm", -=
1,
> -								NULL, 0);
> -	if (IS_ERR(exynos_drm_pdev))
> -		return PTR_ERR(exynos_drm_pdev);
> -
> -	ret =3D exynos_drm_probe_vidi();
> -	if (ret < 0)
> -		goto err_unregister_pd;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_kms_drivers); ++i) {
> -		ret =3D platform_driver_register(exynos_drm_kms_drivers[i]);
> -		if (ret < 0)
> -			goto err_unregister_kms_drivers;
> -	}
> -
> -	for (j =3D 0; j < ARRAY_SIZE(exynos_drm_non_kms_drivers); ++j) {
> -		ret =3D platform_driver_register(exynos_drm_non_kms_drivers[j]);
> -		if (ret < 0)
> -			goto err_unregister_non_kms_drivers;
> -	}
> +	ret =3D exynos_drm_register_devices();
> +	if (ret)
> +		return ret;
> =20
> -#ifdef CONFIG_DRM_EXYNOS_IPP
> -	ret =3D exynos_platform_device_ipp_register();
> -	if (ret < 0)
> -		goto err_unregister_non_kms_drivers;
> -#endif
> +	ret =3D exynos_drm_register_kms_drivers();
> +	if (ret)
> +		goto err_unregister_pdevs;
> =20
> -	ret =3D platform_driver_register(&exynos_drm_platform_driver);
> +	ret =3D exynos_drm_register_non_kms_drivers();
>  	if (ret)
> -		goto err_unregister_resources;
> +		goto err_unregister_kms_drivers;
> =20
>  	return 0;
> =20
> -err_unregister_resources:
> -#ifdef CONFIG_DRM_EXYNOS_IPP
> -	exynos_platform_device_ipp_unregister();
> -#endif
> -
> -err_unregister_non_kms_drivers:
> -	while (--j >=3D 0)
> -		platform_driver_unregister(exynos_drm_non_kms_drivers[j]);
> -
>  err_unregister_kms_drivers:
> -	while (--i >=3D 0)
> -		platform_driver_unregister(exynos_drm_kms_drivers[i]);
> +	exynos_drm_unregister_kms_drivers();
> =20
> -	exynos_drm_remove_vidi();
> -
> -err_unregister_pd:
> -	platform_device_unregister(exynos_drm_pdev);
> +err_unregister_pdevs:
> +	exynos_drm_unregister_devices();
> =20
>  	return ret;
>  }
> =20
>  static void exynos_drm_exit(void)
>  {
> -	int i;
> -
> -#ifdef CONFIG_DRM_EXYNOS_IPP
> -	exynos_platform_device_ipp_unregister();
> -#endif
> -
> -	for (i =3D ARRAY_SIZE(exynos_drm_non_kms_drivers) - 1; i >=3D 0; --=
i)
> -		platform_driver_unregister(exynos_drm_non_kms_drivers[i]);
> -
> -	for (i =3D ARRAY_SIZE(exynos_drm_kms_drivers) - 1; i >=3D 0; --i)
> -		platform_driver_unregister(exynos_drm_kms_drivers[i]);
> -
> -	platform_driver_unregister(&exynos_drm_platform_driver);
> -
> -	exynos_drm_remove_vidi();
> -
> -	platform_device_unregister(exynos_drm_pdev);
> +	exynos_drm_unregister_non_kms_drivers();
> +	exynos_drm_unregister_kms_drivers();
> +	exynos_drm_unregister_devices();
>  }
> =20
>  module_init(exynos_drm_init);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index 1c66f65..b308e90 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -295,15 +295,6 @@ int exynos_drm_device_subdrv_remove(struct drm_d=
evice *dev);
>  int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *=
file);
>  void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file=
 *file);
> =20
> -#ifdef CONFIG_DRM_EXYNOS_IPP
> -int exynos_platform_device_ipp_register(void);
> -void exynos_platform_device_ipp_unregister(void);
> -#else
> -static inline int exynos_platform_device_ipp_register(void) { return=
 0; }
> -static inline void exynos_platform_device_ipp_unregister(void) {}
> -#endif
> -
> -
>  #ifdef CONFIG_DRM_EXYNOS_DPI
>  struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
>  int exynos_dpi_remove(struct exynos_drm_display *display);
> @@ -316,14 +307,6 @@ static inline int exynos_dpi_remove(struct exyno=
s_drm_display *display)
>  }
>  #endif
> =20
> -#ifdef CONFIG_DRM_EXYNOS_VIDI
> -int exynos_drm_probe_vidi(void);
> -void exynos_drm_remove_vidi(void);
> -#else
> -static inline int exynos_drm_probe_vidi(void) { return 0; }
> -static inline void exynos_drm_remove_vidi(void) {}
> -#endif
> -
>  /* This function creates a encoder and a connector, and initializes =
them. */
>  int exynos_drm_create_enc_conn(struct drm_device *dev,
>  				struct exynos_drm_display *display);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/dr=
m/exynos/exynos_drm_ipp.c
> index b7f1cbc..f594dd7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -45,9 +45,6 @@
>  #define get_ipp_context(dev)	platform_get_drvdata(to_platform_device=
(dev))
>  #define ipp_is_m2m_cmd(c)	(c =3D=3D IPP_CMD_M2M)
> =20
> -/* platform device pointer for ipp device. */
> -static struct platform_device *exynos_drm_ipp_pdev;
> -
>  /*
>   * A structure of event.
>   *
> @@ -102,30 +99,6 @@ static LIST_HEAD(exynos_drm_ippdrv_list);
>  static DEFINE_MUTEX(exynos_drm_ippdrv_lock);
>  static BLOCKING_NOTIFIER_HEAD(exynos_drm_ippnb_list);
> =20
> -int exynos_platform_device_ipp_register(void)
> -{
> -	struct platform_device *pdev;
> -
> -	if (exynos_drm_ipp_pdev)
> -		return -EEXIST;
> -
> -	pdev =3D platform_device_register_simple("exynos-drm-ipp", -1, NULL=
, 0);
> -	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> -
> -	exynos_drm_ipp_pdev =3D pdev;
> -
> -	return 0;
> -}
> -
> -void exynos_platform_device_ipp_unregister(void)
> -{
> -	if (exynos_drm_ipp_pdev) {
> -		platform_device_unregister(exynos_drm_ipp_pdev);
> -		exynos_drm_ipp_pdev =3D NULL;
> -	}
> -}
> -
>  int exynos_drm_ippdrv_register(struct exynos_drm_ippdrv *ippdrv)
>  {
>  	mutex_lock(&exynos_drm_ippdrv_lock);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_vidi.c
> index abe4ee0..f63ac58 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -571,38 +571,3 @@ struct platform_driver vidi_driver =3D {
>  		.owner	=3D THIS_MODULE,
>  	},
>  };
> -
> -int exynos_drm_probe_vidi(void)
> -{
> -	struct platform_device *pdev;
> -	int ret;
> -
> -	pdev =3D platform_device_register_simple("exynos-drm-vidi", -1, NUL=
L, 0);
> -	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> -
> -	ret =3D platform_driver_register(&vidi_driver);
> -	if (ret) {
> -		platform_device_unregister(pdev);
> -		return ret;
> -	}
> -
> -	return ret;
> -}
> -
> -static int exynos_drm_remove_vidi_device(struct device *dev, void *d=
ata)
> -{
> -	platform_device_unregister(to_platform_device(dev));
> -
> -	return 0;
> -}
> -
> -void exynos_drm_remove_vidi(void)
> -{
> -	int ret =3D driver_for_each_device(&vidi_driver.driver, NULL, NULL,
> -					 exynos_drm_remove_vidi_device);
> -	/* silence compiler warning */
> -	(void)ret;
> -
> -	platform_driver_unregister(&vidi_driver);
> -}
>=20

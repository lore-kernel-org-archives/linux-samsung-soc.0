From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: move Exynos platform drivers registration
 to init
Date: Mon, 24 Nov 2014 16:57:22 +0900
Message-ID: <5472E4E2.10301@samsung.com>
References: <1416526976-9467-1-git-send-email-gustavo@padovan.org>
 <1416526976-9467-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34540 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752327AbaKXH5Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:57:25 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFJ00CRNA3NBR60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 16:57:23 +0900 (KST)
In-reply-to: <1416526976-9467-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2014=EB=85=84 11=EC=9B=94 21=EC=9D=BC 08:42, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Registering the Exynos DRM subdevices platform drivers in the probe
> function is causing an infinite loop. Fix this by moving it to the
> exynos_drm_init() function to register the drivers on module init.
>=20
> Registering drivers in the probe functions causes a deadlock in the p=
arent
> device lock. See Grant Likely explanation on the topic:
>=20
> "I think the problem is that exynos_drm_init() is registering a norma=
l
> (non-OF) platform device, so the parent will be /sys/devices/platform=
=2E
> It immediately gets bound against exynos_drm_platform_driver which
> calls the exynos drm_platform_probe() hook. The driver core obtains
> device_lock() on the device *and on the device parent*.
>=20
> Inside the probe hook, additional platform_drivers get registered.
> Each time one does, it tries to bind against every platform device in
> the system, which includes the ones created by OF. When it attempts t=
o
> bind, it obtains device_lock() on the device *and on the device
> parent*.
>=20
> Before the change to move of-generated platform devices into
> /sys/devices/platform, the devices had different parents. Now both
> devices have /sys/devices/platform as the parent, so yes they are
> going to deadlock.
>=20
> The real problem is registering drivers from within a probe hook. Tha=
t
> is completely wrong for the above deadlock reason. __driver_attach()
> will deadlock. Those registrations must be pulled out of .probe().
>=20
> Registering devices in .probe() is okay because __device_attach()
> doesn't try to obtain device_lock() on the parent."
>=20
>  INFO: task swapper/0:1 blocked for more than 120 seconds.
>        Not tainted 3.18.0-rc3-next-20141105 #794
>  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mes=
sage.
>  swapper/0       D c052534c     0     1      0 0x00000000
>  [<c052534c>] (__schedule) from [<c0525b34>] (schedule_preempt_disabl=
ed+0x14/0x20)
>  [<c0525b34>] (schedule_preempt_disabled) from [<c0526d44>] (mutex_lo=
ck_nested+0x1c4/0x464
>=20
>  [<c0526d44>] (mutex_lock_nested) from [<c02be908>] (__driver_attach+=
0x48/0x98)
>  [<c02be908>] (__driver_attach) from [<c02bcc00>] (bus_for_each_dev+0=
x54/0x88)
>  [<c02bcc00>] (bus_for_each_dev) from [<c02bdce0>] (bus_add_driver+0x=
e4/0x200)
>  [<c02bdce0>] (bus_add_driver) from [<c02bef94>] (driver_register+0x7=
8/0xf4)
>  [<c02bef94>] (driver_register) from [<c029e99c>] (exynos_drm_platfor=
m_probe+0x34/0x234)
>  [<c029e99c>] (exynos_drm_platform_probe) from [<c02bfcf0>] (platform=
_drv_probe+0x48/0xa4)
>  [<c02bfcf0>] (platform_drv_probe) from [<c02be680>] (driver_probe_de=
vice+0x13c/0x37c)
>  [<c02be680>] (driver_probe_device) from [<c02be954>] (__driver_attac=
h+0x94/0x98)
>  [<c02be954>] (__driver_attach) from [<c02bcc00>] (bus_for_each_dev+0=
x54/0x88)
>  [<c02bcc00>] (bus_for_each_dev) from [<c02bdce0>] (bus_add_driver+0x=
e4/0x200)
>  [<c02bdce0>] (bus_add_driver) from [<c02bef94>] (driver_register+0x7=
8/0xf4)
>  [<c02bef94>] (driver_register) from [<c029e938>] (exynos_drm_init+0x=
70/0xa0)
>  [<c029e938>] (exynos_drm_init) from [<c00089b0>] (do_one_initcall+0x=
ac/0x1f0)
>  [<c00089b0>] (do_one_initcall) from [<c074bd90>] (kernel_init_freeab=
le+0x10c/0x1d8)
>  [<c074bd90>] (kernel_init_freeable) from [<c051eabc>] (kernel_init+0=
x8/0xec)
>  [<c051eabc>] (kernel_init) from [<c000f268>] (ret_from_fork+0x14/0x2=
c)
>  3 locks held by swapper/0/1:
>   #0:  (&dev->mutex){......}, at: [<c02be908>] __driver_attach+0x48/0=
x98
>   #1:  (&dev->mutex){......}, at: [<c02be918>] __driver_attach+0x58/0=
x98
>   #2:  (&dev->mutex){......}, at: [<c02be908>] __driver_attach+0x48/0=
x98
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 124 +++++++++++++++-------=
----------
>  1 file changed, 59 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> index 91891cf..cb3ed9b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -548,6 +548,38 @@ static const struct component_master_ops exynos_=
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
> +		.owner	=3D THIS_MODULE,
> +		.name	=3D "exynos-drm",
> +		.pm	=3D &exynos_drm_pm_ops,
> +	},
> +};
> +
>  static struct platform_driver *const exynos_drm_kms_drivers[] =3D {
>  #ifdef CONFIG_DRM_EXYNOS_FIMD
>  	&fimd_driver,
> @@ -582,13 +614,24 @@ static struct platform_driver *const exynos_drm=
_non_kms_drivers[] =3D {
>  #endif
>  };
> =20
> -static int exynos_drm_platform_probe(struct platform_device *pdev)
> +static int exynos_drm_init(void)
>  {
> -	struct component_match *match;
>  	int ret, i, j;
> =20
> -	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> -	exynos_drm_driver.num_ioctls =3D ARRAY_SIZE(exynos_ioctls);
> +	exynos_drm_pdev =3D platform_device_register_simple("exynos-drm", -=
1,
> +								NULL, 0);
> +	if (IS_ERR(exynos_drm_pdev))
> +		return PTR_ERR(exynos_drm_pdev);
> +
> +#ifdef CONFIG_DRM_EXYNOS_VIDI
> +	ret =3D exynos_drm_probe_vidi();
> +	if (ret < 0)
> +		goto err_unregister_pd;
> +#endif

If vidi driver is enabled then Exynos drm driver doesn't work.

> +
> +	ret =3D platform_driver_register(&exynos_drm_platform_driver);
> +	if (ret)
> +		goto err_remove_vidi;

Above platform_driver_register should be called after all kms and
non-kms drivers are registered. And your patch should be re-based on to=
p
of exynos-drm-next.

I just re-based it on top of exynos-drm-next and changed the
platform_driver_register to be called at the end.

Thanks,
Inki Dae

> =20
>  	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_kms_drivers); ++i) {
>  		ret =3D platform_driver_register(exynos_drm_kms_drivers[i]);
> @@ -596,26 +639,17 @@ static int exynos_drm_platform_probe(struct pla=
tform_device *pdev)
>  			goto err_unregister_kms_drivers;
>  	}
> =20
> -	match =3D exynos_drm_match_add(&pdev->dev);
> -	if (IS_ERR(match)) {
> -		ret =3D PTR_ERR(match);
> -		goto err_unregister_kms_drivers;
> -	}
> -
> -	ret =3D component_master_add_with_match(&pdev->dev, &exynos_drm_ops=
,
> -						match);
> -	if (ret < 0)
> -		goto err_unregister_kms_drivers;
> -
>  	for (j =3D 0; j < ARRAY_SIZE(exynos_drm_non_kms_drivers); ++j) {
>  		ret =3D platform_driver_register(exynos_drm_non_kms_drivers[j]);
>  		if (ret < 0)
> -			goto err_del_component_master;
> +			goto err_unregister_non_kms_drivers;
>  	}
> =20
> +#ifdef CONFIG_DRM_EXYNOS_IPP
>  	ret =3D exynos_platform_device_ipp_register();
>  	if (ret < 0)
>  		goto err_unregister_non_kms_drivers;
> +#endif
> =20
>  	return ret;
> =20
> @@ -626,17 +660,22 @@ err_unregister_non_kms_drivers:
>  	while (--j >=3D 0)
>  		platform_driver_unregister(exynos_drm_non_kms_drivers[j]);
> =20
> -err_del_component_master:
> -	component_master_del(&pdev->dev, &exynos_drm_ops);
> -
>  err_unregister_kms_drivers:
>  	while (--i >=3D 0)
>  		platform_driver_unregister(exynos_drm_kms_drivers[i]);
> =20
> +err_remove_vidi:
> +#ifdef CONFIG_DRM_EXYNOS_VIDI
> +	exynos_drm_remove_vidi();
> +
> +err_unregister_pd:
> +#endif
> +	platform_device_unregister(exynos_drm_pdev);
> +
>  	return ret;
>  }
> =20
> -static int exynos_drm_platform_remove(struct platform_device *pdev)
> +static void exynos_drm_exit(void)
>  {
>  	int i;
> =20
> @@ -647,54 +686,9 @@ static int exynos_drm_platform_remove(struct pla=
tform_device *pdev)
>  	for (i =3D ARRAY_SIZE(exynos_drm_non_kms_drivers) - 1; i >=3D 0; --=
i)
>  		platform_driver_unregister(exynos_drm_non_kms_drivers[i]);
> =20
> -	component_master_del(&pdev->dev, &exynos_drm_ops);
> -
>  	for (i =3D ARRAY_SIZE(exynos_drm_kms_drivers) - 1; i >=3D 0; --i)
>  		platform_driver_unregister(exynos_drm_kms_drivers[i]);
> =20
> -	return 0;
> -}
> -
> -static struct platform_driver exynos_drm_platform_driver =3D {
> -	.probe	=3D exynos_drm_platform_probe,
> -	.remove	=3D exynos_drm_platform_remove,
> -	.driver	=3D {
> -		.owner	=3D THIS_MODULE,
> -		.name	=3D "exynos-drm",
> -		.pm	=3D &exynos_drm_pm_ops,
> -	},
> -};
> -
> -static int exynos_drm_init(void)
> -{
> -	int ret;
> -
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
> -	ret =3D platform_driver_register(&exynos_drm_platform_driver);
> -	if (ret)
> -		goto err_remove_vidi;
> -
> -	return 0;
> -
> -err_remove_vidi:
> -	exynos_drm_remove_vidi();
> -
> -err_unregister_pd:
> -	platform_device_unregister(exynos_drm_pdev);
> -
> -	return ret;
> -}
> -
> -static void exynos_drm_exit(void)
> -{
>  	platform_driver_unregister(&exynos_drm_platform_driver);
> =20
>  	exynos_drm_remove_vidi();
>=20

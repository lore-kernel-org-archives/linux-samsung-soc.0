From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove ifdeferry from initialization code
Date: Wed, 01 Oct 2014 15:07:10 +0900
Message-ID: <542B9A0E.7020206@samsung.com>
References: <1410349980-10473-1-git-send-email-a.hajda@samsung.com>
 <542A93FD.7020002@samsung.com> <542B95C1.9070704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55472 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbaJAGLP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 02:11:15 -0400
In-reply-to: <542B95C1.9070704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On 2014=EB=85=84 10=EC=9B=94 01=EC=9D=BC 14:48, Inki Dae wrote:
> On 2014=EB=85=84 09=EC=9B=94 30=EC=9D=BC 20:29, Andrzej Hajda wrote:
>> Hi Inki,
>>
>> Gently ping.
>=20
> Hi Andrzej,
>=20
> I merged it to local repository to test. But now exynos drm doesn't w=
ork
> correctly since pulling drm-next of Dave regardless of your patch.
>=20
> Problems are,
> 1. error occurs when we try to test modetest with -v option from seco=
nd
> times.
> 2. error occurs when we try to test unbind.
>=20
> Now we are checking these problems. Can you try to also check it?

In addition, we are testing it on trats2 board.

>=20
> Thanks,
> Inki Dae
>=20
>>
>> Andrzej
>>
>> On 09/10/2014 01:53 PM, Andrzej Hajda wrote:
>>> The patch replaces separate calls to driver (de)registration by
>>> loops over the array of drivers. As a result it significantly
>>> decreases number of ifdefs. Additionally it moves device registrati=
on
>>> related ifdefs to header file.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>> Hi Inki,
>>>
>>> During testing your component match support patch [1] I have prepar=
ed patch
>>> removing most ifdefs from exynos_drm_drv.c. It is based on your pat=
ch, but
>>> I can rebase it if necessary.
>>>
>>> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/3703=
1
>>>
>>> Regards
>>> Andrzej
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 170 +++++++-------------=
------------
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h |  25 +++--
>>>  2 files changed, 48 insertions(+), 147 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/=
drm/exynos/exynos_drm_drv.c
>>> index b2c710a..a660e46 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> @@ -553,74 +553,54 @@ static const struct component_master_ops exyn=
os_drm_ops =3D {
>>>  	.unbind		=3D exynos_drm_unbind,
>>>  };
>>> =20
>>> -static int exynos_drm_platform_probe(struct platform_device *pdev)
>>> -{
>>> -	struct component_match *match;
>>> -	int ret;
>>> -
>>> -	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
>>> -	exynos_drm_driver.num_ioctls =3D ARRAY_SIZE(exynos_ioctls);
>>> -
>>> +static struct platform_driver * const exynos_drm_drivers[] =3D {
>>>  #ifdef CONFIG_DRM_EXYNOS_FIMD
>>> -	ret =3D platform_driver_register(&fimd_driver);
>>> -	if (ret < 0)
>>> -		return ret;
>>> +	&fimd_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_DP
>>> -	ret =3D platform_driver_register(&dp_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_fimd_drv;
>>> +	&dp_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_DSI
>>> -	ret =3D platform_driver_register(&dsi_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_dp_drv;
>>> +	&dsi_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_HDMI
>>> -	ret =3D platform_driver_register(&mixer_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_dsi_drv;
>>> -	ret =3D platform_driver_register(&hdmi_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_mixer_drv;
>>> +	&mixer_driver,
>>> +	&hdmi_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_G2D
>>> -	ret =3D platform_driver_register(&g2d_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_hdmi_drv;
>>> +	&g2d_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_FIMC
>>> -	ret =3D platform_driver_register(&fimc_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_g2d_drv;
>>> +	&fimc_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_ROTATOR
>>> -	ret =3D platform_driver_register(&rotator_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_fimc_drv;
>>> +	&rotator_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_GSC
>>> -	ret =3D platform_driver_register(&gsc_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_rotator_drv;
>>> +	&gsc_driver,
>>>  #endif
>>> -
>>>  #ifdef CONFIG_DRM_EXYNOS_IPP
>>> -	ret =3D platform_driver_register(&ipp_driver);
>>> -	if (ret < 0)
>>> -		goto err_unregister_gsc_drv;
>>> +	&ipp_driver,
>>> +#endif
>>> +};
>>> +
>>> +static int exynos_drm_platform_probe(struct platform_device *pdev)
>>> +{
>>> +	struct component_match *match;
>>> +	int ret, i;
>>> +
>>> +	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
>>> +	exynos_drm_driver.num_ioctls =3D ARRAY_SIZE(exynos_ioctls);
>>> +
>>> +	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
>>> +		ret =3D platform_driver_register(exynos_drm_drivers[i]);
>>> +		if (ret < 0)
>>> +			goto err_unregister_drivers;
>>> +	}
>>> =20
>>>  	ret =3D exynos_platform_device_ipp_register();
>>>  	if (ret < 0)
>>> -		goto err_unregister_ipp_drv;
>>> -#endif
>>> +		goto err_unregister_drivers;
>>> =20
>>>  	match =3D exynos_drm_match_add(&pdev->dev);
>>>  	if (IS_ERR(match)) {
>>> @@ -632,96 +612,24 @@ static int exynos_drm_platform_probe(struct p=
latform_device *pdev)
>>>  						match);
>>> =20
>>>  err_unregister_ipp_dev:
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_IPP
>>>  	exynos_platform_device_ipp_unregister();
>>> -err_unregister_ipp_drv:
>>> -	platform_driver_unregister(&ipp_driver);
>>> -err_unregister_gsc_drv:
>>> -#endif
>>> =20
>>> -#ifdef CONFIG_DRM_EXYNOS_GSC
>>> -	platform_driver_unregister(&gsc_driver);
>>> -err_unregister_rotator_drv:
>>> -#endif
>>> +err_unregister_drivers:
>>> +	while (--i >=3D 0)
>>> +		platform_driver_unregister(exynos_drm_drivers[i]);
>>> =20
>>> -#ifdef CONFIG_DRM_EXYNOS_ROTATOR
>>> -	platform_driver_unregister(&rotator_driver);
>>> -err_unregister_fimc_drv:
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_FIMC
>>> -	platform_driver_unregister(&fimc_driver);
>>> -err_unregister_g2d_drv:
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_G2D
>>> -	platform_driver_unregister(&g2d_driver);
>>> -err_unregister_hdmi_drv:
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_HDMI
>>> -	platform_driver_unregister(&hdmi_driver);
>>> -err_unregister_mixer_drv:
>>> -	platform_driver_unregister(&mixer_driver);
>>> -err_unregister_dsi_drv:
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_DSI
>>> -	platform_driver_unregister(&dsi_driver);
>>> -err_unregister_dp_drv:
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_DP
>>> -	platform_driver_unregister(&dp_driver);
>>> -err_unregister_fimd_drv:
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_FIMD
>>> -	platform_driver_unregister(&fimd_driver);
>>> -#endif
>>>  	return ret;
>>>  }
>>> =20
>>>  static int exynos_drm_platform_remove(struct platform_device *pdev=
)
>>>  {
>>> -#ifdef CONFIG_DRM_EXYNOS_IPP
>>> -	exynos_platform_device_ipp_unregister();
>>> -	platform_driver_unregister(&ipp_driver);
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_GSC
>>> -	platform_driver_unregister(&gsc_driver);
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_ROTATOR
>>> -	platform_driver_unregister(&rotator_driver);
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_FIMC
>>> -	platform_driver_unregister(&fimc_driver);
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_G2D
>>> -	platform_driver_unregister(&g2d_driver);
>>> -#endif
>>> -
>>> -#ifdef CONFIG_DRM_EXYNOS_HDMI
>>> -	platform_driver_unregister(&mixer_driver);
>>> -	platform_driver_unregister(&hdmi_driver);
>>> -#endif
>>> +	int i;
>>> =20
>>> -#ifdef CONFIG_DRM_EXYNOS_FIMD
>>> -	platform_driver_unregister(&fimd_driver);
>>> -#endif
>>> +	exynos_platform_device_ipp_unregister();
>>> =20
>>> -#ifdef CONFIG_DRM_EXYNOS_DSI
>>> -	platform_driver_unregister(&dsi_driver);
>>> -#endif
>>> +	for (i =3D ARRAY_SIZE(exynos_drm_drivers) - 1; i >=3D 0; --i)
>>> +		platform_driver_unregister(exynos_drm_drivers[i]);
>>> =20
>>> -#ifdef CONFIG_DRM_EXYNOS_DP
>>> -	platform_driver_unregister(&dp_driver);
>>> -#endif
>>>  	component_master_del(&pdev->dev, &exynos_drm_ops);
>>>  	return 0;
>>>  }
>>> @@ -745,11 +653,9 @@ static int exynos_drm_init(void)
>>>  	if (IS_ERR(exynos_drm_pdev))
>>>  		return PTR_ERR(exynos_drm_pdev);
>>> =20
>>> -#ifdef CONFIG_DRM_EXYNOS_VIDI
>>>  	ret =3D exynos_drm_probe_vidi();
>>>  	if (ret < 0)
>>>  		goto err_unregister_pd;
>>> -#endif
>>> =20
>>>  	ret =3D platform_driver_register(&exynos_drm_platform_driver);
>>>  	if (ret)
>>> @@ -758,11 +664,9 @@ static int exynos_drm_init(void)
>>>  	return 0;
>>> =20
>>>  err_remove_vidi:
>>> -#ifdef CONFIG_DRM_EXYNOS_VIDI
>>>  	exynos_drm_remove_vidi();
>>> =20
>>>  err_unregister_pd:
>>> -#endif
>>>  	platform_device_unregister(exynos_drm_pdev);
>>> =20
>>>  	return ret;
>>> @@ -771,9 +675,9 @@ err_unregister_pd:
>>>  static void exynos_drm_exit(void)
>>>  {
>>>  	platform_driver_unregister(&exynos_drm_platform_driver);
>>> -#ifdef CONFIG_DRM_EXYNOS_VIDI
>>> +
>>>  	exynos_drm_remove_vidi();
>>> -#endif
>>> +
>>>  	platform_device_unregister(exynos_drm_pdev);
>>>  }
>>> =20
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/=
drm/exynos/exynos_drm_drv.h
>>> index 69a6fa3..76d5d02 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> @@ -324,15 +324,14 @@ int exynos_platform_device_hdmi_register(void=
);
>>>   */
>>>  void exynos_platform_device_hdmi_unregister(void);
>>> =20
>>> -/*
>>> - * this function registers exynos drm ipp platform device.
>>> - */
>>> +#ifdef CONFIG_DRM_EXYNOS_IPP
>>>  int exynos_platform_device_ipp_register(void);
>>> -
>>> -/*
>>> - * this function unregisters exynos drm ipp platform device if it =
exists.
>>> - */
>>>  void exynos_platform_device_ipp_unregister(void);
>>> +#else
>>> +static inline int exynos_platform_device_ipp_register(void) { retu=
rn 0; }
>>> +static inline void exynos_platform_device_ipp_unregister(void) {}
>>> +#endif
>>> +
>>> =20
>>>  #ifdef CONFIG_DRM_EXYNOS_DPI
>>>  struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
>>> @@ -343,15 +342,13 @@ exynos_dpi_probe(struct device *dev) { return=
 NULL; }
>>>  static inline int exynos_dpi_remove(struct device *dev) { return 0=
; }
>>>  #endif
>>> =20
>>> -/*
>>> - * this function registers exynos drm vidi platform device/driver.
>>> - */
>>> +#ifdef CONFIG_DRM_EXYNOS_VIDI
>>>  int exynos_drm_probe_vidi(void);
>>> -
>>> -/*
>>> - * this function unregister exynos drm vidi platform device/driver=
=2E
>>> - */
>>>  void exynos_drm_remove_vidi(void);
>>> +#else
>>> +static inline int exynos_drm_probe_vidi(void) { return 0; }
>>> +static inline void exynos_drm_remove_vidi(void) {}
>>> +#endif
>>> =20
>>>  /* This function creates a encoder and a connector, and initialize=
s them. */
>>>  int exynos_drm_create_enc_conn(struct drm_device *dev,
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20

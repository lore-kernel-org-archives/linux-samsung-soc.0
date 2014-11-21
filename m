From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v3 1/4] drm/exynos: make kms drivers to be independent
 drivers
Date: Fri, 21 Nov 2014 09:39:43 +0100
Message-ID: <546EFA4F.3040504@samsung.com>
References: <1416479088-29371-1-git-send-email-inki.dae@samsung.com>
 <1416479088-29371-2-git-send-email-inki.dae@samsung.com>
 <546DEA66.8010605@samsung.com> <546DF329.20201@samsung.com>
 <546DF973.5050809@samsung.com> <546DFCBF.4040500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51254 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758003AbaKUIjs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 03:39:48 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFD002IDS72XF60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Nov 2014 08:42:38 +0000 (GMT)
In-reply-to: <546DFCBF.4040500@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 11/20/2014 03:37 PM, Inki Dae wrote:
> On 2014=EB=85=84 11=EC=9B=94 20=EC=9D=BC 23:23, Andrzej Hajda wrote:
>> On 11/20/2014 02:56 PM, Inki Dae wrote:
>>> On 2014=EB=85=84 11=EC=9B=94 20=EC=9D=BC 22:19, Andrzej Hajda wrote=
:
>>>> On 11/20/2014 11:24 AM, Inki Dae wrote:
>>>>> This patch makes kms drivers to be independent drivers.
>>>>> For this, it removes all register codes to kms drivers
>>>>> from exynos_drm_drv module and adds module_init/exit
>>>>> for each kms driver so that each kms driver can be
>>>>> called independently.
>>>>>
>>>>> Changelog v3:
>>>>> - Use module_platform_driver macro instead module_init/exit.
>>>>> - Configure all kms drivers to be built in kernel image.
>>>>>
>>>>> Changelog v2:
>>>>> - none
>>>>>
>>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>>> ---
>>>>>  drivers/gpu/drm/exynos/exynos_dp_core.c  |    2 ++
>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   43 +++-------------=
--------------
>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |    5 ----
>>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c  |    2 ++
>>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    2 ++
>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     |    2 ++
>>>>>  drivers/gpu/drm/exynos/exynos_mixer.c    |    2 ++
>>>>>  7 files changed, 13 insertions(+), 45 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gp=
u/drm/exynos/exynos_dp_core.c
>>>>> index ed818b9..30ebf5d 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
>>>>> @@ -1408,6 +1408,8 @@ struct platform_driver dp_driver =3D {
>>>>>  	},
>>>>>  };
>>>>> =20
>>>>> +module_platform_driver(dp_driver);
>>>> If you try to build exynosdrm as module you will receive errors du=
e to
>>>> multiple definitions of init_module, ie module_init/module_*_drive=
r
>>>> macros can be used once per module.
>>> Ah, right. we had ever tried same way before but failed in same pro=
blem.
>>> I didn't realize that. Anyway, I will try to find out a better way.=
 I'd
>>> really like to remove all register codes of sub drivers from
>>> exynos_drm_drv somehow.
>> I have proposed once solution with sparse arrays, using linker scrip=
ts
>> [1]. Something similar is used with clock controllers as I remember.
>> I do not see other possibilities to fully separate components of
>> exynos_drm_drv.
>>
>> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/103816
>>
> I know this patch. I wasn't sure that the use of the private linker
> section is reasonable and overuse it. Actually, Mr. Park opposed this
> way. It might be a good idea if no problem for device drivers use the
> private linker section. Is there any device driver using the private
> linker section?

No, there are no dev drivers using it, but it is hardly used anyway.

Quick look at include/asm-generic/vmlinux.lds.h shows following sparse
arrays:
#define CLKSRC_OF_TABLES()      OF_TABLE(CONFIG_CLKSRC_OF, clksrc)
#define IRQCHIP_OF_MATCH_TABLE() OF_TABLE(CONFIG_IRQCHIP, irqchip)
#define CLK_OF_TABLES()         OF_TABLE(CONFIG_COMMON_CLK, clk)
#define RESERVEDMEM_OF_TABLES() OF_TABLE(CONFIG_OF_RESERVED_MEM,
reservedmem)
#define CPU_METHOD_OF_TABLES()  OF_TABLE(CONFIG_SMP, cpu_method)
#define EARLYCON_OF_TABLES()    OF_TABLE(CONFIG_SERIAL_EARLYCON, earlyc=
on)

The number of arrays slowly grows over time, so some day they can start
appear in drivers as well :)

Such array in driver doesn't look like much different to me, it is just
a workaround for language limitations,
but it would be good to have an opinion of people more involved in
linker scripts.

On the other side having list of component drivers in exynos_drm_drv an=
d
registering them
in module init maybe is not pretty, but it does the same thing and is
quite clear and standard.

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Regards
>> Andrzej
>>
>>>> Anyway I am afraid exynosdrm seems to be still fragile to order of
>>>> successful probes of their components.
>>>> It can be easily observed on the system with two display pipelines=
 with
>>>> one of them probe deferring. For example universal with fimd/dpi +=
 vidi:
>>>> 1. fimd defers probe because panel is not yet probed.
>>>> 2. vidi probes ok.
>>>> 3. drmdev is initialized.
>>>> 4. fimd probes ok, but it is too late!!!
>>>>
>>>> So you can reproduce the scenario on any target when one of the
>>>> components defers and vidi is present (vidi never defers I suppose=
).
>>> Thanks for checking,
>>> Inki Dae
>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>>> +
>>>>>  MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>>>>  MODULE_DESCRIPTION("Samsung SoC DP Driver");
>>>>>  MODULE_LICENSE("GPL v2");
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gp=
u/drm/exynos/exynos_drm_drv.c
>>>>> index eab12f0..02d4772 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>>>> @@ -484,12 +484,6 @@ static struct component_match *exynos_drm_ma=
tch_add(struct device *dev)
>>>>> =20
>>>>>  	mutex_lock(&drm_component_lock);
>>>>> =20
>>>>> -	/* Do not retry to probe if there is no any kms driver regitere=
d. */
>>>>> -	if (list_empty(&drm_component_list)) {
>>>>> -		mutex_unlock(&drm_component_lock);
>>>>> -		return ERR_PTR(-ENODEV);
>>>>> -	}
>>>>> -
>>>>>  	list_for_each_entry(cdev, &drm_component_list, list) {
>>>>>  		/*
>>>>>  		 * Add components to master only in case that crtc and
>>>>> @@ -545,22 +539,6 @@ static const struct component_master_ops exy=
nos_drm_ops =3D {
>>>>>  	.unbind		=3D exynos_drm_unbind,
>>>>>  };
>>>>> =20
>>>>> -static struct platform_driver *const exynos_drm_kms_drivers[] =3D=
 {
>>>>> -#ifdef CONFIG_DRM_EXYNOS_FIMD
>>>>> -	&fimd_driver,
>>>>> -#endif
>>>>> -#ifdef CONFIG_DRM_EXYNOS_DP
>>>>> -	&dp_driver,
>>>>> -#endif
>>>>> -#ifdef CONFIG_DRM_EXYNOS_DSI
>>>>> -	&dsi_driver,
>>>>> -#endif
>>>>> -#ifdef CONFIG_DRM_EXYNOS_HDMI
>>>>> -	&mixer_driver,
>>>>> -	&hdmi_driver,
>>>>> -#endif
>>>>> -};
>>>>> -
>>>>>  static struct platform_driver *const exynos_drm_non_kms_drivers[=
] =3D {
>>>>>  #ifdef CONFIG_DRM_EXYNOS_G2D
>>>>>  	&g2d_driver,
>>>>> @@ -587,22 +565,14 @@ static int exynos_drm_platform_probe(struct=
 platform_device *pdev)
>>>>>  	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
>>>>>  	exynos_drm_driver.num_ioctls =3D ARRAY_SIZE(exynos_ioctls);
>>>>> =20
>>>>> -	for (i =3D 0; i < ARRAY_SIZE(exynos_drm_kms_drivers); ++i) {
>>>>> -		ret =3D platform_driver_register(exynos_drm_kms_drivers[i]);
>>>>> -		if (ret < 0)
>>>>> -			goto err_unregister_kms_drivers;
>>>>> -	}
>>>>> -
>>>>>  	match =3D exynos_drm_match_add(&pdev->dev);
>>>>> -	if (IS_ERR(match)) {
>>>>> -		ret =3D PTR_ERR(match);
>>>>> -		goto err_unregister_kms_drivers;
>>>>> -	}
>>>>> +	if (IS_ERR(match))
>>>>> +		return PTR_ERR(match);
>>>>> =20
>>>>>  	ret =3D component_master_add_with_match(&pdev->dev, &exynos_drm=
_ops,
>>>>>  						match);
>>>>>  	if (ret < 0)
>>>>> -		goto err_unregister_kms_drivers;
>>>>> +		return ret;
>>>>> =20
>>>>>  	for (j =3D 0; j < ARRAY_SIZE(exynos_drm_non_kms_drivers); ++j) =
{
>>>>>  		ret =3D platform_driver_register(exynos_drm_non_kms_drivers[j]=
);
>>>>> @@ -632,10 +602,6 @@ err_unregister_non_kms_drivers:
>>>>>  err_del_component_master:
>>>>>  	component_master_del(&pdev->dev, &exynos_drm_ops);
>>>>> =20
>>>>> -err_unregister_kms_drivers:
>>>>> -	while (--i >=3D 0)
>>>>> -		platform_driver_unregister(exynos_drm_kms_drivers[i]);
>>>>> -
>>>>>  	return ret;
>>>>>  }
>>>>> =20
>>>>> @@ -654,9 +620,6 @@ static int exynos_drm_platform_remove(struct =
platform_device *pdev)
>>>>> =20
>>>>>  	component_master_del(&pdev->dev, &exynos_drm_ops);
>>>>> =20
>>>>> -	for (i =3D ARRAY_SIZE(exynos_drm_kms_drivers) - 1; i >=3D 0; --=
i)
>>>>> -		platform_driver_unregister(exynos_drm_kms_drivers[i]);
>>>>> -
>>>>>  	return 0;
>>>>>  }
>>>>> =20
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gp=
u/drm/exynos/exynos_drm_drv.h
>>>>> index 262a459..352a9f9 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>>>> @@ -331,11 +331,6 @@ int exynos_drm_component_add(struct device *=
dev,
>>>>>  void exynos_drm_component_del(struct device *dev,
>>>>>  				enum exynos_drm_device_type dev_type);
>>>>> =20
>>>>> -extern struct platform_driver fimd_driver;
>>>>> -extern struct platform_driver dp_driver;
>>>>> -extern struct platform_driver dsi_driver;
>>>>> -extern struct platform_driver mixer_driver;
>>>>> -extern struct platform_driver hdmi_driver;
>>>>>  extern struct platform_driver exynos_drm_common_hdmi_driver;
>>>>>  extern struct platform_driver vidi_driver;
>>>>>  extern struct platform_driver g2d_driver;
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gp=
u/drm/exynos/exynos_drm_dsi.c
>>>>> index 66d427e..6e34ed5 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>> @@ -1799,6 +1799,8 @@ struct platform_driver dsi_driver =3D {
>>>>>  	},
>>>>>  };
>>>>> =20
>>>>> +module_platform_driver(dsi_driver);
>>>>> +
>>>>>  MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
>>>>>  MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
>>>>>  MODULE_DESCRIPTION("Samsung SoC MIPI DSI Master");
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/g=
pu/drm/exynos/exynos_drm_fimd.c
>>>>> index 0673a39..3e47625 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> @@ -1240,3 +1240,5 @@ struct platform_driver fimd_driver =3D {
>>>>>  		.of_match_table =3D fimd_driver_dt_match,
>>>>>  	},
>>>>>  };
>>>>> +
>>>>> +module_platform_driver(fimd_driver);
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/d=
rm/exynos/exynos_hdmi.c
>>>>> index 563a19e..d9bfb33 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>>>>> @@ -2537,3 +2537,5 @@ struct platform_driver hdmi_driver =3D {
>>>>>  		.of_match_table =3D hdmi_match_types,
>>>>>  	},
>>>>>  };
>>>>> +
>>>>> +module_platform_driver(hdmi_driver);
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/=
drm/exynos/exynos_mixer.c
>>>>> index a41c84e..599c0cc 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>> @@ -1349,3 +1349,5 @@ struct platform_driver mixer_driver =3D {
>>>>>  	.remove =3D mixer_remove,
>>>>>  	.id_table	=3D mixer_driver_types,
>>>>>  };
>>>>> +
>>>>> +module_platform_driver(mixer_driver);
>>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-sa=
msung-soc" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>
>

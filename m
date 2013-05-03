From: Sean Paul <seanpaul@google.com>
Subject: Re: [PATCH 1/4] drm/exynos: hdmi: move hdmi subsystem registration to
 drm common hdmi
Date: Fri, 3 May 2013 12:30:12 -0400
Message-ID: <CAOw6vb+NBTd5x+B=NLu07vb4HnkiocMk9DD2nQVZBPmYSr=kFA@mail.gmail.com>
References: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
 <1367247053-17105-2-git-send-email-rahul.sharma@samsung.com>
 <CAOw6vb+zHA4sHyKSrcUaDQAnQkQh=WC3Zbyz_VC4uXWbymv=jA@mail.gmail.com> <CAPdUM4MUOnViLbPAse4nQx_J2doTiphz+Wwn6A8OQ68=v3Xcqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:36668 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932481Ab3ECQad (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 May 2013 12:30:33 -0400
Received: by mail-oa0-f51.google.com with SMTP id g12so1826667oah.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 May 2013 09:30:33 -0700 (PDT)
In-Reply-To: <CAPdUM4MUOnViLbPAse4nQx_J2doTiphz+Wwn6A8OQ68=v3Xcqw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, InKi Dae <inki.dae@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On Fri, May 3, 2013 at 2:04 AM, Rahul Sharma <r.sh.open@gmail.com> wrote:
> On Mon, Apr 29, 2013 at 10:06 PM, Sean Paul <seanpaul@google.com> wrote:
>> On Mon, Apr 29, 2013 at 10:50 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>>> Exynos hdmi sub-system consists of mixer, hdmi ip, hdmi-phy and hdmi-ddc
>>> components. Currently, drivers for these components are getting registered
>>> in exynos_drm_drv.c, which is meant for registration of drm sub-drivers.
>>>
>>> In this patch, registration of drm hdmi sub-driver and device, drivers for
>>> hdmi sub-system components are moved to exynos_drm_hdmi.c. This ensures
>>> limited & relevant exposure of hdmi-sub-system components to exynos_drm_drv.c.
>>> It will also help in handling the hdmi-sub-system diversities within the
>>> exynos-common-hdmi.
>>>
>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   25 ++--------------
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   14 ++++-----
>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |   46 ++++++++++++++++++++++++------
>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |    3 ++
>>>  4 files changed, 49 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> index ba6d995..4eabb6e 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> @@ -331,19 +331,9 @@ static int __init exynos_drm_init(void)
>>>  #endif
>>>
>>>  #ifdef CONFIG_DRM_EXYNOS_HDMI
>>> -       ret = platform_driver_register(&hdmi_driver);
>>> +       ret = exynos_common_hdmi_register();
>>>         if (ret < 0)
>>>                 goto out_hdmi;
>>> -       ret = platform_driver_register(&mixer_driver);
>>> -       if (ret < 0)
>>> -               goto out_mixer;
>>> -       ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
>>> -       if (ret < 0)
>>> -               goto out_common_hdmi;
>>> -
>>> -       ret = exynos_platform_device_hdmi_register();
>>> -       if (ret < 0)
>>> -               goto out_common_hdmi_dev;
>>>  #endif
>>>
>>>  #ifdef CONFIG_DRM_EXYNOS_VIDI
>>> @@ -436,13 +426,7 @@ out_vidi:
>>>  #endif
>>>
>>>  #ifdef CONFIG_DRM_EXYNOS_HDMI
>>> -       exynos_platform_device_hdmi_unregister();
>>> -out_common_hdmi_dev:
>>> -       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
>>> -out_common_hdmi:
>>> -       platform_driver_unregister(&mixer_driver);
>>> -out_mixer:
>>> -       platform_driver_unregister(&hdmi_driver);
>>> +       exynos_common_hdmi_unregister();
>>>  out_hdmi:
>>>  #endif
>>>
>>> @@ -483,10 +467,7 @@ static void __exit exynos_drm_exit(void)
>>>  #endif
>>>
>>>  #ifdef CONFIG_DRM_EXYNOS_HDMI
>>> -       exynos_platform_device_hdmi_unregister();
>>> -       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
>>> -       platform_driver_unregister(&mixer_driver);
>>> -       platform_driver_unregister(&hdmi_driver);
>>> +       exynos_common_hdmi_unregister();
>>>  #endif
>>>
>>>  #ifdef CONFIG_DRM_EXYNOS_VIDI
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> index eaa1966..34aa36d 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> @@ -319,15 +319,16 @@ int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
>>>  void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
>>>
>>>  /*
>>> - * this function registers exynos drm hdmi platform device. It ensures only one
>>> - * instance of the device is created.
>>> + * this function registers exynos drm hdmi platform driver and singleton
>>> + * device. It also registers subdrivers like mixer, hdmi and hdmiphy.
>>>   */
>>> -int exynos_platform_device_hdmi_register(void);
>>> +int exynos_common_hdmi_register(void);
>>>
>>>  /*
>>> - * this function unregisters exynos drm hdmi platform device if it exists.
>>> + * this function unregisters exynos drm hdmi platform driver and device,
>>> + * subdrivers for mixer, hdmi and hdmiphy.
>>>   */
>>> -void exynos_platform_device_hdmi_unregister(void);
>>> +void exynos_common_hdmi_unregister(void);
>>>
>>>  /*
>>>   * this function registers exynos drm ipp platform device.
>>> @@ -340,9 +341,6 @@ int exynos_platform_device_ipp_register(void);
>>>  void exynos_platform_device_ipp_unregister(void);
>>>
>>>  extern struct platform_driver fimd_driver;
>>> -extern struct platform_driver hdmi_driver;
>>> -extern struct platform_driver mixer_driver;
>>> -extern struct platform_driver exynos_drm_common_hdmi_driver;
>>>  extern struct platform_driver vidi_driver;
>>>  extern struct platform_driver g2d_driver;
>>>  extern struct platform_driver fimc_driver;
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>>> index 060fbe8..7ab5f9f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>>> @@ -41,6 +41,8 @@ static struct exynos_drm_hdmi_context *mixer_ctx;
>>>  static struct exynos_hdmi_ops *hdmi_ops;
>>>  static struct exynos_mixer_ops *mixer_ops;
>>>
>>> +struct platform_driver exynos_drm_common_hdmi_driver;
>>
>> What's the point of even having this driver? It doesn't do anything.
>> You call exynos_common_hdmi_register/unregister in drm_drv anyways.
>> Why not just register the mixer/hdmi/hdmiphy drivers and exynos subdrv
>> in those functions directly?
>>
>
> Hi Sean,
>
> We need this driver to route call to hdmi/mixer/hdmiphy drivers.
> All these IP drivers (due to hardware design) cannot independently
> implement display / manager / overlay callbacks. This dummy driver
> cleanly abstracts these implicit hardware requirements. Please
> suggest if you have any better idea to handle this.
>
> Idea behind moving HDMI subsystem registration to this driver is to
> keep these details with in the driver which manages hdmi/mixer/
> hdmiphy. Keeping it local to common-drm-hdmi seems logical wrt
> hierarchy "exynos-drm" -> "exynos-drm-hdmi" ->
> (hdmi / mixer / hdmiphy / ddc). Funcionally, both are same.
>

I understand the abstraction, I don't agree with it (since it
contradicts the decision to keep DP out of drm), but I understand what
you're trying to do and I'm not disputing that here. What I'm taking
exception with is spinning off a platform driver whose only purpose is
to spin off other platform drivers.

As far as I can tell, the only useful thing this driver does is give
you a device pointer that you can use to get at the context in the
subdrv callbacks. I guess that's something, but it's silly. If the
subdrv callbacks passed subdrv instead of dev (since the first thing
each callback does is get subdrv from dev), you wouldn't need to do
this.

Ideally, I think the better way to do this would be to allocate and
register your subdrv and register the hdmi/mixer/hdmiphy drivers in
exynos_common_hdmi_register and just forget about this middle layer
driver.

I think I'll take a stab at making this stuff coherent in a separate patch set.

Sean




> regards,
> Rahul Sharma.
>
>>> +
>>>  struct drm_hdmi_context {
>>>         struct exynos_drm_subdrv        subdrv;
>>>         struct exynos_drm_hdmi_context  *hdmi_ctx;
>>> @@ -49,29 +51,55 @@ struct drm_hdmi_context {
>>>         bool    enabled[MIXER_WIN_NR];
>>>  };
>>>
>>> -int exynos_platform_device_hdmi_register(void)
>>> +int exynos_common_hdmi_register(void)
>>>  {
>>>         struct platform_device *pdev;
>>> +       int ret;
>>>
>>>         if (exynos_drm_hdmi_pdev)
>>>                 return -EEXIST;
>>>
>>> +       ret = platform_driver_register(&hdmi_driver);
>>> +       if (ret < 0)
>>> +               goto out_hdmi;
>>> +
>>> +       ret = platform_driver_register(&mixer_driver);
>>> +       if (ret < 0)
>>> +               goto out_mixer;
>>> +
>>> +       ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
>>> +       if (ret < 0)
>>> +               goto out_common_hdmi;
>>> +
>>>         pdev = platform_device_register_simple(
>>>                         "exynos-drm-hdmi", -1, NULL, 0);
>>> -       if (IS_ERR(pdev))
>>> -               return PTR_ERR(pdev);
>>> +       if (IS_ERR(pdev)) {
>>> +               ret = PTR_ERR(pdev);
>>> +               goto out_common_hdmi_dev;
>>> +       }
>>>
>>>         exynos_drm_hdmi_pdev = pdev;
>>> -
>>>         return 0;
>>> +
>>> +out_common_hdmi_dev:
>>> +       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
>>> +out_common_hdmi:
>>> +       platform_driver_unregister(&mixer_driver);
>>> +out_mixer:
>>> +       platform_driver_unregister(&hdmi_driver);
>>> +out_hdmi:
>>> +       return ret;
>>>  }
>>>
>>> -void exynos_platform_device_hdmi_unregister(void)
>>> +void exynos_common_hdmi_unregister(void)
>>>  {
>>> -       if (exynos_drm_hdmi_pdev) {
>>> -               platform_device_unregister(exynos_drm_hdmi_pdev);
>>> -               exynos_drm_hdmi_pdev = NULL;
>>> -       }
>>> +       if (!exynos_drm_hdmi_pdev)
>>> +               return;
>>> +       platform_device_unregister(exynos_drm_hdmi_pdev);
>>> +       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
>>> +       platform_driver_unregister(&mixer_driver);
>>> +       platform_driver_unregister(&hdmi_driver);
>>> +       exynos_drm_hdmi_pdev = NULL;
>>>  }
>>>
>>>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>>> index 724cab1..8861b90 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>>> @@ -60,6 +60,9 @@ struct exynos_mixer_ops {
>>>         int (*check_mode)(void *ctx, struct drm_display_mode *mode);
>>>  };
>>>
>>> +extern struct platform_driver hdmi_driver;
>>> +extern struct platform_driver mixer_driver;
>>> +
>>>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>>  void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
>>> --
>>> 1.7.10.4
>>>

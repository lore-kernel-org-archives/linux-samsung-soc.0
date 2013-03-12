From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH RFC] drm/exynos: hdmi: move hdmiphy related code to
 hdmiphy driver
Date: Tue, 12 Mar 2013 15:48:22 +0530
Message-ID: <CAPdUM4PNiH7m7YSXFDk7GfK_YOqOrvXvvVQDHkxEupiakA7pOA@mail.gmail.com>
References: <1361971327-7459-1-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbLp1d8X6oKsbTVa0_5DqtFJATaM6-qt_+O+RO8y3uH2WQ@mail.gmail.com>
	<CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:41289 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932127Ab3CLKSY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 06:18:24 -0400
Received: by mail-wi0-f179.google.com with SMTP id ez12so1665576wid.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 03:18:22 -0700 (PDT)
In-Reply-To: <CAPdUM4Ox0VtLDf=sv7WwL-RnHsYetzcJKA5ew_3bSsR-pGuVUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@google.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, InKi Dae <inki.dae@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

On Mon, Mar 4, 2013 at 7:35 PM, Rahul Sharma <r.sh.open@gmail.com> wrote:
> Thanks Sean,
>
> On Wed, Feb 27, 2013 at 9:47 PM, Sean Paul <seanpaul@google.com> wrote:
>> On Wed, Feb 27, 2013 at 8:22 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>>> Right now hdmiphy operations and configs are kept inside hdmi driver. hdmiphy related
>>> code is tightly coupled with hdmi ip driver. Physicaly they are different devices and
>>
>> s/Physicaly/Physically/
>>
>>> should be instantiated independently.
>>>
>>> In terms of versions/mapping/configurations Hdmi and hdmiphy are independent of each
>>> other. It is preferred to isolate them and maintained independently.
>>>
>>> This implementations is tested for:
>>> 1) Resolutions supported by exynos4 and 5 hdmi.
>>> 2) Runtime PM and S2R scenarions for exynos5.
>>>
>>
>> I don't like the idea of spawning off yet another driver in here. It
>> adds more globals, more suspend/resume ordering issues, and more
>> implicit dependencies. I understand, however, that this is the Chosen
>> Way for the exynos driver, so I will save my rant.
>>
>
> I agree to it. splitting phy to a new driver will complicate the power related
> scenarios. But in upcoming SoC,s, Phy is changing considerably in terms of
> config values, mapping (i2c/platform bus) etc. Handling this diversity
> inside hdmi driver is complicating it with unrelated changes.
>
> I have tested this RFC for Runtime PM / S2R. But if we see any major roadblock
> we should re-factor this by explicitly calling power related callbacks
> of mixer, phy,
> hdmi drivers in a required order. We can call them from exynos-drm-hdmi plf
> device. AFAIR something like this is already in place in chrome-kernel.
>
>> I've made some comments below.
>>
>>> This patch is dependent on
>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34733.html
>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34861.html
>>> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34862.html
>>>
>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>> ---
>>> It is based on exynos-drm-next-todo branch at
>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>>
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   8 +
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   6 +
>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  58 ++-
>>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |  11 +
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 375 ++------------------
>>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |   1 -
>>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  | 586 ++++++++++++++++++++++++++++++-
>>>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |  61 ++++
>>>  8 files changed, 738 insertions(+), 368 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> index 3da5c2d..03acb6b 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>> @@ -334,6 +334,11 @@ static int __init exynos_drm_init(void)
>>>         ret = platform_driver_register(&hdmi_driver);
>>>         if (ret < 0)
>>>                 goto out_hdmi;
>>> +
>>> +       ret = exynos_hdmiphy_driver_register();
>>
>> Not sure why you need to obfuscate the type of driver here. All the
>> other ones are directly registered as platform drivers, I don't see
>> the harm in just doing the i2c_add_driver directly here.
>>
>
> AIMB, Phy is likely to get mapped as a platform device in later soc's.
> I want to make driver registration (inside exynos_drm_drv.c) independent
> of this changes. We can handle this inside exynos_hdmiphy_driver_register().
>
>>> +       if (ret < 0)
>>> +               goto out_hdmiphy;
>>> +
>>>         ret = platform_driver_register(&mixer_driver);
>>>         if (ret < 0)
>>>                 goto out_mixer;
>>
>>
>> I think this ordering is how you plan on enforcing the suspend/resume
>> order for hdmi/mixer/hdmiphy. In that case, however, I don't think it
>> makes sense to suspend/resume hdmiphy in between mixer and hdmi.
>> Ideally, hdmiphy should go down first and come up last.
>>
>
> I just wanted to keep, hdmi and hdmiphy things together. But what you said
> above makes sense. I will do that change.
>
>>
>>> @@ -436,6 +441,8 @@ out_common_hdmi_dev:
>>>  out_common_hdmi:
>>>         platform_driver_unregister(&mixer_driver);
>>>  out_mixer:
>>> +       exynos_hdmiphy_driver_unregister();
>>> +out_hdmiphy:
>>>         platform_driver_unregister(&hdmi_driver);
>>>  out_hdmi:
>>>  #endif
>>> @@ -479,6 +486,7 @@ static void __exit exynos_drm_exit(void)
>>>         exynos_platform_device_hdmi_unregister();
>>>         platform_driver_unregister(&exynos_drm_common_hdmi_driver);
>>>         platform_driver_unregister(&mixer_driver);
>>> +       exynos_hdmiphy_driver_unregister();
>>>         platform_driver_unregister(&hdmi_driver);
>>>  #endif
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> index 4606fac..17c53e3 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>> @@ -325,6 +325,12 @@ void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
>>>  extern int exynos_platform_device_hdmi_register(void);
>>>
>>>  /*
>>> + * these functions registers/unregisters exynos drm hdmiphy driver.
>>> + */
>>> +extern int exynos_hdmiphy_driver_register(void);
>>> +extern void exynos_hdmiphy_driver_unregister(void);
>>> +
>>> +/*
>>>   * this function unregisters exynos drm hdmi platform device if it exists.
>>>   */
>>>  void exynos_platform_device_hdmi_unregister(void);
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>>> index 5dc956b..45ef331 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>>> @@ -32,19 +32,22 @@
>>>  /* platform device pointer for common drm hdmi device. */
>>>  static struct platform_device *exynos_drm_hdmi_pdev;
>>>
>>> -/* Common hdmi subdrv needs to access the hdmi and mixer though context.
>>> -* These should be initialied by the repective drivers */
>>> +/* Common hdmi subdrv needs to access the hdmi, hdmiphy and mixer though
>>> +*  context. These should be initialied by the repective drivers */
>>>  static struct exynos_drm_hdmi_context *hdmi_ctx;
>>> +static struct exynos_drm_hdmi_context *hdmiphy_ctx;
>>>  static struct exynos_drm_hdmi_context *mixer_ctx;
>>>
>>>  /* these callback points shoud be set by specific drivers. */
>>>  static struct exynos_hdmi_ops *hdmi_ops;
>>> +static struct exynos_hdmiphy_ops *hdmiphy_ops;
>>>  static struct exynos_mixer_ops *mixer_ops;
>>>
>>
>> This stuff really sets my teeth on edge. I can't stand these global
>> variables and the set-here, set-there, set-here dance that is done on
>> probe.
>>
>> IMO, this and the suspend/resume ordering should be enough motivation
>> to avoid separating everything out into their own drivers.
>>
>> Instead of adding more kruft to this list, we should be working to remove it.
>>
>> /rant
>>
>
> Let me think over it. Please suggest me something if you have any idea to
> correct this.
>

Hi all,

I replaced these variables with a global LIST of subdrv's with associated
type (HDMI / PHY / MIXER) and ops struct.

drm-common-hdmi callback will parse this list and based on the subdrv
type calls subdrv functions, but this adds overhead of parsing the list
multiple times.

If I cache the subdrvs in drm-common-hdmi context and parsing of the list
can be avoided.

What you think about above approach?

regards,
Rahul Sharma.

>>>  struct drm_hdmi_context {
>>>         struct exynos_drm_subdrv        subdrv;
>>>         struct exynos_drm_hdmi_context  *hdmi_ctx;
>>>         struct exynos_drm_hdmi_context  *mixer_ctx;
>>> +       struct exynos_drm_hdmi_context  *hdmiphy_ctx;
>>>
>>>         bool    enabled[MIXER_WIN_NR];
>>>  };
>>> @@ -74,6 +77,12 @@ void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)
>>>                 hdmi_ctx = ctx;
>>>  }
>>>
>>> +void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx)
>>> +{
>>> +       if (ctx)
>>> +               hdmiphy_ctx = ctx;
>>> +}
>>> +
>>>  void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx)
>>>  {
>>>         if (ctx)
>>> @@ -88,6 +97,14 @@ void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops)
>>>                 hdmi_ops = ops;
>>>  }
>>>
>>> +void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops)
>>> +{
>>> +       DRM_DEBUG_KMS("%s\n", __FILE__);
>>
>> Listing __FILE__ in these DRM_DEBUG_KMS traces is pretty useless. I'm
>> sure we can determine the file from the function name. It would be
>> slightly more useful to list __LINE__, but even more useful if you
>> actually printed state relevant to the current function.
>>
>
> OK. I will correct this.
>
>>> +
>>> +       if (ops)
>>> +               hdmiphy_ops = ops;
>>> +}
>>> +
>>>  void exynos_mixer_ops_register(struct exynos_mixer_ops *ops)
>>>  {
>>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>>> @@ -121,7 +138,7 @@ struct edid *drm_hdmi_get_edid(struct device *dev,
>>>         return NULL;
>>>  }
>>>
>>> -static int drm_hdmi_check_timing(struct device *dev, void *timing)
>>> +static int drm_hdmi_check_timing(struct device *dev, void *mode)
>>>  {
>>>         struct drm_hdmi_context *ctx = to_context(dev);
>>>         int ret = 0;
>>> @@ -129,18 +146,24 @@ static int drm_hdmi_check_timing(struct device *dev, void *timing)
>>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>>>
>>>         /*
>>> -       * Both, mixer and hdmi should be able to handle the requested mode.
>>> -       * If any of the two fails, return mode as BAD.
>>> +       * Mixer, hdmi and hdmiphy should be able to handle the requested mode.
>>> +       * If any of the them fails, return mode as BAD.
>>>         */
>>>
>>>         if (mixer_ops && mixer_ops->check_timing)
>>> -               ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, timing);
>>> +               ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, mode);
>>>
>>>         if (ret)
>>>                 return ret;
>>>
>>>         if (hdmi_ops && hdmi_ops->check_timing)
>>> -               return hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, timing);
>>> +               ret = hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, mode);
>>> +
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (hdmiphy_ops && hdmiphy_ops->check_timing)
>>> +               return hdmiphy_ops->check_timing(ctx->hdmiphy_ctx->ctx, mode);
>>>
>>>         return 0;
>>>  }
>>> @@ -254,6 +277,9 @@ static void drm_hdmi_mode_set(struct device *subdrv_dev, void *mode)
>>>
>>>         if (hdmi_ops && hdmi_ops->mode_set)
>>>                 hdmi_ops->mode_set(ctx->hdmi_ctx->ctx, mode);
>>> +
>>> +       if (hdmiphy_ops && hdmiphy_ops->mode_set)
>>> +               hdmiphy_ops->mode_set(ctx->hdmiphy_ctx->ctx, mode);
>>>  }
>>>
>>>  static void drm_hdmi_get_max_resol(struct device *subdrv_dev,
>>> @@ -273,6 +299,15 @@ static void drm_hdmi_commit(struct device *subdrv_dev)
>>>
>>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>>>
>>> +       if (hdmiphy_ops && hdmiphy_ops->prepare)
>>> +               hdmiphy_ops->prepare(ctx->hdmiphy_ctx->ctx);
>>> +
>>> +       if (hdmi_ops && hdmi_ops->prepare)
>>> +               hdmi_ops->prepare(ctx->hdmi_ctx->ctx);
>>> +
>>
>> Why are you calling these prepare functions in commit? Isn't that
>> precisely the reason drm has a prepare callback?
>
> True. Currently exynos_drm_encoder_prepare is blank. I will move this to
> prepare callback.
>
>>
>>> +       if (hdmiphy_ops && hdmiphy_ops->config_apply)
>>> +               hdmiphy_ops->config_apply(ctx->hdmiphy_ctx->ctx);
>>> +
>>>         if (hdmi_ops && hdmi_ops->commit)
>>>                 hdmi_ops->commit(ctx->hdmi_ctx->ctx);
>>>  }
>>> @@ -288,6 +323,9 @@ static void drm_hdmi_dpms(struct device *subdrv_dev, int mode)
>>>
>>>         if (hdmi_ops && hdmi_ops->dpms)
>>>                 hdmi_ops->dpms(ctx->hdmi_ctx->ctx, mode);
>>> +
>>> +       if (hdmiphy_ops && hdmiphy_ops->dpms)
>>> +               hdmiphy_ops->dpms(ctx->hdmiphy_ctx->ctx, mode);
>>
>> I think you have to be more careful about the ordering of things here
>> since you'll want to power on in a different order than you power off.
>>
>>>  }
>>>
>>>  static void drm_hdmi_apply(struct device *subdrv_dev)
>>> @@ -393,6 +431,11 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev,
>>>                 return -EFAULT;
>>>         }
>>>
>>> +       if (!hdmiphy_ctx) {
>>> +               DRM_ERROR("hdmiphy context not initialized.\n");
>>> +               return -EFAULT;
>>> +       }
>>> +
>>>         if (!mixer_ctx) {
>>>                 DRM_ERROR("mixer context not initialized.\n");
>>>                 return -EFAULT;
>>> @@ -406,6 +449,7 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev,
>>>         }
>>>
>>>         ctx->hdmi_ctx = hdmi_ctx;
>>> +       ctx->hdmiphy_ctx = hdmiphy_ctx;
>>>         ctx->mixer_ctx = mixer_ctx;
>>>
>>>         ctx->hdmi_ctx->drm_dev = drm_dev;
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>>> index fd2ff9f..10db62e 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>>> @@ -39,10 +39,19 @@ struct exynos_hdmi_ops {
>>>         void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>>>         void (*get_max_resol)(void *ctx, unsigned int *width,
>>>                                 unsigned int *height);
>>> +       void (*prepare)(void *ctx);
>>>         void (*commit)(void *ctx);
>>>         void (*dpms)(void *ctx, int mode);
>>>  };
>>>
>>> +struct exynos_hdmiphy_ops {
>>> +       int (*check_timing)(void *ctx, struct drm_display_mode *mode);
>>> +       void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>>> +       void (*prepare)(void *ctx);
>>> +       int (*config_apply)(void *ctx);
>>> +       void (*dpms)(void *ctx, int mode);
>>> +};
>>> +
>>>  struct exynos_mixer_ops {
>>>         /* manager */
>>>         int (*iommu_on)(void *ctx, bool enable);
>>> @@ -61,7 +70,9 @@ struct exynos_mixer_ops {
>>>  };
>>>
>>>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>> +void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>>  void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
>>> +void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops);
>>>  void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);
>>>  #endif
>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> index a5ca2cc..7ee350d 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>>> @@ -194,7 +194,6 @@ struct hdmi_context {
>>>         int                             internal_irq;
>>>
>>>         struct i2c_client               *ddc_port;
>>> -       struct i2c_client               *hdmiphy_port;
>>>
>>>         /* current hdmiphy conf regs */
>>>         struct hdmi_conf_regs           mode_conf;
>>> @@ -206,180 +205,6 @@ struct hdmi_context {
>>>         enum hdmi_type                  type;
>>>  };
>>>
>>> -struct hdmiphy_config {
>>> -       int pixel_clock;
>>> -       u8 conf[32];
>>> -};
>>> -
>>> -/* list of phy config settings */
>>> -static const struct hdmiphy_config hdmiphy_v13_configs[] = {
>>> -       {
>>> -               .pixel_clock = 27000000,
>>> -               .conf = {
>>> -                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
>>> -                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>>> -                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> -                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 27027000,
>>> -               .conf = {
>>> -                       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
>>> -                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>>> -                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> -                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 74176000,
>>> -               .conf = {
>>> -                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
>>> -                       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
>>> -                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> -                       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 74250000,
>>> -               .conf = {
>>> -                       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
>>> -                       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
>>> -                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
>>> -                       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 148500000,
>>> -               .conf = {
>>> -                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
>>> -                       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
>>> -                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> -                       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
>>> -               },
>>> -       },
>>> -};
>>> -
>>> -static const struct hdmiphy_config hdmiphy_v14_configs[] = {
>>> -       {
>>> -               .pixel_clock = 25200000,
>>> -               .conf = {
>>> -                       0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
>>> -                       0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 27000000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
>>> -                       0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 27027000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
>>> -                       0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 36000000,
>>> -               .conf = {
>>> -                       0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
>>> -                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 40000000,
>>> -               .conf = {
>>> -                       0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
>>> -                       0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 65000000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
>>> -                       0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 74176000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
>>> -                       0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 74250000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
>>> -                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 83500000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
>>> -                       0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 106500000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
>>> -                       0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 108000000,
>>> -               .conf = {
>>> -                       0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
>>> -                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 146250000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
>>> -                       0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
>>> -               },
>>> -       },
>>> -       {
>>> -               .pixel_clock = 148500000,
>>> -               .conf = {
>>> -                       0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
>>> -                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> -                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> -                       0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
>>> -               },
>>> -       },
>>> -};
>>> -
>>>  struct hdmi_infoframe {
>>>         enum HDMI_PACKET_TYPE type;
>>>         u8 ver;
>>> @@ -774,46 +599,6 @@ static struct edid *hdmi_get_edid(void *ctx, struct drm_connector *connector)
>>>         return raw_edid;
>>>  }
>>>
>>> -static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
>>> -{
>>> -       const struct hdmiphy_config *confs;
>>> -       int count, i;
>>> -
>>> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> -
>>> -       if (hdata->type == HDMI_TYPE13) {
>>> -               confs = hdmiphy_v13_configs;
>>> -               count = ARRAY_SIZE(hdmiphy_v13_configs);
>>> -       } else if (hdata->type == HDMI_TYPE14) {
>>> -               confs = hdmiphy_v14_configs;
>>> -               count = ARRAY_SIZE(hdmiphy_v14_configs);
>>> -       } else
>>> -               return -EINVAL;
>>> -
>>> -       for (i = 0; i < count; i++)
>>> -               if (confs[i].pixel_clock == pixel_clock)
>>> -                       return i;
>>> -
>>> -       DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
>>> -       return -EINVAL;
>>> -}
>>> -
>>> -static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)
>>> -{
>>> -       struct hdmi_context *hdata = ctx;
>>> -       int ret;
>>> -
>>> -       DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
>>> -               __func__, mode->hdisplay, mode->vdisplay,
>>> -               mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
>>> -               false, mode->clock * 1000);
>>> -
>>> -       ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
>>> -       if (ret < 0)
>>> -               return ret;
>>> -       return 0;
>>> -}
>>> -
>>>  static void hdmi_set_acr(u32 freq, u8 *acr)
>>>  {
>>>         u32 n, cts;
>>> @@ -1309,20 +1094,12 @@ static void hdmi_timing_apply(struct hdmi_context *hdata)
>>>
>>>  static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>>>  {
>>> -       u8 buffer[2];
>>>         u32 reg;
>>>
>>>         clk_disable(hdata->res.sclk_hdmi);
>>>         clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
>>>         clk_enable(hdata->res.sclk_hdmi);
>>>
>>> -       /* operation mode */
>>> -       buffer[0] = 0x1f;
>>> -       buffer[1] = 0x00;
>>> -
>>> -       if (hdata->hdmiphy_port)
>>> -               i2c_master_send(hdata->hdmiphy_port, buffer, 2);
>>> -
>>>         if (hdata->type == HDMI_TYPE13)
>>>                 reg = HDMI_V13_PHY_RSTOUT;
>>>         else
>>> @@ -1335,102 +1112,6 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>>>         usleep_range(10000, 12000);
>>>  }
>>>
>>> -static void hdmiphy_poweron(struct hdmi_context *hdata)
>>> -{
>>> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> -
>>> -       if (hdata->type == HDMI_TYPE14)
>>> -               hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
>>> -                       HDMI_PHY_POWER_OFF_EN);
>>> -}
>>> -
>>> -static void hdmiphy_poweroff(struct hdmi_context *hdata)
>>> -{
>>> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> -
>>> -       if (hdata->type == HDMI_TYPE14)
>>> -               hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
>>> -                       HDMI_PHY_POWER_OFF_EN);
>>
>> I assume these register writes are replaced with i2c operations in the
>> new phy driver?
>
> It is done for exynos5 phy. I am not having the sequence for exynos4. I
> will add it later.
>
>>
>>> -}
>>> -
>>> -static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>>> -{
>>> -       const u8 *hdmiphy_data;
>>> -       u8 buffer[32];
>>> -       u8 operation[2];
>>> -       u8 read_buffer[32] = {0, };
>>> -       int ret;
>>> -       int i;
>>> -
>>> -       if (!hdata->hdmiphy_port) {
>>> -               DRM_ERROR("hdmiphy is not attached\n");
>>> -               return;
>>> -       }
>>> -
>>> -       /* pixel clock */
>>> -       i = hdmi_find_phy_conf(hdata, hdata->mode_conf.pixel_clock);
>>> -       if (i < 0) {
>>> -               DRM_ERROR("failed to find hdmiphy conf\n");
>>> -               return;
>>> -       }
>>> -
>>> -       if (hdata->type == HDMI_TYPE13) {
>>> -               hdmiphy_data = hdmiphy_v13_configs[i].conf;
>>> -       } else {
>>> -               hdmiphy_data = hdmiphy_v14_configs[i].conf;
>>> -       }
>>> -
>>> -       memcpy(buffer, hdmiphy_data, 32);
>>> -       ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
>>> -       if (ret != 32) {
>>> -               DRM_ERROR("failed to configure HDMIPHY via I2C\n");
>>> -               return;
>>> -       }
>>> -
>>> -       usleep_range(10000, 12000);
>>> -
>>> -       /* operation mode */
>>> -       operation[0] = 0x1f;
>>> -       operation[1] = 0x80;
>>> -
>>> -       ret = i2c_master_send(hdata->hdmiphy_port, operation, 2);
>>> -       if (ret != 2) {
>>> -               DRM_ERROR("failed to enable hdmiphy\n");
>>> -               return;
>>> -       }
>>> -
>>> -       ret = i2c_master_recv(hdata->hdmiphy_port, read_buffer, 32);
>>> -       if (ret < 0) {
>>> -               DRM_ERROR("failed to read hdmiphy config\n");
>>> -               return;
>>> -       }
>>> -
>>> -       for (i = 0; i < ret; i++)
>>> -               DRM_DEBUG_KMS("hdmiphy[0x%02x] write[0x%02x] - "
>>> -                       "recv [0x%02x]\n", i, buffer[i], read_buffer[i]);
>>> -}
>>> -
>>> -static void hdmi_conf_apply(struct hdmi_context *hdata)
>>> -{
>>> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> -
>>> -       hdmiphy_conf_reset(hdata);
>>> -       hdmiphy_conf_apply(hdata);
>>> -
>>> -       mutex_lock(&hdata->hdmi_mutex);
>>> -       hdmi_conf_reset(hdata);
>>> -       hdmi_conf_init(hdata);
>>> -       mutex_unlock(&hdata->hdmi_mutex);
>>> -
>>> -       hdmi_audio_init(hdata);
>>> -
>>> -       /* setting core registers */
>>> -       hdmi_timing_apply(hdata);
>>> -       hdmi_audio_control(hdata, true);
>>> -
>>> -       hdmi_regs_dump(hdata, "start");
>>> -}
>>> -
>>>  static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
>>>  {
>>>         int i;
>>> @@ -1448,7 +1129,6 @@ static void hdmi_v13_mode_set(struct hdmi_context *hdata,
>>>
>>>         hdata->mode_conf.cea_video_id =
>>>                 drm_match_cea_mode((struct drm_display_mode *)m);
>>> -       hdata->mode_conf.pixel_clock = m->clock * 1000;
>>
>> I don't think you use pixel_clock in mode_conf any longer, please
>> remove it from the struct.
>>
>
> Correct. I will remove pixel_clock from struct hdmi_conf_regs.
>
>>>
>>>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>>>         hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
>>> @@ -1544,7 +1224,6 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
>>>
>>>         hdata->mode_conf.cea_video_id =
>>>                 drm_match_cea_mode((struct drm_display_mode *)m);
>>> -       hdata->mode_conf.pixel_clock = m->clock * 1000;
>>>
>>>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>>>         hdmi_set_reg(core->v_line, 2, m->vtotal);
>>> @@ -1670,13 +1349,32 @@ static void hdmi_get_max_resol(void *ctx, unsigned int *width,
>>>         *height = MAX_HEIGHT;
>>>  }
>>>
>>> +static void hdmi_commit_prepare(void *ctx)
>>
>> I don't know why the "_commit" is there, just hdmi_prepare will be fine.
>>
> Ok.
>
>>> +{
>>> +       struct hdmi_context *hdata = ctx;
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       hdmiphy_conf_reset(hdata);
>>
>> There's still phy-specific kruft laying around the driver. There are
>> now a bunch of implicit dependencies between the hdmi driver and the
>> hdmiphy driver.
>>
>
> I need to follow this sequence:
>
> phy off (hdmiphy_prepare) -> phy reset using HDMI IP REG (hdmi_prepare) ->
> phy config (hdmiphy_config_apply) -> hdmi ip config  (hdmi_commit)
>
> Phy reset needs to be done by toggling Phy_reset bit in HDMI IP register which
> cannot be accessed in hdmiphy driver. I didn't see any better way.
>
>> Another example is the sclk_hdmiphy clock, which is still controlled
>> by the hdmi driver, it should be controlled by the phy.
>>
>
> sclk_hdmiphy is one of the source clock for hdmi IP. HDMI IP needs to change the
> source between sclk_hdmiphy (only if stable) else pixel clock. Above
> code looks ok
> to me. Please explain a bit mode on this.
>
>>> +}
>>> +
>>>  static void hdmi_commit(void *ctx)
>>>  {
>>>         struct hdmi_context *hdata = ctx;
>>>
>>>         DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>>
>>> -       hdmi_conf_apply(hdata);
>>> +       mutex_lock(&hdata->hdmi_mutex);
>>> +       hdmi_conf_reset(hdata);
>>> +       hdmi_conf_init(hdata);
>>> +       mutex_unlock(&hdata->hdmi_mutex);
>>> +
>>> +       hdmi_audio_init(hdata);
>>> +
>>> +       /* setting core registers */
>>> +       hdmi_timing_apply(hdata);
>>> +       hdmi_audio_control(hdata, true);
>>> +
>>> +       hdmi_regs_dump(hdata, "start");
>>>  }
>>>
>>>  static void hdmi_poweron(struct hdmi_context *hdata)
>>> @@ -1699,8 +1397,6 @@ static void hdmi_poweron(struct hdmi_context *hdata)
>>>         clk_enable(res->hdmiphy);
>>>         clk_enable(res->hdmi);
>>>         clk_enable(res->sclk_hdmi);
>>> -
>>> -       hdmiphy_poweron(hdata);
>>>  }
>>>
>>>  static void hdmi_poweroff(struct hdmi_context *hdata)
>>> @@ -1719,7 +1415,6 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
>>>          * its reset state seems to meet the condition.
>>>          */
>>>         hdmiphy_conf_reset(hdata);
>>> -       hdmiphy_poweroff(hdata);
>>>
>>>         clk_disable(res->sclk_hdmi);
>>>         clk_disable(res->hdmi);
>>> @@ -1761,11 +1456,11 @@ static struct exynos_hdmi_ops hdmi_ops = {
>>>         /* display */
>>>         .is_connected   = hdmi_is_connected,
>>>         .get_edid       = hdmi_get_edid,
>>> -       .check_timing   = hdmi_check_timing,
>>>
>>>         /* manager */
>>>         .mode_set       = hdmi_mode_set,
>>>         .get_max_resol  = hdmi_get_max_resol,
>>> +       .prepare                = hdmi_commit_prepare,
>>>         .commit         = hdmi_commit,
>>>         .dpms           = hdmi_dpms,
>>>  };
>>> @@ -1878,7 +1573,7 @@ fail:
>>>         return -ENODEV;
>>>  }
>>>
>>> -static struct i2c_client *hdmi_ddc, *hdmi_hdmiphy;
>>> +static struct i2c_client *hdmi_ddc;
>>>
>>>  void hdmi_attach_ddc_client(struct i2c_client *ddc)
>>>  {
>>> @@ -1886,12 +1581,6 @@ void hdmi_attach_ddc_client(struct i2c_client *ddc)
>>>                 hdmi_ddc = ddc;
>>>  }
>>>
>>> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
>>> -{
>>> -       if (hdmiphy)
>>> -               hdmi_hdmiphy = hdmiphy;
>>> -}
>>> -
>>>  #ifdef CONFIG_OF
>>>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>>>                                         (struct device *dev)
>>> @@ -2051,27 +1740,18 @@ static int hdmi_probe(struct platform_device *pdev)
>>>
>>>         hdata->ddc_port = hdmi_ddc;
>>>
>>> -       /* hdmiphy i2c driver */
>>> -       if (i2c_add_driver(&hdmiphy_driver)) {
>>> -               DRM_ERROR("failed to register hdmiphy i2c driver\n");
>>> -               ret = -ENOENT;
>>> -               goto err_ddc;
>>> -       }
>>> -
>>> -       hdata->hdmiphy_port = hdmi_hdmiphy;
>>> -
>>>         hdata->external_irq = gpio_to_irq(hdata->hpd_gpio);
>>>         if (hdata->external_irq < 0) {
>>>                 DRM_ERROR("failed to get GPIO external irq\n");
>>>                 ret = hdata->external_irq;
>>> -               goto err_hdmiphy;
>>> +               goto err_ddc;
>>>         }
>>>
>>>         hdata->internal_irq = platform_get_irq(pdev, 0);
>>>         if (hdata->internal_irq < 0) {
>>>                 DRM_ERROR("failed to get platform internal irq\n");
>>>                 ret = hdata->internal_irq;
>>> -               goto err_hdmiphy;
>>> +               goto err_ddc;
>>>         }
>>>
>>>         hdata->hpd = gpio_get_value(hdata->hpd_gpio);
>>> @@ -2082,7 +1762,7 @@ static int hdmi_probe(struct platform_device *pdev)
>>>                         "hdmi_external", drm_hdmi_ctx);
>>>         if (ret) {
>>>                 DRM_ERROR("failed to register hdmi external interrupt\n");
>>> -               goto err_hdmiphy;
>>> +               goto err_ddc;
>>>         }
>>>
>>>         ret = request_threaded_irq(hdata->internal_irq, NULL,
>>> @@ -2105,8 +1785,6 @@ static int hdmi_probe(struct platform_device *pdev)
>>>
>>>  err_free_irq:
>>>         free_irq(hdata->external_irq, drm_hdmi_ctx);
>>> -err_hdmiphy:
>>> -       i2c_del_driver(&hdmiphy_driver);
>>>  err_ddc:
>>>         i2c_del_driver(&ddc_driver);
>>>         return ret;
>>> @@ -2125,9 +1803,6 @@ static int hdmi_remove(struct platform_device *pdev)
>>>         free_irq(hdata->internal_irq, hdata);
>>>         free_irq(hdata->external_irq, hdata);
>>>
>>> -
>>> -       /* hdmiphy i2c driver */
>>> -       i2c_del_driver(&hdmiphy_driver);
>>>         /* DDC i2c driver */
>>>         i2c_del_driver(&ddc_driver);
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.h b/drivers/gpu/drm/exynos/exynos_hdmi.h
>>> index 0ddf395..6595d7b 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.h
>>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.h
>>> @@ -15,7 +15,6 @@
>>>  #define _EXYNOS_HDMI_H_
>>>
>>>  void hdmi_attach_ddc_client(struct i2c_client *ddc);
>>> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy);
>>>
>>>  extern struct i2c_driver hdmiphy_driver;
>>>  extern struct i2c_driver ddc_driver;
>>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>>> index ea49d13..0d47302 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>>> @@ -16,33 +16,437 @@
>>>  #include <linux/kernel.h>
>>>  #include <linux/i2c.h>
>>>  #include <linux/module.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/clk.h>
>>>
>>>  #include "exynos_drm_drv.h"
>>> +#include "exynos_drm_hdmi.h"
>>>  #include "exynos_hdmi.h"
>>>
>>> +#include "regs-hdmiphy.h"
>>>
>>> -static int hdmiphy_probe(struct i2c_client *client,
>>> -       const struct i2c_device_id *id)
>>> +#define HDMIPHY_REG_COUNT              (32)
>>
>> No need to include parentheses.
>
> Ok.
>>
>>> +
>>> +enum hdmiphy_type {
>>> +       HDMIPHY_EXYNOS4210,
>>> +       HDMIPHY_EXYNOS4212,
>>> +};
>>> +
>>> +struct hdmiphy_context {
>>> +       struct device           *dev;
>>> +       bool                    powered;
>>> +       void                    *parent_ctx;
>>> +       enum hdmiphy_type               type;
>>> +       const struct hdmiphy_config     *conf;
>>> +       struct clk              *hdmiphy;
>>> +};
>>> +
>>> +struct hdmiphy_config {
>>> +       int pixel_clock;
>>> +       u8 conf[HDMIPHY_REG_COUNT];
>>> +};
>>> +
>>> +/* list of all required phy config settings */
>>> +static const struct hdmiphy_config hdmiphy_4212_configs[] = {
>>> +       {
>>> +               .pixel_clock = 25200000,
>>> +               .conf = {
>>> +                       0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
>>> +                       0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 27000000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
>>> +                       0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 27027000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
>>> +                       0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 36000000,
>>> +               .conf = {
>>> +                       0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
>>> +                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 40000000,
>>> +               .conf = {
>>> +                       0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
>>> +                       0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 65000000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
>>> +                       0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 74176000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
>>> +                       0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 74250000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
>>> +                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 83500000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
>>> +                       0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 106500000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
>>> +                       0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 108000000,
>>> +               .conf = {
>>> +                       0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
>>> +                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 146250000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
>>> +                       0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 148500000,
>>> +               .conf = {
>>> +                       0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
>>> +                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
>>> +                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
>>> +                       0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
>>> +               },
>>> +       },
>>> +};
>>> +
>>> +static const struct hdmiphy_config hdmiphy_4210_configs[] = {
>>> +       {
>>> +               .pixel_clock = 27000000,
>>> +               .conf = {
>>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
>>> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 27027000,
>>> +               .conf = {
>>> +                       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
>>> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 74176000,
>>> +               .conf = {
>>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
>>> +                       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
>>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> +                       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 74250000,
>>> +               .conf = {
>>> +                       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
>>> +                       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
>>> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
>>> +                       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
>>> +               },
>>> +       },
>>> +       {
>>> +               .pixel_clock = 148500000,
>>> +               .conf = {
>>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
>>> +                       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
>>> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
>>> +                       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
>>> +               },
>>> +       },
>>> +};
>>> +
>>> +static const struct hdmiphy_config *hdmiphy_find_conf(void *ctx,
>>> +                       const struct drm_display_mode *mode)
>>> +{
>>> +       struct hdmiphy_context *hdata = ctx;
>>> +       const struct hdmiphy_config *confs;
>>> +       int count, i;
>>> +
>>> +       switch (hdata->type) {
>>> +       case HDMIPHY_EXYNOS4212:
>>> +               confs = hdmiphy_4212_configs;
>>> +               count = ARRAY_SIZE(hdmiphy_4212_configs);
>>> +               break;
>>> +       case HDMIPHY_EXYNOS4210:
>>> +               confs = hdmiphy_4210_configs;
>>> +               count = ARRAY_SIZE(hdmiphy_4210_configs);
>>> +               break;
>>> +       default:
>>> +               return NULL;
>>
>> Should probably DRM_ERROR here.
>>
> ok. I will add that.
>
>>> +       }
>>> +
>>> +       for (i = 0; i < count; i++)
>>> +               if (confs[i].pixel_clock == (mode->clock * 1000))
>>> +                       return &confs[i];
>>> +
>>> +       return NULL;
>>> +}
>>> +
>>> +static int hdmiphy_check_timing(void *ctx, struct drm_display_mode *mode)
>>>  {
>>> -       hdmi_attach_hdmiphy_client(client);
>>> +       const struct hdmiphy_config *conf;
>>> +       DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
>>> +               __func__, mode->hdisplay, mode->vdisplay,
>>> +               mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>> +               ? true : false, mode->clock * 1000);
>>
>> No need to print __func__ here, DRM_DEBUG_KMS will do that for you. I
>> think you should also parse the flags to a string instead of a bool
>> cast to an int.
>>
> ok.
>
>>>
>>> -       dev_info(&client->adapter->dev, "attached s5p_hdmiphy "
>>> -               "into i2c adapter successfully\n");
>>> +       conf = hdmiphy_find_conf(ctx, mode);
>>> +       if (!conf) {
>>> +               DRM_DEBUG_KMS("Display Mode is not supported.\n");
>>> +               return -EINVAL;
>>> +       }
>>>
>>>         return 0;
>>>  }
>>>
>>> -static int hdmiphy_remove(struct i2c_client *client)
>>> +static void hdmiphy_mode_set(void *ctx, struct drm_display_mode *mode)
>>> +{
>>> +       struct hdmiphy_context *hdata = ctx;
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>
>> No need to print __func__ here, DRM_DEBUG_KMS will do that for you.
>> This comment stand for the rest of the calls, as well.
>>
>>> +
>>> +       hdata->conf = hdmiphy_find_conf(ctx, mode);
>>> +}
>>> +
>>> +static void hdmiphy_config_prepare(void *ctx)
>>> +{
>>> +       struct hdmiphy_context *hdata = ctx;
>>> +       const struct i2c_client *client = to_i2c_client(hdata->dev);
>>> +       u8 buffer[2];
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       /* operation mode */
>>> +       buffer[0] = HDMIPHY_MODE_SET_DONE;
>>> +       buffer[1] = 0x00;
>>> +
>>> +       if (client)
>>> +               i2c_master_send(client, buffer, 2);
>>> +}
>>> +
>>> +static int hdmiphy_config_apply(void *ctx)
>>>  {
>>> -       dev_info(&client->adapter->dev, "detached s5p_hdmiphy "
>>> -               "from i2c adapter successfully\n");
>>> +       struct hdmiphy_context *hdata = ctx;
>>> +       struct i2c_client *client = to_i2c_client(hdata->dev);
>>> +       const u8 *hdmiphy_data;
>>> +       u8 buffer[HDMIPHY_REG_COUNT];
>>> +       u8 operation[2];
>>> +       u8 read_buffer[HDMIPHY_REG_COUNT] = {0, };
>>> +       int ret;
>>> +       int i;
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       /* pixel clock */
>>> +       if (hdata->conf && client)
>>> +               hdmiphy_data = hdata->conf->conf;
>>> +       else
>>> +               return -EINVAL;
>>> +
>>> +       memcpy(buffer, hdmiphy_data, HDMIPHY_REG_COUNT);
>>> +
>>> +       ret = i2c_master_send(client, buffer, HDMIPHY_REG_COUNT);
>>> +       if (ret != HDMIPHY_REG_COUNT) {
>>> +               DRM_ERROR("failed to configure HDMIPHY via I2C\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       usleep_range(10000, 12000);
>>> +
>>> +       /* operation mode */
>>> +       operation[0] = HDMIPHY_MODE_SET_DONE;
>>> +       operation[1] = HDMIPHY_MODE_EN;
>>> +
>>> +       ret = i2c_master_send(client, operation, 2);
>>> +       if (ret != 2) {
>>> +               DRM_ERROR("failed to enable hdmiphy\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       ret = i2c_master_recv(client, read_buffer, HDMIPHY_REG_COUNT);
>>> +       if (ret < 0) {
>>> +               DRM_ERROR("failed to read hdmiphy config\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       for (i = 0; i < ret; i++)
>>> +               DRM_DEBUG_KMS("hdmiphy[0x%02x] wr[0x%02x], rd[0x%02x]\n",
>>> +                               i, buffer[i], read_buffer[i]);
>>> +       return 0;
>>> +}
>>> +
>>> +static void hdmiphy_dpms(void *ctx, int mode)
>>> +{
>>> +       struct hdmiphy_context *hdata = ctx;
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s mode %d\n", __LINE__, __func__, mode);
>>> +
>>> +       switch (mode) {
>>> +       case DRM_MODE_DPMS_ON:
>>> +               if (pm_runtime_suspended(hdata->dev))
>>> +                       pm_runtime_get_sync(hdata->dev);
>>> +               break;
>>> +       case DRM_MODE_DPMS_STANDBY:
>>> +       case DRM_MODE_DPMS_SUSPEND:
>>> +       case DRM_MODE_DPMS_OFF:
>>> +               if (!pm_runtime_suspended(hdata->dev))
>>> +                       pm_runtime_put_sync(hdata->dev);
>>> +               break;
>>> +       default:
>>> +               DRM_DEBUG_KMS("unknown dpms mode: %d\n", mode);
>>> +               break;
>>> +       }
>>> +}
>>> +
>>> +static int hdmiphy_update_bits(struct i2c_client *client, u8 *reg_cache,
>>> +                              u8 reg, u8 mask, u8 val)
>>> +{
>>> +       int ret;
>>> +       u8 buffer[2];
>>> +
>>> +       buffer[0] = reg;
>>> +       buffer[1] = (reg_cache[reg] & ~mask) | (val & mask);
>>> +       reg_cache[reg] = buffer[1];
>>> +
>>> +       ret = i2c_master_send(client, buffer, 2);
>>> +       if (ret != 2)
>>> +               return -EIO;
>>>
>>>         return 0;
>>>  }
>>>
>>> +static int hdmiphy_4412_turn_on(struct i2c_client *client, bool on)
>>
>> This name is misleading. Please change it to something that doesn't
>> convey a power state, such as hdmiphy_4412_power
>>
> ok. I will change that.
>
>>> +{
>>> +       u8 reg_cache[HDMIPHY_REG_COUNT] = { 0 };
>>> +       u8 buffer[2];
>>> +       int ret;
>>> +
>>> +       DRM_DEBUG_KMS("%s: hdmiphy is %s\n", __func__, on ? "on" : "off");
>>> +
>>> +       /* Cache all hdmi-phy registers to make the code below faster */
>>> +       buffer[0] = 0x0;
>>> +       ret = i2c_master_send(client, buffer, 1);
>>> +       if (ret != 1) {
>>> +               ret = -EIO;
>>> +               goto exit;
>>> +       }
>>> +       ret = i2c_master_recv(client, reg_cache, HDMIPHY_REG_COUNT);
>>> +       if (ret != HDMIPHY_REG_COUNT) {
>>> +               ret = -EIO;
>>> +               goto exit;
>>> +       }
>>> +
>>> +       /* Change to/from configuration from/to operation mode */
>>> +       ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_MODE_SET_DONE,
>>> +                               HDMIPHY_MODE_EN, on ? ~0 : 0);
>>> +       if (ret)
>>> +               goto exit;
>>> +
>>> +       /*
>>> +        * Turn off "oscpad" if !on; it turns on again in
>>> +        * during phy-configuration.
>>> +        */
>>> +       if (!on)
>>> +               ret = hdmiphy_update_bits(client, reg_cache,
>>> +                       HDMIPHY_4212_OSC_PAD_CON, HDMIPHY_OSC_PAD_EN, 0);
>>> +               if (ret)
>>> +                       goto exit;
>>> +
>>> +       /* Disable powerdown if on; enable if !on */
>>
>> This comment really isn't useful, it's just describing the code.
>
> I will remove this comment.
>
>>
>>> +       ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_PD_CON,
>>> +                       HDMIPHY_PDEN, on ? 0 : ~0);
>>> +       if (ret)
>>> +               goto exit;
>>> +       ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_PD_CON,
>>> +                       HDMIPHY_PD_ALL, on ? 0 : ~0);
>>> +       if (ret)
>>> +               goto exit;
>>> +
>>> +       /* Disable pixel clock generator block if !on */
>>> +       if (!on)
>>> +               ret = hdmiphy_update_bits(client, reg_cache,
>>> +                       HDMIPHY_4212_PCG_CON, HDMIPHY_PCG_RESET_EN, 0);
>>> +               if (ret)
>>> +                       goto exit;
>>> +
>>> +exit:
>>> +       /* Don't expect any errors so just do a single warn */
>>> +       WARN_ON(ret);
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +static struct exynos_hdmiphy_ops hdmiphy_ops = {
>>> +       .check_timing   = hdmiphy_check_timing,
>>> +       .mode_set               = hdmiphy_mode_set,
>>> +       .prepare                = hdmiphy_config_prepare,
>>> +       .config_apply   = hdmiphy_config_apply,
>>> +       .dpms           = hdmiphy_dpms,
>>> +};
>>> +
>>>  static const struct i2c_device_id hdmiphy_id[] = {
>>> -       { "s5p_hdmiphy", 0 },
>>> -       { "exynos5-hdmiphy", 0 },
>>> +       { "s5p_hdmiphy", HDMIPHY_EXYNOS4210 },
>>> +       { "exynos5-hdmiphy", HDMIPHY_EXYNOS4212 },
>>>         { },
>>>  };
>>>
>>> @@ -50,21 +454,183 @@ static const struct i2c_device_id hdmiphy_id[] = {
>>>  static struct of_device_id hdmiphy_match_types[] = {
>>>         {
>>>                 .compatible = "samsung,exynos5-hdmiphy",
>>> +               .data   = (void *)HDMIPHY_EXYNOS4212,
>>>         }, {
>>>                 /* end node */
>>>         }
>>>  };
>>>  #endif
>>>
>>> +static int hdmiphy_probe(struct i2c_client *client,
>>> +       const struct i2c_device_id *id)
>>> +{
>>> +       struct device *dev = &client->dev;
>>> +       struct hdmiphy_context *hdata;
>>> +       struct exynos_drm_hdmi_context *drm_hdmi_ctx;
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       drm_hdmi_ctx = devm_kzalloc(dev, sizeof(*drm_hdmi_ctx),
>>> +                                       GFP_KERNEL);
>>> +       if (!drm_hdmi_ctx) {
>>> +               DRM_ERROR("failed to allocate common hdmi context.\n");
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       hdata = devm_kzalloc(dev, sizeof(*hdata), GFP_KERNEL);
>>> +       if (!hdata) {
>>> +               DRM_ERROR("failed to allocate hdmiphy context.\n");
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       if (dev->of_node) {
>>> +               const struct of_device_id *match;
>>> +               match = of_match_node(of_match_ptr(hdmiphy_match_types),
>>> +                                       dev->of_node);
>>> +               if (match == NULL)
>>> +                       return -ENODEV;
>>> +               hdata->type = (enum hdmiphy_type)match->data;
>>> +       } else {
>>> +               hdata->type = (enum hdmiphy_type)id->driver_data;
>>> +       }
>>> +
>>> +       drm_hdmi_ctx->ctx = (void *)hdata;
>>> +       hdata->parent_ctx = (void *)drm_hdmi_ctx;
>>> +       hdata->dev = dev;
>>> +
>>> +       hdata->hdmiphy = devm_clk_get(dev, "hdmiphy");
>>
>> I don't see this call removed in the hdmi driver, am I missing something?
>>
>
> I took it wrong. I thought hdmi IP is clocked by hdmiphy clock. Actually it is
> sclk_hdmiphy clock. I will remove this from hdmi driver.
>
>>> +       if (IS_ERR_OR_NULL(hdata->hdmiphy)) {
>>> +               DRM_ERROR("failed to get clock 'hdmiphy'\n");
>>> +               return PTR_ERR(hdata->hdmiphy);
>>> +       }
>>> +
>>> +       i2c_set_clientdata(client, hdata);
>>> +
>>> +       /* Attach HDMI-PHY Driver to common hdmi. */
>>> +       exynos_hdmiphy_drv_attach(drm_hdmi_ctx);
>>> +
>>> +       /* register specific callbacks to common hdmi. */
>>> +       exynos_hdmiphy_ops_register(&hdmiphy_ops);
>>> +
>>> +       pm_runtime_enable(dev);
>>> +
>>> +       dev_info(&client->adapter->dev,
>>> +               "attached s5p_hdmiphy into i2c adapter successfully\n");
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int hdmiphy_remove(struct i2c_client *client)
>>> +{
>>> +       dev_info(&client->adapter->dev,
>>> +               "detached s5p_hdmiphy from i2c adapter successfully\n");
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void hdmiphy_poweroff(struct device *dev)
>>> +{
>>> +       struct i2c_client *client = to_i2c_client(dev);
>>> +       struct hdmiphy_context *hdata = i2c_get_clientdata(client);
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       if (hdata->type == HDMIPHY_EXYNOS4212)
>>> +               hdmiphy_4412_turn_on(client, 0);
>>> +
>>> +       clk_disable(hdata->hdmiphy);
>>> +}
>>> +
>>> +static void hdmiphy_poweron(struct device *dev)
>>> +{
>>> +       struct i2c_client *client = to_i2c_client(dev);
>>> +       struct hdmiphy_context *hdata = i2c_get_clientdata(client);
>>> +
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       clk_enable(hdata->hdmiphy);
>>> +
>>> +       if (hdata->type == HDMIPHY_EXYNOS4212)
>>> +               hdmiphy_4412_turn_on(client, 1);
>>> +}
>>> +
>>> +#ifdef CONFIG_PM_SLEEP
>>> +static int hdmiphy_suspend(struct device *dev)
>>> +{
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       if (pm_runtime_suspended(dev)) {
>>> +               DRM_DEBUG_KMS("%s: already runtime-suspended.\n",
>>> +               __func__);
>>> +               return 0;
>>> +       }
>>> +
>>> +       hdmiphy_poweroff(dev);
>>> +       return 0;
>>> +}
>>> +
>>> +static int hdmiphy_resume(struct device *dev)
>>> +{
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       if (pm_runtime_suspended(dev)) {
>>> +               /* dpms callback should resume the mixer. */
>>> +               DRM_DEBUG_KMS("%s: already runtime-suspended.\n",
>>> +               __func__);
>>> +               return 0;
>>> +       }
>>> +
>>> +       hdmiphy_poweron(dev);
>>> +       return 0;
>>> +}
>>> +#endif
>>> +
>>> +
>>> +#ifdef CONFIG_PM_RUNTIME
>>> +static int hdmiphy_runtime_suspend(struct device *dev)
>>> +{
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       hdmiphy_poweroff(dev);
>>> +       return 0;
>>> +}
>>> +
>>> +static int hdmiphy_runtime_resume(struct device *dev)
>>> +{
>>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>> +
>>> +       hdmiphy_poweron(dev);
>>> +       return 0;
>>> +}
>>> +#endif
>>> +
>>> +static const struct dev_pm_ops hdmiphy_pm_ops = {
>>> +       SET_SYSTEM_SLEEP_PM_OPS(hdmiphy_suspend, hdmiphy_resume)
>>> +       SET_RUNTIME_PM_OPS(hdmiphy_runtime_suspend,
>>> +               hdmiphy_runtime_resume, NULL)
>>> +};
>>> +
>>>  struct i2c_driver hdmiphy_driver = {
>>>         .driver = {
>>>                 .name   = "exynos-hdmiphy",
>>>                 .owner  = THIS_MODULE,
>>>                 .of_match_table = of_match_ptr(hdmiphy_match_types),
>>> +               .pm     = &hdmiphy_pm_ops,
>>>         },
>>>         .id_table = hdmiphy_id,
>>>         .probe          = hdmiphy_probe,
>>>         .remove         = hdmiphy_remove,
>>>         .command                = NULL,
>>>  };
>>> +
>>> +extern int exynos_hdmiphy_driver_register(void)
>>> +{
>>> +       return i2c_add_driver(&hdmiphy_driver);
>>> +}
>>> +
>>> +extern void exynos_hdmiphy_driver_unregister(void)
>>> +{
>>> +       i2c_del_driver(&hdmiphy_driver);
>>> +}
>>> +
>>>  EXPORT_SYMBOL(hdmiphy_driver);
>>> diff --git a/drivers/gpu/drm/exynos/regs-hdmiphy.h b/drivers/gpu/drm/exynos/regs-hdmiphy.h
>>> new file mode 100644
>>> index 0000000..8f906c6
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/exynos/regs-hdmiphy.h
>>> @@ -0,0 +1,61 @@
>>> +/*
>>> + *
>>> + *  regs-hdmiphy.h
>>> + *
>>> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
>>> + * http://www.samsung.com/
>>> + *
>>> + * HDMI-PHY register header file for Samsung TVOUT driver
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +#ifndef SAMSUNG_REGS_HDMIPHY_H
>>> +#define SAMSUNG_REGS_HDMIPHY_H
>>> +
>>> +/*
>>> + * Register part
>>> +*/
>>> +
>>> +/* HDMI PHY Version Common */
>>> +#define HDMIPHY_MODE_SET_DONE          (0x1f)
>>> +
>>> +/* HDMI PHY Version 4212 */
>>> +#define HDMIPHY_4212_PCG_CON           (0x04)
>>> +#define HDMIPHY_4212_OSC_PAD_CON       (0x0b)
>>> +#define HDMIPHY_4212_PD_CON            (0x1d)
>>> +
>>> +/*
>>> + * Bit definition part
>>> + */
>>> +
>>> +/* HDMIPHY_MODE_SET_DONE */
>>> +#define HDMIPHY_MODE_EN                        (1 << 7)
>>> +
>>> +/* HDMIPHY_4212_PCG_CON */
>>> +#define HDMIPHY_PCG_RESET_EN           (1 << 3)
>>> +
>>> +/* HDMIPHY_4212_OSC_PAD_CON */
>>> +#define HDMIPHY_OSC_PAD_EN             (3 << 6)
>>> +
>>> +/* HDMIPHY_4212_PD_CON */
>>> +#define HDMIPHY_PDEN                   (1 << 7)
>>> +
>>> +#define HDMIPHY_PLL_PD                 (1 << 6)
>>> +#define HDMIPHY_CLKSER_PD              (1 << 5)
>>> +#define HDMIPHY_CLKDRV_PD              (1 << 4)
>>> +
>>> +#define HDMIPHY_DRV_PD                 (1 << 2)
>>> +#define HDMIPHY_SER_PD                 (1 << 1)
>>> +#define HDMIPHY_ICLK_PD                        (1 << 0)
>>> +
>>> +#define HDMIPHY_PD_ALL                 (HDMIPHY_PLL_PD |\
>>> +                                       HDMIPHY_CLKSER_PD |\
>>> +                                       HDMIPHY_CLKDRV_PD|\
>>> +                                       HDMIPHY_DRV_PD|\
>>> +                                       HDMIPHY_SER_PD|\
>>> +                                       HDMIPHY_ICLK_PD)
>>> +
>>> +#endif /* SAMSUNG_REGS_HDMIPHY_H */
>>> --
>>> 1.8.0
>>>
>
> --
> Regards,
> Rahul Sharma,
> email to: rahul.sharma@samsung.com
> Samsung India.



-- 
Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung India.

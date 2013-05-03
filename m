From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 2/4] drm/exynos: hdmi: register hdmiphy driver from common
 drm hdmi
Date: Fri, 3 May 2013 13:55:57 +0530
Message-ID: <CAPdUM4MFe4CVT-kHPjpojmn_voumqAQN2aCOBgO5ZbHvraz9UQ@mail.gmail.com>
References: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
	<1367247053-17105-3-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbL5yaHo9E9v8aTM8XK9du0NQ9gFd1fwbCySDdCE=CoGjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:51130 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960Ab3ECIZ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 May 2013 04:25:58 -0400
Received: by mail-we0-f172.google.com with SMTP id s10so1099953wey.31
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 May 2013 01:25:57 -0700 (PDT)
In-Reply-To: <CAOw6vbL5yaHo9E9v8aTM8XK9du0NQ9gFd1fwbCySDdCE=CoGjw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, InKi Dae <inki.dae@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

Hi Sean,

On Mon, Apr 29, 2013 at 10:28 PM, Sean Paul <seanpaul@chromium.org> wrote:
> On Mon, Apr 29, 2013 at 10:50 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> hdmiphy hardware block is a physically separate device. Hdmiphy driver
>> is glued inside hdmi driver and acessed through hdmi callbacks. With
>> increasing diversities in the hdmiphy mapping and configurations, hdmi
>> driver is expanding with un-related changes.
>>
>> This patch registers hdmiphy as a independent driver, having own set
>> of requried callbacks which are called by common drm hdmi, parallel to
>> hdmi and mixer driver.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |   61 +++++++++++++++++++++++++++---
>>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |   17 +++++++++
>>  drivers/gpu/drm/exynos/exynos_hdmi.c     |   26 ++-----------
>>  drivers/gpu/drm/exynos/exynos_hdmi.h     |    1 -
>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  |   13 ++++++-
>>  5 files changed, 87 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>> index 7ab5f9f..25fe012 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
>> @@ -32,12 +32,14 @@
>>  /* platform device pointer for common drm hdmi device. */
>>  static struct platform_device *exynos_drm_hdmi_pdev;
>>
>> -/* Common hdmi subdrv needs to access the hdmi and mixer though context.
>> -* These should be initialied by the repective drivers */
>> +/* Common hdmi subdrv needs to access the hdmi, hdmiphy and mixer though
>> +*  context. These should be initialied by the repective drivers */
>
> Doesn't conform with Documentation/CodingStyle &
> s/initialied/initialized/ & s/repective/respective/
>

Will correct this.

>> +static struct exynos_drm_hdmi_context *hdmiphy_ctx;
>>  static struct exynos_drm_hdmi_context *hdmi_ctx;
>>  static struct exynos_drm_hdmi_context *mixer_ctx;
>>
>>  /* these callback points shoud be set by specific drivers. */
>> +static struct exynos_hdmiphy_ops *hdmiphy_ops;
>>  static struct exynos_hdmi_ops *hdmi_ops;
>>  static struct exynos_mixer_ops *mixer_ops;
>>
>> @@ -45,6 +47,7 @@ struct platform_driver exynos_drm_common_hdmi_driver;
>>
>>  struct drm_hdmi_context {
>>         struct exynos_drm_subdrv        subdrv;
>> +       struct exynos_drm_hdmi_context  *hdmiphy_ctx;
>>         struct exynos_drm_hdmi_context  *hdmi_ctx;
>>         struct exynos_drm_hdmi_context  *mixer_ctx;
>>
>> @@ -59,6 +62,10 @@ int exynos_common_hdmi_register(void)
>>         if (exynos_drm_hdmi_pdev)
>>                 return -EEXIST;
>>
>> +       ret = exynos_hdmiphy_driver_register();
>> +       if (ret < 0)
>> +               goto out_hdmiphy;
>
> This isn't consistent with your last patch. In that patch, you exposed
> the driver directly through exynos_drm_hdmi.h and registered the
> driver directly. Here, you expose a helper function to do it for you.
> These should at least work the same way.
>

It was same in the last patch. I exposed helper function to abstract the
type of hdmiphy driver. In upcoming SoCs it is a platform bus device
instead of I2C dev. That is also the main reason for this phy driver
movement. Continuing with phy driver glued inside hdmi driver is
complicating the it with checks for hdmi ip and phy pairing, checks
for phy mapping with i2c or amba bus and phy configs for different
socs.

After this movement, hdmi ip and phy pairing can be taken cared by
independent compatible types, phy mapping and phy configs are
handled inside phy driver.

>> +
>>         ret = platform_driver_register(&hdmi_driver);
>>         if (ret < 0)
>>                 goto out_hdmi;
>> @@ -88,6 +95,8 @@ out_common_hdmi:
>>  out_mixer:
>>         platform_driver_unregister(&hdmi_driver);
>>  out_hdmi:
>> +       exynos_hdmiphy_driver_unregister();
>> +out_hdmiphy:
>>         return ret;
>>  }
>>
>> @@ -99,9 +108,16 @@ void exynos_common_hdmi_unregister(void)
>>         platform_driver_unregister(&exynos_drm_common_hdmi_driver);
>>         platform_driver_unregister(&mixer_driver);
>>         platform_driver_unregister(&hdmi_driver);
>> +       exynos_hdmiphy_driver_unregister();
>>         exynos_drm_hdmi_pdev = NULL;
>>  }
>>
>> +void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx)
>> +{
>> +       if (ctx)
>> +               hdmiphy_ctx = ctx;
>> +}
>> +
>
> I think I've said this before, but in case I haven't, here it goes. If
> you didn't platform_driverize all of this stuff, and instead
> encapsulated the various functionality in callbacks central to one drm
> driver, you wouldn't need to do this kind of thing.
>

Yes, you mentioned it earlier as well but I am not sure how to proceed for
this. Please suggest me someway, or if you are fine, I can take this clean
up in next step.

>>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)
>>  {
>>         if (ctx)
>> @@ -114,6 +130,14 @@ void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx)
>>                 mixer_ctx = ctx;
>>  }
>>
>> +void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops)
>> +{
>> +       DRM_DEBUG_KMS("%s\n", __FILE__);
>> +
>> +       if (ops)
>> +               hdmiphy_ops = ops;
>> +}
>> +
>>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops)
>>  {
>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>> @@ -164,8 +188,8 @@ static int drm_hdmi_check_mode(struct device *dev,
>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>>
>>         /*
>> -       * Both, mixer and hdmi should be able to handle the requested mode.
>> -       * If any of the two fails, return mode as BAD.
>> +       * Mixer, hdmi and hdmiphy should be able to handle the requested mode.
>> +       * If any of the them fails, return mode as BAD.
>>         */
>>
>>         if (mixer_ops && mixer_ops->check_mode)
>> @@ -175,7 +199,13 @@ static int drm_hdmi_check_mode(struct device *dev,
>>                 return ret;
>>
>>         if (hdmi_ops && hdmi_ops->check_mode)
>> -               return hdmi_ops->check_mode(ctx->hdmi_ctx->ctx, mode);
>> +               ret = hdmi_ops->check_mode(ctx->hdmi_ctx->ctx, mode);
>> +
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (hdmiphy_ops && hdmiphy_ops->check_mode)
>> +               return hdmiphy_ops->check_mode(ctx->hdmiphy_ctx->ctx, mode);
>>
>>         return 0;
>>  }
>> @@ -289,6 +319,9 @@ static void drm_hdmi_mode_set(struct device *subdrv_dev, void *mode)
>>
>>         if (hdmi_ops && hdmi_ops->mode_set)
>>                 hdmi_ops->mode_set(ctx->hdmi_ctx->ctx, mode);
>> +
>> +       if (hdmiphy_ops && hdmiphy_ops->mode_set)
>> +               hdmiphy_ops->mode_set(ctx->hdmiphy_ctx->ctx, mode);
>>  }
>>
>>  static void drm_hdmi_get_max_resol(struct device *subdrv_dev,
>> @@ -308,6 +341,15 @@ static void drm_hdmi_commit(struct device *subdrv_dev)
>>
>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>>
>> +       if (hdmiphy_ops && hdmiphy_ops->prepare)
>> +               hdmiphy_ops->prepare(ctx->hdmiphy_ctx->ctx);
>> +
>> +       if (hdmi_ops && hdmi_ops->prepare)
>> +               hdmi_ops->prepare(ctx->hdmi_ctx->ctx);
>> +
>
> This is a hack. You have a stubbed out exynos_drm_encoder_prepare
> function in exynos_drm_connector.c that exists entirely for this
> purpose.
>

Existing HDMI driver follows this sequence while setting resolution.
--> HDMI-phy OFF using i2c calls
--> HDMI-phy reset using HDMI IP reg
--> HDMI PHy Conf
--> HDMI IP Conf and wait for PHY Stable.

Here is the call sequence for exynos_drm_encoder.c

[    0.860000] [DRM-E]  exynos_drm_encoder_create 332
[    0.870000] [DRM-E]  exynos_drm_encoder_setup 318
[    1.390000] [DRM-E]  exynos_drm_encoder_mode_fixup 107
[    1.390000] [DRM-E]  exynos_drm_encoder_prepare 192 <-----------------------
[    1.390000] [DRM-E]  exynos_drm_encoder_plane_mode_set 468
[    1.390000] [DRM-E]  exynos_drm_encoder_crtc_pipe 452
[    1.390000] [DRM-E]  exynos_drm_encoder_mode_set 158
[    1.390000] [DRM-E]  exynos_drm_encoder_crtc_dpms 430
[    1.390000] [DRM-E]  exynos_drm_encoder_plane_commit 481
[    1.390000] [DRM-E]  exynos_drm_encoder_plane_enable 497
[    1.390000] [DRM-E]  exynos_drm_encoder_commit 203  <-----------------------

Between the encoder_prepare and encoder_commit, the dpms call
comes which actually power on the mixer, hdmi. I cannot call prepare
callback from encoder_prepare because by that time IPs are powered
off.

Secondly, IMO exynos-drm-hdmi is introduced to meet with these kind
of hw requirements inside HDMI Subsystem. Please share your views.

>> +       if (hdmiphy_ops && hdmiphy_ops->config_apply)
>> +               hdmiphy_ops->config_apply(ctx->hdmiphy_ctx->ctx);
>
> Why name it config_apply instead of commit?
>

I continued with the same name as it was in hdmi driver for phy
configuration. I will change to commit.

>> +
>>         if (hdmi_ops && hdmi_ops->commit)
>>                 hdmi_ops->commit(ctx->hdmi_ctx->ctx);
>>  }
>> @@ -323,6 +365,9 @@ static void drm_hdmi_dpms(struct device *subdrv_dev, int mode)
>>
>>         if (hdmi_ops && hdmi_ops->dpms)
>>                 hdmi_ops->dpms(ctx->hdmi_ctx->ctx, mode);
>> +
>> +       if (hdmiphy_ops && hdmiphy_ops->dpms)
>> +               hdmiphy_ops->dpms(ctx->hdmiphy_ctx->ctx, mode);
>
>
> Shouldn't the order of this be dependent on dpms mode?
>
> ie for DPMS_ON do hdmi->dpms then phy->dpms and for DPMS_OFF do
> phy->dpms then hdmi->dpms
>

I havn't come across any problem due to not reversing the sequence for
DPMS_OFF. Why do you think it is required? I remember problem in FIMD
and LCD power cycle sequence but to my knowledge there is no such
issue for hdmi subsystem.

>>  }
>>
>>  static void drm_hdmi_apply(struct device *subdrv_dev)
>> @@ -428,6 +473,11 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev,
>>                 return -EFAULT;
>>         }
>>
>> +       if (!hdmiphy_ctx) {
>> +               DRM_ERROR("hdmiphy context not initialized.\n");
>> +               return -EFAULT;
>
> EFAULT is the wrong error to return here. ENODEV would be more appropriate, IMO.
>
ENODEV seems ok.

>> +       }
>> +
>>         if (!mixer_ctx) {
>>                 DRM_ERROR("mixer context not initialized.\n");
>>                 return -EFAULT;
>> @@ -441,6 +491,7 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev,
>>         }
>>
>>         ctx->hdmi_ctx = hdmi_ctx;
>> +       ctx->hdmiphy_ctx = hdmiphy_ctx;
>>         ctx->mixer_ctx = mixer_ctx;
>>
>>         ctx->hdmi_ctx->drm_dev = drm_dev;
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>> index 8861b90..8c8974f 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
>> @@ -39,10 +39,19 @@ struct exynos_hdmi_ops {
>>         void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>>         void (*get_max_resol)(void *ctx, unsigned int *width,
>>                                 unsigned int *height);
>> +       void (*prepare)(void *ctx);
>>         void (*commit)(void *ctx);
>>         void (*dpms)(void *ctx, int mode);
>>  };
>>
>> +struct exynos_hdmiphy_ops {
>> +       int (*check_mode)(void *ctx, struct drm_display_mode *mode);
>> +       void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>> +       void (*prepare)(void *ctx);
>> +       int (*config_apply)(void *ctx);
>> +       void (*dpms)(void *ctx, int mode);
>> +};
>> +
>>  struct exynos_mixer_ops {
>>         /* manager */
>>         int (*iommu_on)(void *ctx, bool enable);
>> @@ -63,8 +72,16 @@ struct exynos_mixer_ops {
>>  extern struct platform_driver hdmi_driver;
>>  extern struct platform_driver mixer_driver;
>>
>> +/*
>> + * these functions registers/unregisters exynos drm hdmiphy driver.
>> + */
>
> I think this comment is kind of obvious and unneeded, but if you think
> it's useful, it should only take up one line.
>

I will remove this.

>
>> +extern int exynos_hdmiphy_driver_register(void);
>> +extern void exynos_hdmiphy_driver_unregister(void);
>> +
>> +void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
>>  void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
>> +void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops);
>>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
>>  void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);
>>  #endif
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 6bcd7fc..520c4af 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -1856,7 +1856,7 @@ fail:
>>         return -ENODEV;
>>  }
>>
>> -static struct i2c_client *hdmi_ddc, *hdmi_hdmiphy;
>> +static struct i2c_client *hdmi_ddc;
>>
>>  void hdmi_attach_ddc_client(struct i2c_client *ddc)
>>  {
>> @@ -1864,12 +1864,6 @@ void hdmi_attach_ddc_client(struct i2c_client *ddc)
>>                 hdmi_ddc = ddc;
>>  }
>>
>> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
>> -{
>> -       if (hdmiphy)
>> -               hdmi_hdmiphy = hdmiphy;
>> -}
>> -
>>  #ifdef CONFIG_OF
>>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>>                                         (struct device *dev)
>> @@ -2027,20 +2021,11 @@ static int hdmi_probe(struct platform_device *pdev)
>>
>>         hdata->ddc_port = hdmi_ddc;
>>
>> -       /* hdmiphy i2c driver */
>> -       if (i2c_add_driver(&hdmiphy_driver)) {
>> -               DRM_ERROR("failed to register hdmiphy i2c driver\n");
>> -               ret = -ENOENT;
>> -               goto err_ddc;
>> -       }
>> -
>> -       hdata->hdmiphy_port = hdmi_hdmiphy;
>> -
>>         hdata->irq = gpio_to_irq(hdata->hpd_gpio);
>>         if (hdata->irq < 0) {
>>                 DRM_ERROR("failed to get GPIO irq\n");
>>                 ret = hdata->irq;
>> -               goto err_hdmiphy;
>> +               goto err_ddc;
>>         }
>>
>>         hdata->hpd = gpio_get_value(hdata->hpd_gpio);
>> @@ -2051,7 +2036,7 @@ static int hdmi_probe(struct platform_device *pdev)
>>                         "hdmi", drm_hdmi_ctx);
>>         if (ret) {
>>                 DRM_ERROR("failed to register hdmi interrupt\n");
>> -               goto err_hdmiphy;
>> +               goto err_ddc;
>>         }
>>
>>         /* Attach HDMI Driver to common hdmi. */
>> @@ -2064,8 +2049,6 @@ static int hdmi_probe(struct platform_device *pdev)
>>
>>         return 0;
>>
>> -err_hdmiphy:
>> -       i2c_del_driver(&hdmiphy_driver);
>>  err_ddc:
>>         i2c_del_driver(&ddc_driver);
>>         return ret;
>> @@ -2083,9 +2066,6 @@ static int hdmi_remove(struct platform_device *pdev)
>>
>>         free_irq(hdata->irq, hdata);
>>
>> -
>> -       /* hdmiphy i2c driver */
>> -       i2c_del_driver(&hdmiphy_driver);
>>         /* DDC i2c driver */
>>         i2c_del_driver(&ddc_driver);
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.h b/drivers/gpu/drm/exynos/exynos_hdmi.h
>> index 0ddf395..6595d7b 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.h
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.h
>> @@ -15,7 +15,6 @@
>>  #define _EXYNOS_HDMI_H_
>>
>>  void hdmi_attach_ddc_client(struct i2c_client *ddc);
>> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy);
>>
>>  extern struct i2c_driver hdmiphy_driver;
>
> This can be removed if you're using the register/unregister helpers.
>
Yeah, correct. I will remove this.

>>  extern struct i2c_driver ddc_driver;
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>> index ea49d13..eee2510 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>> @@ -24,8 +24,6 @@
>>  static int hdmiphy_probe(struct i2c_client *client,
>>         const struct i2c_device_id *id)
>>  {
>> -       hdmi_attach_hdmiphy_client(client);
>> -
>>         dev_info(&client->adapter->dev, "attached s5p_hdmiphy "
>>                 "into i2c adapter successfully\n");
>>
>> @@ -67,4 +65,15 @@ struct i2c_driver hdmiphy_driver = {
>>         .remove         = hdmiphy_remove,
>>         .command                = NULL,
>>  };
>> +
>> +extern int exynos_hdmiphy_driver_register(void)
>> +{
>> +       return i2c_add_driver(&hdmiphy_driver);
>> +}
>> +
>> +extern void exynos_hdmiphy_driver_unregister(void)
>> +{
>> +       i2c_del_driver(&hdmiphy_driver);
>> +}
>> +
>>  EXPORT_SYMBOL(hdmiphy_driver);
>
> You don't need to export it if you're using these helpers.
>
Agree.

>> --
>> 1.7.10.4
>>

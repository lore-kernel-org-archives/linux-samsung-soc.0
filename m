From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC v2] drm/exynos: hdmi: move hdmiphy related code to hdmiphy
	driver
Date: Mon, 29 Apr 2013 13:52:30 +0900
Message-ID: <CAAQKjZN-jks7YB7fLn-LKRCibcJGLgVEd9Aq1QHqeRONUj3D1w@mail.gmail.com>
References: <1366982766-603-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1128993691=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1366982766-603-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sean Paul <seanpaul@google.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1128993691==
Content-Type: multipart/alternative; boundary=089e012292fafe534904db78a619

--089e012292fafe534904db78a619
Content-Type: text/plain; charset=ISO-8859-1

Hi Rahul,


2013/4/26 Rahul Sharma <rahul.sharma@samsung.com>

> Right now hdmiphy operations and configs are kept inside hdmi driver.
> hdmiphy
> related code is tightly coupled with hdmi ip driver. Physicaly they are
> different devices and should be instantiated independently.
>
> In terms of versions/mapping/configurations Hdmi and hdmiphy are
> independent
> of each other. It seems logical to isolate them and maintained
> independently.
>
> v2:
> 1) Moved hdmi subsystem registration to drm-common-hdmi.
> 2) removed __func__ as DRM_DEBUG_KMS print it by default.
> 3) removed devname from "hdmiphy" clock as it needs to be accessed by hdmi
> and hdmiphy driver.
>
>
Please separate this patch into 1), 2) and 3) and make it based on
exynos-drm-next.

Thanks,
Inki Dae




> This implementations is tested for:
> 1) Resolutions supported by exynos4 and 5 hdmi.
> 2) Runtime PM and S2R scenarions for exynos5.
>
> This patch is dependent on the patch, posted at
> http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg34861.html
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> It is based on exynos-drm-next branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>
>  arch/arm/mach-exynos/clock-exynos5.c     |    1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |   25 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   14 +-
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.c |  109 +++++-
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h |   20 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c     |  372 ++-----------------
>  drivers/gpu/drm/exynos/exynos_hdmi.h     |    1 -
>  drivers/gpu/drm/exynos/exynos_hdmiphy.c  |  585
> +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/exynos/regs-hdmiphy.h    |   61 ++++
>  9 files changed, 783 insertions(+), 405 deletions(-)
>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c
> b/arch/arm/mach-exynos/clock-exynos5.c
> index b0ea31f..4f39027 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -690,7 +690,6 @@ static struct clk exynos5_init_clocks_off[] = {
>                 .ctrlbit        = (1 << 6),
>         }, {
>                 .name           = "hdmiphy",
> -               .devname        = "exynos5-hdmi",
>                 .enable         = exynos5_clk_hdmiphy_ctrl,
>                 .ctrlbit        = (1 << 0),
>         }, {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 3da5c2d..2ec8ab1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -331,19 +331,9 @@ static int __init exynos_drm_init(void)
>  #endif
>
>  #ifdef CONFIG_DRM_EXYNOS_HDMI
> -       ret = platform_driver_register(&hdmi_driver);
> +       ret = exynos_common_hdmi_register();
>         if (ret < 0)
>                 goto out_hdmi;
> -       ret = platform_driver_register(&mixer_driver);
> -       if (ret < 0)
> -               goto out_mixer;
> -       ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
> -       if (ret < 0)
> -               goto out_common_hdmi;
> -
> -       ret = exynos_platform_device_hdmi_register();
> -       if (ret < 0)
> -               goto out_common_hdmi_dev;
>  #endif
>
>  #ifdef CONFIG_DRM_EXYNOS_VIDI
> @@ -430,13 +420,7 @@ out_vidi:
>  #endif
>
>  #ifdef CONFIG_DRM_EXYNOS_HDMI
> -       exynos_platform_device_hdmi_unregister();
> -out_common_hdmi_dev:
> -       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
> -out_common_hdmi:
> -       platform_driver_unregister(&mixer_driver);
> -out_mixer:
> -       platform_driver_unregister(&hdmi_driver);
> +       exynos_common_hdmi_unregister();
>  out_hdmi:
>  #endif
>
> @@ -476,10 +460,7 @@ static void __exit exynos_drm_exit(void)
>  #endif
>
>  #ifdef CONFIG_DRM_EXYNOS_HDMI
> -       exynos_platform_device_hdmi_unregister();
> -       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
> -       platform_driver_unregister(&mixer_driver);
> -       platform_driver_unregister(&hdmi_driver);
> +       exynos_common_hdmi_unregister();
>  #endif
>
>  #ifdef CONFIG_DRM_EXYNOS_VIDI
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 4606fac..7e6d070 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -319,20 +319,18 @@ int exynos_drm_subdrv_open(struct drm_device *dev,
> struct drm_file *file);
>  void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file
> *file);
>
>  /*
> - * this function registers exynos drm hdmi platform device. It ensures
> only one
> - * instance of the device is created.
> + * this function registers exynos drm hdmi platform driver and singleton
> + * device. It also registers subdrivers like mixer, hdmi and hdmiphy.
>   */
> -extern int exynos_platform_device_hdmi_register(void);
> +extern int exynos_common_hdmi_register(void);
>
>  /*
> - * this function unregisters exynos drm hdmi platform device if it exists.
> + * this function unregisters exynos drm hdmi platform driver and device,
> + * subdrivers for mixer, hdmi and hdmiphy.
>   */
> -void exynos_platform_device_hdmi_unregister(void);
> +void exynos_common_hdmi_unregister(void);
>
>  extern struct platform_driver fimd_driver;
> -extern struct platform_driver hdmi_driver;
> -extern struct platform_driver mixer_driver;
> -extern struct platform_driver exynos_drm_common_hdmi_driver;
>  extern struct platform_driver vidi_driver;
>  extern struct platform_driver g2d_driver;
>  extern struct platform_driver fimc_driver;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> index 5285509..fe66029 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
> @@ -32,40 +32,88 @@
>  /* platform device pointer for common drm hdmi device. */
>  static struct platform_device *exynos_drm_hdmi_pdev;
>
> -/* Common hdmi subdrv needs to access the hdmi and mixer though context.
> -* These should be initialied by the repective drivers */
> +/* Common hdmi subdrv needs to access the hdmi, hdmiphy and mixer though
> +*  context. These should be initialied by the repective drivers */
> +static struct exynos_drm_hdmi_context *hdmiphy_ctx;
>  static struct exynos_drm_hdmi_context *hdmi_ctx;
>  static struct exynos_drm_hdmi_context *mixer_ctx;
>
>  /* these callback points shoud be set by specific drivers. */
> +static struct exynos_hdmiphy_ops *hdmiphy_ops;
>  static struct exynos_hdmi_ops *hdmi_ops;
>  static struct exynos_mixer_ops *mixer_ops;
>
> +struct platform_driver exynos_drm_common_hdmi_driver;
> +
>  struct drm_hdmi_context {
>         struct exynos_drm_subdrv        subdrv;
> +       struct exynos_drm_hdmi_context  *hdmiphy_ctx;
>         struct exynos_drm_hdmi_context  *hdmi_ctx;
>         struct exynos_drm_hdmi_context  *mixer_ctx;
>
>         bool    enabled[MIXER_WIN_NR];
>  };
>
> -int exynos_platform_device_hdmi_register(void)
> +int exynos_common_hdmi_register(void)
>  {
> +       int ret;
> +
>         if (exynos_drm_hdmi_pdev)
>                 return -EEXIST;
>
> +       ret = exynos_hdmiphy_driver_register();
> +       if (ret < 0)
> +               goto out_hdmiphy;
> +
> +       ret = platform_driver_register(&hdmi_driver);
> +       if (ret < 0)
> +               goto out_hdmi;
> +
> +       ret = platform_driver_register(&mixer_driver);
> +       if (ret < 0)
> +               goto out_mixer;
> +
> +       ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
> +       if (ret < 0)
> +               goto out_common_hdmi;
> +
>         exynos_drm_hdmi_pdev = platform_device_register_simple(
>                         "exynos-drm-hdmi", -1, NULL, 0);
> -       if (IS_ERR_OR_NULL(exynos_drm_hdmi_pdev))
> -               return PTR_ERR(exynos_drm_hdmi_pdev);
> +       if (IS_ERR_OR_NULL(exynos_drm_hdmi_pdev)) {
> +               ret = PTR_ERR(exynos_drm_hdmi_pdev);
> +               goto out_common_hdmi_dev;
> +       }
>
>         return 0;
> +
> +out_common_hdmi_dev:
> +       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
> +out_common_hdmi:
> +       platform_driver_unregister(&mixer_driver);
> +out_mixer:
> +       platform_driver_unregister(&hdmi_driver);
> +out_hdmi:
> +       exynos_hdmiphy_driver_unregister();
> +out_hdmiphy:
> +       return ret;
>  }
>
> -void exynos_platform_device_hdmi_unregister(void)
> +void exynos_common_hdmi_unregister(void)
>  {
> -       if (exynos_drm_hdmi_pdev)
> -               platform_device_unregister(exynos_drm_hdmi_pdev);
> +       if (!exynos_drm_hdmi_pdev)
> +               return;
> +
> +       platform_device_unregister(exynos_drm_hdmi_pdev);
> +       platform_driver_unregister(&exynos_drm_common_hdmi_driver);
> +       platform_driver_unregister(&mixer_driver);
> +       platform_driver_unregister(&hdmi_driver);
> +       exynos_hdmiphy_driver_unregister();
> +}
> +
> +void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx)
> +{
> +       if (ctx)
> +               hdmiphy_ctx = ctx;
>  }
>
>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)
> @@ -80,6 +128,14 @@ void exynos_mixer_drv_attach(struct
> exynos_drm_hdmi_context *ctx)
>                 mixer_ctx = ctx;
>  }
>
> +void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops)
> +{
> +       DRM_DEBUG_KMS("%s\n", __FILE__);
> +
> +       if (ops)
> +               hdmiphy_ops = ops;
> +}
> +
>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops)
>  {
>         DRM_DEBUG_KMS("%s\n", __FILE__);
> @@ -121,7 +177,7 @@ static struct edid *drm_hdmi_get_edid(struct device
> *dev,
>         return NULL;
>  }
>
> -static int drm_hdmi_check_timing(struct device *dev, void *timing)
> +static int drm_hdmi_check_timing(struct device *dev, void *mode)
>  {
>         struct drm_hdmi_context *ctx = to_context(dev);
>         int ret = 0;
> @@ -129,18 +185,24 @@ static int drm_hdmi_check_timing(struct device *dev,
> void *timing)
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
>         /*
> -       * Both, mixer and hdmi should be able to handle the requested mode.
> -       * If any of the two fails, return mode as BAD.
> +       * Mixer, hdmi and hdmiphy should be able to handle the requested
> mode.
> +       * If any of the them fails, return mode as BAD.
>         */
>
>         if (mixer_ops && mixer_ops->check_timing)
> -               ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, timing);
> +               ret = mixer_ops->check_timing(ctx->mixer_ctx->ctx, mode);
>
>         if (ret)
>                 return ret;
>
>         if (hdmi_ops && hdmi_ops->check_timing)
> -               return hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, timing);
> +               ret = hdmi_ops->check_timing(ctx->hdmi_ctx->ctx, mode);
> +
> +       if (ret)
> +               return ret;
> +
> +       if (hdmiphy_ops && hdmiphy_ops->check_timing)
> +               return hdmiphy_ops->check_timing(ctx->hdmiphy_ctx->ctx,
> mode);
>
>         return 0;
>  }
> @@ -254,6 +316,9 @@ static void drm_hdmi_mode_set(struct device
> *subdrv_dev, void *mode)
>
>         if (hdmi_ops && hdmi_ops->mode_set)
>                 hdmi_ops->mode_set(ctx->hdmi_ctx->ctx, mode);
> +
> +       if (hdmiphy_ops && hdmiphy_ops->mode_set)
> +               hdmiphy_ops->mode_set(ctx->hdmiphy_ctx->ctx, mode);
>  }
>
>  static void drm_hdmi_get_max_resol(struct device *subdrv_dev,
> @@ -273,6 +338,15 @@ static void drm_hdmi_commit(struct device *subdrv_dev)
>
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
> +       if (hdmiphy_ops && hdmiphy_ops->prepare)
> +               hdmiphy_ops->prepare(ctx->hdmiphy_ctx->ctx);
> +
> +       if (hdmi_ops && hdmi_ops->prepare)
> +               hdmi_ops->prepare(ctx->hdmi_ctx->ctx);
> +
> +       if (hdmiphy_ops && hdmiphy_ops->config_apply)
> +               hdmiphy_ops->config_apply(ctx->hdmiphy_ctx->ctx);
> +
>         if (hdmi_ops && hdmi_ops->commit)
>                 hdmi_ops->commit(ctx->hdmi_ctx->ctx);
>  }
> @@ -288,6 +362,9 @@ static void drm_hdmi_dpms(struct device *subdrv_dev,
> int mode)
>
>         if (hdmi_ops && hdmi_ops->dpms)
>                 hdmi_ops->dpms(ctx->hdmi_ctx->ctx, mode);
> +
> +       if (hdmiphy_ops && hdmiphy_ops->dpms)
> +               hdmiphy_ops->dpms(ctx->hdmiphy_ctx->ctx, mode);
>  }
>
>  static void drm_hdmi_apply(struct device *subdrv_dev)
> @@ -393,6 +470,11 @@ static int hdmi_subdrv_probe(struct drm_device
> *drm_dev,
>                 return -EFAULT;
>         }
>
> +       if (!hdmiphy_ctx) {
> +               DRM_ERROR("hdmiphy context not initialized.\n");
> +               return -EFAULT;
> +       }
> +
>         if (!mixer_ctx) {
>                 DRM_ERROR("mixer context not initialized.\n");
>                 return -EFAULT;
> @@ -406,6 +488,7 @@ static int hdmi_subdrv_probe(struct drm_device
> *drm_dev,
>         }
>
>         ctx->hdmi_ctx = hdmi_ctx;
> +       ctx->hdmiphy_ctx = hdmiphy_ctx;
>         ctx->mixer_ctx = mixer_ctx;
>
>         ctx->hdmi_ctx->drm_dev = drm_dev;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> index fd2ff9f..249db11 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -39,10 +39,19 @@ struct exynos_hdmi_ops {
>         void (*mode_set)(void *ctx, struct drm_display_mode *mode);
>         void (*get_max_resol)(void *ctx, unsigned int *width,
>                                 unsigned int *height);
> +       void (*prepare)(void *ctx);
>         void (*commit)(void *ctx);
>         void (*dpms)(void *ctx, int mode);
>  };
>
> +struct exynos_hdmiphy_ops {
> +       int (*check_timing)(void *ctx, struct drm_display_mode *mode);
> +       void (*mode_set)(void *ctx, struct drm_display_mode *mode);
> +       void (*prepare)(void *ctx);
> +       int (*config_apply)(void *ctx);
> +       void (*dpms)(void *ctx, int mode);
> +};
> +
>  struct exynos_mixer_ops {
>         /* manager */
>         int (*iommu_on)(void *ctx, bool enable);
> @@ -60,8 +69,19 @@ struct exynos_mixer_ops {
>         int (*check_timing)(void *ctx, struct drm_display_mode *mode);
>  };
>
> +extern struct platform_driver hdmi_driver;
> +extern struct platform_driver mixer_driver;
> +
> +/*
> + * these functions registers/unregisters exynos drm hdmiphy driver.
> + */
> +extern int exynos_hdmiphy_driver_register(void);
> +extern void exynos_hdmiphy_driver_unregister(void);
> +
> +void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx);
>  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
>  void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
> +void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops);
>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
>  void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);
>  #endif
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 81382ce..b5cb1fc 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -171,7 +171,6 @@ struct hdmi_v14_conf {
>  };
>
>  struct hdmi_conf_regs {
> -       int pixel_clock;
>         int cea_video_id;
>         union {
>                 struct hdmi_v13_conf v13_conf;
> @@ -192,7 +191,6 @@ struct hdmi_context {
>         int                             irq;
>
>         struct i2c_client               *ddc_port;
> -       struct i2c_client               *hdmiphy_port;
>
>         /* current hdmiphy conf regs */
>         struct hdmi_conf_regs           mode_conf;
> @@ -204,180 +202,6 @@ struct hdmi_context {
>         enum hdmi_type                  type;
>  };
>
> -struct hdmiphy_config {
> -       int pixel_clock;
> -       u8 conf[32];
> -};
> -
> -/* list of phy config settings */
> -static const struct hdmiphy_config hdmiphy_v13_configs[] = {
> -       {
> -               .pixel_clock = 27000000,
> -               .conf = {
> -                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
> -                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
> -                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
> -                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
> -               },
> -       },
> -       {
> -               .pixel_clock = 27027000,
> -               .conf = {
> -                       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
> -                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
> -                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
> -                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
> -               },
> -       },
> -       {
> -               .pixel_clock = 74176000,
> -               .conf = {
> -                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
> -                       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
> -                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
> -                       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
> -               },
> -       },
> -       {
> -               .pixel_clock = 74250000,
> -               .conf = {
> -                       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
> -                       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
> -                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
> -                       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
> -               },
> -       },
> -       {
> -               .pixel_clock = 148500000,
> -               .conf = {
> -                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
> -                       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
> -                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
> -                       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
> -               },
> -       },
> -};
> -
> -static const struct hdmiphy_config hdmiphy_v14_configs[] = {
> -       {
> -               .pixel_clock = 25200000,
> -               .conf = {
> -                       0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
> -                       0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 27000000,
> -               .conf = {
> -                       0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
> -                       0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> -                       0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 27027000,
> -               .conf = {
> -                       0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
> -                       0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
> -               },
> -       },
> -       {
> -               .pixel_clock = 36000000,
> -               .conf = {
> -                       0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
> -                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 40000000,
> -               .conf = {
> -                       0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
> -                       0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 65000000,
> -               .conf = {
> -                       0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
> -                       0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 74176000,
> -               .conf = {
> -                       0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
> -                       0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 74250000,
> -               .conf = {
> -                       0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
> -                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> -                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
> -               },
> -       },
> -       {
> -               .pixel_clock = 83500000,
> -               .conf = {
> -                       0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
> -                       0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 106500000,
> -               .conf = {
> -                       0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
> -                       0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 108000000,
> -               .conf = {
> -                       0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
> -                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 146250000,
> -               .conf = {
> -                       0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
> -                       0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> -                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> -               },
> -       },
> -       {
> -               .pixel_clock = 148500000,
> -               .conf = {
> -                       0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
> -                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> -                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> -                       0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
> -               },
> -       },
> -};
> -
>  struct hdmi_infoframe {
>         enum HDMI_PACKET_TYPE type;
>         u8 ver;
> @@ -772,46 +596,6 @@ static struct edid *hdmi_get_edid(void *ctx, struct
> drm_connector *connector)
>         return raw_edid;
>  }
>
> -static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
> -{
> -       const struct hdmiphy_config *confs;
> -       int count, i;
> -
> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -       if (hdata->type == HDMI_TYPE13) {
> -               confs = hdmiphy_v13_configs;
> -               count = ARRAY_SIZE(hdmiphy_v13_configs);
> -       } else if (hdata->type == HDMI_TYPE14) {
> -               confs = hdmiphy_v14_configs;
> -               count = ARRAY_SIZE(hdmiphy_v14_configs);
> -       } else
> -               return -EINVAL;
> -
> -       for (i = 0; i < count; i++)
> -               if (confs[i].pixel_clock == pixel_clock)
> -                       return i;
> -
> -       DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
> -       return -EINVAL;
> -}
> -
> -static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)
> -{
> -       struct hdmi_context *hdata = ctx;
> -       int ret;
> -
> -       DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d
> clock=%d\n",
> -               __func__, mode->hdisplay, mode->vdisplay,
> -               mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE) ?
> true :
> -               false, mode->clock * 1000);
> -
> -       ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
> -       if (ret < 0)
> -               return ret;
> -       return 0;
> -}
> -
>  static void hdmi_set_acr(u32 freq, u8 *acr)
>  {
>         u32 n, cts;
> @@ -1307,20 +1091,12 @@ static void hdmi_timing_apply(struct hdmi_context
> *hdata)
>
>  static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>  {
> -       u8 buffer[2];
>         u32 reg;
>
>         clk_disable(hdata->res.sclk_hdmi);
>         clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
>         clk_enable(hdata->res.sclk_hdmi);
>
> -       /* operation mode */
> -       buffer[0] = 0x1f;
> -       buffer[1] = 0x00;
> -
> -       if (hdata->hdmiphy_port)
> -               i2c_master_send(hdata->hdmiphy_port, buffer, 2);
> -
>         if (hdata->type == HDMI_TYPE13)
>                 reg = HDMI_V13_PHY_RSTOUT;
>         else
> @@ -1333,102 +1109,6 @@ static void hdmiphy_conf_reset(struct hdmi_context
> *hdata)
>         usleep_range(10000, 12000);
>  }
>
> -static void hdmiphy_poweron(struct hdmi_context *hdata)
> -{
> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -       if (hdata->type == HDMI_TYPE14)
> -               hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
> -                       HDMI_PHY_POWER_OFF_EN);
> -}
> -
> -static void hdmiphy_poweroff(struct hdmi_context *hdata)
> -{
> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -       if (hdata->type == HDMI_TYPE14)
> -               hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
> -                       HDMI_PHY_POWER_OFF_EN);
> -}
> -
> -static void hdmiphy_conf_apply(struct hdmi_context *hdata)
> -{
> -       const u8 *hdmiphy_data;
> -       u8 buffer[32];
> -       u8 operation[2];
> -       u8 read_buffer[32] = {0, };
> -       int ret;
> -       int i;
> -
> -       if (!hdata->hdmiphy_port) {
> -               DRM_ERROR("hdmiphy is not attached\n");
> -               return;
> -       }
> -
> -       /* pixel clock */
> -       i = hdmi_find_phy_conf(hdata, hdata->mode_conf.pixel_clock);
> -       if (i < 0) {
> -               DRM_ERROR("failed to find hdmiphy conf\n");
> -               return;
> -       }
> -
> -       if (hdata->type == HDMI_TYPE13) {
> -               hdmiphy_data = hdmiphy_v13_configs[i].conf;
> -       } else {
> -               hdmiphy_data = hdmiphy_v14_configs[i].conf;
> -       }
> -
> -       memcpy(buffer, hdmiphy_data, 32);
> -       ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
> -       if (ret != 32) {
> -               DRM_ERROR("failed to configure HDMIPHY via I2C\n");
> -               return;
> -       }
> -
> -       usleep_range(10000, 12000);
> -
> -       /* operation mode */
> -       operation[0] = 0x1f;
> -       operation[1] = 0x80;
> -
> -       ret = i2c_master_send(hdata->hdmiphy_port, operation, 2);
> -       if (ret != 2) {
> -               DRM_ERROR("failed to enable hdmiphy\n");
> -               return;
> -       }
> -
> -       ret = i2c_master_recv(hdata->hdmiphy_port, read_buffer, 32);
> -       if (ret < 0) {
> -               DRM_ERROR("failed to read hdmiphy config\n");
> -               return;
> -       }
> -
> -       for (i = 0; i < ret; i++)
> -               DRM_DEBUG_KMS("hdmiphy[0x%02x] write[0x%02x] - "
> -                       "recv [0x%02x]\n", i, buffer[i], read_buffer[i]);
> -}
> -
> -static void hdmi_conf_apply(struct hdmi_context *hdata)
> -{
> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> -
> -       hdmiphy_conf_reset(hdata);
> -       hdmiphy_conf_apply(hdata);
> -
> -       mutex_lock(&hdata->hdmi_mutex);
> -       hdmi_conf_reset(hdata);
> -       hdmi_conf_init(hdata);
> -       mutex_unlock(&hdata->hdmi_mutex);
> -
> -       hdmi_audio_init(hdata);
> -
> -       /* setting core registers */
> -       hdmi_timing_apply(hdata);
> -       hdmi_audio_control(hdata, true);
> -
> -       hdmi_regs_dump(hdata, "start");
> -}
> -
>  static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
>  {
>         int i;
> @@ -1446,7 +1126,6 @@ static void hdmi_v13_mode_set(struct hdmi_context
> *hdata,
>
>         hdata->mode_conf.cea_video_id =
>                 drm_match_cea_mode((struct drm_display_mode *)m);
> -       hdata->mode_conf.pixel_clock = m->clock * 1000;
>
>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>         hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
> @@ -1542,7 +1221,6 @@ static void hdmi_v14_mode_set(struct hdmi_context
> *hdata,
>
>         hdata->mode_conf.cea_video_id =
>                 drm_match_cea_mode((struct drm_display_mode *)m);
> -       hdata->mode_conf.pixel_clock = m->clock * 1000;
>
>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>         hdmi_set_reg(core->v_line, 2, m->vtotal);
> @@ -1668,6 +1346,14 @@ static void hdmi_get_max_resol(void *ctx, unsigned
> int *width,
>         *height = MAX_HEIGHT;
>  }
>
> +static void hdmi_commit_prepare(void *ctx)
> +{
> +       struct hdmi_context *hdata = ctx;
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       hdmiphy_conf_reset(hdata);
> +}
> +
>  static void hdmi_commit(void *ctx)
>  {
>         struct hdmi_context *hdata = ctx;
> @@ -1679,9 +1365,18 @@ static void hdmi_commit(void *ctx)
>                 mutex_unlock(&hdata->hdmi_mutex);
>                 return;
>         }
> +
> +       hdmi_conf_reset(hdata);
> +       hdmi_conf_init(hdata);
>         mutex_unlock(&hdata->hdmi_mutex);
>
> -       hdmi_conf_apply(hdata);
> +       hdmi_audio_init(hdata);
> +
> +       /* setting core registers */
> +       hdmi_timing_apply(hdata);
> +       hdmi_audio_control(hdata, true);
> +
> +       hdmi_regs_dump(hdata, "start");
>  }
>
>  static void hdmi_poweron(struct hdmi_context *hdata)
> @@ -1704,8 +1399,6 @@ static void hdmi_poweron(struct hdmi_context *hdata)
>         clk_enable(res->hdmiphy);
>         clk_enable(res->hdmi);
>         clk_enable(res->sclk_hdmi);
> -
> -       hdmiphy_poweron(hdata);
>  }
>
>  static void hdmi_poweroff(struct hdmi_context *hdata)
> @@ -1724,7 +1417,6 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
>          * its reset state seems to meet the condition.
>          */
>         hdmiphy_conf_reset(hdata);
> -       hdmiphy_poweroff(hdata);
>
>         clk_disable(res->sclk_hdmi);
>         clk_disable(res->hdmi);
> @@ -1766,11 +1458,11 @@ static struct exynos_hdmi_ops hdmi_ops = {
>         /* display */
>         .is_connected   = hdmi_is_connected,
>         .get_edid       = hdmi_get_edid,
> -       .check_timing   = hdmi_check_timing,
>
>         /* manager */
>         .mode_set       = hdmi_mode_set,
>         .get_max_resol  = hdmi_get_max_resol,
> +       .prepare        = hdmi_commit_prepare,
>         .commit         = hdmi_commit,
>         .dpms           = hdmi_dpms,
>  };
> @@ -1858,7 +1550,7 @@ fail:
>         return -ENODEV;
>  }
>
> -static struct i2c_client *hdmi_ddc, *hdmi_hdmiphy;
> +static struct i2c_client *hdmi_ddc;
>
>  void hdmi_attach_ddc_client(struct i2c_client *ddc)
>  {
> @@ -1866,12 +1558,6 @@ void hdmi_attach_ddc_client(struct i2c_client *ddc)
>                 hdmi_ddc = ddc;
>  }
>
> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
> -{
> -       if (hdmiphy)
> -               hdmi_hdmiphy = hdmiphy;
> -}
> -
>  #ifdef CONFIG_OF
>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>                                         (struct device *dev)
> @@ -2029,20 +1715,11 @@ static int hdmi_probe(struct platform_device *pdev)
>
>         hdata->ddc_port = hdmi_ddc;
>
> -       /* hdmiphy i2c driver */
> -       if (i2c_add_driver(&hdmiphy_driver)) {
> -               DRM_ERROR("failed to register hdmiphy i2c driver\n");
> -               ret = -ENOENT;
> -               goto err_ddc;
> -       }
> -
> -       hdata->hdmiphy_port = hdmi_hdmiphy;
> -
>         hdata->irq = gpio_to_irq(hdata->hpd_gpio);
>         if (hdata->irq < 0) {
>                 DRM_ERROR("failed to get GPIO irq\n");
>                 ret = hdata->irq;
> -               goto err_hdmiphy;
> +               goto err_ddc;
>         }
>
>         hdata->hpd = gpio_get_value(hdata->hpd_gpio);
> @@ -2053,7 +1730,7 @@ static int hdmi_probe(struct platform_device *pdev)
>                         "hdmi", drm_hdmi_ctx);
>         if (ret) {
>                 DRM_ERROR("failed to register hdmi interrupt\n");
> -               goto err_hdmiphy;
> +               goto err_ddc;
>         }
>
>         /* Attach HDMI Driver to common hdmi. */
> @@ -2066,8 +1743,6 @@ static int hdmi_probe(struct platform_device *pdev)
>
>         return 0;
>
> -err_hdmiphy:
> -       i2c_del_driver(&hdmiphy_driver);
>  err_ddc:
>         i2c_del_driver(&ddc_driver);
>         return ret;
> @@ -2085,9 +1760,6 @@ static int hdmi_remove(struct platform_device *pdev)
>
>         free_irq(hdata->irq, hdata);
>
> -
> -       /* hdmiphy i2c driver */
> -       i2c_del_driver(&hdmiphy_driver);
>         /* DDC i2c driver */
>         i2c_del_driver(&ddc_driver);
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.h
> b/drivers/gpu/drm/exynos/exynos_hdmi.h
> index 0ddf395..6595d7b 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.h
> @@ -15,7 +15,6 @@
>  #define _EXYNOS_HDMI_H_
>
>  void hdmi_attach_ddc_client(struct i2c_client *ddc);
> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy);
>
>  extern struct i2c_driver hdmiphy_driver;
>  extern struct i2c_driver ddc_driver;
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> index ea49d13..de7cdfd 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> @@ -16,33 +16,438 @@
>  #include <linux/kernel.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
>
>  #include "exynos_drm_drv.h"
> +#include "exynos_drm_hdmi.h"
>  #include "exynos_hdmi.h"
>
> +#include "regs-hdmiphy.h"
>
> -static int hdmiphy_probe(struct i2c_client *client,
> -       const struct i2c_device_id *id)
> +#define HDMIPHY_REG_COUNT              (32)
> +
> +enum hdmiphy_type {
> +       HDMIPHY_EXYNOS4210,
> +       HDMIPHY_EXYNOS4212,
> +};
> +
> +struct hdmiphy_context {
> +       struct device           *dev;
> +       bool                    powered;
> +       void                    *parent_ctx;
> +       enum hdmiphy_type               type;
> +       const struct hdmiphy_config     *conf;
> +       struct clk              *hdmiphy;
> +};
> +
> +struct hdmiphy_config {
> +       int pixel_clock;
> +       u8 conf[HDMIPHY_REG_COUNT];
> +};
> +
> +/* list of all required phy config settings */
> +static const struct hdmiphy_config hdmiphy_4212_configs[] = {
> +       {
> +               .pixel_clock = 25200000,
> +               .conf = {
> +                       0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
> +                       0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 27000000,
> +               .conf = {
> +                       0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
> +                       0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> +                       0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 27027000,
> +               .conf = {
> +                       0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
> +                       0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
> +               },
> +       },
> +       {
> +               .pixel_clock = 36000000,
> +               .conf = {
> +                       0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
> +                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 40000000,
> +               .conf = {
> +                       0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
> +                       0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 65000000,
> +               .conf = {
> +                       0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
> +                       0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 74176000,
> +               .conf = {
> +                       0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
> +                       0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 74250000,
> +               .conf = {
> +                       0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
> +                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> +                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
> +               },
> +       },
> +       {
> +               .pixel_clock = 83500000,
> +               .conf = {
> +                       0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
> +                       0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 106500000,
> +               .conf = {
> +                       0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
> +                       0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 108000000,
> +               .conf = {
> +                       0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
> +                       0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 146250000,
> +               .conf = {
> +                       0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
> +                       0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
> +                       0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 148500000,
> +               .conf = {
> +                       0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
> +                       0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
> +                       0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
> +                       0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
> +               },
> +       },
> +};
> +
> +static const struct hdmiphy_config hdmiphy_4210_configs[] = {
> +       {
> +               .pixel_clock = 27000000,
> +               .conf = {
> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
> +               },
> +       },
> +       {
> +               .pixel_clock = 27027000,
> +               .conf = {
> +                       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
> +               },
> +       },
> +       {
> +               .pixel_clock = 74176000,
> +               .conf = {
> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
> +                       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
> +                       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
> +               },
> +       },
> +       {
> +               .pixel_clock = 74250000,
> +               .conf = {
> +                       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
> +                       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
> +                       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
> +               },
> +       },
> +       {
> +               .pixel_clock = 148500000,
> +               .conf = {
> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
> +                       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
> +                       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
> +               },
> +       },
> +};
> +
> +static const struct hdmiphy_config *hdmiphy_find_conf(void *ctx,
> +                       const struct drm_display_mode *mode)
> +{
> +       struct hdmiphy_context *hdata = ctx;
> +       const struct hdmiphy_config *confs;
> +       int count, i;
> +
> +       switch (hdata->type) {
> +       case HDMIPHY_EXYNOS4212:
> +               confs = hdmiphy_4212_configs;
> +               count = ARRAY_SIZE(hdmiphy_4212_configs);
> +               break;
> +       case HDMIPHY_EXYNOS4210:
> +               confs = hdmiphy_4210_configs;
> +               count = ARRAY_SIZE(hdmiphy_4210_configs);
> +               break;
> +       default:
> +               DRM_ERROR("failed to find HDMIPHY type\n");
> +               return NULL;
> +       }
> +
> +       for (i = 0; i < count; i++)
> +               if (confs[i].pixel_clock == (mode->clock * 1000))
> +                       return &confs[i];
> +
> +       return NULL;
> +}
> +
> +static int hdmiphy_check_timing(void *ctx, struct drm_display_mode *mode)
>  {
> -       hdmi_attach_hdmiphy_client(client);
> +       const struct hdmiphy_config *conf;
> +       DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
> +               mode->hdisplay, mode->vdisplay,
> +               mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +               ? true : false, mode->clock * 1000);
>
> -       dev_info(&client->adapter->dev, "attached s5p_hdmiphy "
> -               "into i2c adapter successfully\n");
> +       conf = hdmiphy_find_conf(ctx, mode);
> +       if (!conf) {
> +               DRM_DEBUG_KMS("Display Mode is not supported.\n");
> +               return -EINVAL;
> +       }
>
>         return 0;
>  }
>
> -static int hdmiphy_remove(struct i2c_client *client)
> +static void hdmiphy_mode_set(void *ctx, struct drm_display_mode *mode)
> +{
> +       struct hdmiphy_context *hdata = ctx;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       hdata->conf = hdmiphy_find_conf(ctx, mode);
> +}
> +
> +static void hdmiphy_config_prepare(void *ctx)
> +{
> +       struct hdmiphy_context *hdata = ctx;
> +       const struct i2c_client *client = to_i2c_client(hdata->dev);
> +       u8 buffer[2];
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       /* operation mode */
> +       buffer[0] = HDMIPHY_MODE_SET_DONE;
> +       buffer[1] = 0x00;
> +
> +       if (client)
> +               i2c_master_send(client, buffer, 2);
> +}
> +
> +static int hdmiphy_config_apply(void *ctx)
>  {
> -       dev_info(&client->adapter->dev, "detached s5p_hdmiphy "
> -               "from i2c adapter successfully\n");
> +       struct hdmiphy_context *hdata = ctx;
> +       struct i2c_client *client = to_i2c_client(hdata->dev);
> +       const u8 *hdmiphy_data;
> +       u8 buffer[HDMIPHY_REG_COUNT];
> +       u8 operation[2];
> +       u8 read_buffer[HDMIPHY_REG_COUNT] = {0, };
> +       int ret;
> +       int i;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       /* pixel clock */
> +       if (hdata->conf && client)
> +               hdmiphy_data = hdata->conf->conf;
> +       else
> +               return -EINVAL;
> +
> +       memcpy(buffer, hdmiphy_data, HDMIPHY_REG_COUNT);
> +
> +       ret = i2c_master_send(client, buffer, HDMIPHY_REG_COUNT);
> +       if (ret != HDMIPHY_REG_COUNT) {
> +               DRM_ERROR("failed to configure HDMIPHY via I2C\n");
> +               return ret;
> +       }
> +
> +       usleep_range(10000, 12000);
> +
> +       /* operation mode */
> +       operation[0] = HDMIPHY_MODE_SET_DONE;
> +       operation[1] = HDMIPHY_MODE_EN;
> +
> +       ret = i2c_master_send(client, operation, 2);
> +       if (ret != 2) {
> +               DRM_ERROR("failed to enable hdmiphy\n");
> +               return ret;
> +       }
> +
> +       ret = i2c_master_recv(client, read_buffer, HDMIPHY_REG_COUNT);
> +       if (ret < 0) {
> +               DRM_ERROR("failed to read hdmiphy config\n");
> +               return ret;
> +       }
> +
> +       for (i = 0; i < ret; i++)
> +               DRM_DEBUG_KMS("hdmiphy[0x%02x] wr[0x%02x], rd[0x%02x]\n",
> +                               i, buffer[i], read_buffer[i]);
> +       return 0;
> +}
> +
> +static void hdmiphy_dpms(void *ctx, int mode)
> +{
> +       struct hdmiphy_context *hdata = ctx;
> +
> +       DRM_DEBUG_KMS("[%d] mode %d\n", __LINE__, mode);
> +
> +       switch (mode) {
> +       case DRM_MODE_DPMS_ON:
> +               if (pm_runtime_suspended(hdata->dev))
> +                       pm_runtime_get_sync(hdata->dev);
> +               break;
> +       case DRM_MODE_DPMS_STANDBY:
> +       case DRM_MODE_DPMS_SUSPEND:
> +       case DRM_MODE_DPMS_OFF:
> +               if (!pm_runtime_suspended(hdata->dev))
> +                       pm_runtime_put_sync(hdata->dev);
> +               break;
> +       default:
> +               DRM_DEBUG_KMS("unknown dpms mode: %d\n", mode);
> +               break;
> +       }
> +}
> +
> +static int hdmiphy_update_bits(struct i2c_client *client, u8 *reg_cache,
> +                              u8 reg, u8 mask, u8 val)
> +{
> +       int ret;
> +       u8 buffer[2];
> +
> +       buffer[0] = reg;
> +       buffer[1] = (reg_cache[reg] & ~mask) | (val & mask);
> +       reg_cache[reg] = buffer[1];
> +
> +       ret = i2c_master_send(client, buffer, 2);
> +       if (ret != 2)
> +               return -EIO;
>
>         return 0;
>  }
>
> +static int hdmiphy_4412_turn_on(struct i2c_client *client, bool on)
> +{
> +       u8 reg_cache[HDMIPHY_REG_COUNT] = { 0 };
> +       u8 buffer[2];
> +       int ret;
> +
> +       DRM_DEBUG_KMS("hdmiphy is %s\n", on ? "on" : "off");
> +
> +       /* Cache all hdmi-phy registers to make the code below faster */
> +       buffer[0] = 0x0;
> +       ret = i2c_master_send(client, buffer, 1);
> +       if (ret != 1) {
> +               ret = -EIO;
> +               goto exit;
> +       }
> +       ret = i2c_master_recv(client, reg_cache, HDMIPHY_REG_COUNT);
> +       if (ret != HDMIPHY_REG_COUNT) {
> +               ret = -EIO;
> +               goto exit;
> +       }
> +
> +       /* Change to/from configuration from/to operation mode */
> +       ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_MODE_SET_DONE,
> +                               HDMIPHY_MODE_EN, on ? ~0 : 0);
> +       if (ret)
> +               goto exit;
> +
> +       /*
> +        * Turn off "oscpad" if !on; it turns on again in
> +        * during phy-configuration.
> +        */
> +       if (!on)
> +               ret = hdmiphy_update_bits(client, reg_cache,
> +                       HDMIPHY_4212_OSC_PAD_CON, HDMIPHY_OSC_PAD_EN, 0);
> +               if (ret)
> +                       goto exit;
> +
> +       /* Disable powerdown if on; enable if !on */
> +       ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_PD_CON,
> +                       HDMIPHY_PDEN, on ? 0 : ~0);
> +       if (ret)
> +               goto exit;
> +       ret = hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_PD_CON,
> +                       HDMIPHY_PD_ALL, on ? 0 : ~0);
> +       if (ret)
> +               goto exit;
> +
> +       /* Disable pixel clock generator block if !on */
> +       if (!on)
> +               ret = hdmiphy_update_bits(client, reg_cache,
> +                       HDMIPHY_4212_PCG_CON, HDMIPHY_PCG_RESET_EN, 0);
> +               if (ret)
> +                       goto exit;
> +
> +exit:
> +       /* Don't expect any errors so just do a single warn */
> +       WARN_ON(ret);
> +
> +       return ret;
> +}
> +
> +static struct exynos_hdmiphy_ops hdmiphy_ops = {
> +       .check_timing   = hdmiphy_check_timing,
> +       .mode_set               = hdmiphy_mode_set,
> +       .prepare                = hdmiphy_config_prepare,
> +       .config_apply   = hdmiphy_config_apply,
> +       .dpms           = hdmiphy_dpms,
> +};
> +
>  static const struct i2c_device_id hdmiphy_id[] = {
> -       { "s5p_hdmiphy", 0 },
> -       { "exynos5-hdmiphy", 0 },
> +       { "s5p_hdmiphy", HDMIPHY_EXYNOS4210 },
> +       { "exynos5-hdmiphy", HDMIPHY_EXYNOS4212 },
>         { },
>  };
>
> @@ -50,21 +455,181 @@ static const struct i2c_device_id hdmiphy_id[] = {
>  static struct of_device_id hdmiphy_match_types[] = {
>         {
>                 .compatible = "samsung,exynos5-hdmiphy",
> +               .data   = (void *)HDMIPHY_EXYNOS4212,
>         }, {
>                 /* end node */
>         }
>  };
>  #endif
>
> +static int hdmiphy_probe(struct i2c_client *client,
> +       const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       struct hdmiphy_context *hdata;
> +       struct exynos_drm_hdmi_context *drm_hdmi_ctx;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       drm_hdmi_ctx = devm_kzalloc(dev, sizeof(*drm_hdmi_ctx),
> +                                       GFP_KERNEL);
> +       if (!drm_hdmi_ctx) {
> +               DRM_ERROR("failed to allocate common hdmi context.\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdata = devm_kzalloc(dev, sizeof(*hdata), GFP_KERNEL);
> +       if (!hdata) {
> +               DRM_ERROR("failed to allocate hdmiphy context.\n");
> +               return -ENOMEM;
> +       }
> +
> +       if (dev->of_node) {
> +               const struct of_device_id *match;
> +               match = of_match_node(of_match_ptr(hdmiphy_match_types),
> +                                       dev->of_node);
> +               if (match == NULL)
> +                       return -ENODEV;
> +               hdata->type = (enum hdmiphy_type)match->data;
> +       } else {
> +               hdata->type = (enum hdmiphy_type)id->driver_data;
> +       }
> +
> +       drm_hdmi_ctx->ctx = (void *)hdata;
> +       hdata->parent_ctx = (void *)drm_hdmi_ctx;
> +       hdata->dev = dev;
> +
> +       hdata->hdmiphy = devm_clk_get(dev, "hdmiphy");
> +       if (IS_ERR_OR_NULL(hdata->hdmiphy)) {
> +               DRM_ERROR("failed to get clock 'hdmiphy'\n");
> +               return PTR_ERR(hdata->hdmiphy);
> +       }
> +
> +       i2c_set_clientdata(client, hdata);
> +
> +       /* Attach HDMI-PHY Driver to common hdmi. */
> +       exynos_hdmiphy_drv_attach(drm_hdmi_ctx);
> +
> +       /* register specific callbacks to common hdmi. */
> +       exynos_hdmiphy_ops_register(&hdmiphy_ops);
> +
> +       pm_runtime_enable(dev);
> +
> +       dev_info(&client->adapter->dev,
> +               "attached s5p_hdmiphy into i2c adapter successfully\n");
> +
> +       return 0;
> +}
> +
> +static int hdmiphy_remove(struct i2c_client *client)
> +{
> +       dev_info(&client->adapter->dev,
> +               "detached s5p_hdmiphy from i2c adapter successfully\n");
> +
> +       return 0;
> +}
> +
> +static void hdmiphy_poweroff(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct hdmiphy_context *hdata = i2c_get_clientdata(client);
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (hdata->type == HDMIPHY_EXYNOS4212)
> +               hdmiphy_4412_turn_on(client, 0);
> +
> +       clk_disable(hdata->hdmiphy);
> +}
> +
> +static void hdmiphy_poweron(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct hdmiphy_context *hdata = i2c_get_clientdata(client);
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       clk_enable(hdata->hdmiphy);
> +
> +       if (hdata->type == HDMIPHY_EXYNOS4212)
> +               hdmiphy_4412_turn_on(client, 1);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int hdmiphy_suspend(struct device *dev)
> +{
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (pm_runtime_suspended(dev)) {
> +               DRM_DEBUG_KMS("already runtime-suspended.\n");
> +               return 0;
> +       }
> +
> +       hdmiphy_poweroff(dev);
> +       return 0;
> +}
> +
> +static int hdmiphy_resume(struct device *dev)
> +{
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (pm_runtime_suspended(dev)) {
> +               /* dpms callback should resume the mixer. */
> +               DRM_DEBUG_KMS("already runtime-suspended.\n");
> +               return 0;
> +       }
> +
> +       hdmiphy_poweron(dev);
> +       return 0;
> +}
> +#endif
> +
> +
> +#ifdef CONFIG_PM_RUNTIME
> +static int hdmiphy_runtime_suspend(struct device *dev)
> +{
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       hdmiphy_poweroff(dev);
> +       return 0;
> +}
> +
> +static int hdmiphy_runtime_resume(struct device *dev)
> +{
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       hdmiphy_poweron(dev);
> +       return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops hdmiphy_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(hdmiphy_suspend, hdmiphy_resume)
> +       SET_RUNTIME_PM_OPS(hdmiphy_runtime_suspend,
> +               hdmiphy_runtime_resume, NULL)
> +};
> +
>  struct i2c_driver hdmiphy_driver = {
>         .driver = {
>                 .name   = "exynos-hdmiphy",
>                 .owner  = THIS_MODULE,
>                 .of_match_table = of_match_ptr(hdmiphy_match_types),
> +               .pm     = &hdmiphy_pm_ops,
>         },
>         .id_table = hdmiphy_id,
>         .probe          = hdmiphy_probe,
>         .remove         = hdmiphy_remove,
>         .command                = NULL,
>  };
> +
> +extern int exynos_hdmiphy_driver_register(void)
> +{
> +       return i2c_add_driver(&hdmiphy_driver);
> +}
> +
> +extern void exynos_hdmiphy_driver_unregister(void)
> +{
> +       i2c_del_driver(&hdmiphy_driver);
> +}
> +
>  EXPORT_SYMBOL(hdmiphy_driver);
> diff --git a/drivers/gpu/drm/exynos/regs-hdmiphy.h
> b/drivers/gpu/drm/exynos/regs-hdmiphy.h
> new file mode 100644
> index 0000000..1bb0860
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/regs-hdmiphy.h
> @@ -0,0 +1,61 @@
> +/*
> + *
> + *  regs-hdmiphy.h
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + * http://www.samsung.com/
> + *
> + * HDMI-PHY register header file for Samsung TVOUT driver
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef SAMSUNG_REGS_HDMIPHY_H
> +#define SAMSUNG_REGS_HDMIPHY_H
> +
> +/*
> + * Register part
> +*/
> +
> +/* HDMI PHY Version Common */
> +#define HDMIPHY_MODE_SET_DONE          (0x1f)
> +
> +/* HDMI PHY Version 4212 */
> +#define HDMIPHY_4212_PCG_CON           (0x04)
> +#define HDMIPHY_4212_OSC_PAD_CON       (0x0b)
> +#define HDMIPHY_4212_PD_CON            (0x1d)
> +
> +/*
> + * Bit definition part
> + */
> +
> +/* HDMIPHY_MODE_SET_DONE */
> +#define HDMIPHY_MODE_EN                (1 << 7)
> +
> +/* HDMIPHY_4212_PCG_CON */
> +#define HDMIPHY_PCG_RESET_EN           (1 << 3)
> +
> +/* HDMIPHY_4212_OSC_PAD_CON */
> +#define HDMIPHY_OSC_PAD_EN             (3 << 6)
> +
> +/* HDMIPHY_4212_PD_CON */
> +#define HDMIPHY_PDEN                   (1 << 7)
> +
> +#define HDMIPHY_PLL_PD                 (1 << 6)
> +#define HDMIPHY_CLKSER_PD              (1 << 5)
> +#define HDMIPHY_CLKDRV_PD              (1 << 4)
> +
> +#define HDMIPHY_DRV_PD                 (1 << 2)
> +#define HDMIPHY_SER_PD                 (1 << 1)
> +#define HDMIPHY_ICLK_PD                (1 << 0)
> +
> +#define HDMIPHY_PD_ALL                 (HDMIPHY_PLL_PD |\
> +                                       HDMIPHY_CLKSER_PD |\
> +                                       HDMIPHY_CLKDRV_PD|\
> +                                       HDMIPHY_DRV_PD|\
> +                                       HDMIPHY_SER_PD|\
> +                                       HDMIPHY_ICLK_PD)
> +
> +#endif /* SAMSUNG_REGS_HDMIPHY_H */
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e012292fafe534904db78a619
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rahul,<br><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">2013/4/26 Rahul Sharma <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:rahul.sharma@samsung.com" target=3D"_blank">rahul.sharma@samsung.com</=
a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im HOEnZb">Right now hdmiphy o=
perations and configs are kept inside hdmi driver. hdmiphy<br>
related code is tightly coupled with hdmi ip driver. Physicaly they are<br>
different devices and should be instantiated independently.<br>
<br>
In terms of versions/mapping/configurations Hdmi and hdmiphy are independen=
t<br>
of each other. It seems logical to isolate them and maintained independentl=
y.<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">v2:<br>
1) Moved hdmi subsystem registration to drm-common-hdmi.<br>
2) removed __func__ as DRM_DEBUG_KMS print it by default.<br>
3) removed devname from &quot;hdmiphy&quot; clock as it needs to be accesse=
d by hdmi<br>
and hdmiphy driver.<br>
<br></div></div></blockquote><div><br></div><div>Please separate this patch=
 into 1), 2) and 3) and make it based on exynos-drm-next.<br><br></div><div=
>Thanks,<br></div><div>Inki Dae<br></div><div><br><br>=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">
This implementations is tested for:<br>
1) Resolutions supported by exynos4 and 5 hdmi.<br>
2) Runtime PM and S2R scenarions for exynos5.<br>
<br>
This patch is dependent on the patch, posted at<br>
<a href=3D"http://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg3=
4861.html" target=3D"_blank">http://www.mail-archive.com/dri-devel@lists.fr=
eedesktop.org/msg34861.html</a><br>
<br>
Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung.com"=
>rahul.sharma@samsung.com</a>&gt;<br>
---<br>
It is based on exynos-drm-next branch at<br>
git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm=
-exynos.git" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/daei=
nki/drm-exynos.git</a><br>
<br>
=A0arch/arm/mach-exynos/clock-exynos5.c =A0 =A0 | =A0 =A01 -<br>
=A0drivers/gpu/drm/exynos/exynos_drm_drv.c =A0| =A0 25 +-<br>
=A0drivers/gpu/drm/exynos/exynos_drm_drv.h =A0| =A0 14 +-<br>
=A0drivers/gpu/drm/exynos/exynos_drm_hdmi.c | =A0109 +++++-<br>
=A0drivers/gpu/drm/exynos/exynos_drm_hdmi.h | =A0 20 +<br>
=A0drivers/gpu/drm/exynos/exynos_hdmi.c =A0 =A0 | =A0372 ++----------------=
-<br>
=A0drivers/gpu/drm/exynos/exynos_hdmi.h =A0 =A0 | =A0 =A01 -<br>
=A0drivers/gpu/drm/exynos/exynos_hdmiphy.c =A0| =A0585 ++++++++++++++++++++=
+++++++++-<br>
=A0drivers/gpu/drm/exynos/regs-hdmiphy.h =A0 =A0| =A0 61 ++++<br>
=A09 files changed, 783 insertions(+), 405 deletions(-)<br>
=A0create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h<br>
<br>
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/cl=
ock-exynos5.c<br>
index b0ea31f..4f39027 100644<br>
--- a/arch/arm/mach-exynos/clock-exynos5.c<br>
+++ b/arch/arm/mach-exynos/clock-exynos5.c<br>
@@ -690,7 +690,6 @@ static struct clk exynos5_init_clocks_off[] =3D {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 &lt;&lt; 6),=
<br>
=A0 =A0 =A0 =A0 }, {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D &quot;hdmiphy=
&quot;,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D &quot;exynos5-hdm=
i&quot;,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos5_clk_hdm=
iphy_ctrl,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 &lt;&lt; 0),=
<br>
=A0 =A0 =A0 =A0 }, {<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exyn=
os/exynos_drm_drv.c<br>
index 3da5c2d..2ec8ab1 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c<br>
@@ -331,19 +331,9 @@ static int __init exynos_drm_init(void)<br>
=A0#endif<br>
<br>
=A0#ifdef CONFIG_DRM_EXYNOS_HDMI<br>
- =A0 =A0 =A0 ret =3D platform_driver_register(&amp;hdmi_driver);<br>
+ =A0 =A0 =A0 ret =3D exynos_common_hdmi_register();<br>
=A0 =A0 =A0 =A0 if (ret &lt; 0)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_hdmi;<br>
- =A0 =A0 =A0 ret =3D platform_driver_register(&amp;mixer_driver);<br>
- =A0 =A0 =A0 if (ret &lt; 0)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_mixer;<br>
- =A0 =A0 =A0 ret =3D platform_driver_register(&amp;exynos_drm_common_hdmi_=
driver);<br>
- =A0 =A0 =A0 if (ret &lt; 0)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_common_hdmi;<br>
-<br>
- =A0 =A0 =A0 ret =3D exynos_platform_device_hdmi_register();<br>
- =A0 =A0 =A0 if (ret &lt; 0)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_common_hdmi_dev;<br>
=A0#endif<br>
<br>
=A0#ifdef CONFIG_DRM_EXYNOS_VIDI<br>
@@ -430,13 +420,7 @@ out_vidi:<br>
=A0#endif<br>
<br>
=A0#ifdef CONFIG_DRM_EXYNOS_HDMI<br>
- =A0 =A0 =A0 exynos_platform_device_hdmi_unregister();<br>
-out_common_hdmi_dev:<br>
- =A0 =A0 =A0 platform_driver_unregister(&amp;exynos_drm_common_hdmi_driver=
);<br>
-out_common_hdmi:<br>
- =A0 =A0 =A0 platform_driver_unregister(&amp;mixer_driver);<br>
-out_mixer:<br>
- =A0 =A0 =A0 platform_driver_unregister(&amp;hdmi_driver);<br>
+ =A0 =A0 =A0 exynos_common_hdmi_unregister();<br>
=A0out_hdmi:<br>
=A0#endif<br>
<br>
@@ -476,10 +460,7 @@ static void __exit exynos_drm_exit(void)<br>
=A0#endif<br>
<br>
=A0#ifdef CONFIG_DRM_EXYNOS_HDMI<br>
- =A0 =A0 =A0 exynos_platform_device_hdmi_unregister();<br>
- =A0 =A0 =A0 platform_driver_unregister(&amp;exynos_drm_common_hdmi_driver=
);<br>
- =A0 =A0 =A0 platform_driver_unregister(&amp;mixer_driver);<br>
- =A0 =A0 =A0 platform_driver_unregister(&amp;hdmi_driver);<br>
+ =A0 =A0 =A0 exynos_common_hdmi_unregister();<br>
=A0#endif<br>
<br>
=A0#ifdef CONFIG_DRM_EXYNOS_VIDI<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exyn=
os/exynos_drm_drv.h<br>
index 4606fac..7e6d070 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h<br>
@@ -319,20 +319,18 @@ int exynos_drm_subdrv_open(struct drm_device *dev, st=
ruct drm_file *file);<br>
=A0void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *fi=
le);<br>
<br>
=A0/*<br>
- * this function registers exynos drm hdmi platform device. It ensures onl=
y one<br>
- * instance of the device is created.<br>
+ * this function registers exynos drm hdmi platform driver and singleton<b=
r>
+ * device. It also registers subdrivers like mixer, hdmi and hdmiphy.<br>
=A0 */<br>
-extern int exynos_platform_device_hdmi_register(void);<br>
+extern int exynos_common_hdmi_register(void);<br>
<br>
=A0/*<br>
- * this function unregisters exynos drm hdmi platform device if it exists.=
<br>
+ * this function unregisters exynos drm hdmi platform driver and device,<b=
r>
+ * subdrivers for mixer, hdmi and hdmiphy.<br>
=A0 */<br>
-void exynos_platform_device_hdmi_unregister(void);<br>
+void exynos_common_hdmi_unregister(void);<br>
<br>
=A0extern struct platform_driver fimd_driver;<br>
-extern struct platform_driver hdmi_driver;<br>
-extern struct platform_driver mixer_driver;<br>
-extern struct platform_driver exynos_drm_common_hdmi_driver;<br>
=A0extern struct platform_driver vidi_driver;<br>
=A0extern struct platform_driver g2d_driver;<br>
=A0extern struct platform_driver fimc_driver;<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exy=
nos/exynos_drm_hdmi.c<br>
index 5285509..fe66029 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c<br>
@@ -32,40 +32,88 @@<br>
=A0/* platform device pointer for common drm hdmi device. */<br>
=A0static struct platform_device *exynos_drm_hdmi_pdev;<br>
<br>
-/* Common hdmi subdrv needs to access the hdmi and mixer though context.<b=
r>
-* These should be initialied by the repective drivers */<br>
+/* Common hdmi subdrv needs to access the hdmi, hdmiphy and mixer though<b=
r>
+* =A0context. These should be initialied by the repective drivers */<br>
+static struct exynos_drm_hdmi_context *hdmiphy_ctx;<br>
=A0static struct exynos_drm_hdmi_context *hdmi_ctx;<br>
=A0static struct exynos_drm_hdmi_context *mixer_ctx;<br>
<br>
=A0/* these callback points shoud be set by specific drivers. */<br>
+static struct exynos_hdmiphy_ops *hdmiphy_ops;<br>
=A0static struct exynos_hdmi_ops *hdmi_ops;<br>
=A0static struct exynos_mixer_ops *mixer_ops;<br>
<br>
+struct platform_driver exynos_drm_common_hdmi_driver;<br>
+<br>
=A0struct drm_hdmi_context {<br>
=A0 =A0 =A0 =A0 struct exynos_drm_subdrv =A0 =A0 =A0 =A0subdrv;<br>
+ =A0 =A0 =A0 struct exynos_drm_hdmi_context =A0*hdmiphy_ctx;<br>
=A0 =A0 =A0 =A0 struct exynos_drm_hdmi_context =A0*hdmi_ctx;<br>
=A0 =A0 =A0 =A0 struct exynos_drm_hdmi_context =A0*mixer_ctx;<br>
<br>
=A0 =A0 =A0 =A0 bool =A0 =A0enabled[MIXER_WIN_NR];<br>
=A0};<br>
<br>
-int exynos_platform_device_hdmi_register(void)<br>
+int exynos_common_hdmi_register(void)<br>
=A0{<br>
+ =A0 =A0 =A0 int ret;<br>
+<br>
=A0 =A0 =A0 =A0 if (exynos_drm_hdmi_pdev)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EEXIST;<br>
<br>
+ =A0 =A0 =A0 ret =3D exynos_hdmiphy_driver_register();<br>
+ =A0 =A0 =A0 if (ret &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_hdmiphy;<br>
+<br>
+ =A0 =A0 =A0 ret =3D platform_driver_register(&amp;hdmi_driver);<br>
+ =A0 =A0 =A0 if (ret &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_hdmi;<br>
+<br>
+ =A0 =A0 =A0 ret =3D platform_driver_register(&amp;mixer_driver);<br>
+ =A0 =A0 =A0 if (ret &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_mixer;<br>
+<br>
+ =A0 =A0 =A0 ret =3D platform_driver_register(&amp;exynos_drm_common_hdmi_=
driver);<br>
+ =A0 =A0 =A0 if (ret &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_common_hdmi;<br>
+<br>
=A0 =A0 =A0 =A0 exynos_drm_hdmi_pdev =3D platform_device_register_simple(<b=
r>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;exynos-drm-hdmi&quot;=
, -1, NULL, 0);<br>
- =A0 =A0 =A0 if (IS_ERR_OR_NULL(exynos_drm_hdmi_pdev))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(exynos_drm_hdmi_pdev);<br>
+ =A0 =A0 =A0 if (IS_ERR_OR_NULL(exynos_drm_hdmi_pdev)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(exynos_drm_hdmi_pdev);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_common_hdmi_dev;<br>
+ =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 return 0;<br>
+<br>
+out_common_hdmi_dev:<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;exynos_drm_common_hdmi_driver=
);<br>
+out_common_hdmi:<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;mixer_driver);<br>
+out_mixer:<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;hdmi_driver);<br>
+out_hdmi:<br>
+ =A0 =A0 =A0 exynos_hdmiphy_driver_unregister();<br>
+out_hdmiphy:<br>
+ =A0 =A0 =A0 return ret;<br>
=A0}<br>
<br>
-void exynos_platform_device_hdmi_unregister(void)<br>
+void exynos_common_hdmi_unregister(void)<br>
=A0{<br>
- =A0 =A0 =A0 if (exynos_drm_hdmi_pdev)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 platform_device_unregister(exynos_drm_hdmi_pd=
ev);<br>
+ =A0 =A0 =A0 if (!exynos_drm_hdmi_pdev)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
+<br>
+ =A0 =A0 =A0 platform_device_unregister(exynos_drm_hdmi_pdev);<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;exynos_drm_common_hdmi_driver=
);<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;mixer_driver);<br>
+ =A0 =A0 =A0 platform_driver_unregister(&amp;hdmi_driver);<br>
+ =A0 =A0 =A0 exynos_hdmiphy_driver_unregister();<br>
+}<br>
+<br>
+void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx)<br>
+{<br>
+ =A0 =A0 =A0 if (ctx)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_ctx =3D ctx;<br>
=A0}<br>
<br>
=A0void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)<br>
@@ -80,6 +128,14 @@ void exynos_mixer_drv_attach(struct exynos_drm_hdmi_con=
text *ctx)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mixer_ctx =3D ctx;<br>
=A0}<br>
<br>
+void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops)<br>
+{<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
+<br>
+ =A0 =A0 =A0 if (ops)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_ops =3D ops;<br>
+}<br>
+<br>
=A0void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops)<br>
=A0{<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
@@ -121,7 +177,7 @@ static struct edid *drm_hdmi_get_edid(struct device *de=
v,<br>
=A0 =A0 =A0 =A0 return NULL;<br>
=A0}<br>
<br>
-static int drm_hdmi_check_timing(struct device *dev, void *timing)<br>
+static int drm_hdmi_check_timing(struct device *dev, void *mode)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct drm_hdmi_context *ctx =3D to_context(dev);<br>
=A0 =A0 =A0 =A0 int ret =3D 0;<br>
@@ -129,18 +185,24 @@ static int drm_hdmi_check_timing(struct device *dev, =
void *timing)<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
<br>
=A0 =A0 =A0 =A0 /*<br>
- =A0 =A0 =A0 * Both, mixer and hdmi should be able to handle the requested=
 mode.<br>
- =A0 =A0 =A0 * If any of the two fails, return mode as BAD.<br>
+ =A0 =A0 =A0 * Mixer, hdmi and hdmiphy should be able to handle the reques=
ted mode.<br>
+ =A0 =A0 =A0 * If any of the them fails, return mode as BAD.<br>
=A0 =A0 =A0 =A0 */<br>
<br>
=A0 =A0 =A0 =A0 if (mixer_ops &amp;&amp; mixer_ops-&gt;check_timing)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mixer_ops-&gt;check_timing(ctx-&gt;mi=
xer_ctx-&gt;ctx, timing);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D mixer_ops-&gt;check_timing(ctx-&gt;mi=
xer_ctx-&gt;ctx, mode);<br>
<br>
=A0 =A0 =A0 =A0 if (ret)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
<br>
=A0 =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;check_timing)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return hdmi_ops-&gt;check_timing(ctx-&gt;hdmi=
_ctx-&gt;ctx, timing);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D hdmi_ops-&gt;check_timing(ctx-&gt;hdm=
i_ctx-&gt;ctx, mode);<br>
+<br>
+ =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+<br>
+ =A0 =A0 =A0 if (hdmiphy_ops &amp;&amp; hdmiphy_ops-&gt;check_timing)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return hdmiphy_ops-&gt;check_timing(ctx-&gt;h=
dmiphy_ctx-&gt;ctx, mode);<br>
<br>
=A0 =A0 =A0 =A0 return 0;<br>
=A0}<br>
@@ -254,6 +316,9 @@ static void drm_hdmi_mode_set(struct device *subdrv_dev=
, void *mode)<br>
<br>
=A0 =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;mode_set)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_ops-&gt;mode_set(ctx-&gt;hdmi_ctx-&gt;=
ctx, mode);<br>
+<br>
+ =A0 =A0 =A0 if (hdmiphy_ops &amp;&amp; hdmiphy_ops-&gt;mode_set)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_ops-&gt;mode_set(ctx-&gt;hdmiphy_ctx-=
&gt;ctx, mode);<br>
=A0}<br>
<br>
=A0static void drm_hdmi_get_max_resol(struct device *subdrv_dev,<br>
@@ -273,6 +338,15 @@ static void drm_hdmi_commit(struct device *subdrv_dev)=
<br>
<br>
=A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
<br>
+ =A0 =A0 =A0 if (hdmiphy_ops &amp;&amp; hdmiphy_ops-&gt;prepare)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_ops-&gt;prepare(ctx-&gt;hdmiphy_ctx-&=
gt;ctx);<br>
+<br>
+ =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;prepare)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_ops-&gt;prepare(ctx-&gt;hdmi_ctx-&gt;ctx=
);<br>
+<br>
+ =A0 =A0 =A0 if (hdmiphy_ops &amp;&amp; hdmiphy_ops-&gt;config_apply)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_ops-&gt;config_apply(ctx-&gt;hdmiphy_=
ctx-&gt;ctx);<br>
+<br>
=A0 =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;commit)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_ops-&gt;commit(ctx-&gt;hdmi_ctx-&gt;ct=
x);<br>
=A0}<br>
@@ -288,6 +362,9 @@ static void drm_hdmi_dpms(struct device *subdrv_dev, in=
t mode)<br>
<br>
=A0 =A0 =A0 =A0 if (hdmi_ops &amp;&amp; hdmi_ops-&gt;dpms)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_ops-&gt;dpms(ctx-&gt;hdmi_ctx-&gt;ctx,=
 mode);<br>
+<br>
+ =A0 =A0 =A0 if (hdmiphy_ops &amp;&amp; hdmiphy_ops-&gt;dpms)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_ops-&gt;dpms(ctx-&gt;hdmiphy_ctx-&gt;=
ctx, mode);<br>
=A0}<br>
<br>
=A0static void drm_hdmi_apply(struct device *subdrv_dev)<br>
@@ -393,6 +470,11 @@ static int hdmi_subdrv_probe(struct drm_device *drm_de=
v,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EFAULT;<br>
=A0 =A0 =A0 =A0 }<br>
<br>
+ =A0 =A0 =A0 if (!hdmiphy_ctx) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;hdmiphy context not initializ=
ed.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EFAULT;<br>
+ =A0 =A0 =A0 }<br>
+<br>
=A0 =A0 =A0 =A0 if (!mixer_ctx) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;mixer context not initializ=
ed.\n&quot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EFAULT;<br>
@@ -406,6 +488,7 @@ static int hdmi_subdrv_probe(struct drm_device *drm_dev=
,<br>
=A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 ctx-&gt;hdmi_ctx =3D hdmi_ctx;<br>
+ =A0 =A0 =A0 ctx-&gt;hdmiphy_ctx =3D hdmiphy_ctx;<br>
=A0 =A0 =A0 =A0 ctx-&gt;mixer_ctx =3D mixer_ctx;<br>
<br>
=A0 =A0 =A0 =A0 ctx-&gt;hdmi_ctx-&gt;drm_dev =3D drm_dev;<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exy=
nos/exynos_drm_hdmi.h<br>
index fd2ff9f..249db11 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h<br>
@@ -39,10 +39,19 @@ struct exynos_hdmi_ops {<br>
=A0 =A0 =A0 =A0 void (*mode_set)(void *ctx, struct drm_display_mode *mode);=
<br>
=A0 =A0 =A0 =A0 void (*get_max_resol)(void *ctx, unsigned int *width,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned in=
t *height);<br>
+ =A0 =A0 =A0 void (*prepare)(void *ctx);<br>
=A0 =A0 =A0 =A0 void (*commit)(void *ctx);<br>
=A0 =A0 =A0 =A0 void (*dpms)(void *ctx, int mode);<br>
=A0};<br>
<br>
+struct exynos_hdmiphy_ops {<br>
+ =A0 =A0 =A0 int (*check_timing)(void *ctx, struct drm_display_mode *mode)=
;<br>
+ =A0 =A0 =A0 void (*mode_set)(void *ctx, struct drm_display_mode *mode);<b=
r>
+ =A0 =A0 =A0 void (*prepare)(void *ctx);<br>
+ =A0 =A0 =A0 int (*config_apply)(void *ctx);<br>
+ =A0 =A0 =A0 void (*dpms)(void *ctx, int mode);<br>
+};<br>
+<br>
=A0struct exynos_mixer_ops {<br>
=A0 =A0 =A0 =A0 /* manager */<br>
=A0 =A0 =A0 =A0 int (*iommu_on)(void *ctx, bool enable);<br>
@@ -60,8 +69,19 @@ struct exynos_mixer_ops {<br>
=A0 =A0 =A0 =A0 int (*check_timing)(void *ctx, struct drm_display_mode *mod=
e);<br>
=A0};<br>
<br>
+extern struct platform_driver hdmi_driver;<br>
+extern struct platform_driver mixer_driver;<br>
+<br>
+/*<br>
+ * these functions registers/unregisters exynos drm hdmiphy driver.<br>
+ */<br>
+extern int exynos_hdmiphy_driver_register(void);<br>
+extern void exynos_hdmiphy_driver_unregister(void);<br>
+<br>
+void exynos_hdmiphy_drv_attach(struct exynos_drm_hdmi_context *ctx);<br>
=A0void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);<br>
=A0void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);<br>
+void exynos_hdmiphy_ops_register(struct exynos_hdmiphy_ops *ops);<br>
=A0void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);<br>
=A0void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);<br>
=A0#endif<br>
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/=
exynos_hdmi.c<br>
index 81382ce..b5cb1fc 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
@@ -171,7 +171,6 @@ struct hdmi_v14_conf {<br>
=A0};<br>
<br>
=A0struct hdmi_conf_regs {<br>
- =A0 =A0 =A0 int pixel_clock;<br>
=A0 =A0 =A0 =A0 int cea_video_id;<br>
=A0 =A0 =A0 =A0 union {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct hdmi_v13_conf v13_conf;<br>
@@ -192,7 +191,6 @@ struct hdmi_context {<br>
=A0 =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 irq;<br>
<br>
=A0 =A0 =A0 =A0 struct i2c_client =A0 =A0 =A0 =A0 =A0 =A0 =A0 *ddc_port;<br=
>
- =A0 =A0 =A0 struct i2c_client =A0 =A0 =A0 =A0 =A0 =A0 =A0 *hdmiphy_port;<=
br>
<br>
=A0 =A0 =A0 =A0 /* current hdmiphy conf regs */<br>
=A0 =A0 =A0 =A0 struct hdmi_conf_regs =A0 =A0 =A0 =A0 =A0 mode_conf;<br>
@@ -204,180 +202,6 @@ struct hdmi_context {<br>
=A0 =A0 =A0 =A0 enum hdmi_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0type;<br>
=A0};<br>
<br>
-struct hdmiphy_config {<br>
- =A0 =A0 =A0 int pixel_clock;<br>
- =A0 =A0 =A0 u8 conf[32];<br>
-};<br>
-<br>
-/* list of phy config settings */<br>
-static const struct hdmiphy_config hdmiphy_v13_configs[] =3D {<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27000000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,=
 0x1C, 0x30, 0x40,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x02, 0x51, 0xDF,=
 0xF2, 0x54, 0x87,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE3, 0x26, 0x00,=
 0x00, 0x00, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27027000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD4, 0x10,=
 0x9C, 0x09, 0x64,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x02, 0x51, 0xDF,=
 0xF2, 0x54, 0x87,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE3, 0x26, 0x00,=
 0x00, 0x00, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74176000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,=
 0x9C, 0xef, 0x5B,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6D, 0x10, 0x01, 0x51, 0xef,=
 0xF3, 0x54, 0xb9,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa5, 0x26, 0x01,=
 0x00, 0x00, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74250000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xd8, 0x10,=
 0x9c, 0xf8, 0x40,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6a, 0x10, 0x01, 0x51, 0xff,=
 0xf1, 0x54, 0xba,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x10, 0x38, 0x00,=
 0x08, 0x10, 0xe0,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa4, 0x26, 0x01,=
 0x00, 0x00, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 148500000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,=
 0x9C, 0xf8, 0x40,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6A, 0x18, 0x00, 0x51, 0xff,=
 0xF1, 0x54, 0xba,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x10, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa4, 0x26, 0x02,=
 0x00, 0x00, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
-};<br>
-<br>
-static const struct hdmiphy_config hdmiphy_v14_configs[] =3D {<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 25200000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x2A, 0x75, 0x40,=
 0x01, 0x00, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0xfc, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xf4, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27000000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x22, 0x51, 0x40,=
 0x08, 0xfc, 0x20,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x98, 0xa0, 0xcb, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x06, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xe4, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27027000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x2d, 0x72, 0x40,=
 0x64, 0x12, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x43, 0xa0, 0x0e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xe3, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 36000000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x2d, 0x55, 0x40,=
 0x01, 0x00, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0x0e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xab, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 40000000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x32, 0x55, 0x40,=
 0x01, 0x00, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0x2c, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x9a, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 65000000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x36, 0x34, 0x40,=
 0x1e, 0x0a, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0xa0, 0x45, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xbd, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74176000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x3e, 0x35, 0x40,=
 0x5b, 0xde, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0xa0, 0x73, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x56, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xa6, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74250000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x1f, 0x10, 0x40,=
 0x40, 0xf8, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x81, 0xa0, 0xba, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x3c, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xa5, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 83500000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x23, 0x11, 0x40,=
 0x0c, 0xfb, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x85, 0xa0, 0xd1, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x93, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 106500000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x2c, 0x12, 0x40,=
 0x0c, 0x09, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0xa0, 0x0a, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x73, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 108000000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x2d, 0x15, 0x40,=
 0x01, 0x00, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0x0e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xc7, 0x25, 0x03, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 146250000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x3d, 0x15, 0x40,=
 0x18, 0xfd, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x83, 0xa0, 0x6e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x50, 0x25, 0x03, 0x00,=
 0x00, 0x01, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 148500000,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x1f, 0x00, 0x40,=
 0x40, 0xf8, 0x08,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x81, 0xa0, 0xba, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x3c, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x4b, 0x25, 0x03, 0x00,=
 0x00, 0x01, 0x00,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
- =A0 =A0 =A0 },<br>
-};<br>
-<br>
=A0struct hdmi_infoframe {<br>
=A0 =A0 =A0 =A0 enum HDMI_PACKET_TYPE type;<br>
=A0 =A0 =A0 =A0 u8 ver;<br>
@@ -772,46 +596,6 @@ static struct edid *hdmi_get_edid(void *ctx, struct dr=
m_connector *connector)<br>
=A0 =A0 =A0 =A0 return raw_edid;<br>
=A0}<br>
<br>
-static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)=
<br>
-{<br>
- =A0 =A0 =A0 const struct hdmiphy_config *confs;<br>
- =A0 =A0 =A0 int count, i;<br>
-<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d] %s\n&quot;, __LINE__, __func__);<br>
-<br>
- =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMI_TYPE13) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 confs =3D hdmiphy_v13_configs;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 count =3D ARRAY_SIZE(hdmiphy_v13_configs);<br=
>
- =A0 =A0 =A0 } else if (hdata-&gt;type =3D=3D HDMI_TYPE14) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 confs =3D hdmiphy_v14_configs;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 count =3D ARRAY_SIZE(hdmiphy_v14_configs);<br=
>
- =A0 =A0 =A0 } else<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
-<br>
- =A0 =A0 =A0 for (i =3D 0; i &lt; count; i++)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (confs[i].pixel_clock =3D=3D pixel_clock)<=
br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return i;<br>
-<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;Could not find phy config for %d\n&quot;,=
 pixel_clock);<br>
- =A0 =A0 =A0 return -EINVAL;<br>
-}<br>
-<br>
-static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)<br>
-{<br>
- =A0 =A0 =A0 struct hdmi_context *hdata =3D ctx;<br>
- =A0 =A0 =A0 int ret;<br>
-<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;%s : xres=3D%d, yres=3D%d, refresh=3D%d, =
intl=3D%d clock=3D%d\n&quot;,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, mode-&gt;hdisplay, mode-&gt;vdispla=
y,<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode-&gt;vrefresh, (mode-&gt;flags &amp; DRM_=
MODE_FLAG_INTERLACE) ? true :<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 false, mode-&gt;clock * 1000);<br>
-<br>
- =A0 =A0 =A0 ret =3D hdmi_find_phy_conf(hdata, mode-&gt;clock * 1000);<br>
- =A0 =A0 =A0 if (ret &lt; 0)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
- =A0 =A0 =A0 return 0;<br>
-}<br>
-<br>
=A0static void hdmi_set_acr(u32 freq, u8 *acr)<br>
=A0{<br>
=A0 =A0 =A0 =A0 u32 n, cts;<br>
@@ -1307,20 +1091,12 @@ static void hdmi_timing_apply(struct hdmi_context *=
hdata)<br>
<br>
=A0static void hdmiphy_conf_reset(struct hdmi_context *hdata)<br>
=A0{<br>
- =A0 =A0 =A0 u8 buffer[2];<br>
=A0 =A0 =A0 =A0 u32 reg;<br>
<br>
=A0 =A0 =A0 =A0 clk_disable(hdata-&gt;res.sclk_hdmi);<br>
=A0 =A0 =A0 =A0 clk_set_parent(hdata-&gt;res.sclk_hdmi, hdata-&gt;res.sclk_=
pixel);<br>
=A0 =A0 =A0 =A0 clk_enable(hdata-&gt;res.sclk_hdmi);<br>
<br>
- =A0 =A0 =A0 /* operation mode */<br>
- =A0 =A0 =A0 buffer[0] =3D 0x1f;<br>
- =A0 =A0 =A0 buffer[1] =3D 0x00;<br>
-<br>
- =A0 =A0 =A0 if (hdata-&gt;hdmiphy_port)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_master_send(hdata-&gt;hdmiphy_port, buffe=
r, 2);<br>
-<br>
=A0 =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMI_TYPE13)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D HDMI_V13_PHY_RSTOUT;<br>
=A0 =A0 =A0 =A0 else<br>
@@ -1333,102 +1109,6 @@ static void hdmiphy_conf_reset(struct hdmi_context =
*hdata)<br>
=A0 =A0 =A0 =A0 usleep_range(10000, 12000);<br>
=A0}<br>
<br>
-static void hdmiphy_poweron(struct hdmi_context *hdata)<br>
-{<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d] %s\n&quot;, __LINE__, __func__);<br>
-<br>
- =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMI_TYPE14)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,<=
br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMI_PHY_POWER_OFF_EN);<br>
-}<br>
-<br>
-static void hdmiphy_poweroff(struct hdmi_context *hdata)<br>
-{<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d] %s\n&quot;, __LINE__, __func__);<br>
-<br>
- =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMI_TYPE14)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMI_PHY_POWER_OFF_EN);<br>
-}<br>
-<br>
-static void hdmiphy_conf_apply(struct hdmi_context *hdata)<br>
-{<br>
- =A0 =A0 =A0 const u8 *hdmiphy_data;<br>
- =A0 =A0 =A0 u8 buffer[32];<br>
- =A0 =A0 =A0 u8 operation[2];<br>
- =A0 =A0 =A0 u8 read_buffer[32] =3D {0, };<br>
- =A0 =A0 =A0 int ret;<br>
- =A0 =A0 =A0 int i;<br>
-<br>
- =A0 =A0 =A0 if (!hdata-&gt;hdmiphy_port) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;hdmiphy is not attached\n&quo=
t;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 /* pixel clock */<br>
- =A0 =A0 =A0 i =3D hdmi_find_phy_conf(hdata, hdata-&gt;mode_conf.pixel_clo=
ck);<br>
- =A0 =A0 =A0 if (i &lt; 0) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to find hdmiphy conf\n=
&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMI_TYPE13) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_data =3D hdmiphy_v13_configs[i].conf;=
<br>
- =A0 =A0 =A0 } else {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_data =3D hdmiphy_v14_configs[i].conf;=
<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 memcpy(buffer, hdmiphy_data, 32);<br>
- =A0 =A0 =A0 ret =3D i2c_master_send(hdata-&gt;hdmiphy_port, buffer, 32);<=
br>
- =A0 =A0 =A0 if (ret !=3D 32) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to configure HDMIPHY v=
ia I2C\n&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 usleep_range(10000, 12000);<br>
-<br>
- =A0 =A0 =A0 /* operation mode */<br>
- =A0 =A0 =A0 operation[0] =3D 0x1f;<br>
- =A0 =A0 =A0 operation[1] =3D 0x80;<br>
-<br>
- =A0 =A0 =A0 ret =3D i2c_master_send(hdata-&gt;hdmiphy_port, operation, 2)=
;<br>
- =A0 =A0 =A0 if (ret !=3D 2) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to enable hdmiphy\n&qu=
ot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 ret =3D i2c_master_recv(hdata-&gt;hdmiphy_port, read_buffer, =
32);<br>
- =A0 =A0 =A0 if (ret &lt; 0) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to read hdmiphy config=
\n&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 for (i =3D 0; i &lt; ret; i++)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;hdmiphy[0x%02x] write[0x%=
02x] - &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;recv [0x%02x]\n&quot;, =
i, buffer[i], read_buffer[i]);<br>
-}<br>
-<br>
-static void hdmi_conf_apply(struct hdmi_context *hdata)<br>
-{<br>
- =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d] %s\n&quot;, __LINE__, __func__);<br>
-<br>
- =A0 =A0 =A0 hdmiphy_conf_reset(hdata);<br>
- =A0 =A0 =A0 hdmiphy_conf_apply(hdata);<br>
-<br>
- =A0 =A0 =A0 mutex_lock(&amp;hdata-&gt;hdmi_mutex);<br>
- =A0 =A0 =A0 hdmi_conf_reset(hdata);<br>
- =A0 =A0 =A0 hdmi_conf_init(hdata);<br>
- =A0 =A0 =A0 mutex_unlock(&amp;hdata-&gt;hdmi_mutex);<br>
-<br>
- =A0 =A0 =A0 hdmi_audio_init(hdata);<br>
-<br>
- =A0 =A0 =A0 /* setting core registers */<br>
- =A0 =A0 =A0 hdmi_timing_apply(hdata);<br>
- =A0 =A0 =A0 hdmi_audio_control(hdata, true);<br>
-<br>
- =A0 =A0 =A0 hdmi_regs_dump(hdata, &quot;start&quot;);<br>
-}<br>
-<br>
=A0static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)<br>
=A0{<br>
=A0 =A0 =A0 =A0 int i;<br>
@@ -1446,7 +1126,6 @@ static void hdmi_v13_mode_set(struct hdmi_context *hd=
ata,<br>
<br>
=A0 =A0 =A0 =A0 hdata-&gt;mode_conf.cea_video_id =3D<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drm_match_cea_mode((struct drm_display_mode=
 *)m);<br>
- =A0 =A0 =A0 hdata-&gt;mode_conf.pixel_clock =3D m-&gt;clock * 1000;<br>
<br>
=A0 =A0 =A0 =A0 hdmi_set_reg(core-&gt;h_blank, 2, m-&gt;htotal - m-&gt;hdis=
play);<br>
=A0 =A0 =A0 =A0 hdmi_set_reg(core-&gt;h_v_line, 3, (m-&gt;htotal &lt;&lt; 1=
2) | m-&gt;vtotal);<br>
@@ -1542,7 +1221,6 @@ static void hdmi_v14_mode_set(struct hdmi_context *hd=
ata,<br>
<br>
=A0 =A0 =A0 =A0 hdata-&gt;mode_conf.cea_video_id =3D<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drm_match_cea_mode((struct drm_display_mode=
 *)m);<br>
- =A0 =A0 =A0 hdata-&gt;mode_conf.pixel_clock =3D m-&gt;clock * 1000;<br>
<br>
=A0 =A0 =A0 =A0 hdmi_set_reg(core-&gt;h_blank, 2, m-&gt;htotal - m-&gt;hdis=
play);<br>
=A0 =A0 =A0 =A0 hdmi_set_reg(core-&gt;v_line, 2, m-&gt;vtotal);<br>
@@ -1668,6 +1346,14 @@ static void hdmi_get_max_resol(void *ctx, unsigned i=
nt *width,<br>
=A0 =A0 =A0 =A0 *height =3D MAX_HEIGHT;<br>
=A0}<br>
<br>
+static void hdmi_commit_prepare(void *ctx)<br>
+{<br>
+ =A0 =A0 =A0 struct hdmi_context *hdata =3D ctx;<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 hdmiphy_conf_reset(hdata);<br>
+}<br>
+<br>
=A0static void hdmi_commit(void *ctx)<br>
=A0{<br>
=A0 =A0 =A0 =A0 struct hdmi_context *hdata =3D ctx;<br>
@@ -1679,9 +1365,18 @@ static void hdmi_commit(void *ctx)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&amp;hdata-&gt;hdmi_mutex);<br=
>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
=A0 =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 hdmi_conf_reset(hdata);<br>
+ =A0 =A0 =A0 hdmi_conf_init(hdata);<br>
=A0 =A0 =A0 =A0 mutex_unlock(&amp;hdata-&gt;hdmi_mutex);<br>
<br>
- =A0 =A0 =A0 hdmi_conf_apply(hdata);<br>
+ =A0 =A0 =A0 hdmi_audio_init(hdata);<br>
+<br>
+ =A0 =A0 =A0 /* setting core registers */<br>
+ =A0 =A0 =A0 hdmi_timing_apply(hdata);<br>
+ =A0 =A0 =A0 hdmi_audio_control(hdata, true);<br>
+<br>
+ =A0 =A0 =A0 hdmi_regs_dump(hdata, &quot;start&quot;);<br>
=A0}<br>
<br>
=A0static void hdmi_poweron(struct hdmi_context *hdata)<br>
@@ -1704,8 +1399,6 @@ static void hdmi_poweron(struct hdmi_context *hdata)<=
br>
=A0 =A0 =A0 =A0 clk_enable(res-&gt;hdmiphy);<br>
=A0 =A0 =A0 =A0 clk_enable(res-&gt;hdmi);<br>
=A0 =A0 =A0 =A0 clk_enable(res-&gt;sclk_hdmi);<br>
-<br>
- =A0 =A0 =A0 hdmiphy_poweron(hdata);<br>
=A0}<br>
<br>
=A0static void hdmi_poweroff(struct hdmi_context *hdata)<br>
@@ -1724,7 +1417,6 @@ static void hdmi_poweroff(struct hdmi_context *hdata)=
<br>
=A0 =A0 =A0 =A0 =A0* its reset state seems to meet the condition.<br>
=A0 =A0 =A0 =A0 =A0*/<br>
=A0 =A0 =A0 =A0 hdmiphy_conf_reset(hdata);<br>
- =A0 =A0 =A0 hdmiphy_poweroff(hdata);<br>
<br>
=A0 =A0 =A0 =A0 clk_disable(res-&gt;sclk_hdmi);<br>
=A0 =A0 =A0 =A0 clk_disable(res-&gt;hdmi);<br>
@@ -1766,11 +1458,11 @@ static struct exynos_hdmi_ops hdmi_ops =3D {<br>
=A0 =A0 =A0 =A0 /* display */<br>
=A0 =A0 =A0 =A0 .is_connected =A0 =3D hdmi_is_connected,<br>
=A0 =A0 =A0 =A0 .get_edid =A0 =A0 =A0 =3D hdmi_get_edid,<br>
- =A0 =A0 =A0 .check_timing =A0 =3D hdmi_check_timing,<br>
<br>
=A0 =A0 =A0 =A0 /* manager */<br>
=A0 =A0 =A0 =A0 .mode_set =A0 =A0 =A0 =3D hdmi_mode_set,<br>
=A0 =A0 =A0 =A0 .get_max_resol =A0=3D hdmi_get_max_resol,<br>
+ =A0 =A0 =A0 .prepare =A0 =A0 =A0 =A0=3D hdmi_commit_prepare,<br>
=A0 =A0 =A0 =A0 .commit =A0 =A0 =A0 =A0 =3D hdmi_commit,<br>
=A0 =A0 =A0 =A0 .dpms =A0 =A0 =A0 =A0 =A0 =3D hdmi_dpms,<br>
=A0};<br>
@@ -1858,7 +1550,7 @@ fail:<br>
=A0 =A0 =A0 =A0 return -ENODEV;<br>
=A0}<br>
<br>
-static struct i2c_client *hdmi_ddc, *hdmi_hdmiphy;<br>
+static struct i2c_client *hdmi_ddc;<br>
<br>
=A0void hdmi_attach_ddc_client(struct i2c_client *ddc)<br>
=A0{<br>
@@ -1866,12 +1558,6 @@ void hdmi_attach_ddc_client(struct i2c_client *ddc)<=
br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_ddc =3D ddc;<br>
=A0}<br>
<br>
-void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)<br>
-{<br>
- =A0 =A0 =A0 if (hdmiphy)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmi_hdmiphy =3D hdmiphy;<br>
-}<br>
-<br>
=A0#ifdef CONFIG_OF<br>
=A0static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (struct device *dev)<br>
@@ -2029,20 +1715,11 @@ static int hdmi_probe(struct platform_device *pdev)=
<br>
<br>
=A0 =A0 =A0 =A0 hdata-&gt;ddc_port =3D hdmi_ddc;<br>
<br>
- =A0 =A0 =A0 /* hdmiphy i2c driver */<br>
- =A0 =A0 =A0 if (i2c_add_driver(&amp;hdmiphy_driver)) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to register hdmiphy i2=
c driver\n&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOENT;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_ddc;<br>
- =A0 =A0 =A0 }<br>
-<br>
- =A0 =A0 =A0 hdata-&gt;hdmiphy_port =3D hdmi_hdmiphy;<br>
-<br>
=A0 =A0 =A0 =A0 hdata-&gt;irq =3D gpio_to_irq(hdata-&gt;hpd_gpio);<br>
=A0 =A0 =A0 =A0 if (hdata-&gt;irq &lt; 0) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to get GPIO irq\n&qu=
ot;);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D hdata-&gt;irq;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_hdmiphy;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_ddc;<br>
=A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 hdata-&gt;hpd =3D gpio_get_value(hdata-&gt;hpd_gpio);<br>
@@ -2053,7 +1730,7 @@ static int hdmi_probe(struct platform_device *pdev)<b=
r>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;hdmi&quot;, drm_hdmi_=
ctx);<br>
=A0 =A0 =A0 =A0 if (ret) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to register hdmi int=
errupt\n&quot;);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_hdmiphy;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_ddc;<br>
=A0 =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 /* Attach HDMI Driver to common hdmi. */<br>
@@ -2066,8 +1743,6 @@ static int hdmi_probe(struct platform_device *pdev)<b=
r>
<br>
=A0 =A0 =A0 =A0 return 0;<br>
<br>
-err_hdmiphy:<br>
- =A0 =A0 =A0 i2c_del_driver(&amp;hdmiphy_driver);<br>
=A0err_ddc:<br>
=A0 =A0 =A0 =A0 i2c_del_driver(&amp;ddc_driver);<br>
=A0 =A0 =A0 =A0 return ret;<br>
@@ -2085,9 +1760,6 @@ static int hdmi_remove(struct platform_device *pdev)<=
br>
<br>
=A0 =A0 =A0 =A0 free_irq(hdata-&gt;irq, hdata);<br>
<br>
-<br>
- =A0 =A0 =A0 /* hdmiphy i2c driver */<br>
- =A0 =A0 =A0 i2c_del_driver(&amp;hdmiphy_driver);<br>
=A0 =A0 =A0 =A0 /* DDC i2c driver */<br>
=A0 =A0 =A0 =A0 i2c_del_driver(&amp;ddc_driver);<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.h b/drivers/gpu/drm/exynos/=
exynos_hdmi.h<br>
index 0ddf395..6595d7b 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_hdmi.h<br>
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.h<br>
@@ -15,7 +15,6 @@<br>
=A0#define _EXYNOS_HDMI_H_<br>
<br>
=A0void hdmi_attach_ddc_client(struct i2c_client *ddc);<br>
-void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy);<br>
<br>
=A0extern struct i2c_driver hdmiphy_driver;<br>
=A0extern struct i2c_driver ddc_driver;<br>
diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exyn=
os/exynos_hdmiphy.c<br>
index ea49d13..de7cdfd 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c<br>
@@ -16,33 +16,438 @@<br>
=A0#include &lt;linux/kernel.h&gt;<br>
=A0#include &lt;linux/i2c.h&gt;<br>
=A0#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/pm_runtime.h&gt;<br>
+#include &lt;linux/clk.h&gt;<br>
<br>
=A0#include &quot;exynos_drm_drv.h&quot;<br>
+#include &quot;exynos_drm_hdmi.h&quot;<br>
=A0#include &quot;exynos_hdmi.h&quot;<br>
<br>
+#include &quot;regs-hdmiphy.h&quot;<br>
<br>
-static int hdmiphy_probe(struct i2c_client *client,<br>
- =A0 =A0 =A0 const struct i2c_device_id *id)<br>
+#define HDMIPHY_REG_COUNT =A0 =A0 =A0 =A0 =A0 =A0 =A0(32)<br>
+<br>
+enum hdmiphy_type {<br>
+ =A0 =A0 =A0 HDMIPHY_EXYNOS4210,<br>
+ =A0 =A0 =A0 HDMIPHY_EXYNOS4212,<br>
+};<br>
+<br>
+struct hdmiphy_context {<br>
+ =A0 =A0 =A0 struct device =A0 =A0 =A0 =A0 =A0 *dev;<br>
+ =A0 =A0 =A0 bool =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0powered;<br>
+ =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*parent_ctx;<br>
+ =A0 =A0 =A0 enum hdmiphy_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 type;<br>
+ =A0 =A0 =A0 const struct hdmiphy_config =A0 =A0 *conf;<br>
+ =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*hdmiphy;<br>
+};<br>
+<br>
+struct hdmiphy_config {<br>
+ =A0 =A0 =A0 int pixel_clock;<br>
+ =A0 =A0 =A0 u8 conf[HDMIPHY_REG_COUNT];<br>
+};<br>
+<br>
+/* list of all required phy config settings */<br>
+static const struct hdmiphy_config hdmiphy_4212_configs[] =3D {<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 25200000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x2A, 0x75, 0x40,=
 0x01, 0x00, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0xfc, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xf4, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27000000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x22, 0x51, 0x40,=
 0x08, 0xfc, 0x20,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x98, 0xa0, 0xcb, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x06, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xe4, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27027000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x2d, 0x72, 0x40,=
 0x64, 0x12, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x43, 0xa0, 0x0e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xe3, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 36000000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x2d, 0x55, 0x40,=
 0x01, 0x00, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0x0e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xab, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 40000000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x32, 0x55, 0x40,=
 0x01, 0x00, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0x2c, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x9a, 0x24, 0x00, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 65000000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x36, 0x34, 0x40,=
 0x1e, 0x0a, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0xa0, 0x45, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xbd, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74176000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x3e, 0x35, 0x40,=
 0x5b, 0xde, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0xa0, 0x73, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x56, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xa6, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74250000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x1f, 0x10, 0x40,=
 0x40, 0xf8, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x81, 0xa0, 0xba, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x3c, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xa5, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 83500000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x23, 0x11, 0x40,=
 0x0c, 0xfb, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x85, 0xa0, 0xd1, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x93, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 106500000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x2c, 0x12, 0x40,=
 0x0c, 0x09, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0xa0, 0x0a, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x73, 0x24, 0x01, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 108000000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x51, 0x2d, 0x15, 0x40,=
 0x01, 0x00, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82, 0x80, 0x0e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0xc7, 0x25, 0x03, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 146250000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x3d, 0x15, 0x40,=
 0x18, 0xfd, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x83, 0xa0, 0x6e, 0xd9, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x08, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x50, 0x25, 0x03, 0x00,=
 0x00, 0x01, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 148500000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0xd1, 0x1f, 0x00, 0x40,=
 0x40, 0xf8, 0x08,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x81, 0xa0, 0xba, 0xd8, 0x45,=
 0xa0, 0xac, 0x80,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x3c, 0x80, 0x11, 0x04, 0x02,=
 0x22, 0x44, 0x86,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x54, 0x4b, 0x25, 0x03, 0x00,=
 0x00, 0x01, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+};<br>
+<br>
+static const struct hdmiphy_config hdmiphy_4210_configs[] =3D {<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27000000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,=
 0x1C, 0x30, 0x40,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x02, 0x51, 0xDF,=
 0xF2, 0x54, 0x87,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE3, 0x26, 0x00,=
 0x00, 0x00, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 27027000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD4, 0x10,=
 0x9C, 0x09, 0x64,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6B, 0x10, 0x02, 0x51, 0xDF,=
 0xF2, 0x54, 0x87,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xE3, 0x26, 0x00,=
 0x00, 0x00, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74176000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,=
 0x9C, 0xef, 0x5B,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6D, 0x10, 0x01, 0x51, 0xef,=
 0xF3, 0x54, 0xb9,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x30, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa5, 0x26, 0x01,=
 0x00, 0x00, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 74250000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xd8, 0x10,=
 0x9c, 0xf8, 0x40,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6a, 0x10, 0x01, 0x51, 0xff,=
 0xf1, 0x54, 0xba,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x10, 0x38, 0x00,=
 0x08, 0x10, 0xe0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa4, 0x26, 0x01,=
 0x00, 0x00, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pixel_clock =3D 148500000,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .conf =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x01, 0x05, 0x00, 0xD8, 0x10,=
 0x9C, 0xf8, 0x40,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x6A, 0x18, 0x00, 0x51, 0xff,=
 0xF1, 0x54, 0xba,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x84, 0x00, 0x10, 0x38, 0x00,=
 0x08, 0x10, 0xE0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x40, 0xa4, 0x26, 0x02,=
 0x00, 0x00, 0x00,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 },<br>
+};<br>
+<br>
+static const struct hdmiphy_config *hdmiphy_find_conf(void *ctx,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct drm_display_mode=
 *mode)<br>
+{<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D ctx;<br>
+ =A0 =A0 =A0 const struct hdmiphy_config *confs;<br>
+ =A0 =A0 =A0 int count, i;<br>
+<br>
+ =A0 =A0 =A0 switch (hdata-&gt;type) {<br>
+ =A0 =A0 =A0 case HDMIPHY_EXYNOS4212:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 confs =3D hdmiphy_4212_configs;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 count =3D ARRAY_SIZE(hdmiphy_4212_configs);<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 case HDMIPHY_EXYNOS4210:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 confs =3D hdmiphy_4210_configs;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 count =3D ARRAY_SIZE(hdmiphy_4210_configs);<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to find HDMIPHY type\n=
&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 for (i =3D 0; i &lt; count; i++)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (confs[i].pixel_clock =3D=3D (mode-&gt;clo=
ck * 1000))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return &amp;confs[i];<br>
+<br>
+ =A0 =A0 =A0 return NULL;<br>
+}<br>
+<br>
+static int hdmiphy_check_timing(void *ctx, struct drm_display_mode *mode)<=
br>
=A0{<br>
- =A0 =A0 =A0 hdmi_attach_hdmiphy_client(client);<br>
+ =A0 =A0 =A0 const struct hdmiphy_config *conf;<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;xres=3D%d, yres=3D%d, refresh=3D%d, intl=
=3D%d clock=3D%d\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode-&gt;hdisplay, mode-&gt;vdisplay,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode-&gt;vrefresh, (mode-&gt;flags &amp; DRM_=
MODE_FLAG_INTERLACE)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ? true : false, mode-&gt;clock * 1000);<br>
<br>
- =A0 =A0 =A0 dev_info(&amp;client-&gt;adapter-&gt;dev, &quot;attached s5p_=
hdmiphy &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;into i2c adapter successfully\n&quot;);=
<br>
+ =A0 =A0 =A0 conf =3D hdmiphy_find_conf(ctx, mode);<br>
+ =A0 =A0 =A0 if (!conf) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;Display Mode is not suppo=
rted.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+ =A0 =A0 =A0 }<br>
<br>
=A0 =A0 =A0 =A0 return 0;<br>
=A0}<br>
<br>
-static int hdmiphy_remove(struct i2c_client *client)<br>
+static void hdmiphy_mode_set(void *ctx, struct drm_display_mode *mode)<br>
+{<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D ctx;<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 hdata-&gt;conf =3D hdmiphy_find_conf(ctx, mode);<br>
+}<br>
+<br>
+static void hdmiphy_config_prepare(void *ctx)<br>
+{<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D ctx;<br>
+ =A0 =A0 =A0 const struct i2c_client *client =3D to_i2c_client(hdata-&gt;d=
ev);<br>
+ =A0 =A0 =A0 u8 buffer[2];<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 /* operation mode */<br>
+ =A0 =A0 =A0 buffer[0] =3D HDMIPHY_MODE_SET_DONE;<br>
+ =A0 =A0 =A0 buffer[1] =3D 0x00;<br>
+<br>
+ =A0 =A0 =A0 if (client)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 i2c_master_send(client, buffer, 2);<br>
+}<br>
+<br>
+static int hdmiphy_config_apply(void *ctx)<br>
=A0{<br>
- =A0 =A0 =A0 dev_info(&amp;client-&gt;adapter-&gt;dev, &quot;detached s5p_=
hdmiphy &quot;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;from i2c adapter successfully\n&quot;);=
<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D ctx;<br>
+ =A0 =A0 =A0 struct i2c_client *client =3D to_i2c_client(hdata-&gt;dev);<b=
r>
+ =A0 =A0 =A0 const u8 *hdmiphy_data;<br>
+ =A0 =A0 =A0 u8 buffer[HDMIPHY_REG_COUNT];<br>
+ =A0 =A0 =A0 u8 operation[2];<br>
+ =A0 =A0 =A0 u8 read_buffer[HDMIPHY_REG_COUNT] =3D {0, };<br>
+ =A0 =A0 =A0 int ret;<br>
+ =A0 =A0 =A0 int i;<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 /* pixel clock */<br>
+ =A0 =A0 =A0 if (hdata-&gt;conf &amp;&amp; client)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_data =3D hdata-&gt;conf-&gt;conf;<br>
+ =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;<br>
+<br>
+ =A0 =A0 =A0 memcpy(buffer, hdmiphy_data, HDMIPHY_REG_COUNT);<br>
+<br>
+ =A0 =A0 =A0 ret =3D i2c_master_send(client, buffer, HDMIPHY_REG_COUNT);<b=
r>
+ =A0 =A0 =A0 if (ret !=3D HDMIPHY_REG_COUNT) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to configure HDMIPHY v=
ia I2C\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 usleep_range(10000, 12000);<br>
+<br>
+ =A0 =A0 =A0 /* operation mode */<br>
+ =A0 =A0 =A0 operation[0] =3D HDMIPHY_MODE_SET_DONE;<br>
+ =A0 =A0 =A0 operation[1] =3D HDMIPHY_MODE_EN;<br>
+<br>
+ =A0 =A0 =A0 ret =3D i2c_master_send(client, operation, 2);<br>
+ =A0 =A0 =A0 if (ret !=3D 2) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to enable hdmiphy\n&qu=
ot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 ret =3D i2c_master_recv(client, read_buffer, HDMIPHY_REG_COUN=
T);<br>
+ =A0 =A0 =A0 if (ret &lt; 0) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to read hdmiphy config=
\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 for (i =3D 0; i &lt; ret; i++)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;hdmiphy[0x%02x] wr[0x%02x=
], rd[0x%02x]\n&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i, buffer[i],=
 read_buffer[i]);<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static void hdmiphy_dpms(void *ctx, int mode)<br>
+{<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D ctx;<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d] mode %d\n&quot;, __LINE__, mode);<br=
>
+<br>
+ =A0 =A0 =A0 switch (mode) {<br>
+ =A0 =A0 =A0 case DRM_MODE_DPMS_ON:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pm_runtime_suspended(hdata-&gt;dev))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_runtime_get_sync(hdata-&gt=
;dev);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 case DRM_MODE_DPMS_STANDBY:<br>
+ =A0 =A0 =A0 case DRM_MODE_DPMS_SUSPEND:<br>
+ =A0 =A0 =A0 case DRM_MODE_DPMS_OFF:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pm_runtime_suspended(hdata-&gt;dev))<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_runtime_put_sync(hdata-&gt=
;dev);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 default:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;unknown dpms mode: %d\n&q=
uot;, mode);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
+ =A0 =A0 =A0 }<br>
+}<br>
+<br>
+static int hdmiphy_update_bits(struct i2c_client *client, u8 *reg_cache,<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u8 reg, u8 mas=
k, u8 val)<br>
+{<br>
+ =A0 =A0 =A0 int ret;<br>
+ =A0 =A0 =A0 u8 buffer[2];<br>
+<br>
+ =A0 =A0 =A0 buffer[0] =3D reg;<br>
+ =A0 =A0 =A0 buffer[1] =3D (reg_cache[reg] &amp; ~mask) | (val &amp; mask)=
;<br>
+ =A0 =A0 =A0 reg_cache[reg] =3D buffer[1];<br>
+<br>
+ =A0 =A0 =A0 ret =3D i2c_master_send(client, buffer, 2);<br>
+ =A0 =A0 =A0 if (ret !=3D 2)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;<br>
<br>
=A0 =A0 =A0 =A0 return 0;<br>
=A0}<br>
<br>
+static int hdmiphy_4412_turn_on(struct i2c_client *client, bool on)<br>
+{<br>
+ =A0 =A0 =A0 u8 reg_cache[HDMIPHY_REG_COUNT] =3D { 0 };<br>
+ =A0 =A0 =A0 u8 buffer[2];<br>
+ =A0 =A0 =A0 int ret;<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;hdmiphy is %s\n&quot;, on ? &quot;on&quot=
; : &quot;off&quot;);<br>
+<br>
+ =A0 =A0 =A0 /* Cache all hdmi-phy registers to make the code below faster=
 */<br>
+ =A0 =A0 =A0 buffer[0] =3D 0x0;<br>
+ =A0 =A0 =A0 ret =3D i2c_master_send(client, buffer, 1);<br>
+ =A0 =A0 =A0 if (ret !=3D 1) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+ =A0 =A0 =A0 }<br>
+ =A0 =A0 =A0 ret =3D i2c_master_recv(client, reg_cache, HDMIPHY_REG_COUNT)=
;<br>
+ =A0 =A0 =A0 if (ret !=3D HDMIPHY_REG_COUNT) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 /* Change to/from configuration from/to operation mode */<br>
+ =A0 =A0 =A0 ret =3D hdmiphy_update_bits(client, reg_cache, HDMIPHY_MODE_S=
ET_DONE,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMIPHY_MODE_=
EN, on ? ~0 : 0);<br>
+ =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+<br>
+ =A0 =A0 =A0 /*<br>
+ =A0 =A0 =A0 =A0* Turn off &quot;oscpad&quot; if !on; it turns on again in=
<br>
+ =A0 =A0 =A0 =A0* during phy-configuration.<br>
+ =A0 =A0 =A0 =A0*/<br>
+ =A0 =A0 =A0 if (!on)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D hdmiphy_update_bits(client, reg_cache=
,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMIPHY_4212_OSC_PAD_CON, HDM=
IPHY_OSC_PAD_EN, 0);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+<br>
+ =A0 =A0 =A0 /* Disable powerdown if on; enable if !on */<br>
+ =A0 =A0 =A0 ret =3D hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_P=
D_CON,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMIPHY_PDEN, on ? 0 : ~0);<b=
r>
+ =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+ =A0 =A0 =A0 ret =3D hdmiphy_update_bits(client, reg_cache, HDMIPHY_4212_P=
D_CON,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMIPHY_PD_ALL, on ? 0 : ~0);=
<br>
+ =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+<br>
+ =A0 =A0 =A0 /* Disable pixel clock generator block if !on */<br>
+ =A0 =A0 =A0 if (!on)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D hdmiphy_update_bits(client, reg_cache=
,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMIPHY_4212_PCG_CON, HDMIPHY=
_PCG_RESET_EN, 0);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;<br>
+<br>
+exit:<br>
+ =A0 =A0 =A0 /* Don&#39;t expect any errors so just do a single warn */<br=
>
+ =A0 =A0 =A0 WARN_ON(ret);<br>
+<br>
+ =A0 =A0 =A0 return ret;<br>
+}<br>
+<br>
+static struct exynos_hdmiphy_ops hdmiphy_ops =3D {<br>
+ =A0 =A0 =A0 .check_timing =A0 =3D hdmiphy_check_timing,<br>
+ =A0 =A0 =A0 .mode_set =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D hdmiphy_mode_set,<b=
r>
+ =A0 =A0 =A0 .prepare =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D hdmiphy_config_pr=
epare,<br>
+ =A0 =A0 =A0 .config_apply =A0 =3D hdmiphy_config_apply,<br>
+ =A0 =A0 =A0 .dpms =A0 =A0 =A0 =A0 =A0 =3D hdmiphy_dpms,<br>
+};<br>
+<br>
=A0static const struct i2c_device_id hdmiphy_id[] =3D {<br>
- =A0 =A0 =A0 { &quot;s5p_hdmiphy&quot;, 0 },<br>
- =A0 =A0 =A0 { &quot;exynos5-hdmiphy&quot;, 0 },<br>
+ =A0 =A0 =A0 { &quot;s5p_hdmiphy&quot;, HDMIPHY_EXYNOS4210 },<br>
+ =A0 =A0 =A0 { &quot;exynos5-hdmiphy&quot;, HDMIPHY_EXYNOS4212 },<br>
=A0 =A0 =A0 =A0 { },<br>
=A0};<br>
<br>
@@ -50,21 +455,181 @@ static const struct i2c_device_id hdmiphy_id[] =3D {<=
br>
=A0static struct of_device_id hdmiphy_match_types[] =3D {<br>
=A0 =A0 =A0 =A0 {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D &quot;samsung,exynos5-hdmip=
hy&quot;,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =A0 =3D (void *)HDMIPHY_EXYNOS4212,<br>
=A0 =A0 =A0 =A0 }, {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* end node */<br>
=A0 =A0 =A0 =A0 }<br>
=A0};<br>
=A0#endif<br>
<br>
+static int hdmiphy_probe(struct i2c_client *client,<br>
+ =A0 =A0 =A0 const struct i2c_device_id *id)<br>
+{<br>
+ =A0 =A0 =A0 struct device *dev =3D &amp;client-&gt;dev;<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata;<br>
+ =A0 =A0 =A0 struct exynos_drm_hdmi_context *drm_hdmi_ctx;<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 drm_hdmi_ctx =3D devm_kzalloc(dev, sizeof(*drm_hdmi_ctx),<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 GFP_KERNEL);<br>
+ =A0 =A0 =A0 if (!drm_hdmi_ctx) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to allocate common hdm=
i context.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 hdata =3D devm_kzalloc(dev, sizeof(*hdata), GFP_KERNEL);<br>
+ =A0 =A0 =A0 if (!hdata) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to allocate hdmiphy co=
ntext.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 if (dev-&gt;of_node) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_id *match;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(of_match_ptr(hdmiphy_=
match_types),<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 dev-&gt;of_node);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (match =3D=3D NULL)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdata-&gt;type =3D (enum hdmiphy_type)match-&=
gt;data;<br>
+ =A0 =A0 =A0 } else {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdata-&gt;type =3D (enum hdmiphy_type)id-&gt;=
driver_data;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 drm_hdmi_ctx-&gt;ctx =3D (void *)hdata;<br>
+ =A0 =A0 =A0 hdata-&gt;parent_ctx =3D (void *)drm_hdmi_ctx;<br>
+ =A0 =A0 =A0 hdata-&gt;dev =3D dev;<br>
+<br>
+ =A0 =A0 =A0 hdata-&gt;hdmiphy =3D devm_clk_get(dev, &quot;hdmiphy&quot;);=
<br>
+ =A0 =A0 =A0 if (IS_ERR_OR_NULL(hdata-&gt;hdmiphy)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to get clock &#39;hdmi=
phy&#39;\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(hdata-&gt;hdmiphy);<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 i2c_set_clientdata(client, hdata);<br>
+<br>
+ =A0 =A0 =A0 /* Attach HDMI-PHY Driver to common hdmi. */<br>
+ =A0 =A0 =A0 exynos_hdmiphy_drv_attach(drm_hdmi_ctx);<br>
+<br>
+ =A0 =A0 =A0 /* register specific callbacks to common hdmi. */<br>
+ =A0 =A0 =A0 exynos_hdmiphy_ops_register(&amp;hdmiphy_ops);<br>
+<br>
+ =A0 =A0 =A0 pm_runtime_enable(dev);<br>
+<br>
+ =A0 =A0 =A0 dev_info(&amp;client-&gt;adapter-&gt;dev,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;attached s5p_hdmiphy into i2c adapter s=
uccessfully\n&quot;);<br>
+<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static int hdmiphy_remove(struct i2c_client *client)<br>
+{<br>
+ =A0 =A0 =A0 dev_info(&amp;client-&gt;adapter-&gt;dev,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;detached s5p_hdmiphy from i2c adapter s=
uccessfully\n&quot;);<br>
+<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static void hdmiphy_poweroff(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 struct i2c_client *client =3D to_i2c_client(dev);<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D i2c_get_clientdata(client);=
<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMIPHY_EXYNOS4212)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_4412_turn_on(client, 0);<br>
+<br>
+ =A0 =A0 =A0 clk_disable(hdata-&gt;hdmiphy);<br>
+}<br>
+<br>
+static void hdmiphy_poweron(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 struct i2c_client *client =3D to_i2c_client(dev);<br>
+ =A0 =A0 =A0 struct hdmiphy_context *hdata =3D i2c_get_clientdata(client);=
<br>
+<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 clk_enable(hdata-&gt;hdmiphy);<br>
+<br>
+ =A0 =A0 =A0 if (hdata-&gt;type =3D=3D HDMIPHY_EXYNOS4212)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_4412_turn_on(client, 1);<br>
+}<br>
+<br>
+#ifdef CONFIG_PM_SLEEP<br>
+static int hdmiphy_suspend(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 if (pm_runtime_suspended(dev)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;already runtime-suspended=
.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 hdmiphy_poweroff(dev);<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static int hdmiphy_resume(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 if (pm_runtime_suspended(dev)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* dpms callback should resume the mixer. */<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;already runtime-suspended=
.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 hdmiphy_poweron(dev);<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+#endif<br>
+<br>
+<br>
+#ifdef CONFIG_PM_RUNTIME<br>
+static int hdmiphy_runtime_suspend(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 hdmiphy_poweroff(dev);<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+<br>
+static int hdmiphy_runtime_resume(struct device *dev)<br>
+{<br>
+ =A0 =A0 =A0 DRM_DEBUG_KMS(&quot;[%d]\n&quot;, __LINE__);<br>
+<br>
+ =A0 =A0 =A0 hdmiphy_poweron(dev);<br>
+ =A0 =A0 =A0 return 0;<br>
+}<br>
+#endif<br>
+<br>
+static const struct dev_pm_ops hdmiphy_pm_ops =3D {<br>
+ =A0 =A0 =A0 SET_SYSTEM_SLEEP_PM_OPS(hdmiphy_suspend, hdmiphy_resume)<br>
+ =A0 =A0 =A0 SET_RUNTIME_PM_OPS(hdmiphy_runtime_suspend,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 hdmiphy_runtime_resume, NULL)<br>
+};<br>
+<br>
=A0struct i2c_driver hdmiphy_driver =3D {<br>
=A0 =A0 =A0 =A0 .driver =3D {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D &quot;exynos-hdmiphy&quot;,<b=
r>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(hdmiphy_ma=
tch_types),<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0 =3D &amp;hdmiphy_pm_ops,<br>
=A0 =A0 =A0 =A0 },<br>
=A0 =A0 =A0 =A0 .id_table =3D hdmiphy_id,<br>
=A0 =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D hdmiphy_probe,<br>
=A0 =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D hdmiphy_remove,<br>
=A0 =A0 =A0 =A0 .command =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D NULL,<br>
=A0};<br>
+<br>
+extern int exynos_hdmiphy_driver_register(void)<br>
+{<br>
+ =A0 =A0 =A0 return i2c_add_driver(&amp;hdmiphy_driver);<br>
+}<br>
+<br>
+extern void exynos_hdmiphy_driver_unregister(void)<br>
+{<br>
+ =A0 =A0 =A0 i2c_del_driver(&amp;hdmiphy_driver);<br>
+}<br>
+<br>
=A0EXPORT_SYMBOL(hdmiphy_driver);<br>
diff --git a/drivers/gpu/drm/exynos/regs-hdmiphy.h b/drivers/gpu/drm/exynos=
/regs-hdmiphy.h<br>
new file mode 100644<br>
index 0000000..1bb0860<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/exynos/regs-hdmiphy.h<br>
@@ -0,0 +1,61 @@<br>
+/*<br>
+ *<br>
+ * =A0regs-hdmiphy.h<br>
+ *<br>
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.<br>
+ * <a href=3D"http://www.samsung.com/" target=3D"_blank">http://www.samsun=
g.com/</a><br>
+ *<br>
+ * HDMI-PHY register header file for Samsung TVOUT driver<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+*/<br>
+<br>
+#ifndef SAMSUNG_REGS_HDMIPHY_H<br>
+#define SAMSUNG_REGS_HDMIPHY_H<br>
+<br>
+/*<br>
+ * Register part<br>
+*/<br>
+<br>
+/* HDMI PHY Version Common */<br>
+#define HDMIPHY_MODE_SET_DONE =A0 =A0 =A0 =A0 =A0(0x1f)<br>
+<br>
+/* HDMI PHY Version 4212 */<br>
+#define HDMIPHY_4212_PCG_CON =A0 =A0 =A0 =A0 =A0 (0x04)<br>
+#define HDMIPHY_4212_OSC_PAD_CON =A0 =A0 =A0 (0x0b)<br>
+#define HDMIPHY_4212_PD_CON =A0 =A0 =A0 =A0 =A0 =A0(0x1d)<br>
+<br>
+/*<br>
+ * Bit definition part<br>
+ */<br>
+<br>
+/* HDMIPHY_MODE_SET_DONE */<br>
+#define HDMIPHY_MODE_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 7)<br>
+<br>
+/* HDMIPHY_4212_PCG_CON */<br>
+#define HDMIPHY_PCG_RESET_EN =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 3)<br>
+<br>
+/* HDMIPHY_4212_OSC_PAD_CON */<br>
+#define HDMIPHY_OSC_PAD_EN =A0 =A0 =A0 =A0 =A0 =A0 (3 &lt;&lt; 6)<br>
+<br>
+/* HDMIPHY_4212_PD_CON */<br>
+#define HDMIPHY_PDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 7)<br=
>
+<br>
+#define HDMIPHY_PLL_PD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 6)<br>
+#define HDMIPHY_CLKSER_PD =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 5)<br>
+#define HDMIPHY_CLKDRV_PD =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 4)<br>
+<br>
+#define HDMIPHY_DRV_PD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 2)<br>
+#define HDMIPHY_SER_PD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 1)<br>
+#define HDMIPHY_ICLK_PD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 0)<br>
+<br>
+#define HDMIPHY_PD_ALL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (HDMIPHY_PLL_PD |\<=
br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 HDMIPHY_CLKSER_PD |\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 HDMIPHY_CLKDRV_PD|\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 HDMIPHY_DRV_PD|\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 HDMIPHY_SER_PD|\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 HDMIPHY_ICLK_PD)<br>
+<br>
+#endif /* SAMSUNG_REGS_HDMIPHY_H */<br>
--<br>
1.7.10.4<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br></div></div>

--089e012292fafe534904db78a619--

--===============1128993691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1128993691==--

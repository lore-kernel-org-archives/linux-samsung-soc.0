From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 4/7] drm/exynos: add support for exynos5420 hdmiphy
Date: Tue, 3 Sep 2013 12:15:44 -0400
Message-ID: <CAOw6vb+X9Z3QVcKcdB9snO7NPyFH_ZMRGxypgDHdst6gyo5wSw@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com> <1377845974-28373-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:42805 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754820Ab3ICQQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 12:16:07 -0400
Received: by mail-ob0-f181.google.com with SMTP id dn14so5962373obc.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 09:16:06 -0700 (PDT)
Received: by mail-ob0-f180.google.com with SMTP id v19so6062962obq.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 09:16:04 -0700 (PDT)
In-Reply-To: <1377845974-28373-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com, sunil joshi <joshi@samsung.com>, "r.sh.open" <r.sh.open@gmail.com>

On Fri, Aug 30, 2013 at 2:59 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Exynos5420 hdmiphy device is a platform device, unlike
> predecessor SoCs where it used to be a I2C device. This
> support is added to the hdmiphy driver.
>

Stuffing a platform driver in the same place as your i2c driver seems
weird. I think you should split them up.

> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmiphy.c |  224 ++++++++++++++++++++++++++++++-
>  1 file changed, 221 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> index b1b8a0f..33e89d9 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> @@ -32,6 +32,7 @@ struct hdmiphy_context {
>
>         /* hdmiphy resources */
>         void __iomem            *phy_pow_ctrl_reg;
> +       void __iomem            *regs;
>
>         struct hdmiphy_config   *confs;
>         unsigned int            nr_confs;
> @@ -48,6 +49,135 @@ struct hdmiphy_drv_data {
>  };
>
>  /* list of all required phy config settings */
> +static struct hdmiphy_config hdmiphy_5420_configs[] = {
> +       {
> +               .pixel_clock = 25200000,
> +               .conf = {
> +                       0x01, 0x52, 0x3F, 0x55, 0x40, 0x01, 0x00, 0xC8,
> +                       0x82, 0xC8, 0xBD, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x06, 0x80, 0x01, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xF4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 27000000,
> +               .conf = {
> +                       0x01, 0xD1, 0x22, 0x51, 0x40, 0x08, 0xFC, 0xE0,
> +                       0x98, 0xE8, 0xCB, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x06, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xE4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 27027000,
> +               .conf = {
> +                       0x01, 0xD1, 0x2D, 0x72, 0x40, 0x64, 0x12, 0xC8,
> +                       0x43, 0xE8, 0x0E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x06, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xE3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 36000000,
> +               .conf = {
> +                       0x01, 0x51, 0x2D, 0x55, 0x40, 0x40, 0x00, 0xC8,
> +                       0x02, 0xC8, 0x0E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xAB, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 40000000,
> +               .conf = {
> +                       0x01, 0xD1, 0x21, 0x31, 0x40, 0x3C, 0x28, 0xC8,
> +                       0x87, 0xE8, 0xC8, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0x9A, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 65000000,
> +               .conf = {
> +                       0x01, 0xD1, 0x36, 0x34, 0x40, 0x0C, 0x04, 0xC8,
> +                       0x82, 0xE8, 0x45, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xBD, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 71000000,
> +               .conf = {
> +                       0x01, 0xD1, 0x3B, 0x35, 0x40, 0x0C, 0x04, 0xC8,
> +                       0x85, 0xE8, 0x63, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0x57, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 74176000,
> +               .conf = {
> +                       0x01, 0xD1, 0x1F, 0x10, 0x40, 0x5B, 0xEF, 0xC8,
> +                       0x81, 0xE8, 0xB9, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x56, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xA6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 74250000,
> +               .conf = {
> +                       0x01, 0xD1, 0x1F, 0x10, 0x40, 0x40, 0xF8, 0xC8,
> +                       0x81, 0xE8, 0xBA, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x56, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xA5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 83500000,
> +               .conf = {
> +                       0x01, 0xD1, 0x23, 0x11, 0x40, 0x0C, 0xFB, 0xC8,
> +                       0x85, 0xE8, 0xD1, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0x4A, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 106500000,
> +               .conf = {
> +                       0x01, 0xD1, 0x2C, 0x12, 0x40, 0x0C, 0x09, 0xC8,
> +                       0x84, 0xE8, 0x0A, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 108000000,
> +               .conf = {
> +                       0x01, 0x51, 0x2D, 0x15, 0x40, 0x01, 0x00, 0xC8,
> +                       0x82, 0xC8, 0x0E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0xC7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 146250000,
> +               .conf = {
> +                       0x01, 0xD1, 0x3D, 0x15, 0x40, 0x18, 0xFD, 0xC8,
> +                       0x83, 0xE8, 0x6E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0x54, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +       {
> +               .pixel_clock = 148500000,
> +               .conf = {
> +                       0x01, 0xD1, 0x1F, 0x00, 0x40, 0x40, 0xF8, 0xC8,
> +                       0x81, 0xE8, 0xBA, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +                       0x66, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x66,
> +                       0x54, 0x4B, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> +               },
> +       },
> +};

Same comment here about these being board-specific. It would be nice
to come to consensus about putting this stuff in dt before moving too
far forward.

> +
>  static struct hdmiphy_config hdmiphy_4212_configs[] = {
>         {
>                 .pixel_clock = 25200000,
> @@ -290,7 +420,8 @@ static int hdmiphy_reg_writeb(struct hdmiphy_context *hdata,
>                         return 0;
>                 return ret;
>         } else {
> -               return -EINVAL;
> +               writeb(value, hdata->regs + (reg_offset<<2));
> +               return 0;
>         }
>  }
>
> @@ -309,7 +440,11 @@ static int hdmiphy_reg_write_buf(struct hdmiphy_context *hdata,
>                         return 0;
>                 return ret;
>         } else {
> -               return -EINVAL;
> +               int i;
> +               for (i = 0; i < len; i++)
> +                       writeb(buf[i], hdata->regs +
> +                               ((reg_offset + i)<<2));
> +               return 0;
>         }
>  }
>
> @@ -457,6 +592,11 @@ int exynos_hdmiphy_conf_apply(struct device *dev)
>         return 0;
>  }
>
> +static struct hdmiphy_drv_data exynos5420_hdmiphy_drv_data = {
> +       .confs = hdmiphy_5420_configs,
> +       .count = ARRAY_SIZE(hdmiphy_5420_configs)
> +};
> +
>  static struct hdmiphy_drv_data exynos4212_hdmiphy_drv_data = {
>         .confs = hdmiphy_4212_configs,
>         .count = ARRAY_SIZE(hdmiphy_4212_configs)
> @@ -482,6 +622,67 @@ static struct of_device_id hdmiphy_i2c_device_match_types[] = {
>         }
>  };
>
> +static struct of_device_id hdmiphy_platform_device_match_types[] = {
> +       {
> +               .compatible = "samsung,exynos5420-hdmiphy",
> +               .data   = &exynos5420_hdmiphy_drv_data,
> +       }, {
> +               /* end node */
> +       }
> +};
> +
> +static int hdmiphy_platform_device_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct hdmiphy_context *hdata;
> +       struct hdmiphy_drv_data *drv;
> +       struct resource *res;
> +       const struct of_device_id *match;
> +       int ret;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       hdata = devm_kzalloc(dev, sizeof(*hdata), GFP_KERNEL);
> +       if (!hdata) {
> +               DRM_ERROR("failed to allocate hdmiphy context.\n");
> +               return -ENOMEM;
> +       }
> +
> +       match = of_match_node(of_match_ptr(
> +               hdmiphy_platform_device_match_types),
> +               dev->of_node);
> +
> +       if (match == NULL)

if (!match) should do the trick

> +               return -ENODEV;
> +
> +       drv = (struct hdmiphy_drv_data *)match->data;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               DRM_ERROR("failed to find phy registers\n");
> +               return -ENOENT;
> +       }
> +
> +       hdata->regs = devm_request_and_ioremap(&pdev->dev, res);
> +       if (!hdata->regs) {
> +               DRM_ERROR("failed to map registers\n");
> +               return -ENXIO;
> +       }
> +
> +       hdata->dev = dev;
> +       hdata->confs = drv->confs;
> +       hdata->nr_confs = drv->count;
> +
> +       platform_set_drvdata(pdev, hdata);
> +       ret = hdmiphy_dt_parse_power_control(hdata);
> +       if (ret) {
> +               DRM_ERROR("failed to map hdmiphy pow control reg.\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int hdmiphy_i2c_device_probe(struct i2c_client *client,
>         const struct i2c_device_id *id)
>  {
> @@ -538,18 +739,35 @@ struct i2c_driver hdmiphy_i2c_driver = {
>         .command                = NULL,
>  };
>
> +struct platform_driver hdmiphy_platform_driver = {
> +       .driver = {
> +               .name   = "exynos-hdmiphy",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = of_match_ptr(
> +                               hdmiphy_platform_device_match_types),
> +       },
> +       .probe          = hdmiphy_platform_device_probe,
> +};
> +
>  int exynos_hdmiphy_driver_register(void)
>  {
>         int ret;
>
>         ret = i2c_add_driver(&hdmiphy_i2c_driver);
>         if (ret)
> -               return ret;
> +               goto err;
> +
> +       ret = platform_driver_register(&hdmiphy_platform_driver);
> +       if (ret)
> +               goto err;
>
>         return 0;
> +err:
> +       return ret;
>  }
>
>  void exynos_hdmiphy_driver_unregister(void)
>  {
>         i2c_del_driver(&hdmiphy_i2c_driver);
> +       platform_driver_unregister(&hdmiphy_platform_driver);
>  }
> --
> 1.7.10.4
>

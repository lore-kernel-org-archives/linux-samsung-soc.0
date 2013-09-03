From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Tue, 3 Sep 2013 10:45:29 -0400
Message-ID: <CAOw6vb+2gspWDcTgqt24Mf-Bxusoi5_jr2GR+i=gmG+nmCdNzg@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com> <1377845974-28373-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:49874 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755875Ab3ICOpx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 10:45:53 -0400
Received: by mail-ob0-f174.google.com with SMTP id wd6so5908823obb.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 07:45:53 -0700 (PDT)
Received: by mail-ob0-f173.google.com with SMTP id ta17so5887074obb.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 07:45:49 -0700 (PDT)
In-Reply-To: <1377845974-28373-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com, sunil joshi <joshi@samsung.com>, "r.sh.open" <r.sh.open@gmail.com>

A few comments.

On Fri, Aug 30, 2013 at 2:59 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Exynos hdmiphy operations and configs are kept inside
> the hdmi driver. Hdmiphy related code is tightly coupled
> with hdmi IP driver.
>
> This patche moves hdmiphy related code to hdmiphy driver.

s/patche/patch

> It will help in cleanly supporting the hdmiphy variations
> in further SoCs.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  .../devicetree/bindings/video/exynos_hdmi.txt      |    2 +
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h           |   11 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  343 +++------------
>  drivers/gpu/drm/exynos/exynos_hdmiphy.c            |  438 +++++++++++++++++++-
>  drivers/gpu/drm/exynos/regs-hdmiphy.h              |   35 ++
>  5 files changed, 533 insertions(+), 296 deletions(-)
>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index 50decf8..240eca5 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -25,6 +25,7 @@ Required properties:
>                 sclk_pixel.
>  - clock-names: aliases as per driver requirements for above clock IDs:
>         "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
> +- phy: it points to hdmiphy dt node.
>  Example:
>
>         hdmi {
> @@ -32,4 +33,5 @@ Example:
>                 reg = <0x14530000 0x100000>;
>                 interrupts = <0 95 0>;
>                 hpd-gpio = <&gpx3 7 1>;
> +               phy = <&hdmiphy>;
>         };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> index 724cab1..1c839f8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -64,4 +64,15 @@ void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
>  void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
>  void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
>  void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);
> +
> +int exynos_hdmiphy_driver_register(void);
> +void exynos_hdmiphy_driver_unregister(void);
> +
> +void exynos_hdmiphy_enable(struct device *dev);
> +void exynos_hdmiphy_disable(struct device *dev);
> +int exynos_hdmiphy_check_mode(struct device *dev,
> +                               struct drm_display_mode *mode);
> +int exynos_hdmiphy_set_mode(struct device *dev,
> +                               struct drm_display_mode *mode);
> +int exynos_hdmiphy_conf_apply(struct device *dev);
>  #endif
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index f67ffca..3af4e4c 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -34,6 +34,8 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
> +#include <linux/of_i2c.h>
> +#include <linux/of_platform.h>
>
>  #include <drm/exynos_drm.h>
>
> @@ -172,7 +174,6 @@ struct hdmi_v14_conf {
>  };
>
>  struct hdmi_conf_regs {
> -       int pixel_clock;
>         int cea_video_id;
>         union {
>                 struct hdmi_v13_conf v13_conf;
> @@ -193,9 +194,9 @@ struct hdmi_context {
>         int                             irq;
>
>         struct i2c_client               *ddc_port;
> -       struct i2c_client               *hdmiphy_port;
> +       struct device                   *hdmiphy_dev;
>
> -       /* current hdmiphy conf regs */
> +       /* current hdmi ip configuration registers. */
>         struct hdmi_conf_regs           mode_conf;
>
>         struct hdmi_resources           res;
> @@ -205,180 +206,6 @@ struct hdmi_context {
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
> @@ -769,28 +596,6 @@ static struct edid *hdmi_get_edid(void *ctx, struct drm_connector *connector)
>         return raw_edid;
>  }
>
> -static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
> -{
> -       const struct hdmiphy_config *confs;
> -       int count, i;
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
>  static int hdmi_check_mode(void *ctx, struct drm_display_mode *mode)
>  {
>         struct hdmi_context *hdata = ctx;
> @@ -801,7 +606,7 @@ static int hdmi_check_mode(void *ctx, struct drm_display_mode *mode)
>                 (mode->flags & DRM_MODE_FLAG_INTERLACE) ? true :
>                 false, mode->clock * 1000);
>
> -       ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
> +       ret = exynos_hdmiphy_check_mode(hdata->hdmiphy_dev, mode);
>         if (ret < 0)
>                 return ret;
>         return 0;
> @@ -1302,19 +1107,13 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
>
>  static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>  {
> -       u8 buffer[2];
>         u32 reg;
>
>         clk_disable_unprepare(hdata->res.sclk_hdmi);
>         clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
>         clk_prepare_enable(hdata->res.sclk_hdmi);
>
> -       /* operation mode */
> -       buffer[0] = 0x1f;
> -       buffer[1] = 0x00;
> -
> -       if (hdata->hdmiphy_port)
> -               i2c_master_send(hdata->hdmiphy_port, buffer, 2);
> +       exynos_hdmiphy_disable(hdata->hdmiphy_dev);
>
>         if (hdata->type == HDMI_TYPE13)
>                 reg = HDMI_V13_PHY_RSTOUT;
> @@ -1342,66 +1141,12 @@ static void hdmiphy_poweroff(struct hdmi_context *hdata)
>                         HDMI_PHY_POWER_OFF_EN);
>  }
>
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
> -       if (hdata->type == HDMI_TYPE13)
> -               hdmiphy_data = hdmiphy_v13_configs[i].conf;
> -       else
> -               hdmiphy_data = hdmiphy_v14_configs[i].conf;
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
>  static void hdmi_conf_apply(struct hdmi_context *hdata)
>  {
>         hdmiphy_conf_reset(hdata);
> -       hdmiphy_conf_apply(hdata);
> +       exynos_hdmiphy_conf_apply(hdata->hdmiphy_dev);
> +       usleep_range(10000, 12000);

This delay seems like something that should be in the phy driver,
instead of the hdmi driver (since it seems conceivable that certain
phys might not need a delay or might need a longer delay).

> +       exynos_hdmiphy_enable(hdata->hdmiphy_dev);
>
>         mutex_lock(&hdata->hdmi_mutex);
>         hdmi_conf_reset(hdata);
> @@ -1434,7 +1179,6 @@ static void hdmi_v13_mode_set(struct hdmi_context *hdata,
>
>         hdata->mode_conf.cea_video_id =
>                 drm_match_cea_mode((struct drm_display_mode *)m);
> -       hdata->mode_conf.pixel_clock = m->clock * 1000;
>
>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>         hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
> @@ -1530,7 +1274,6 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
>
>         hdata->mode_conf.cea_video_id =
>                 drm_match_cea_mode((struct drm_display_mode *)m);
> -       hdata->mode_conf.pixel_clock = m->clock * 1000;
>
>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>         hdmi_set_reg(core->v_line, 2, m->vtotal);
> @@ -1646,6 +1389,8 @@ static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
>                 hdmi_v13_mode_set(hdata, mode);
>         else
>                 hdmi_v14_mode_set(hdata, mode);
> +
> +       exynos_hdmiphy_set_mode(hdata->hdmiphy_dev, mode);

Why set_mode when everything else is mode_set?

>  }
>
>  static void hdmi_get_max_resol(void *ctx, unsigned int *width,
> @@ -1824,7 +1569,7 @@ fail:
>         return -ENODEV;
>  }
>
> -static struct i2c_client *hdmi_ddc, *hdmi_hdmiphy;
> +static struct i2c_client *hdmi_ddc;
>
>  void hdmi_attach_ddc_client(struct i2c_client *ddc)
>  {
> @@ -1832,12 +1577,6 @@ void hdmi_attach_ddc_client(struct i2c_client *ddc)
>                 hdmi_ddc = ddc;
>  }
>
> -void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
> -{
> -       if (hdmiphy)
> -               hdmi_hdmiphy = hdmiphy;
> -}
> -
>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>                                         (struct device *dev)
>  {
> @@ -1862,6 +1601,50 @@ err_data:
>         return NULL;
>  }
>
> +static int hdmi_get_phy_device(struct hdmi_context *hdata)

"get" is not the proper verb here, "initialize" would be more
appropriate (IMO, of course).

> +{
> +       struct device_node *np;
> +       struct i2c_client *client;
> +       struct platform_device *pdev;
> +       int ret;
> +
> +       /* register hdmiphy driver */
> +       ret = exynos_hdmiphy_driver_register();
> +       if (ret) {
> +               DRM_ERROR("failed to register hdmiphy driver\n");

Printing ret would be useful here.

> +               goto err;
> +       }
> +
> +       np = of_parse_phandle(hdata->dev->of_node, "phy", 0);
> +       if (!np) {
> +               DRM_ERROR("Could not find 'phy' property\n");
> +               ret = -ENOENT;
> +               goto err;
> +       }
> +
> +       /* find hdmi phy on i2c bus */
> +       client = of_find_i2c_device_by_node(np);
> +       if (client) {
> +               hdata->hdmiphy_dev = &client->dev;
> +               ret = 0;
> +               goto exit;
> +       }
> +
> +       /* find hdmi phy on platform bus */
> +       pdev = of_find_device_by_node(np);
> +       if (pdev) {
> +               hdata->hdmiphy_dev = &pdev->dev;
> +               ret = 0;
> +               goto exit;
> +       }
> +
> +exit:
> +       /* able to find hdmiphy on platform/i2c bus */
> +err:

Probably just easier to have one "exit" or "out" label that just returns ret.

> +       of_node_put(np);
> +       return ret;
> +}
> +
>  static struct of_device_id hdmi_match_types[] = {
>         {
>                 .compatible = "samsung,exynos5-hdmi",
> @@ -1939,15 +1722,13 @@ static int hdmi_probe(struct platform_device *pdev)
>
>         hdata->ddc_port = hdmi_ddc;
>
> -       /* hdmiphy i2c driver */
> -       if (i2c_add_driver(&hdmiphy_driver)) {
> -               DRM_ERROR("failed to register hdmiphy i2c driver\n");
> +       ret = hdmi_get_phy_device(hdata);
> +       if (ret) {
> +               DRM_ERROR("failed to get hdmiphy device\n");

Printing ret would be useful.


>                 ret = -ENOENT;

Why change the return value here?

>                 goto err_ddc;
>         }
>
> -       hdata->hdmiphy_port = hdmi_hdmiphy;
> -
>         hdata->irq = gpio_to_irq(hdata->hpd_gpio);
>         if (hdata->irq < 0) {
>                 DRM_ERROR("failed to get GPIO irq\n");
> @@ -1977,7 +1758,7 @@ static int hdmi_probe(struct platform_device *pdev)
>         return 0;
>
>  err_hdmiphy:
> -       i2c_del_driver(&hdmiphy_driver);
> +       exynos_hdmiphy_driver_unregister();
>  err_ddc:
>         i2c_del_driver(&ddc_driver);
>         return ret;
> @@ -1989,8 +1770,8 @@ static int hdmi_remove(struct platform_device *pdev)
>
>         pm_runtime_disable(dev);
>
> -       /* hdmiphy i2c driver */
> -       i2c_del_driver(&hdmiphy_driver);
> +       /* hdmiphy driver */
> +       exynos_hdmiphy_driver_unregister();
>         /* DDC i2c driver */
>         i2c_del_driver(&ddc_driver);
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> index 59abb14..82daa42 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> @@ -15,51 +15,459 @@
>
>  #include <linux/kernel.h>
>  #include <linux/i2c.h>
> -#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
>
>  #include "exynos_drm_drv.h"
>  #include "exynos_hdmi.h"
> +#include "exynos_drm_hdmi.h"
> +#include "regs-hdmiphy.h"
>
> +#define HDMIPHY_REG_COUNT      (32)

This probably belongs in regs-hdmiphy.h instead of here. Also remove the ()

>
> -static int hdmiphy_probe(struct i2c_client *client,
> -       const struct i2c_device_id *id)
> +struct hdmiphy_context {
> +       struct device           *dev;
> +       struct hdmiphy_config   *current_conf;
> +
> +       struct hdmiphy_config   *confs;
> +       unsigned int            nr_confs;
> +};
> +
> +struct hdmiphy_config {
> +       int pixel_clock;
> +       u8 conf[HDMIPHY_REG_COUNT];
> +};
> +
> +struct hdmiphy_drv_data {
> +       struct hdmiphy_config *confs;
> +       unsigned int count;
> +};
> +
> +/* list of all required phy config settings */
> +static struct hdmiphy_config hdmiphy_4212_configs[] = {
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
> +static struct hdmiphy_config hdmiphy_4210_configs[] = {
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

Are you aware of the effort to move these to dt? Since these are
board-specific values, it seems incorrect to apply them universally.
Shirish has uploaded a patch to the chromium review site to push these
into dt (https://chromium-review.googlesource.com/#/c/65581). Maybe
you can work that into your patch set?


> +static struct hdmiphy_config *hdmiphy_find_conf(struct hdmiphy_context *hdata,
> +                       const struct drm_display_mode *mode)
> +{
> +       int i;
> +
> +       for (i = 0; i < hdata->nr_confs; i++)
> +               if (hdata->confs[i].pixel_clock == (mode->clock * 1000))
> +                       return &hdata->confs[i];
> +
> +       return NULL;
> +}
> +
> +static int hdmiphy_reg_writeb(struct hdmiphy_context *hdata,
> +                       u32 reg_offset, u8 value)
> +{
> +       if (reg_offset >= HDMIPHY_REG_COUNT)
> +               return -EINVAL;
> +
> +       if (i2c_verify_client(hdata->dev)) {

Is this necessary?

> +               u8 buffer[2];
> +               int ret;
> +
> +               buffer[0] = reg_offset;
> +               buffer[1] = value;
> +
> +               ret = i2c_master_send(to_i2c_client(hdata->dev),
> +                               buffer, 2);
> +               if (ret == 2)
> +                       return 0;
> +               return ret;
> +       } else {
> +               return -EINVAL;
> +       }
> +}
> +
> +static int hdmiphy_reg_write_buf(struct hdmiphy_context *hdata,
> +                       u32 reg_offset, const u8 *buf, u32 len)
> +{
> +       if ((reg_offset + len) > HDMIPHY_REG_COUNT)
> +               return -EINVAL;
> +
> +       if (i2c_verify_client(hdata->dev)) {

Is this necessary?


> +               int ret;
> +
> +               ret = i2c_master_send(to_i2c_client(hdata->dev),
> +                               buf, len);

Does this actually work? You don't seem to be using reg_offset anywhere.

> +               if (ret == len)
> +                       return 0;
> +               return ret;
> +       } else {
> +               return -EINVAL;
> +       }
> +}
> +
> +int exynos_hdmiphy_check_mode(struct device *dev,
> +                       struct drm_display_mode *mode)
>  {
> -       hdmi_attach_hdmiphy_client(client);
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +       const struct hdmiphy_config *conf;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);

Maybe you can merge this debug message with the one below.

>
> -       dev_info(&client->adapter->dev, "attached s5p_hdmiphy "
> -               "into i2c adapter successfully\n");
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return -EINVAL;
> +       }

Can this happen? I think the phy driver registration should be
synchronous with the hdmi driver registration. As such, it shouldn't
be possible to get a check_mode callback until it's all set up.

>
> +       DRM_DEBUG("xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
> +               mode->hdisplay, mode->vdisplay,
> +               mode->vrefresh, (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +               ? true : false, mode->clock * 1000);
> +
> +       conf = hdmiphy_find_conf(hdata, mode);
> +       if (!conf) {
> +               DRM_DEBUG("Display Mode is not supported.\n");
> +               return -EINVAL;
> +       }
>         return 0;
>  }
>
> -static int hdmiphy_remove(struct i2c_client *client)
> +int exynos_hdmiphy_set_mode(struct device *dev,
> +                       struct drm_display_mode *mode)
>  {
> -       dev_info(&client->adapter->dev, "detached s5p_hdmiphy "
> -               "from i2c adapter successfully\n");
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       hdata->current_conf = hdmiphy_find_conf(hdata, mode);
> +
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return -EINVAL;
> +       }

I really hope this check isn't necessary, since you've already
dereferenced it 2 lines up :) See my comment above, I don't think you
can ever hit this.

>
> +       if (!hdata->current_conf) {
> +               DRM_ERROR("Display Mode is not supported.\n");
> +               return -EINVAL;
> +       }
>         return 0;
>  }
>
> -static struct of_device_id hdmiphy_match_types[] = {
> +void exynos_hdmiphy_enable(struct device *dev)
> +{
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +       int ret;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return;
> +       }

Same comment as above.

> +
> +       ret = hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
> +                       HDMIPHY_MODE_EN);
> +       if (ret < 0) {
> +               DRM_ERROR("failed to disable hdmiphy.\n");
> +               return;
> +       }
> +}
> +
> +void exynos_hdmiphy_disable(struct device *dev)
> +{
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +       int ret;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return;
> +       }
> +
> +       ret = hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE, 0);
> +       if (ret < 0) {
> +               DRM_ERROR("failed to enable hdmiphy.\n");

If you're not going to return the error code, at least print it here.

> +               return;
> +       }
> +}
> +
> +int exynos_hdmiphy_conf_apply(struct device *dev)
> +{
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +       const u8 *hdmiphy_data;
> +       int ret;
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return -EINVAL;
> +       }
> +
> +       /* pixel clock */

I don't understand this comment.

> +       if (hdata->current_conf)
> +               hdmiphy_data = hdata->current_conf->conf;
> +       else
> +               return -EINVAL;
> +
> +       ret = hdmiphy_reg_write_buf(hdata, 0, hdmiphy_data,
> +                       HDMIPHY_REG_COUNT);

I think the only reason this works is b/c you're writing to register offset 0.

> +       if (ret) {
> +               DRM_ERROR("failed to configure hdmiphy.\n");
> +               return -EINVAL;

Why don't you return ret?

> +       }
> +       return 0;
> +}
> +
> +static struct hdmiphy_drv_data exynos4212_hdmiphy_drv_data = {
> +       .confs = hdmiphy_4212_configs,
> +       .count = ARRAY_SIZE(hdmiphy_4212_configs)
> +};
> +
> +static struct hdmiphy_drv_data exynos4210_hdmiphy_drv_data = {
> +       .confs = hdmiphy_4210_configs,
> +       .count = ARRAY_SIZE(hdmiphy_4210_configs)
> +};
> +
> +static struct of_device_id hdmiphy_i2c_device_match_types[] = {
>         {
>                 .compatible = "samsung,exynos5-hdmiphy",
> +               .data   = &exynos4212_hdmiphy_drv_data,
>         }, {
>                 .compatible = "samsung,exynos4210-hdmiphy",
> +               .data   = &exynos4210_hdmiphy_drv_data,
>         }, {
>                 .compatible = "samsung,exynos4212-hdmiphy",
> +               .data   = &exynos4212_hdmiphy_drv_data,
>         }, {
>                 /* end node */
>         }
>  };
>
> -struct i2c_driver hdmiphy_driver = {
> +static int hdmiphy_i2c_device_probe(struct i2c_client *client,
> +       const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       struct hdmiphy_context *hdata;
> +       struct hdmiphy_drv_data *drv;
> +       const struct of_device_id *match;
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
> +               hdmiphy_i2c_device_match_types),
> +               dev->of_node);
> +
> +       if (match == NULL)
> +               return -ENODEV;
> +
> +       drv = (struct hdmiphy_drv_data *)match->data;
> +
> +       hdata->dev = dev;
> +       hdata->confs = drv->confs;
> +       hdata->nr_confs = drv->count;
> +
> +       i2c_set_clientdata(client, hdata);
> +
> +       return 0;
> +}
> +
> +static const struct i2c_device_id hdmiphy_id[] = {
> +       { },
> +};
> +
> +struct i2c_driver hdmiphy_i2c_driver = {
>         .driver = {
>                 .name   = "exynos-hdmiphy",
>                 .owner  = THIS_MODULE,
> -               .of_match_table = hdmiphy_match_types,
> +               .of_match_table = of_match_ptr(
> +                               hdmiphy_i2c_device_match_types),
>         },
> -       .probe          = hdmiphy_probe,
> -       .remove         = hdmiphy_remove,
> +       .id_table               = hdmiphy_id,
> +       .probe          = hdmiphy_i2c_device_probe,
>         .command                = NULL,
>  };
> -EXPORT_SYMBOL(hdmiphy_driver);
> +
> +int exynos_hdmiphy_driver_register(void)
> +{
> +       int ret;
> +
> +       ret = i2c_add_driver(&hdmiphy_i2c_driver);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +void exynos_hdmiphy_driver_unregister(void)
> +{
> +       i2c_del_driver(&hdmiphy_i2c_driver);
> +}
> diff --git a/drivers/gpu/drm/exynos/regs-hdmiphy.h b/drivers/gpu/drm/exynos/regs-hdmiphy.h
> new file mode 100644
> index 0000000..d3f9d87
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/regs-hdmiphy.h
> @@ -0,0 +1,35 @@
> +/*
> + *
> + *  regs-hdmiphy.h
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + * http://www.samsung.com/
> + *
> + * HDMI-PHY register header file for Samsung HDMI driver
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
> +#define HDMIPHY_MODE_SET_DONE  (0x1f)
> +
> +/*
> + * Bit definition part
> + */
> +
> +/* HDMIPHY_MODE_SET_DONE */
> +#define HDMIPHY_MODE_EN                (1 << 7)
> +
> +/* hdmiphy pmu control bits */
> +#define PMU_HDMI_PHY_CONTROL_MASK      (1 << 0)
> +#define PMU_HDMI_PHY_ENABLE            (1)
> +#define PMU_HDMI_PHY_DISABLE           (0)


You don't need the () around simple values

> +
> +#endif /* SAMSUNG_REGS_HDMIPHY_H */
> --
> 1.7.10.4
>

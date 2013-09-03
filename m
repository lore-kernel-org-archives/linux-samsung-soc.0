From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 3/7] drm/exynos: add hdmiphy pmu bit control in hdmiphy driver
Date: Tue, 3 Sep 2013 12:10:25 -0400
Message-ID: <CAOw6vbJtd91nyc1-YRUzjfjMLYSX+OdpcimFg3Hzu1F0QbATeQ@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com> <1377845974-28373-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:63475 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756064Ab3ICQKt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 12:10:49 -0400
Received: by mail-oa0-f54.google.com with SMTP id j10so1867374oah.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 09:10:48 -0700 (PDT)
Received: by mail-oa0-f46.google.com with SMTP id o20so6928391oag.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 09:10:46 -0700 (PDT)
In-Reply-To: <1377845974-28373-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com, sunil joshi <joshi@samsung.com>, "r.sh.open" <r.sh.open@gmail.com>

On Fri, Aug 30, 2013 at 2:59 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Before hdmiphy operation like config, start etc, hdmiphy
> bit in PMU block should be enabled. Earlier this happens
> in hdmi drvier through a dummy "hdmiphy" clock.

s/drvier/driver/

>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  .../devicetree/bindings/video/exynos_hdmiphy.txt   |    6 ++
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h           |    2 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |    2 +
>  drivers/gpu/drm/exynos/exynos_hdmiphy.c            |   82 ++++++++++++++++++++
>  4 files changed, 92 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
> index 162f641..f6bf096 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
> @@ -6,10 +6,16 @@ Required properties:
>         2) "samsung,exynos4210-hdmiphy".
>         3) "samsung,exynos4212-hdmiphy".
>  - reg: I2C address of the hdmiphy device.
> +- phy-power-control: this child node represents phy power control
> +       register which is inside the pmu block (power management unit).

Should you include devicetree-discuss on this?

>
>  Example:
>
>         hdmiphy {
>                 compatible = "samsung,exynos4210-hdmiphy";
>                 reg = <0x38>;
> +
> +               phy-power-control {
> +                               reg = <0x10040700 0x04>;
> +               };
>         };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> index 1c839f8..9a14f96 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> @@ -68,6 +68,8 @@ void exynos_mixer_ops_register(struct exynos_mixer_ops *ops);
>  int exynos_hdmiphy_driver_register(void);
>  void exynos_hdmiphy_driver_unregister(void);
>
> +void exynos_hdmiphy_poweron(struct device *dev);
> +void exynos_hdmiphy_poweroff(struct device *dev);
>  void exynos_hdmiphy_enable(struct device *dev);
>  void exynos_hdmiphy_disable(struct device *dev);
>  int exynos_hdmiphy_check_mode(struct device *dev,
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index cd1d921..a6234fc 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1131,6 +1131,7 @@ static void hdmiphy_poweron(struct hdmi_context *hdata)
>         if (hdata->type == HDMI_TYPE14)
>                 hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
>                         HDMI_PHY_POWER_OFF_EN);
> +       exynos_hdmiphy_poweron(hdata->hdmiphy_dev);
>  }
>
>  static void hdmiphy_poweroff(struct hdmi_context *hdata)
> @@ -1138,6 +1139,7 @@ static void hdmiphy_poweroff(struct hdmi_context *hdata)
>         if (hdata->type == HDMI_TYPE14)
>                 hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
>                         HDMI_PHY_POWER_OFF_EN);
> +       exynos_hdmiphy_poweroff(hdata->hdmiphy_dev);

Shouldn't the phy power off before HDMI?

>  }
>
>  static void hdmi_conf_apply(struct hdmi_context *hdata)
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> index 82daa42..b1b8a0f 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
> @@ -30,6 +30,9 @@ struct hdmiphy_context {
>         struct device           *dev;
>         struct hdmiphy_config   *current_conf;
>
> +       /* hdmiphy resources */
> +       void __iomem            *phy_pow_ctrl_reg;
> +
>         struct hdmiphy_config   *confs;
>         unsigned int            nr_confs;
>  };
> @@ -225,6 +228,49 @@ static struct hdmiphy_config *hdmiphy_find_conf(struct hdmiphy_context *hdata,
>         return NULL;
>  }
>
> +static int hdmiphy_dt_parse_power_control(struct hdmiphy_context *hdata)
> +{
> +       struct device_node *phy_pow_ctrl_node;
> +       u32 buf[2];
> +       int ret = 0;
> +
> +       phy_pow_ctrl_node = of_get_child_by_name(hdata->dev->of_node,
> +                       "phy-power-control");
> +       if (!phy_pow_ctrl_node) {
> +               DRM_ERROR("Failed to find phy power control node\n");
> +               ret = -ENODEV;
> +               goto fail;

You can just return -ENODEV here.

> +       }
> +
> +       /* reg property holds two informations: addr of pmu register, size */
> +       if (of_property_read_u32_array(phy_pow_ctrl_node, "reg",
> +                       (u32 *)&buf, 2)) {

Maybe I'm missing something, but this looks bad. I think this should be:

of_property_read_u32_array(phy_pow_ctrl_node, "reg", buf, ARRAY_SIZE(buf))

ie: dereferencing buf won't do what you expect it to.

> +               DRM_ERROR("faild to get phy power control reg\n");
> +               ret = -EINVAL;
> +               goto fail;
> +       }
> +
> +       hdata->phy_pow_ctrl_reg = devm_ioremap(hdata->dev, buf[0], buf[1]);
> +       if (!hdata->phy_pow_ctrl_reg) {
> +               DRM_ERROR("failed to ioremap phy pmu reg\n");
> +               ret = -ENOMEM;
> +               goto fail;
> +       }
> +
> +fail:

fail seems like the wrong thing to call this, since it's run on
success too :) Maybe "out" would be more appropriate.

> +       of_node_put(phy_pow_ctrl_node);
> +       return ret;
> +}
> +
> +static inline void hdmiphy_pow_ctrl_reg_writemask(
> +                       struct hdmiphy_context *hdata,
> +                       u32 value, u32 mask)
> +{
> +       u32 old = readl(hdata->phy_pow_ctrl_reg);
> +       value = (value & mask) | (old & ~mask);
> +       writel(value, hdata->phy_pow_ctrl_reg);
> +}
> +
>  static int hdmiphy_reg_writeb(struct hdmiphy_context *hdata,
>                         u32 reg_offset, u8 value)
>  {
> @@ -353,6 +399,36 @@ void exynos_hdmiphy_disable(struct device *dev)
>         }
>  }
>
> +void exynos_hdmiphy_poweron(struct device *dev)
> +{
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return;
> +       }

Same comment as the other review. I wonder if you really need this check

> +
> +       hdmiphy_pow_ctrl_reg_writemask(hdata, PMU_HDMI_PHY_ENABLE,
> +               PMU_HDMI_PHY_CONTROL_MASK);
> +}
> +
> +void exynos_hdmiphy_poweroff(struct device *dev)
> +{
> +       struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> +
> +       DRM_DEBUG_KMS("[%d]\n", __LINE__);
> +
> +       if (!hdata) {
> +               DRM_ERROR("Invalid arg: hdmiphy device pointer.\n");
> +               return;
> +       }
> +
> +       hdmiphy_pow_ctrl_reg_writemask(hdata, PMU_HDMI_PHY_DISABLE,
> +               PMU_HDMI_PHY_CONTROL_MASK);
> +}
> +
>  int exynos_hdmiphy_conf_apply(struct device *dev)
>  {
>         struct hdmiphy_context *hdata = dev_get_drvdata(dev);
> @@ -413,6 +489,7 @@ static int hdmiphy_i2c_device_probe(struct i2c_client *client,
>         struct hdmiphy_context *hdata;
>         struct hdmiphy_drv_data *drv;
>         const struct of_device_id *match;
> +       int ret;
>
>         DRM_DEBUG_KMS("[%d]\n", __LINE__);
>
> @@ -436,6 +513,11 @@ static int hdmiphy_i2c_device_probe(struct i2c_client *client,
>         hdata->nr_confs = drv->count;
>
>         i2c_set_clientdata(client, hdata);
> +       ret = hdmiphy_dt_parse_power_control(hdata);
> +       if (ret) {
> +               DRM_ERROR("failed to map hdmiphy pow control reg.\n");
> +               return ret;
> +       }
>
>         return 0;
>  }
> --
> 1.7.10.4
>

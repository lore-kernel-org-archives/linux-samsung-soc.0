From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 3/7] drm/panel: Add driver for exynos_dp based panels
Date: Sat, 19 Apr 2014 01:12:37 +0530
Message-ID: <CAEC9eQPU1o4c30_VWJcoC1uwZC1yNNvq7GoKp=JhVMeEuz375g@mail.gmail.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-4-git-send-email-ajaykumar.rs@samsung.com>
 <000101cf5ae2$c7423f30$55c6bd90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2099310751=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000101cf5ae2$c7423f30$55c6bd90$%han@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, abrestic@chromium.org, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, a.hajda@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, treding@nvidia.com, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2099310751==
Content-Type: multipart/alternative; boundary=047d7b339db11e473304f7565a7e

--047d7b339db11e473304f7565a7e
Content-Type: text/plain; charset=UTF-8

Hi Jingoo,


On Fri, Apr 18, 2014 at 2:17 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> >
> > This patch adds a simple driver to handle all the LCD and LED
> > powerup/down routines needed to support eDP/eDP-LVDS panels
> > supported on exynos boards.
> >
> > Most of the eDP/LVDS panels need this sequence for powerup:
> >       -- LCD unit powerup/LCD_EN
> >       -- video data on
> >       -- LED unit powerup/BL_EN
> >
> > The LCD and LED units are usually powered up via regulators,
> > and almost on all boards, we will have a BL_EN pin to enable/
> > disable the backlight. Sometimes, we can have LCD_EN switches
> > as well. The routines in this driver can be used to control
> > panel power sequence on such boards.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> >  .../devicetree/bindings/panel/exynos-dp-panel.txt  |  32 ++++
> >  drivers/gpu/drm/panel/Kconfig                      |   9 +
> >  drivers/gpu/drm/panel/Makefile                     |   1 +
> >  drivers/gpu/drm/panel/panel-exynos-dp.c            | 213
> +++++++++++++++++++++
> >  4 files changed, 255 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> >  create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c
> >
> > diff --git a/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> > b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> > new file mode 100644
> > index 0000000..a1428d2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> > @@ -0,0 +1,32 @@
> > +exynos_DP_panel/DP_to_LVDS_panel
>
> Please remove unnecessary under lines as below.
>
> Ok.

> Exynos DP panel/DP to LVDS panel
>
> > +==================================
> > +
> > +Required properties:
> > +  - compatible: "samsung,exynos-dp-panel"
> > +
> > +Optional properties:
> > +     -samsung,lcd-en-gpio:
> > +             eDP panel LCD poweron GPIO.
> > +                     Indicates which GPIO needs to be powered up as
> output
> > +                     to powerup/enable the switch to the LCD panel.
> > +     -samsung,led-en-gpio:
> > +             eDP panel LED enable GPIO.
> > +                     Indicates which GPIO needs to be powered up as
> output
> > +                     to enable the backlight.
> > +     -samsung,power-up-delay:
> > +             eDP panel powerup delay value in ms.
> > +                     Delay in ms needed for the eDP panel to properly
> > +                     powerup after giving powerup signals to the panel.
> > +     -samsung,power-down-delay:
> > +             eDP panel powerdown delay value in ms.
> > +                     Delay in ms needed for the eDP panel to properly
> > +                     powerdown after giving powerdown signals to the
> panel.
> > +
> > +Example:
> > +
> > +     dp-panel {
> > +             compatible = "samsung,exynos-dp-panel";
> > +             samsung,led-en-gpio = <&gpx3 0 1>;
> > +             samsung,power-up-delay = <40>;
> > +             samsung,power-down-delay = <50>;
> > +     };
> > diff --git a/drivers/gpu/drm/panel/Kconfig
> b/drivers/gpu/drm/panel/Kconfig
> > index 4ec874d..ea9d5ac 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -30,4 +30,13 @@ config DRM_PANEL_S6E8AA0
> >       select DRM_MIPI_DSI
> >       select VIDEOMODE_HELPERS
> >
> > +config DRM_PANEL_EXYNOS_DP
> > +     tristate "support for DP panels"
> > +     depends on OF && DRM_PANEL && DRM_EXYNOS_DP
> > +     help
> > +       DRM panel driver for DP panels and LVDS connected via DP bridges
> > +       that need at most a regulator for LCD unit, a regulator for LED
> unit
> > +       and/or enable GPIOs for LCD or LED units. Delay values can also
> be
> > +       specified to support powerup and powerdown process.
> > +
> >  endmenu
> > diff --git a/drivers/gpu/drm/panel/Makefile
> b/drivers/gpu/drm/panel/Makefile
> > index 8b92921..30311a4 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -1,3 +1,4 @@
> >  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
> >  obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
> >  obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
> > +obj-$(CONFIG_DRM_PANEL_EXYNOS_DP) += panel-exynos-dp.o
> > diff --git a/drivers/gpu/drm/panel/panel-exynos-dp.c
> b/drivers/gpu/drm/panel/panel-exynos-dp.c
> > new file mode 100644
> > index 0000000..e85a7b2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-exynos-dp.c
> > @@ -0,0 +1,213 @@
> > +/*
> > + * Exynos DP panel driver
> > + *
> > + * Copyright (c) 2014 Samsung Electronics Co., Ltd
> > + *
> > + * Ajay Kumar <ajaykumar.rs@samsung.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/gpio.h>
> > +#include <linux/module.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drmP.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_panel.h>
> > +
> > +struct panel_exynos_dp {
> > +     struct drm_panel        base;
> > +     struct regulator        *bck_fet;
> > +     struct regulator        *lcd_fet;
>
> 'bck' means 'backlight'? Then, just use 'backlight_fet'.
>
backlight_fet is more meaningful. Will change it.

Also, I cannot understand the meaning of 'fet'.
> What's the meaning of the 'fet'?
>
> FET is an output from the regulator. On exynos5250-snow board,
FET1 controls power to the backlight unit.
See more here: https://lkml.org/lkml/2014/4/15/618

> +     int                     led_en_gpio;
> > +     int                     lcd_en_gpio;
> > +     int                     power_up_delay;
> > +     int                     power_down_delay;
> > +     bool                    enabled;
> > +};
> > +
> > +static inline struct panel_exynos_dp *to_panel(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct panel_exynos_dp, base);
> > +}
> > +
> > +static int panel_exynos_dp_disable(struct drm_panel *panel)
> > +{
> > +     struct panel_exynos_dp *dp_panel = to_panel(panel);
> > +     bool enable_delay = false;
> > +
> > +     if (!dp_panel->enabled)
> > +             return 0;
> > +
> > +     if (gpio_is_valid(dp_panel->led_en_gpio))
> > +             gpio_set_value(dp_panel->led_en_gpio, 0);
> > +
> > +     if (!IS_ERR_OR_NULL(dp_panel->bck_fet))
> > +             regulator_disable(dp_panel->bck_fet);
> > +
> > +     if (gpio_is_valid(dp_panel->lcd_en_gpio)) {
> > +             gpio_set_value(dp_panel->lcd_en_gpio, 0);
> > +             enable_delay = true;
> > +     }
> > +
> > +     if (!IS_ERR_OR_NULL(dp_panel->lcd_fet)) {
> > +             regulator_disable(dp_panel->lcd_fet);
> > +             enable_delay = true;
> > +     }
> > +
> > +     if (enable_delay)
> > +             msleep(dp_panel->power_down_delay);
> > +
> > +     dp_panel->enabled = false;
> > +
> > +     return 0;
> > +}
> > +
> > +static int panel_exynos_dp_pre_enable(struct drm_panel *panel)
>
> panel_exynos_dp_pre_enable() always returns '0'.
> These are two ways. Either one will be better.
> 1. Make return values meaningful. In other words, add the case
>    returning error values.
>
> 2. Change the return type to 'void'
>
> Ok. Will add a check for all failure cases.


> > +{
> > +     struct panel_exynos_dp *dp_panel = to_panel(panel);
> > +     bool enable_delay = false;
> > +
> > +     if (dp_panel->enabled)
> > +             return 0;
> > +
> > +     if (!IS_ERR_OR_NULL(dp_panel->lcd_fet)) {
> > +             if (regulator_enable(dp_panel->lcd_fet))
> > +                     DRM_ERROR("Failed to enable LCD fet\n");
> > +             enable_delay = true;
> > +     }
> > +
> > +     if (gpio_is_valid(dp_panel->lcd_en_gpio)) {
> > +             gpio_set_value(dp_panel->lcd_en_gpio, 1);
> > +             enable_delay = true;
> > +     }
> > +
> > +     if (enable_delay)
> > +             msleep(dp_panel->power_up_delay);
> > +
> > +     return 0;
> > +}
> > +
> > +static int panel_exynos_dp_enable(struct drm_panel *panel)
> > +{
> > +     struct panel_exynos_dp *dp_panel = to_panel(panel);
> > +
> > +     if (dp_panel->enabled)
> > +             return 0;
> > +
> > +     if (!IS_ERR_OR_NULL(dp_panel->bck_fet))
> > +             if (regulator_enable(dp_panel->bck_fet))
> > +                             DRM_ERROR("Failed to enable LED fet\n");
> > +
> > +     if (gpio_is_valid(dp_panel->led_en_gpio))
> > +             gpio_set_value(dp_panel->led_en_gpio, 1);
> > +
> > +     dp_panel->enabled = true;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_panel_funcs panel_exynos_dp_funcs = {
> > +     .disable = panel_exynos_dp_disable,
> > +     .pre_enable = panel_exynos_dp_pre_enable,
> > +     .enable = panel_exynos_dp_enable,
> > +};
> > +
> > +static int panel_exynos_dp_probe(struct platform_device *pdev)
> > +{
> > +     struct panel_exynos_dp *dp_panel;
> > +     struct device *dev = &pdev->dev;
> > +     int ret;
> > +
> > +     dp_panel = devm_kzalloc(dev, sizeof(*dp_panel), GFP_KERNEL);
> > +     if (!dp_panel)
> > +             return -ENOMEM;
> > +
> > +     dp_panel->enabled = false;
> > +
> > +     dp_panel->lcd_en_gpio = of_get_named_gpio(dev->of_node,
> > +                                             "samsung,lcd-en-gpio", 0);
> > +     dp_panel->led_en_gpio = of_get_named_gpio(dev->of_node,
> > +                                             "samsung,led-en-gpio", 0);
> > +
> > +     of_property_read_u32(dev->of_node, "samsung,power-up-delay",
> > +                                             &dp_panel->power_up_delay);
> > +     of_property_read_u32(dev->of_node, "samsung,power-down-delay",
> > +
> &dp_panel->power_down_delay);
> > +
> > +     dp_panel->lcd_fet = devm_regulator_get(dev, "lcd_vdd");
> > +     if (IS_ERR(dp_panel->lcd_fet))
> > +             return PTR_ERR(dp_panel->lcd_fet);
> > +
> > +     dp_panel->bck_fet = devm_regulator_get(dev, "vcd_led");
> > +     if (IS_ERR(dp_panel->bck_fet))
> > +             return PTR_ERR(dp_panel->bck_fet);
> > +
> > +     if (gpio_is_valid(dp_panel->lcd_en_gpio)) {
> > +             ret = devm_gpio_request_one(dev, dp_panel->lcd_en_gpio,
> > +                                     GPIOF_OUT_INIT_LOW, "lcd_en_gpio");
> > +             if (ret) {
> > +                     DRM_ERROR("failed to get lcd-en gpio [%d]\n", ret);
> > +                     return ret;
> > +             }
> > +     } else {
> > +             dp_panel->lcd_en_gpio = -ENODEV;
> > +     }
> > +
> > +     if (gpio_is_valid(dp_panel->led_en_gpio)) {
> > +             ret = devm_gpio_request_one(dev, dp_panel->led_en_gpio,
> > +                                     GPIOF_OUT_INIT_LOW, "led_en_gpio");
> > +             if (ret) {
> > +                     DRM_ERROR("failed to get led-en gpio [%d]\n", ret);
> > +                     return ret;
> > +             }
> > +     } else {
> > +             dp_panel->led_en_gpio = -ENODEV;
> > +     }
> > +
> > +     drm_panel_init(&dp_panel->base);
> > +     dp_panel->base.dev = dev;
> > +     dp_panel->base.funcs = &panel_exynos_dp_funcs;
> > +
> > +     ret = drm_panel_add(&dp_panel->base);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dev_set_drvdata(dev, dp_panel);
> > +
> > +     return 0;
> > +}
> > +
> > +static int panel_exynos_dp_remove(struct platform_device *pdev)
> > +{
> > +     struct panel_exynos_dp *dp_panel = dev_get_drvdata(&pdev->dev);
> > +
> > +     drm_panel_detach(&dp_panel->base);
> > +     drm_panel_remove(&dp_panel->base);
> > +
> > +     panel_exynos_dp_disable(&dp_panel->base);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id exynos_dp_panel_dt_match[] = {
> > +     { .compatible = "samsung,exynos-dp-panel" },
> > +     {},
> > +};
> > +
> > +struct platform_driver exynos_dp_panel_driver = {
> > +     .driver = {
> > +             .name = "exynos-dp-panel",
> > +             .owner = THIS_MODULE,
> > +             .of_match_table = exynos_dp_panel_dt_match,
> > +     },
> > +     .probe = panel_exynos_dp_probe,
> > +     .remove = panel_exynos_dp_remove,
> > +};
> > --
> > 1.8.1.2
>
>
Thanks and regards,
Ajay Kumar

--047d7b339db11e473304f7565a7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jingoo,<br><div><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">On Fri, Apr 18, 2014 at 2:17 PM, Jingoo Han <span di=
r=3D"ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1.=
han@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""><div clas=
s=3D"h5">On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:<br>
&gt;<br>
&gt; This patch adds a simple driver to handle all the LCD and LED<br>
&gt; powerup/down routines needed to support eDP/eDP-LVDS panels<br>
&gt; supported on exynos boards.<br>
&gt;<br>
&gt; Most of the eDP/LVDS panels need this sequence for powerup:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 -- LCD unit powerup/LCD_EN<br>
&gt; =C2=A0 =C2=A0 =C2=A0 -- video data on<br>
&gt; =C2=A0 =C2=A0 =C2=A0 -- LED unit powerup/BL_EN<br>
&gt;<br>
&gt; The LCD and LED units are usually powered up via regulators,<br>
&gt; and almost on all boards, we will have a BL_EN pin to enable/<br>
&gt; disable the backlight. Sometimes, we can have LCD_EN switches<br>
&gt; as well. The routines in this driver can be used to control<br>
&gt; panel power sequence on such boards.<br>
&gt;<br>
&gt; Signed-off-by: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.c=
om">ajaykumar.rs@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../devicetree/bindings/panel/exynos-dp-panel.txt =C2=A0| =C2=A0=
32 ++++<br>
&gt; =C2=A0drivers/gpu/drm/panel/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 9 +<br>
&gt; =C2=A0drivers/gpu/drm/panel/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +<br>
&gt; =C2=A0drivers/gpu/drm/panel/panel-exynos-dp.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 213 +++++++++++++++++++++<br>
&gt; =C2=A04 files changed, 255 insertions(+)<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/panel/exyno=
s-dp-panel.txt<br>
&gt; =C2=A0create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/panel/exynos-dp-panel.t=
xt<br>
&gt; b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a1428d2<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +exynos_DP_panel/DP_to_LVDS_panel<br>
<br>
</div></div>Please remove unnecessary under lines as below.<br>
<br></blockquote><div>Ok. <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Exynos DP panel/DP to LVDS panel<br>
<div><div class=3D"h5"><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + =C2=A0- compatible: &quot;samsung,exynos-dp-panel&quot;<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; + =C2=A0 =C2=A0 -samsung,lcd-en-gpio:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eDP panel LCD poweron GPIO=
.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Indicates which GPIO needs to be powered up as output<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to powerup/enable the switch to the LCD panel.<br>
&gt; + =C2=A0 =C2=A0 -samsung,led-en-gpio:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eDP panel LED enable GPIO.=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Indicates which GPIO needs to be powered up as output<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to enable the backlight.<br>
&gt; + =C2=A0 =C2=A0 -samsung,power-up-delay:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eDP panel powerup delay va=
lue in ms.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Delay in ms needed for the eDP panel to properly<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 powerup after giving powerup signals to the panel.<br>
&gt; + =C2=A0 =C2=A0 -samsung,power-down-delay:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eDP panel powerdown delay =
value in ms.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Delay in ms needed for the eDP panel to properly<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 powerdown after giving powerdown signals to the panel.<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp-panel {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;samsu=
ng,exynos-dp-panel&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 samsung,led-en-gpio =3D &l=
t;&amp;gpx3 0 1&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 samsung,power-up-delay =3D=
 &lt;40&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 samsung,power-down-delay =
=3D &lt;50&gt;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kco=
nfig<br>
&gt; index 4ec874d..ea9d5ac 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/panel/Kconfig<br>
&gt; @@ -30,4 +30,13 @@ config DRM_PANEL_S6E8AA0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select DRM_MIPI_DSI<br>
&gt; =C2=A0 =C2=A0 =C2=A0 select VIDEOMODE_HELPERS<br>
&gt;<br>
&gt; +config DRM_PANEL_EXYNOS_DP<br>
&gt; + =C2=A0 =C2=A0 tristate &quot;support for DP panels&quot;<br>
&gt; + =C2=A0 =C2=A0 depends on OF &amp;&amp; DRM_PANEL &amp;&amp; DRM_EXYN=
OS_DP<br>
&gt; + =C2=A0 =C2=A0 help<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 DRM panel driver for DP panels and LVDS connect=
ed via DP bridges<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 that need at most a regulator for LCD unit, a r=
egulator for LED unit<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 and/or enable GPIOs for LCD or LED units. Delay=
 values can also be<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 specified to support powerup and powerdown proc=
ess.<br>
&gt; +<br>
&gt; =C2=A0endmenu<br>
&gt; diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Ma=
kefile<br>
&gt; index 8b92921..30311a4 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Makefile<br>
&gt; +++ b/drivers/gpu/drm/panel/Makefile<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt; =C2=A0obj-$(CONFIG_DRM_PANEL_SIMPLE) +=3D panel-simple.o<br>
&gt; =C2=A0obj-$(CONFIG_DRM_PANEL_LD9040) +=3D panel-ld9040.o<br>
&gt; =C2=A0obj-$(CONFIG_DRM_PANEL_S6E8AA0) +=3D panel-s6e8aa0.o<br>
&gt; +obj-$(CONFIG_DRM_PANEL_EXYNOS_DP) +=3D panel-exynos-dp.o<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-exynos-dp.c b/drivers/gpu/drm=
/panel/panel-exynos-dp.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e85a7b2<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-exynos-dp.c<br>
&gt; @@ -0,0 +1,213 @@<br>
&gt; +/*<br>
&gt; + * Exynos DP panel driver<br>
&gt; + *<br>
&gt; + * Copyright (c) 2014 Samsung Electronics Co., Ltd<br>
&gt; + *<br>
&gt; + * Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.com">ajaykum=
ar.rs@samsung.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/component.h&gt;<br>
&gt; +#include &lt;linux/gpio.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_gpio.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/regulator/consumer.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drmP.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc.h&gt;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
&gt; +<br>
&gt; +struct panel_exynos_dp {<br>
&gt; + =C2=A0 =C2=A0 struct drm_panel =C2=A0 =C2=A0 =C2=A0 =C2=A0base;<br>
&gt; + =C2=A0 =C2=A0 struct regulator =C2=A0 =C2=A0 =C2=A0 =C2=A0*bck_fet;<=
br>
&gt; + =C2=A0 =C2=A0 struct regulator =C2=A0 =C2=A0 =C2=A0 =C2=A0*lcd_fet;<=
br>
<br>
</div></div>&#39;bck&#39; means &#39;backlight&#39;? Then, just use &#39;ba=
cklight_fet&#39;.<br></blockquote><div>backlight_fet is more meaningful. Wi=
ll change it.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">

Also, I cannot understand the meaning of &#39;fet&#39;.<br>
What&#39;s the meaning of the &#39;fet&#39;?<br>
<div><div class=3D"h5"><br></div></div></blockquote><div>FET is an output f=
rom the regulator. On exynos5250-snow board,<br></div><div>FET1 controls po=
wer to the backlight unit.<br></div><div>See more here: <a href=3D"https://=
lkml.org/lkml/2014/4/15/618">https://lkml.org/lkml/2014/4/15/618</a> <br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=
=3D"h5">
&gt; + =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 led_en_gpio;<br>
&gt; + =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 lcd_en_gpio;<br>
&gt; + =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 power_up_delay;<br>
&gt; + =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 power_down_delay;<br>
&gt; + =C2=A0 =C2=A0 bool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enabled;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct panel_exynos_dp *to_panel(struct drm_panel *pane=
l)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 return container_of(panel, struct panel_exynos_dp, bas=
e);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int panel_exynos_dp_disable(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct panel_exynos_dp *dp_panel =3D to_panel(panel);<=
br>
&gt; + =C2=A0 =C2=A0 bool enable_delay =3D false;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (!dp_panel-&gt;enabled)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp_panel-&gt;led_en_gpio))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(dp_panel-&g=
t;led_en_gpio, 0);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(dp_panel-&gt;bck_fet))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator_disable(dp_panel=
-&gt;bck_fet);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp_panel-&gt;lcd_en_gpio)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(dp_panel-&g=
t;lcd_en_gpio, 0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_delay =3D true;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(dp_panel-&gt;lcd_fet)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator_disable(dp_panel=
-&gt;lcd_fet);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_delay =3D true;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (enable_delay)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msleep(dp_panel-&gt;power_=
down_delay);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;enabled =3D false;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int panel_exynos_dp_pre_enable(struct drm_panel *panel)<br>
<br>
</div></div>panel_exynos_dp_pre_enable() always returns &#39;0&#39;.<br>
These are two ways. Either one will be better.<br>
1. Make return values meaningful. In other words, add the case<br>
=C2=A0 =C2=A0returning error values.<br>
<br>
2. Change the return type to &#39;void&#39;<br>
<br></blockquote><div>Ok. Will add a check for all failure cases.<br><br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""><di=
v class=3D"h5"><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct panel_exynos_dp *dp_panel =3D to_panel(panel);<=
br>
&gt; + =C2=A0 =C2=A0 bool enable_delay =3D false;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (dp_panel-&gt;enabled)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(dp_panel-&gt;lcd_fet)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (regulator_enable(dp_pa=
nel-&gt;lcd_fet))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_ERROR(&quot;Failed to enable LCD fet\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_delay =3D true;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp_panel-&gt;lcd_en_gpio)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(dp_panel-&g=
t;lcd_en_gpio, 1);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_delay =3D true;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (enable_delay)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msleep(dp_panel-&gt;power_=
up_delay);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int panel_exynos_dp_enable(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct panel_exynos_dp *dp_panel =3D to_panel(panel);<=
br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (dp_panel-&gt;enabled)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(dp_panel-&gt;bck_fet))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (regulator_enable(dp_pa=
nel-&gt;bck_fet))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(&quot;Failed to enable LED fet\n&=
quot;);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp_panel-&gt;led_en_gpio))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio_set_value(dp_panel-&g=
t;led_en_gpio, 1);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;enabled =3D true;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_panel_funcs panel_exynos_dp_funcs =3D {<br>
&gt; + =C2=A0 =C2=A0 .disable =3D panel_exynos_dp_disable,<br>
&gt; + =C2=A0 =C2=A0 .pre_enable =3D panel_exynos_dp_pre_enable,<br>
&gt; + =C2=A0 =C2=A0 .enable =3D panel_exynos_dp_enable,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int panel_exynos_dp_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct panel_exynos_dp *dp_panel;<br>
&gt; + =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; + =C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel =3D devm_kzalloc(dev, sizeof(*dp_panel), GFP_=
KERNEL);<br>
&gt; + =C2=A0 =C2=A0 if (!dp_panel)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;enabled =3D false;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;lcd_en_gpio =3D of_get_named_gpio(dev-&gt=
;of_node,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;samsung,lcd-en-gpio&quot;, 0);<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;led_en_gpio =3D of_get_named_gpio(dev-&gt=
;of_node,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;samsung,led-en-gpio&quot;, 0);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 of_property_read_u32(dev-&gt;of_node, &quot;samsung,po=
wer-up-delay&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;dp_panel-&gt;power_up_delay);<br>
&gt; + =C2=A0 =C2=A0 of_property_read_u32(dev-&gt;of_node, &quot;samsung,po=
wer-down-delay&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;dp_panel-&gt;power_down_delay);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;lcd_fet =3D devm_regulator_get(dev, &quot=
;lcd_vdd&quot;);<br>
&gt; + =C2=A0 =C2=A0 if (IS_ERR(dp_panel-&gt;lcd_fet))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(dp_panel-&g=
t;lcd_fet);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;bck_fet =3D devm_regulator_get(dev, &quot=
;vcd_led&quot;);<br>
&gt; + =C2=A0 =C2=A0 if (IS_ERR(dp_panel-&gt;bck_fet))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(dp_panel-&g=
t;bck_fet);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp_panel-&gt;lcd_en_gpio)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_gpio_request_=
one(dev, dp_panel-&gt;lcd_en_gpio,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPIOF_OUT_INIT_=
LOW, &quot;lcd_en_gpio&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_ERROR(&quot;failed to get lcd-en gpio [%d]\n&quot;, ret);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return ret;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 } else {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dp_panel-&gt;lcd_en_gpio =
=3D -ENODEV;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 if (gpio_is_valid(dp_panel-&gt;led_en_gpio)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_gpio_request_=
one(dev, dp_panel-&gt;led_en_gpio,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPIOF_OUT_INIT_=
LOW, &quot;led_en_gpio&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_ERROR(&quot;failed to get led-en gpio [%d]\n&quot;, ret);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return ret;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 } else {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dp_panel-&gt;led_en_gpio =
=3D -ENODEV;<br>
&gt; + =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 drm_panel_init(&amp;dp_panel-&gt;base);<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;base.dev =3D dev;<br>
&gt; + =C2=A0 =C2=A0 dp_panel-&gt;base.funcs =3D &amp;panel_exynos_dp_funcs=
;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 ret =3D drm_panel_add(&amp;dp_panel-&gt;base);<br>
&gt; + =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 dev_set_drvdata(dev, dp_panel);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int panel_exynos_dp_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 struct panel_exynos_dp *dp_panel =3D dev_get_drvdata(&=
amp;pdev-&gt;dev);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 drm_panel_detach(&amp;dp_panel-&gt;base);<br>
&gt; + =C2=A0 =C2=A0 drm_panel_remove(&amp;dp_panel-&gt;base);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 panel_exynos_dp_disable(&amp;dp_panel-&gt;base);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id exynos_dp_panel_dt_match[] =3D {<br>
&gt; + =C2=A0 =C2=A0 { .compatible =3D &quot;samsung,exynos-dp-panel&quot; =
},<br>
&gt; + =C2=A0 =C2=A0 {},<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct platform_driver exynos_dp_panel_driver =3D {<br>
&gt; + =C2=A0 =C2=A0 .driver =3D {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;exynos-dp-=
panel&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MODULE,<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D exynos=
_dp_panel_dt_match,<br>
&gt; + =C2=A0 =C2=A0 },<br>
&gt; + =C2=A0 =C2=A0 .probe =3D panel_exynos_dp_probe,<br>
&gt; + =C2=A0 =C2=A0 .remove =3D panel_exynos_dp_remove,<br>
&gt; +};<br>
&gt; --<br>
&gt; 1.8.1.2<br>
<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
and regards,<br>Ajay Kumar<br></div></div></div>

--047d7b339db11e473304f7565a7e--

--===============2099310751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2099310751==--

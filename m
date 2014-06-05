From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 5/8] drm/panel: Add driver for lvds/edp based panels
Date: Fri, 6 Jun 2014 00:47:26 +0530
Message-ID: <CAEC9eQNamrF7G0kQ6J=R5DgvMn_zX1X6D2f7pegkRKxQ7LMfLQ@mail.gmail.com>
References: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
	<1401995452-15798-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:54849 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751440AbaFETR1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 15:17:27 -0400
Received: by mail-ve0-f172.google.com with SMTP id oz11so1798896veb.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jun 2014 12:17:26 -0700 (PDT)
In-Reply-To: <1401995452-15798-6-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

+Device tree list

On Fri, Jun 6, 2014 at 12:40 AM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> This patch adds a simple driver to handle all the LCD and LED
> powerup/down routines needed to support eDP/LVDS panels.
>
> The LCD and LED units are usually powered up via regulators,
> and almost on all boards, we will have a BACKLIGHT_EN pin to
> enable/ disable the backlight.
> Sometimes, we can have LCD_EN switches as well.
>
> The routines in this driver can be used to control
> panel power sequence on such boards.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++
>  drivers/gpu/drm/panel/Kconfig                      |   18 ++
>  drivers/gpu/drm/panel/Makefile                     |    2 +
>  drivers/gpu/drm/panel/panel-lvds.c                 |  262 ++++++++++++++++++++
>  4 files changed, 332 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
>
> diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> new file mode 100644
> index 0000000..465016d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> @@ -0,0 +1,50 @@
> +panel interface for eDP/lvds panels
> +
> +Required properties:
> +  - compatible: "panel-lvds"
> +
> +Optional properties:
> +       -lcd-en-gpio:
> +               panel LCD poweron GPIO.
> +                       Indicates which GPIO needs to be powered up as output
> +                       to powerup/enable the switch to the LCD panel.
> +       -led-en-gpio:
> +               panel LED enable GPIO.
> +                       Indicates which GPIO needs to be powered up as output
> +                       to enable the backlight.
> +       -panel-prepare-delay:
> +               delay value in ms required for panel_prepare process
> +                       Delay in ms needed for the panel LCD unit to
> +                       powerup completely.
> +                       ex: delay needed till eDP panel throws HPD.
> +                           delay needed so that we cans tart reading edid.
> +       -panel-enable-delay:
> +               delay value in ms required for panel_enable process
> +                       Delay in ms needed for the panel backlight/LED unit
> +                       to powerup, and delay needed between video_enable and
> +                       backlight_enable.
> +       -panel-disable-delay:
> +               delay value in ms required for panel_disable process
> +                       Delay in ms needed for the panel backlight/LED unit
> +                       powerdown, and delay needed between backlight_disable
> +                       and video_disable.
> +       -panel-unprepare-delay:
> +               delay value in ms required for panel_post_disable process
> +                       Delay in ms needed for the panel LCD unit to
> +                       to powerdown completely, and the minimum delay needed
> +                       before powering it on again.
> +       -panel-width-mm: physical panel width [mm]
> +       -panel-height-mm: physical panel height [mm]
> +
> +Example:
> +
> +       panel-lvds {
> +               compatible = "panel-lvds";
> +               led-en-gpio = <&gpx3 0 1>;
> +               panel-pre-enable-delay = <40>;
> +               panel-enable-delay = <20>;
> +               panel-disable-delay = <20>;
> +               panel-post-disable-delay = <30>;
> +               panel-width-mm = <256>;
> +               panel-height-mm = <144>;
> +       };
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4ec874d..3743947 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -30,4 +30,22 @@ config DRM_PANEL_S6E8AA0
>         select DRM_MIPI_DSI
>         select VIDEOMODE_HELPERS
>
> +config DRM_PANEL_LVDS
> +       tristate "support for LVDS panels"
> +       depends on OF && DRM_PANEL
> +       help
> +         DRM panel driver for LVDS connected via DP bridges that need at most
> +         a regulator for LCD unit, a regulator for LED unit and/or enable
> +         GPIOs for LCD or LED units. Delay values can also be
> +         specified to support powerup and powerdown process.
> +
> +config DRM_PANEL_EDP
> +       tristate "support for eDP panels"
> +       depends on OF && DRM_PANEL
> +       help
> +         DRM panel driver for eDP panels that need at most a
> +         regulator for LCD unit, a regulator for LED unit and/or enable
> +         GPIOs for LCD or LED units. Delay values can also be
> +         specified to support powerup and powerdown process.
> +
>  endmenu
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 8b92921..9c4f120 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -1,3 +1,5 @@
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
>  obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
> +obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
> +obj-$(CONFIG_DRM_PANEL_EDP) += panel-lvds.o
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> new file mode 100644
> index 0000000..4dfb322
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -0,0 +1,262 @@
> +/*
> + * panel driver for lvds and eDP panels
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd
> + *
> + * Ajay Kumar <ajaykumar.rs@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/gpio.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/of_videomode.h>
> +#include <video/videomode.h>
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_panel.h>
> +
> +struct panel_lvds {
> +       struct drm_panel        base;
> +       struct regulator        *backlight_fet;
> +       struct regulator        *lcd_fet;
> +       struct videomode        vm;
> +       int                     width_mm;
> +       int                     height_mm;
> +       bool                    backlight_fet_enabled;
> +       bool                    lcd_fet_enabled;
> +       int                     led_en_gpio;
> +       int                     lcd_en_gpio;
> +       int                     panel_prepare_delay;
> +       int                     panel_enable_delay;
> +       int                     panel_disable_delay;
> +       int                     panel_unprepare_delay;
> +};
> +
> +static inline struct panel_lvds *to_panel(struct drm_panel *panel)
> +{
> +       return container_of(panel, struct panel_lvds, base);
> +}
> +
> +static int panel_lvds_prepare(struct drm_panel *panel)
> +{
> +       struct panel_lvds *lvds_panel = to_panel(panel);
> +
> +       if (!IS_ERR_OR_NULL(lvds_panel->lcd_fet))
> +               if (!lvds_panel->lcd_fet_enabled) {
> +                       if (regulator_enable(lvds_panel->lcd_fet))
> +                               DRM_ERROR("failed to enable LCD fet\n");
> +                       lvds_panel->lcd_fet_enabled = true;
> +               }
> +
> +       if (gpio_is_valid(lvds_panel->lcd_en_gpio))
> +               gpio_set_value(lvds_panel->lcd_en_gpio, 1);
> +
> +       msleep(lvds_panel->panel_prepare_delay);
> +
> +       return 0;
> +}
> +
> +static int panel_lvds_enable(struct drm_panel *panel)
> +{
> +       struct panel_lvds *lvds_panel = to_panel(panel);
> +
> +       if (!IS_ERR_OR_NULL(lvds_panel->backlight_fet))
> +               if (!lvds_panel->backlight_fet_enabled) {
> +                       if (regulator_enable(lvds_panel->backlight_fet))
> +                               DRM_ERROR("failed to enable LED fet\n");
> +                       lvds_panel->backlight_fet_enabled = true;
> +               }
> +
> +       msleep(lvds_panel->panel_enable_delay);
> +
> +       if (gpio_is_valid(lvds_panel->led_en_gpio))
> +               gpio_set_value(lvds_panel->led_en_gpio, 1);
> +
> +       return 0;
> +}
> +
> +static int panel_lvds_disable(struct drm_panel *panel)
> +{
> +       struct panel_lvds *lvds_panel = to_panel(panel);
> +
> +       if (gpio_is_valid(lvds_panel->led_en_gpio))
> +               gpio_set_value(lvds_panel->led_en_gpio, 0);
> +
> +       if (!IS_ERR_OR_NULL(lvds_panel->backlight_fet))
> +               if (lvds_panel->backlight_fet_enabled) {
> +                       regulator_disable(lvds_panel->backlight_fet);
> +                       lvds_panel->backlight_fet_enabled = false;
> +               }
> +
> +       msleep(lvds_panel->panel_disable_delay);
> +
> +       return 0;
> +}
> +
> +static int panel_lvds_unprepare(struct drm_panel *panel)
> +{
> +       struct panel_lvds *lvds_panel = to_panel(panel);
> +
> +       if (gpio_is_valid(lvds_panel->lcd_en_gpio))
> +               gpio_set_value(lvds_panel->lcd_en_gpio, 0);
> +
> +       if (!IS_ERR_OR_NULL(lvds_panel->lcd_fet))
> +               if (lvds_panel->lcd_fet_enabled) {
> +                       regulator_disable(lvds_panel->lcd_fet);
> +                       lvds_panel->lcd_fet_enabled = false;
> +               }
> +
> +       msleep(lvds_panel->panel_unprepare_delay);
> +
> +       return 0;
> +}
> +
> +static int panel_lvds_get_modes(struct drm_panel *panel)
> +{
> +       struct drm_connector *connector = panel->connector;
> +       struct panel_lvds *lvds_panel = to_panel(panel);
> +       struct drm_display_mode *mode;
> +
> +       mode = drm_mode_create(connector->dev);
> +       if (!mode) {
> +               DRM_ERROR("failed to create a new display mode.\n");
> +               return 0;
> +       }
> +
> +       drm_display_mode_from_videomode(&lvds_panel->vm, mode);
> +       mode->width_mm = lvds_panel->width_mm;
> +       mode->height_mm = lvds_panel->height_mm;
> +       connector->display_info.width_mm = mode->width_mm;
> +       connector->display_info.height_mm = mode->height_mm;
> +
> +       mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +       drm_mode_set_name(mode);
> +       drm_mode_probed_add(connector, mode);
> +
> +       return 1;
> +}
> +
> +static const struct drm_panel_funcs panel_lvds_funcs = {
> +       .unprepare = panel_lvds_unprepare,
> +       .disable = panel_lvds_disable,
> +       .prepare = panel_lvds_prepare,
> +       .enable = panel_lvds_enable,
> +       .get_modes = panel_lvds_get_modes,
> +};
> +
> +static int panel_lvds_probe(struct platform_device *pdev)
> +{
> +       struct panel_lvds *panel;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->of_node;
> +       int ret;
> +
> +       panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> +       if (!panel)
> +               return -ENOMEM;
> +
> +       ret = of_get_videomode(node, &panel->vm, 0);
> +       if (ret) {
> +               DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
> +               return ret;
> +       }
> +
> +       panel->lcd_fet = devm_regulator_get_optional(dev, "lcd_vdd");
> +       if (IS_ERR(panel->lcd_fet))
> +               return -EPROBE_DEFER;
> +
> +       panel->backlight_fet = devm_regulator_get_optional(dev, "vcd_led");
> +       if (IS_ERR(panel->backlight_fet))
> +               return -EPROBE_DEFER;
> +
> +       panel->lcd_en_gpio = of_get_named_gpio(node, "lcd-en-gpio", 0);
> +       panel->led_en_gpio = of_get_named_gpio(node, "led-en-gpio", 0);
> +
> +       of_property_read_u32(node, "panel-width-mm", &panel->width_mm);
> +       of_property_read_u32(node, "panel-height-mm", &panel->height_mm);
> +
> +       of_property_read_u32(node, "panel-pre-enable-delay",
> +                                       &panel->panel_prepare_delay);
> +       of_property_read_u32(node, "panel-enable-delay",
> +                                       &panel->panel_enable_delay);
> +       of_property_read_u32(node, "panel-disable-delay",
> +                                       &panel->panel_disable_delay);
> +       of_property_read_u32(node, "panel-post-disable-delay",
> +                                       &panel->panel_unprepare_delay);
> +
> +       if (gpio_is_valid(panel->lcd_en_gpio)) {
> +               ret = devm_gpio_request_one(dev, panel->lcd_en_gpio,
> +                                       GPIOF_OUT_INIT_LOW, "lcd_en_gpio");
> +               if (ret) {
> +                       DRM_ERROR("failed to get lcd-en gpio [%d]\n", ret);
> +                       return 0;
> +               }
> +       } else {
> +               panel->lcd_en_gpio = -ENODEV;
> +       }
> +
> +       if (gpio_is_valid(panel->led_en_gpio)) {
> +               ret = devm_gpio_request_one(dev, panel->led_en_gpio,
> +                                       GPIOF_OUT_INIT_LOW, "led_en_gpio");
> +               if (ret) {
> +                       DRM_ERROR("failed to get led-en gpio [%d]\n", ret);
> +                       return 0;
> +               }
> +       } else {
> +               panel->led_en_gpio = -ENODEV;
> +       }
> +
> +       drm_panel_init(&panel->base);
> +       panel->base.dev = dev;
> +       panel->base.funcs = &panel_lvds_funcs;
> +
> +       ret = drm_panel_add(&panel->base);
> +       if (ret < 0)
> +               return ret;
> +
> +       dev_set_drvdata(dev, panel);
> +
> +       return 0;
> +}
> +
> +static int panel_lvds_remove(struct platform_device *pdev)
> +{
> +       struct panel_lvds *panel = dev_get_drvdata(&pdev->dev);
> +
> +       panel_lvds_disable(&panel->base);
> +       panel_lvds_unprepare(&panel->base);
> +
> +       drm_panel_remove(&panel->base);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id lvds_panel_dt_match[] = {
> +       { .compatible = "panel-lvds" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, lvds_panel_dt_match);
> +
> +struct platform_driver lvds_panel_driver = {
> +       .driver = {
> +               .name = "panel_lvds",
> +               .owner = THIS_MODULE,
> +               .of_match_table = lvds_panel_dt_match,
> +       },
> +       .probe = panel_lvds_probe,
> +       .remove = panel_lvds_remove,
> +};
> +module_platform_driver(lvds_panel_driver);
> +
> +MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> +MODULE_DESCRIPTION("lvds/eDP panel driver");
> +MODULE_LICENSE("GPL v2");
> --
> 1.7.9.5
>

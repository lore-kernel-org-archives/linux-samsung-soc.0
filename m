From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 04/10] drm/panel: Add driver for lvds/edp based panels
Date: Tue, 24 Jun 2014 04:18:53 -0400
Message-ID: <CAEC9eQOwpFNjeqO7hDB3hUq3wBQC0WhHVrgMXLDx8qMFhtCcVg@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-5-git-send-email-ajaykumar.rs@samsung.com>
	<CABxcv=naPZMfNnU1a88JVjH_Q+rfZN8pdiUv8n3LwPtGmg76dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:54139 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654AbaFXISy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 04:18:54 -0400
In-Reply-To: <CABxcv=naPZMfNnU1a88JVjH_Q+rfZN8pdiUv8n3LwPtGmg76dA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Javier,

Thanks for the review.

On Mon, Jun 23, 2014 at 11:30 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Ajay,
>
> Not an extensive review since I'm not familiar with the graphics stack
> but a few things I noticed are commented below.
>
> On Wed, Jun 11, 2014 at 8:27 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>> This patch adds a simple driver to handle all the LCD and LED
>> powerup/down routines needed to support eDP/LVDS panels.
>>
>> The LCD and LED units are usually powered up via regulators,
>> and almost on all boards, we will have a BACKLIGHT_EN pin to
>> enable/ disable the backlight.
>> Sometimes, we can have LCD_EN switches as well.
>>
>> The routines in this driver can be used to control
>> panel power sequence on such boards.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++
>>  drivers/gpu/drm/panel/Kconfig                      |   10 +
>>  drivers/gpu/drm/panel/Makefile                     |    1 +
>>  drivers/gpu/drm/panel/panel-lvds.c                 |  262 ++++++++++++++++++++
>>  4 files changed, 323 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
>>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
>>
>> diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/Documentation/devicetree/bindings/panel/panel-lvds.txt
>> new file mode 100644
>> index 0000000..7cb6084
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
>> @@ -0,0 +1,50 @@
>> +panel interface for eDP/lvds panels
>> +
>> +Required properties:
>> +  - compatible: "panel-lvds"
>> +
>> +Optional properties:
>> +       -lcd-en-gpio:
>> +               panel LCD poweron GPIO.
>> +                       Indicates which GPIO needs to be powered up as output
>> +                       to powerup/enable the switch to the LCD panel.
>> +       -led-en-gpio:
>> +               panel LED enable GPIO.
>> +                       Indicates which GPIO needs to be powered up as output
>> +                       to enable the backlight.
>> +       -panel-prepare-delay:
>> +               delay value in ms required for panel_prepare process
>> +                       Delay in ms needed for the panel LCD unit to
>> +                       powerup completely.
>> +                       ex: delay needed till eDP panel throws HPD.
>> +                           delay needed so that we cans tart reading edid.
>> +       -panel-enable-delay:
>> +               delay value in ms required for panel_enable process
>> +                       Delay in ms needed for the panel backlight/LED unit
>> +                       to powerup, and delay needed between video_enable and
>> +                       backlight_enable.
>> +       -panel-disable-delay:
>> +               delay value in ms required for panel_disable process
>> +                       Delay in ms needed for the panel backlight/LED unit
>> +                       powerdown, and delay needed between backlight_disable
>> +                       and video_disable.
>> +       -panel-unprepare-delay:
>> +               delay value in ms required for panel_post_disable process
>> +                       Delay in ms needed for the panel LCD unit to
>> +                       to powerdown completely, and the minimum delay needed
>> +                       before powering it on again.
>> +       -panel-width-mm: physical panel width [mm]
>> +       -panel-height-mm: physical panel height [mm]
>> +
>> +Example:
>> +
>> +       panel-lvds {
>> +               compatible = "panel-lvds";
>> +               led-en-gpio = <&gpx3 0 1>;
>> +               panel-prepare-delay = <40>;
>> +               panel-enable-delay = <20>;
>> +               panel-disable-delay = <20>;
>> +               panel-unprepare-delay = <30>;
>> +               panel-width-mm = <256>;
>> +               panel-height-mm = <144>;
>> +       };
>
> Recently it's considered a good practice to have the DT binding
> documentation in a separate patch.
Ok, will remember this.

>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 4ec874d..8fe7ee5 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -30,4 +30,14 @@ config DRM_PANEL_S6E8AA0
>>         select DRM_MIPI_DSI
>>         select VIDEOMODE_HELPERS
>>
>> +config DRM_PANEL_EDP_LVDS
>> +       tristate "support for eDP/LVDS panels"
>> +       depends on OF && DRM_PANEL
>> +       select VIDEOMODE_HELPERS
>> +       help
>> +         DRM panel driver for direct eDP panels or LVDS connected
>> +         via DP bridges, that need at most a regulator for LCD unit,
>> +         a regulator for LED unit and/or enable GPIOs for LCD or LED units.
>> +         Delay values can also be specified to support powerup and
>> +         powerdown process.
>>  endmenu
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>> index 8b92921..eaafa01 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -1,3 +1,4 @@
>>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
>>  obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
>>  obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
>> +obj-$(CONFIG_DRM_PANEL_EDP_LVDS) += panel-lvds.o
>> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
>> new file mode 100644
>> index 0000000..2124fcb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-lvds.c
>> @@ -0,0 +1,262 @@
>> +/*
>> + * panel driver for lvds and eDP panels
>> + *
>> + * Copyright (c) 2014 Samsung Electronics Co., Ltd
>> + *
>> + * Ajay Kumar <ajaykumar.rs@samsung.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/gpio.h>
>> +#include <linux/module.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#include <video/of_videomode.h>
>> +#include <video/videomode.h>
>> +
>> +#include <drm/drmP.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_panel.h>
>> +
>> +struct panel_lvds {
>> +       struct drm_panel        base;
>> +       struct regulator        *backlight_fet;
>> +       struct regulator        *lcd_fet;
>> +       struct videomode        vm;
>> +       int                     width_mm;
>> +       int                     height_mm;
>> +       bool                    backlight_fet_enabled;
>> +       bool                    lcd_fet_enabled;
>> +       int                     led_en_gpio;
>> +       int                     lcd_en_gpio;
>> +       int                     panel_prepare_delay;
>> +       int                     panel_enable_delay;
>> +       int                     panel_disable_delay;
>> +       int                     panel_unprepare_delay;
>> +};
>> +
>> +static inline struct panel_lvds *to_panel(struct drm_panel *panel)
>> +{
>> +       return container_of(panel, struct panel_lvds, base);
>> +}
>> +
>> +static int panel_lvds_prepare(struct drm_panel *panel)
>> +{
>> +       struct panel_lvds *lvds_panel = to_panel(panel);
>> +
>> +       if (!IS_ERR_OR_NULL(lvds_panel->lcd_fet))
>> +               if (!lvds_panel->lcd_fet_enabled) {
>> +                       if (regulator_enable(lvds_panel->lcd_fet))
>> +                               DRM_ERROR("failed to enable LCD fet\n");
>> +                       lvds_panel->lcd_fet_enabled = true;
>
> If this is an expected condition then using DRM_INFO() instead? It
> looks like an error to me though so maybe should return an error in
> this case?
Right, we should ideally return an error here.

>> +               }
>> +
>> +       if (gpio_is_valid(lvds_panel->lcd_en_gpio))
>> +               gpio_set_value(lvds_panel->lcd_en_gpio, 1);
>> +
>> +       msleep(lvds_panel->panel_prepare_delay);
>> +
>> +       return 0;
>> +}
>> +
>> +static int panel_lvds_enable(struct drm_panel *panel)
>> +{
>> +       struct panel_lvds *lvds_panel = to_panel(panel);
>> +
>> +       if (!IS_ERR_OR_NULL(lvds_panel->backlight_fet))
>> +               if (!lvds_panel->backlight_fet_enabled) {
>> +                       if (regulator_enable(lvds_panel->backlight_fet))
>> +                               DRM_ERROR("failed to enable LED fet\n");
>> +                       lvds_panel->backlight_fet_enabled = true;
>
> Same here.
Ok.

>> +               }
>> +
>> +       msleep(lvds_panel->panel_enable_delay);
>> +
>> +       if (gpio_is_valid(lvds_panel->led_en_gpio))
>> +               gpio_set_value(lvds_panel->led_en_gpio, 1);
>> +
>> +       return 0;
>> +}
>> +
>> +static int panel_lvds_disable(struct drm_panel *panel)
>> +{
>> +       struct panel_lvds *lvds_panel = to_panel(panel);
>> +
>> +       if (gpio_is_valid(lvds_panel->led_en_gpio))
>> +               gpio_set_value(lvds_panel->led_en_gpio, 0);
>> +
>> +       if (!IS_ERR_OR_NULL(lvds_panel->backlight_fet))
>> +               if (lvds_panel->backlight_fet_enabled) {
>> +                       regulator_disable(lvds_panel->backlight_fet);
>> +                       lvds_panel->backlight_fet_enabled = false;
>> +               }
>> +
>> +       msleep(lvds_panel->panel_disable_delay);
>> +
>> +       return 0;
>> +}
>> +
>> +static int panel_lvds_unprepare(struct drm_panel *panel)
>> +{
>> +       struct panel_lvds *lvds_panel = to_panel(panel);
>> +
>> +       if (gpio_is_valid(lvds_panel->lcd_en_gpio))
>> +               gpio_set_value(lvds_panel->lcd_en_gpio, 0);
>> +
>> +       if (!IS_ERR_OR_NULL(lvds_panel->lcd_fet))
>> +               if (lvds_panel->lcd_fet_enabled) {
>> +                       regulator_disable(lvds_panel->lcd_fet);
>> +                       lvds_panel->lcd_fet_enabled = false;
>> +               }
>> +
>> +       msleep(lvds_panel->panel_unprepare_delay);
>> +
>> +       return 0;
>> +}
>> +
>> +static int panel_lvds_get_modes(struct drm_panel *panel)
>> +{
>> +       struct drm_connector *connector = panel->connector;
>> +       struct panel_lvds *lvds_panel = to_panel(panel);
>> +       struct drm_display_mode *mode;
>> +
>> +       mode = drm_mode_create(connector->dev);
>> +       if (!mode) {
>> +               DRM_ERROR("failed to create a new display mode.\n");
>> +               return 0;
>> +       }
>> +
>> +       drm_display_mode_from_videomode(&lvds_panel->vm, mode);
>> +       mode->width_mm = lvds_panel->width_mm;
>> +       mode->height_mm = lvds_panel->height_mm;
>> +       connector->display_info.width_mm = mode->width_mm;
>> +       connector->display_info.height_mm = mode->height_mm;
>> +
>> +       mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>> +       drm_mode_set_name(mode);
>> +       drm_mode_probed_add(connector, mode);
>> +
>> +       return 1;
>> +}
>> +
>> +static const struct drm_panel_funcs panel_lvds_funcs = {
>> +       .unprepare = panel_lvds_unprepare,
>> +       .disable = panel_lvds_disable,
>> +       .prepare = panel_lvds_prepare,
>> +       .enable = panel_lvds_enable,
>> +       .get_modes = panel_lvds_get_modes,
>> +};
>> +
>> +static int panel_lvds_probe(struct platform_device *pdev)
>> +{
>> +       struct panel_lvds *panel;
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *node = dev->of_node;
>> +       int ret;
>> +
>> +       panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>> +       if (!panel)
>> +               return -ENOMEM;
>> +
>> +       ret = of_get_videomode(node, &panel->vm, 0);
>> +       if (ret) {
>> +               DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       panel->lcd_fet = devm_regulator_get_optional(dev, "lcd_vdd");
>> +       if (IS_ERR(panel->lcd_fet))
>> +               return -EPROBE_DEFER;
>> +
>> +       panel->backlight_fet = devm_regulator_get_optional(dev, "vcd_led");
>> +       if (IS_ERR(panel->backlight_fet))
>> +               return -EPROBE_DEFER;
>> +
>> +       panel->lcd_en_gpio = of_get_named_gpio(node, "lcd-en-gpio", 0);
>> +       panel->led_en_gpio = of_get_named_gpio(node, "led-en-gpio", 0);
>> +
>
> The old integer-based GPIO API has been deprecated and new drivers
> should use the new descriptor-based interface
> (Documentation/gpio/consumer.txt) instead if possible.
Ok, I just saw other panel drivers using the same.
Will change this.

>> +       of_property_read_u32(node, "panel-width-mm", &panel->width_mm);
>> +       of_property_read_u32(node, "panel-height-mm", &panel->height_mm);
>> +
>> +       of_property_read_u32(node, "panel-prepare-delay",
>> +                                       &panel->panel_prepare_delay);
>> +       of_property_read_u32(node, "panel-enable-delay",
>> +                                       &panel->panel_enable_delay);
>> +       of_property_read_u32(node, "panel-disable-delay",
>> +                                       &panel->panel_disable_delay);
>> +       of_property_read_u32(node, "panel-unprepare-delay",
>> +                                       &panel->panel_unprepare_delay);
>> +
>> +       if (gpio_is_valid(panel->lcd_en_gpio)) {
>> +               ret = devm_gpio_request_one(dev, panel->lcd_en_gpio,
>> +                                       GPIOF_OUT_INIT_LOW, "lcd_en_gpio");
>> +               if (ret) {
>> +                       DRM_ERROR("failed to get lcd-en gpio [%d]\n", ret);
>> +                       return 0;
>
> The probe() function returning 0 means success to the driver core but
> here is returning early due an error.
Right, will fix it.

>> +               }
>> +       } else {
>> +               panel->lcd_en_gpio = -ENODEV;
>> +       }
>> +
>> +       if (gpio_is_valid(panel->led_en_gpio)) {
>> +               ret = devm_gpio_request_one(dev, panel->led_en_gpio,
>> +                                       GPIOF_OUT_INIT_LOW, "led_en_gpio");
>> +               if (ret) {
>> +                       DRM_ERROR("failed to get led-en gpio [%d]\n", ret);
>> +                       return 0;
>
> Same here, it should return an error code instead 0.
Right, will fix it.

>> +               }
>> +       } else {
>> +               panel->led_en_gpio = -ENODEV;
>> +       }
>> +
>> +       drm_panel_init(&panel->base);
>> +       panel->base.dev = dev;
>> +       panel->base.funcs = &panel_lvds_funcs;
>> +
>> +       ret = drm_panel_add(&panel->base);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       dev_set_drvdata(dev, panel);
>> +
>> +       return 0;
>> +}
>> +
>> +static int panel_lvds_remove(struct platform_device *pdev)
>> +{
>> +       struct panel_lvds *panel = dev_get_drvdata(&pdev->dev);
>> +
>> +       panel_lvds_disable(&panel->base);
>> +       panel_lvds_unprepare(&panel->base);
>> +
>> +       drm_panel_remove(&panel->base);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id lvds_panel_dt_match[] = {
>> +       { .compatible = "panel-lvds" },
>> +       {},
>> +};
>> +MODULE_DEVICE_TABLE(of, lvds_panel_dt_match);
>> +
>> +struct platform_driver lvds_panel_driver = {
>> +       .driver = {
>> +               .name = "panel_lvds",
>> +               .owner = THIS_MODULE,
>> +               .of_match_table = lvds_panel_dt_match,
>> +       },
>> +       .probe = panel_lvds_probe,
>> +       .remove = panel_lvds_remove,
>> +};
>> +module_platform_driver(lvds_panel_driver);
>> +
>> +MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>> +MODULE_DESCRIPTION("lvds/eDP panel driver");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 1.7.9.5
>>
>
> Best regards,
> Javier

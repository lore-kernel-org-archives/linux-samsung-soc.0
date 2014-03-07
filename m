From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 08/21] drm/panel: add TC358764 driver
Date: Fri, 07 Mar 2014 11:44:42 +0100
Message-ID: <5319A31A.4070401@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
 <1392204688-4591-9-git-send-email-a.hajda@samsung.com>
 <CAAQKjZPHi3eLAbFCEOWW5Y2MoADAmJfqNwywp-ub3Wc8suygmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21312 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751663AbaCGKpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 05:45:00 -0500
In-reply-to: <CAAQKjZPHi3eLAbFCEOWW5Y2MoADAmJfqNwywp-ub3Wc8suygmQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Inki,

Thanks for the review.

On 03/05/2014 07:46 AM, Inki Dae wrote:
> 2014-02-12 20:31 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> The patch adds driver for Toshiba DSI/LVDS TC358764 bridge.
>> Driver registers itself as mipi_dsi_driver. It is exposed to the
>> system via drm_panel interface, it uses also drm_panel framework
>> to interact with LVDS panel connected to it.
>> Driver supports only DT bindings.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/panel/Kconfig          |   7 +
>>  drivers/gpu/drm/panel/Makefile         |   1 +
>>  drivers/gpu/drm/panel/panel-tc358764.c | 505 +++++++++++++++++++++++++++++++++
>>  3 files changed, 513 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-tc358764.c
>>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 7527557..b98a485 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -23,4 +23,11 @@ config DRM_PANEL_S6E8AA0
>>         select DRM_MIPI_DSI
>>         select VIDEOMODE_HELPERS
>>
>> +config DRM_PANEL_TC358764
>> +       tristate "TC358764 DSI/LVDS bridge"
>> +       depends on DRM && DRM_PANEL
>> +       depends on OF
>> +       select DRM_MIPI_DSI
>> +       select VIDEOMODE_HELPERS
>> +
>>  endmenu
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>> index 181265b..7cbb0cf 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -1,2 +1,3 @@
>>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
>>  obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
>> +obj-$(CONFIG_DRM_PANEL_TC358764) += panel-tc358764.o
>> diff --git a/drivers/gpu/drm/panel/panel-tc358764.c b/drivers/gpu/drm/panel/panel-tc358764.c
>> new file mode 100644
>> index 0000000..f9c1289
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-tc358764.c
>> @@ -0,0 +1,505 @@
>> +/*
>> + * TC358764 MIPI-DSI to LVDS bridge panel driver.
>> + *
>> + * Copyright (c) 2013 Samsung Electronics Co., Ltd
>> + *
>> + * Andrzej Hajda <a.hajda@samsung.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#include <drm/drmP.h>
>> +#include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_panel.h>
> ...
>> +/* of_* functions will be removed after acceptance of of_graph patches */
>> +static struct device_node *
>> +of_get_child_by_name_reg(struct device_node *parent, const char *name, u32 reg)
>> +{
>> +       struct device_node *np;
>> +
>> +       for_each_child_of_node(parent, np) {
>> +               u32 r;
>> +
>> +               if (!np->name || of_node_cmp(np->name, name))
>> +                       continue;
>> +
>> +               if (of_property_read_u32(np, "reg", &r) < 0)
>> +                       r = 0;
>> +
>> +               if (reg == r)
>> +                       break;
>> +       }
>> +
>> +       return np;
>> +}
>> +
>> +static struct device_node *of_graph_get_port_by_reg(struct device_node *parent,
>> +                                                   u32 reg)
>> +{
>> +       struct device_node *ports, *port;
>> +
>> +       ports = of_get_child_by_name(parent, "ports");
>> +       if (ports) {
>> +               port = of_get_child_by_name_reg(ports, "port", reg);
>> +               of_node_put(ports);
>> +       } else {
>> +               port = of_get_child_by_name_reg(parent, "port", reg);
>> +       }
>> +       return port;
>> +}
>> +
>> +static struct device_node *
>> +of_graph_get_endpoint_by_reg(struct device_node *port, u32 reg)
>> +{
>> +       return of_get_child_by_name_reg(port, "endpoint", reg);
>> +}
>> +
>> +static struct device_node *
>> +of_graph_get_remote_port_parent(const struct device_node *node)
>> +{
>> +       struct device_node *np;
>> +       unsigned int depth;
>> +
>> +       /* Get remote endpoint node. */
>> +       np = of_parse_phandle(node, "remote-endpoint", 0);
>> +
>> +       /* Walk 3 levels up only if there is 'ports' node. */
>> +       for (depth = 3; depth && np; depth--) {
>> +               np = of_get_next_parent(np);
>> +               if (depth == 2 && of_node_cmp(np->name, "ports"))
>> +                       break;
>> +       }
>> +       return np;
>> +}
>> +
>> +static struct device_node *tc358764_of_find_panel_node(struct device *dev)
>> +{
>> +       struct device_node *np, *ep;
>> +
>> +       np = of_graph_get_port_by_reg(dev->of_node, 1);
>> +       if (!np)
>> +               return NULL;
>> +
>> +       ep = of_graph_get_endpoint_by_reg(np, 0);
>> +       of_node_put(np);
>> +       if (!ep)
>> +               return NULL;
>> +
>> +       np = of_graph_get_remote_port_parent(ep);
>> +       of_node_put(ep);
>> +
>> +       return np;
>> +}
>> +
>> +static int tc358764_parse_dt(struct tc358764 *ctx)
>> +{
>> +       struct device *dev = ctx->dev;
>> +       struct device_node *np = dev->of_node;
>> +       struct device_node *lvds;
>> +
>> +       ctx->reset_gpio = of_get_named_gpio(np, "reset-gpio", 0);
>> +       if (ctx->reset_gpio < 0) {
>> +               dev_err(dev, "no reset GPIO pin provided\n");
>> +               //return ctx->reset_gpio;
> Seem like your mistake.
Thanks, it should not be commented, it sneaked out somehow.
>
>> +       }
>> +
>> +       lvds = tc358764_of_find_panel_node(ctx->dev);
> Isn't lvds device_node object of real lcd panel device, hv070wsa-100?
> it seems like more meaningful to use panel instead of lvds.
Yes I will change it.
>
>> +       if (!lvds) {
>> +               dev_err(dev, "cannot find panel node\n");
>> +               return -EINVAL;
>> +       }
>> +       ctx->panel = of_drm_find_panel(lvds);
>> +       if (!ctx->panel) {
>> +               dev_info(dev, "panel not registered\n");
>> +               return -EPROBE_DEFER;
> That is what I concerned. This driver uses deferred probe feature
> because real LCD panel driver couldn't be probed yet at this moment.
> That isn't reasonable to me. There would be a better way than this
> one.
I think it can be avoided using your super-node patches.

Anyway deferred probe is used anyway, the bridge and the panel
can use other resources like regulators, clocks which can be also not
yet present during probe.

>
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int tc358764_configure_regulators(struct tc358764 *ctx)
>> +{
>> +       int i, ret;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(ctx->supplies); ++i)
>> +               ctx->supplies[i].supply = tc358764_supplies[i];
>> +
>> +       ret = devm_regulator_bulk_get(ctx->dev, ARRAY_SIZE(ctx->supplies),
>> +                                     ctx->supplies);
>> +       if (ret < 0)
>> +               dev_info(ctx->dev, "failed to get regulators: %d\n", ret);
>> +
>> +       return ret;
>> +}
>> +
>> +static int tc358764_probe(struct mipi_dsi_device *dsi)
>> +{
>> +       struct device *dev = &dsi->dev;
>> +       struct tc358764 *ctx;
>> +       int ret;
>> +
>> +       ctx = devm_kzalloc(dev, sizeof(struct tc358764), GFP_KERNEL);
>> +       if (!ctx) {
>> +               dev_err(dev, "failed to allocate tc358764 structure.\n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       mipi_dsi_set_drvdata(dsi, ctx);
>> +
>> +       ctx->dev = dev;
>> +
>> +       dsi->lanes = 4;
>> +       dsi->format = MIPI_DSI_FMT_RGB888;
>> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
>> +               | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
> Is it right for the pixel format, mode type and lane count are fixed?
> I think these could be changed according to LCD type and its
> resolution.
I have no access to tc358764 datasheet so I can only guess
that some parameters are determined by LCD but the bridge
is also capable to perform some conversions.

I set parameters here as sane defaults. If there will be other use cases
than arndale it can be extended in the future.

Regards
Andrzej

>
>> +
>> +       ret = tc358764_parse_dt(ctx);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = tc358764_configure_regulators(ctx);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = devm_gpio_request_one(dev, ctx->reset_gpio, GPIOF_DIR_OUT,
>> +                                   "TC358764_RESET");
>> +       if (ret < 0) {
>> +               dev_info(dev, "failed to request reset gpio\n");
>> +               return ret;
>> +       }
>> +
>> +       drm_panel_init(&ctx->bridge);
>> +       ctx->bridge.dev = dev;
>> +       ctx->bridge.funcs = &tc358764_drm_funcs;
>> +
>> +       ret = drm_panel_add(&ctx->bridge);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = mipi_dsi_attach(dsi);
>> +       if (ret < 0)
>> +               drm_panel_remove(&ctx->bridge);
>> +
>> +       return ret;
>> +}
>> +
>> +static int tc358764_remove(struct mipi_dsi_device *dsi)
>> +{
>> +       struct tc358764 *ctx = mipi_dsi_get_drvdata(dsi);
>> +
>> +       tc358764_poweroff(ctx);
>> +
>> +       mipi_dsi_detach(dsi);
>> +       drm_panel_remove(&ctx->bridge);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct of_device_id tc358764_of_match[] = {
>> +       { .compatible = "toshiba,tc358764" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, tc358764_of_match);
>> +
>> +static struct mipi_dsi_driver tc358764_driver = {
>> +       .probe = tc358764_probe,
>> +       .remove = tc358764_remove,
>> +       .driver = {
>> +               .name = "panel_tc358764",
>> +               .owner = THIS_MODULE,
>> +               .of_match_table = tc358764_of_match,
>> +       },
>> +};
>> +module_mipi_dsi_driver(tc358764_driver);
>> +
>> +MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
>> +MODULE_DESCRIPTION("MIPI-DSI based Driver for TC358764 DSI/LVDS Bridge");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel

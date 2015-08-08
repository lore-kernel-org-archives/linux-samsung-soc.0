From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 4/8] drm: rockchip/dp: add rockchip platform dp driver
Date: Sat, 8 Aug 2015 11:54:38 +0800
Message-ID: <55C57D7E.6080800@rock-chips.com>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com>
 <1438944380-18897-1-git-send-email-ykk@rock-chips.com>
 <1730542.s7otqjtiXD@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:49007 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbbHHDzX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 23:55:23 -0400
In-Reply-To: <1730542.s7otqjtiXD@diego>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, joe@perches.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, ajaynumb@gmail.com, dri-devel@lists.freedesktop.orglinu

Hi Hekio,

=E5=9C=A8 2015/8/8 6:46, Heiko St=C3=BCbner =E5=86=99=E9=81=93:
> Hi Yakir,
>
>
> I think this Rockchip portion is missing a devicetree binding.

Oh, thanks, I would complete it in next  ;)

> You have the ability to power down the actual edp phy by using
> grf_edp_iddq_en from GRF_SOC_CON12. This is similar to how the
> rk3288 usb-phy gets put into a deeper state. So maybe you could
> provide a phy driver (drivers/phy) for this similar to what the
> exynos-dp does.
Okay, so I need to add a new phy-rockchip-dp.c, include=20
power_on/power_off ops, thanks.

>
> Some more stuff inline. But I guess by no means complete, as I'm
> still trying to integrate this into my development-tree.
>
>
> Am Freitag, 7. August 2015, 05:46:20 schrieb Yakir Yang:
>> Rockchip have three clocks for dp controller, we leave pclk_edp
>> to analogix_dp driver control, and keep the sclk_edp_24m and
>> sclk_edp in platform driver.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v2: None
>>
>>   drivers/gpu/drm/rockchip/Kconfig                |  10 +
>>   drivers/gpu/drm/rockchip/Makefile               |   1 +
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 419
>> ++++++++++++++++++++++++ 3 files changed, 430 insertions(+)
>>   create mode 100644 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig
>> b/drivers/gpu/drm/rockchip/Kconfig index 35215f6..096ed77 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -25,3 +25,13 @@ config ROCKCHIP_DW_HDMI
>>   	  for the Synopsys DesignWare HDMI driver. If you want to
>>   	  enable HDMI on RK3288 based SoC, you should selet this
>>   	  option.
>> +
>> +
> nit: double blank line
Done,

>
>> +config ROCKCHIP_ANALOGIX_DP
>> +        tristate "Rockchip specific extensions for Analogix DP driv=
er"
>> +        depends on DRM_ROCKCHIP
>> +        select DRM_ANALOGIX_DP
>> +        help
>> +	  This selects support for Rockchip SoC specific extensions
>> +	  for the Analogix Core DP driver. If you want to enable DP
>> +	  on RK3288 based SoC, you should selet this option.
> [...]
>
>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c new file mode 1006=
44
>> index 0000000..2f86e5e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -0,0 +1,419 @@
>> +/*
>> + * Rockchip SoC DP (Display Port) interface driver.
>> + *
>> + * Copyright (C) Fuzhou Rockchip Electronics Co., Ltd.
>> + * Author: Andy Yan <andy.yan@rock-chips.com>
>> + *         Yakir Yang <ykk@rock-chips.com>
>> + *         Jeff Chen <jeff.chen@rock-chips.com>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify it
>> + * under the terms of the GNU General Public License as published b=
y the
>> + * Free Software Foundation; either version 2 of the License, or (a=
t your
>> + * option) any later version.
>> + */
>> +#include <drm/drmP.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_dp_helper.h>
>> +
>> +#include <linux/component.h>
>> +#include <linux/clk.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +
>> +#include <video/of_videomode.h>
>> +#include <video/videomode.h>
>> +
>> +#include <drm/bridge/analogix_dp.h>
>> +
>> +#include "rockchip_drm_drv.h"
>> +#include "rockchip_drm_vop.h"
>> +
>> +#define encoder_to_dp(c) \
>> +		container_of(c, struct rockchip_dp_device, encoder)
>> +
>> +#define plat_data_to_dp(pd) \
>> +		container_of(pd, struct rockchip_dp_device, plat_data)
>> +
>> +/* dp grf register offset */
>> +#define DP_VOP_SEL                              0x025c /* grf_soc_c=
on6 */
>> +#define DP_REF_CLK_SEL                          0x0274 /* grf_soc_c=
on12 */
>> +
>> +#define GRF_DP_REF_CLK_SEL_INTER                BIT(4)
>> +#define DP_SEL_VOP_LIT				BIT(5)
>> +
>> +struct rockchip_dp_device {
>> +	struct drm_device        *drm_dev;
>> +	struct device            *dev;
>> +	struct drm_encoder       encoder;
>> +	struct drm_display_mode  mode;
>> +
>> +	struct clk               *clk_dp;
>> +	struct clk               *clk_24m_parent;
> this clk_24m_parent does not seem used at all
Done,
>> +	struct clk               *clk_24m;
>> +	struct regmap            *grf;
>> +	struct reset_control     *rst;
>> +
>> +	struct analogix_dp_plat_data plat_data;
>> +};
>> +
> [...]
>
>> +static int rockchip_dp_init(struct rockchip_dp_device *dp)
>> +{
>> +	struct device *dev =3D dp->dev;
>> +	struct device_node *np =3D dev->of_node;
>> +	int ret;
>> +
>> +	dp->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>> +	if (IS_ERR(dp->grf)) {
>> +		dev_err(dev,
>> +			"rk3288-dp needs rockchip,grf property\n");
>> +		return PTR_ERR(dp->grf);
>> +	}
>> +
>> +	dp->clk_dp =3D devm_clk_get(dev, "clk_dp");
> I've looked at the manual, but couldn't find an actual clock-name
> used there. Is it really "clk_dp" or should it just be "dp"?
This should be "clk_dp", not "dp".
Cause analogix_dp_core would need a clock name with "dp", so I would
rather to pasted my rockchip-dp node here before I add dt-bindings in
next version ;)

         edp: edp@ff970000 {
                 compatible =3D "rockchip,rk3288-dp";
                 reg =3D <0xff970000 0x4000>;
                 interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;

                 clocks =3D <&cru SCLK_EDP>, <&cru SCLK_EDP_24M>, <&cru=
=20
PCLK_EDP_CTRL>;
                 clock-names =3D "clk_dp", "clk_dp_24m", "dp";

                 rockchip,grf =3D <&grf>;
                 resets =3D <&cru 111>;
                 reset-names =3D "dp";
                 power-domains =3D <&power RK3288_PD_VIO>;
                 status =3D "disabled";

                 hsync-active-high =3D <0>;
                 vsync-active-high =3D <0>;
                 interlaced =3D <0>;
                 samsung,color-space =3D <0>;
                 samsung,dynamic-range =3D <0>;
                 samsung,ycbcr-coeff =3D <0>;
                 samsung,color-depth =3D <1>;
                 samsung,link-rate =3D <0x0a>;
                 samsung,lane-count =3D <1>;

                 ports {
                         edp_in: port {
                                 #address-cells =3D <1>;
                                 #size-cells =3D <0>;
                                 edp_in_vopb: endpoint@0 {
                                         reg =3D <0>;
                                         remote-endpoint =3D <&vopb_out=
_edp>;
                                 };
                         };
                 };

>> +
>> +	dp->clk_24m =3D devm_clk_get(dev, "clk_dp_24m");
> Same here, maybe "dp_24m".
Like my previous reply. And actually as those two clocks all have
a common prefix "SCLK" in rk3288 clock tree, I thinkt we can name
them to "sclk_dp" & "sclk_dp_24m", is it okay ?

>
>> +	if (IS_ERR(dp->clk_24m)) {
>> +		dev_err(dev, "cannot get clk_dp_24m\n");
>> +		return PTR_ERR(dp->clk_24m);
>> +	}
> I think you're missing the pclk here (PCLK_EDP_CTRL) or is this part =
of
> something else?

Whops, as I refered in commit message I leave pclk_dp to=20
analogix_dp_core driver ;-)

The reason why I want to leave pclk is I thought this clock is more lik=
e=20
analogix dp
core driver want, like a IP controller clock (whatever analogix_dp do=20
need a clock
named with "dp").

>
>> +
>> +	dp->rst =3D devm_reset_control_get(dev, "dp");
>> +	if (IS_ERR(dp->rst)) {
>> +		dev_err(dev, "failed to get reset\n");
>> +		return PTR_ERR(dp->rst);
>> +	}
>> +
>> +	ret =3D rockchip_dp_clk_enable(dp);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "cannot enable dp clk %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D rockchip_dp_pre_init(dp);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "failed to pre init %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
> [...]
>
>> +static int rockchip_dp_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct device_node *panel_node;
>> +	struct rockchip_dp_device *dp;
>> +	struct drm_panel *panel;
>> +
>> +	panel_node =3D of_parse_phandle(dev->of_node, "rockchip,panel", 0)=
;
>> +	if (!panel_node) {
>> +		DRM_ERROR("failed to find rockchip,panel dt node\n");
>> +		return -ENODEV;
>> +	}
> Personally I would prefer to continue with the of-graph framework to
> attach the panel instead of defining a special node. But I'm not
> authorative on this. But that way the dts could then look like [0].
>
> I've sucessfully modified the driver currently in use in Chromeos for=
 my
> dev-tree and have ported this change over onto your driver [1].

Wow! looks very nice, and really appricate for your ported code ;)

BTW should I rebase on your patch, or can just take your code in my nex=
t=20
version :-)


Thanks a lot,
- Yakir

>
> [0] https://github.com/mmind/linux-rockchip/blob/devel/somewhat-stabl=
e/arch/arm/boot/dts/rk3288-veyron-edp.dtsi#L76
> [1]
> ---------- 8< -------------
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/driver=
s/gpu/drm/rockchip/analogix_dp-rockchip.c
> index e7cf9ab..24e872d 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -20,6 +20,7 @@
>   #include <linux/component.h>
>   #include <linux/clk.h>
>   #include <linux/mfd/syscon.h>
> +#include <linux/of_graph.h>
>   #include <linux/regmap.h>
>   #include <linux/reset.h>
>  =20
> @@ -335,14 +336,28 @@ static const struct component_ops rockchip_dp_c=
omponent_ops =3D {
>   static int rockchip_dp_probe(struct platform_device *pdev)
>   {
>   	struct device *dev =3D &pdev->dev;
> -	struct device_node *panel_node;
> +	struct device_node *panel_node, *port, *endpoint;
>   	struct rockchip_dp_device *dp;
>   	struct drm_panel *panel;
>  =20
> -	panel_node =3D of_parse_phandle(dev->of_node, "rockchip,panel", 0);
> +	port =3D of_graph_get_port_by_id(dev->of_node, 1);
> +	if (!port) {
> +		dev_err(dev, "can't find output port\n");
> +		return -EINVAL;
> +	}
> +
> +	endpoint =3D of_get_child_by_name(port, "endpoint");
> +	of_node_put(port);
> +	if (!endpoint) {
> +		dev_err(dev, "no output endpoint found\n");
> +		return -EINVAL;
> +	}
> +
> +	panel_node =3D of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
>   	if (!panel_node) {
> -		DRM_ERROR("failed to find rockchip,panel dt node\n");
> -		return -ENODEV;
> +		dev_err(&pdev->dev, "no output node found\n");
> +		return -EINVAL;
>   	}
>  =20
>   	panel =3D of_drm_find_panel(panel_node);
> ---------- 8< -------------
>
>
>
>

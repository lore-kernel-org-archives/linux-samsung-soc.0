From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 4/8] drm: rockchip/dp: add rockchip platform dp driver
Date: Mon, 10 Aug 2015 14:08:41 +0200
Message-ID: <2657934.h7jy1M3E7a@diego>
References: <1438943674-18191-1-git-send-email-ykk@rock-chips.com> <1730542.s7otqjtiXD@diego> <55C57D7E.6080800@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:34979 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750825AbbHJMJK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 08:09:10 -0400
In-Reply-To: <55C57D7E.6080800@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, joe@perches.com, Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, ajaynumb@gmail.com, dri-devel@lists.freedesktop.orglinu

Hi Yakir,

Am Samstag, 8. August 2015, 11:54:38 schrieb Yakir Yang:
> >> +static int rockchip_dp_init(struct rockchip_dp_device *dp)
> >> +{
> >> +	struct device *dev = dp->dev;
> >> +	struct device_node *np = dev->of_node;
> >> +	int ret;
> >> +
> >> +	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> >> +	if (IS_ERR(dp->grf)) {
> >> +		dev_err(dev,
> >> +			"rk3288-dp needs rockchip,grf property\n");
> >> +		return PTR_ERR(dp->grf);
> >> +	}
> >> +
> >> +	dp->clk_dp = devm_clk_get(dev, "clk_dp");
> > 
> > I've looked at the manual, but couldn't find an actual clock-name
> > used there. Is it really "clk_dp" or should it just be "dp"?
> 
> This should be "clk_dp", not "dp".
> Cause analogix_dp_core would need a clock name with "dp", so I would
> rather to pasted my rockchip-dp node here before I add dt-bindings in
> next version ;)

The clock we name PCLK_EDP_CTRL in the clock controller is probably the clock 
supplying the APB interface and named pclk already in the "Figure 3-2 
DP_TXclock domain" diagram on page 19 of the manual. So your "clk_dp" should 
actually be "pclk".

So you would have "dp", "dp_24m" and "pclk" for the 3 supplying clocks.


> 
>          edp: edp@ff970000 {
>                  compatible = "rockchip,rk3288-dp";
>                  reg = <0xff970000 0x4000>;
>                  interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> 
>                  clocks = <&cru SCLK_EDP>, <&cru SCLK_EDP_24M>, <&cru
> PCLK_EDP_CTRL>;
>                  clock-names = "clk_dp", "clk_dp_24m", "dp";
> 
>                  rockchip,grf = <&grf>;
>                  resets = <&cru 111>;
>                  reset-names = "dp";
>                  power-domains = <&power RK3288_PD_VIO>;
>                  status = "disabled";
> 
>                  hsync-active-high = <0>;
>                  vsync-active-high = <0>;
>                  interlaced = <0>;
>                  samsung,color-space = <0>;
>                  samsung,dynamic-range = <0>;
>                  samsung,ycbcr-coeff = <0>;
>                  samsung,color-depth = <1>;
>                  samsung,link-rate = <0x0a>;
>                  samsung,lane-count = <1>;

Thierry already said, that these should probably be somehow auto-detected. 
Properties needing to stay around should probably also be "analogix,..." with 
a fallback to not break Samsung devicetrees, so
look for "analogix,foo!, if not found try "samsung,foo"


>                  ports {
>                          edp_in: port {
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
>                                  edp_in_vopb: endpoint@0 {
>                                          reg = <0>;
>                                          remote-endpoint = <&vopb_out_edp>;
>                                  };
>                          };
>                  };



> >> +
> >> +	dp->clk_24m = devm_clk_get(dev, "clk_dp_24m");
> > 
> > Same here, maybe "dp_24m".
> 
> Like my previous reply. And actually as those two clocks all have
> a common prefix "SCLK" in rk3288 clock tree, I thinkt we can name
> them to "sclk_dp" & "sclk_dp_24m", is it okay ?

As Thierry said, please don't add prefixes.


> 
> >> +	if (IS_ERR(dp->clk_24m)) {
> >> +		dev_err(dev, "cannot get clk_dp_24m\n");
> >> +		return PTR_ERR(dp->clk_24m);
> >> +	}
> > 
> > I think you're missing the pclk here (PCLK_EDP_CTRL) or is this part of
> > something else?
> 
> Whops, as I refered in commit message I leave pclk_dp to
> analogix_dp_core driver ;-)
> 
> The reason why I want to leave pclk is I thought this clock is more like
> analogix dp
> core driver want, like a IP controller clock (whatever analogix_dp do
> need a clock
> named with "dp").

Hmm, I'd think what the core (and Samsung) driver use as "dp" clock is 
probably the generic clock for the IP and not the pclk for the APB interface.

So I think it still should be  "dp" for the core and "dp_24m" + "pclk" for the 
rockchip part?


> 
> >> +
> >> +	dp->rst = devm_reset_control_get(dev, "dp");
> >> +	if (IS_ERR(dp->rst)) {
> >> +		dev_err(dev, "failed to get reset\n");
> >> +		return PTR_ERR(dp->rst);
> >> +	}
> >> +
> >> +	ret = rockchip_dp_clk_enable(dp);
> >> +	if (ret < 0) {
> >> +		dev_err(dp->dev, "cannot enable dp clk %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = rockchip_dp_pre_init(dp);
> >> +	if (ret < 0) {
> >> +		dev_err(dp->dev, "failed to pre init %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> > 
> > [...]
> > 
> >> +static int rockchip_dp_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct device_node *panel_node;
> >> +	struct rockchip_dp_device *dp;
> >> +	struct drm_panel *panel;
> >> +
> >> +	panel_node = of_parse_phandle(dev->of_node, "rockchip,panel", 0);
> >> +	if (!panel_node) {
> >> +		DRM_ERROR("failed to find rockchip,panel dt node\n");
> >> +		return -ENODEV;
> >> +	}
> > 
> > Personally I would prefer to continue with the of-graph framework to
> > attach the panel instead of defining a special node. But I'm not
> > authorative on this. But that way the dts could then look like [0].
> > 
> > I've sucessfully modified the driver currently in use in Chromeos for my
> > dev-tree and have ported this change over onto your driver [1].
> 
> Wow! looks very nice, and really appricate for your ported code ;)
> 
> BTW should I rebase on your patch, or can just take your code in my next
> version :-)

The code I currently carry, is from the ChromeOS tree, so of course nothing in 
mainline should be based on it. You could simply include the change into your 
driver.


Heiko

> 
> 
> Thanks a lot,
> - Yakir
> 
> > [0]
> > https://github.com/mmind/linux-rockchip/blob/devel/somewhat-stable/arch/a
> > rm/boot/dts/rk3288-veyron-edp.dtsi#L76 [1]
> > ---------- 8< -------------
> > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c index e7cf9ab..24e872d
> > 100644
> > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > @@ -20,6 +20,7 @@
> > 
> >   #include <linux/component.h>
> >   #include <linux/clk.h>
> >   #include <linux/mfd/syscon.h>
> > 
> > +#include <linux/of_graph.h>
> > 
> >   #include <linux/regmap.h>
> >   #include <linux/reset.h>
> > 
> > @@ -335,14 +336,28 @@ static const struct component_ops
> > rockchip_dp_component_ops = {> 
> >   static int rockchip_dp_probe(struct platform_device *pdev)
> >   {
> >   
> >   	struct device *dev = &pdev->dev;
> > 
> > -	struct device_node *panel_node;
> > +	struct device_node *panel_node, *port, *endpoint;
> > 
> >   	struct rockchip_dp_device *dp;
> >   	struct drm_panel *panel;
> > 
> > -	panel_node = of_parse_phandle(dev->of_node, "rockchip,panel", 0);
> > +	port = of_graph_get_port_by_id(dev->of_node, 1);
> > +	if (!port) {
> > +		dev_err(dev, "can't find output port\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	endpoint = of_get_child_by_name(port, "endpoint");
> > +	of_node_put(port);
> > +	if (!endpoint) {
> > +		dev_err(dev, "no output endpoint found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	panel_node = of_graph_get_remote_port_parent(endpoint);
> > +	of_node_put(endpoint);
> > 
> >   	if (!panel_node) {
> > 
> > -		DRM_ERROR("failed to find rockchip,panel dt node\n");
> > -		return -ENODEV;
> > +		dev_err(&pdev->dev, "no output node found\n");
> > +		return -EINVAL;
> > 
> >   	}
> >   	
> >   	panel = of_drm_find_panel(panel_node);
> > 
> > ---------- 8< -------------

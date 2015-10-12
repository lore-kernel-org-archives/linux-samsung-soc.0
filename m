From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v6 10/17] phy: Add driver for rockchip Display Port PHY
Date: Mon, 12 Oct 2015 18:18:41 +0200
Message-ID: <3399683.FyIv57FCEM@diego>
References: <1444491357-26095-1-git-send-email-ykk@rock-chips.com> <1444492559-27181-1-git-send-email-ykk@rock-chips.com> <561BCB97.3030201@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <561BCB97.3030201@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

Am Montag, 12. Oktober 2015, 20:32:47 schrieb Kishon Vijay Abraham I:
> Hi,
> 
> On Saturday 10 October 2015 09:25 PM, Yakir Yang wrote:
> > This phy driver would control the Rockchip DisplayPort module
> > phy clock and phy power, it is relate to analogix_dp-rockchip
> > dp driver. If you want DP works rightly on rockchip platform,
> > then you should select both of them.
> 
> Add phy driver for the Rockchip DisplayPort PHY module. This is required
> to get DisplayPort working in Rockchip SoCs.
> 
> > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > ---
> > Changes in v6: None
> > Changes in v5:
> > - Remove "reg" DT property, cause driver could poweron/poweroff phy via
> > 
> >   the exist "grf" syscon already. And rename the example DT node from
> >   "edp_phy: phy@ff770274" to "edp_phy: edp-phy" directly. (Heiko)
> > 
> > - Add deivce_node at the front of driver, update phy_ops type from "static
> > 
> >   struct" to "static const struct". And correct the input paramters of
> >   devm_phy_create() interfaces. (Heiko)
> > 
> > Changes in v4:
> > - Add commit message, and remove the redundant rockchip_dp_phy_init()
> > 
> >   function, move those code to probe() method. And remove driver .owner
> >   number. (Kishon)
> > 
> > Changes in v3:
> > - Suggest, add rockchip dp phy driver, collect the phy clocks and
> > 
> >   power control. (Heiko)
> > 
> > Changes in v2: None
> > 
> >  drivers/phy/Kconfig           |   7 ++
> >  drivers/phy/Makefile          |   1 +
> >  drivers/phy/phy-rockchip-dp.c | 151
> >  ++++++++++++++++++++++++++++++++++++++++++ 3 files changed, 159
> >  insertions(+)
> >  create mode 100644 drivers/phy/phy-rockchip-dp.c
> > 
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 47da573..8f2bc4f 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -310,6 +310,13 @@ config PHY_ROCKCHIP_USB
> > 
> >  	help
> >  	
> >  	  Enable this to support the Rockchip USB 2.0 PHY.
> > 
> > +config PHY_ROCKCHIP_DP
> > +	tristate "Rockchip Display Port PHY Driver"
> > +	depends on ARCH_ROCKCHIP && OF
> > +	select GENERIC_PHY
> > +	help
> > +	  Enable this to support the Rockchip Display Port PHY.
> > +
> > 
> >  config PHY_ST_SPEAR1310_MIPHY
> >  
> >  	tristate "ST SPEAR1310-MIPHY driver"
> >  	select GENERIC_PHY
> > 
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index a5b18c1..e281f35 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -34,6 +34,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+=
> > phy-s5pv210-usb2.o> 
> >  obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
> >  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_USB) += phy-rockchip-usb.o
> > 
> > +obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
> > 
> >  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
> >  obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)	+= phy-spear1310-miphy.o
> >  obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
> > 
> > diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.c
> > new file mode 100644
> > index 0000000..3a2ac120
> > --- /dev/null
> > +++ b/drivers/phy/phy-rockchip-dp.c
> > @@ -0,0 +1,151 @@
> > +/*
> > + * Rockchip DP PHY driver
> > + *
> > + * Copyright (C) 2015 FuZhou Rockchip Co., Ltd.
> > + * Author: Yakir Yang <ykk@@rock-chips.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License.
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/clk.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define GRF_SOC_CON12                   0x0274
> > +#define GRF_EDP_REF_CLK_SEL_INTER	BIT(4)
> > +#define GRF_EDP_PHY_SIDDQ_WRITE_EN      BIT(21)
> > +#define GRF_EDP_PHY_SIDDQ_ON            0
> > +#define GRF_EDP_PHY_SIDDQ_OFF           BIT(5)
> > +
> > +struct rockchip_dp_phy {
> > +	struct device  *dev;
> > +	struct regmap  *grf;
> > +	struct clk     *phy_24m;
> > +};
> > +
> > +static int rockchip_set_phy_state(struct phy *phy, bool enable)
> > +{
> > +	struct rockchip_dp_phy *dp = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	if (enable) {
> > +		ret = clk_prepare_enable(dp->phy_24m);
> > +		if (ret < 0) {
> > +			dev_err(dp->dev, "Can't enable clock 24m %d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		ret = regmap_write(dp->grf, GRF_SOC_CON12,
> > +				   GRF_EDP_PHY_SIDDQ_WRITE_EN |
> > +				   GRF_EDP_PHY_SIDDQ_ON);
> > +	} else {
> > +		clk_disable_unprepare(dp->phy_24m);
> 
> should clk_disable come after regmap_write? It'll be symmetric to enable?
> 
> > +		ret = regmap_write(dp->grf, GRF_SOC_CON12,
> > +				   GRF_EDP_PHY_SIDDQ_WRITE_EN |
> > +				   GRF_EDP_PHY_SIDDQ_OFF);
> 
> Is this syscon register used only by Display Port PHY? Better to use
> regmap_update API?

Rockchip's GRF syscon registers use what gets called "Hiword-mask", so when 
writing you actually need to set the write-enable bit (x+16, like 
GRF_EDP_PHY_SIDDQ_WRITE_EN here) if you want to set bit x. No other bits get 
affected by this.


Heiko

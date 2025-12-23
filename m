Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060211B4F2C;
	Tue, 23 Dec 2025 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498673; cv=none; b=YNRYeRerl+JnFnikfm0w1+J6xtUwaeR3+FB/TDNM+YcH89Iu+CAZusPGVJ5GZGpBpmi65mek5GkNQ39wJwWSyHg+By11swrTMNtOx9LugkdfQQ4HhWXA5NEX59XNdb8Qgb3oKmtGn0w1eo5JEW5A/bs0H4j9D5eHcJ9POnZ9Zco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498673; c=relaxed/simple;
	bh=ZeXkK2uPzTjDQCFCwwgySlxCMu0A7RZ0yee4oYqxYfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yfw57vGj//bp04JxHaCwGrEmePNXRNrJB0zqLwBszYEVQ/g88Gp0iE7tSnS314yTaK5fyanePQQjaZPtDUAsczslEOjqm0uP3GE+g82t5qdSyWB3PoRZiidp6I7kDMPuaFrG2itcop+IJxCb33DrkKSpWQ4iWETjgxTEuUrLLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt9l0Ehu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt9l0Ehu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A376C113D0;
	Tue, 23 Dec 2025 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766498672;
	bh=ZeXkK2uPzTjDQCFCwwgySlxCMu0A7RZ0yee4oYqxYfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gt9l0EhuDOR+XHKLgeaY7sOFWZ5L2QD73nbQsHjrr4UYmUjMeJwAY66zAfpl+e4Uv
	 3AxVnEOaVlcqe9/JciVg31sBY19wi+zyfJZAB6mGFsk9fFX92n4EJH9KEINGt3nnDw
	 sGLpY4wGMY50LPevjnMBDDGop7hILzrHDP1X7dlaYJAccYlYSEZfXggSLgSKfRZBVb
	 zApIcOWsP7c9LoL1dRWRjg6O/r9y6wXUaqn7iaOtgMgfVqZ9v/Q6CKoZKbqmJW0l27
	 PPThNDrlEVuYC1MwP+rMe9Vlpc+klNr5mf2JMR7xVcETYKN+f0/mVITUarzXlg5jhP
	 tIEHgwZ7uNLiA==
Date: Tue, 23 Dec 2025 19:34:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
Message-ID: <aUqhbVFHczpL9qnL@vaman>
References: <20251222-phyb4-v9-0-82c0b671b070@google.com>
 <20251222-phyb4-v9-2-82c0b671b070@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-phyb4-v9-2-82c0b671b070@google.com>

On 22-12-25, 21:31, Roy Luo wrote:
> Support the USB PHY found on Google Tensor G5 (Laguna). This
> particular USB PHY supports both high-speed and super-speed
> operations, and is integrated with the SNPS DWC3 controller that's
> also on the SoC. This initial patch specifically adds functionality
> for high-speed.
> 
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/phy/Kconfig          |  10 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-google-usb.c | 295 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 307 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a2e94be2f5c5e6e7315bb7bec385798dbd52493..afd0d7484ffe5fa652798c9b3c86ae6d83302382 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10725,6 +10725,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
>  F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
>  F:	arch/arm64/boot/dts/exynos/google/
>  F:	drivers/clk/samsung/clk-gs101.c
> +F:	drivers/phy/phy-google-usb.c
>  F:	drivers/soc/samsung/gs101-pmu.c
>  F:	drivers/phy/samsung/phy-gs101-ufs.c
>  F:	include/dt-bindings/clock/google,gs101*
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0aa0597773433f04d2a9ba77474d2a..5a642e04caeeea9d40ac583767622cff2ef5e80c 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -101,6 +101,16 @@ config PHY_NXP_PTN3222
>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>  	  Speed and High Speed.
>  
> +config PHY_GOOGLE_USB

This does not seem sorted!

> +	tristate "Google Tensor SoC USB PHY driver"
> +	select GENERIC_PHY
> +	help
> +	  Enable support for the USB PHY on Google Tensor SoCs, starting with
> +	  the G5 generation (Laguna). This driver provides the PHY interfaces
> +	  to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
> +	  both of which are integrated with the DWC3 USB DRD controller.
> +	  This driver currently supports USB high-speed.
> +
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..aeaaaf988554a24bb572d8b34b54638a6a3aed73 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
>  obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
> +obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o

and here!

>  obj-y					+= allwinner/	\
>  					   amlogic/	\
>  					   broadcom/	\
> diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..97e345fdab9b3679e7a76f6957ae3814ef3420e8
> --- /dev/null
> +++ b/drivers/phy/phy-google-usb.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * phy-google-usb.c - Google USB PHY driver
> + *
> + * Copyright (C) 2025, Google LLC
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/usb/typec_mux.h>
> +
> +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
> +
> +#define USBCS_USB2PHY_CFG21_OFFSET 0x8
> +#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
> +#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
> +#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
> +
> +#define USBCS_PHY_CFG1_OFFSET 0x28
> +#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
> +
> +enum google_usb_phy_id {
> +	GOOGLE_USB2_PHY,
> +	GOOGLE_USB_PHY_NUM,
> +};
> +
> +struct google_usb_phy_instance {
> +	int index;

maybe use unsigned?

> +	struct phy *phy;
> +	int num_clks;

here too?

> +	struct clk_bulk_data *clks;
 +	int num_rsts;

and here?

> +	struct reset_control_bulk_data *rsts;
> +};
> +
> +struct google_usb_phy {
> +	struct device *dev;
> +	struct regmap *usb_cfg_regmap;
> +	unsigned int usb2_cfg_offset;
> +	void __iomem *usbdp_top_base;
> +	struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];

so you have an array for one phy?

> +	/*
> +	 * Protect phy registers from concurrent access, specifically via
> +	 * google_usb_set_orientation callback.
> +	 */
> +	struct mutex phy_mutex;
> +	struct typec_switch_dev *sw;
> +	enum typec_orientation orientation;
> +};
> +
> +static inline struct google_usb_phy *to_google_usb_phy(struct google_usb_phy_instance *inst)
> +{
> +	return container_of(inst, struct google_usb_phy, insts[inst->index]);
> +}
> +
> +static void set_vbus_valid(struct google_usb_phy *gphy)
> +{
> +	u32 reg;
> +
> +	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
> +		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> +		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	} else {
> +		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
> +		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
> +	}
> +}
> +
> +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> +				      enum typec_orientation orientation)
> +{
> +	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +
> +	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> +
> +	gphy->orientation = orientation;
> +
> +	if (pm_runtime_suspended(gphy->dev))
> +		return 0;
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	set_vbus_valid(gphy);
> +
> +	return 0;
> +}
> +
> +static int google_usb2_phy_init(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = to_google_usb_phy(inst);
> +	u32 reg;
> +	int ret = 0;

superfluous init

> +
> +	dev_dbg(gphy->dev, "initializing usb2 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> +	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> +	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> +	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> +	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> +
> +	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, &reg);
> +	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> +	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
> +	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, reg);
> +
> +	set_vbus_valid(gphy);
> +
> +	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +		return ret;
> +	}
> +
> +	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> +	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
> +	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> +
> +	return ret;

would it not be return 0 here? can it be any other value

> +}
> +
> +static int google_usb2_phy_exit(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = to_google_usb_phy(inst);
> +	u32 reg;
> +
> +	dev_dbg(gphy->dev, "exiting usb2 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> +	reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> +	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> +
> +	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> +	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops google_usb2_phy_ops = {
> +	.init		= google_usb2_phy_init,
> +	.exit		= google_usb2_phy_exit,
> +};

Only two ops? I would expect more... No power_on/off or set_mode?

-- 
~Vinod

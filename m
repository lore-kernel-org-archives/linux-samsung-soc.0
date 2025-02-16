Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D310D18BC3F;
	Sun, 16 Feb 2025 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698592; cv=none; b=ecZl98AROs+KB/5J6o5v9aNdmEfqN/Tm7MUlOQ4zF86t93FZxX9vqUeTbooladOPd7x/6qB+nRzgsBFwR3WldeXV98vB7aWK29cRFOQmqFhQ5Hv4hEAmp5GwkXohcsenSjgRwG+oZnQuUSraDzONw4H1XAnXYoSIsGpOZi6ITr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698592; c=relaxed/simple;
	bh=I8VBKT38cAjiVuQ2bqFuP/8lqdbB8lEB6VncCo4f1To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkDOblaFfjkLULil0Mfxhk7Ihzz0czHjFhEe+Y9qvZYuM3SAzlt2+DpUYbLegsmwGXVmYU9l7WTNu0hIZMkFbWcX2nPMqAJIprMjmO3Z30kcfBESfE1NMfFDOcxjQArB61jAuHL4kiJdrh/p+gg/RJjzQWkVGBcV/BqdENSLeCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6Zzo9H8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6Zzo9H8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A74C4CEDD;
	Sun, 16 Feb 2025 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739698592;
	bh=I8VBKT38cAjiVuQ2bqFuP/8lqdbB8lEB6VncCo4f1To=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u6Zzo9H8P7dKXNBPbSqn3mH1AuPRBNONWF0JzGH0D6Q+WfpOW8eBk8lOxfG9fbtDM
	 2Fd7mLMhYJVh/vDvAuJhXdZIG6udeMCG2wzpq4evAhgtJc9cT5r3Co81MV2hBicmir
	 Ms/b7NwcVAvNXd9eNsMpkY29D8KJfgx3G36hVoFpcnp3fcreR7YQfHMLmod628AuE3
	 R+OmzB22x/brI7ns7V1LkipyhoV0292IBcmDgmcpJ3DE3dbJzGzOF9qPsy0qp+c6NI
	 ps3CFFhqYg6HWWvJhUM3ymc5RCHBuXmLIuj36E5uAyRDyhgHSeog3fdpqgwOyJ5oX9
	 9WUFGW17a5fQg==
Message-ID: <32b67c56-9331-4391-90ad-031e0388434f@kernel.org>
Date: Sun, 16 Feb 2025 10:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] phy: samsung: add Exynos2200 usb phy controller
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-5-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250215122409.162810-5-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2025 13:24, Ivaylo Ivanov wrote:
> The Exynos2200 SoC comes with 3 PHYs - snps eUSB2, snps USBDP combophy
> and a cut-off phy that origins from exynos5-usbdrd. The latter is used
> for link control, as well as pipe3 attachment and detachment.
> 
> Add a new driver for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/samsung/Kconfig                 |  13 ++
>  drivers/phy/samsung/Makefile                |   1 +
>  drivers/phy/samsung/phy-exynos2200-usbcon.c | 241 ++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |   3 +
>  4 files changed, 258 insertions(+)
>  create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index f62285254..47e9b9926 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -90,6 +90,19 @@ config PHY_EXYNOS2200_SNPS_EUSB2
>  	  This driver provides PHY interface for eUSB 2.0 controller
>  	  present on Exynos5 SoC series.
>  
> +config PHY_EXYNOS2200_USBCON
> +	tristate "Exynos2200 USBCON PHY driver"
> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	depends on USB_DWC3_EXYNOS

How? What are you using from DWC3?

> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	default y
> +	help
> +	  Enable USBCON PHY support for Exynos2200 SoC.
> +	  This driver provides PHY interface for USB controller present
> +	  on Exynos2200 SoC.
> +
>  config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
> index 90b84c7fc..f70e12ddf 100644
> --- a/drivers/phy/samsung/Makefile
> +++ b/drivers/phy/samsung/Makefile
> @@ -15,5 +15,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>  obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
> +obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
>  obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
> diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
> new file mode 100644
> index 000000000..7968c9792
> --- /dev/null
> +++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>

Are you using this header?

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>

And rhis?

> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>

And this?

> +#include <linux/soc/samsung/exynos-regs-pmu.h>
> +
> +#define EXYNOS2200_USBCON_LINKCTRL		0x4
> +#define LINKCTRL_FORCE_QACT			BIT(8)
> +
> +#define EXYNOS2200_USBCON_UTMI_CTRL		0x10
> +#define UTMI_CTRL_FORCE_VBUSVALID		BIT(1)
> +#define UTMI_CTRL_FORCE_BVALID			BIT(0)
> +
> +#define EXYNOS2200_USBCON_LINK_CLKRST		0xc
> +#define LINK_CLKRST_SW_RST			BIT(0)
> +
> +struct exynos2200_usbcon_phy_drvdata {
> +	const char * const *clk_names;
> +	int n_clks;
> +	const char * const *regulator_names;
> +	int n_regulators;
> +	u32 pmu_offset_usbcon_phy;
> +};
> +
> +struct exynos2200_usbcon_phy {
> +	struct phy *phy;
> +	void __iomem *base;
> +	struct regmap *reg_pmu;
> +	struct clk_bulk_data *clks;
> +	const struct exynos2200_usbcon_phy_drvdata *drv_data;
> +	u32 pmu_offset;
> +	struct regulator_bulk_data *vregs;
> +};
> +
> +static void exynos2200_usbcon_phy_isol(struct exynos2200_usbcon_phy *inst,
> +				       bool isolate)
> +{
> +	unsigned int val;
> +
> +	if (!inst->reg_pmu)
> +		return;
> +
> +	val = isolate ? 0 : EXYNOS4_PHY_ENABLE;
> +
> +	regmap_update_bits(inst->reg_pmu, inst->pmu_offset,
> +			   EXYNOS4_PHY_ENABLE, val);
> +}
> +
> +static void exynos2200_usbcon_phy_write_mask(void __iomem *base, u32 offset,
> +					     u32 mask, u32 val)
> +{
> +	u32 reg;
> +
> +	reg = readl_relaxed(base + offset);
> +	reg &= ~mask;
> +	reg |= val & mask;
> +	writel_relaxed(reg, base + offset);
> +
> +	/* Ensure above write is completed */
> +	readl_relaxed(base + offset);

None of these should be relaxed.

> +}
> +
> +static int exynos2200_usbcon_phy_init(struct phy *p)
> +{
> +	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(phy->drv_data->n_regulators, phy->vregs);
> +	if (ret)
> +		return ret;
> +
> +	exynos2200_usbcon_phy_isol(phy, false);
> +
> +	/*
> +	 * Disable HWACG (hardware auto clock gating control). This will force
> +	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
> +	 * the PHY clock is not gated by the hardware.
> +	 */
> +	exynos2200_usbcon_phy_write_mask(phy->base, EXYNOS2200_USBCON_LINKCTRL,
> +					 LINKCTRL_FORCE_QACT,
> +					 LINKCTRL_FORCE_QACT);
> +
> +	/* Reset Link */
> +	exynos2200_usbcon_phy_write_mask(phy->base,
> +					 EXYNOS2200_USBCON_LINK_CLKRST,
> +					 LINK_CLKRST_SW_RST,
> +					 LINK_CLKRST_SW_RST);
> +
> +	fsleep(10); /* required after POR high */
> +	exynos2200_usbcon_phy_write_mask(phy->base,
> +					 EXYNOS2200_USBCON_LINK_CLKRST,
> +					 LINK_CLKRST_SW_RST, 0);
> +
> +	exynos2200_usbcon_phy_write_mask(phy->base,
> +					 EXYNOS2200_USBCON_UTMI_CTRL,
> +					 UTMI_CTRL_FORCE_BVALID |
> +					 UTMI_CTRL_FORCE_VBUSVALID,
> +					 UTMI_CTRL_FORCE_BVALID |
> +					 UTMI_CTRL_FORCE_VBUSVALID);
> +
> +	return 0;
> +}
> +
> +static int exynos2200_usbcon_phy_exit(struct phy *p)
> +{
> +	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
> +
> +	exynos2200_usbcon_phy_isol(phy, true);
> +
> +	regulator_bulk_disable(phy->drv_data->n_regulators, phy->vregs);


This looks like power off callback, not exit.

> +
> +	return 0;
> +}
> +
> +static const struct phy_ops exynos2200_usbcon_phy_ops = {
> +	.init		= exynos2200_usbcon_phy_init,
> +	.exit		= exynos2200_usbcon_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int exynos2200_usbcon_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct exynos2200_usbcon_phy *phy;
> +	const struct exynos2200_usbcon_phy_drvdata *drv_data;
> +	struct phy_provider *phy_provider;
> +	struct phy *generic_phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	drv_data = of_device_get_match_data(dev);
> +	if (!drv_data)
> +		return -EINVAL;
> +	phy->drv_data = drv_data;
> +
> +	phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	phy->clks = devm_kcalloc(dev, drv_data->n_clks,
> +				 sizeof(*phy->clks), GFP_KERNEL);
> +	if (!phy->clks)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < drv_data->n_clks; ++i)
> +		phy->clks[i].id = drv_data->clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, phy->drv_data->n_clks,
> +				phy->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get phy clock(s)\n");
> +
> +	phy->reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						       "samsung,pmu-syscon");

syscon_regmap_lookup_by_phandle_args

> +	if (IS_ERR(phy->reg_pmu)) {
> +		dev_err(dev, "Failed to lookup PMU regmap\n");
> +		return PTR_ERR(phy->reg_pmu);
> +	}
> +
> +	phy->pmu_offset = drv_data->pmu_offset_usbcon_phy;
> +	phy->vregs = devm_kcalloc(dev, drv_data->n_regulators,
> +				  sizeof(*phy->vregs), GFP_KERNEL);
> +	if (!phy->vregs)
> +		return -ENOMEM;
> +	regulator_bulk_set_supply_names(phy->vregs,
> +					drv_data->regulator_names,
> +					drv_data->n_regulators);
> +	ret = devm_regulator_bulk_get(dev, drv_data->n_regulators,
> +				      phy->vregs);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	generic_phy = devm_phy_create(dev, NULL, &exynos2200_usbcon_phy_ops);
> +	if (IS_ERR(generic_phy)) {
> +		dev_err(dev, "failed to create phy %d\n", ret);
> +		return PTR_ERR(generic_phy);
> +	}
> +
> +	dev_set_drvdata(dev, phy);
> +	phy_set_drvdata(generic_phy, phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		dev_err(dev, "failed to register phy provider\n");
> +		return PTR_ERR(phy_provider);


Same comments as on previous patch.



Best regards,
Krzysztof

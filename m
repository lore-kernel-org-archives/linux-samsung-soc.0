Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019911C84C8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740354903; cv=none; b=a23K7/De6rOWPFM5s97Lgsam5iuYNV2J9DklSdtNsHyIXsPDMqWsK28H/qJE1qqrIiezyAMreifeYmcfYBnYOZGBx3/LMdGkuGHXr4aSOA/RuEVHMmlq++S3rVIML3Rlqhe/Awk2xAn92kTv0g8zzhSJzAotklGBSmkg1rqk7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740354903; c=relaxed/simple;
	bh=MhI3+YlO7szsaGLZnhXiCP4zRGkkr3TjGs8hymUVHF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRCTFIZ5GNpLe1ZKZmD1cOzQeAr0jtH2BjF0j67Tpf3DgamicbJeuO90h5gp4Cxf54dDE7ZaFbxkBLYjf8pGwkxLLNouYKDICdvxWn5BQ8bPboV30DRA2KLxp0FPGiQhzMsfc016DKcSkGJ0tJzty6CJ9Eq7trk5kr6oAuUPL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPRZ2NQt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPRZ2NQt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54298ec925bso5706422e87.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 15:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354899; x=1740959699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MO69vvfxawoe2HNuQ/9QFZVUJBZNSU898FyLnskC1yc=;
        b=fPRZ2NQtvgsPig3m6Sg3uuOKpF/Ni0VekaWfR+tWDabrHpbvvJPDAAy/GtY/YLcEvp
         jiYnq7lyNTRp30gdAOUt8x7XHAHLMtzCvALp2/QILlhb9XKF9szjeGFiNFasaNMRMAww
         UmEWPgoiVP65ZxLtkyYSTsGqJJhihDYKJr5NOUivQ2fX/N2HlAeZkAkA1qeFtvl4S/Lm
         CG8t8+L2sPeNRKmbGj+NxMSKxTragh49IgAYdYy/W/5UwkBD94uCIaKI30mW4o++8i8O
         RVd2NVO5OG5v4Sjuwnkd47fxvF0FOhfNMwmxzTKYLWjuExLU2cOZjZrhImc+hzwSpSrB
         XMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354899; x=1740959699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MO69vvfxawoe2HNuQ/9QFZVUJBZNSU898FyLnskC1yc=;
        b=C+2jDMut7xyvjTZ/UuKj/7CXj8bk3EojxIHdtvpV0jVRGPORK/tAIdBSGa7Ob12EMR
         0MWAFxxXzWP809LZanzfSgHsMLqH6efaGQeqx//lt9z38ES1+dnfombrYC3mQ6Q6fiJp
         tYqdU2vgsgpgzfnmid4DiUNP1R4pd2FzfLZpG8JPyS0L4Ba7fDCFFswxsWLMZnE5DA1s
         fBGKwwR16rnw/xa/BYlLrOeb1HlWD478R5hBRYReeRuzJdqsTzBuxSuhVAR75jFoZfc+
         YR7F3Puy23OIIS+7YPNhzPP4ZW0UwR0cqz8vI+u43D3arzSz09JwETXiVIpGOtlYsERq
         dP6A==
X-Forwarded-Encrypted: i=1; AJvYcCVF3Q7i9DjYRLi0GErW6YqLj47zwNGag5+p3qMbKc0NRV37721z7NLBV6dCexmDbahGU3NqZrUl4mtLtpyhQMK1bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLhKKxEUVIl+fr4SQKowmGyri7mWcTPIxomxQ9RIAke8pvL9m
	QaWp2ASKRAOr1VTWGXsXiz9pnFgExtDOcJ8pjhudhUH0Mqonx/fLtnI9Uhpa6RU=
X-Gm-Gg: ASbGncuDwAGVcETrfKMT99Meqch3YWWjN8wX1cUHhisrDXv2F0wCs1xZQKjliPUzD/I
	ACoa6bwQPGfGPdnSWbnJhSh/wj7R9eZJdANnzlCBvMS4nzkL3P3Hkc6mVcF7t47qfgI5ae7reGu
	PrPLP4D+rUScoY+DouDtZQ/+AMn9zL0ID4p8FTBU0+3z7UJcstv3Y91jbAwjYNKPadp+6X8ic6x
	Q/VNQuxs7Y0I4a+CCb7P040Hjev2OIDhXAhrAwSxg2pYiNuYSHE2iQAmrFYVlBloBreth+1Bl+U
	ON8uDbBi6Qjc9weZRJBTVEzE7zr1R7IX85hNa1Nw7YWt18Rcm6tsnow1V5eZrhuWjSblCwCI4Ao
	TGJFD+g==
X-Google-Smtp-Source: AGHT+IHWZiY9l4ceFSLMfzXCkrvrA7BoZtPrqLKoUOz7ReQ2TLLajGXi72SpKOyuPoZptA2mBy16jg==
X-Received: by 2002:a05:6512:3b10:b0:545:2efc:745d with SMTP id 2adb3069b0e04-54838f79c81mr4594575e87.46.1740354898995;
        Sun, 23 Feb 2025 15:54:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5462f125a0esm1423144e87.24.2025.02.23.15.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:54:57 -0800 (PST)
Date: Mon, 24 Feb 2025 01:54:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] phy: samsung: add Exynos2200 usb phy controller
Message-ID: <tkzfgfbu6j22c75zieponozeld5vvlqv65fnzjy3n2am2ajim5@yhc3tcr5ulfy>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-9-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-9-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:27PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC comes with a TI external repeater and 3 USB PHYs:
> - snps eUSB2 for UTMI
> - snps USBDP combophy for PIPE3 and DP
> - samsung USBCON phy
> 
> The USBCON phy is an intermediary between the USB controller (DWC3)
> and the underlying PHYs. Add a new driver for it, modelled to take
> a phandle to the high-speed PHY for now.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/samsung/Kconfig                 |  12 +
>  drivers/phy/samsung/Makefile                |   1 +
>  drivers/phy/samsung/phy-exynos2200-usbcon.c | 250 ++++++++++++++++++++
>  3 files changed, 263 insertions(+)
>  create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index e2330b089..0f809a382 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -77,6 +77,18 @@ config PHY_S5PV210_USB2
>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>  	  are available - device and host.
>  
> +config PHY_EXYNOS2200_USBCON
> +	tristate "Exynos2200 USBCON PHY driver"
> +	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	default y
> +	help
> +	  Enable USBCON PHY support for Exynos2200 SoC.
> +	  This driver provides PHY interface for the USBCON phy, which acts as
> +	  an intermediary between the USB controller and underlying PHYs.
> +
>  config PHY_EXYNOS5_USBDRD
>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
> index fea1f96d0..e2686a3f5 100644
> --- a/drivers/phy/samsung/Makefile
> +++ b/drivers/phy/samsung/Makefile
> @@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
>  phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
>  phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
> +obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
>  obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
> diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
> new file mode 100644
> index 000000000..aad59349e
> --- /dev/null
> +++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/soc/samsung/exynos-regs-pmu.h>
> +
> +#define EXYNOS2200_USBCON_LINKCTRL		0x4
> +#define LINKCTRL_FORCE_QACT			BIT(8)
> +
> +#define EXYNOS2200_USBCON_UTMI_CTRL		0x10
> +#define UTMI_CTRL_FORCESLEEP			BIT(13)
> +#define UTMI_CTRL_FORCESUSPEND			BIT(12)
> +#define UTMI_CTRL_FORCE_VBUSVALID		BIT(1)
> +#define UTMI_CTRL_FORCE_BVALID			BIT(0)
> +
> +#define EXYNOS2200_USBCON_LINK_CLKRST		0xc
> +#define LINK_CLKRST_SW_RST			BIT(0)
> +
> +struct exynos2200_usbcon_phy_drvdata {
> +	const char * const *clk_names;
> +	int num_clks;
> +};
> +
> +struct exynos2200_usbcon_phy {
> +	struct phy *phy;
> +	void __iomem *base;
> +	struct regmap *reg_pmu;
> +	struct clk_bulk_data *clks;
> +	const struct exynos2200_usbcon_phy_drvdata *drv_data;
> +	u32 pmu_offset;
> +	struct phy *hs_phy;
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
> +	reg = readl(base + offset);
> +	reg &= ~mask;
> +	reg |= val & mask;
> +	writel(reg, base + offset);

Does this need any kind of locking? Maybe you can use regmap for this
access too?

> +
> +	/* Ensure above write is completed */
> +	readl(base + offset);
> +}

[...]

> +
> +	generic_phy = devm_phy_create(dev, NULL, &exynos2200_usbcon_phy_ops);
> +	if (IS_ERR(generic_phy))
> +		return dev_err_probe(dev, PTR_ERR(generic_phy),
> +				     "failed to create phy %d\n", ret);
> +
> +	dev_set_drvdata(dev, phy);

Nit: unused. LGTM otherwise.

> +	phy_set_drvdata(generic_phy, phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider))
> +		return dev_err_probe(dev, PTR_ERR(phy_provider),
> +				     "failed to register phy provider\n");
> +
> +	return 0;
> +}
> +
> +static const char * const exynos2200_clk_names[] = {
> +	"bus",
> +};
> +
> +static const struct exynos2200_usbcon_phy_drvdata exynos2200_usbcon_phy = {
> +	.clk_names		= exynos2200_clk_names,
> +	.num_clks		= ARRAY_SIZE(exynos2200_clk_names),
> +};
> +
> +static const struct of_device_id exynos2200_usbcon_phy_of_match_table[] = {
> +	{
> +		.compatible = "samsung,exynos2200-usbcon-phy",
> +		.data = &exynos2200_usbcon_phy,
> +	}, { },
> +};
> +MODULE_DEVICE_TABLE(of, exynos2200_usbcon_phy_of_match_table);
> +
> +static struct platform_driver exynos2200_usbcon_phy_driver = {
> +	.probe		= exynos2200_usbcon_phy_probe,
> +	.driver = {
> +		.name	= "exynos2200-usbcon-phy",
> +		.of_match_table = exynos2200_usbcon_phy_of_match_table,
> +	},
> +};
> +
> +module_platform_driver(exynos2200_usbcon_phy_driver);
> +MODULE_DESCRIPTION("Exynos2200 USBCON PHY driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

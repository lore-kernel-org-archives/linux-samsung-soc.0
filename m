Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97501ACDE7;
	Wed,  8 Jan 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325011; cv=none; b=pOe1N8Zm2P7woiiYEJAeV9lZ+KmilAsBWykc9LmHeC5vDdZ54+4dsouMjB3aC/uyRrMoyYrOvynaUG9tLrgm7Yo68Syc7p6fgv6Hquqfm2yf+0orj2NhdbZfoa4ziLBhosckvW7gyjwiZ6FGgQG9VcVfFbMzFJxwL4jDOn2m39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325011; c=relaxed/simple;
	bh=3JcTLjuITgq/DDD2A3JqldsGdYRSMSh/LyBDhJFq+Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CixIdKcfvy9He9sSXKjw+mPzyqieb5BdL79f5eUyXFrkocFNNEIm2kcMisy43tcPqNib/aAXwY/j0wOOVl5yvzRxy39Wak+WKVFNAFCE6p+4qwiN62OFTat8pN8lqJZXHgWTL5ZXDYlPwCF2ngJedAFX2EDvhWsv7D+1IOyYEpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLzbnTMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLzbnTMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E468C4CEE0;
	Wed,  8 Jan 2025 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736325011;
	bh=3JcTLjuITgq/DDD2A3JqldsGdYRSMSh/LyBDhJFq+Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLzbnTMM3rJJcLOJFd0WJ9PKG6mT0WbpfoCqRIXe5rsD5fgtrMm5hMVQ/GWfBuc73
	 +QIyRDE7WUNGOnYimsj6fmNEhFnNWeTEWsZl5YIYT15Eg99kldf+iemdnnWCBc5Egg
	 F/UQsAbYG3P29bB/9cbQXx5mtJkYX64SoleQubrlIU2XgkwoYb9n7Pf0zpkTTSWNeq
	 dbE3XXgS/Son1FOkewEBaxHpZa6GSYbySDKOOodc1UVmG9qKbIUeybKzSOQoxnoZn4
	 9E0/XokRRLLoqRqh2pF/jrFT4E7CQnd1JogR80sUGhrBKQkjlB080Yb+VEIwEulu5b
	 jUw3RJaO25wew==
Date: Wed, 8 Jan 2025 09:30:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1
 and exynos8895
Message-ID: <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>

On Tue, Jan 07, 2025 at 01:35:11PM +0200, Ivaylo Ivanov wrote:
> USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
> provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
> SPI, UART, UART_HSI2C1).
> 
> USIv1, unlike USIv2, doesn't have any known register map. Underlying
> protocols that it implements have no offset, like with Exynos850.
> Desired protocol can be chosen via SW_CONF register from System
> Register block of the same domain as USI.
> 
> In order to select a particular protocol, the protocol has to be
> selected via the System Register. Unlike USIv2, there's no need for
> any setup before the given protocol becomes accessible apart from
> enabling the APB clock and the protocol operating clock.
> 
> Modify the existing driver in order to allow USIv1 instances in
> Exynos8895 to probe and set their protocol. While we're at it,
> make use of the new mode constants in place of the old ones
> and add a removal routine.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
>  1 file changed, 95 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
> index 114352695..43c17b100 100644
> --- a/drivers/soc/samsung/exynos-usi.c
> +++ b/drivers/soc/samsung/exynos-usi.c
> @@ -16,6 +16,18 @@
>  
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> +/* USIv1: System Register: SW_CONF register bits */
> +#define USI_V1_SW_CONF_NONE		0x0
> +#define USI_V1_SW_CONF_I2C0		0x1
> +#define USI_V1_SW_CONF_I2C1		0x2
> +#define USI_V1_SW_CONF_I2C0_1		0x3
> +#define USI_V1_SW_CONF_SPI		0x4
> +#define USI_V1_SW_CONF_UART		0x8
> +#define USI_V1_SW_CONF_UART_I2C1	0xa
> +#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
> +					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
> +					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
> +
>  /* USIv2: System Register: SW_CONF register bits */
>  #define USI_V2_SW_CONF_NONE	0x0
>  #define USI_V2_SW_CONF_UART	BIT(0)
> @@ -34,7 +46,8 @@
>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>  
>  enum exynos_usi_ver {
> -	USI_VER2 = 2,
> +	USI_VER1 = 1,

Is this assignment=1 actually now helping? Isn't it creating empty item
in exynos_usi_modes array? Basically it wastes space in the array for
no benefits.

> +	USI_VER2,
>  };
>  
>  struct exynos_usi_variant {
> @@ -66,19 +79,39 @@ struct exynos_usi_mode {
>  	unsigned int val;		/* mode register value */
>  };
>  
> -static const struct exynos_usi_mode exynos_usi_modes[] = {
> -	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
> -	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
> -	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
> -	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
> +#define USI_MODES_MAX (USI_MODE_UART_I2C1 + 1)
> +static const struct exynos_usi_mode exynos_usi_modes[][USI_MODES_MAX] = {
> +	[USI_VER1] = {
> +		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
> +		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
> +		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V1_SW_CONF_SPI },
> +		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V1_SW_CONF_I2C0 },
> +		[USI_MODE_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
> +		[USI_MODE_I2C0_1] =	{ .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
> +		[USI_MODE_UART_I2C1] =	{ .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
> +	}, [USI_VER2] = {
> +		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
> +		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
> +		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
> +		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
> +	},
>  };
>  
>  static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
>  static const struct exynos_usi_variant exynos850_usi_data = {
>  	.ver		= USI_VER2,
>  	.sw_conf_mask	= USI_V2_SW_CONF_MASK,
> -	.min_mode	= USI_V2_NONE,
> -	.max_mode	= USI_V2_I2C,
> +	.min_mode	= USI_MODE_NONE,
> +	.max_mode	= USI_MODE_I2C,
> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
> +	.clk_names	= exynos850_usi_clk_names,
> +};
> +
> +static const struct exynos_usi_variant exynos8895_usi_data = {
> +	.ver		= USI_VER1,
> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
> +	.min_mode	= USI_MODE_NONE,
> +	.max_mode	= USI_MODE_UART_I2C1,
>  	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
>  	.clk_names	= exynos850_usi_clk_names,
>  };
> @@ -88,6 +121,10 @@ static const struct of_device_id exynos_usi_dt_match[] = {
>  		.compatible = "samsung,exynos850-usi",
>  		.data = &exynos850_usi_data,
>  	},
> +	{

These two are in oone line.

> +		.compatible = "samsung,exynos8895-usi",
> +		.data = &exynos8895_usi_data,
> +	},
>  	{ } /* sentinel */
>  };
>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
> @@ -109,14 +146,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>  		return -EINVAL;
>  
> -	val = exynos_usi_modes[mode].val;
> +	val = exynos_usi_modes[usi->data->ver][mode].val;
>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>  				 usi->data->sw_conf_mask, val);
>  	if (ret)
>  		return ret;
>  
>  	usi->mode = mode;
> -	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
> +	dev_dbg(usi->dev, "protocol: %s\n",
> +		exynos_usi_modes[usi->data->ver][usi->mode].name);
>  
>  	return 0;
>  }
> @@ -160,6 +198,30 @@ static int exynos_usi_enable(const struct exynos_usi *usi)
>  	return ret;
>  }
>  
> +/**
> + * exynos_usi_disable - Disable USI block
> + * @usi: USI driver object
> + *
> + * USI IP-core needs the reset flag cleared in order to function. This
> + * routine disables the USI block by setting the reset flag. It also disables
> + * HWACG behavior. It should be performed on removal of the device.
> + */
> +static void exynos_usi_disable(const struct exynos_usi *usi)
> +{
> +	u32 val;
> +
> +	/* Make sure that we've stopped providing the clock to USI IP */
> +	val = readl(usi->regs + USI_OPTION);
> +	val &= ~USI_OPTION_CLKREQ_ON;
> +	val |= ~USI_OPTION_CLKSTOP_ON;
> +	writel(val, usi->regs + USI_OPTION);
> +
> +	/* Set USI block state to reset */
> +	val = readl(usi->regs + USI_CON);
> +	val |= USI_CON_RESET;
> +	writel(val, usi->regs + USI_CON);
> +}
> +
>  static int exynos_usi_configure(struct exynos_usi *usi)
>  {
>  	int ret;
> @@ -169,9 +231,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
>  		return ret;
>  
>  	if (usi->data->ver == USI_VER2)
> -		return exynos_usi_enable(usi);
> +		ret = exynos_usi_enable(usi);
> +	else
> +		ret = clk_bulk_prepare_enable(usi->data->num_clks,
> +					      usi->clks);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
> @@ -253,10 +318,26 @@ static int exynos_usi_probe(struct platform_device *pdev)
>  
>  	ret = exynos_usi_configure(usi);
>  	if (ret)
> -		return ret;
> +		goto fail_probe;
>  
>  	/* Make it possible to embed protocol nodes into USI np */
>  	return of_platform_populate(np, NULL, NULL, dev);

This also needs error handling.

> +
> +fail_probe:

err_unconfigure:

> +	if (usi->data->ver != USI_VER2)
> +		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);

Move it to its own callback exynos_usi_unconfigure(), so naming will be
symmetric. The probe does not prepare clocks directly, so above code is
not that readable. The most readable is to have symmetrics calls -
configure+unconfigure (or whatever we name it).

> +
> +	return ret;
> +}
> +
> +static void exynos_usi_remove(struct platform_device *pdev)
> +{
> +	struct exynos_usi *usi = platform_get_drvdata(pdev);
> +
> +	if (usi->data->ver == USI_VER2)
> +		exynos_usi_disable(usi);

This is not related to the patch and should be separate patch, if at
all.

> +	else
> +		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);

So the easiest would be to add devm reset action and then no need for
goto-err handling and remove() callback.

Best regards,
Krzysztof


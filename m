Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6C1CD213;
	Fri,  3 Jan 2025 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735892992; cv=none; b=krMri9nt/x3id1RAAYV74vONj8lkBYtaQrykGrmQic+E8/j1c9eig/61LPvxgjAQTZRTUTZF/O3g0z6R3F5CB+cUoFu6MAmKcj4Xros8sWnLsejSE9y0pnqoEsp2R9Koq9QeGK9A7iy1s8rBqaft8c91iEe9gkzFlhHdeceCE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735892992; c=relaxed/simple;
	bh=NJIUi9yWwONAN4blHjHBMYlaQk8Lg/DXttoXfSi/gNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kflaSXu7+yvDNEt03FmRbUcWHdR04dSEL+fqRzkfMqyRsBxvChBr7K+zAEJnLbZSGTW/hIYPM+HA2/urGDPoF9o7tGNEvVuGU3WkZv4yl4LbeSdoSunRnkqvdmXiV5mJunaGPiE0XZEZVWGF8tb0zyPn3z1JO9zfZ/YQ3TjU8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxd8C4tC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxd8C4tC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593F8C4CECE;
	Fri,  3 Jan 2025 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735892992;
	bh=NJIUi9yWwONAN4blHjHBMYlaQk8Lg/DXttoXfSi/gNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxd8C4tC2I8uagkE+gfa9sEyzxCicIrfybHNcx4774WjmwQLkBJPlc/Wb7HIWP9zP
	 M34IerU+IW+3NN0O87AZw6UFTonlOx4VmWk2VZC+vGZEuxp5NSD+F3gO3nYLc0vWNU
	 TXutekZWAA+3gwG5+LJsXqVXEERB1RR43tO2AMKHYgepadyIaVaOcCj5dARIYKuPCO
	 XPhFdnQvYcHbghZzOXYB+tDYrmRQlbwlpYPVDAIGlJ1AUXdJ19X4TaEwtgbrpusM3Y
	 q70pLYQSisYo5786bP7AH1wXoH5MCxsvE+MxR2R8fwaw785g9Hk7iID2uwvjlInkLa
	 L0yG9EC59sZqw==
Date: Fri, 3 Jan 2025 09:29:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] soc: samsung: usi: implement support for USIv1
Message-ID: <utew7byz6kulmet76ayuc4obwavm5g5q2m5gk4metqulcgi4as@eml3cfd3vfaq>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>

On Thu, Jan 02, 2025 at 10:40:15PM +0200, Ivaylo Ivanov wrote:
>  /* USIv2: System Register: SW_CONF register bits */
>  #define USI_V2_SW_CONF_NONE	0x0
>  #define USI_V2_SW_CONF_UART	BIT(0)
> @@ -34,7 +46,8 @@
>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>  
>  enum exynos_usi_ver {
> -	USI_VER2 = 2,
> +	USI_VER1 = 1,
> +	USI_VER2,
>  };
>  
>  struct exynos_usi_variant {
> @@ -66,6 +79,16 @@ struct exynos_usi_mode {
>  	unsigned int val;		/* mode register value */
>  };
>  
> +static const struct exynos_usi_mode exynos_usi_v1_modes[] = {
> +	[USI_V1_NONE]		= { .name = "none", .val = USI_V1_SW_CONF_NONE },
> +	[USI_V1_I2C0]		= { .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
> +	[USI_V1_I2C1]		= { .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
> +	[USI_V1_I2C0_1]		= { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
> +	[USI_V1_SPI]		= { .name = "spi", .val = USI_V1_SW_CONF_SPI },
> +	[USI_V1_UART]		= { .name = "uart", .val = USI_V1_SW_CONF_UART },
> +	[USI_V1_UART_I2C1]	= { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },

Now I see why you duplicated the IDs... With my approach your code here
is even simpler. Allows to drop USI_VER1 as well.


> +};
> +
>  static const struct exynos_usi_mode exynos_usi_modes[] = {
>  	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
>  	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
> @@ -83,11 +106,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
>  	.clk_names	= exynos850_usi_clk_names,
>  };
>  
> +static const struct exynos_usi_variant exynos8895_usi_data = {
> +	.ver		= USI_VER1,
> +	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
> +	.min_mode	= USI_V1_NONE,
> +	.max_mode	= USI_V1_UART_I2C1,
> +	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
> +	.clk_names	= exynos850_usi_clk_names,
> +};
> +
>  static const struct of_device_id exynos_usi_dt_match[] = {
>  	{
>  		.compatible = "samsung,exynos850-usi",
>  		.data = &exynos850_usi_data,
>  	},
> +	{
> +		.compatible = "samsung,exynos8895-usi",
> +		.data = &exynos8895_usi_data,
> +	},
>  	{ } /* sentinel */
>  };
>  MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
> @@ -105,18 +141,32 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
>  {
>  	unsigned int val;
>  	int ret;
> +	const char *name;
>  
> +	usi->mode = mode;
>  	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
>  		return -EINVAL;
>  
> -	val = exynos_usi_modes[mode].val;
> +	switch (usi->data->ver) {
> +	case USI_VER1:
> +		val = exynos_usi_v1_modes[mode].val;
> +		name = exynos_usi_v1_modes[usi->mode].name;
> +		break;
> +	case USI_VER2:
> +		val = exynos_usi_modes[mode].val;
> +		name = exynos_usi_modes[usi->mode].name;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
>  	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
>  				 usi->data->sw_conf_mask, val);
> +

No, why? Drop.

Best regards,
Krzysztof


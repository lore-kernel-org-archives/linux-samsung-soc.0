Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE31EB3E;
	Mon, 16 Jun 2025 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061559; cv=none; b=ujOLUT33+6tRIyzW0bYSyreWbazjYGM7oHuHgS4KtaRHH14XFQDjOJNNyXAyZImh7xqDmJ7pvAbAil6PqfNMwV5dHy7pjhD6euMOw06xDLiZQr7KNuis8Q4C3WC3bNUsqRkoeJIvDJM211L1vIhBw3lwKD+nicYuARYLY9FHlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061559; c=relaxed/simple;
	bh=WNQjjeV2gpE3amaa7wziU/9tXorxQQ+MAUeb2tTJ1Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaNXEwiIj66pvngv4+gvl2NYghCdd1nhiaITjQKlWlK9jpDR5bZp7/N+m+we+PJO6JtNmI1jVVI3Zv3QbseM2X2tGlMxSazga6hNYyTz9sPQkBAGPqEH5+gtwREDl6b78IdIyQvK2aqnM1ugQNFYEOF/rTcaPFwhbKbpV/aNBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gra7XrJG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gra7XrJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F231C4CEEA;
	Mon, 16 Jun 2025 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061559;
	bh=WNQjjeV2gpE3amaa7wziU/9tXorxQQ+MAUeb2tTJ1Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gra7XrJGV4ZiC9vwS2uNjs0AZSx2u8/PhN1+EJGI0ROURDSEW8XMDu7r3vG+1d0JZ
	 UvefqBXj04DnNpChqeHfukMy8bj9FcFik6jeT552r0ILMIOQzXN+8wrhAe+aL8rJbg
	 94wKlcnjz5imUN5HQrZxU/JxiSc6KaZk1M1lC0HgpvZOSjezQ0MYhkVc7x3IM696Sf
	 k38l+6hMaHDTR4HmcfXfUlvvTLy5Kx8KzzDuqdX/lWW2APKBVl7HC92Ko7TIImRsgh
	 pgo9E+Rr4L4Khf+d7Zk5nI7O3Jt+wbXZjtxM6dZ5j4+Fku/iMxhnNwGz9rqf5fxEeP
	 uJY1v9tkI6CKQ==
Date: Mon, 16 Jun 2025 10:12:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Message-ID: <20250616-boisterous-mouse-of-current-adfd67@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>
 <20250613055613.866909-3-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-3-pritam.sutar@samsung.com>

On Fri, Jun 13, 2025 at 11:26:06AM GMT, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
> 
> Support only UTMI+ port for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> The combo phy support is out of scope of this commit.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 917a76d584f0..15965b4c6f78 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2025,6 +2025,28 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
> +	.init		= exynos850_usbdrd_phy_init,
> +	.exit		= exynos850_usbdrd_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynos850_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),

Where are the supplies? Where is power on/off seqequence in the phy
ops?

No pmu control (missing offset)?

You have entire commit msg to explain unusual things.

Best regards,
Krzysztof


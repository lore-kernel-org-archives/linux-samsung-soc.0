Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7E28E579;
	Tue, 12 Aug 2025 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008284; cv=none; b=F42xX8uq4rHG/d6aSomW1nukbjUXLS5l2v12+Ck7hSZpjKk/qajbycyA00aTu5FoELNN66moTctPZctjxlvcgWXaxMNQkOBWSWLXnR8li4hMwWN6YNom9UOW+vNDA0m74dscPYhXf3WhtHhZTFcD9HvSL6pRcnB7VjoUCfbTRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008284; c=relaxed/simple;
	bh=XO4yi+cl35zAmP3v6jAb/UAs/XIZlfZgkA7+goZt8gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCaxQv1t4bw9fGu1fS12XJCu4StqxAgtgUh2VdBL9wf6hXVKGFNDk7OpwFMybcyAT55Q9H04z+Xg//piyt4kw1dmcK7OcbVGoBDGhcbyB3A2BbuBhgflRIRhcTjiebizskFpxD1vv2Ft1dlZ1ixGzP3T3u5Rs8sM+v+vyAXimQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKXnghsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKXnghsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A503C4CEF0;
	Tue, 12 Aug 2025 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008284;
	bh=XO4yi+cl35zAmP3v6jAb/UAs/XIZlfZgkA7+goZt8gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKXnghsvCobCiCc1V94xXx9EcY1CxqZVopyNQmp037uV70h1uWJLg3M0VmfiTPz3h
	 ByRRD1j4hVIiL6aUCnFZ8NzgcK4Qd0fUtsYjPQF2gx6FHl+7GF+LFikcd3kIZ0rBrb
	 rvy9gPLUErtuutBlKCnxjKC/NslhH1pwpAF9ZBOIhkAkzo4qZBbjNraTFl2P+u9Lgs
	 QZPMWprmeBHhCm6nIKPKKqIAgkzfJtMrLrjxvBPHb8cfCI6MeeCLfJbgLokI109IGQ
	 eOMOyPCIuiBhlGlzWageG9NOgncojpHfxL/tJolfGEAhIaT0jErLVQvhMXt2cqaq5H
	 Y/ZyOMbrv64aQ==
Date: Tue, 12 Aug 2025 19:48:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Message-ID: <aJtNGGjKy762BLcX@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114316epcas5p49b78db499c2e37a1fe68f4b2f0be62a7@epcas5p4.samsung.com>
 <20250805115216.3798121-5-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-5-pritam.sutar@samsung.com>

On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> Support UTMI+ combo phy for this SoC which is somewhat simmilar to
> what the existing Exynos850 support does. The difference is that
> some register offsets and bit fields are defferent from Exynos850.
> 
> Add required change in phy driver to support combo HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 210 +++++++++++++++++++++++
>  1 file changed, 210 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 5400dd23e500..c22f4de7d094 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -41,6 +41,13 @@
>  #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
>  
>  #define EXYNOS2200_DRD_UTMI			0x10
> +
> +/* ExynosAutov920 bits */
> +#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
> +#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
> +#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
> +#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
> +
>  #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
>  #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
>  
> @@ -250,6 +257,22 @@
>  #define EXYNOS850_DRD_HSP_TEST			0x5c
>  #define HSP_TEST_SIDDQ				BIT(24)
>  
> +#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
> +#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
> +#define HSPCLKRST_PHY20_SW_POR			BIT(1)
> +#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
> +#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
> +#define HSPCTRL_VBUSVLDEXT			BIT(12)
> +#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
> +#define HSPCTRL_COMMONONN			BIT(8)
> +
> +#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
> +
> +#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> +#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> +
>  /* Exynos9 - GS101 */
>  #define EXYNOS850_DRD_SECPMACTL			0x48
>  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2054,6 +2077,139 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static void
> +exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/*
> +	 * Disable HWACG (hardware auto clock gating control). This
> +	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
> +	 * to make sure the PHY clock is not gated by the hardware.
> +	 */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= LINKCTRL_FORCE_QACT;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);

maybe add a read-modify-write helper, this is user a lot here

> +
> +	/* De-assert link reset */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg &= ~CLKRST_LINK_SW_RST;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> +
> +	/* Set PHY POR High */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +
> +	/* Enable UTMI+ */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP |
> +		UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	/* set phy clock & control HS phy */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	fsleep(100);
> +
> +	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID | EXYNOS2200_UTMI_FORCE_BVALID;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	/* Setting FSEL for refference clock */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> +	reg &= ~HSPPLLTUNE_FSEL;

Empty line here please

> +	switch (phy_drd->extrefclk) {
> +	case EXYNOS5_FSEL_50MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
> +		break;
> +	case EXYNOS5_FSEL_26MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
> +		break;
> +	case EXYNOS5_FSEL_24MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
> +		break;
> +	case EXYNOS5_FSEL_20MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
> +		break;
> +	case EXYNOS5_FSEL_19MHZ2:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
> +		break;
> +	default:
> +		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
> +			 phy_drd->extrefclk);

but we still continue?
-- 
~Vinod

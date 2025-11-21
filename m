Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573891A9B46
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763712388; cv=none; b=XgoLX9eNBkLYHjWNrB5SrXCIgeQqXJqaSYn89bdw1dYT+DaGU31A0cdjBEOxQtreiKjyC/3KRnz0ueaX1zu0E6zhOzv9GO9VIwYfjgQQGIfveEMvBxX3MvjSqs2oYBPk0woiHY5PrWIHCHuHQm+bMX9WHHo7+kA02gmpxhX3q4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763712388; c=relaxed/simple;
	bh=+FlNs/8I0phHVdUAZB8vk8tbDtFCZcsZUWzS1+fbdJo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=XYMChhJlK3+wYRYFA6MP2FL4u5OdqmasN5W2/xRQ7GGXI1/Pyw25qMrR7bK4zSxi8XqWkUGWKe/raTDHRmOQuIPzjOb/1O8//vpByIwsErN56aSl1BSUP6obiCKa87bmvloipCHWL5qEUU0ppWQ6Z+x4SaoyRWh7shOTwUGcfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tetsIlOU; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tetsIlOU"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251121080623epoutp02cbff11c09c51b69f4f89a1354f5cafb9~59xFr7I7y2345323453epoutp02D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:06:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251121080623epoutp02cbff11c09c51b69f4f89a1354f5cafb9~59xFr7I7y2345323453epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763712383;
	bh=bicOhB3lxHr36qOBr/Cji/9SyYsIhCzg0MNSw9q5xJQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=tetsIlOUt0/NwiaYVagXRXVNUQEWwOmWhLC8jaWhxFTeHZYz3guaCOepRylF6NU5s
	 mX1vDEF/cHMlsBMBVrjOpwhZUyBLK3oUQwCNZoSxrvKPO79frkJU/5OJV2kgm4mtr2
	 SoU61KWRNjIcqqvWzP73Na+wOpnECNkrFdmJvoDA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251121080622epcas5p17eb6ede357292c192ae4b66fa293b18a~59xE47lI80272402724epcas5p1H;
	Fri, 21 Nov 2025 08:06:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dCSTn3Dtnz3hhT7; Fri, 21 Nov
	2025 08:06:21 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251121080620epcas5p36b7649efb1c754829beeca1761f84a9b~59xDcEAGk2569925699epcas5p3R;
	Fri, 21 Nov 2025 08:06:20 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251121080617epsmtip2ce5f185be502f2976a0bda80eba7721f~59xAhUARY2184821848epsmtip2b;
	Fri, 21 Nov 2025 08:06:17 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <johan@kernel.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <aR9DtJuwpzoq6spx@vaman>
Subject: RE: [PATCH v9 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Fri, 21 Nov 2025 13:36:03 +0530
Message-ID: <00ef01dc5abd$b8aac3b0$2a004b10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQId6djPdSPyHc1kqH9U3Yvp+ju6FgNTbNUIAjBcJ0ECKt+0kLQ8L78w
Content-Language: en-in
X-CMS-MailID: 20251121080620epcas5p36b7649efb1c754829beeca1761f84a9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070057epcas5p31b6ee42004594b2b2fb414494180753c
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
	<CGME20251010070057epcas5p31b6ee42004594b2b2fb414494180753c@epcas5p3.samsung.com>
	<20251010070912.3758334-5-pritam.sutar@samsung.com> <aR9DtJuwpzoq6spx@vaman>

Hi Vinod,

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 20 November 2025 10:07 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org; johan@kernel.org;
> ivo.ivanov.ivanov1@gmail.com; m.szyprowski@samsung.com;
> s.nawrocki@samsung.com; linux-phy@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: Re: [PATCH v9 4/6] phy: exynos5-usbdrd: support HS combo phy for
> ExynosAutov920
> 
> On 10-10-25, 12:39, Pritam Manohar Sutar wrote:
> > Support UTMI+ combo phy for this SoC which is somewhat simmilar to
>                                                         ^^^^^^^^ typo
> 
> > what the existing Exynos850 support does. The difference is that some
> > register offsets and bit fields are defferent from Exynos850.
>                                            ^^^^^^^^ again

Thank for the review and sorry for the typo and can you please
confirm if updated commit message is fine, mentioned as below?

"
    phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920

    Support UTMI+ combo phy for this SoC, which is somewhat similar to
    what the existing Exynos850 supports. The difference is that some
    register offsets and bit fields are different from Exynos850.

    Add required change in phy driver to support combo HS phy for this SoC.
"

> >
> > Add required change in phy driver to support combo HS phy for this SoC.
> >
> > Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c | 211
> > +++++++++++++++++++++++
> >  1 file changed, 211 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index dfc2cc71e579..c52b0e25a423 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > @@ -41,6 +41,13 @@
> >  #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
> >
> >  #define EXYNOS2200_DRD_UTMI			0x10
> > +
> > +/* ExynosAutov920 bits */
> > +#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
> > +#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
> > +#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
> > +#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
> > +
> >  #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
> >  #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
> >
> > @@ -250,6 +257,22 @@
> >  #define EXYNOS850_DRD_HSP_TEST			0x5c
> >  #define HSP_TEST_SIDDQ				BIT(24)
> >
> > +#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
> > +#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
> > +#define HSPCLKRST_PHY20_SW_POR			BIT(1)
> > +#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
> > +
> > +#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
> > +#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
> > +#define HSPCTRL_VBUSVLDEXT			BIT(12)
> > +#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
> > +#define HSPCTRL_COMMONONN			BIT(8)
> > +
> > +#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
> > +
> > +#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> > +#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> > +
> >  /* Exynos9 - GS101 */
> >  #define EXYNOS850_DRD_SECPMACTL			0x48
> >  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL
> 	GENMASK(13, 12)
> > @@ -2054,6 +2077,140 @@ static const struct
> exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
> >  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
> >  };
> >
> > +static void
> > +exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy
> *phy_drd) {
> > +	void __iomem *reg_phy = phy_drd->reg_phy;
> > +	u32 reg;
> > +
> > +	/*
> > +	 * Disable HWACG (hardware auto clock gating control). This
> > +	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
> > +	 * to make sure the PHY clock is not gated by the hardware.
> > +	 */
> > +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +	reg |= LINKCTRL_FORCE_QACT;
> > +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +
> > +	/* De-assert link reset */
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> > +	reg &= ~CLKRST_LINK_SW_RST;
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> > +
> > +	/* Set PHY POR High */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> > +	reg |= HSPCLKRST_PHY20_SW_POR |
> HSPCLKRST_PHY20_SW_POR_SEL;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> > +
> > +	/* Enable UTMI+ */
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> > +	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND |
> UTMICTL_FORCE_UTMI_SLEEP |
> > +		UTMICTL_FORCE_DPPULLDOWN |
> UTMICTL_FORCE_DMPULLDOWN);
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> > +
> > +	/* set phy clock & control HS phy */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +
> > +	fsleep(100);
> > +
> > +	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
> > +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
> > +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> > +	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID |
> EXYNOS2200_UTMI_FORCE_BVALID;
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> > +
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> > +
> > +	/* Setting FSEL for refference clock */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> > +	reg &= ~HSPPLLTUNE_FSEL;
> > +
> > +	switch (phy_drd->extrefclk) {
> > +	case EXYNOS5_FSEL_50MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
> > +		break;
> > +	case EXYNOS5_FSEL_26MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
> > +		break;
> > +	case EXYNOS5_FSEL_24MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
> > +		break;
> > +	case EXYNOS5_FSEL_20MHZ:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
> > +		break;
> > +	case EXYNOS5_FSEL_19MHZ2:
> > +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
> > +		break;
> > +	default:
> > +		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
> > +			 phy_drd->extrefclk);
> > +		break;
> > +	}
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> > +
> > +	/* Enable PHY Power Mode */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> > +	reg &= ~HSP_TEST_SIDDQ;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> > +
> > +	/* before POR low, 10us delay is needed to Finish PHY reset */
> > +	fsleep(10);
> > +
> > +	/* Set PHY POR Low */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> > +	reg |= HSPCLKRST_PHY20_SW_POR_SEL;
> > +	reg &= ~(HSPCLKRST_PHY20_SW_POR |
> HSPCLKRST_PHY20_SW_PORTRESET);
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> > +
> > +	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
> > +	fsleep(75);
> > +
> > +	/* force pipe3 signal for link */
> > +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +	reg |= LINKCTRL_FORCE_PIPE_EN;
> > +	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
> > +	reg |= LINKCTRL_FORCE_RXELECIDLE;
> > +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL); }
> > +
> > +static void
> > +exynosautov920_usbdrd_hsphy_disable(struct exynos5_usbdrd_phy
> > +*phy_drd) {
> > +	u32 reg;
> > +	void __iomem *reg_phy = phy_drd->reg_phy;
> > +
> > +	/* set phy clock & control HS phy */
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> > +	reg |= UTMICTL_FORCE_UTMI_SUSPEND |
> UTMICTL_FORCE_UTMI_SLEEP;
> > +	reg &= ~(UTMICTL_FORCE_DPPULLDOWN |
> UTMICTL_FORCE_DMPULLDOWN);
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> > +
> > +	/* Disable PHY Power Mode */
> > +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> > +	reg |= HSP_TEST_SIDDQ;
> > +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> > +
> > +	/* clear force q-channel */
> > +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +	reg &= ~LINKCTRL_FORCE_QACT;
> > +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> > +
> > +	/* link sw reset is need for USB_DP/DM high-z in host mode */
> > +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> > +	reg |= CLKRST_LINK_SW_RST;
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> > +	fsleep(10);
> > +	reg &= ~CLKRST_LINK_SW_RST;
> > +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST); }
> > +
> >  static int exynosautov920_usbdrd_phy_init(struct phy *phy)  {
> >  	struct phy_usb_instance *inst = phy_get_drvdata(phy); @@ -2095,6
> > +2252,27 @@ static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> >  	return 0;
> >  }
> >
> > +static int exynosautov920_usbdrd_combo_phy_exit(struct phy *phy) {
> > +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> > +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> > +	int ret = 0;
> 
> Superfluous init
> 
> > +
> > +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks,
> phy_drd->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> > +		exynosautov920_usbdrd_hsphy_disable(phy_drd);
> > +
> > +	/* enable PHY isol */
> > +	inst->phy_cfg->phy_isol(inst, true);
> > +
> > +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks,
> > +phy_drd->clks);
> > +
> > +	return 0;
> > +}
> > +
> >  static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)  {
> >  	struct phy_usb_instance *inst = phy_get_drvdata(phy); @@ -2146,6
> > +2324,36 @@ static const char * const exynosautov920_usb20_regulators[]
> = {
> >  	"dvdd", "vdd18", "vdd33",
> >  };
> >
> > +static const struct phy_ops exynosautov920_usbdrd_combo_hsphy_ops
> = {
> > +	.init		= exynosautov920_usbdrd_phy_init,
> > +	.exit		= exynosautov920_usbdrd_combo_phy_exit,
> > +	.power_on	= exynosautov920_usbdrd_phy_power_on,
> > +	.power_off	= exynosautov920_usbdrd_phy_power_off,
> > +	.owner		= THIS_MODULE,
> > +};
> > +
> > +static const struct
> > +exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
> > +	{
> > +		.id		= EXYNOS5_DRDPHY_UTMI,
> > +		.phy_isol	= exynos5_usbdrd_phy_isol,
> > +		.phy_init	= exynosautov920_usbdrd_utmi_init,
> > +	},
> > +};
> > +
> > +static const
> > +struct exynos5_usbdrd_phy_drvdata
> exynosautov920_usbdrd_combo_hsphy = {
> > +	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
> > +	.phy_ops		=
> &exynosautov920_usbdrd_combo_hsphy_ops,
> > +	.pmu_offset_usbdrd0_phy	=
> EXYNOSAUTOV920_PHY_CTRL_USB20,
> > +	.clk_names		= exynos5_clk_names,
> > +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> > +	.core_clk_names		= exynos5_core_clk_names,
> > +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> > +	.regulator_names	= exynosautov920_usb20_regulators,
> > +	.n_regulators		=
> ARRAY_SIZE(exynosautov920_usb20_regulators),
> > +};
> > +
> >  static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
> >  	.init		= exynosautov920_usbdrd_phy_init,
> >  	.exit		= exynosautov920_usbdrd_phy_exit,
> > @@ -2380,6 +2588,9 @@ static const struct of_device_id
> exynos5_usbdrd_phy_of_match[] = {
> >  	}, {
> >  		.compatible = "samsung,exynos990-usbdrd-phy",
> >  		.data = &exynos990_usbdrd_phy
> > +	}, {
> > +		.compatible = "samsung,exynosautov920-usbdrd-combo-
> hsphy",
> > +		.data = &exynosautov920_usbdrd_combo_hsphy
> >  	}, {
> >  		.compatible = "samsung,exynosautov920-usbdrd-phy",
> >  		.data = &exynosautov920_usbdrd_phy
> > --
> > 2.34.1
> 
> --
> ~Vinod

Thank you,

Regards,
Pritam


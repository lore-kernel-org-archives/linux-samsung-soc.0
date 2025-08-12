Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D10253954;
	Tue, 12 Aug 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008499; cv=none; b=m1SWJBXAMHTXK/UMZIwO0Kcq0rOmWwyxoWORT8Rt8teGy2TBUSMgekyg1dX0a6aOVbWE+k4V1FLlkBrAhI1ll1RPgzbwsdJaHf+EeZdYBhwxZdxpTmc8KalITdmNxjP0kgCHZd3c9agD1CXO1jgtShGzFA8pXzTfVyZ3TufFJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008499; c=relaxed/simple;
	bh=32dxnq96SImnSTkRiNIusVAtLmhJTDIedNBn4szGg1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLStz04+3ESUhHUy7l0QLpqmwOzG5HkIyurxYeNZAyH9S2iP3/DQw3nfvgKWBY+g0uvEgYF8q+4csW23o/qIZ8kLNgIatt7aOBBfPr+BYXVoKpWJJdDY0OC/qWOxLPskK9MTK+YpiUe4iqU5NJW6xQmwIVZNM2eswx4uUx7z4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mh+R0weG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mh+R0weG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C53C4CEF0;
	Tue, 12 Aug 2025 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008498;
	bh=32dxnq96SImnSTkRiNIusVAtLmhJTDIedNBn4szGg1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mh+R0weGvZchr4qwuIprSkbYA8TJGU9c37khvcqjkQ5GFY9/kGlAP1PaTHusAObvx
	 02RVjJgJvoXBG1jLP7ZU3Y8eLvYclLkaF5hNHslKWgTEHwtPcurtnEkG2qWcgNTfnE
	 CSvzm7fCVbkuwu9K1WqSY9pI+NbN0pAzrAdJPBsfcovsxoXxsriCvYxx1gwftDAO3v
	 r29Z51xBqBRxPMsV1iiJuKZwwqsBHsCaTZi4U0OLetk4oCQOQ8/CyIFIU8fxxIYc4y
	 iP9uQ25hAk+DIsD8k4pEVBp2ihk7d/h1GN0V3ZZFdHC+KGYcOxL9PNqRpugdV0GNgI
	 rITCVqKzKMpLA==
Date: Tue, 12 Aug 2025 19:51:34 +0530
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
Subject: Re: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <aJtN7uVUV3YhfY5-@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9@epcas5p3.samsung.com>
 <20250805115216.3798121-7-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-7-pritam.sutar@samsung.com>

On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> Add required change in phy driver to support combo SS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 327 +++++++++++++++++++-
>  include/linux/soc/samsung/exynos-regs-pmu.h |   1 +
>  2 files changed, 324 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index c22f4de7d094..1108f0c07755 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -273,6 +273,36 @@
>  #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
>  #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
>  
> +/* ExynosAutov920 phy usb31drd port reg */
> +#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
> +#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
> +#define PHY_RST_CTRL_PHY_RESET			BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
> +#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
> +#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
> +#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
> +#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
> +#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
> +
>  /* Exynos9 - GS101 */
>  #define EXYNOS850_DRD_SECPMACTL			0x48
>  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2077,6 +2107,253 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static void
> +exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg = 0;

again..

> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	if (high)
> +		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	else
> +		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	fsleep(1);
> +}
> +
> +static void
> +exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	static const unsigned int timeout_us = 20000;
> +	static const unsigned int sleep_us = 40;
> +	u32 reg = 0;

here too

> +	int err;
> +
> +	/* Clear cr_para_con */
> +	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +	exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +	/*
> +	 * The maximum time from phy reset de-assertion to de-assertion of
> +	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
> +	 * Time to phy ready is < 20ms
> +	 */
> +	err = readl_poll_timeout(reg_phy +
> +				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
> +			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
> +			sleep_us, timeout_us);
> +	if (err)
> +		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +}
> +
> +static void
> +exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
> +				 u16 addr, u16 data)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 cnt = 0;
> +	u32 reg = 0;

this one, former is okay

> +
> +	/* Pre Clocking */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx clks must be available prior to assertion of tx req.
> +	 * tx pstate p2 to p0 transition directly is not permitted.
> +	 * tx clk ready must be asserted synchronously on tx clk prior
> +	 * to internal transmit clk alignment sequence in the phy
> +	 * when entering from p2 to p1 to p0.
> +	 */
> +	do {
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +		cnt++;
> +	} while (cnt < 15);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx data path is active when tx lane is in p0 state
> +	 * and tx data en asserted. enable cr_para_wr_en.
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
> +		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	/* write addr */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/* check cr_para_ack*/
> +	cnt = 0;
> +	do {
> +		/*
> +		 * data symbols are captured by phy on rising edge of the
> +		 * tx_clk when tx data enabled.
> +		 * completion of the write cycle is acknowledged by assertion
> +		 * of the cr_para_ack.
> +		 */
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> +			break;
> +
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +		/*
> +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> +		 * is negated, before accessing control regs to allow for
> +		 * internal resets.
> +		 */
> +		cnt++;
> +	} while (cnt < 10);
> +
> +	if (cnt == 10)
> +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);

Not error?
-- 
~Vinod

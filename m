Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC021FF41
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581367; cv=none; b=Znftgpo3ZNMDHrXxt4Z0TNDx61bbJC/mDARxQGCKu88RdQ15L+0wSJceCC4ihSJgnpeEo7dz9jVRDHORk36+ELf6F0fGGOka0Am7z/O9SkWiy6GxG8LsWxJ7wdL8XLm8G0V4T8MbRDHEr4hgk3M3WXWPzkaKes27qA1+dB0J9ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581367; c=relaxed/simple;
	bh=oQBxwgAjB1Sit//E1gyu6jsGAnXwnwVCiu7w5uK1veg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZmcZ7u58TYjYj7AL0Mg/Vb5f85IYIw/3W4VfM5nz0K6FFjbHnmVCf63/SynzReq3ARoDU2emZ2HlnBMGd9LwaBSmGoBAYbYF4GS+8Htp3RHUmKWI3o267fdiYDXdzs1+rbMWbt/ojJBXW9pCb+hJ7cExucR1hOqGcJ1IA6LVVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d67urHkA; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d67urHkA"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250819052923epoutp03fbf29fc042973b8382e816df5636f070~dE-LIDWBc2270522705epoutp03w
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:29:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250819052923epoutp03fbf29fc042973b8382e816df5636f070~dE-LIDWBc2270522705epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755581363;
	bh=6MG+/Jai4e9wBAwA5aA5ZNa5PbIOBcMt7Lw3JvyLk6w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=d67urHkAZCwPT6xGIAQeP+7Mr4oeVqK3CMHCwe+Bzw0iZh+ZIDas4vM5tHIW2Zxkt
	 /hVeIH8bg/z8qSzULkWnA5nFNdOT3OBEiR9gOnM88/KKVeTs/DvoPVDJXwvdXii+57
	 d0FPOs0kA0iOIskNZ8lhuis/+MErNgNln37WUtj4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250819052922epcas5p48d6c5c5c355795ed5a957f8effe6dbd3~dE-KYwSKb1102711027epcas5p4U;
	Tue, 19 Aug 2025 05:29:22 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c5dS03lX4z3hhT7; Tue, 19 Aug
	2025 05:29:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250818074152epcas5p38e555d935cb93f38ed0a590003a53da1~czJkANOlH1134711347epcas5p3L;
	Mon, 18 Aug 2025 07:41:52 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818074149epsmtip265c95d1fd9e613f0c41ca6c3c05681fa~czJhJl2tB1399313993epsmtip2R;
	Mon, 18 Aug 2025 07:41:49 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<igor.belwon@mentallysanemainliners.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <aJtN7uVUV3YhfY5-@vaman>
Subject: RE: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Date: Mon, 18 Aug 2025 13:11:48 +0530
Message-ID: <038a01dc1013$900a2800$b01e7800$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQGuc5yxAsdJ9S8B+nVVqLLv1zHQ
Content-Language: en-in
X-CMS-MailID: 20250818074152epcas5p38e555d935cb93f38ed0a590003a53da1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9@epcas5p3.samsung.com>
	<20250805115216.3798121-7-pritam.sutar@samsung.com> <aJtN7uVUV3YhfY5-@vaman>

Hi Vinod, 

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 12 August 2025 07:52 PM
> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Cc: kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> peter.griffin@linaro.org; kauschluss@disroot.org;
> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
> m.szyprowski@samsung.com; s.nawrocki@samsung.com; linux-
> phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; rosa.pila@samsung.com;
> dev.tailor@samsung.com; faraz.ata@samsung.com;
> muhammed.ali@samsung.com; selvarasu.g@samsung.com
> Subject: Re: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
> ExynosAutov920
> 
> On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> > Add required change in phy driver to support combo SS phy for this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 327
> +++++++++++++++++++-
> >  include/linux/soc/samsung/exynos-regs-pmu.h |   1 +
> >  2 files changed, 324 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index c22f4de7d094..1108f0c07755 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > @@ -273,6 +273,36 @@
> >  #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> >  #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> >
> > +/* ExynosAutov920 phy usb31drd port reg */
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
> > +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
> > +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
> > +#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
> > +#define PHY_RST_CTRL_PHY_RESET			BIT(0)
> > +
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0
> 	0x0004
> > +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR
> 	GENMASK(31, 16)
> > +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
> > +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
> > +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
> > +
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1
> 	0x0008
> > +
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2
> 	0x000c
> > +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
> > +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA
> 	GENMASK(31, 16)
> > +
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
> > +#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
> > +#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
> > +#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
> > +
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
> > +#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
> > +
> > +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
> > +#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
> > +
> >  /* Exynos9 - GS101 */
> >  #define EXYNOS850_DRD_SECPMACTL			0x48
> >  #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL
> 	GENMASK(13, 12)
> > @@ -2077,6 +2107,253 @@ static const struct
> exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
> >  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
> >  };
> >
> > +static void
> > +exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd,
> > +bool high) {
> > +	void __iomem *reg_phy = phy_drd->reg_phy;
> > +	u32 reg = 0;
> 
> again..
> 
> > +
> > +	reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +	if (high)
> > +		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> > +	else
> > +		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> > +
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +	fsleep(1);
> > +}
> > +
> > +static void
> > +exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy
> > +*phy_drd) {
> > +	struct device *dev = phy_drd->dev;
> > +	void __iomem *reg_phy = phy_drd->reg_phy;
> > +	static const unsigned int timeout_us = 20000;
> > +	static const unsigned int sleep_us = 40;
> > +	u32 reg = 0;
> 
> here too
> 
> > +	int err;
> > +
> > +	/* Clear cr_para_con */
> > +	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> > +			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
> > +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +	writel(0x0, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
> > +	writel(0x0, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> > +
> > +	exynosautov920_usb31drd_cr_clk(phy_drd, true);
> > +	exynosautov920_usb31drd_cr_clk(phy_drd, false);
> > +
> > +	/*
> > +	 * The maximum time from phy reset de-assertion to de-assertion of
> > +	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
> > +	 * Time to phy ready is < 20ms
> > +	 */
> > +	err = readl_poll_timeout(reg_phy +
> > +
> 	EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
> > +			reg, !(reg &
> PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
> > +			sleep_us, timeout_us);
> > +	if (err)
> > +		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n",
> reg);
> > +
> > +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +}
> > +
> > +static void
> > +exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy
> *phy_drd,
> > +				 u16 addr, u16 data)
> > +{
> > +	struct device *dev = phy_drd->dev;
> > +	void __iomem *reg_phy = phy_drd->reg_phy;
> > +	u32 cnt = 0;
> > +	u32 reg = 0;
> 
> this one, former is okay
> 
> > +
> > +	/* Pre Clocking */
> > +	reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +
> > +	/*
> > +	 * tx clks must be available prior to assertion of tx req.
> > +	 * tx pstate p2 to p0 transition directly is not permitted.
> > +	 * tx clk ready must be asserted synchronously on tx clk prior
> > +	 * to internal transmit clk alignment sequence in the phy
> > +	 * when entering from p2 to p1 to p0.
> > +	 */
> > +	do {
> > +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> > +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> > +		cnt++;
> > +	} while (cnt < 15);
> > +
> > +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +
> > +	/*
> > +	 * tx data path is active when tx lane is in p0 state
> > +	 * and tx data en asserted. enable cr_para_wr_en.
> > +	 */
> > +	reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> > +	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
> > +	reg |=
> FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
> > +		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> > +
> > +	/* write addr */
> > +	reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
> > +	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR,
> addr) |
> > +		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> > +		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> > +	writel(reg, reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +
> > +	/* check cr_para_ack*/
> > +	cnt = 0;
> > +	do {
> > +		/*
> > +		 * data symbols are captured by phy on rising edge of the
> > +		 * tx_clk when tx data enabled.
> > +		 * completion of the write cycle is acknowledged by
assertion
> > +		 * of the cr_para_ack.
> > +		 */
> > +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> > +		reg = readl(reg_phy +
> EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> > +			break;
> > +
> > +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> > +
> > +		/*
> > +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> > +		 * is negated, before accessing control regs to allow for
> > +		 * internal resets.
> > +		 */
> > +		cnt++;
> > +	} while (cnt < 10);
> > +
> > +	if (cnt == 10)
> > +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
> 
> Not error?

This is only for debugging purpose. It is not considered as error. 

> --
> ~Vinod


Will address other comments in next version of the patch-set (v6).

Thank you.

Regards,
Pritam


Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D342FD7C4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Aug 2025 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178124; cv=none; b=Gwi5Sre2ynPwvbpqyu40YxCxypKqrfUjdfuOBQigkYQcIIyfwWvk+wui2JwfvvlZofNxgTRNcj16H3X+idd/TIlVOBw7pHHpPZnapKFqnc5zqpCf/ls0Z72CEut2R2bxzLIKtXrkXnGkmZyaGc2X09O/uA/4VDGuTBOsjFsxV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178124; c=relaxed/simple;
	bh=6PnAZe4A85kl6H3wMAfpDBn82Vzw+tysBiyt8VAF8vg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=JbYNx4/GFhMCZA782wQr5DFAKl2wRkISScySRf3AAJn60Sj0+a/KvNOTxpTo3U6llI4AOc2H8nXIrPh+P/l0TxuvQT7hWnzrIYaK7jLzBBBro6hVJZO0rJlzC8rwEfwjJg9gq55rLzv3KSR9wTtICJna9uQj2HQ1eHlfcUqp52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZzRxVVY5; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZzRxVVY5"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250814132839epoutp02f28542907cd55acaa8442113d84f7a42~bpTNAC1e92386223862epoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Aug 2025 13:28:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250814132839epoutp02f28542907cd55acaa8442113d84f7a42~bpTNAC1e92386223862epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755178119;
	bh=L3ufGPnyrW0N3UVpr3/riCJH1PQGRtTjLIlg9Lbrstg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZzRxVVY5/wPdoVLxiMHEU5kpHumoK0S66oxLoNIMT+d4vhRsTLFh2Z+Ce+MWHDkOG
	 LfhHE3VzzpQXqt+UWdVLNcSatvUVQVOcNZ4Qp7RPX1fWDait/49tMsZ/J7ivfIBZFf
	 UNYY6UXvJ8rL0Fkt/Zonw5Ue59gdHqCKjTkPjq/I=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250814132838epcas5p3c3693b0f5672407d67efe160b31fcc0c~bpTMXiWWT1937819378epcas5p3c;
	Thu, 14 Aug 2025 13:28:38 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c2mKK6nlKz6B9m7; Thu, 14 Aug
	2025 13:28:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814132606epcas5p1cdf8e1a97f5abe9d71dcd1b425a07648~bpQ_QWk6L2554225542epcas5p1n;
	Thu, 14 Aug 2025 13:26:06 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250814132602epsmtip1c22abee846ffe43383ffacb28125aafe~bpQ7V3wRg3173831738epsmtip1Y;
	Thu, 14 Aug 2025 13:26:02 +0000 (GMT)
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
In-Reply-To: <aJtMdHcidETZyiIp@vaman>
Subject: RE: [PATCH v5 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Thu, 14 Aug 2025 18:56:01 +0530
Message-ID: <02f101dc0d1e$fd018ef0$f704acd0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ+ZgWj3OwstM5ZbwFL0KmcSzrOlQIGOcp3ARbD4UABdmTpTbL41iug
Content-Language: en-in
X-CMS-MailID: 20250814132606epcas5p1cdf8e1a97f5abe9d71dcd1b425a07648
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114310epcas5p459aa232884d22501f5fefe42f239fecc
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114310epcas5p459aa232884d22501f5fefe42f239fecc@epcas5p4.samsung.com>
	<20250805115216.3798121-3-pritam.sutar@samsung.com> <aJtMdHcidETZyiIp@vaman>

Hi Vinod, 

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 12 August 2025 07:45 PM
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
> Subject: Re: [PATCH v5 2/6] phy: exynos5-usbdrd: support HS phy for
> ExynosAutov920
> 
> On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> > Enable UTMI+ phy support for this SoC which is very similar to what
> > the existing Exynos850 supports.
> >
> > Add required change in phy driver to support HS phy for this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 123
> ++++++++++++++++++++
> >  include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
> >  2 files changed, 125 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index dd660ebe8045..5400dd23e500 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > @@ -2054,6 +2054,126 @@ static const struct
> exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
> >  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
> >  };
> >
> > +static int exynosautov920_usbdrd_phy_init(struct phy *phy) {
> > +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> > +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> > +	int ret;
> > +
> > +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks,
> phy_drd->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Bypass PHY isol */
> > +	inst->phy_cfg->phy_isol(inst, false);
> > +
> > +	/* UTMI or PIPE3 specific init */
> > +	inst->phy_cfg->phy_init(phy_drd);
> > +
> > +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks,
> > +phy_drd->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int exynosautov920_usbdrd_phy_exit(struct phy *phy) {
> > +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> > +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> > +	int ret = 0;
> 
> Superfluous init..
> 
> > +
> > +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks,
> phy_drd->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	exynos850_usbdrd_phy_exit(phy);
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
> > +static int exynosautov920_usbdrd_phy_power_on(struct phy *phy) {
> > +	int ret;
> > +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> > +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> 
> Reverse chrsitmas tree pls
> 
> --
> ~Vinod

Will address these comments in next version of the patch-set (v6).

Thank you.

Regards,
Pritam



Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E928B4E2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134090; cv=none; b=Cdb5IoOZiCnf5rdSb5QsuFAU+a9k/m8/6oOyUofivPhW2PCuo0GsWFI5Y21cBAj/2aJtu/FEDLAXeFR6/zXM5wVi0ta3w8KnepoeJNdZACm647M8Qn6aG0RXotPtRNR4jW90bwxkg8+7HAR8KZ86thjckfv5QlB3zyz7K8oE2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134090; c=relaxed/simple;
	bh=uuwC/DJIb6VTRWIEAVjX3lMspdgVOprsrIy5ct90hXU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RiH9ax/H8ZkMma5Fz9L5vHR5PxHqSjVo6eFAg+0XNGGsF/TS/wlRSzJCVVXSDD8ZIp2/+e6zL9X6+JRZ3skCV+RPJKZd6bqD71hYQ/HVqSoU13+seutr+VNom74J0FWFgulyOv/ZRiX0n3QyR6kxPGIqjuLUX/PvqPHBxo8SdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UwaCBZ9B; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UwaCBZ9B"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250710075446epoutp02470a3e75bdbe82b8c72b03a96a2d841b~Q1KscydLS1538115381epoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 07:54:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250710075446epoutp02470a3e75bdbe82b8c72b03a96a2d841b~Q1KscydLS1538115381epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752134086;
	bh=oa4e30xg1nXdVHY1HFgVYjmBCHhk8pTf5n8D+xTU2Cg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=UwaCBZ9B38oBxU8W/FfkVgzGYFLlgaB2w9VTyRpnRL30SjeHZiSibg1qN0GtEBlCo
	 2gqsINlDaR79vKkmmsn+h5ElfoheXhOMNQhsS7rj/k9Ucb+Wli+0TFIRgZfl/hTSQO
	 WS7+rbFfMpne9fMIClP1nHKgh0LUdR4IJDvJv/Tw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250710075445epcas5p219a2e4013704b00030be1b789ef1eb5a~Q1Kr4wP112201222012epcas5p2b;
	Thu, 10 Jul 2025 07:54:45 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.174]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bd6ZC410Wz2SSKh; Thu, 10 Jul
	2025 07:54:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250709101135epcas5p2cfcd5e2be55f18c39d637774ca2c31b6~QjY3nfg5J2387023870epcas5p2Z;
	Wed,  9 Jul 2025 10:11:35 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250709101132epsmtip1311de8ec68c69b224cac40a4b38269ad~QjY0zgCal0502805028epsmtip1Y;
	Wed,  9 Jul 2025 10:11:32 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250701120706.2219355-3-pritam.sutar@samsung.com>
Subject: RE: [PATCH v4 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Wed, 9 Jul 2025 15:41:31 +0530
Message-ID: <001701dbf0b9$da068d00$8e13a700$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AFx24JLAb5T8KKzRu1osA==
Content-Language: en-in
X-CMS-MailID: 20250709101135epcas5p2cfcd5e2be55f18c39d637774ca2c31b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115959epcas5p40f28954777a620b018251301eea13873
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115959epcas5p40f28954777a620b018251301eea13873@epcas5p4.samsung.com>
	<20250701120706.2219355-3-pritam.sutar@samsung.com>

Hi Neil,

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 01 July 2025 05:37 PM
> To: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; neil.armstrong=40=
linaro.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com;
> pritam.sutar=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: =5BPATCH v4 2/6=5D phy: exynos5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
>=20
> Support only UTMI+ port for this SoC which is very similar to what the ex=
isting
> Exynos850 supports.
>=20
> This SoC shares phy isol between USBs. Bypass PHY isol when first USB is
> powered on and enable it when all of then are powered off. Add required
> change in phy driver to support HS phy for this SoC.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong=40linaro.org>
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    =7C 131 ++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h =7C   2 +
>  2 files changed, 133 insertions(+)
>=20
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index dd660ebe8045..64f3316f6ad4 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> =40=40 -480,6 +480,8 =40=40 struct exynos5_usbdrd_phy =7B
>  	enum typec_orientation orientation;
>  =7D;
>=20
> +static atomic_t usage_count =3D ATOMIC_INIT(0);
> +

Added phy isolation for exynosautov920 support as per comments on v3 patch-=
set.
Since phy isol is shared across usb ports, added usage counter to bypass an=
d enable it.=20

Can you please review the code?=20

However, added =22Reviewed-by=22 tag as per comments on v3 patch-set.

>  static inline
>  struct exynos5_usbdrd_phy *to_usbdrd_phy(struct phy_usb_instance *inst) =
 =7B
> =40=40 -2054,6 +2056,132 =40=40 static const struct exynos5_usbdrd_phy_dr=
vdata
> exynos990_usbdrd_phy =3D =7B
>  	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
>  =7D;
>=20
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy) =7B
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd-
> >clks);
> +	if (ret)
> +		return ret;
> +
> +	if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI) =7B
> +		/* Bypass PHY isol when first USB is powered on */
> +		if ((atomic_inc_return(&usage_count) =3D=3D 1))
> +			inst->phy_cfg->phy_isol(inst, false);
> +	=7D
> +
> +	/* UTMI or PIPE3 specific init */
> +	inst->phy_cfg->phy_init(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +=7D
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy) =7B
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +	int ret =3D 0;
> +
> +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd-
> >clks);
> +	if (ret)
> +		return ret;
> +
> +	if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI) =7B
> +		exynos850_usbdrd_phy_exit(phy);
> +
> +		/* enable PHY isol when all USBs are powered off */
> +		if (atomic_dec_and_test(&usage_count))
> +			inst->phy_cfg->phy_isol(inst, true);
> +	=7D
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +=7D
> +
> +static int exynosautov920_usbdrd_phy_power_on(struct phy *phy) =7B
> +	int ret;
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +
> +	dev_dbg(phy_drd->dev, =22Request to power_on usbdrd_phy phy=5Cn=22);
> +
> +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_core_clks,
> +				      phy_drd->core_clks);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable supply */
> +	ret =3D regulator_bulk_enable(phy_drd->drv_data->n_regulators,
> +				    phy_drd->regulators);
> +	if (ret) =7B
> +		dev_err(phy_drd->dev, =22Failed to enable PHY regulator(s)=5Cn=22);
> +		goto fail_supply;
> +	=7D
> +
> +	return 0;
> +
> +fail_supply:
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
> +				   phy_drd->core_clks);
> +
> +	return ret;
> +=7D
> +
> +static int exynosautov920_usbdrd_phy_power_off(struct phy *phy) =7B
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +
> +	dev_dbg(phy_drd->dev, =22Request to power_off usbdrd_phy phy=5Cn=22);
> +
> +	/* Disable supply */
> +	regulator_bulk_disable(phy_drd->drv_data->n_regulators,
> +			       phy_drd->regulators);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
> +				   phy_drd->core_clks);
> +
> +	return 0;
> +=7D
> +
> +static const char * const exynosautov920_regulator_names=5B=5D =3D =7B
> +	=22avdd075_usb=22, =22avdd18_usb20=22, =22avdd33_usb20=22, =7D;
> +
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D =7B
> +	.init		=3D exynosautov920_usbdrd_phy_init,
> +	.exit		=3D exynosautov920_usbdrd_phy_exit,
> +	.power_on       =3D exynosautov920_usbdrd_phy_power_on,
> +	.power_off      =3D exynosautov920_usbdrd_phy_power_off,
> +	.owner		=3D THIS_MODULE,
> +=7D;
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920=5B=
=5D =3D =7B
> +	=7B
> +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> +		.phy_isol	=3D exynos5_usbdrd_phy_isol,
> +		.phy_init	=3D exynos850_usbdrd_utmi_init,
> +	=7D,
> +=7D;
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy
> =3D =7B
> +	.phy_cfg		=3D phy_cfg_exynosautov920,
> +	.phy_ops		=3D &exynosautov920_usbdrd_phy_ops,
> +	.pmu_offset_usbdrd0_phy	=3D
> EXYNOSAUTOV920_PHY_CTRL_USB20,
> +	.clk_names		=3D exynos5_clk_names,
> +	.n_clks			=3D ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		=3D exynos5_core_clk_names,
> +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
> +	.regulator_names	=3D exynosautov920_regulator_names,
> +	.n_regulators		=3D
> ARRAY_SIZE(exynosautov920_regulator_names),
> +=7D;
> +
>  static const struct exynos5_usbdrd_phy_config phy_cfg_gs101=5B=5D =3D =
=7B
>  	=7B
>  		.id		=3D EXYNOS5_DRDPHY_UTMI,
> =40=40 -2260,6 +2388,9 =40=40 static const struct of_device_id
> exynos5_usbdrd_phy_of_match=5B=5D =3D =7B
>  	=7D, =7B
>  		.compatible =3D =22samsung,exynos990-usbdrd-phy=22,
>  		.data =3D &exynos990_usbdrd_phy
> +	=7D, =7B
> +		.compatible =3D =22samsung,exynosautov920-usbdrd-phy=22,
> +		.data =3D &exynosautov920_usbdrd_phy
>  	=7D,
>  	=7B =7D,
>  =7D;
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h
> b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 71e0c09a49eb..4923f9be3d1f 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> =40=40 -688,4 +688,6 =40=40
>  =23define GS101_GRP2_INTR_BID_UPEND
> 	(0x0208)
>  =23define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
>=20
> +/* exynosautov920 */
> +=23define EXYNOSAUTOV920_PHY_CTRL_USB20
> 	(0x0710)
>  =23endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
> --
> 2.34.1

Thank you.

Regards,
Pritam


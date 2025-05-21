Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B758236429
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815960; cv=none; b=e1r3unCoYIW0OkVyMP8HQOcCYEZsVvPS0LsQSoxlaC78HOZ5JKcntTMjJw45a9ZyFOPRJWje93pZGm4/5ygj/VtN90hvdelHoMTRcijMJSlttvhuyAjFxQfKomyr7gy0CJJoEaAHWbnbfvENnnDmBWiWobvuy/2uzzE2K5asUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815960; c=relaxed/simple;
	bh=SGhk2W7u2KRWGXsU7gti9kLEcSc72etTFN6U3h0mVK4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=sToFx+BU4UpW4ztjmfHuYUnRUuADDYsLTUrEE3QWq9KyivAAfwrQGgOgxuLtwp7PUPerSU/+w+Nk2wnYL/Y2PskL5Q38DrESYSlAMke6Ekv6xROfFdEjCSpU2fbmbj5XwuaBW/8GZyaIICLIJDVF/CFk/WIzutMhwggMoG1kkpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=J9VYmDAJ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J9VYmDAJ"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250521082550epoutp028b1fdaddfbd74bb64890dac34660981f~BfVjZeXGO0448104481epoutp02e
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2025 08:25:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250521082550epoutp028b1fdaddfbd74bb64890dac34660981f~BfVjZeXGO0448104481epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747815950;
	bh=nr0SojgBW0OyzBwMwWFbDN2/zZUC1sT9ka++LQzqMy8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=J9VYmDAJKHkzuBvc0uHlVyG40M353HlrY9REJJjbZFy2SD+sO7i4Xj7QlIho3xFEd
	 VkB15xExVOOCxwm1m8egGDGCGX1XlkDvXhLBj49O9sGBlFOcwkLL1ZwICgJe35Wbok
	 rZweN/NXY+DAFEigUYwwTS8caxK7j2uecpK1udk8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250521082550epcas5p197100e59ef919a5bc5322deec4caa768~BfVinuYnb0385703857epcas5p1U;
	Wed, 21 May 2025 08:25:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4b2Pd81Z7Vz2SSKX; Wed, 21 May
	2025 08:25:48 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250521065627epcas5p43c4100703f434187d146723b22782306~BeHf4rgFN0693706937epcas5p44;
	Wed, 21 May 2025 06:56:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250521065627epsmtrp14d29acdc4c72a3f5c61c1bf9623ffaf7~BeHf1eldQ1385313853epsmtrp1N;
	Wed, 21 May 2025 06:56:27 +0000 (GMT)
X-AuditID: b6c32a52-f0cb424000004c16-1a-682d791a824d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	12.D5.19478.A197D286; Wed, 21 May 2025 15:56:26 +0900 (KST)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250521065623epsmtip20511b2deb72e652ab87ae28f432ef8aa~BeHchivwD2753527535epsmtip2c;
	Wed, 21 May 2025 06:56:23 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Neil Armstrong'" <neil.armstrong@linaro.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
Subject: RE: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Wed, 21 May 2025 12:26:22 +0530
Message-ID: <000101dbca1d$78ca5570$6a5f0050$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIiRnTfgkV106HBI/lpdza94uXQvgIU2wPiAQ+Sme8BD11JvrMuDYog
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA02RfUhTURiHO/fe3V1Hi+vUOlk0WfTdZmbkKUyyKFYRhJCEIbn0spWbjk2l
	gqiIPpSoZaXzlqkYs2alqamJZW0TNG3WjKVlU9S5rCjKpa101lUK/3vOe36/hxdeChe9IEKp
	Q2kZjC5NoZaQAqLWKhFLQ49KVWv876JQ381aEtV8rCbQ3cd2DLnqTXxUZLPzkLOrhI/G/R0k
	aj4ziaNh1kWiqgEnD3U23CCRwTxKIGPHEwzds73no44POTz09dFbgCqNfgJNNtbzkdfXhyPr
	53M8ZCv7hqFHPS345rny1vvVmLzKnE3Ke5yNpLz61gn5xRozkI9ULdpDJgiiUxj1oSxGFx6T
	JFB9HfPytb+lRwZLs/GT4M6SHEBRkF4HmywJOSCAEtF1AHoqZBxDeiHsz3vAm+YgeMfv4ecA
	wd+MB0C/eQhwXZKOgoX3l3HzYPo1BkuHXYB74LQVg9+vssR0YwxAV8svjFMF0DGwsW+S4DiI
	joP5dhefY4JeAivO5vE4q5DeALsLgrmxkA6ErQWDU3GcXgXd3e7/bCr5hE9vFwZ9btPUpsH0
	dmgZPY9PZ+bBZt8F3ACC2BkqdoaKnaFiZ1SKAWEGIYxWr1FqkrURMr1Co89MU8qS0zVVYOri
	K+PqgaliQmYBGAUsAFK4JFiYeHu1SiRMURw9xujSD+gy1YzeAhZQhGSecLE6O0VEKxUZTCrD
	aBndv1+MCgg9ibHHP8JvZaGpHTvFI1J5Ya4g35HY8DbWEr+OemNmuk9k9Xd1jrzP37uvtjMj
	LMnBznm59eGpgcqiAejYnDBfGf+UV+ZUh1WOh18T+XiSX2KbcqD0QXnuUHNi25Zty3uVl0vq
	YiLb8Nm2XebR2PJUje86nh6yz+MyuV+Ju+qjVaL1nca63V62qf3HqWFZrrfocHhE7Lgx8NIt
	fezesQJrwqx2Qns4t63FWDIysbRuv71vo2CZ4fuNeM/5A0ldX4S60+7oCWfQpsEaBbv1WGGv
	XW6Iag90/f5S3GohmhxHHNXeNv+VhhU77oHoZ8/Fi3xNL/dYfx6UGiIz8tbm90gkhF6liFiJ
	6/SKP2hl+9hgAwAA
X-CMS-MailID: 20250521065627epcas5p43c4100703f434187d146723b22782306
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
	<CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
	<20250516102650.2144487-3-pritam.sutar@samsung.com>
	<a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>

Hi Neil,

Thank you for reviewing the patches.

> -----Original Message-----
> From: neil.armstrong=40linaro.org <neil.armstrong=40linaro.org>
> Sent: 20 May 2025 01:10 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 2/2=5D phy: exyons5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> On 16/05/2025 12:26, Pritam Manohar Sutar wrote:
> > This SoC has a single USB 3.1 DRD combo phy and three USB2.0 DRD HS
> > phy controllers those only support the UTMI+ interface.
> >
> > Support only UTMI+ for this SoC which is very similar to what the
> > existing Exynos850 supports.
> >
> > The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is out of
> > scope of this commit.
> >
> > Add required change in phy driver to support HS phy for this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >   drivers/phy/samsung/phy-exynos5-usbdrd.c =7C 85
> ++++++++++++++++++++++++
> >   1 file changed, 85 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index 634c4310c660..b440b56c6595 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > =40=40 -177,6 +177,9 =40=40
> >   =23define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
> >
> >   /* Exynos850: USB DRD PHY registers */
> > +=23define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
> > +=23define CTRL_VER_MAJOR_VERSION			GENMASK(31, 24)
> > +
> >   =23define EXYNOS850_DRD_LINKCTRL			0x04
> >   =23define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
> >   =23define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
> > =40=40 -1772,6 +1775,10 =40=40 static const char * const
> exynos5_regulator_names=5B=5D =3D =7B
> >   	=22vbus=22, =22vbus-boost=22,
> >   =7D;
> >
> > +static const char * const exynosautov920_clk_names=5B=5D =3D =7B
> > +	=22ext_xtal=22,
> > +=7D;
> > +
> >   static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy =
=3D =7B
> >   	.phy_cfg		=3D phy_cfg_exynos5,
> >   	.phy_ops		=3D &exynos5_usbdrd_phy_ops,
> > =40=40 -1847,6 +1854,81 =40=40 static const struct exynos5_usbdrd_phy_d=
rvdata
> exynos850_usbdrd_phy =3D =7B
> >   	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
> >   =7D;
> >
> > +static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy
> > +*phy_drd) =7B
> > +	u32 version;
> > +
> > +	version =3D readl(phy_drd->reg_phy +
> EXYNOSAUTOv920_DRD_CTRL_VER);
> > +	dev_info(phy_drd->dev, =22usbphy: version:0x%x=5Cn=22, version);
>=20
> Please do not add mode info to boot log, use dev_dbg instead.

Will replace dev_info by dev_dbg.

>=20
> > +
> > +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) =3D=3D 0x3)
> > +		/* utmi init for exynosautov920 HS phy */
> > +		exynos850_usbdrd_utmi_init(phy_drd);
> > +=7D
> > +
> > +static int exynosautov920_usbdrd_phy_init(struct phy *phy) =7B
> > +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> > +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> > +	int ret =3D 0;
> > +
> > +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd-
> >clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* UTMI or PIPE3 specific init */
> > +	inst->phy_cfg->phy_init(phy_drd);
> > +
> > +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks,
> > +phy_drd->clks);
> > +
> > +	return 0;
> > +=7D
> > +
> > +static void exynosautov920_v3p1_phy_dis(struct phy *phy) =7B
> > +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> > +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> > +	void __iomem *reg_phy =3D phy_drd->reg_phy;
> > +	u32 version;
> > +
> > +	version =3D readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> > +
> > +	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) =3D=3D 0x3)
> > +		exynos850_usbdrd_phy_exit(phy);
> > +=7D
> > +
> > +static int exynosautov920_usbdrd_phy_exit(struct phy *phy) =7B
> > +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> > +
> > +	if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
> > +		exynosautov920_v3p1_phy_dis(phy);
> > +
> > +	return 0;
> > +=7D
> > +
> > +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D =7B
> > +	.init		=3D exynosautov920_usbdrd_phy_init,
> > +	.exit		=3D exynosautov920_usbdrd_phy_exit,
>=20
> <snip>
>=20
> > +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> > +		.phy_init	=3D exynosautov920_usbdrd_utmi_init,
>=20
> <snip>
>=20
> > +	=7D, =7B
> > +		.compatible =3D =22samsung,exynosautov920-usb31drd-phy=22,
> > +		.data =3D &exynosautov920_usb31drd_phy
>=20
> All those new ops are only called when matching this compatible, it it re=
ally
> necessary to check the version ? is there =22samsung,exynosautov920-usb31=
drd-
> phy=22 PHYs with version different from 3 in the wild ?
>=20

This SoC has a single USB 3.1 DRD combo phy of version v400 (major : minor =
versions) and three USB2.0
DRD phy v303 (major : minor versions) controllers those only support the UT=
MI+ interface. Currently,=20
supporting only v303 phys in this patch-set, and planning v400 phy later (s=
oon).=20

Yes, there's v400 phy version that is different from v303 phy. Hence, phy v=
ersion check is needed to support both the phys for same compatible.

> Neil
>=20
> >   	=7D,
> >   	=7B =7D,
> >   =7D;


Thank you,
Pritam


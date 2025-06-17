Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87E35949
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209452; cv=none; b=JyY9F9NRJYlgxRoWHRZbBnU3+qpr1fDBnAdL58Wi2MDZF/dkl1z0fcpreh5pKHovrs2ZlLFpe4gR8VkPpHAP3g78OSFYpaCfJJywnMzbubJ6gr8YD+Nw5jVvhgBqnK9BqJVJv1Xna4CPp3EzhRHbuwY4jU5ShPuKKKSvy/u4pIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209452; c=relaxed/simple;
	bh=fiCCLhq4eI+NscROLU/p6AZ9h1Xl8bkk9yJgpengh7o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=QRVWBfYA1C4LhIgohY33vL7rrU9hr/beX3RLInl+i92YXKlKPolZcMt8FVQ4z9p5UjYaEpnhG/BlHqGVt3PkDq9/CO+voh/ahBBzQnTn3f+I/89WFPZhiI8WwatHhlCXmzByiwN7AURsX6cDEAAAJjAxuSukzL+kY9Miz+M/Zzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=p28eAWFq; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p28eAWFq"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250618011728epoutp01d09e8c3c29aaf0806642537b7db5edc3~J-jhyf0Zr0156801568epoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:17:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250618011728epoutp01d09e8c3c29aaf0806642537b7db5edc3~J-jhyf0Zr0156801568epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209448;
	bh=FmDPUKjdxkABnjlOOT1kBNy0I7s0S7ikbeAULNkoib4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=p28eAWFqfSILy8HrE9lGug8ES+qTudu+cz8x/G2s1NgIJIBRk07mpDR/gfMCF3jt/
	 R3EtmQqWBKbKSuOdB9DJ5AFgDlKPs6gyQWQr6WfwA/agAHzfjd7pQH8jKUdYrvrOBH
	 xeOOVZn00YPzpT5QtoHo8O568BAv0Ikr5MjmKLqM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250618011727epcas5p4d4aa4a5e04fb9ac44fd13789efc87711~J-jhKMtDk3093530935epcas5p4v;
	Wed, 18 Jun 2025 01:17:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.177]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bMQny0bkVz6B9mG; Wed, 18 Jun
	2025 01:17:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250617173634epcas5p3dbbe9a86be00bc8124444dc9a2cea1bc~J5RHWoRox3236532365epcas5p36;
	Tue, 17 Jun 2025 17:36:34 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617173631epsmtip1593e56249b8600e799f1c8e2d4c868c4~J5REgnjn72629126291epsmtip1e;
	Tue, 17 Jun 2025 17:36:31 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-boisterous-mouse-of-current-adfd67@kuoka>
Subject: RE: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Tue, 17 Jun 2025 23:06:30 +0530
Message-ID: <000201dbdfae$5ef17e70$1cd47b50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gLGzMbPAZuXxZEB509h9LDl7H+g
Content-Language: en-in
X-CMS-MailID: 20250617173634epcas5p3dbbe9a86be00bc8124444dc9a2cea1bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055043epcas5p2437abc65042529a2012a6ca80559ac80
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>
	<20250613055613.866909-3-pritam.sutar@samsung.com>
	<20250616-boisterous-mouse-of-current-adfd67@kuoka>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 16 June 2025 01:43 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 2/9=5D phy: exyons5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> On Fri, Jun 13, 2025 at 11:26:06AM GMT, Pritam Manohar Sutar wrote:
> > This SoC has a single USB 3.1 DRD combo phy that supports both
> > UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> > those only support the UTMI+ (HS) interface.
> >
> > Support only UTMI+ port for this SoC which is very similar to what the
> > existing Exynos850 supports.
> >
> > The combo phy support is out of scope of this commit.
> >
> > Add required change in phy driver to support HS phy for this SoC.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c =7C 25
> > ++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index 917a76d584f0..15965b4c6f78 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > =40=40 -2025,6 +2025,28 =40=40 static const struct exynos5_usbdrd_phy_d=
rvdata
> exynos850_usbdrd_phy =3D =7B
> >  	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
> >  =7D;
> >
> > +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D =7B
> > +	.init		=3D exynos850_usbdrd_phy_init,
> > +	.exit		=3D exynos850_usbdrd_phy_exit,
> > +	.owner		=3D THIS_MODULE,
> > +=7D;
> > +
> > +static const struct exynos5_usbdrd_phy_config
> phy_cfg_exynosautov920=5B=5D =3D =7B
> > +	=7B
> > +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> > +		.phy_init	=3D exynos850_usbdrd_utmi_init,
> > +	=7D,
> > +=7D;
> > +
> > +static const struct exynos5_usbdrd_phy_drvdata
> exynosautov920_usbdrd_phy =3D =7B
> > +	.phy_cfg		=3D phy_cfg_exynosautov920,
> > +	.phy_ops		=3D &exynosautov920_usbdrd_phy_ops,
> > +	.clk_names		=3D exynos5_clk_names,
> > +	.n_clks			=3D ARRAY_SIZE(exynos5_clk_names),
> > +	.core_clk_names		=3D exynos5_core_clk_names,
> > +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
>=20
> Where are the supplies? Where is power on/off seqequence in the phy ops?
>=20
> No pmu control (missing offset)?
>=20

LDO regulators are always on.  USB don=E2=80=99t=20control=20them=20for=20E=
xynosAutov920.=0D=0APhy=20isol=20is=20shared=20across=20the=20USBs.=20And=
=20it=20is=20handled=20in=20bootloader=20(if=20one=20causes=20phy=20exit,=
=20it=20isolates=20all=20the=20phys).=20=0D=0A=0D=0AHence,=20supplies=20and=
=20power=20on/off=20are=20removed=20from=20phy=20ops.=0D=0A=0D=0A>=20You=20=
have=20entire=20commit=20msg=20to=20explain=20unusual=20things.=0D=0A>=20=
=0D=0A=0D=0AWill=20update=20the=20same=20with=20commit=20message=20in=20nex=
t=20version=20of=20the=20patch-set=20(v4).=20=0D=0A=0D=0A>=20Best=20regards=
,=0D=0A>=20Krzysztof=0D=0A=0D=0A=0D=0AThank=20you,=0D=0A=0D=0ARegards,=0D=
=0APritam=0D=0A=0D=0A

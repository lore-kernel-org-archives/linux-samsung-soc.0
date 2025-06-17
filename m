Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325B013C3CD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209527; cv=none; b=E0WBCjNCXWUdkq1vwbp5PWk+68KlPLlo0chOcbIJRiDukHTDxRPYkXvv6WY0k0lKVkSE9PBcMn87EXU6zT0xCemULpRUoOQPnXyA2K0m1c3f9xcGw2Kx71hkKX4XUIq/hMtkkR+zCJWcCCVG/dEUm1tj1FF7vbUJHCsVGMkb32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209527; c=relaxed/simple;
	bh=M7DUf/HzuDtgth1IoRmrS5uPkXrXHvqAWxYKK70HAfo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=bo/fv5ZzjxWwC8NGVRKTi5s6RvsARlYWo70lFlG+naO3TT9vcPr/Wz1u8Gs8HpsBkO+p4uW8LDzwGRkb3qy9ZB8PozJQoKA31atg3j24aOupNJgkKXdaXfcM1cydUmUw894AC35gr19PyGQhUVQ29+E1FKqw3TEAfBwSW4ahk9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hwOfwwPf; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hwOfwwPf"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250618011844epoutp02f7b66383525fcba010818e933b9426c7~J-kobCiKt2514025140epoutp02D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250618011844epoutp02f7b66383525fcba010818e933b9426c7~J-kobCiKt2514025140epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209524;
	bh=wtB2nyAmYkJNev8xHYq9d18z8IHo9fhTQMx4FXJI91Q=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=hwOfwwPf1PK9Df2XtBITBVGkjWNu/RovmVrO+C5uEhHfZcW1PEsaa9usJPF6RWFha
	 szkvyXwbP0P5sP7J0iC5oIok6+B+Ue4nJhGtxKQ8jcu8WgrFs0gG5+hs1dNHrBCkXy
	 kcV98DhjUY2/DpcVvH7bk0wFBP/zCRAxM1GE1U5I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250618011843epcas5p3367373e129f7f5754a9dd4a8b63038f1~J-knaQ-wF0610006100epcas5p3L;
	Wed, 18 Jun 2025 01:18:43 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQqP1bF5z3hhT3; Wed, 18 Jun
	2025 01:18:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250617181451epcas5p4b52e90a02e099d01aa319f0235846d28~J5yig9GeW0527705277epcas5p4u;
	Tue, 17 Jun 2025 18:14:51 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617181448epsmtip25216cdd55479e0fd7073a49e4b970357~J5yfuD5Nn2750327503epsmtip22;
	Tue, 17 Jun 2025 18:14:48 +0000 (GMT)
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
In-Reply-To: <20250616-proud-statuesque-polecat-616eaf@kuoka>
Subject: RE: [PATCH v3 5/9] phy: exyons5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Tue, 17 Jun 2025 23:44:47 +0530
Message-ID: <000601dbdfb3$b800ecd0$2802c670$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gGep4S9AR7FIqoAhOg89rD+NDxg
Content-Language: en-in
X-CMS-MailID: 20250617181451epcas5p4b52e90a02e099d01aa319f0235846d28
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4@epcas5p3.samsung.com>
	<20250613055613.866909-6-pritam.sutar@samsung.com>
	<20250616-proud-statuesque-polecat-616eaf@kuoka>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 16 June 2025 01:47 PM
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
> Subject: Re: =5BPATCH v3 5/9=5D phy: exyons5-usbdrd: support HS combo phy=
 for
> ExynosAutov920
>=20
> On Fri, Jun 13, 2025 at 11:26:09AM GMT, Pritam Manohar Sutar wrote:
> > +static const struct
> > +exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920=5B=5D =3D =
=7B
> > +	=7B
> > +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> > +		.phy_init	=3D exynosautov920_usbdrd_utmi_init,
> > +	=7D,
> > +=7D;
> > +
> > +static const struct exynos5_usbdrd_phy_drvdata
> exynosautov920_usbdrd_hsphy =3D =7B
> > +	.phy_cfg		=3D usbdrd_hsphy_cfg_exynosautov920,
> > +	.phy_ops		=3D &exynosautov920_usb31drd_phy_ops,
> > +	.clk_names		=3D exynos5_clk_names,
> > +	.n_clks			=3D ARRAY_SIZE(exynos5_clk_names),
> > +	.core_clk_names		=3D exynos5_core_clk_names,
> > +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
> > +=7D;
>=20
> Same questions: where are all other fields and resources?
>=20

LDO regulators are always on.  USB don=E2=80=99t=20control=20them=20for=20E=
xynosAutov920.=0D=0APhy=20isol=20is=20shared=20across=20the=20USBs.=20And=
=20it=20is=20handled=20in=20bootloader=20(if=20one=20causes=20phy=20exit,=
=20it=20isolates=20all=20the=20phys).=20=0D=0A=0D=0AHence,=20supplies=20and=
=20power=20on/off=20are=20removed=20from=20phy=20ops.=0D=0A=0D=0AWill=20upd=
ate=20the=20same=20with=20commit=20message=20in=20next=20version=20of=20the=
=20patch-set=20(v4).=0D=0A=0D=0A>=20Best=20regards,=0D=0A>=20Krzysztof=0D=
=0A=0D=0A=0D=0A

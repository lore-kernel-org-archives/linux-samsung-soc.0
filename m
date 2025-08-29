Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79A23148D8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469007; cv=none; b=ouFoaDNdMGSVlAtOvSlQxKbYQdnaLbUmXArrnlcdZPD9zdayw8rVtYd09w+H2SX51ZilLE6kiqaPChBka0bO+EExYelivYs27q+v8xxdFvlmHTSJ3NeGQxRltQKpC2rMGkwGpfdpCZuS/xgtc2N5laj6PzIzw02SoPaeF4WEYO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469007; c=relaxed/simple;
	bh=UkovlfHenV4WT3s3KqM90aV65iV1WYZhu5CPcxht3kM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=S0ugdq/+HcNVwFxrBv7y/0AiujcKicNDtBz8EyJFtHp7EpbdctgeRIisaCgce5TCxkO90kU4Xk5pd/gBXnhHXi2cFEx0NQmWKqypzxY/AXnxwQHMXuJjJUxb4Hub08Yaznch8gK+2DHfsJ2KLQW7eBMH/JgntpTbHO0qRxOK2wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bLD1OemG; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bLD1OemG"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829120322epoutp02479865895642bb43f4d50d72303cca2d~gO0B7cEai0352603526epoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 12:03:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829120322epoutp02479865895642bb43f4d50d72303cca2d~gO0B7cEai0352603526epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756469002;
	bh=N9szQPe/7ipHEDNbxZo34E063kPc1jQMPVE3QTXxPAw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bLD1OemGrCXJjy0NGdgGQuVg9OxwfwBqDlUf7A4YCvPM1R5lqkANtyCPp97RIgJ8u
	 xzpFudJv9M2VdIlrlYqxLOs7fzxcpj2V51r6FPTlXnFWIGj6GnKlGsqkpVjPEoQae+
	 F1RjH6KJZhW+UdU38I3XU0eJ92EjxbIIyv3gCh8Y=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250829120322epcas5p12448fdc22bfd06ebd17fabf10c3e92e8~gO0BSebHi3201832018epcas5p1i;
	Fri, 29 Aug 2025 12:03:22 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCxk11NSyz2SSKX; Fri, 29 Aug
	2025 12:03:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250829120320epcas5p3eb6abcefc16910b3b7b73d5e5b169f43~gOz-yUdR00051000510epcas5p3A;
	Fri, 29 Aug 2025 12:03:20 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829120317epsmtip14cec5995bc2dbc0cbf21ccbf1f9a1b72~gOz80JLJO1511815118epsmtip1e;
	Fri, 29 Aug 2025 12:03:17 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <igor.belwon@mentallysanemainliners.org>,
	<johan@kernel.org>, <m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <6b5f20ed-4e88-441e-8f61-20866e2b39c7@kernel.org>
Subject: RE: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Fri, 29 Aug 2025 17:33:16 +0530
Message-ID: <001101dc18dc$e97457e0$bc5d07a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+wLwFCB2ArX7ZGwBn6FItwLUPA9DAP+/dGQCDX8RFrR+kenQ
Content-Language: en-in
X-CMS-MailID: 20250829120320epcas5p3eb6abcefc16910b3b7b73d5e5b169f43
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
	<20250822093845.1179395-6-pritam.sutar@samsung.com>
	<20250824-rough-fresh-orangutan-eecb2f@kuoka>
	<007501dc1653$e36c3b50$aa44b1f0$@samsung.com>
	<83dc9435-5850-425d-b345-52e84ef9262c@kernel.org>
	<000401dc18cd$ec02a1b0$c407e510$@samsung.com>
	<e8e99c16-ad40-4d79-be92-1aa55c13f9ea@kernel.org>
	<263801dc18d3$d1e20950$75a61bf0$@samsung.com>
	<6b5f20ed-4e88-441e-8f61-20866e2b39c7@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 29 August 2025 04:56 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Pritam Manohar Sutar'
> <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; andre.draszik=40linaro.org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; igor.belwon=40mentallysanemainliners.org;
> johan=40kernel.org; m.szyprowski=40samsung.com; s.nawrocki=40samsung.com;
> linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo ssphy
>=20
> On 29/08/2025 12:58, Alim Akhtar wrote:
> > Hi Krzysztof
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Friday, August 29, 2025 4:07 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com=
;
> >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> >> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> >> igor.belwon=40mentallysanemainliners.org;
> >> johan=40kernel.org; m.szyprowski=40samsung.com; s.nawrocki=40samsung.c=
om;
> >> linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org;
> >> linux-kernel=40vger.kernel.org; linux-arm- kernel=40lists.infradead.or=
g;
> >> linux-samsung-soc=40vger.kernel.org;
> >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 combo ssphy
> >>
> >> On 29/08/2025 12:15, Pritam Manohar Sutar wrote:
> >>> Hi Krzysztof
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >>>> Sent: 26 August 2025 02:05 PM
> >>>> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>>> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >>> .
> >>> .
> >>> =5Bsnip=5D
> >>> .
> >>> .
> >>>>>> Subject: Re: =5BPATCH v7 5/6=5D dt-bindings: phy: samsung,usb3-drd=
-phy:
> >>>>>> add
> >>>>>> ExynosAutov920 combo ssphy
> >>>>>>
> >>>>>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wro=
te:
> >>>>>>> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> >>>>>>> compatible to the USB3.0 SS(5Gbps). It requires two clocks,
> >>>>>>> named =22phy=22 and =22ref=22. The required supplies for USB3.1 a=
re
> >>>>>>> named as vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> >>>>>>
> >>>>>> Please do not describe the schema, but hardware. This sentence
> >>>>>> does not help me in my question further.
> >>>>>
> >>>>> This is a combo phy having Synopsys usb20 and usb30 phys (these 2
> >>>>> phys are
> >>>> totally different).
> >>>>> One PHY only supports usb2.0 and data rates whereas another one
> >>>>> does
> >>>>> usb3.1 ssp+ and usb3.1 ssp
> >>>>>
> >>>>> This patch only explains about usb30 (since these are two
> >>>>> different
> >>>>> phys) phy
> >>>> and omitted inclusion of usb20 reference (added separate patch for
> >>>> this patch no 3).
> >>>>>
> >>>>> Hope this is clear.
> >>>>
> >>>> No. That sentence still explains what schema is doing.
> >>>>
> >>>
> >>> Ok, let me simplify the commit message further something like below.
> >>> Anyways, the coverletter contains more details about it.
> >>>
> >>> =22dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo
> >>> ssphy
> >>>
> >>>   Add schema for combo ssphy found on this SoC.
> >>> =22
> >>>
> >>> Please confirm if this looks fine?
> >>> If so, will reflect the similar commit messages in patch 1 and 3.
> >>
> >> Please read my first comment again. I do not see how does this
> >> satisfy hardware explanation.
> >>
> > Just went through the conversation above, until what extent hardware
> > description need to be explain in the commit?
> > Do we have any guideline for the same?
> > Could you please help with an example from previous any commit or some
> other patches?
> > I understand that mentioning, =E2=80=9Ctwo=20clocks,=20two=20supplies=
=20etc=22=20are=20part=0D=0A>=20>=20of=20schema,=20one=20may=20or=20may=20n=
ot=20capture=20that=20in=20the=20commit.=0D=0A>=20>=20However=20mentioning,=
=20=E2=80=9Cthis=20hardware=20(SoC)=20contain=20a=20combo=20PHY=20which=0D=
=0A>=20supports=20usb3.1=20and=20usb3.0=22=20is=20not=20ok?=0D=0A>=20=0D=0A=
>=20=0D=0A>=20Maybe=20that's=20just=20language,=20but=20to=20me=20the=20com=
mit=20msg=20did=20not=20describe=0D=0A>=20hardware=20after=20first=20senten=
ce,=20but=20said=20what=20schema=20requires=20(some=0D=0A>=20clocks=20and=
=20supplies).=20Other=20examples:=0D=0A>=2000399bbe02d2bb6fd8d6eb90573ec305=
616449f4=0D=0A>=20e4c9a7b475e5d0d9b2440ee48f91d1364eabd6cb=0D=0A>=20=0D=0A=
=0D=0AThank=20you=20for=20the=20pointers,=20will=20refer=20the=20examples=
=20and=20=0D=0Aupdate=20the=20commit=20messages=20accordingly.=20=0D=0A=0D=
=0A>=20and=20here=20another=20anti-pattern:=0D=0A>=2023f793850e9ee7390584c0=
809f085d6c88de7d3f=0D=0A>=20=0D=0A>=20(and=20before=20you=20ask=20why=20abo=
ve=20carries=20my=20Rb=20tag,=20then=20note=20that=0D=0A>=20Samsung's=20rev=
enue=20is=20around=20220=20billion=20USD,=20so=20for=20sure=20it=20has=20a=
=20lot,=0D=0A>=20really=20a=20lot=20of=20resources=20to=20review=20patches=
=20internally=20and=20improve=20their=0D=0A>=20quality=20before=20posting).=
=0D=0A>=20=0D=0A>=20Best=20regards,=0D=0A>=20Krzysztof=0D=0A=0D=0AThank=20y=
ou.=0D=0A=0D=0ARegards,=0D=0APritam=0D=0A=0D=0A

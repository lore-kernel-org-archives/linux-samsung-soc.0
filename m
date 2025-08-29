Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8E2D0C8E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756468711; cv=none; b=K7JbOhPxYO31rDe+mHT1oK4XXEbCU1BzrFvHM9K6bUcefnLH4CLx7MLfJtFaKQ4ly6JFBZJhJ/Mm5adp4jGfJbsui1+1CEFcriHjrHHoilJFBpCW8Pi+2uBaEcl8PffB/CCv9KDppPOodM5Zmora79SwyO7UGnGArQOCYRQwvpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756468711; c=relaxed/simple;
	bh=Rw5SIZaECKmBfdJ5CiNQHvr4hnQuJd5QmrWW0G/k3ys=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fvRjMDtjT+P948TjZvvNrlrBhZtDOzmzvI+jlL3tBi7JK5P3XkNlaqpcL9+9Kph9yOWCYNoquuBdB87dAS1xygSRv3oX2FbL6PPFdVZJMYsVWaQnOxu0TbzWf+6Xm5JQHCV2od80GfC62WHKup3SoUAnR/0ACmtdpwai3K5dKfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CysoOR9P; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CysoOR9P"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250829115827epoutp04336b427451634036641ce2a41a08e430~gOvvIXhWV1085910859epoutp045
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:58:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250829115827epoutp04336b427451634036641ce2a41a08e430~gOvvIXhWV1085910859epoutp045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756468707;
	bh=uwY5hixuwzaZTDT5buByhfxmW867fLKpSCP8rlpiI14=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CysoOR9PC9hnqe3pml403GQnA2oc/kH9yTcRYWraVwncS6r0Ua7oKrZX8fYTY8UiF
	 wkmMBTtTPFS8p8p/SBihey+pSFosShUCntvBWl+YoSz6EKKZoIOEa6n7z321Lfvwa1
	 +ys3ZAmEG4PVEJOSTVSBzmqJSKzG06tJCI9Fb7tQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250829115827epcas5p1f685d8dfedaaf5048eb61a23746eb119~gOvueZGSr1701717017epcas5p1U;
	Fri, 29 Aug 2025 11:58:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cCxcL15L7z3hhT4; Fri, 29 Aug
	2025 11:58:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250829115825epcas5p308b9c24446175f4cd3107cd25d87d005~gOvtI56rB0210702107epcas5p3A;
	Fri, 29 Aug 2025 11:58:25 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829115822epsmtip19020d35d0d51e22cc1325735aeef32e0~gOvqKeOfY1508415084epsmtip1L;
	Fri, 29 Aug 2025 11:58:22 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Pritam Manohar Sutar'"
	<pritam.sutar@samsung.com>
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
Date: Fri, 29 Aug 2025 17:28:21 +0530
Message-ID: <264501dc18dc$39afb340$ad0f19c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSd8blfqR9gZc/NH28iGAFaSn12QHbdVSHAGa/K48CXY/t+wLwFCB2ArX7ZGwBn6FItwLUPA9DAP+/dGQCDX8RFrR+i4pg
Content-Language: en-us
X-CMS-MailID: 20250829115825epcas5p308b9c24446175f4cd3107cd25d87d005
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

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, August 29, 2025 4:56 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Pritam Manohar Sutar'
> <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; andre.draszik=40linaro.org;
>=20
=5BSnip=5D
> >>>>>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar
> wrote:
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
616449f4=0D=0A>=20e4c9a7b475e5d0d9b2440ee48f91d1364eabd6cb=0D=0A>=20=0D=0AT=
hanks=20for=20suggestion=20as=20always,=20I=20hope=20the=20author=20can=20f=
ollow=20this.=20=0D=0A=0D=0A>=20and=20here=20another=20anti-pattern:=0D=0A>=
=2023f793850e9ee7390584c0809f085d6c88de7d3f=0D=0A>=20=0D=0A>=20(and=20befor=
e=20you=20ask=20why=20above=20carries=20my=20Rb=20tag,=20then=20note=20that=
=0D=0AI=20will=20not=20ask=20:-)=0D=0A>=20Samsung's=20revenue=20is=20around=
=20220=20billion=20USD,=20so=20for=20sure=20it=20has=20a=20lot,=0D=0A>=20re=
ally=20a=20lot=20of=20resources=20to=20review=20patches=20internally=20and=
=20improve=20their=0D=0A>=20quality=20before=20posting).=0D=0A>=20=0D=0AHmm=
...,=20however=20let=20me=20check=20internally.=0D=0A=0D=0A>=20Best=20regar=
ds,=0D=0A>=20Krzysztof=0D=0A=0D=0A

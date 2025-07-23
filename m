Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772D1AAA1B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 05:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247546; cv=none; b=Q01eG0gGeCTJcJb20goHqYrlR91oBmoLg4Z78UlH7hba4Ir7DHGJUkO2gK+goBzmYn7mNFUOBsfjD+S5n5QWwtpANA8T63Q2A1KWBMYH3o2KbJqI9fkaxg7rPQFW4SxWU2yJ34ENSO8cbeVQ39tune7IVvJgk9J/K7v8zMZXPHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247546; c=relaxed/simple;
	bh=qDeUmMD82P8ZgrNOK+/tNlnWhFbGWqwTS61keOxqtUA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jScraEHGDCKnAoU6hVed5h/7x9uyKZyE1qMeGr/VyuyqY2a58HUNp5fH3w9zmPWXk4GnksMMa1gT3j5nAsZWJiQcv8wEZaks9U6bK1WN83R9m/nLIS0KGZQkzeVusdVcdHpOIHHR5/OeLVkBU91Xz2L4M9mWZl1X2TgqT+T5ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YzpXVGae; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YzpXVGae"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250723051215epoutp020719b91de96864863a52b72a87a46f09~UyVhHtcrM0387103871epoutp02h
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 05:12:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250723051215epoutp020719b91de96864863a52b72a87a46f09~UyVhHtcrM0387103871epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753247535;
	bh=IoOtrbeFHn5e1/Xtu2aEuqosP9/5TZJzgfaIJ8FAwVw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YzpXVGaeKBdahD4O1K7MxAae0WhiCSSMJ/4EqEiCWru/oOvUNtko+rgHcnJNA03hr
	 94UXec9t3f7jWjVE0bpi72c6E5bY6BEY8VYztjvTqTpZcCapc4O83DDy5T6wWkvpdf
	 tgcTdTJpoSP4byk6Y9GIFVEj0AvOSnPbA40pBn3k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250723051215epcas5p212e2b5380f798498c5c80f442874a239~UyVgY52qc2028920289epcas5p2l;
	Wed, 23 Jul 2025 05:12:15 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bn2Lj5rTmz6B9m4; Wed, 23 Jul
	2025 05:12:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250723051134epcas5p13eb4eedb2beb180423c5237f4a272f06~UyU66C8CP1233212332epcas5p1N;
	Wed, 23 Jul 2025 05:11:34 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250723051131epsmtip2df639fe0e527bf88b1c968e311ad775e~UyU3yq7j60675706757epsmtip2K;
	Wed, 23 Jul 2025 05:11:31 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@linaro.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <9a97cc9e-2221-44d6-83e9-25b1bec10a6f@kernel.org>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Wed, 23 Jul 2025 10:41:30 +0530
Message-ID: <000901dbfb90$42873060$c7959120$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAqwCML2yKAWUlSf8CRPacEQIi1iyNAmb2xVkCD/Nw+7Lxui8Q
Content-Language: en-in
X-CMS-MailID: 20250723051134epcas5p13eb4eedb2beb180423c5237f4a272f06
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>
	<20250701120706.2219355-2-pritam.sutar@samsung.com>
	<20250706-fresh-meaty-cougar-5af170@krzk-bin>
	<07d301dbf0ae$0658cbe0$130a63a0$@samsung.com>
	<9a2d0ad7-cb1f-473d-a91a-3a1b59b71280@kernel.org>
	<000c01dbf70b$ccdbf630$6693e290$@samsung.com>
	<a43cfe4f-8ff9-4dbd-b7f4-07ccc3d8e01b@kernel.org>
	<00ff01dbfac1$ee528860$caf79920$@samsung.com>
	<9a97cc9e-2221-44d6-83e9-25b1bec10a6f@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 22 July 2025 11:37 AM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; 'Krzysztof Kozlows=
ki'
> <krzysztof.kozlowski=40linaro.org>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; neil.armstrong=40=
linaro.org;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> m.szyprowski=40samsung.com; s.nawrocki=40samsung.com; linux-
> phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
> On 22/07/2025 06:34, Pritam Manohar Sutar wrote:
> >>>> Nothing is explained in changelog/cover letter. You claim you only
> >>>> added Rb
> >> tag.
> >>>> This is an entirely silent change while keeping the review.
> >>>
> >>> Will add more explanations in cover letter/changelog why this block i=
s
> added.
> >>>
> >>>> Combined with not even following DTS style=21
> >>>
> >>> Ok got it. Will change supplies name as below avdd075_usb =3D>
> >>> avdd075-usb
> >>> avdd18_usb20 =3D> avdd18-usb20
> >>> avdd33_usb20 =3D> avdd33-usb20
> >>>
> >>> Confirm the above change that is meant in terms of DTS style.
> >> Yes. I have doubts that actual supplies have suffix usb20. Are there
> >> more than one avdd18 for this block?
> >>
> >
> > Yes, there are more than one vdd18 supplies for this block.
>=20
> And their names are?
>=20
> >
> > Re-analysed your comment on adding new supplies.
> > Going to re-use existing supplies as mentioned below, rather than
> > introducing new supplies
> >
> >   dvdd-usb20-supply   =3D> for 0.75v
> >   vddh-usb20-supply   =3D> for 1.8v
> >   vdd33-usb20-supply =3D> for 3.3v
>=20
>=20
> You just expect us to guess whether this is correct...

Sorry about not being clear so far.=20

V920 needs three supplies, 0.75v, 1.8v and 3.3v for USB PHY
The naming convention used in the schematic are
avdd075-usb,=20
avdd18_usb20,=20
avdd33_usb20.

However, PHY's user manual just mentions DVDD, VDD33 and VDD18.
Since GS101 binding already using supply names similar to what is mentioned=
 in the PHY user manual.
I thought of using the same instead of earlier naming conventions (which wa=
s as per v920 schematic).

Let me know if this make sense or we should be just using as per schematic?

>=20
> Best regards,
> Krzysztof

Regards,
Pritam



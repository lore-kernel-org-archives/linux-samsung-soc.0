Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5044257453
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350974; cv=none; b=g10S5mILHUMklI01skaq4pEAul21pbznYjGOrhBvS1H6HA1ZZVL8QGvkY7PkICdtVpXBgTFGrg5OPQaxlVHUr6EzlwF39iKbW4/XmcXtzb73PEiZa0zt8NNHOdF3/9xbdSWNkF7FixCNItBt5rv/vDEl4la8gru6oucbu6XfMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350974; c=relaxed/simple;
	bh=xgv/6RY0aXaXcqVmGsKiJ7rv1l72xkz7t+/1yhSFO+4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=iSvFUFMvd6xZf2ElEcOGeugG+AmLdLyRxYGEJ4JpIQhIV2WZnx/zYVDHRm5haUaWG/cHRmoH4NawWVN31T/i/OpGckezEE8Zqt87YlpWTczaLCiKfIwq7symnjkQ5HMgOaovtTX0TqcEceSHuv13Tb8RVf9tOm1bDybE9mSKQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tXkLFpum; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tXkLFpum"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250724095610epoutp0459d437f44c872cc2833facfcb52dc2c4~VJ2sKrD8k1813318133epoutp04Z
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 09:56:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250724095610epoutp0459d437f44c872cc2833facfcb52dc2c4~VJ2sKrD8k1813318133epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753350970;
	bh=u9kGzbP2QPnTerojC0M6PdIstHffL6YDLYBkr55PnyQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=tXkLFpum7mpat6+Q/fQl/+zWboM7qSTARv5MQ60rP2NgdQh2zREwk5x/OgwCJm5al
	 W+xnSoXjkNWYQYILSlCmiVs99fZHCMVTnvRJm0+q8WftqcM/JbEifzuPxwUWhUKSfK
	 zTMAgiRRiw42zoNAp9+92fd9twRtNQrgHaxIWP/U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250724095609epcas5p1f59c0b9b75b092d4b53af00a59df9b79~VJ2rY0ILh1609716097epcas5p1e;
	Thu, 24 Jul 2025 09:56:09 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bnmbr5q6pz6B9mJ; Thu, 24 Jul
	2025 09:56:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724095412epcas5p36b38fe9e1b835e731abdbcaf64be1174~VJ0_IgfWj0680206802epcas5p30;
	Thu, 24 Jul 2025 09:54:12 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724095409epsmtip2c71016c48766841f9a06c5d7f2a181f8~VJ069jbaJ1922819228epsmtip2E;
	Thu, 24 Jul 2025 09:54:08 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andre.draszik@linaro.org>,
	<peter.griffin@linaro.org>, <neil.armstrong@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <2a1901dbfbcf$a21b45e0$e651d1a0$@samsung.com>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 24 Jul 2025 15:24:07 +0530
Message-ID: <000001dbfc80$e85fd690$b91f83b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAqwCML2yKAWUlSf8CRPacEQIi1iyNAmb2xVkCD/Nw+wC0VRd5AgU5TrgBzoneLbLPVtqQ
Content-Language: en-in
X-CMS-MailID: 20250724095412epcas5p36b38fe9e1b835e731abdbcaf64be1174
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
	<000901dbfb90$42873060$c7959120$@samsung.com>
	<6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef@kernel.org>
	<2a1901dbfbcf$a21b45e0$e651d1a0$@samsung.com>

Hi,=20

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: 23 July 2025 06:15 PM
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Pritam Manohar Sutar'
> <pritam.sutar=40samsung.com>; 'Krzysztof Kozlowski'
> <krzysztof.kozlowski=40linaro.org>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; andre.draszik=40linaro.org;
> peter.griffin=40linaro.org; neil.armstrong=40linaro.org; kauschluss=40dis=
root.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: RE: =5BPATCH v4 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 HS phy compatible
>=20
>=20
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: Wednesday, July 23, 2025 2:13 PM
> > To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; 'Krzysztof
> > Kozlowski' <krzysztof.kozlowski=40linaro.org>
> > Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> =5Bsnip=5D
> > >>>>> Ok got it. Will change supplies name as below avdd075_usb =3D>
> > >>>>> avdd075-usb
> > >>>>> avdd18_usb20 =3D> avdd18-usb20
> > >>>>> avdd33_usb20 =3D> avdd33-usb20
> > >>>>>
> > >>>>> Confirm the above change that is meant in terms of DTS style.
> > >>>> Yes. I have doubts that actual supplies have suffix usb20. Are
> > >>>> there more than one avdd18 for this block?
> > >>>>
> > >>>
> > >>> Yes, there are more than one vdd18 supplies for this block.
> > >>
> > >> And their names are?
> > >>
> > >>>
> > >>> Re-analysed your comment on adding new supplies.
> > >>> Going to re-use existing supplies as mentioned below, rather than
> > >>> introducing new supplies
> > >>>
> > >>>   dvdd-usb20-supply   =3D> for 0.75v
> > >>>   vddh-usb20-supply   =3D> for 1.8v
> > >>>   vdd33-usb20-supply =3D> for 3.3v
> > >>
> > >>
> > >> You just expect us to guess whether this is correct...
> > >
> > > Sorry about not being clear so far.
> > >
> > > V920 needs three supplies, 0.75v, 1.8v and 3.3v for USB PHY The
> > > naming convention used in the schematic are avdd075-usb,
> > > avdd18_usb20, avdd33_usb20.
> > >
> > > However, PHY's user manual just mentions DVDD, VDD33 and VDD18.
> >
> >
> > Then dvdd, vdd33 and vdd18.
> >
> > > Since GS101 binding already using supply names similar to what is
> > mentioned in the PHY user manual.
> >
> >
> > GS101 has USB 2.0 and DP, thus the suffix made some sense. I think you
> > have only USB 2.0, that's why I question the suffix.
> >
> I cross checked the schematic of v920 SADK, this is a combo PHY which
> support USB-3.0 as well.
> =40 Pritam
> Schema should capture all the supplies including USB-3.0, similar to GS10=
1
> (which has USB2.0 and DP combo).
> So that would be as below:
> dvdd075-usb20-supply
> vdd18-usb20-supply
> vdd33-usb20-supply
> dvdd075-usb30-supply
> vdd18-usb30-supply
> please cross check the supply at your end and do the needful.
>=20

Yes, we have a combo PHY that supports USB20 and USB30 and=20
need these supplies. Will update the binding accordingly.

> >
> > Best regards,
> > Krzysztof

Thank you.

Regards,
Pritam


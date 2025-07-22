Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF461EDA14
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jul 2025 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753160027; cv=none; b=ibRa9HSc9K49kh4Njk1LUfcVGeE4HBhIqrG21h/uj2ZiPpoWvoycA+N6DJO+DjJ+zR7lJqEdOwkKV1uB+MI/E/bVoAmnRXbhOWC00mCNJlC/OTC6sYeblHXad8jm4f9lL4edxNv6CGuW6gfEfEOIePqUPMWDBGCdZmRA50rUQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753160027; c=relaxed/simple;
	bh=IV3D5VFa0b3TKylL0rBqO2E0kmhVFDoKkyFGukLBZQA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZnnvxNH8FI0eoYQfzepTiIdQ6Rg40luSdozmLF5jQXB6Rpi4O/geIw32UNNnXoms0Ibx0USVNm5Wo4zp3gcn5THuZKcEdD/wPMTYMxwbINRqMC4ljL9V1tcE6Oxosz4QY2psTtA8+anv44iD10WnW3pzntMkCGOKstODvSKdzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NxFDVGLu; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NxFDVGLu"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250722045338epoutp01442306fb0854acf442c6b2e929e400a4~Ueb9sNBzP2577125771epoutp01k
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jul 2025 04:53:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250722045338epoutp01442306fb0854acf442c6b2e929e400a4~Ueb9sNBzP2577125771epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753160018;
	bh=oHgbp2zI6pWHBoFSpFNJfPfed8jnhU/boVEitqs7EpY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NxFDVGLuy5TCLBbqOezmS6BcX2oGoWTGLVzO/HvO5sijcUQuELxZe91KozSOqb7lW
	 dnop2oWOj6lSW3WwvIn0EIgeO+2ohHctBLzl7IwrLOni8Mn3MgJTJX8R9GEzRmIPJX
	 +JvEsDbnEDWIR6za8sfQ6EpQ5zNvnrshPsG26dfA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250722045336epcas5p40ecb63ff167b91f84375d516fef00fa5~Ueb8vawWq0587105871epcas5p4T;
	Tue, 22 Jul 2025 04:53:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bmPzg6htyz2SSKk; Tue, 22 Jul
	2025 04:53:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250722043437epcas5p25e73a61921d2d15cae61388fa042de75~UeLXT5Vxm3047830478epcas5p2G;
	Tue, 22 Jul 2025 04:34:37 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250722043434epsmtip131fb92dc6a6a0c2b894d89da91b3a9ab~UeLUTk9r90921009210epsmtip18;
	Tue, 22 Jul 2025 04:34:33 +0000 (GMT)
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
In-Reply-To: <a43cfe4f-8ff9-4dbd-b7f4-07ccc3d8e01b@kernel.org>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Tue, 22 Jul 2025 10:04:32 +0530
Message-ID: <00ff01dbfac1$ee528860$caf79920$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAqwCML2yKAWUlSf8CRPacEQIi1iyNsxPSqvA=
Content-Language: en-in
X-CMS-MailID: 20250722043437epcas5p25e73a61921d2d15cae61388fa042de75
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

Hi Krzysztof,=20

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 17 July 2025 04:59 PM
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
> On 17/07/2025 13:13, Pritam Manohar Sutar wrote:
> >>
> >>
> >> Nothing is explained in changelog/cover letter. You claim you only add=
ed Rb
> tag.
> >> This is an entirely silent change while keeping the review.
> >
> > Will add more explanations in cover letter/changelog why this block is =
added.
> >
> >> Combined with not even following DTS style=21
> >
> > Ok got it. Will change supplies name as below avdd075_usb =3D>
> > avdd075-usb
> > avdd18_usb20 =3D> avdd18-usb20
> > avdd33_usb20 =3D> avdd33-usb20
> >
> > Confirm the above change that is meant in terms of DTS style.
> Yes. I have doubts that actual supplies have suffix usb20. Are there more=
 than
> one avdd18 for this block?
>=20

Yes, there are more than one vdd18 supplies for this block.=20

Re-analysed your comment on adding new supplies.=20
Going to re-use existing supplies as mentioned below, rather than=20
introducing new supplies

  dvdd-usb20-supply   =3D> for 0.75v
  vddh-usb20-supply   =3D> for 1.8v
  vdd33-usb20-supply =3D> for 3.3v

> Best regards,
> Krzysztof


Thank you.

Regards,
Pritam


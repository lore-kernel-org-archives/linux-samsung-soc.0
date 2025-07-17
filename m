Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351428D8F8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751185; cv=none; b=NYPnsQxl8oVajJzJewXT8hMz2PRfjAxi1VyZHS2yU7sO3hbYNbmfwdpncOeitslIFolMFbS7E2eUQ7Iaq0M6d2Dtqb6b0wdSdKzbD1lmd+Hi/mjMJkRtCFVV4mN9OiCAiLHKSsULM/x57MkePK00YTVklSIhoq0hvij92Duu3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751185; c=relaxed/simple;
	bh=2mG73X/HfLPy0ld4Tq4HuaNIMMwvGJBaveva1FfghYc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=gqmTPYSR7lwoKmR7dMJgfq0buqk2gCJqKAVBVyOynjowKmHSW0i5YCbnyEfOX/idw4/5JuE2/HBZ8LLkDPPckjhoSbPMYlZiq/kF8L3s+mNq7Z+L48EQTFT1jw6zyKk8/p1gMT0C3BPrUiP6I4nS8jtrfEbhiNq1CLcIks6RI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=m0WSaaEn; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="m0WSaaEn"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250717111935epoutp03749e50e01333104e20eff5180c2155dd~TBeh2DtZw0144701447epoutp036
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 11:19:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250717111935epoutp03749e50e01333104e20eff5180c2155dd~TBeh2DtZw0144701447epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752751175;
	bh=iVJvMorr9e4gO7pUnO5sm7M1f1+TEwB413ip1IEG1+U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=m0WSaaEnrPcYoyHXonwaCJPC5O1DJXYPSMbaJ1NNTjFy5dHNcw2/kZUPptSoj/9x4
	 ZL2aSxPpbzSkvWGplDV4gi0v8Xx4UiB+aDQsc+2k0gwbjxNLq/Dx7GW0cNGwsAo7fw
	 JdZBZ/EA1wJsiHudXmwUfCc0Z5x3OaL+YmIBHIa8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250717111934epcas5p2c6c599d499f95a22472d5c1d136da103~TBeg8yiOm1560515605epcas5p21;
	Thu, 17 Jul 2025 11:19:34 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bjVnL0D8mz6B9m4; Thu, 17 Jul
	2025 11:19:34 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250717111319epcas5p2966882346d4b080ee66304c282244b04~TBZDCzSPL2396823968epcas5p2f;
	Thu, 17 Jul 2025 11:13:19 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250717111316epsmtip2442ee3e177e39afa1ddecb88214d4136~TBZAAUg0_2779927799epsmtip2O;
	Thu, 17 Jul 2025 11:13:15 +0000 (GMT)
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
In-Reply-To: <9a2d0ad7-cb1f-473d-a91a-3a1b59b71280@kernel.org>
Subject: RE: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 17 Jul 2025 16:43:14 +0530
Message-ID: <000c01dbf70b$ccdbf630$6693e290$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AKCX9A9Aa5wAf0Bi5UAqwCML2yKAWUlSf+zL6XGYA==
X-CMS-MailID: 20250717111319epcas5p2966882346d4b080ee66304c282244b04
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

Hi Krzysztof,=20

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 12 July 2025 01:44 PM
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
> On 09/07/2025 10:46, Pritam Manohar Sutar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> >> Sent: 06 July 2025 03:11 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com=
;
> >> andre.draszik=40linaro.org; peter.griffin=40linaro.org;
> >> neil.armstrong=40linaro.org; kauschluss=40disroot.org;
> >> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> >> s.nawrocki=40samsung.com; linux- phy=40lists.infradead.org;
> >> devicetree=40vger.kernel.org; linux- kernel=40vger.kernel.org;
> >> linux-arm-kernel=40lists.infradead.org; linux-samsung-
> >> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.c=
om;
> >> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> >> selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v4 1/6=5D dt-bindings: phy: samsung,usb3-drd-phy=
:
> >> add
> >> ExynosAutov920 HS phy compatible
> >>
> >> On Tue, Jul 01, 2025 at 05:37:01PM +0530, Pritam Manohar Sutar wrote:
> >>> Add a dedicated compatible string for USB HS phy found in this SoC.
> >>> The SoC requires two clocks, named =22phy=22 and =22ref=22 (same as c=
locks
> >>> required by Exynos850).
> >>>
> >>> It also requires various power supplies (regulators) for the
> >>> internal circuitry to work. The required voltages are:
> >>> * avdd075_usb - 0.75v
> >>> * avdd18_usb20 - 1.8v
> >>> * avdd33_usb20 - 3.3v
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> >>
> >> No, really. Look:
> >>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>> ---
> >>>  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C 37 +++++++++++++++=
++++
> >>>  1 file changed, 37 insertions(+)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> >>> b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> >>> index e906403208c0..2e29ff749bba 100644
> >>> ---
> >>> a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> >>> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yam
> >>> +++ l
> >>> =40=40 -34,6 +34,7 =40=40 properties:
> >>>        - samsung,exynos7870-usbdrd-phy
> >>>        - samsung,exynos850-usbdrd-phy
> >>>        - samsung,exynos990-usbdrd-phy
> >>> +      - samsung,exynosautov920-usbdrd-phy
> >>>
> >>>    clocks:
> >>>      minItems: 1
> >>> =40=40 -110,6 +111,15 =40=40 properties:
> >>>    vddh-usbdp-supply:
> >>>      description: VDDh power supply for the USB DP phy.
> >>>
> >>> +  avdd075_usb-supply:
> >>> +    description: 0.75V power supply for USB phy
> >>> +
> >>> +  avdd18_usb20-supply:
> >>> +    description: 1.8V power supply for USB phy
> >>> +
> >>> +  avdd33_usb20-supply:
> >>> +    description: 3.3V power supply for USB phy
> >>> +
> >>
> >> None of these were here. Follow DTS coding style... but why are you
> >> adding completely new supplies?
> >
> > Digital supplies were here. Need Analog supplies for exynosautov920,
> > hence added new Analog supplies; 'a'vdd075_usb, 'a'vdd18_usb20,
> > 'a'vdd33_usb20
> >
> > Will add =22full stops=22 for DTS coding style in description.
>=20
> You cannot grow one line change into 50 line change and retain the review=
.

Yes agreed. Will remove =22Reviewed-by=22 tag and requesting you to review =
the=20
patches again and provide your valuable comments.

> >
> >>
> >>
> >>>  required:
> >>>    - compatible
> >>>    - clocks
> >>> =40=40 -235,6 +245,33 =40=40 allOf:
> >>>
> >>>          reg-names:
> >>>            maxItems: 1
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - samsung,exynosautov920-usbdrd-phy
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 2
> >>> +          maxItems: 2
> >>> +
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: phy
> >>> +            - const: ref
> >>> +
> >>> +        reg:
> >>> +          maxItems: 1
> >>> +
> >>> +        reg-names:
> >>> +          maxItems: 1
> >>> +
> >>> +      required:
> >>> +        - avdd075_usb-supply
> >>> +        - avdd18_usb20-supply
> >>> +        - avdd33_usb20-supply
> >>
> >> Neither was this entire diff hunk here.
> >>
> >> This was part of other block for a reason.
> >
> > Added regulators in driver. This block is added for regulators (other
> > block does not have =22required=22 field for power supplies) if exclude=
d
> > this block, =22make ARCH=3Darm64 dtbs_check
> > DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/phy/samsung,usb3-
> drd
> > -phy.yaml=22 will fail as mentioned below
>=20
>=20
> Nothing is explained in changelog/cover letter. You claim you only added =
Rb tag.
> This is an entirely silent change while keeping the review.

Will add more explanations in cover letter/changelog why this block is adde=
d.

> Combined with not even following DTS style=21

Ok got it. Will change supplies name as below=20
avdd075_usb =3D> avdd075-usb
avdd18_usb20 =3D> avdd18-usb20
avdd33_usb20 =3D> avdd33-usb20
  =20
Confirm the above change that is meant in terms of DTS style.

>=20
> It's not acceptable.
>=20
> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


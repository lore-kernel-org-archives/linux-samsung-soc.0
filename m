Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B72165EA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896233; cv=none; b=YSFF/jG+rYI4lZe5UO4w3COGAsdXDfS45Vn2LvXLBbSPx+17bC3yYZyn6zytLCJrLPAdGKi6Knc/coyk5AuxlyDF9qZWIJjTnfW6z++3xMvbdimwsJddQpaA1OXz9XXe0RI+GTE+HGjtcmTyzzIzlG7IHZFKbTHZ3qq1UHeUv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896233; c=relaxed/simple;
	bh=UIWlMalD2LgHkJ59uXzwu/tm+r9jHs3n0X6yijRz5fE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=aL6P+GsLEpMCQ79lB5YAQxwnDSKNx2jG9GEzUlnhHlhX8H1vKQHRSFcz1Y5Txedg9SNU4C+4FXv9UVSwvbCxfOoa3ZrJZX4np0073sLK+12Jw4M9UZEkac3qg/u+5mfPOvVDKmY2DQn8oV7Ne/k6TN+iZiK7zbClh8gHVNrc2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EQO5Kkqy; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EQO5Kkqy"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260212113708epoutp0283a28893d275790a948752cbe9c2cd3e~TfLzE5vBB2979929799epoutp028
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:37:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260212113708epoutp0283a28893d275790a948752cbe9c2cd3e~TfLzE5vBB2979929799epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896228;
	bh=djFzeD8LgE5itnBYvoAAw4RnPf8xoFG4d8cZIp1ltuA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EQO5KkqyDTG0iDVC7UzCYPH7wZR1ogKzG1don1kPFerRDc3rDPJ5PugF1XVz44Jxz
	 i+UiAhGhUX7BGKMQNz8E5Ck2zarcXjGz38vmTXaW5BHSE+J8FpHmkEBV4suXT9Uzlg
	 98UQye1NIK+t4nC1Vne/2ar5PlHz2bBja/F069AY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260212113708epcas5p2a4182422726a0cdd595ef6730815be6a~TfLyoyOP-0161601616epcas5p2y;
	Thu, 12 Feb 2026 11:37:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4fBYDg1rCpz6B9m8; Thu, 12 Feb
	2026 11:37:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260212113706epcas5p384de9f5dc94f1019c072e2f712567e72~TfLxV9sIV0390603906epcas5p32;
	Thu, 12 Feb 2026 11:37:06 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212113704epsmtip18dbc65302f659bcb336dc1852594d539~TfLvi2Kby1286912869epsmtip1h;
	Thu, 12 Feb 2026 11:37:04 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <352427f4-144a-4a43-a2f3-dd959302939f@kernel.org>
Subject: RE: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add
 regulators for the USB
Date: Thu, 12 Feb 2026 17:07:02 +0530
Message-ID: <000001dc9c13$ea305520$be90ff60$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwI+5auhAd1pMcUC7yIEuLbKEyLw
Content-Language: en-us
X-CMS-MailID: 20260212113706epcas5p384de9f5dc94f1019c072e2f712567e72
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125134epcas5p36625b7ac70b8dfba9430831a11955682
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125134epcas5p36625b7ac70b8dfba9430831a11955682@epcas5p3.samsung.com>
	<20260122130721.205664-3-pritam.sutar@samsung.com>
	<352427f4-144a-4a43-a2f3-dd959302939f@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, January 22, 2026 7:04 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 2/3=5D arm64: dts: exynos: ExynosAutov920: Add
> regulators for the USB
>=20
> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> > Add dummy regulator for USB and PHY supplies.
> >
> > Add vbus regulator that is enabled by GPIO pin.
> >
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 139
> ++++++++++++++++++
> >  1 file changed, 139 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > index a397f068ed53..f90f7704597c 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> > =40=40 -52,6 +52,76 =40=40 memory=4080000000 =7B
> >  		      <0x8 0x80000000 0x1 0xfba00000>,
> >  		      <0xa 0x00000000 0x2 0x00000000>;
> >  	=7D;
> > +
> > +	/* TODO: Remove this once PMIC is implemented  */
> > +	dummy_regulator: regulator-0 =7B
> > +		 compatible =3D =22regulator-fixed=22;
> > +		 regulator-name =3D =22dummy_regulator=22;
> > +	=7D;
> > +
> > +	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
>=20
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-=5B0-9=5Dv=5B0-9=5D'
>=20
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/
> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>=20
> None of the regulators are called like you wrote. Really NONE.
>=20

Thank you for the references. Will bring changes for regulator's name=20
and labels as=20
		=09
-       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
+       reg_usbdrd31_dwc3_vbus: regulator-1 =7B

> Also, carefully follow DTS coding style.
>=20

Sorry for that. Checking the code and will update in next=20
patchset version (v3).

> > +	       compatible =3D =22regulator-fixed=22;
> > +	       regulator-name =3D =22usbdrd31_dwc3-vbus=22;
> > +	       regulator-min-microvolt =3D <5000000>;
> > +	       regulator-max-microvolt =3D <5000000>;
> > +	       enable-active-high;
> > +	       regulator-always-on;
> > +	       gpio =3D <&gpp2 0 GPIO_ACTIVE_HIGH>;
> > +	=7D;
> > +
> > +	/* Use gpio for enabling vbus regulator */
> > +	usb_phy0: usb-phy0 =7B
>=20
> usb-phy-0
>=20
> > +		compatible =3D =22usb-nop-xceiv=22;
> > +		vbus-supply =3D <&usbdrd31_dwc3_vbus>;
>=20
> That's pretty incomplete. Why do you need such node - just to toggle
> regulator?
>=20

There is no external controller to detect or switch the USB modes=20
automatically rather it is switched using userspace control=20
(sysfs attributes) for this SoC.  GPIO pins are required to enable=20
vbus regulators. Existing phy-generic and fixed regulator are used to=20
avoid making any USB driver changes for the same purpose and it is=20
referenced from below -
			=09
https://lore.kernel.org/r/20230825215445.28309-3-semen.protsenko=40linaro.o=
rg
a12af1c20751340ab6e449a5ef78b37d31123aca: ARM64: dts: marvell: armada-3720-=
db: Add phy for USB3
	=09
> > +	=7D;
>=20
> ...
>=20
> > +&usbdrd20_phy2 =7B
> > +	dvdd-supply =3D <&dummy_regulator>;
> > +	vdd18-supply =3D <&dummy_regulator>;
> > +	vdd33-supply =3D <&dummy_regulator>;
> > +=7D;
> > +
> > +&usbdrd20_dwc3_2 =7B
> > +	maximum-speed =3D =22high-speed=22;
> > +	usb-phy =3D <&usb_phy3>;
> > +=7D;
> > +
> > +&usbdrd20_2 =7B
> > +	vdd10-supply =3D <&dummy_regulator>;
> > +	vdd33-supply =3D <&dummy_regulator>;
> > +=7D;
>=20
> That's a bit too much of dummies. This is heavily incomplete. You need to
> bring back the PMIC first.
>=20

Presently, relying on USB LDOs being enabled by the bootloader in this
automotive SoC. However, we understand the concern and it is added in case=
=20
if anyone wants to use implemented PMIC in future. For now, would like=20
to proceed with the dummy regulators to enable the required USB features.=
=20
Dummy regulators are clearly marked so that they will be replaced once=20
the PMIC driver is fully up.

>=20
> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam



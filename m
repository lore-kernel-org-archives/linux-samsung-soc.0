Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA62FA0DF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771406928; cv=none; b=dZcll7gfgM2efpTIY9f4JC0DBswoV+PhQkzMWdpfco+M4C0Z/j4L92tVVjrJ8FJBRXwvdzgFjvzf+ahDK2uIk0ojYTg2U/9F6Ih0IAWV+SApi1QTvVFCBMZAc2L2vznLafQzoqTEpuBW1H2fSNWBo+Ch5rlEOJKSM1Hjnqy+A5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771406928; c=relaxed/simple;
	bh=hjgDR+M62i3dLJJ3R+9MFvTcATxJrvJQve1Wk5thDsI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Eoop8bT+T5EPLfVdEu4/VSLDnR1+IeMEKqd4mQUYLQVy7FVe9jtcwxcn8gEtil5OvnIbd6HI8TVNAFgE9YsqCHNhZmE3dGrjup8HprUJBzkm9JZiQAlmtclk9t561K2W7sPBSKt0JRUG01cMICO2Kbb0i2HE5sU4VaoXm8dulr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D90tF9GN; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D90tF9GN"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260218092842epoutp013c8fb37e5bcfaa415a8bb059b7c6d4ab~VTTXtIfCQ2081820818epoutp01g
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Feb 2026 09:28:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260218092842epoutp013c8fb37e5bcfaa415a8bb059b7c6d4ab~VTTXtIfCQ2081820818epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1771406922;
	bh=4e3tv1xNKbYMfR4tMSvH4s7rnaxHOgZeeoPQiSoUN0M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=D90tF9GNDWl5e5prLf2vxxB1ScK/jOBQvdhfCp9mHbJ0+MRJ65NqG9srgh2rdBuUg
	 5Z7DHIAg5N4bmn2ZwMP9zGNJLn9ZlkRHoTgngp1pjkQFWpASLJXVDR99IBWSbFcxZw
	 kIBo72YUbKaNOMmMyAczVEDYooKZYfmi/HhSFu0E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260218092841epcas5p22642078f78df8fd20e61ec3d7c41bf79~VTTW8I5zp0869308693epcas5p2c;
	Wed, 18 Feb 2026 09:28:41 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4fGB5h4bSdz6B9m5; Wed, 18 Feb
	2026 09:28:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260218092839epcas5p114565db47fc89a2a06f4b1fbfc8f2bb7~VTTVKpjoh3202332023epcas5p1r;
	Wed, 18 Feb 2026 09:28:39 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260218092837epsmtip256210e6c41614d4b1be8376b87ab5716~VTTTWhBSz0044900449epsmtip2B;
	Wed, 18 Feb 2026 09:28:37 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <2edff611-76bb-45aa-922e-f96581dd0525@kernel.org>
Subject: RE: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add
 regulators for the USB
Date: Wed, 18 Feb 2026 14:58:36 +0530
Message-ID: <019001dca0b8$f709e640$e51db2c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEa27yOGkcSyej7W4JCG0x5iKXFKwI+5auhAd1pMcUC7yIEuAId+/jbAjLLeay2sNbGsA==
X-CMS-MailID: 20260218092839epcas5p114565db47fc89a2a06f4b1fbfc8f2bb7
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
	<000001dc9c13$ea305520$be90ff60$@samsung.com>
	<2edff611-76bb-45aa-922e-f96581dd0525@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Sunday, February 15, 2026 2:27 PM
> To: pritam.sutar=40samsung.com; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v2 2/3=5D arm64: dts: exynos: ExynosAutov920: Add
> regulators for the USB
>=20
> On 12/02/2026 12:37, pritam.sutar=40samsung.com wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Thursday, January 22, 2026 7:04 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>;
> robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com
> >> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.o=
rg;
> >> linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com;
> >> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com
> >> Subject: Re: =5BPATCH v2 2/3=5D arm64: dts: exynos: ExynosAutov920: Ad=
d
> >> regulators for the USB
> >>
> >> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
> >>> Add dummy regulator for USB and PHY supplies.
> >>>
> >>> Add vbus regulator that is enabled by GPIO pin.
> >>>
> >>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >>> ---
> >>>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 139
> >> ++++++++++++++++++
> >>>  1 file changed, 139 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> index a397f068ed53..f90f7704597c 100644
> >>> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> >>> =40=40 -52,6 +52,76 =40=40 memory=4080000000 =7B
> >>>  		      <0x8 0x80000000 0x1 0xfba00000>,
> >>>  		      <0xa 0x00000000 0x2 0x00000000>;
> >>>  	=7D;
> >>> +
> >>> +	/* TODO: Remove this once PMIC is implemented  */
> >>> +	dummy_regulator: regulator-0 =7B
> >>> +		 compatible =3D =22regulator-fixed=22;
> >>> +		 regulator-name =3D =22dummy_regulator=22;
> >>> +	=7D;
> >>> +
> >>> +	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
> >>
> >> Please use name for all fixed regulators which matches current format
> >> recommendation: 'regulator-=5B0-9=5Dv=5B0-9=5D'
> >>
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi
> >> t/tree/
> >> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> >>
> >> None of the regulators are called like you wrote. Really NONE.
> >>
> >
> > Thank you for the references. Will bring changes for regulator's name
> > and labels as
> >
> > -       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
> > +       reg_usbdrd31_dwc3_vbus: regulator-1 =7B
>=20
> Did you read the binding? That's not what I asked.
>=20

Yes.=20
Sorry for misinterpreting above comment. Is it expected as below?

This is based on our understanding by referring binding and other vendor dt=
s.

--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
=40=40 -59,7 +59,7 =40=40 dummy_regulator: regulator-0 =7B
                 regulator-name =3D =22dummy_regulator=22;
        =7D;

-       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus =7B
+       reg_usb_vbus0: regulator-5v0-vbus0 =7B
               compatible =3D =22regulator-fixed=22;
               regulator-name =3D =22usbdrd31_dwc3-vbus=22;
               regulator-min-microvolt =3D <5000000>;
=40=40 -75,7 +75,7 =40=40 usb_phy0: usb-phy0 =7B
                vbus-supply =3D <&usbdrd31_dwc3_vbus>;
        =7D;

-       usbdrd20_dwc3_0_vbus: usbdrd20_dwc3_0-vbus =7B
+       reg_usb_vbus1: regulator-5v0-vbus1 =7B
               compatible =3D =22regulator-fixed=22;
               regulator-name =3D =22usbdrd20_dwc3_0-vbus=22;
               regulator-min-microvolt =3D <5000000>;
=40=40 -91,7 +91,7 =40=40 usb_phy1: usb-phy1 =7B
                vbus-supply =3D <&usbdrd20_dwc3_0_vbus>;
        =7D;

-       usbdrd20_dwc3_1_vbus: usbdrd20_dwc3_1-vbus =7B
+       reg_usb_vbus2: regulator-5v0-vbus2 =7B
               compatible =3D =22regulator-fixed=22;
               regulator-name =3D =22usbdrd20_dwc3_1-vbus=22;
               regulator-min-microvolt =3D <5000000>;
=40=40 -107,7 +107,7 =40=40 usb_phy2: usb-phy2 =7B
                vbus-supply =3D <&usbdrd20_dwc3_1_vbus>;
        =7D;

-       usbdrd20_dwc3_2_vbus: usbdrd20_dwc3_2-vbus =7B
+       reg_usb_vbus3: regulator-5v0-vbus3 =7B
               compatible =3D =22regulator-fixed=22;
               regulator-name =3D =22usbdrd20_dwc3_2-vbus=22;
               regulator-min-microvolt =3D <5000000>;

>=20
> >
> >> Also, carefully follow DTS coding style.
> >>
> >
> > Sorry for that. Checking the code and will update in next patchset
> > version (v3).
> >
> >>> +	       compatible =3D =22regulator-fixed=22;
> >>> +	       regulator-name =3D =22usbdrd31_dwc3-vbus=22;
> >>> +	       regulator-min-microvolt =3D <5000000>;
> >>> +	       regulator-max-microvolt =3D <5000000>;
> >>> +	       enable-active-high;
> >>> +	       regulator-always-on;
> >>> +	       gpio =3D <&gpp2 0 GPIO_ACTIVE_HIGH>;
> >>> +	=7D;
> >>> +
> >>> +	/* Use gpio for enabling vbus regulator */
> >>> +	usb_phy0: usb-phy0 =7B
> >>
> >> usb-phy-0
> >>
> >>> +		compatible =3D =22usb-nop-xceiv=22;
> >>> +		vbus-supply =3D <&usbdrd31_dwc3_vbus>;
> >>
> >> That's pretty incomplete. Why do you need such node - just to toggle
> >> regulator?
> >>
> >
> > There is no external controller to detect or switch the USB modes
> > automatically rather it is switched using userspace control (sysfs
> > attributes) for this SoC.  GPIO pins are required to enable vbus
> > regulators. Existing phy-generic and fixed regulator are used to avoid
> > making any USB driver changes for the same purpose and it is
> > referenced from below -
> >
> > https://lore.kernel.org/r/20230825215445.28309-3-semen.protsenko=40lina=
r
> > o.org
> > a12af1c20751340ab6e449a5ef78b37d31123aca: ARM64: dts: marvell:
> > armada-3720-db: Add phy for USB3
> >
> >>> +	=7D;
> >>
> >> ...
> >>
> >>> +&usbdrd20_phy2 =7B
> >>> +	dvdd-supply =3D <&dummy_regulator>;
> >>> +	vdd18-supply =3D <&dummy_regulator>;
> >>> +	vdd33-supply =3D <&dummy_regulator>; =7D;
> >>> +
> >>> +&usbdrd20_dwc3_2 =7B
> >>> +	maximum-speed =3D =22high-speed=22;
> >>> +	usb-phy =3D <&usb_phy3>;
> >>> +=7D;
> >>> +
> >>> +&usbdrd20_2 =7B
> >>> +	vdd10-supply =3D <&dummy_regulator>;
> >>> +	vdd33-supply =3D <&dummy_regulator>; =7D;
> >>
> >> That's a bit too much of dummies. This is heavily incomplete. You
> >> need to bring back the PMIC first.
> >>
> >
> > Presently, relying on USB LDOs being enabled by the bootloader in this
> > automotive SoC. However, we understand the concern and it is added in
> > case if anyone wants to use implemented PMIC in future. For now, would
> > like to proceed with the dummy regulators to enable the required USB
> features.
>=20
> And I don't see the point of these dummies. Solves nothing.
>=20

Are you expecting details as mentioned in above section in commit message?=
=20
However, we have mentioned these details in cover letter.

if not, please provide more details on this comment.

> > Dummy regulators are clearly marked so that they will be replaced once
> > the PMIC driver is fully up.
> >
>=20
>=20
> Best regards,
> Krzysztof

Thank you,

Regards,
Pritam


Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41331219EB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209554; cv=none; b=XNyGmIqYcOCsNvCeI8/zcNibFvEnGqoPc8EtO7tBQudfD1Lheg+YUWt5V92lpnYeHJR4Te2LCO2unModM+lfQmtbZL+CVx4SFYEtQXfmx/y8RooguL6K4J0x8u4oDTRQq2n6YZAGgfImh2FD+xLwneQE0mK51hVsSn1HFtd5ZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209554; c=relaxed/simple;
	bh=PqAoghHFSkgifxKIV4gNJmQ8uM4VRvMCLv6T6/PM/tw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=h2NJ+2XlV+1XCvYVPQ+FYlsQHVyhL5G/oXTKLrg1I3LTDPxD65DD7xFes0CWhTB456PU8xAk23APCRIMLjKEMjXpY1DxUuUz5KgM3vfzeaq3QTU2znUjpos7pcESuXQ+rlBtPrcW3fqOvdTxtNQphehvvywOGo3Fs8OJiyvQwos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=W6CnCsQj; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W6CnCsQj"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250618011910epoutp02a6048c32f5e3c6407250a876013bf88f~J-lA8F8xr2514725147epoutp02Q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:19:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250618011910epoutp02a6048c32f5e3c6407250a876013bf88f~J-lA8F8xr2514725147epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209550;
	bh=8pDTKiVf0buqczhEZ05rUoTG7seQHrvr+Tt4AEphfAU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=W6CnCsQjh+k3SSDqsW3U6bVQNnppzWnO7QTSZRX0dKvmF2jNU1uRwZsK7kCJBZ1fD
	 AOUTRGUNIYBNLriIbPDhrpwoa4eJnHeNMgO3/OZLHOs9xjH2HqEwj2Ri/HpF9+IABv
	 V8xnk0UvgZ0i+ZP1CP8cbZbMruyulQ7Nnodu3OQ0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250618011910epcas5p340dc4aefb689e96c521b981c9d4a88cb~J-lAZDyK62482624826epcas5p3n;
	Wed, 18 Jun 2025 01:19:10 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.177]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQqw24vrz3hhT8; Wed, 18 Jun
	2025 01:19:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250617182036epcas5p2f066a3a92613a5b405a941f4d30ca628~J53jVqP-N2257822578epcas5p2x;
	Tue, 17 Jun 2025 18:20:36 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617182033epsmtip1fed76ec4f1dea149e9e1d5049707a388~J53gpoMyO2363023630epsmtip1T;
	Tue, 17 Jun 2025 18:20:33 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Rob Herring \(Arm\)'" <robh@kernel.org>
Cc: <rosa.pila@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <conor+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <andre.draszik@linaro.org>,
	<linux-phy@lists.infradead.org>, <vkoul@kernel.org>, <krzk+dt@kernel.org>,
	<faraz.ata@samsung.com>, <selvarasu.g@samsung.com>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<dev.tailor@samsung.com>, <devicetree@vger.kernel.org>, <kishon@kernel.org>,
	<peter.griffin@linaro.org>, <muhammed.ali@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <alim.akhtar@samsung.com>,
	<m.szyprowski@samsung.com>
In-Reply-To: <175011004935.2433563.8726528182523156685.robh@kernel.org>
Subject: RE: [PATCH v3 0/9] initial usbdrd phy support for Exynosautov920
 soc
Date: Tue, 17 Jun 2025 23:50:32 +0530
Message-ID: <000701dbdfb4$854ffa00$8fefee00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK+oFDZ6MKL1K4Z//TlQcphB9UedANTkACKAizhql6yFiSisA==
Content-Language: en-in
X-CMS-MailID: 20250617182036epcas5p2f066a3a92613a5b405a941f4d30ca628
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee
References: <CGME20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee@epcas5p1.samsung.com>
	<20250613055613.866909-1-pritam.sutar@samsung.com>
	<175011004935.2433563.8726528182523156685.robh@kernel.org>

Hi Rob,=20

> -----Original Message-----
> From: Rob Herring (Arm) <robh=40kernel.org>
> Sent: 17 June 2025 03:17 AM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: rosa.pila=40samsung.com; s.nawrocki=40samsung.com; linux-samsung-
> soc=40vger.kernel.org; conor+dt=40kernel.org; linux-kernel=40vger.kernel.=
org;
> andre.draszik=40linaro.org; linux-phy=40lists.infradead.org; vkoul=40kern=
el.org;
> krzk+dt=40kernel.org; faraz.ata=40samsung.com; selvarasu.g=40samsung.com;
> kauschluss=40disroot.org; ivo.ivanov.ivanov1=40gmail.com;
> dev.tailor=40samsung.com; devicetree=40vger.kernel.org; kishon=40kernel.o=
rg;
> peter.griffin=40linaro.org; muhammed.ali=40samsung.com; linux-arm-
> kernel=40lists.infradead.org; alim.akhtar=40samsung.com;
> m.szyprowski=40samsung.com
> Subject: Re: =5BPATCH v3 0/9=5D initial usbdrd phy support for Exynosauto=
v920
> soc
>=20
>=20
> On Fri, 13 Jun 2025 11:26:04 +0530, Pritam Manohar Sutar wrote:
> > This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only DRD
> > phy controllers
> >
> >   - Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> >     compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
> >     to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data
> >     rates. These two phys are combined to form a combo phy as mentioned
> >     below.
> >
> >    USB30DRD_0 port
> >
> >      +-----------------------------------------------------+
> >      =7C                                                     =7C
> >      =7C           (combo) USB PHY controller                =7C
> >      =7C     +-----------------------------------------+     =7C
> >      =7C     =7C               USB HSPHY                 =7C     =7C
> >      =7C     =7C  (samsung,exynosautov920-usbdrd-hsphy)  =7C     =7C
> >      =7C     +-----------------------------------------+     =7C
> >      =7C                                                     =7C
> >      =7C   +---------------------------------------------+   =7C
> >      =7C   =7C               USB SSPHY                     =7C   =7C
> >      =7C   =7C   (samsung,exynosautov920-usb31drd-ssphy)   =7C   =7C
> >      =7C   +---------------------------------------------+   =7C
> >      =7C                                                     =7C
> >      +-----------------------------------------------------+
> >      =7C                                                     =7C
> >      =7C                USBDRD30 Link                        =7C
> >      =7C                  Controller                         =7C
> >      =7C                                                     =7C
> >      +-----------------------------------------------------+
> >
> >   - USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
> >     is very similar to the existing Exynos850 support in this driver.
> >
> >     USB20DRD_0/1/2 ports
> >
> >
> >       +---------------------------------------------------+
> >       =7C                                                   =7C
> >       =7C                USB PHY controller                 =7C
> >       =7C    +-----------------------------------------+    =7C
> >       =7C    =7C              USB HSPHY                  =7C    =7C
> >       =7C    =7C  (samsung,exynosautov920-usbdrd-phy)    =7C    =7C
> >       =7C    +-----------------------------------------+    =7C
> >       =7C                                                   =7C
> >       +---------------------------------------------------+
> >       =7C                                                   =7C
> >       =7C             USBDRD20_* Link                       =7C
> >       =7C                Controller                         =7C
> >       =7C                                                   =7C
> >       +---------------------------------------------------+
> >
> > This patchset only supports device mode and same is verified with as
> > NCM device with below configfs commands
> >
> > changelog
> > ----------
> > Changes in v2:
> > - Used standard GENMASK() and FIELD_GET() to get the major version
> >   from controller version register.
> >   link for v1:
> > https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar
> > =40samsung.com/
> >
> > Changes in v3:
> > - Updated dt-bindings for USB2.0 only.
> > - Added dt-bindings for combo phy.
> > - Added implementation for combo phy (SS and HS phy).
> > - Added added DTS nodes for all the phys.
> >   link for v2:
> > https://lore.kernel.org/linux-phy/20250516102650.2144487-1-pritam.suta
> > r=40samsung.com/
> >
> > Pritam Manohar Sutar (9):
> >   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
> >     compatible
> >   phy: exyons5-usbdrd: support HS phy for ExynosAutov920
> >   arm64: dts: exynos: ExynosAutov920: add USB and USB-phy nodes
> >   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo HS
> >     phy
> >   phy: exyons5-usbdrd: support HS combo phy for ExynosAutov920
> >   arm64: dts: exynos: ExynosAutov920: add USB and USB HS combo phy
> nodes
> >   dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo SS
> >     phy
> >   phy: exyons5-usbdrd: support SS combo phy for ExynosAutov920
> >   arm64: dts: exynos: ExynosAutov920: add USB and USB SS combo phy
> > nodes
> >
> >  .../bindings/phy/samsung,usb3-drd-phy.yaml    =7C   6 +
> >  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C  53 ++
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 155 +++++
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c      =7C 529
> ++++++++++++++++++
> >  4 files changed, 743 insertions(+)
> >
> > --
> > 2.34.1
> >
> >
> >
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform maintai=
ner
> whether these warnings are acceptable or not. No need to reply unless the
> platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then make sur=
e dt-
> schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/v6.16-rc1-6-g8a22d9e79cf0 (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag (or use b4 =
which
> does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for
> arch/arm64/boot/dts/exynos/' for 20250613055613.866909-1-
> pritam.sutar=40samsung.com:
>=20
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb=4016600000
> (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3Da398ebb0-
> c213fe83-a39960ff-000babff9bb7-8d9cc7c90d9462da&q=3D1&e=3D59f25a9c-244f-
> 45e8-a7cb-
> 211aa2722987&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fsa
> msung%2Cexynos-dwc3.yaml%23
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb=4016700000
> (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3Dc803d102-
> a988c431-c8025a4d-000babff9bb7-2f005fe0951204df&q=3D1&e=3D59f25a9c-244f-
> 45e8-a7cb-
> 211aa2722987&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fsa
> msung%2Cexynos-dwc3.yaml%23
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb=4016800000
> (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3D1f0616ff-
> 7e8d03cc-1f079db0-000babff9bb7-3473467f8f5ba11c&q=3D1&e=3D59f25a9c-244f-
> 45e8-a7cb-
> 211aa2722987&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fsa
> msung%2Cexynos-dwc3.yaml%23
> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb=4016900000
> (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3D989abcf3-
> f911a9c0-989b37bc-000babff9bb7-7f2e26e2d23d90b1&q=3D1&e=3D59f25a9c-
> 244f-45e8-a7cb-
> 211aa2722987&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fsa
> msung%2Cexynos-dwc3.yaml%23
>=20
>=20
>=20
>=20
LDO regulators are always on. USB don=E2=80=99t=20control=20them=20for=20Ex=
ynosAutov920.=20Hence=20vdd33-supply=20is=20omitted=20from=20dts.=20=0D=0A=
=0D=0AWill=20try=20to=20add=20dummy=20regulator=20to=20add=20required=20fie=
ld=20and=20patch=20will=20be=20updated=20in=20next=20version=20of=20the=20p=
atch-set=20(v4)=0D=0A=0D=0AThank=20you,=20=0D=0A=0D=0ARegards,=0D=0APritam=
=0D=0A=0D=0A

Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648312EFD8F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896933; cv=none; b=VgGhe6iwAoU16XehoYQjsf1GPx7An0My5BTIe97ducIlVPZv2d1zk/K613LF+2DLprlPGxft55Pvuo8t7DCvbR+9hKq8dyuZHbpljfQX1MEY5xr95XABvl12cZUFgcUZgcqSu4h3HtaQ7IOlRfdiI7XQjoL8zYTxFev8hCL7wmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896933; c=relaxed/simple;
	bh=Y7oS27WsfhSOay2q5h6kGU3w05SjPN5GatFYPC0+cAA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=bKNIT/YKAXHnSf0xGG14Q95ZOuYimaKtphHDrL+kZsu6LssF33zACkfCfiUMcG8FSK2GKkr9W/S+3Xg6jFyoP6Uv6RSLDXpBwQDhctmLTNiBY4H7VErdd6IEwVLWtPSZEqcNKTeQFWmkMFi7CUmQ0Di3j2W2+CEnqaRl7p1Uka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hYfkVxIQ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hYfkVxIQ"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260212114849epoutp047fa1fb12dd675c17aa4d9ece4fcbbad6~TfV-d9cI92041020410epoutp04M
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:48:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260212114849epoutp047fa1fb12dd675c17aa4d9ece4fcbbad6~TfV-d9cI92041020410epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770896929;
	bh=jyl3AxqX9Tq3PeJ2Lu8gJJZ6ed5Wpcv+H3JcsKlDbVE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=hYfkVxIQmXL2QQiVcqLJtJ2rONwjk3zJ7m/RhRc30INOUxBU+8tichWF9mssSUAWk
	 Hr58eINTPN+9Fuk78ncccfG6oFoQCnKboyav46vlRoAxDHK1pLCE0/KqRVIrO7vb0/
	 eC5ZvNpD8kBLIpHL2x/9n/U1/LRLC6WpDCAaNB4Y=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260212114848epcas5p3ae68f5890f0cba77251bdda61750f3db~TfV_oyQL61067810678epcas5p3P;
	Thu, 12 Feb 2026 11:48:48 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4fBYV72FpTz6B9m6; Thu, 12 Feb
	2026 11:48:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212114846epcas5p16d130a5688ae2732ff5b38e0b856bc3b~TfV9KNMUP2225822258epcas5p17;
	Thu, 12 Feb 2026 11:48:46 +0000 (GMT)
Received: from INBRO007194 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260212114844epsmtip18d7db7a4756a8505234fe3cea1ecae8d~TfV7XeT9R1842418424epsmtip1J;
	Thu, 12 Feb 2026 11:48:44 +0000 (GMT)
From: <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Rob Herring'"
	<robh@kernel.org>
Cc: <alim.akhtar@samsung.com>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <rosa.pila@samsung.com>,
	<selvarasu.g@samsung.com>, <linux-samsung-soc@vger.kernel.org>,
	<muhammed.ali@samsung.com>, <faraz.ata@samsung.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dev.tailor@samsung.com>
In-Reply-To: <6ac69d62-6b14-4010-9c66-764b7dc2e610@kernel.org>
Subject: RE: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Thu, 12 Feb 2026 17:18:43 +0530
Message-ID: <000301dc9c15$8b5bfca0$a213f5e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHZrJ6Mjzaw1gIwj373G9ghj88fmQEa27yOAk8cNCcDW2nXuwFvkMg7tUMp5zA=
Content-Language: en-us
X-CMS-MailID: 20260212114846epcas5p16d130a5688ae2732ff5b38e0b856bc3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
	<20260122130721.205664-1-pritam.sutar@samsung.com>
	<176910209177.2703219.7993114273484886473.robh@kernel.org>
	<000001dc8c30$d83ce2e0$88b6a8a0$@samsung.com>
	<6ac69d62-6b14-4010-9c66-764b7dc2e610@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, January 23, 2026 1:02 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; 'Rob Herring'
> <robh=40kernel.org>
> Cc: alim.akhtar=40samsung.com; conor+dt=40kernel.org; krzk+dt=40kernel.or=
g;
> linux-arm-kernel=40lists.infradead.org; rosa.pila=40samsung.com;
> selvarasu.g=40samsung.com; linux-samsung-soc=40vger.kernel.org;
> muhammed.ali=40samsung.com; faraz.ata=40samsung.com; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org;
> dev.tailor=40samsung.com
> Subject: Re: =5BPATCH v2 0/3=5D Add and enable USB nodes for ExynosAutov9=
20
> SoC
>=20
> On 23/01/2026 07:23, Pritam Manohar Sutar wrote:
> > Hi Rob,
> >
> > Thank you for your feedback on the patch series.
> >
> >> -----Original Message-----
> >> From: Rob Herring <robh=40kernel.org>
> >> Sent: 22 January 2026 10:46 PM
> >> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> >> Cc: alim.akhtar=40samsung.com; conor+dt=40kernel.org;
> krzk+dt=40kernel.org;
> >> linux-arm-kernel=40lists.infradead.org; rosa.pila=40samsung.com;
> >> selvarasu.g=40samsung.com; linux-samsung-soc=40vger.kernel.org;
> >> muhammed.ali=40samsung.com; faraz.ata=40samsung.com; linux-
> >> kernel=40vger.kernel.org; devicetree=40vger.kernel.org;
> >> dev.tailor=40samsung.com
> >> Subject: Re: =5BPATCH v2 0/3=5D Add and enable USB nodes for
> >> ExynosAutov920 SoC
> >>
> >>
> >> On Thu, 22 Jan 2026 18:37:18 +0530, Pritam Manohar Sutar wrote:
> >>> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
> >>> controllers and among them, one single USB3.1 DRD combo phy and
> >>> three
> >>> USB2.0 only phy controllers. This patchset adds and enables USB and
> >>> USB-PHY nodes in dts.
> >>>
> >>> PMIC is not implemented yet, we rely on USB LDOs being enabled by
> >>> the bootloader and used dummy regulators for now.
> >>>
> >>> To drive vbus for host mode, it needs GPIO pin to enable vbus regulat=
or.
> >>> GPIO expander is present in the dts, we used it to enable the
> >>> regulator using GPIO.
> >>>
> >>> USB ports are configured as OTG, and default mode is configured as
> >>> peripheral. It will be changed based on requirements.
> >>>
> >>> changelog
> >>> ----------
> >>> Changes in v2:
> >>> - As v1 was pushed 3 months back, resending this patchset.
> >>> - Since dependencies are merged, removed links from coverletter.
> >>>   link for v1:
> >>> https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-pr
> >>> it
> >>> am.sutar=40samsung.com/
> >>>
> >>> Pritam Manohar Sutar (3):
> >>>   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
> >>>   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
> >>>   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
> >>>
> >>>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 160
> >> +++++++++++++++++
> >>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 162
> >>> ++++++++++++++++++
> >>>  2 files changed, 322 insertions(+)
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>>
> >>
> >>
> >> My bot found new DTB warnings on the .dts files added or changed in
> >> this series.
> >>
> >> Some warnings may be from an existing SoC .dtsi. Or perhaps the
> >> warnings are fixed by another series. Ultimately, it is up to the
> >> platform maintainer whether these warnings are acceptable or not. No
> >> need to reply unless the platform maintainer has comments.
> >>
> >> If you already ran DT checks and didn't see these error(s), then make
> >> sure dt- schema is up to date:
> >>
> >>   pip3 install dtschema --upgrade
> >>
> >>
> >> This patch series was applied (using b4) to base:
> >>  Base: attempting to guess base-commit...
> >>  Base: tags/next-20260121 (exact match)
> >>  Base: tags/next-20260121 (use --merge-base to override)
> >>
> >> If this is not the correct base, please add 'base-commit' tag (or use
> >> b4 which does this automatically)
> >>
> >>
> >> New warnings running 'make CHECK_DTBS=3Dy for
> >> arch/arm64/boot/dts/exynos/' for 20260122130721.205664-1-
> >> pritam.sutar=40samsung.com:
> >>
> >> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy0 (usb-
> >> nop-xceiv): '=23phy-cells' is a required property
> >> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3D91401ba9-
> >> cedb2354-914190e6-000babff317b-0af64cc1fcd35e1a&q=3D1&e=3De0bf9bed-
> >> 20f5-431c-9a8f-
> >>
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> >> sb-nop-xceiv.yaml
> >> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy1 (usb-
> >> nop-xceiv): '=23phy-cells' is a required property
> >> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3Db208eda5-
> >> ed93d558-b20966ea-000babff317b-f6650041a1e910a7&q=3D1&e=3De0bf9bed-
> >> 20f5-431c-9a8f-
> >>
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> >> sb-nop-xceiv.yaml
> >> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy2 (usb-
> >> nop-xceiv): '=23phy-cells' is a required property
> >> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3Dce686cfd-
> >> 91f35400-ce69e7b2-000babff317b-ccbf1b3c353ecfc0&q=3D1&e=3De0bf9bed-
> 20f5-
> >> 431c-9a8f-
> >>
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> >> sb-nop-xceiv.yaml
> >> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy3 (usb-
> >> nop-xceiv): '=23phy-cells' is a required property
> >> 	from schema =24id: https://protect2.fireeye.com/v1/url?k=3D633aebf3-
> >> 3ca1d30e-633b60bc-000babff317b-ef5a169bc853eddb&q=3D1&e=3De0bf9bed-
> >> 20f5-431c-9a8f-
> >>
> ded53e46a366&u=3Dhttp%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
> >> sb-nop-xceiv.yaml
> >
> > Apologize for any inconvenience caused by the issues you=E2=80=99ve=20i=
dentified.=0D=0A>=20=0D=0A>=20It=20means=20you=20did=20not=20test=20the=20p=
atches=20before=20sending=20and=20I=20find=20it=20very=0D=0A>=20wasteful=20=
of=20my=20time.=0D=0A>=20=0D=0A>=20>=20Below,=20Have=20outlined=20the=20cha=
nges,=20will=20implement=20to=20address=20the=0D=0A>=20>=20warnings=20and=
=20ensure=20the=20patch=20set=20aligns=20with=20the=20required=20standards.=
=0D=0A>=20>=0D=0A>=20>=20Proposed=20Changes:=0D=0A>=20>=201.=20Will=20inclu=
de=20=23phy-cells=20=3D=20<0>;=20in=20the=20USB=20PHY=20nodes=0D=0A>=20>=20=
=20=20(usb_phy0,=20usb_phy1,=20usb_phy2,=20and=20usb_phy3)=20This=20is=20a=
=20crucial=0D=0A>=20>=20addition=20to=20avoid=20compilation=20warnings=20an=
d=20ensure=20compatibility.=0D=0A>=20>=0D=0A>=20>=20Example:=0D=0A>=20>=20u=
sb_phy0:=20usb-phy0=20=7B=0D=0A>=20>=20=20=20=20=20compatible=20=3D=20=22us=
b-nop-xceiv=22;=0D=0A>=20>=20=20=20=20=20=23phy-cells=20=3D=20<0>;=0D=0A>=
=20>=20=20=20=20=20vbus-supply=20=3D=20<&usbdrd31_dwc3_vbus>;=0D=0A>=20>=20=
=7D;=0D=0A>=20>=0D=0A>=20>=202.=20The=20errors=20were=20not=20caught=20by=
=20the=20make=20dt_binding_check=20and=20make=0D=0A>=20dtbs_check=0D=0A>=20=
>=20=20=20commands=0D=0A>=20>=20=20=20make=20-j=20ARCH=3Darm64=20dt_binding=
_check=20dtbs_check=0D=0A>=20DT_SCHEMA_FILES=3DDocumentation/devicetree/bin=
dings/phy/samsung,usb3=0D=0A>=20-drd-phy.yaml=0D=0A>=20>=20=20=20make=20-j=
=20ARCH=3Darm64=20dt_binding_check=20dtbs_check=0D=0A>=20>=0D=0A>=20DT_SCHE=
MA_FILES=3DDocumentation/devicetree/bindings/usb/samsung,exyn=0D=0A>=20os-d=
=0D=0A>=20>=20wc3.yaml=0D=0A>=20=0D=0A>=20This=20is=20not=20the=20command=
=20you=20are=20supposed=20to=20run=21=20You=20MUST=20CHECK=20YOUR=0D=0A>=20=
DTS=20WITH=20ALL=20THE=20BINDINGS.=20Why=20would=20you=20run=20only=20two=
=20of=20them=20and=0D=0A>=20ignore=20the=20rest=20which=20you=20still=20use=
?=20What=20is=20the=20logic=20behind=20-=20I=20will=20use=20phy-=0D=0A>=20n=
op=20binding,=20but=20not=20test=20against=20it?=0D=0A>=20=0D=0A>=20A=20hin=
t=20-=20if=20your=20patches=20are=20not=20being=20picked=20up,=20maybe=20be=
cause=20you=20send=0D=0A>=20buggy=20code=20and=20I=20am=20bored=20to=20repl=
y=20-=20test=20finally,=20because=20I=20am=20not=20your=0D=0A>=20testing=20=
service.=0D=0A=0D=0ASorry=20for=20the=20inconvenience.=20will=20take=20care=
=20of=20this=20in=20future=20to=20consider=20=0D=0Aall=20bindings=20rather=
=20than=20taking=20what=20are=20updated=20for=20this=20SoC.=0D=0A=0D=0A>=20=
=0D=0A>=20Best=20regards,=0D=0A>=20Krzysztof=0D=0A=0D=0AThank=20you,=0D=0A=
=0D=0ARegards,=0D=0APritam=0D=0A=0D=0A

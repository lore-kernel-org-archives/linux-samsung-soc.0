Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D22F34
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720577742; cv=none; b=AU0zNaBRE+JhASRyv5G8IPKgB1jHdLBEsJDpvSlbLU1RcU5YrbMK4SbB+jcWr38aMDvphWsa32UGoAxHfEZbeh+x6H2UM/ZK7uWMKvTQrSm441JDONEwXr9fSCibFz7xyvmhgRsiu5U7TnrV4+hWazn0gTxHOk148qdf3KdB2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720577742; c=relaxed/simple;
	bh=h8b9+Tj92DfBgtmanBoKa1YeBA6Pzu5hBUrRQST9BKY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=CT9GZ7Cf3AuscQl0oZBGsgHm0EboH0AZt6hpdJtQ/HWZf5BtdSb7CkB0ymyrypIFn83U+n+K6uBCp2l6i5Si+2NxEHfZ/C0Ft9rWltjj1fxJm93XrrBbJCcG9PdnLeKySjkmAO3HSTkFxXuEjXtnDgS3qbXBOCfeVEFGMBvI6JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ljV3ospP; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ljV3ospP"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240710021538epoutp03d4c5b5a6534e1a7a35be09f26ea6bc8c~guFZb58W32132221322epoutp03C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:15:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240710021538epoutp03d4c5b5a6534e1a7a35be09f26ea6bc8c~guFZb58W32132221322epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720577738;
	bh=cBRmJIsn036aFZZenxotLNlPUsS0tp85kuL40ZIxwN8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ljV3ospPskGanlY0YjDLzbOi8K9cf8A82HRCvXpQyJE32+kBnf3QI0AbaQWRGSoJg
	 48Y8vRkKyWU2aDQB0tHysQ2pUiuWUnPluGxXHiqwZRkP8FXdWhbwSAHOeJwieMDf53
	 uCX3e43TuDPz+Prg/KUVdi+JQkLqL15Z6dgquA6Q=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240710021537epcas2p41c3bb04f3b107bdae2c82442b74d60c8~guFYs2W_91143711437epcas2p4F;
	Wed, 10 Jul 2024 02:15:37 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WJhKP22j5z4x9Pr; Wed, 10 Jul
	2024 02:15:37 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.31.09485.9CEED866; Wed, 10 Jul 2024 11:15:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240710021536epcas2p4034ffab9cfc5630412661ed7dd6692e3~guFXeKl8n1143711437epcas2p49;
	Wed, 10 Jul 2024 02:15:36 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240710021536epsmtrp2e5493fb1a438739570c823b9e7fd3125~guFXdC3mD0262402624epsmtrp2t;
	Wed, 10 Jul 2024 02:15:36 +0000 (GMT)
X-AuditID: b6c32a46-19bfa7000000250d-b4-668deec9efeb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	76.29.19057.8CEED866; Wed, 10 Jul 2024 11:15:36 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710021536epsmtip150333663603057cda5264b1360e56923~guFXMHAOS1725317253epsmtip1J;
	Wed, 10 Jul 2024 02:15:36 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <000101dad126$b964e2d0$2c2ea870$@samsung.com>
Subject: RE: [PATCH v2 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in Exynos Auto v920
Date: Wed, 10 Jul 2024 11:15:36 +0900
Message-ID: <000101dad26f$0d0fc0f0$272f42d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQIAh4UhAdGvMNoB/Od1kLDm+Vkw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmqe7Jd71pBqemcls8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Izpl1vZS2YblRx4t8slgbGZt0uRk4O
	CQETicev77J0MXJxCAnsYJT4M+ExO4TziVHi1Op3UM43RomG05sY4VoWNUEl9jJKTGxfzwbh
	vGSU6Nnxjhmkik1AX2J1922whIjAHSaJ2+sesoI4zALrGCU2zzzCDlLFKWAl8frBO7C5wgKJ
	Ep+fTGACsVkEVCWuf3rMBmLzClhKtPzpZ4awBSVOznzCAmIzC2hLLFv4mhniJgWJn0+XsYLY
	IgJuEo/OzWGDqBGRmN3ZxgyyWELgCIfE7e5mFogGF4mjS85D2cISr45vYYewpSQ+v9vLBmHn
	S0y+/pYJormBUeLav26obfYSi878BGrgANqgKbF+lz6IKSGgLHHkFtRtfBIdh/+yQ4R5JTra
	hCAa1SQ+XbkMNURG4tiJZ8wTGJVmIflsFpLPZiH5YBbCrgWMLKsYxVILinPTU4uNCozg8Z2c
	n7uJEZyAtdx2ME55+0HvECMTB+MhRgkOZiUR3vk3utOEeFMSK6tSi/Lji0pzUosPMZoCw3oi
	s5Rocj4wB+SVxBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cC0LVrm
	wO7+eYtmbroQtuu7z4fbjjPsTE6eNjvvvyRyioPLmz3652dzd/Px8Ca8rljYJ9/zo6417lyv
	bdo0c6eHXxnvs3inS9UHulc0MdsWHlr87j7jFXszFY+vMYo3AlW/PDobfX/32S0e2jnrtylu
	195Z/OkEj8vDl2LihxaWXU0rFI2b9Um4n9G5btqMt6nP4tZuCJqovkXH7cAi3QfWWXs6DZnD
	yu9Gn5NmOJWS98J71/Hcg/d19HSOC641PVsQw5i/bNv0Kq7ZXwP6a4+r6fw0+rgnZbaYOu9z
	H4uz0fLX+GeHxuiL3f93mEds5Zpe+7ANNxrjdzzbG/QkvYuvIkSs+9r6zzyTVx3S7EhXYinO
	SDTUYi4qTgQAC/kpeEkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSnO6Jd71pBlNvS1o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBnXZzSxFUzQ
	qFi46Q5bA+M7+S5GTg4JAROJx4ua2LsYuTiEBHYzShw5d4MFIiEjsbHhPzuELSxxv+UIK0TR
	c0aJTzs/MIIk2AT0JVZ332YDSYgIPGKS+PxzF9goZoFNjBLndt9kg2j5zCjROO04K0gLp4CV
	xOsH78DahQXiJd4+escMYrMIqEpc//SYDcTmFbCUaPnTzwxhC0qcnPkE7CZmAW2JpzefwtnL
	Fr5mhrhPQeLn02Vg80UE3CQenZvDBlEjIjG7s415AqPwLCSjZiEZNQvJqFlIWhYwsqxilEwt
	KM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiORi2tHYx7Vn3QO8TIxMF4iFGCg1lJhHf+je40
	Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpgkJ2ScDa/e
	lsPjNzHUbL5w4OVJVfM2B4iz3FKM2aNnxf00bW3GISXu5YwxtufvZfz22OX2SGCF+cWvGVu8
	nVl/96876Ve1LGOluWC7cy7DwparT/S3dl35NZ1F48/qxlrp8Bc8R+bJHPVZ3n9U/ML57JK3
	psJN4unu9936OtcYnVk96Vlr4lTD6WddSsJn+79K/vhKtWxx4q2VS9bcFZ4TkdlxQfO93Lk1
	2t8ll/+uS+BJWym6qLjp3VOlfV1ca++uvcfgb60mc/dq6Ya4f0rvHuf8WGNil8/JvXj27mmK
	Do94lYrdGFcd7fBNfsg+e++70PdPPl7hOOa6xilpoXTEthsONke2luXs54m/GPdGiaU4I9FQ
	i7moOBEALJrHpDUDAAA=
X-CMS-MailID: 20240710021536epcas2p4034ffab9cfc5630412661ed7dd6692e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216@epcas2p2.samsung.com>
	<20240707231331.3433340-3-sunyeal.hong@samsung.com>
	<000101dad126$b964e2d0$2c2ea870$@samsung.com>

Hello Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: Monday, July 8, 2024 8:05 PM
> To: 'Sunyeal Hong' <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Ch=
anwoo
> Choi' <cw00.choi=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob
> Herring' <robh=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: RE: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clock
> nodes in Exynos Auto v920
>=20
>=20
>=20
> > -----Original Message-----
> > From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > Sent: Monday, July 8, 2024 4:43 AM
> > To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> > <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Ali=
m
> > Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> > <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> > Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux- kernel=40vger.kernel.org; Sunyeal Hong <sunyeal.hong=40samsung.c=
om>
> > Subject: =5BPATCH v2 2/4=5D arm64: dts: exynos: add initial CMU clock
> > nodes in Exynos Auto v920
> >
> > Add cmu_top, cmu_peric0 clock nodes and switch USI clocks instead of
> > dummy fixed-rate-clock.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > ---
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 40
> > +++++++++++++------
> >  1 file changed, 27 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index c1c8566d74f5..54fc32074379 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > =40=40 -6,6 +6,7 =40=40
> >   *
> >   */
> >
> > +=23include <dt-bindings/clock/samsung,exynosautov920.h>
> >  =23include <dt-bindings/interrupt-controller/arm-gic.h>
> >  =23include <dt-bindings/soc/samsung,exynos-usi.h>
> >
> > =40=40 -38,17 +39,6 =40=40 xtcxo: clock =7B
> >  		clock-output-names =3D =22oscclk=22;
> >  	=7D;
> >
> > -	/*
> > -	 * FIXME: Keep the stub clock for serial driver, until proper clock
> > -	 * driver is implemented.
> > -	 */
> > -	clock_usi: clock-usi =7B
> > -		compatible =3D =22fixed-clock=22;
> > -		=23clock-cells =3D <0>;
> > -		clock-frequency =3D <200000000>;
> > -		clock-output-names =3D =22usi=22;
> > -	=7D;
> > -
> >  	cpus: cpus =7B
> >  		=23address-cells =3D <2>;
> >  		=23size-cells =3D <0>;
> > =40=40 -182,6 +172,28 =40=40 chipid=4010000000 =7B
> >  			reg =3D <0x10000000 0x24>;
> >  		=7D;
> >
> > +		cmu_peric0: clock-controller=4010800000 =7B
> > +			compatible =3D =22samsung,exynosautov920-cmu-
> > peric0=22;
> > +			reg =3D <0x10800000 0x8000>;
> Please cross check the size of the register range, this looks to be more
> then what is needed.
>=20
In the case of preic0, the size is up to 0x7088. The CMU block SFR area of =
=E2=80=8B=E2=80=8BExynosAuto=20v920=20is=20generally=20specified=20up=20to=
=200x8000.=20There=20are=20differences=20for=20each=20block,=20but=20the=20=
settings=20are=20the=20same.=0D=0ADo=20you=20think=20it=20is=20necessary=20=
to=20change=20the=20actual=20size=20of=20each=20block?=0D=0A>=20>=20+=09=09=
=09=23clock-cells=20=3D=20<1>;=0D=0A>=20>=20+=0D=0A>=20>=20+=09=09=09clocks=
=20=3D=20<&xtcxo>,=0D=0A>=20>=20+=09=09=09=09=20<&cmu_top=20DOUT_CLKCMU_PER=
IC0_NOC>,=0D=0A>=20>=20+=09=09=09=09=20<&cmu_top=20DOUT_CLKCMU_PERIC0_IP>;=
=0D=0A>=20>=20+=09=09=09clock-names=20=3D=20=22oscclk=22,=0D=0A>=20>=20+=09=
=09=09=09=20=20=20=20=20=20=22noc=22,=0D=0A>=20>=20+=09=09=09=09=20=20=20=
=20=20=20=22ip=22;=0D=0A>=20>=20+=09=09=7D;=0D=0A>=20>=20+=0D=0A>=20>=20+=
=09=09cmu_top:=20clock-controller=4011000000=20=7B=0D=0A>=20>=20+=09=09=09c=
ompatible=20=3D=20=22samsung,exynosautov920-cmu-top=22;=0D=0A>=20>=20+=09=
=09=09reg=20=3D=20<0x11000000=200x8000>;=0D=0A>=20>=20+=09=09=09=23clock-ce=
lls=20=3D=20<1>;=0D=0A>=20>=20+=0D=0A>=20>=20+=09=09=09clocks=20=3D=20<&xtc=
xo>;=0D=0A>=20>=20+=09=09=09clock-names=20=3D=20=22oscclk=22;=0D=0A>=20>=20=
+=09=09=7D;=0D=0A>=20>=20+=0D=0A>=20>=20=20=09=09gic:=20interrupt-controlle=
r=4010400000=20=7B=0D=0A>=20>=20=20=09=09=09compatible=20=3D=20=22arm,gic-v=
3=22;=0D=0A>=20>=20=20=09=09=09=23interrupt-cells=20=3D=20<3>;=0D=0A>=20>=
=20=40=40=20-213,7=20+225,8=20=40=40=20usi_0:=20usi=40108800c0=20=7B=0D=0A>=
=20>=20=20=09=09=09=23address-cells=20=3D=20<1>;=0D=0A>=20>=20=20=09=09=09=
=23size-cells=20=3D=20<1>;=0D=0A>=20>=20=20=09=09=09ranges;=0D=0A>=20>=20-=
=09=09=09clocks=20=3D=20<&clock_usi>,=20<&clock_usi>;=0D=0A>=20>=20+=09=09=
=09clocks=20=3D=20<&cmu_peric0=0D=0A>=20>=20CLK_MOUT_PERIC0_NOC_USER>,=0D=
=0A>=20>=20+=09=09=09=09=20<&cmu_peric0=0D=0A>=20>=20CLK_DOUT_PERIC0_USI00_=
USI>;=0D=0A>=20>=20=20=09=09=09clock-names=20=3D=20=22pclk=22,=20=22ipclk=
=22;=0D=0A>=20>=20=20=09=09=09status=20=3D=20=22disabled=22;=0D=0A>=20>=0D=
=0A>=20>=20=40=40=20-224,7=20+237,8=20=40=40=20serial_0:=20serial=401088000=
0=20=7B=0D=0A>=20>=20=20=09=09=09=09interrupts=20=3D=20<GIC_SPI=20764=0D=0A=
>=20>=20IRQ_TYPE_LEVEL_HIGH>;=0D=0A>=20>=20=20=09=09=09=09pinctrl-names=20=
=3D=20=22default=22;=0D=0A>=20>=20=20=09=09=09=09pinctrl-0=20=3D=20<&uart0_=
bus>;=0D=0A>=20>=20-=09=09=09=09clocks=20=3D=20<&clock_usi>,=20<&clock_usi>=
;=0D=0A>=20>=20+=09=09=09=09clocks=20=3D=20<&cmu_peric0=0D=0A>=20>=20CLK_MO=
UT_PERIC0_NOC_USER>,=0D=0A>=20>=20+=09=09=09=09=09=20<&cmu_peric0=0D=0A>=20=
>=20CLK_DOUT_PERIC0_USI00_USI>;=0D=0A>=20>=20=20=09=09=09=09clock-names=20=
=3D=20=22uart=22,=20=22clk_uart_baud0=22;=0D=0A>=20>=20=20=09=09=09=09samsu=
ng,uart-fifosize=20=3D=20<256>;=0D=0A>=20>=20=20=09=09=09=09status=20=3D=20=
=22disabled=22;=0D=0A>=20>=20--=0D=0A>=20>=202.45.2=0D=0A>=20=0D=0A>=20=0D=
=0A=0D=0APlease=20review=20my=20answer=20again.=0D=0A=0D=0AThanks,=0D=0ASun=
yeal=20Hong=0D=0A=0D=0A

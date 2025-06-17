Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918A219EB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209418; cv=none; b=RWeMzc+hZOybrj54jwpKXKpK6cRu0Yy0608dzbxWs40WXD36tzzVMl4J9l0LVwrApU563DZW/QXi5JFOmtzQWPkQ7YvNNUSbcX9BvezTUQQ9AmZh/mbJw2qZwkKxlVaxpbbBdJ0QKd9nx8HxX1gK+/HpGh2fbwSmSGsZDAq+khA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209418; c=relaxed/simple;
	bh=JmIeeAjhfR2ALUFDgefbbnk1JUrhQSJna76hP+wcJgM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jXpINyj/HzJTMo03xjtUZ47eW1W9K+MiyFcsGBrbc3QOa9eZw7+mRkk/KzsZOJWZRtaHz9gcjPXk+qLfAoqFd5CJeLtXOVCoTMpapehdH8/Zme6uIf9rNhBLUBBAlSWg46vY1r6xz7Wo9q8loOKBiaAXZMblCvblYMO7XQkeP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SZSwcp6V; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SZSwcp6V"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250618011655epoutp03ef6c2e530e30fe9c38c59dc1bfaabdea~J-jCnYuij1499214992epoutp03k
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:16:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250618011655epoutp03ef6c2e530e30fe9c38c59dc1bfaabdea~J-jCnYuij1499214992epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209415;
	bh=kJtuG8LEDcYSFAfIXOntrtk20/ZtcCaun/G8S26fAFA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=SZSwcp6VAVJCuEGMrd9h3aywaQNCUxF18jr/iWIqWA/5LRbB6ybEXuQm6foqLvtDk
	 Qf8gq2tncGDg74cjACfxyXFT/4e1uJDGutJdh3C4nJ4X9dqI+9cJknXcaTwDbMlhcm
	 Q1FsUkmfEZd+LRGgJugOsB3qVkpn/JR2QkdbB2eI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250618011654epcas5p49a82be1ea2581070ed7fff72bda51313~J-jB9rluI2305723057epcas5p4q;
	Wed, 18 Jun 2025 01:16:54 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQnJ47DHz3hhTG; Wed, 18 Jun
	2025 01:16:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250617172501epcas5p24ed02011139817ab0a947cf24dbac464~J5HBkVc0u0301503015epcas5p23;
	Tue, 17 Jun 2025 17:25:01 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617172458epsmtip2fbf57099ebaa2954678ed528a0d39971~J5G_prIYN3172131721epsmtip2P;
	Tue, 17 Jun 2025 17:24:58 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Neil Armstrong'"
	<neil.armstrong@linaro.org>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kauschluss@disroot.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<m.szyprowski@samsung.com>, <s.nawrocki@samsung.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250616-perfect-fervent-robin-a1bc3c@kuoka>
Subject: RE: [PATCH v3 9/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB SS combo phy nodes
Date: Tue, 17 Jun 2025 22:54:57 +0530
Message-ID: <000101dbdfac$c1a35f40$44ea1dc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gGRKuf5ApVTYEcCparjMQJvpOKesM5XFRA=
Content-Language: en-in
X-CMS-MailID: 20250617172501epcas5p24ed02011139817ab0a947cf24dbac464
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca@epcas5p4.samsung.com>
	<20250613055613.866909-10-pritam.sutar@samsung.com>
	<9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
	<20250616-perfect-fervent-robin-a1bc3c@kuoka>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 16 June 2025 01:39 PM
> To: Neil Armstrong <neil.armstrong=40linaro.org>
> Cc: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; kauschluss=40disroot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 9/9=5D arm64: dts: exynos: ExynosAutov920: add U=
SB
> and USB SS combo phy nodes
>=20
> On Fri, Jun 13, 2025 at 11:12:26AM GMT, neil.armstrong=40linaro.org wrote=
:
> > On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> > >   		usbdrd31_hsphy: phy=4016490000 =7B
> > >   			compatible =3D =22samsung,exynosautov920-usbdrd-
> hsphy=22;
> > >   			reg =3D <0x16490000 0x0200>;
> > > =40=40 -1109,8 +1120,8 =40=40 usbdrd31_dwc3: usb=400 =7B
> > >   					 <&cmu_hsi1
> CLK_MOUT_HSI1_USBDRD>;
> > >   				clock-names =3D =22ref=22, =22susp_clk=22;
> > >   				interrupts =3D <GIC_SPI 491
> IRQ_TYPE_LEVEL_HIGH>;
> > > -				phys =3D <&usbdrd31_hsphy 0>;
> > > -				phy-names =3D =22usb2-phy=22;
> > > +				phys =3D <&usbdrd31_hsphy 0>,
> <&usbdrd31_ssphy 0>;
> > > +				phy-names =3D =22usb2-phy=22, =22usb3-phy=22;
> > >   				snps,has-lpm-erratum;
> > >   				snps,dis_u2_susphy_quirk;
> > >   				snps,dis_u3_susphy_quirk;
> >
> > I think at least patch 6 & 9 should be squashed.
>=20
> Yes. Changing lines which were just added is a strong hint, that patchset=
 is
> incorrectly organized.

we will squash these 2 patches in next version of the patch-set (v4).

>=20
> >
> > Neil

Thank you.

Regards,
Pritam




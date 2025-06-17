Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C117A2FB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209504; cv=none; b=G6lM7iFzy9b077/wYhwfHc1shC7QaubPKi23muIXChFDpHymhoFIfpreDxsLAwV4PfQLLOWsPgyEJLzcWrJZmFCQrM+x3K2q6m8c+p76hX5DD3uuMZ7fXDea2QZXzwv1vy7dbmG4LZFEqVTXlrbS087aOrlMgLzI0FWZXEyZiTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209504; c=relaxed/simple;
	bh=Qci4qfjH4vMxkOYHjf/aN3RPFH3vPkav5ynI9jzM77A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=M4bm9EG9ZgGjkQLxcpxxkCIc8ZP+gEHNpl1j+Pycc9hnY36+4lSsLVzCOSLKoj4uoJG7g1isrkQoXQRGhRELs57pn/Y4BP6584WOvGST+75pXnmhdPKqsKtu4s30GYa+479e54ic0f3/Vju/F/5+We3s3Bk8WtFAORmCsSN41BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sXphC0aT; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sXphC0aT"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250618011821epoutp03f9f28318249167b1dac78548f01fa4f7~J-kSuhvr21680116801epoutp03s
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 01:18:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250618011821epoutp03f9f28318249167b1dac78548f01fa4f7~J-kSuhvr21680116801epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750209501;
	bh=f4ePGu/HbODHfgnW4Rd+HUYbGf55CDlg7sZxq2mBe4w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=sXphC0aTlOO6aRyI0peueCrJ7ZfvPU5xb4Fd92j9l57bTbx1Ue+6w0vdFV1vIO3Cl
	 c/qM+DGikHZNSsJCMbGvbSS2mCyNhaV2FMXnQYBnLhxbId9AfF5zRdCgiMFduiicfa
	 odMFXKEHUYB67ThaaCxPhQIsfK34HqIK00gNnuuw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250618011820epcas5p19a33a255e86e59b0ec429aa61c56cc63~J-kSAM_0S0181101811epcas5p1t;
	Wed, 18 Jun 2025 01:18:20 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.182]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bMQpy3dVRz3hhTM; Wed, 18 Jun
	2025 01:18:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250617180446epcas5p1fc8bbc3efe3ef7dc2c97e3f0598f7332~J5pvH0OJo0228502285epcas5p1Q;
	Tue, 17 Jun 2025 18:04:46 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250617180443epsmtip130a4506dfb7f000acfa72e5107f09a8b~J5psRzdK51544215442epsmtip1a;
	Tue, 17 Jun 2025 18:04:43 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
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
In-Reply-To: <20250616-snobbish-chimpanzee-from-arcadia-bd9fcb@kuoka>
Subject: RE: [PATCH v3 4/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Date: Tue, 17 Jun 2025 23:34:42 +0530
Message-ID: <000501dbdfb2$4f6f0450$ee4d0cf0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNTkACKxnsdZBPuyPiYuNftoBZF1gI3IvSUAW5i7SwC0YsPGrDkisWw
Content-Language: en-in
X-CMS-MailID: 20250617180446epcas5p1fc8bbc3efe3ef7dc2c97e3f0598f7332
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7@epcas5p3.samsung.com>
	<20250613055613.866909-5-pritam.sutar@samsung.com>
	<20250616-snobbish-chimpanzee-from-arcadia-bd9fcb@kuoka>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 16 June 2025 01:46 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Cc: vkoul=40kernel.org; kishon=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; alim.akhtar=40samsung.com;
> andre.draszik=40linaro.org; peter.griffin=40linaro.org; kauschluss=40disr=
oot.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com; linux-phy=40lists.infradead.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v3 4/9=5D dt-bindings: phy: samsung,usb3-drd-phy: a=
dd
> ExynosAutov920 combo HS phy
>=20
> On Fri, Jun 13, 2025 at 11:26:08AM GMT, Pritam Manohar Sutar wrote:
> > Add a dedicated compatible string for USB combo HS phy found in this
>=20
> I reviewed patch =231, then went here and see that this is HS PHY. So pat=
ch =231
> is not HS PHY?
>=20

https://lore.kernel.org/linux-phy/20250613055613.866909-1-pritam.sutar=40sa=
msung.com/
This Soc has 2 types HS phys. one in combo phy and another stand-alone. ple=
ase refer the block diagrams in cover-letter.=20
=09
	1. samsung,exynosautov920-usbdrd-phy =3D> represents hs phy (synopsys phy =
version-303) and it is same as =22samsung,exynos850-usbdrd-phy=22. used sam=
e naming conventions
	2. samsung,exynosautov920-usbdrd-hsphy =3D> represents 'Add-on' HS phy(syn=
opsys phy version-400) with SS phy in combo phy. this is different from =22=
samsung,exynosautov920-usbdrd-phy=22 (reg offsets and bits are different).=
=20
	samsung,exynosautov920-usb31drd-ssphy =3D>  represents SS phy in combo phy

> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


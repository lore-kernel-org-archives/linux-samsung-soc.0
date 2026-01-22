Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7B34F246
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077931; cv=none; b=sXqF3CRAcIhHR0wtt0XJcYWrD7zikgKmkXwS2TR0V/k4XdXlmBYDPI3q8HKPSsqdGGyOLTTMXS3XhVLq8GkWhOLEUHB/549HlIvK73VuiHozZRuJCaqaLZZEbsee7kE0v+Qghg5I6HwUiyKptwWQLzHkAlgALC+3m/oqL5odG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077931; c=relaxed/simple;
	bh=4HGEOJdYofceavveyNvK694CLL+JytPY9nkr/yVGMk0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VxMSMkZmpZLoN/4V45j/gj64N5oWNz2SrkFqbU86QAk6f5jq74gTn2inB/cuOifDb84QIzlzMEM+4XFgMhVNfhUBkd89zC/7jZB0YHVRpfSZ+5+xRpx/pPkIFUGtrY3d2rCclgqtFa7+TeBWyx7QRQ9c8QXRWcb8euouMrlmV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qt1l22qt; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qt1l22qt"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260122103200epoutp01d0c4aa75689cc730be68b92514465ced~NBv72GBNX1470214702epoutp01c
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 10:32:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260122103200epoutp01d0c4aa75689cc730be68b92514465ced~NBv72GBNX1470214702epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769077920;
	bh=tnRCYwReWiwurhPWhltxwYGFpC/0m//wbHgfZbzv9Kk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qt1l22qtdWEmi6By166P8BM1Bt4oRzDLCZNeTMSjLVGjwnM+vcKoYqhxgoMNVr9y3
	 IRHYW5/yQez6zyEWQDj/luX+fwWuxnbbPEd+3uRQ8VLt1iFtHyXMUT4IA73Cd3aW+a
	 ukcOhlfg+b5gF+3GSKqy2pfTUX81GU93R6gw6XCY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260122103159epcas5p30f2fcd4a52671b2b064775d618b9dc94~NBv7EUo_I3092930929epcas5p32;
	Thu, 22 Jan 2026 10:31:59 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dxcnC0Vd2z6B9m9; Thu, 22 Jan
	2026 10:31:59 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260122103158epcas5p4e3fdf02aa0032bde16aefcf8f7896ef9~NBv5zye7J2850828508epcas5p4P;
	Thu, 22 Jan 2026 10:31:58 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260122103156epsmtip14657583bd1d596454c150368232302b9~NBv4DErW82162221622epsmtip1U;
	Thu, 22 Jan 2026 10:31:56 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
Subject: RE: [PATCH 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Thu, 22 Jan 2026 16:01:51 +0530
Message-ID: <000001dc8b8a$543269d0$fc973d70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJC10xQ5cnsV5/dezQFmmCfFyZ4QgFqW1wVtIYQSwA=
Content-Language: en-in
X-CMS-MailID: 20260122103158epcas5p4e3fdf02aa0032bde16aefcf8f7896ef9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
References: <CGME20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284@epcas5p4.samsung.com>
	<20251024114845.2395166-1-pritam.sutar@samsung.com>

Hi All,=20

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> Sent: 24 October 2025 05:19 PM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> rosa.pila=40samsung.com; dev.tailor=40samsung.com; faraz.ata=40samsung.co=
m;
> muhammed.ali=40samsung.com; selvarasu.g=40samsung.com;
> pritam.sutar=40samsung.com
> Subject: =5BPATCH 0/3=5D Add and enable USB nodes for ExynosAutov920 SoC
>=20
> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD controllers=
 and
> amoung them, one is USB3.1 DRD combo phy and three
> USB2.0 phy controllers. This patchset adds and enables USB and USB-PHY no=
des
> in dts.
>=20
> PMIC driver is not implmented yet, we rely on USB LDOs being enabled by t=
he
> bootloader and used dummy regulators for now.
>=20
> To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
> GPIO expander is present in the dts, we used it to enable the vbus regula=
tor
> using GPIO.
>=20
> USB ports are configured as OTG, and default mode is configured as periph=
eral.
> These configurations might be changed based on requirements.
>=20
> This patchset has dependancy on schema and driver implementation=5B1=5D a=
nd role
> switch control from userspace=5B2=5D patches.
> =5B1=5D: https://lore.kernel.org/linux-phy/20251010070912.3758334-1-
> pritam.sutar=40samsung.com/
> =5B2=5D: https://lore.kernel.org/linux-usb/20251024085455.789555-1-
> pritam.sutar=40samsung.com/

Above dependent patches are merged, can you please review the patchset?=20

>=20
> Pritam Manohar Sutar (3):
>   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
>   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
>   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
>=20
>  .../boot/dts/exynos/exynosautov920-sadk.dts   =7C 160 +++++++++++++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 162 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
>=20
> --
> 2.34.1

Thank you,=20

Regards,
Pritam=20



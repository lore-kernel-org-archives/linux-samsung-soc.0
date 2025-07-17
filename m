Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCE145B27
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751231; cv=none; b=Q4hfrz+LeaXGGp2+9Iyl8jG2qfjbVEi9mbuQ5dr9agW2bFamRGCN2V+9HnRMHKu5QqAvx5gvDtlHMfSPhTzqvlDm3fxJeW290nv3HTgxmXHmv0NNQZhVbNo9prX5e2/hLtK7JLsadD8yiKuOOn3zXMIhnoy04k/njXVC5ZvjIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751231; c=relaxed/simple;
	bh=n7EgR3Hsz1zlkX2gP62LRR8KKpmqcxE2D67RRmid0L0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=EhTFH/fZb5q/umDjD48dP4r6gZfuvlUCohV8wlfPhfQtOffMKCFFIEZlfT4DM+LL7GBLkyb+9+ZNtX8Wd7S3MNBQygGovXMPKTxRrQxgO5Ruel78yI4xVU3D8f23obn3aP3grtpzFHvbzqzpzSQi+sVxvc49/0MXEOX0yFLQBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oXUL+P+y; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oXUL+P+y"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250717112028epoutp0499f87ca42507a285ebe0476ddb46e433~TBfSnnrF21908919089epoutp04T
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2025 11:20:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250717112028epoutp0499f87ca42507a285ebe0476ddb46e433~TBfSnnrF21908919089epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752751228;
	bh=vaeHUHDhpHicpyEPArevNCJsvIdCbCzGZYXB98wgi1s=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=oXUL+P+yi1b6GGgxeAdl3fkacZa5Eqwy/w97hspuH5aKuqUTGcg6efrNCStz5Tzd/
	 yCPzt5bW4gyx16aycTiIlK4Vp8+YvTB6omd5U4PCw/NZxqu0nBNDn8G5J+vweYDWld
	 wnEnp5ANA8Wd8ifKZLuFE/Hap1AuHQi/L9MFEjEk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250717112026epcas5p17ba342f1a18c68254b3c95c7aa7117e0~TBfQ8Kwl32028120281epcas5p1v;
	Thu, 17 Jul 2025 11:20:26 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bjVpK3w9Hz6B9m7; Thu, 17 Jul
	2025 11:20:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250717111830epcas5p1c4816682379933819fef343a70e1e13b~TBdk6ieaL0129601296epcas5p1l;
	Thu, 17 Jul 2025 11:18:30 +0000 (GMT)
Received: from INBRO001840 (unknown [107.122.3.105]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250717111827epsmtip2d57c2524f47be7d8d1a79801f3a884f0~TBdiAJ8Ex3070830708epsmtip2O;
	Thu, 17 Jul 2025 11:18:27 +0000 (GMT)
From: "Pritam Manohar Sutar" <pritam.sutar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<neil.armstrong@linaro.org>, <kauschluss@disroot.org>,
	<ivo.ivanov.ivanov1@gmail.com>, <m.szyprowski@samsung.com>,
	<s.nawrocki@samsung.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <40c06385-26bc-4d5f-8fdc-fee2600afdeb@kernel.org>
Subject: RE: [PATCH v4 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Thu, 17 Jul 2025 16:48:26 +0530
Message-ID: <000d01dbf70c$86602e00$93208a00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQJAgQZ9LFXBZrDskwNBYris6jFv1AFx24JLAb5T8KIBPEtVBrNJsbUw
X-CMS-MailID: 20250717111830epcas5p1c4816682379933819fef343a70e1e13b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115959epcas5p40f28954777a620b018251301eea13873
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115959epcas5p40f28954777a620b018251301eea13873@epcas5p4.samsung.com>
	<20250701120706.2219355-3-pritam.sutar@samsung.com>
	<40c06385-26bc-4d5f-8fdc-fee2600afdeb@kernel.org>

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 12 July 2025 01:46 PM
> To: Pritam Manohar Sutar <pritam.sutar=40samsung.com>; vkoul=40kernel.org=
;
> kishon=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; andre.draszik=40linaro.=
org;
> peter.griffin=40linaro.org; neil.armstrong=40linaro.org; kauschluss=40dis=
root.org;
> ivo.ivanov.ivanov1=40gmail.com; m.szyprowski=40samsung.com;
> s.nawrocki=40samsung.com
> Cc: linux-phy=40lists.infradead.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-
> soc=40vger.kernel.org; rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> faraz.ata=40samsung.com; muhammed.ali=40samsung.com;
> selvarasu.g=40samsung.com
> Subject: Re: =5BPATCH v4 2/6=5D phy: exynos5-usbdrd: support HS phy for
> ExynosAutov920
>=20
> On 01/07/2025 14:07, Pritam Manohar Sutar wrote:
> > This SoC has a single USB 3.1 DRD combo phy that supports both
> > UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> > those only support the UTMI+ (HS) interface.
> >
> > Support only UTMI+ port for this SoC which is very similar to what the
> > existing Exynos850 supports.
> >
> > This SoC shares phy isol between USBs. Bypass PHY isol when first USB
> > is powered on and enable it when all of then are powered off. Add
> > required change in phy driver to support HS phy for this SoC.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong=40linaro.org>
>=20
> Drop

Sure.

>=20
> You again added significant changes and claimed they were reviewed.
>=20
> > Signed-off-by: Pritam Manohar Sutar <pritam.sutar=40samsung.com>
> > ---
> >  drivers/phy/samsung/phy-exynos5-usbdrd.c    =7C 131 ++++++++++++++++++=
++
> >  include/linux/soc/samsung/exynos-regs-pmu.h =7C   2 +
> >  2 files changed, 133 insertions(+)
> >
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > index dd660ebe8045..64f3316f6ad4 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > =40=40 -480,6 +480,8 =40=40 struct exynos5_usbdrd_phy =7B
> >  	enum typec_orientation orientation;
> >  =7D;
> >
> > +static atomic_t usage_count =3D ATOMIC_INIT(0);

Presently, existed SoC in driver, supports only one USB port and=20
it does not have any complications to handle shared isol. However,=20
phy isols are shared across USB20s in ExynosAutov920=20
(here ExynosAutov920 has 4 ports with shared phy isols). phy isol=20
should be enabled when all ports are disabled else bypassed if any=20
one of usbs is in use. phy isol is handled at bootloader in Downstream code=
.=20
USB20 ports won't work if isol is not handled in any bootloader. Hence,=20
added usage_count for the purpose.
  =20
But still, it depends on phy isol architecture, if SoC shares phy isol with=
=20
USBs or it can have separate phy isols for each usbs.

>=20
> No, you cannot have singletons. How are you going to handle two independe=
nt
> phys?

Agreed with your point and have to handle shared and separate isols in same=
 driver. =20
We will take this later in subsequent patch-sets.
  =20
For now, will remove this usage_count and bring up only basic support for E=
xynosAutov920 phy.

>=20
> Best regards,
> Krzysztof

Thank you.

Regards,
Pritam


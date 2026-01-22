Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855534F262
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102342; cv=none; b=NKKV+AG5dueUHNhuX+d0D9Z0qkVNyk/SLy3q/FJ6IGPLpEliXohqTZwH1F6uA3hfznKze33FNYm2jxR0aIlD62sqJbOEbQxTls3PAtHUaqjJ4XV5C5Ydr+piqOAS/gO5Rfrwc8uv8Qp3wKb22RSyh83u1Hkb7Ym0CUI7V18Lw5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102342; c=relaxed/simple;
	bh=xOfocJN3sVUqsg8qPf6KsQkDTr7XDa61ob1EtjlCDHE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=imwrys+ud+0TwAGQAhT/jR7Ht4sZTiSc0qZi1Dc+AWyRGj9FeyQ4hj7L489HmDJKIVsiIvlCbmLf6t4acKwmsrzt7DQ5EugS7Dq6o0KzOPRgRUeycmQKNszg5g0xA08dcGYywaQWZ66cUWOrnovWPwMhArCzK4/qFYVrcLzoEgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ryVfEHiU; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ryVfEHiU"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260122171843epoutp0472d4179f3fa42c5bc8d6f37c3ce70854~NHTDAPCM70983609836epoutp04d
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 17:18:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260122171843epoutp0472d4179f3fa42c5bc8d6f37c3ce70854~NHTDAPCM70983609836epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769102323;
	bh=Dfn6vnVnX/KCerEi1dQoZze0gUnqj9K4r4skiCF+1HU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ryVfEHiU6GYG3TT7YIICp09GzE4uN19pZ82TY1rOkgrFM0YChnQKtk6xuIahLw2Dw
	 gJJU45/rmi0RNa9LapJPvAJBE5LNjqKRU00sGcC3GkEp3YCxMCS8rNsnZnP4S+fyug
	 J1aGArqHicu5J/JCTDa4lU/qNO5q0RPR2rS51V+s=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260122171843epcas5p2b3340d2681a466691e75f7f855960b8d~NHTCgrdNT2323723237epcas5p2H;
	Thu, 22 Jan 2026 17:18:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dxnpV2MhJz6B9m5; Thu, 22 Jan
	2026 17:18:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260122171841epcas5p44be34d8fa6f05a6c2f6804156dd092cc~NHTA8qE-w0552605526epcas5p4p;
	Thu, 22 Jan 2026 17:18:41 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260122171837epsmtip2fa2844309b889494e61cc6ceb0ebd998~NHS8qaLTF1550615506epsmtip2L;
	Thu, 22 Jan 2026 17:18:36 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alim.akhtar@samsung.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<pritam.sutar@samsung.com>, <dev.tailor@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Thu, 22 Jan 2026 22:48:27 +0530
Message-ID: <04e501dc8bc3$27a48810$76ed9830$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMyl6jZ32DHOO134xOI05SqoiCOxQG1dU1GsosmcDCAGYRjoA==
Content-Language: en-us
X-CMS-MailID: 20260122171841epcas5p44be34d8fa6f05a6c2f6804156dd092cc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
	<20250904072844.358759-1-faraz.ata@samsung.com> 

HI Andi/Rob

Kindly help to review and merge the patch.

> -----Original Message-----
> From: Faraz Ata <faraz.ata=40samsung.com>
> Sent: Tuesday, January 6, 2026 11:17 PM
> To: 'andi.shyti=40kernel.org' <andi.shyti=40kernel.org>; 'robh=40kernel.o=
rg'
> <robh=40kernel.org>; 'krzk+dt=40kernel.org' <krzk+dt=40kernel.org>;
> 'conor+dt=40kernel.org' <conor+dt=40kernel.org>; 'alim.akhtar=40samsung.c=
om'
> <alim.akhtar=40samsung.com>
> Cc: 'linux-i2c=40vger.kernel.org' <linux-i2c=40vger.kernel.org>;
> 'devicetree=40vger.kernel.org' <devicetree=40vger.kernel.org>; 'linux-arm=
-
> kernel=40lists.infradead.org' <linux-arm-kernel=40lists.infradead.org>; '=
linux-
> samsung-soc=40vger.kernel.org' <linux-samsung-soc=40vger.kernel.org>;
> 'linux-kernel=40vger.kernel.org' <linux-kernel=40vger.kernel.org>;
> 'rosa.pila=40samsung.com' <rosa.pila=40samsung.com>;
> 'pritam.sutar=40samsung.com' <pritam.sutar=40samsung.com>;
> 'dev.tailor=40samsung.com' <dev.tailor=40samsung.com>
> Subject: RE: =5BPATCH=5D dt-bindings: i2c: exynos5: add exynosautov920-hs=
i2c
> compatible
>=20
> HI Andi/Rob
>=20
> I want to follow up on the below dt-binding patch submitted.
> Please let me know if the patch is under review or anything else needs to=
 be
> done.
>=20
> Reference  - https://lore.kernel.org/all/83338b57-2e8e-4b77-9e93-
> fadfb0f6a5fc=40kernel.org/
>=20
> > -----Original Message-----
> > From: Faraz Ata <faraz.ata=40samsung.com>
> > Sent: Thursday, September 4, 2025 12:59 PM
> > To: andi.shyti=40kernel.org; robh=40kernel.org; krzk+dt=40kernel.org;
> > conor+dt=40kernel.org; alim.akhtar=40samsung.com
> > Cc: linux-i2c=40vger.kernel.org; devicetree=40vger.kernel.org; linux-ar=
m-
> > kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linu=
x-
> > kernel=40vger.kernel.org; rosa.pila=40samsung.com;
> > pritam.sutar=40samsung.com; dev.tailor=40samsung.com;
> > faraz.ata=40samsung.com
> > Subject: =5BPATCH=5D dt-bindings: i2c: exynos5: add exynosautov920-hsi2=
c
> > compatible
> >
> > Add =22samsung,exynosautov920-hsi2c=22 dedicated compatible for HSI2C
> > found in ExynosAutov920 SoC.
> >
> > Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml =7C 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> > b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> > index 7ae8c7b1d006..207b95e392e5 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> > =40=40 -38,6 +38,7 =40=40 properties:
> >                - google,gs101-hsi2c
> >                - samsung,exynos2200-hsi2c
> >                - samsung,exynos850-hsi2c
> > +              - samsung,exynosautov920-hsi2c
> >            - const: samsung,exynosautov9-hsi2c
> >        - const: samsung,exynos5-hsi2c    =23 Exynos5250 and Exynos5420
> >          deprecated: true
> > --
> > 2.34.1



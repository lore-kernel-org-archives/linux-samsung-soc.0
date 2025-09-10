Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC30B17736
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505765; cv=none; b=W2/XjSYavCaIvujODKGJpRcAN+6HQhsqspBr3awTRGIXIxFJsL5grpC9dY3bAesXFXOYu+sXWIUIal6cAt7+PrHfj7caJWgFGcDi+IZTuu+cFUVG7hP1biCpsnfihhzf6N9uh3K3zhmsZOjK7vtp+XQ2OeDEBBkAzSZT7pXrwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505765; c=relaxed/simple;
	bh=jxew0vf7RuEzFnDze3/ICM1/y+QsIW5w3xJ75Vrwjdo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=eQLrXk53GDL0qkTvETtq8PYB5PwkWBjBaqLUTtvsHoxhq9fVYj4ust/d8/6Fui4bGYsBDaFbTM5QdJgXrDO6eVfZ17Q1U1BP/9EOox3IWb3V/u4BSN8ayMRsUKRjfbaa1sGy6u/LF8/3YuFlOcdjwPeeLKYvPeoSsu/rmFHUZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HznxM6Zq; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HznxM6Zq"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250910120241epoutp0292d4031a5aa94096ed7122b7bb116ac3~j6i27vGjl0511505115epoutp02V
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2025 12:02:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250910120241epoutp0292d4031a5aa94096ed7122b7bb116ac3~j6i27vGjl0511505115epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757505761;
	bh=zBxS2L/AuWYp7TGtZwdzdWsLouc3JAEYP1TBSrBikwY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HznxM6ZqLvci8L6Fon5wk1dUzrTk9jICGqO3u4qDrQz0AocTt8sC1cKqenHC3p0lx
	 4IgWFBYHA7nq+E6+YgMQcI1rIfAvQP27cSK++ClEkI7UDDqtQWzqH9pq16PqZwvWIY
	 tigdfvkS/cRB3W0hCKgpJF+juD3t8PxrD2Gje0WE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250910120240epcas5p1248fc9324e5ae8caa7f23ce34d0842de~j6i2Oht0y2148721487epcas5p1h;
	Wed, 10 Sep 2025 12:02:40 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cMK7h0VPcz2SSKY; Wed, 10 Sep
	2025 12:02:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250910120239epcas5p108aec1b642bf599978295ab7fd7e8721~j6i03PBiy2614626146epcas5p1K;
	Wed, 10 Sep 2025 12:02:39 +0000 (GMT)
Received: from INBRO002198 (unknown [107.122.5.156]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250910120237epsmtip19c210334904b3e1396315bc66436d0a6~j6iyj4SMI2315323153epsmtip1j;
	Wed, 10 Sep 2025 12:02:36 +0000 (GMT)
From: "Raghav Sharma" <raghav.s@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <sunyeal.hong@samsung.com>,
	<shin.son@samsung.com>, <alim.akhtar@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dev.tailor@samsung.com>,
	<chandan.vn@samsung.com>, <karthik.sun@samsung.com>
In-Reply-To: <f8ad7883-d879-47ce-aafc-7c5f741f3c18@kernel.org>
Subject: RE: [PATCH v1 3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT
 nodes
Date: Wed, 10 Sep 2025 17:32:25 +0530
Message-ID: <08fe01dc224a$cde7ff50$69b7fdf0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL0VUKk+u5fQqVv+k+NmjKuZqPkUAF92JyxAaWVb6EA7wl7+7I7Vh2g
Content-Language: en-us
X-CMS-MailID: 20250910120239epcas5p108aec1b642bf599978295ab7fd7e8721
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141247epcas5p2c254f35146a6ea35b5c49c4316ba30a3
References: <20250808142146.3181062-1-raghav.s@samsung.com>
	<CGME20250808141247epcas5p2c254f35146a6ea35b5c49c4316ba30a3@epcas5p2.samsung.com>
	<20250808142146.3181062-4-raghav.s@samsung.com>
	<f8ad7883-d879-47ce-aafc-7c5f741f3c18@kernel.org>

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Monday, August 11, 2025 12:19 PM
> To: Raghav Sharma <raghav.s=40samsung.com>; s.nawrocki=40samsung.com;
> cw00.choi=40samsung.com; mturquette=40baylibre.com; sboyd=40kernel.org;
> robh=40kernel.org; conor+dt=40kernel.org; sunyeal.hong=40samsung.com;
> shin.son=40samsung.com; alim.akhtar=40samsung.com
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; dev.tailor=40samsung.com; chandan.vn=40samsung.=
com;
> karthik.sun=40samsung.com
> Subject: Re: =5BPATCH v1 3/3=5D arm64: dts: exynosautov920: add CMU_M2M c=
lock
> DT nodes
>=20
> On 08/08/2025 16:21, Raghav Sharma wrote:
> > Add required dt node for CMU_M2M block, which provides clocks for M2M
> > IP
> >
> > Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynosautov920.dtsi =7C 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index 0fdf2062930a..086d6bbc18b8 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > =40=40 -1454,6 +1454,19 =40=40 pinctrl_aud: pinctrl=401a460000 =7B
> >  			reg =3D <0x1a460000 0x10000>;
> >  		=7D;
> >
> > +		cmu_m2m: clock-controller=400x1a800000 =7B
>=20
>=20
> Are you sure this satisfies tests required by Samsung SoC maintainer prof=
ile?
>=20
Sorry for delay in reply, I was off for some time.=20
I understood the requirement here and thanks for your guidance on the other=
 thread.=20
I shall post the new version post fixing the compilation warnings.

> Best regards,
> Krzysztof


Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2BF17C223
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722010122; cv=none; b=MximJ5mdZJJMDFaIEBEaYSnXO96N31UHWzpkC08JUCtMv8Dl9qyGU3v2X67j+AAedVal6couCn0xLCV9BcpnD7ukLk0mfpyVJooJrNOHStmYmsRlNxeOi246NjXzqOVgsQZjm39r9lf1JZEB26TY1HguY5eV2tT5qDp+stWNgLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722010122; c=relaxed/simple;
	bh=skBAE2wesYoy2bVElzMmdUPRGrWUP3sR6xLdiakitaw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=qNStqIUzCiinvGeBxEoa0TuJbUjPv4k6yPY8ZcvXnfke0nqmD81rDFMPMdDgc6kXM7jZQ9RrtYbM22CVIxumRlPxxcqTaTVdP1zP6NX1TqO+WWwrIfVMetoqL+QnWc/TDDQw/TJzrj34dI9SCc/0VErQpdgnG8COXXArMQv0VUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Zu1C/Ckc; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Zu1C/Ckc"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240726160831epoutp03ccee5d3570ff48fa3c11bbf7e3511f2a~lzxKxIzWH0340303403epoutp03b
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2024 16:08:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240726160831epoutp03ccee5d3570ff48fa3c11bbf7e3511f2a~lzxKxIzWH0340303403epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722010111;
	bh=JEMlsGv2heq2/bCUd9HGf0eeVSnui/IoDxccYtogt7M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Zu1C/CkcYI/OS4gYEYW/NY7ZkGUY1LAHnZmiqqLRlkvW06Nv7xro1PDJ4NCzs5usr
	 AreQDUBqetxZYBEyC1TpQqDSKxojo3hc2bbyqRSzkCyPtA9ghOTmP6tAsDK57VH6sJ
	 5hwsfzZ53uVI6ZxO/yh7btxsSoi7xQ5zzJR0Xvu0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240726160831epcas5p323b67f0669d0e79f66dbf0385f7788f2~lzxKXq2Br0259002590epcas5p3L;
	Fri, 26 Jul 2024 16:08:31 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WVt315Wzsz4x9Pp; Fri, 26 Jul
	2024 16:08:29 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E5.CD.08855.DF9C3A66; Sat, 27 Jul 2024 01:08:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20240726160828epcas5p4044c63bbbf1a07881fbfdf4994d2d2bc~lzxH14fFp0113301133epcas5p4I;
	Fri, 26 Jul 2024 16:08:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240726160828epsmtrp2634c1f7cece6b6f6a0ed69c225688d2a~lzxH0_vI41215412154epsmtrp2z;
	Fri, 26 Jul 2024 16:08:28 +0000 (GMT)
X-AuditID: b6c32a44-15fb870000002297-05-66a3c9fd24e3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	2F.7D.19367.CF9C3A66; Sat, 27 Jul 2024 01:08:28 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240726160826epsmtip25a1e12f192d97b1027ac1397cf36cdac~lzxF6oDGK0750807508epsmtip2Q;
	Fri, 26 Jul 2024 16:08:26 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Sam
 Protsenko'" <semen.protsenko@linaro.org>
Cc: "'Peter Griffin'" <peter.griffin@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "'Chanwoo	Choi'" <cw00.choi@samsung.com>,
	"'Marek Szyprowski'" <m.szyprowski@samsung.com>, "'Peter Griffin'"
	<peter.griffin@linaro.org>, "'Jaewon Kim'" <jaewon02.kim@samsung.com>,
	"'Mateusz Majewski'" <m.majewski2@samsung.com>, "'Henrik Grimler'"
	<henrik@grimler.se>, "'David Virag'" <virag.david003@gmail.com>, "'Artur
 Weber'" <aweber.kernel@gmail.com>, "'Raymond Hackley'"
	<raymondhackley@protonmail.com>
In-Reply-To: <ae202942-fdc0-4913-bd37-c167440807af@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: Add entry for Samsung Exynos850 SoC
Date: Fri, 26 Jul 2024 21:38:24 +0530
Message-ID: <00de01dadf76$0d25ffa0$2771fee0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIxRuuGU4BfprLt44pSxzrfoREBGwGQlGJMAb8/M4UBon8187E0yI0Q
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmhu7fk4vTDOaeVbH42/uP3eL6l+es
	Fm+X7GK02NFwhNVi7+ut7BabHl9jtbi8aw6bxYzz+5gsJh6bzGyx9shddosNM/6xWJzZeZzN
	4nkfUOL4+8eMDnweO2fdZfc4euUeq8eda3vYPDYvqffoadvE5NG3ZRWjx+dNcgHsUdk2GamJ
	KalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUAnKymUJeaUAoUC
	EouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0ihNzi0vz0vXyUkusDA0MjEyBChOyMx53bmYs
	mClVceL9aZYGxgeiXYwcHBICJhLT/th3MXJxCAnsZpQ4dvI0E4TziVFi5YU+Zjin9d8WoAwn
	WMfz0w+gEjsZJdbvPcIK4bxglPjw8xgLSBWbgK7EjsVtbCC2iECexPSbm1lAipgFjrJI9H/6
	ywyS4BSwk3j4+QxYkbCAq8TqHasZQWwWAVWJ7zc+ADWwc/AKWEpMdwaJ8goISpyc+QRsPLOA
	tsSyha+ZIQ5SkPj5dBkrxCo3icYpExkhasQlXh49wg6yVkLgCofEhO0XoBpcJFYf/88OYQtL
	vDq+BcqWkvj8bi8bhJ0tcfziLCi7QqK79SNUjb3Ezkc3WUBhxyygKbF+lz7ELj6J3t9PmCBB
	yivR0SYEUa0q0fzuKguELS0xsbubFcL2kFj1Yy3zBEbFWUg+m4Xks1lIPpiFsGwBI8sqRsnU
	guLc9NRk0wLDvNRyeHQn5+duYgSnZy2XHYw35v/TO8TIxMF4iFGCg1lJhHfZ/YVpQrwpiZVV
	qUX58UWlOanFhxhNgYE9kVlKNDkfmCHySuINTSwNTMzMzEwsjc0MlcR5X7fOTRESSE8sSc1O
	TS1ILYLpY+LglGpgWlm1fsXB2T98i3ibc+f2xd1IP6X5+/326xbTb81xrbGUDX/xd36B+M5F
	4vVy05VvLnwlf0to4r6sNa8rvir5931UrDnruDBphcZZn69eke/V/c5/S99gX2b727lwT+Rj
	B8tLZoZcZ/7vWjQ/aPvJVZ+WWrq+8vI/4B/kuSf/yrTvO3WcDlwoUDipOY07K9PwUm703Mfe
	rnfmsU31WeGhIJqixRWzzfFP3xndG9Vbmlbtrtjwba7I+diu7uTaerVpBpWbzpx+GHo5+fvB
	9qmf9n3nD3/p8tP0guPZur8z639J3BFKyDgzycvQPD8y5Pu/P+LV1uum+Owq7xPwv/DsC0fT
	6l8ySeqrizgqBTW9tJVYijMSDbWYi4oTAfpCC1lYBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSvO6fk4vTDH7NkLX42/uP3eL6l+es
	Fm+X7GK02NFwhNVi7+ut7BabHl9jtbi8aw6bxYzz+5gsJh6bzGyx9shddosNM/6xWJzZeZzN
	4nkfUOL4+8eMDnweO2fdZfc4euUeq8eda3vYPDYvqffoadvE5NG3ZRWjx+dNcgHsUVw2Kak5
	mWWpRfp2CVwZrd/nshfckaz4d+YZUwPjQtEuRk4OCQETieenHzB3MXJxCAlsZ5S4s28rK0RC
	WuL6xgnsELawxMp/z9khip4xSiyYupwNJMEmoCuxY3EbmC0ikCdx7chGVpAiZoGzLBKnVx2B
	6vjCKHGwtZ0JpIpTwE7i4eczYB3CAq4Sq3esZgSxWQRUJb7f+MDSxcjOwStgKTHdGSTKKyAo
	cXLmExYQm1lAW+Lpzadw9rKFr5khjlOQ+Pl0GSvEDW4SjVMmMkLUiEu8PHqEfQKj8Cwko2Yh
	GTULyahZSFoWMLKsYhRNLSjOTc9NLjDUK07MLS7NS9dLzs/dxAiOT62gHYzL1v/VO8TIxMF4
	iFGCg1lJhHfZ/YVpQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KLYLJM
	HJxSDUySb2ZU2rZPF2GJv5Qwh3eSxN/7n+8USz6Mn57kNpm5O+RhlfWcsB+b56jFbXLa+0Zz
	tjL/lzCNr81efwUOHJrx8Wmb7bqvWbYeVm7qLpc4hQs2pgaVPlgRN399/PrUFdKNpzISNrr/
	v5vk+tamWjz675PMw0lhqs/tFv0OlPth9s+6qFDf+YRJL7t/zWOrdxECz07mn1xgb2o+pbyP
	aRLD+UT/ZVz7o+8vvX/r/saTc4uf5PH0tS64m/rm5PN49f2n0gUl+/5WbJ/747peYu3C40e4
	LNXN7P56zzvzL//DxiOrPmobPVq5fkFQQonyTu6jHYyf5eN0Q37Pjv6bvMzDYM2tqk0sVfLe
	56o9XrMpsRRnJBpqMRcVJwIAuHPchD4DAAA=
X-CMS-MailID: 20240726160828epcas5p4044c63bbbf1a07881fbfdf4994d2d2bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240726151721epcas5p10d25ffeae074e4be35471a4799cfbd65
References: <20240129204717.9091-1-semen.protsenko@linaro.org>
	<8659d79a-e18e-4591-be9e-817d0ab63b75@linaro.org>
	<CGME20240726151721epcas5p10d25ffeae074e4be35471a4799cfbd65@epcas5p1.samsung.com>
	<ae202942-fdc0-4913-bd37-c167440807af@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Friday, July 26, 2024 8:47 PM
> To: Sam Protsenko <semen.protsenko=40linaro.org>
> Cc: Alim Akhtar <alim.akhtar=40samsung.com>; Peter Griffin
> <peter.griffin=40linaro.org>; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; Chanwoo Ch=
oi
> <cw00.choi=40samsung.com>; Marek Szyprowski
> <m.szyprowski=40samsung.com>; Peter Griffin <peter.griffin=40linaro.org>;
> Jaewon Kim <jaewon02.kim=40samsung.com>; Mateusz Majewski
> <m.majewski2=40samsung.com>; Henrik Grimler <henrik=40grimler.se>; David
> Virag <virag.david003=40gmail.com>; Artur Weber <aweber.kernel=40gmail.co=
m>;
> Raymond Hackley <raymondhackley=40protonmail.com>
> Subject: Re: =5BPATCH=5D MAINTAINERS: Add entry for Samsung Exynos850 SoC
>=20
> On 30/01/2024 08:29, Krzysztof Kozlowski wrote:
> > On 29/01/2024 21:47, Sam Protsenko wrote:
> >> Add maintainers entry for the Samsung Exynos850 SoC based platforms.
> >>
> >> Signed-off-by: Sam Protsenko <semen.protsenko=40linaro.org>
> >> ---
> >>  MAINTAINERS =7C 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS index
> >> 939f6dd0ef6a..77c10cc669f8 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> =40=40 -19281,6 +19281,16 =40=40 B:	mailto:linux-samsung-
> soc=40vger.kernel.org
> >>  F:	Documentation/devicetree/bindings/sound/samsung*
> >>  F:	sound/soc/samsung/
> >>
> >> +SAMSUNG EXYNOS850 SoC SUPPORT
> >> +M:	Sam Protsenko <semen.protsenko=40linaro.org>
> >> +L:	linux-arm-kernel=40lists.infradead.org (moderated for non-subscrib=
ers)
> >> +L:	linux-samsung-soc=40vger.kernel.org
> >
> > Sorry, but I am still against individual SoC entries in maintainers,
> > like I replied multiple times and pointed to the updated
> > get_maintainers.pl script to fetch emails from boards.
>=20
> I retract my earlier statement.
>=20
> Some background: I was really hoping that scripts/get_maintainers.pl patc=
h,
> which adds fetching emails from files (e.g. DTS), will be picked up, but =
it has
> been few years, few resends and there is no conclusion. I don't think it =
will be
> ever merged, thus this email.
>=20
> Since C files do not have in-file =22maintainer=22 entry and particular d=
rivers have
> MAINTAINERS-file entries, then why DTS should be different?
>=20
Not sure what was the discussion in past, do you think this need some discu=
ssion in LPC?=20

> I'll take the patch after merge window.
>=20
> +Cc few other folks,
>=20
> I understand that with lei/lore filters one can easily track patches sent=
 for
> particular boards or SoCs, but being listed in MAINTAINERS have a bit big=
ger
> meaning. Therefore if any of you consider / want to add themself to
> MAINTAINERS for particular DTS, then go ahead. By DTS I
> mean: particular boards (e.g. Galaxy Tab 3 family) or particular SoC (e.g=
.
> Exynos850 like here).
>=20
Actually it is being confusing. Completely agreed that  =22MAINTAINERS have=
 a bit bigger=22.
By adding each DTS/SoC/Board MAINTAINERS entry, are those members expected =
to send pull requests?
If so, that leads to more confusion and overhead.=20


> Best regards,
> Krzysztof



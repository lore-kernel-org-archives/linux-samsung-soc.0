Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F4185B43
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286241; cv=none; b=lS3nxawqDdqwq6IDb6bGTeskWhYXEN8A/M7V62UB5P+ctuh+Q4Dk8wPFqmW5KpsRrm6+MFGVJdt0EBHlSzhAF08tQ39rCEONxODtbt9uKCVXWCKMYVJ6uqZAe8Sqwl2ba4SlnTWzjGE4lrs1AHAi60mH5B/CAuqByWWQwUlViF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286241; c=relaxed/simple;
	bh=hSv9F+SOhdBqzcQdaRe6qQr6JJfZaJ1QFV6pBUkSgDU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=b7GuNFFhgaP8q7OZwk2IOIaWUoeAJ5yMP1j7ojT34K39jYHkj3mGMmc25Pj4DzYaQCQFdKajGg3sZKBwb6r52j+/kbXjs9ANwAh/S/QIKGVdJpo8Edh/aztzv7HBHayITNll79XPmuFDZkqMyWlRIjVy/g6pUIMRGDpLA0UNWA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lvt9xHIH; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lvt9xHIH"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241007073036epoutp02b16a5b52fce4d4e2a5001e8921b685b2~8GyzwZF8L0416604166epoutp02M
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:30:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241007073036epoutp02b16a5b52fce4d4e2a5001e8921b685b2~8GyzwZF8L0416604166epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728286236;
	bh=4rnbqJZZSntKlMlkGwspg1MG8k0aE9vHfvaiVGRlvVQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lvt9xHIHANWGuWXYFKXOLOHKUuKgpsZMqp9kU2rbM2IMAqTBX8wDhQBNwOo6WdVhZ
	 oVZbYD8w3ugMCNm2IPzHsAfOSg1bRaz3PonFzqIJ37yyrShNrrXAg932URhUgZNxNR
	 ZMX7ZPsipq9n01tE66EtmwjV45UBDdYqBQkzHDUc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241007073036epcas2p10512e5b3c1c7f299b989387c7160cb75~8GyzQyme11623716237epcas2p18;
	Mon,  7 Oct 2024 07:30:36 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XMW5l6pNDz4x9Pp; Mon,  7 Oct
	2024 07:30:35 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	1A.7A.09396.B1E83076; Mon,  7 Oct 2024 16:30:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241007073035epcas2p3b1154a0e2efc8a42abbae11f28c4194b~8GyygLzZO0428504285epcas2p35;
	Mon,  7 Oct 2024 07:30:35 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007073035epsmtrp256ce08ff17226426593c4d3d52389e24~8GyyfT4Cc0646906469epsmtrp2S;
	Mon,  7 Oct 2024 07:30:35 +0000 (GMT)
X-AuditID: b6c32a45-671ff700000024b4-c2-67038e1b39ba
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F9.2D.07371.B1E83076; Mon,  7 Oct 2024 16:30:35 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241007073035epsmtip2dc46f00c01a36834257bf77509131b4a~8GyyTjFGv2323423234epsmtip2o;
	Mon,  7 Oct 2024 07:30:35 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <459e2af0-16a1-45aa-93b8-50b84b359854@kernel.org>
Subject: RE: [PATCH v2 0/3] add clocks support for exynosauto v920 SoC
Date: Mon, 7 Oct 2024 16:30:35 +0900
Message-ID: <00a401db188a$cc7a1d30$656e5790$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHi+T2XatR6Fb/gkA73a6jZq5dtDgLeX3L3AXP3fjaySI5iUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmua50H3O6wavTZhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvI4sDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndw
	vHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0IlKCmWJOaVAoYDE4mIlfTubovzSklSFjPzi
	Elul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM3gXnGAvaeCqeT1rF2sD4h7OLkZND
	QsBE4u6j52xdjFwcQgI7GCUWL+xmAkkICXxilFgwNRwi8Y1RYsqRfawwHY+vPmCBSOxllFj3
	4RILRMdLRomj36pAbDYBfYnV3bfBxooI3GGSuDz9DTuIwyywjlFi88wj7CBVnAJ2ErMf/2IG
	sYUF3CQW/j8JZrMIqEhc/dYGdAcHB6+ApcTqmdogYV4BQYmTM5+ALWMW0JZYtvA1M8RFChI/
	ny4Du05EwEni+fVWqBoRidmdbcwgeyUEjnBIbFh3B+oFF4nX8y+xQdjCEq+Ob2GHsKUkPr/b
	CxXPl5h8/S0TRHMDo8S1f91Q2+wlFp35yQ5yHLOApsT6XfogpoSAssSRW1B7+SQ6Dv9lhwjz
	SnS0CUE0qkl8unIZaoiMxLETz5gnMCrNQvLZLCSfzULywSyEXQsYWVYxiqUWFOempxYbFRjC
	Izs5P3cTIzj1arnuYJz89oPeIUYmDsZDjBIczEoivBFrGNOFeFMSK6tSi/Lji0pzUosPMZoC
	g3ois5Rocj4w+eeVxBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cAk
	pjDFW+mN2UrNYA/DkO/rFQ0+nJa+4fYta67bvbT68IOC3zpXCNjLT9vxUDtnicXZhWGXlQId
	NWX/+X55M1Vqwe7l/Fe8tt8+ctD+y6wlm9wP1xyZ8LN+0hb1GyE6ZXf02fcwRK4ws+e5J1Ty
	dvuljM8lMcI7NrvO3Fe9wyJKOM9i5xHm/Qs8z7+4/eO65sm1blO46gSfWMb8NXtfq5j3OFzg
	iN/MZyplDZ8u++7kdmve772zUqbHfJ7i8Sv/brSkRz7tumKg85pPyfnxBlsz61t7bgca6h69
	FXcwy3z5oYir137IaxxnSli063j1KvG1s8pcL2vxrfgz/4Uk32XB/NOf20WPV62Zqv3x4crV
	y5RYijMSDbWYi4oTAVWe3bBGBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSvK50H3O6Qct3CYsH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1kceD1eH+jld1j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK2NFRxdTwQvu
	incP8hoYb3F2MXJySAiYSDy++oCli5GLQ0hgN6PEtUM/GCESMhIbG/6zQ9jCEvdbjrBCFD1n
	lPi/bxETSIJNQF9idfdtNpCEiMAjJonpRz6xgzjMApsYJc7tvskG0XKYUeLb06UsIC2cAnYS
	sx//YgaxhQXcJBb+PwlmswioSFz91gY0loODV8BSYvVMbZAwr4CgxMmZT8BamQW0JXoftjLC
	2MsWvmaGOE9B4ufTZawgtoiAk8Tz661Q9SISszvbmCcwCs9CMmoWklGzkIyahaRlASPLKkbJ
	1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT83E2M4EjU0tjBeG/+P71DjEwcjIcYJTiYlUR4I9Yw
	pgvxpiRWVqUW5ccXleakFh9ilOZgURLnNZwxO0VIID2xJDU7NbUgtQgmy8TBKdXANMn2bUdX
	gVvI44z2fW6/dksd3ewQUvf8Q2Psy1+9fdtNmopSgpUXTb4SdcP5Rfkm1qczlC7vTrDL59lZ
	qHTNfvG+so7nf2r5jZPcnxqcdVhUbzyXM9RZ0SU5eGFwtsnU0rtKH6d9SErcze7L2BZy9KjH
	1hTt7VdStrikBUe9EJry0Nl98kFunVMGSxWufpPauf/COh/px+YhnMeDVO5v7rj8J1Nvtvvs
	4vnWN/+4fuZzf+nwvX3G1NsxhyVPWcYXcKzcPc/C78DRJ5OKpub0nFQ8vHD7ov6jk24cuvPp
	9snq1x8CJ1mnRf68o+rbe+1Opm7d9DwV5b8tQoZMHKf0G24+2zqX4UhNyYoj14UcBJVYijMS
	DbWYi4oTAedQqIUzAwAA
X-CMS-MailID: 20241007073035epcas2p3b1154a0e2efc8a42abbae11f28c4194b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071833epcas2p213100b34fd5a8192497a41e2e455947a
References: <CGME20241007071833epcas2p213100b34fd5a8192497a41e2e455947a@epcas2p2.samsung.com>
	<20241007071829.3042094-1-sunyeal.hong@samsung.com>
	<459e2af0-16a1-45aa-93b8-50b84b359854@kernel.org>

Hello Krzyszto,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Monday, October 7, 2024 4:20 PM
> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>; Alim
> Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob Herri=
ng
> <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v2 0/3=5D add clocks support for exynosauto v920 So=
C
>=20
> On 07/10/2024 09:18, Sunyeal Hong wrote:
> > This patchset adds the CMU block below to support exynosauto v920 SoC.
> > - CMU_PERIC1
> > - CMU_MISC
> > - CMU_HSI0/1
> >
> > Changes in v2:
> >  - Rebase the patch to reflect the latest fixes
>=20
> Not much improved. Still blind rebase without addressing the issue I
> pointed out.
>=20
> Allow people to actually review your patches, instead of sending multiple
> versions within 5 minutes.
>=20
> One patchset per 24h.
>=20
I apologize for sending you the patch version incorrectly multiple times.
Could you elaborate a bit more on the =22unrelated change=22 part you menti=
oned in the comment?
I don't think I understand your exact intention.

Best Regards,
sunyeal

> Best regards,
> Krzysztof
>=20



Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0B146592
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170515; cv=none; b=Ogr8FrTlsOySgpsEfzi4tvCKp9A+NUTANbcvt07S4C3FHOnxrqHXWM7Vlbwf2y+M30mXycOHL+n4XUOKDQyYrfCQjUcj6qKZTrP0vZVTGtxrsA5gMwzZjbgzun3OLTOHE25huuJExctY6lkPvaBK9djbgfBi45xPCGY8vf2yeok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170515; c=relaxed/simple;
	bh=+Gu0OCQXl6oawvANorDGwRWHs4J3tjs00pMxr/U+jUo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=F9dgvR4+zEbcoHrMOefCannfB/fB+5KxSlwjmApl/7MVFyunjm9M7IstR4jSeIcn4r/1bF2rSK88SkWYtnUeYhUPij9Ff/SXr7BE+UXonP7ZEXYE8cS0DialUVUFKxnsPGnXCJQOEC/+TFYj9wW4YXfKZCM/B+UGaL6ewu/yszY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d4yQwCP/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d4yQwCP/"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240705090829epoutp016d02f4a6775b0a8782bca617a853446e~fRfbfjHeU0171301713epoutp01r
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:08:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240705090829epoutp016d02f4a6775b0a8782bca617a853446e~fRfbfjHeU0171301713epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720170509;
	bh=+Gu0OCQXl6oawvANorDGwRWHs4J3tjs00pMxr/U+jUo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=d4yQwCP/Fn82+dZS2Oy+NYMMqiYXAUezr/G2lHCll9a4vLDxyYBPGGyvP6+5TSr3e
	 V4zCqRTrfbd2Tis9Oe07nnpzwfQf6Ua1/C2vEm3aW5/xn44/U3Pnn1aMbwpRdTPD8W
	 wj7JytE7BsWcCQm7NV1aa/aRclWFYAJAUwOgC4Ik=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240705090828epcas2p2a835d9548ed765154671ddc3884b58ea~fRfbGkiTx1101711017epcas2p2W;
	Fri,  5 Jul 2024 09:08:28 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WFnk43lkJz4x9Py; Fri,  5 Jul
	2024 09:08:28 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.F0.09848.C08B7866; Fri,  5 Jul 2024 18:08:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240705090828epcas2p4d15b9c989c0705bca41534dc701b5da3~fRfaUpOA82840028400epcas2p4J;
	Fri,  5 Jul 2024 09:08:28 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705090827epsmtrp2278b674f19aee3d914e0947bf1378e32~fRfaOIkaY2073920739epsmtrp2p;
	Fri,  5 Jul 2024 09:08:27 +0000 (GMT)
X-AuditID: b6c32a45-447fe70000002678-13-6687b80cbca1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	94.7E.07412.B08B7866; Fri,  5 Jul 2024 18:08:27 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705090827epsmtip2ce18fd6bd14ba495323e9141d438b832~fRfaBn7hX2096020960epsmtip2-;
	Fri,  5 Jul 2024 09:08:27 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <31778ed0-e4b5-4961-99a5-41ce44ddac26@kernel.org>
Subject: RE: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v920
Date: Fri, 5 Jul 2024 18:08:27 +0900
Message-ID: <01c601daceba$e5d32570$b1797050$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPebKt0SL2hL1PGxWEYogtVpy49QFdVAxIAswtgRoBIrCNyQH2oTjfAipr0pqxMxhKQA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmmS7PjvY0gzW7ZCwezNvGZnH9y3NW
	i/PnN7BbfOy5x2pxedccNosZ5/cxWVw85Wpx+E07q8W/axtZHDg93t9oZffYtKqTzaNvyypG
	j8+b5AJYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0y
	c4BOUVIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBfoFSfmFpfmpevlpZZYGRoY
	GJkCFSZkZ/y7fYO54ItYxY5JS1kbGN8JdTFyckgImEgsb3jJ0sXIxSEksINR4mXDS2YI5xOj
	xOs3P9ghnG+MEpM6LrDAtPz7eQCqai+jxMnfZ6GqXjJKHN+wnAmkik1AX2J19202kISIQD+T
	xLznP1hBEswCaRIrTm0B6uDg4BSwk5i9zgMkLCyQKDH9wxSwEhYBFYllU7qYQUp4BSwlLj1J
	AgnzCghKnJz5hAViirbEsoWvmSEOUpD4+XQZWKuIQJjEna9PmCBqRCRmd7aBHSohMJNDYuKe
	D6wQDS4S8/b8ZoSwhSVeHQc5B8SWkvj8bi8bhJ0vMfn6WyaI5gZGiWv/uqG22UssOvMT7H5m
	AU2J9bv0QUwJAWWJI7egbuOT6Dj8lx0izCvR0QYNajWJT1cuQw2RkTh24hnzBEalWUg+m4Xk
	s1lIPpiFsGsBI8sqRrHUguLc9NRiowJDeGQn5+duYgSnUi3XHYyT337QO8TIxMF4iFGCg1lJ
	hFfqfXOaEG9KYmVValF+fFFpTmrxIUZTYFBPZJYSTc4HJvO8knhDE0sDEzMzQ3MjUwNzJXHe
	e61zU4QE0hNLUrNTUwtSi2D6mDg4pRqYxDlZymumlN9e1Rc+X/tw6ve6nFPt+/h4lrlM0r9r
	49+838/htdSKidVnrpY1R7J8i9o+w3Ca+ekc788CE14LFyWaensu8/xSrfFk8Qy+OYdtVp8S
	U1g94/aHyTsuFzIy/zZg/3qJiVPw1dtLvZfXLbI6sII7mCFtTd7it1LiCvEWzXIxp7yZZcJn
	fTmytOxoVdsVVWW7Ju6cYOuLLkbTFPiY5Z0n3J0892RtWMHrWy85z3bEPVO91/V4nmIB77tq
	g8QOm1sOq9ni5NjW5SYmTJJd7f54fv2ZmpjXy9myXbWVFL/mzgzTjDz/3Sx0/S93Pv8by156
	5XcEaK6cEeMQxyLv5sq67IeSxqqVtT+VWIozEg21mIuKEwG9VGO6LgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXpd7R3uaQf96I4sH87axWVz/8pzV
	4vz5DewWH3vusVpc3jWHzWLG+X1MFhdPuVocftPOavHv2kYWB06P9zda2T02repk8+jbsorR
	4/MmuQCWKC6blNSczLLUIn27BK6Ms9fvsBTcFqs4tuEZUwPjaaEuRk4OCQETiX8/DzB3MXJx
	CAnsZpR4+fE0I0RCRmJjw392CFtY4n7LEVaIoueMEvP+rgUrYhPQl1jdfZsNJCEiMJlJ4uqx
	tWwgCWaBDIlD196zQXRcZ5K4OOUFSxcjBwengJ3E7HUeIKawQLxE71N7kHIWARWJZVO6mEHC
	vAKWEpeeJIGEeQUEJU7OfMICMVFb4unNp3D2soWvmSFuU5D4+XQZK4gtIhAmcefrEyaIGhGJ
	2Z1tzBMYhWchGTULyahZSEbNQtKygJFlFaNkakFxbnpusmGBYV5quV5xYm5xaV66XnJ+7iZG
	cFRpaexgvDf/n94hRiYOxkOMEhzMSiK8Uu+b04R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGs6Y
	nSIkkJ5YkpqdmlqQWgSTZeLglGpgulX6Vr1x0o3fqakfxHlr3+rOf8h6sDIhIOCzNQu7yr6D
	HNJqsUu2Oyb7b/4j7TSDPzPAKCwqcLKcxd8XyRKZjOx9E58J/PqlcFc8seOj2QaT/94/ZNPt
	xCY/6DyhveypWd5lq9Zz4dn9mxdVelzNecJ08OlP79m5lTNMRMJTp5ky2UpwiSqKf20IFnS/
	kuFl5CSzN0ug9mEho5iqX5brqgIHfgMhKUs5Rp43MgUblq+5EsJazLl+0zPBuPRvASu8a2XK
	wtKrnVl7BMy77acu6hC9xGzP7nxDZW1v1bNC/1CuBevav9xTsj81M0iHReXW1evxzesWcD9M
	rq1za5l3bFW06IVV/3aobPDboMRSnJFoqMVcVJwIAGkruB0ZAwAA
X-CMS-MailID: 20240705090828epcas2p4d15b9c989c0705bca41534dc701b5da3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021200epcas2p273ca089c2cb9882f121e864ec8407367
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021200epcas2p273ca089c2cb9882f121e864ec8407367@epcas2p2.samsung.com>
	<20240705021110.2495344-3-sunyeal.hong@samsung.com>
	<8f4deb36-2a44-414a-9b9f-40b87bc7c949@kernel.org>
	<01c401daceb1$d64e7450$82eb5cf0$@samsung.com>
	<31778ed0-e4b5-4961-99a5-41ce44ddac26@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, July 5, 2024 5:52 PM
> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Sylwester Nawrocki'
> <s.nawrocki=40samsung.com>; 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Al=
im
> Akhtar' <alim.akhtar=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 2/5=5D dt-bindings: clock: add clock binding defini=
tions
> for Exynos Auto v920
>=20
> On 05/07/2024 10:03, sunyeal.hong wrote:
> >
> >> <form letter>
> >> Please use scripts/get_maintainers.pl to get a list of necessary
> >> people and lists to CC. It might happen, that command when run on an
> >> older kernel, gives you outdated entries. Therefore please be sure
> >> you base your patches on recent Linux kernel.
> >>
> >> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> >> people, so fix your workflow. Tools might also fail if you work on
> >> some ancient tree (don't, instead use mainline) or work on fork of
> >> kernel (don't, instead use mainline). Just use b4 and everything
> >> should be fine, although remember about =60b4 prep --auto-to-cc=60 if =
you
> >> added new patches to the patchset.
> >>
> >> You missed at least devicetree list (maybe more), so this won't be
> >> tested by automated tooling. Performing review on untested code might
> >> be a waste of time.
> >>
> >> Please kindly resend and include all necessary To/Cc entries.
> >> </form letter>
> >>
> >> Best regards,
> >> Krzysztof
> >
> > The mail list was created using get_maintainer.pl. If there is any
> problem, please let me know.
> >
> > ./scripts/get_maintainer.pl -f drivers/clk/samsung/
>=20
> That's not how you run the command. You ALWAYS (unless you are Linus) run
> it on the patches. ALWAYS. See submitting patches or numerous
> presentations how to contribute upstream.
>=20
> Read my form letter accurately, e.g. switch to b4.
>=20
> Best regards,
> Krzysztof

Thank you for your quick and kind response.
I checked the difference in the mail list through =22./scripts/get_maintain=
er.pl *.patch=22 and will reflect this.

Could you please answer additional questions I asked?
=22Is your request to combine PATCH 0 and 1 correct? If correct, I will upd=
ate it as requested.=22

The reason I'm asking this is that if you check checkpatch.pl, it says to c=
lassify patches as follows.
=22DT binding docs and includes should be a separate patch. See: Documentat=
ion/devicetree/bindings/submitting-patches.rst=22
PATCH0: Documentation/devicetree/bindings/clock/samsung,exynosautov920-cloc=
k.yaml
PATCH1: include/dt-bindings/clock/samsung,exynosautov920.h

Thanks,
Sunyeal Hong


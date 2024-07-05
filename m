Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5861474D9
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173192; cv=none; b=ZFI/hWtgRbjSuV5FdMo8sThIFTmaQ+6wwKBeFr9dKY3P/sqv08XVYFqaCYs6XbURtBCh2EzAwzhWom5SgF7Bc7q6ixx09ICDXbYy4GeGYzVNMAsfyvTWuPKFH9P1/YQl3Y0giQOAjro7lHFqnfugvqR+iBPTW4nTGc6Jgp9/OqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173192; c=relaxed/simple;
	bh=gkIoNoglImTU5a4kL+ypTiRGc8Me8o6W41PPS4X0ppM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=QimyU+7DuQEhSAv/EnQyFqFkTwfpAoxFfxhzimflo9VzVXRJBdNyXCVPtn9g4ux8prBh49d1+5PKUEsat2YLkhMfTVfu5EhK1GdAD9whZ3Vub7/zfbi4URawsMPc4EMzUWY9D8GkZ9CQLAXS8zLA5D01xBE8eLXOP5TLgi4TwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HoUQRVML; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HoUQRVML"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240705095308epoutp018f0b7bb942beb7db437b318f9871707f~fSGazl-uq0930409304epoutp01I
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:53:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240705095308epoutp018f0b7bb942beb7db437b318f9871707f~fSGazl-uq0930409304epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720173188;
	bh=jDPUsjAZfeqy7owxHICkfWrkMsfVA2wmXGVodNBEjBM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HoUQRVMLLPHMLch5fIsIiMvyl8KXJ5w5jUeNkiHr69qHm+q0GvsaR3XM0DLPljQTb
	 6GdYpohO/NL+Y3rHE007HapByjpfxt6O9s6Br6EyFbPvVWNuHVJdomWFbhAMViYcV4
	 A5vgQwQKjHnluBecgSrlbG/GOza4Lc/v0owD63Es=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240705095307epcas2p19ac6717bb907e401d697118b205272b2~fSGZqMtoS2653426534epcas2p1o;
	Fri,  5 Jul 2024 09:53:07 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WFpjb0QkBz4x9Q3; Fri,  5 Jul
	2024 09:53:07 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	6E.62.09485.282C7866; Fri,  5 Jul 2024 18:53:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240705095305epcas2p3fce57ce2102833831fde6504a7d0daf4~fSGYXaN6X0884408844epcas2p3k;
	Fri,  5 Jul 2024 09:53:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705095305epsmtrp2045d55e6cd0d1f328c981dbaa53bd4b7~fSGYWwIHt1361513615epsmtrp2J;
	Fri,  5 Jul 2024 09:53:05 +0000 (GMT)
X-AuditID: b6c32a46-19bfa7000000250d-91-6687c2824034
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	84.49.29940.182C7866; Fri,  5 Jul 2024 18:53:05 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705095305epsmtip208b95c24991d3e8fa9cf4a74e402122d~fSGYH2Ymf1486114861epsmtip2v;
	Fri,  5 Jul 2024 09:53:05 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <33a454e5-8a74-4e8b-9284-7b628a1a548b@kernel.org>
Subject: RE: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v920
Date: Fri, 5 Jul 2024 18:53:05 +0900
Message-ID: <01d501dacec1$220c91b0$6625b510$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPebKt0SL2hL1PGxWEYogtVpy49QFdVAxIAswtgRoBIrCNyQH2oTjfAipr0poCSAiPPgEn8N9NsRekI5A=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmmW7TofY0g/MNNhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sDpwe72+0sntsWtXJ5tG3ZRWj
	x+dNcgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6Z
	OUCnKCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0M
	jEyBChOyM959nM9SsFi+4uuj36wNjFckuxg5OSQETCRePHrB2MXIxSEksINRYnHfIhYI5xOj
	ROuFg0wQzjdGidezJzPBtDSuP84MkdjLKHHw8A6oqpeMEu9unGYFqWIT0JdY3X2bDSQhItDP
	JDHv+Q+wBLNAmsSKU1vYQWxOATuJrecWMYLYwgKJEtM/TAGrYRFQkZh5tQNoBQcHr4ClxLM1
	ESBhXgFBiZMzn7BAjJGX2P52DjPERQoSP58uA2sVEUiSOLC8gw2iRkRidmcb2KUSAgs5JM4e
	7oJqcJHY8qebEcIWlnh1HOIeCQEpic/v9rJB2PkSk6+/ZYJobmCUuPavG6rZXmLRmZ/sIMcx
	C2hKrN+lD2JKCChLHLkFdRufRMfhv+wQYV6JjjYhiEY1iU9XLkMNkZE4duIZ8wRGpVlIPpuF
	5LNZSD6YhbBrASPLKkax1ILi3PTUYqMCI3hsJ+fnbmIEJ1Mttx2MU95+0DvEyMTBeIhRgoNZ
	SYRX6n1zmhBvSmJlVWpRfnxRaU5q8SFGU2BQT2SWEk3OB6bzvJJ4QxNLAxMzM0NzI1MDcyVx
	3nutc1OEBNITS1KzU1MLUotg+pg4OKUamPztlhxrfmfaIfA//ZH61m87Jv5LVHu36Pu09f/8
	RO7w3n7QlbUkX/7Rs+TyjjslF61Xbvq8//uZj/reBqdEsw9LCjjY9J6Sa60+VfQycaXIjqOX
	TBaJ18XsUytPa9vuutHc/tc851Z7tZySpEs/8pzbdeIi3u3XVDK6I1Qj85HL51+obrKg/au3
	m63+TXC4e1BiyfnTvKyNM36e1nzonKT6N8A8fuESjv3MzTeeSlZof89Lb9+7ZvXU9ltfst59
	mnb65lJhl7alQV9metV89v7+/kZK5M2V57QippYtnVI4PfjgmgfvOdcpaOcvbyz70HfgZaZS
	0pVlhj+SGIPTH++9e3EN+5PfSdeXe5w68UldiaU4I9FQi7moOBEAU4wIey8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42LZdlhJXrfxUHuawewtxhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sDpwe72+0sntsWtXJ5tG3ZRWj
	x+dNcgEsUVw2Kak5mWWpRfp2CVwZ7z7OZylYLF/x9dFv1gbGK5JdjJwcEgImEo3rjzN3MXJx
	CAnsZpQ49qqHESIhI7Gx4T87hC0scb/lCCtE0XNGiebWOSwgCTYBfYnV3bfZQBIiApOZJK4e
	W8sGkmAWyJA4dO09G0THdmaJp5dawUZxCthJbD23CGgFB4ewQLxE71N7kDCLgIrEzKsdzCBh
	XgFLiWdrIkDCvAKCEidnPmGBGKkt8fTmUyhbXmL72znMEMcpSPx8uowVxBYRSJI4sLwD6gQR
	idmdbcwTGIVnIRk1C8moWUhGzULSsoCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4m
	RnBcaWnuYNy+6oPeIUYmDsZDjBIczEoivFLvm9OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ84q/
	6E0REkhPLEnNTk0tSC2CyTJxcEo1MJ1YnBzU2OTd52RyV2fLqrzNEr2PfE9fvjBjsaAa1+XU
	vNUulTl5G2xM0ya+r9ha9LTiR7b85UNfTMxWGzDW2vba9OYffiwga3PywtMQJj9OP93QWYWt
	VZJH57PI7J87+3zD6SPK18tOFNbPPjvp8UrTtRYvt6mK9Lyavrj80JrWui+Xr19YE80Xv4Hx
	Cq9Y0ymZo49dBTUO9ZoxvUiqPi3p1rTn1tRIcfEruWUFF97+XSUeLSjFzPuLSfkdzyKze88u
	zei4Ev99w4o7v6PvT1c13vz574d4V86llY5WCnvUrbWPsvaZON3yNEpJnRz0M7LjQOnlSzpK
	X87ZfT7eM9H548UJT5aHqD94KaE055cSS3FGoqEWc1FxIgAwF7DJGgMAAA==
X-CMS-MailID: 20240705095305epcas2p3fce57ce2102833831fde6504a7d0daf4
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
	<01c601daceba$e5d32570$b1797050$@samsung.com>
	<33a454e5-8a74-4e8b-9284-7b628a1a548b@kernel.org>

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Friday, July 5, 2024 6:13 PM
> To: sunyeal.hong <sunyeal.hong@samsung.com>; 'Sylwester Nawrocki'
> <s.nawrocki@samsung.com>; 'Chanwoo Choi' <cw00.choi@samsung.com>; 'Alim
> Akhtar' <alim.akhtar@samsung.com>; 'Michael Turquette'
> <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
> for Exynos Auto v920
> 
> On 05/07/2024 11:08, sunyeal.hong wrote:
> > Hello Krzysztof Kozlowski,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Friday, July 5, 2024 5:52 PM
> >> To: sunyeal.hong <sunyeal.hong@samsung.com>; 'Sylwester Nawrocki'
> >> <s.nawrocki@samsung.com>; 'Chanwoo Choi' <cw00.choi@samsung.com>;
> >> 'Alim Akhtar' <alim.akhtar@samsung.com>; 'Michael Turquette'
> >> <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>
> >> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> >> linux- kernel@vger.kernel.org
> >> Subject: Re: [PATCH 2/5] dt-bindings: clock: add clock binding
> >> definitions for Exynos Auto v920
> >>
> >> On 05/07/2024 10:03, sunyeal.hong wrote:
> >>>
> >>>> <form letter>
> >>>> Please use scripts/get_maintainers.pl to get a list of necessary
> >>>> people and lists to CC. It might happen, that command when run on
> >>>> an older kernel, gives you outdated entries. Therefore please be
> >>>> sure you base your patches on recent Linux kernel.
> >>>>
> >>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list
> >>>> of people, so fix your workflow. Tools might also fail if you work
> >>>> on some ancient tree (don't, instead use mainline) or work on fork
> >>>> of kernel (don't, instead use mainline). Just use b4 and everything
> >>>> should be fine, although remember about `b4 prep --auto-to-cc` if
> >>>> you added new patches to the patchset.
> >>>>
> >>>> You missed at least devicetree list (maybe more), so this won't be
> >>>> tested by automated tooling. Performing review on untested code
> >>>> might be a waste of time.
> >>>>
> >>>> Please kindly resend and include all necessary To/Cc entries.
> >>>> </form letter>
> >>>>
> >>>> Best regards,
> >>>> Krzysztof
> >>>
> >>> The mail list was created using get_maintainer.pl. If there is any
> >> problem, please let me know.
> >>>
> >>> ./scripts/get_maintainer.pl -f drivers/clk/samsung/
> >>
> >> That's not how you run the command. You ALWAYS (unless you are Linus)
> >> run it on the patches. ALWAYS. See submitting patches or numerous
> >> presentations how to contribute upstream.
> >>
> >> Read my form letter accurately, e.g. switch to b4.
> >>
> >> Best regards,
> >> Krzysztof
> >
> > Thank you for your quick and kind response.
> > I checked the difference in the mail list through
> "./scripts/get_maintainer.pl *.patch" and will reflect this.
> >
> > Could you please answer additional questions I asked?
> > "Is your request to combine PATCH 0 and 1 correct? If correct, I will
> update it as requested."
> >
> > The reason I'm asking this is that if you check checkpatch.pl, it says
> to classify patches as follows.
> > "DT binding docs and includes should be a separate patch. See:
> Documentation/devicetree/bindings/submitting-patches.rst"
> > PATCH0:
> > Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.y
> > aml
> > PATCH1: include/dt-bindings/clock/samsung,exynosautov920.h
> 
> Separate from the drivers, not from each other! This does not make sense
> to keep them separate.
> 
> Of course they must be squashed, I asked this in the first comment.
> 
> Best regards,
> Krzysztof
> 

Okay. I understand your comment. I will revise it and upload it again.

Thanks,
Sunyeal Hong


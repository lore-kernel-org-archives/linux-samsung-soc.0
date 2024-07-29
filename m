Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476E823D1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 02:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722221299; cv=none; b=RKyU/oExIxZYktMda0RtaPD9nz394QZQGgg1jdpTNbNqj8KbN9KvgqA7FnbMRtTsWEIhgK7tbMHMOipPiVEcYxFV3dsQ32MG0tmLjX7UyjOJ8aOjmhZgd8SduXg2hi+6TWbguMdd0XRMgdXnq3bxENnb0DYKtBpFeCi2JQzIZQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722221299; c=relaxed/simple;
	bh=e33iFarLhq+ziF884+6pXATdP/GE8cdvsdDnGYSoH0I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=YbJjsoHIrPseliTMK1Ct8tpW3qajnXPtZaCGxQ2W5sNt0Dc0jW/AHA5N/tvHMjtwZl42B3MlybG+1ct/G3NrvM6fRfBfjE7TPJG4U0yi47RgUqaIr1z5UDBRS5v7Ejda0AYMsp37UYj15RKQh/qbWHyRDOmeGfsOKZld0VMWOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gUeFZmXg; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gUeFZmXg"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240729024809epoutp014f7221625275441617266cf72eec02e5~mjyNPSAgT1646216462epoutp013
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 02:48:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240729024809epoutp014f7221625275441617266cf72eec02e5~mjyNPSAgT1646216462epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722221289;
	bh=8tFWYUaXay1WYFHtRctd+7qqBQn86k9pzYblNOScSHg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=gUeFZmXgqgPsbFOtlOMfaR9zy/n4Ua9o9M506Vsw/rkfqkuz3Th9539c7+cVeuEKD
	 ShUQHbKPphr20/ZLJlzJs/qxs8wvEHE1c4s0H7WZ5s1Jw7Y5hQZCR9SqtTN8AlrI4x
	 cdj3loVlJbW31hMagreZs8GTaVUPBlgemaCTYrQ4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240729024808epcas2p484be1bd8fa3d86fb65795643cd7e7da4~mjyM1CtsA2344623446epcas2p4g;
	Mon, 29 Jul 2024 02:48:08 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WXN8824Pyz4x9Pw; Mon, 29 Jul
	2024 02:48:08 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	50.AB.10431.8E207A66; Mon, 29 Jul 2024 11:48:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240729024807epcas2p429186935da601de2cfcb849d50c22fc8~mjyL3OhgD2344623446epcas2p4e;
	Mon, 29 Jul 2024 02:48:07 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240729024807epsmtrp2f5a5df95ca12f53cf4e15e447015746c~mjyL2c2MV1603616036epsmtrp2U;
	Mon, 29 Jul 2024 02:48:07 +0000 (GMT)
X-AuditID: b6c32a45-ffffa700000028bf-9c-66a702e8a711
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5D.0D.07567.7E207A66; Mon, 29 Jul 2024 11:48:07 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240729024807epsmtip2649936c2475b274441c5ffaf01f58257~mjyLj3i9d0548105481epsmtip2c;
	Mon, 29 Jul 2024 02:48:07 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Rob Herring'"
	<robh@kernel.org>
Cc: "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <09d31a95-813d-46e6-be11-421ca4f93f7b@kernel.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Mon, 29 Jul 2024 11:48:07 +0900
Message-ID: <003801dae161$bdc48060$394d8120$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIfj46DASLmYXQCkOemkQII707mAaDCc8MCEkcIaAFr8TEUAoKtsZ4CN02U2gIuBEaRAeXYeWQCDUCQoQGZ4HN/r6x1XCA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmme4LpuVpBm0LeSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
	eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
	JbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ0xefZy1YpVbx5/wf9gbGGfJdjJwc
	EgImEkdnz2EBsYUEdjBKNF2shbA/MUrcfVjTxcgFZH9jlJhzejZQEQdYw8351RDxvYwSbds2
	skE4Lxkl/n9/yw7SzSagL7G6+zYbiC0iECSxbdsaFpAiZoFdzBI9u7uZQRKcAnYSqz88YQWx
	hQXCJLbO6GAEsVkEVCUatn5iBdnGK2Ap8XJ3GEiYV0BQ4uTMJ2CXMgtoSyxb+JoZ4gMFiZ9P
	l7GCzBcR6GKUOPRsBzNEkYjE7M42qKITHBK7X2tA2C4S3Y1n2SBsYYlXx7ewQ9hSEp/f7YWK
	50tMvv6WCWSohEADo8S1f91Qg+wlFp35yQ5yHLOApsT6XfqQUFGWOHIL6jY+iY7Df9khwrwS
	HW1CEI1qEp+uXIYaIiNx7MQz5gmMSrOQfDYLyWezkDwwC2HXAkaWVYxiqQXFuempxUYFhvCo
	Ts7P3cQITrtarjsYJ7/9oHeIkYmD8RCjBAezkghv/JWlaUK8KYmVValF+fFFpTmpxYcYTYFB
	PZFZSjQ5H5j480riDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0tSC2C6WPi4JRqYGo8
	WNlaoanpocqx3o7x9uO8Q6sPSypeLW177cu9qOHmkS2879vDJdtf7r/29eud/Tlz6r14dJS3
	yjh8eC335s0i9/ytR+r/XUztPvi++orE8q8TCpNnyC9fdotn+ulQ076yPL00mdtl2y2/JB0y
	yT0+6Wr9VVkdU6/Y4/8OumXOd+NLOHPll/eq/h2zXzG5paRnvT6s87MndmKQreOza4VJajVT
	yyXjEufKWnhcN1xg+e31uxxH+6Vtk4zWBieYfTmV8G2V3sHoY3mLPNbyHnnTpMiiYGx1s0lv
	51IO4w87+NlOLPN+9FTMTvbVpMVBCn/PiX93NL+a7GS79O0EIbeOiXpNb4r+pU3ce8I5TliJ
	pTgj0VCLuag4EQD8+YKGRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSvO5zpuVpBhf+aFg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBknuo4yFpxR
	rbg/7xxbA+M2uS5GDg4JAROJm/Oruxi5OIQEdjNK9Ky+wNjFyAkUl5HY2PCfHcIWlrjfcoQV
	oug5o8TbQ2vBEmwC+hKru2+zgdgiAkES2/4/AitiFjjELPGjbzILSEJI4AKrxJwbOSA2p4Cd
	xOoPT1hBbGGBEInJi1qZQGwWAVWJhq2fWEEu4hWwlHi5OwwkzCsgKHFy5hOwMcwC2hK9D1sZ
	YexlC18zQxynIPHz6TKwvSICXYwSh57tYIYoEpGY3dnGPIFReBaSWbOQzJqFZNYsJC0LGFlW
	MUqmFhTnpucmGxYY5qWW6xUn5haX5qXrJefnbmIEx6GWxg7Ge/P/6R1iZOJgPMQowcGsJMIb
	f2VpmhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFewxmzU4QE0hNLUrNTUwtSi2CyTBycUg1MN+qc
	Wk7ENjSqpKrEnN8cPffFhBk1v3fVRjFXhG2bFVJ1cElZ3f+NwU83FIpX/Ps1n0Gn56oT37Lc
	k5WJazxX+ZTHij00y7kcw7Fwy5mPex7yfNtxnm35Qs6W03darCS2lS2bv5hl4paKTX8yuQpq
	tZWv75m4m8m4OinkrofYK4mCjOUlP6W7a6Oqd2VfORB++/XXLIX+jokH+3a+XrpCdZobzyyL
	vV1FlytyP/J93hjs4jfvuaP9vQ3ismKLWCJ63Ut/vr18KIdjecp68yUqaXvtWp252tTc/++a
	Zc87o+bfn88bFhtkv74XcVIh4vovcfnOdQaKtirhberTexb8OPxnh97uY73Xur3+bI5gUGIp
	zkg01GIuKk4EAAG167QyAwAA
X-CMS-MailID: 20240729024807epcas2p429186935da601de2cfcb849d50c22fc8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>
	<20240722223333.1137947-2-sunyeal.hong@samsung.com>
	<20240723205714.GA1093352-robh@kernel.org>
	<035501dade31$55cc7f40$01657dc0$@samsung.com>
	<03b201dade3f$3d66e3b0$b834ab10$@samsung.com>
	<bf6cd1c9-d60a-4ef1-89f3-5d28e003ce2d@kernel.org>
	<03ef01dade5c$ce407820$6ac16860$@samsung.com>
	<8ee739e7-8405-49d7-93f8-f837effe169b@kernel.org>
	<9647f1b5-9f34-42f0-b7b9-56ad9708855b@kernel.org>
	<041b01dade62$5861b2d0$09251870$@samsung.com>
	<e31a69d9-0cdb-4e5f-9227-c7790538f55d@kernel.org>
	<041c01dade67$5842edf0$08c8c9d0$@samsung.com>
	<09d31a95-813d-46e6-be11-421ca4f93f7b@kernel.org>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, July 25, 2024 4:56 PM
> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Rob Herring'
> <robh=40kernel.org>
> Cc: 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Chanwoo Choi'
> <cw00.choi=40samsung.com>; 'Alim Akhtar' <alim.akhtar=40samsung.com>; 'Mi=
chael
> Turquette' <mturquette=40baylibre.com>; 'Stephen Boyd' <sboyd=40kernel.or=
g>;
> 'Conor Dooley' <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.o=
rg;
> linux-clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v4 1/4=5D dt-bindings: clock: add ExynosAuto v920 S=
oC
> CMU bindings
>=20
> On 25/07/2024 09:50, sunyeal.hong wrote:
> > Hello Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Thursday, July 25, 2024 4:32 PM
> >> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Rob Herring'
> >> <robh=40kernel.org>
> >> Cc: 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Chanwoo Choi'
> >> <cw00.choi=40samsung.com>; 'Alim Akhtar' <alim.akhtar=40samsung.com>;
> >> 'Michael Turquette' <mturquette=40baylibre.com>; 'Stephen Boyd'
> >> <sboyd=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>;
> >> linux-samsung-soc=40vger.kernel.org;
> >> linux-clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> >> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> >> Subject: Re: =5BPATCH v4 1/4=5D dt-bindings: clock: add ExynosAuto v92=
0
> >> SoC CMU bindings
> >>
> >> On 25/07/2024 09:14, sunyeal.hong wrote:
> >>> Hello Krzysztof,
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >>>> Sent: Thursday, July 25, 2024 3:41 PM
> >>>> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Rob Herring'
> >>>> <robh=40kernel.org>
> >>>> Cc: 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Chanwoo Choi'
> >>>> <cw00.choi=40samsung.com>; 'Alim Akhtar' <alim.akhtar=40samsung.com>=
;
> >>>> 'Michael Turquette' <mturquette=40baylibre.com>; 'Stephen Boyd'
> >>>> <sboyd=40kernel.org>; 'Conor Dooley' <conor+dt=40kernel.org>;
> >>>> linux-samsung-soc=40vger.kernel.org;
> >>>> linux-clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm=
-
> >>>> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> >>>> Subject: Re: =5BPATCH v4 1/4=5D dt-bindings: clock: add ExynosAuto v=
920
> >>>> SoC CMU bindings
> >>>>
> >>>> On 25/07/2024 08:37, Krzysztof Kozlowski wrote:
> >>>>>>   then:
> >>>>>>     properties:
> >>>>>>       clocks:
> >>>>>>         items:
> >>>>>>           - description: External reference clock (38.4 MHz)
> >>>>>>           - description: CMU_MISC NOC clock (from CMU_MISC)
> >>>>>>
> >>>>>>       clock-names:
> >>>>>>         items:
> >>>>>>           - const: oscclk
> >>>>>>           - const: noc
> >>>>>>
> >>>>>> If there is anything I misunderstand, please guide me.
> >>>>>>
> >>>>>
> >>>>> You did not address my questions at all instead just copied again
> >>>>> the same. It is not how it works.
> >>>>>
> >>>>> I am not going to discuss like this.
> >>>>
> >>>> And in case it is still unclear - just look at your bindings and DTS=
.
> >>>> They say you have three clocks=21
> >>>>
> >>>> Best regards,
> >>>> Krzysztof
> >>>>
> >>>
> >>> Let me answer your questions first.
> >>> In the existing V4 patch, clock items were declared in if then for
> >>> each
> >> block, so there was no problem.
> >>
> >> No. Again, look at your binding and DTS.
> >>
> >> 1. What clocks did you define for cmu-top?
> > Cmu-top has one clock(oscclk).
> >> 2. What clocks did you define for cmu-peric0?
> > Cmu-peric0 has three clocks(oscclk, noc and ip)
> >>
> >> Rob's advice is reasonable and you must follow it, unless you are not
> >> telling us something. There is no other choice, no other compatibles,
> >> no other devices.
> >>
> > Yes, that's right. In this patch, modifications are possible according
> to Rob's review.
> >>> If modified according to Rob's comment, problems may occur as the
> >>> input
> >> clock is configured differently for each block.
> >>
> >> But it is not=21 Look at your binding.
> > The reason I mentioned this was to ask how to handle problems that may
> occur when adding cmu for a new block in a new patch.
> > As you mentioned, this issue does not exist in this patch.
>=20
> A new block? And how do we know about it? Bindings are supposed to be
> complete. We see bindings and you receive review.
>=20
> Post complete bindings.
>=20
> Best regards,
> Krzysztof
>=20

I understand your intention. I will re-upload the patch based on Rob's revi=
ew based on the current patch.

Best regards,
sunyeal


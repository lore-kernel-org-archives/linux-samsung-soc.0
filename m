Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799516F859
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721891704; cv=none; b=WdIVggbIlOiSUcuCbJTR6n3/5xUaz6MUnjQ3W9nv4P6h7a//JT8S1hP/x2BGJ9oPmIoZuoYHzPr1fBl4GfNxt4RzCtY6nXnH2ciWn75uCsZc8ufSTZ7eC5SrhUjSHEeI7WFfpQUDn30uNs0a7lzIMBXD4WEcdwdSWSvqlRRjmc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721891704; c=relaxed/simple;
	bh=UdgqSHS409D1rofviHHAOQHQWR4JYhERIscY+LUJNY8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Xv0XOARlaUIazzHJi46KMZU2ICLqXRZa1DJ1SZCHnp5gA2bXQRT1bEzhFnfz2HXW6W+iFLOnkL5mFCU9Ad+SJvYnssbBltp4mnkZB6DLujLNMajQ0uYiAXLqSV3FoxAEK9rvysTQFmHME7dDtHvnMoVpJgTvZjFiNsIn07g+qgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KsXXub12; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KsXXub12"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240725071455epoutp03104b1f1488fc380d598190b65f22bab6~lY1_wktBW2518225182epoutp03K
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:14:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240725071455epoutp03104b1f1488fc380d598190b65f22bab6~lY1_wktBW2518225182epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721891695;
	bh=T1pST/qs6/biy6dUmAy2u7uPzcT5nWxyTZbj3XUrC7A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KsXXub12QPkan1ozvly1V69oN6Hwd1O5A3dypWf0XNEQJxkqMOBbvDKYdMz9YqqJY
	 K5GQxWldtGmcbgZgx4xgjnr7wp0wIC0kpSh0JXcBIqI35Ax1BPUFoTtJIQXOVRI6qX
	 FTqqHNbGzKlEAZy3XLGojVq8QTeQqieOawYdGB+U=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240725071454epcas2p1bbad7209cda5d174e1e7fdadb01a2c68~lY1_R4cWE0658906589epcas2p1T;
	Thu, 25 Jul 2024 07:14:54 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.90]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WV2Fp0dRYz4x9Pw; Thu, 25 Jul
	2024 07:14:54 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	86.52.10066.D6BF1A66; Thu, 25 Jul 2024 16:14:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240725071453epcas2p27007de4ad8fc01b93fa05a5446706d3e~lY19PgY0o0571805718epcas2p2N;
	Thu, 25 Jul 2024 07:14:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240725071453epsmtrp14c074403ce791f9f2f66b0f230e27fb1~lY19ObSIe1832118321epsmtrp1H;
	Thu, 25 Jul 2024 07:14:53 +0000 (GMT)
X-AuditID: b6c32a46-4b7fa70000002752-0b-66a1fb6d4cbc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.0F.08964.D6BF1A66; Thu, 25 Jul 2024 16:14:53 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725071453epsmtip203bcedd8916ffcb66de7ec00d6b7356a~lY19AVCva0881408814epsmtip2-;
	Thu, 25 Jul 2024 07:14:53 +0000 (GMT)
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
In-Reply-To: <9647f1b5-9f34-42f0-b7b9-56ad9708855b@kernel.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Thu, 25 Jul 2024 16:14:53 +0900
Message-ID: <041b01dade62$5861b2d0$09251870$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIfj46DASLmYXQCkOemkQII707mAaDCc8MCEkcIaAFr8TEUAoKtsZ4CN02U2q/kTupA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmqW7u74VpBkcOWlk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzXmxdxFxwjL9i6uSfrA2MU3i6GDk5
	JARMJD5/283YxcjFISSwg1HiWudeKOcTo0Tj/VMsEM43RolzC7aywrR0Tm9ngkjsZZTYPXk5
	lPOSUaLnRwcjSBWbgL7E6u7bbCC2iECQxLZta8BGMQvsYpbo2d3NDJLgFLCTmHDpCViRsECY
	xNYZEM0sAqoSZ2bPBYvzClhK9J5ZAmULSpyc+YQFxGYW0JZYtvA1M8RJChI/ny5jhViWJ3Hl
	wQpmiBoRidmdbcwgiyUEDnBIrLlxlx2iwUWi8/8cJghbWOLV8S1QcSmJl/1tUHa+xOTrb5kg
	mhuAQfOvG2qbvcSiMz+BijiANmhKrN+lD2JKCChLHLkFdRufRMfhv+wQYV6JjjYhiEY1iU9X
	LkMNkZE4duIZ8wRGpVlIPpuF5LNZSD6YhbBrASPLKkax1ILi3PTUYqMCI3h0J+fnbmIEp18t
	tx2MU95+0DvEyMTBeIhRgoNZSYR32f2FaUK8KYmVValF+fFFpTmpxYcYTYFhPZFZSjQ5H5gB
	8kriDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0tSC2C6WPi4JRqYLqTkVcl1O+w/o6D
	z3slC+mK9ZcSYk4larF+2OYmYClvlRWq+9PGJE4ne6vX4oaSlAqntMev7tbx/ImYsyfCwEHG
	eL1Kz663xxxysqruvo7unXxli+uZJVecA5L8bafN9/qR3bz5x0GrlZNKvZoPzV2sulvxmLLN
	7Z3R7ZWNtVHTYx5lnJRKezJv3vd6hngZXoELYjJOB3bkS2/frBhQ25H2XH+K+3KLG4uc1H01
	Doe2PLwefCVigcK6a4k2jm73X19t/bOoS+urL/OexxN5bnAZGyqy+BroF7G1Fpcl2ai/39yx
	3mrKQ1v18B5ziRBuGw/FiOjfvNql+p1yxl/il6R6uN8S3hP+o4kxTV+JpTgj0VCLuag4EQBA
	I3YTSAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSvG7u74VpBg+2Slo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBntk9ULlvNX
	nH0xh7mB8TN3FyMnh4SAiUTn9HamLkYuDiGB3YwSz9bNZ4RIyEhsbPjPDmELS9xvOcIKUfSc
	UaLj51dmkASbgL7E6u7bbCC2iECQxLb/j8CKmAUOMUv86JvMApIQEpjAInFyrwyIzSlgJzHh
	0hOwBmGBEInJi1qZQGwWAVWJM7PngsV5BSwles8sgbIFJU7OfAI2h1lAW6L3YSsjjL1s4Wtm
	iOsUJH4+XcYKcUSexJUHK5ghakQkZne2MU9gFJ6FZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5
	xYYFhnmp5XrFibnFpXnpesn5uZsYwXGopbmDcfuqD3qHGJk4GA8xSnAwK4nwLru/ME2INyWx
	siq1KD++qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QD04XnmnO1pt06f7Du
	DaP8rd+ia3MsUxI/zzK/tHmh107lfiXew1t1Ps7SVgxtUxCvM9c7ymLkeJWFg2npvQ+T9VfO
	MXDYu9VbwOnz/pnLf0bUhu2be8rtDOvZi9UiYrMmLMnc+MBH5uWFVmbuZxd+P90c7puk96ft
	kZzOnY0MCyy4BU7o1nuZ71NqYcktC58tsPF+6JNnYk+q30Xse5N2+tjz9gjFIMVT8eymck0i
	/d/tTl9azFv2z/rcxYUHX61Xm/L2o9jWuOtL3ZpvvAox+Max5bPE0oSOTb6y73zWTZnvN9tf
	88H5nJeHbk6zzi2t+ZZ/Ksb30IGoTC9eqbvJav9Zv2pHNP6dYrBS22CCkIwSS3FGoqEWc1Fx
	IgBlEeyNMgMAAA==
X-CMS-MailID: 20240725071453epcas2p27007de4ad8fc01b93fa05a5446706d3e
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

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, July 25, 2024 3:41 PM
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
> On 25/07/2024 08:37, Krzysztof Kozlowski wrote:
> >>   then:
> >>     properties:
> >>       clocks:
> >>         items:
> >>           - description: External reference clock (38.4 MHz)
> >>           - description: CMU_MISC NOC clock (from CMU_MISC)
> >>
> >>       clock-names:
> >>         items:
> >>           - const: oscclk
> >>           - const: noc
> >>
> >> If there is anything I misunderstand, please guide me.
> >>
> >
> > You did not address my questions at all instead just copied again the
> > same. It is not how it works.
> >
> > I am not going to discuss like this.
>=20
> And in case it is still unclear - just look at your bindings and DTS.
> They say you have three clocks=21
>=20
> Best regards,
> Krzysztof
>=20

Let me answer your questions first.
In the existing V4 patch, clock items were declared in if then for each blo=
ck, so there was no problem.
If modified according to Rob's comment, problems may occur as the input clo=
ck is configured differently for each block.

I think it would be better to keep the bindings in v4 patch form like the e=
xisting exynos models.

Thanks for your comment.

Best regards,
Sunyeal



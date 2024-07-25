Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116472746C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721893847; cv=none; b=rgAK8QysUfYk3APaROM0nV2tocQ6+46aofRp1YW8RdU8RTq8B2BiqBtcQE8E0zDJi/sio85wCXrIQVkwF1anAYhAZPpr7Igy6jnRpX0orHhy8dDqraYQoLWcIJayLebB5rLP0nmvwBgdlpG47EMlO27kB4I5P88C5LmeC1hHxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721893847; c=relaxed/simple;
	bh=MpLLcIoMjvz6qyeHcK8mfJJxsXD0M7zx+boMR8ui4Qo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Cb4ENOSkDlA30x3sm5WZInRqvKzCrsQaxd6HfeawjYWh1vkZsKXKnrbdDWB9MCQJoT/g5WymCFw5hvsDyJcEnfWNa//b9q8Ab9cVbjHWTEaJyHQpjPk8f+vNZm9hsxLci+jJtIcO/FQfGihKkhPtd0gU2XO1V5kF0wkuCMS2K/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Slf2qSx8; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Slf2qSx8"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240725075042epoutp0337103d019c2931295b0bc9f3c7ba7d7b~lZVOo8QhQ2717127171epoutp03J
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:50:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240725075042epoutp0337103d019c2931295b0bc9f3c7ba7d7b~lZVOo8QhQ2717127171epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721893842;
	bh=gsUbrFDZtkXNtpJ5/apzdSh7XMteIrGbilUA+8qguvM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Slf2qSx8+IIopunIRYAhKMZsUuOHURnmowVhN22HvhKNICoTNZUihtAkSfYL32LAV
	 cs5wdI3SaY9WGW0SIZq7qTPgRI6ZGsZcb78fFJYSU+zl644Ax3Hx+45OtxuZLZaPUd
	 nvxEmAJCfWdTW8fUHfMCmdkZ2+yFrevqZmKRmT2g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240725075042epcas2p2ed615256b0a62ae3a5f2cf8383f31d01~lZVOKfEXL2675126751epcas2p2M;
	Thu, 25 Jul 2024 07:50:42 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.92]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WV3352ykzz4x9Pq; Thu, 25 Jul
	2024 07:50:41 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	AD.89.19039.1D302A66; Thu, 25 Jul 2024 16:50:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240725075040epcas2p196c039f245eb036064f8699c92cfb8cc~lZVNGYnYb2849628496epcas2p1n;
	Thu, 25 Jul 2024 07:50:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240725075040epsmtrp25f017c4f6af966aba2f6f89949a86605~lZVNEvQJ61088210882epsmtrp2M;
	Thu, 25 Jul 2024 07:50:40 +0000 (GMT)
X-AuditID: b6c32a4d-36b9f70000004a5f-12-66a203d1ce3b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.44.08964.0D302A66; Thu, 25 Jul 2024 16:50:40 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240725075040epsmtip2dbc5dc2ce70cb8fe9c899e4dd2c2b604~lZVM0bJFa2940329403epsmtip2g;
	Thu, 25 Jul 2024 07:50:40 +0000 (GMT)
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
In-Reply-To: <e31a69d9-0cdb-4e5f-9227-c7790538f55d@kernel.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Thu, 25 Jul 2024 16:50:40 +0900
Message-ID: <041c01dade67$5842edf0$08c8c9d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlY5hu3bVCnsOExtpi/jJA6pOgwAIfj46DASLmYXQCkOemkQII707mAaDCc8MCEkcIaAFr8TEUAoKtsZ4CN02U2gIuBEaRAeXYeWSvw7ttYA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmme5F5kVpBv8P8Fs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzfjTOYC/4J13xYttBxgbGw2JdjJwc
	EgImEsv232fsYuTiEBLYwyhx7dsWJgjnE6PEzbMbWCCcb4wSzf2P2GFaFjT8ZIdI7GWUuDFh
	AlTVS0aJxZvuMYFUsQnoS6zuvs0GYosIBEls27YGrIhZYBezRM/ubmaQBKeAncSmzxtZQWxh
	gTCJrTM6GEFsFgFVie/3d4PZvAKWEnsfv2eHsAUlTs58wgJiMwtoSyxb+JoZ4iQFiZ9Pl7FC
	LKuTWLalHapGRGJ2ZxszyGIJgT0cEm8PbYX6wUXi8t9rrBC2sMSr41ug4lISn9/tZYOw8yUm
	X3/LBNHcAAyaf91Q2+wlFp0BBQAH0AZNifW79EFMCQFliSO3oPbySXQc/ssOEeaV6GgTgmhU
	k/h05TLUEBmJYyeeMU9gVJqF5LNZSD6bheSDWQi7FjCyrGKUSi0ozk1PTTYqMNTNSy2HR3ly
	fu4mRnAa1vLdwfh6/V+9Q4xMHIyHGCU4mJVEeJfdX5gmxJuSWFmVWpQfX1Sak1p8iNEUGN4T
	maVEk/OBmSCvJN7QxNLAxMzM0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQamVUpz
	HTMTu3PafypVHDizJ4izIp3J7w2HWeh822t8dutuNLNNFiqrqY66Nyu02fLlmubACczdNcr2
	2a8f516acVBEM3yjlNG9WumPDHc+AbWnvvqVflV3xduAkLUNJ3bH9neeZvF86sq/5QpvYmec
	kONSzvMLJ5hc1Eqv+rqwMzFEtettjMhMm90/TvzLeNC0vX7FmcTVswOZ9gnl+hrk2foEvm2e
	YRW+qdTlfdn3Z/c1ZFKPPiw2y1gwe/GrBuN/E9fzGt/8cFEi6mtKW9cHv8fL2TLLGVVbs9fW
	nG12lX294+3mJ13O1yWbn+kyT513Wkc9um423/ILbXlHmpYt9l1llFwdtFzoo5iKthJLcUai
	oRZzUXEiAPAXTthMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSvO4F5kVpBj8WaVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBmvvlxlLDgs
	XbH2+Vr2BsYmsS5GTg4JAROJBQ0/2bsYuTiEBHYzSizfdZMdIiEjsbHhP5QtLHG/5QgrRNFz
	Rondf3azgSTYBPQlVnffBrNFBIIktv1/BFbELHCIWeJH32QWiI4PLBIPZzUwgVRxCthJbPq8
	kRXEFhYIkZi8qBUsziKgKvH9/m5GEJtXwFJi7+P37BC2oMTJmU9YQGxmAW2J3oetjDD2soWv
	mSHOU5D4+XQZK8QVdRLLtrRD1YtIzO5sY57AKDwLyahZSEbNQjJqFpKWBYwsqxglUwuKc9Nz
	iw0LDPNSy/WKE3OLS/PS9ZLzczcxgmNRS3MH4/ZVH/QOMTJxMB5ilOBgVhLhXXZ/YZoQb0pi
	ZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJrEoiyXvmbcbuWcp
	sh9/dPFApfqbgnMZGnZLeB8mbavvM9X8JS/pxmW2dmXG9a9Zznt3/kw/NftccaLU36SH9SZH
	du38tPZeNeuN5DLjFBHZf87vDyqxqEhIGZgvldLsfriH6evE/LwtbitviGWvXT8vxaH6zHXV
	eI+mgzwV7O8Tlk8On/7cz3WarCPX6rXSH47rf5aQT5tiZh4aFbDLcdYZm7XB0/p9vCdbzzr5
	aMk0j40Z3+p97ux3S1/aWvBVPHG7WrZv69q6unuyiQt9pJjEGQ7FPGCqzDj+/Nh689Wz7Jni
	DeoZJjnMrt3IJbaro3bHmodfy/JT7r6afjP+yUvzT6GzZvyQiWdf4XjGUomlOCPRUIu5qDgR
	AEoz2I80AwAA
X-CMS-MailID: 20240725075040epcas2p196c039f245eb036064f8699c92cfb8cc
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

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Thursday, July 25, 2024 4:32 PM
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
> On 25/07/2024 09:14, sunyeal.hong wrote:
> > Hello Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Thursday, July 25, 2024 3:41 PM
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
> >> On 25/07/2024 08:37, Krzysztof Kozlowski wrote:
> >>>>   then:
> >>>>     properties:
> >>>>       clocks:
> >>>>         items:
> >>>>           - description: External reference clock (38.4 MHz)
> >>>>           - description: CMU_MISC NOC clock (from CMU_MISC)
> >>>>
> >>>>       clock-names:
> >>>>         items:
> >>>>           - const: oscclk
> >>>>           - const: noc
> >>>>
> >>>> If there is anything I misunderstand, please guide me.
> >>>>
> >>>
> >>> You did not address my questions at all instead just copied again
> >>> the same. It is not how it works.
> >>>
> >>> I am not going to discuss like this.
> >>
> >> And in case it is still unclear - just look at your bindings and DTS.
> >> They say you have three clocks=21
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > Let me answer your questions first.
> > In the existing V4 patch, clock items were declared in if then for each
> block, so there was no problem.
>=20
> No. Again, look at your binding and DTS.
>=20
> 1. What clocks did you define for cmu-top?
Cmu-top has one clock(oscclk).
> 2. What clocks did you define for cmu-peric0?
Cmu-peric0 has three clocks(oscclk, noc and ip)
>=20
> Rob's advice is reasonable and you must follow it, unless you are not
> telling us something. There is no other choice, no other compatibles, no
> other devices.
>=20
Yes, that's right. In this patch, modifications are possible according to R=
ob's review.
> > If modified according to Rob's comment, problems may occur as the input
> clock is configured differently for each block.
>=20
> But it is not=21 Look at your binding.
The reason I mentioned this was to ask how to handle problems that may occu=
r when adding cmu for a new block in a new patch.
As you mentioned, this issue does not exist in this patch.
>=20
>=20
> Best regards,
> Krzysztof

Best regard,
sunyeal


Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E01CBEA7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232645; cv=none; b=i5amOJAqw4mYGy+Gn5t5RB2qubpXY4oUOEE3cxuKAhGN2CXXeBzeiXOPr+HbyCqEkhbAgSXzTr7cVI34/q0YcoGieYmwFBiOwFmGNP0IiJsziwGwAdEo212/q0HicBny1pciIg2TH1w1r5m6GG7EDM1PNz71NjW05SRZnsPFmIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232645; c=relaxed/simple;
	bh=2PuRZJKFX+8h0wsjkRdFM+YPsqggo8jMLYDszFQP/bc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VIqllFnl4knrrl3KmfFlMcWH/k7mUv8PE6UX2kTSArJj1ONDP77squpwh/kQYgCDk0HvCWvY+Q+BPLhKGLqrNufJJgYFflVn7ttkZ1vILL63eJIh6JJchoUPLQ3u8m2sp/JNzMDgqndlnQsyPrDoxsjahPz/5mguzNBXneRArFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lufqcsL1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lufqcsL1"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240821093040epoutp024d92412ac26797d2605a72806a4af82a~ttHOKF07d0927209272epoutp02X
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 09:30:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240821093040epoutp024d92412ac26797d2605a72806a4af82a~ttHOKF07d0927209272epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724232640;
	bh=CxHZ2IhgFN32ZaNM/qm3PeYWoU6m4YH2ghNdcMmsBoA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lufqcsL17OHpldqG8bD85whP1L2G6GFvjQR9g6qb36N3S4gHNrzkbVovRrAZ5OG89
	 5X8JY5wCieY3qPQx/5ovWmuZhdajOyrd99oWeL6LkNAgSk7RHs9/Ew961fK2lWE346
	 9W3/EtABNRrMeuVdcrEdeMhhqHm3X1QBWU2j7ptg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240821093040epcas2p245fb6cafe86a41e66bc39e4b00f42d7c~ttHNw_NZL2681226812epcas2p2P;
	Wed, 21 Aug 2024 09:30:40 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Wpgzz59MTz4x9Pp; Wed, 21 Aug
	2024 09:30:39 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	39.C9.10431.FB3B5C66; Wed, 21 Aug 2024 18:30:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240821093039epcas2p390bf443819db218a0a94b424fece7961~ttHMxiScs1394613946epcas2p3q;
	Wed, 21 Aug 2024 09:30:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240821093039epsmtrp28b101ad940a3d663af57ea05db3a209b~ttHMwixhX0970509705epsmtrp2J;
	Wed, 21 Aug 2024 09:30:39 +0000 (GMT)
X-AuditID: b6c32a45-da1ff700000028bf-d7-66c5b3bf6441
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	89.D2.08964.EB3B5C66; Wed, 21 Aug 2024 18:30:38 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240821093038epsmtip201075943f081dfbd771ba19e1ed25993~ttHMehQTc2427824278epsmtip2U;
	Wed, 21 Aug 2024 09:30:38 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Kwanghoon Son'"
	<k.son@samsung.com>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo	Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <8a729db0-f587-42b6-8003-789091986324@kernel.org>
Subject: RE: [PATCH v6 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
Date: Wed, 21 Aug 2024 18:30:38 +0900
Message-ID: <0aa001daf3ac$c8a5bb40$59f131c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gCAc2uXAiz2ascBkCr+LgIuZJbKAN2O2QABhTlqKwKclZoJAbQXYwQCPTKgC6/ME8mA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmhe7+zUfTDJ71q1s8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWl3fNYbOYcX4fk8XFU64W//fsYLc4
	/Kad1eLftY0sDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM64ufgxS8E/kYqna64wNjD2
	CHYxcnJICJhIvL3yjBXEFhLYwSjx5WF4FyMXkP2JUeLa0xVMEM43RokZ7SuZYDp+ndzDCJHY
	yyjRMmsZM4TzklGi5/s9dpAqNgF9idXdt9lAEiICrcwSB588ZwFxmAXWMUpsnnkErIpTwE6i
	bW8bI4gtLBApcXE/hM0ioCrR9+8fmM0rYClxZ0sfC4QtKHFy5hMwm1lAW2LZwtfMEDcpSPx8
	uowVIi4iMbuzDSwuIpAn8WfxDbAnJAROcEjM3nsNKMEB5LhI/NorCtErLPHq+BZ2CFtK4vO7
	vWwQdr7E5OtvoXobgKHxrxtqmb3EojM/2UHmMAtoSqzfpQ8xUlniyC2o0/gkOg7/ZYcI80p0
	tAlBNKpJfLpyGWqIjMSxE8+YJzAqzULy2Cwkj81C8swshF0LGFlWMYqlFhTnpqcWGxUYwmM7
	OT93EyM4DWu57mCc/PaD3iFGJg7GQ4wSHMxKIrzdLw+mCfGmJFZWpRblxxeV5qQWH2I0BQb1
	RGYp0eR8YCbIK4k3NLE0MDEzMzQ3MjUwVxLnvdc6N0VIID2xJDU7NbUgtQimj4mDU6qBSa3D
	yue2YnGv/bfnKi0CG29MOvXq2ZfOG6+fzFPlX8oUHBlaFxnQbcPme7CR58Jv++9vK7vefnx1
	2yuv2X7at9U9mcePTpqy0+ngSWXzixfyddR7ftUw/vixImfuXav28rakt+HrVPx8Z6oLCx34
	kPdApn/x+2mrjMpWNUj/L2fYt+ahRdzx1syq7sMXNbkm7GWq+lV39L9QK+/ej5t2LKx4fuGt
	3Sk5jb/Hkp8u9H64OOIoy8vsNtczRyS2dZdf3LC5RbHszvmK+08PrZJtmz7xRbGaTyD3hFNV
	YW6Ni9do19g92LRNXtSjKU2j7M+Cv593rGU5+1NN7LRXYJDpjb2X93xRZcjWiVU0u3V82QQl
	luKMREMt5qLiRAB29iPoTAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO7+zUfTDCYqWTyYt43NYs3ec0wW
	1788Z7WYf+Qcq0XvmqtMFufPb2C32PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/9+xgtzj8
	pp3V4t+1jSwOfB7vb7Sye2xa1cnmsXlJvUffllWMHp83yQWwRnHZpKTmZJalFunbJXBlLH25
	mbHgkkjFpVOz2BsYbwh0MXJySAiYSPw6uYexi5GLQ0hgN6PE6ed/GCESMhIbG/6zQ9jCEvdb
	jrBCFD1nlGjqesMKkmAT0JdY3X2bDSQhItDNLPFo7S4mEIdZYBOjxLndN9kgWtaySPy4sZYN
	pIVTwE6ibW8b2A5hgXCJ01uOMoPYLAKqEn3//oHFeQUsJe5s6WOBsAUlTs58AmYzC2hL9D5s
	ZYSxly18zQxxn4LEz6fLWCHiIhKzO9vA4iICeRJ/Ft9gmsAoPAvJqFlIRs1CMmoWkvYFjCyr
	GCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCo1JLcwfj9lUf9A4xMnEwHmKU4GBWEuHt
	fnkwTYg3JbGyKrUoP76oNCe1+BCjNAeLkjiv+IveFCGB9MSS1OzU1ILUIpgsEwenVAPTtLWF
	G6RDNLdOU56hXHlikkeI27KA85b7arb0B60zX5X0NKFZV8A+89qD4/ITJZYKuN2c1KHlXzfD
	+oytxZxpCjtZlgpmKcevErFlrv9udjWOs+mkXWne8Qur/poy3rpstGda7Af9vtbefQ6iRvNO
	H798Zcvetaf7nx+xebX0Ww+PWbfSprp2+0Jz3oh0l5wIzXVKwm8X7ve+EV/8XnHKJTeTawvk
	ch9Kl/dlTGlI8c9RNbppc3fyudhX7/W+r19Q9MPj6Kk/Hs83dM7eq2E8wfEZU/H5fyLZb2Nf
	bJyzs5avyMtw5yzZ98LPL8z73eJrbRK/ti763MJU3lXvdu7KOzS1SepoXM6lFWu1S689UmIp
	zkg01GIuKk4EALsYRJQ5AwAA
X-CMS-MailID: 20240821093039epcas2p390bf443819db218a0a94b424fece7961
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12@epcas2p2.samsung.com>
	<20240819052416.2258976-5-sunyeal.hong@samsung.com>
	<7f77dcc41173f2a20a0264b6242ecdac6ea85ad9.camel@samsung.com>
	<087401daf2a3$4ae602f0$e0b208d0$@samsung.com>
	<9ee0efad7a27202e6b830996b5ee661a2d350b84.camel@samsung.com>
	<0a0101daf371$0f2025b0$2d607110$@samsung.com>
	<76a46e34-fc22-477d-a2e6-4767e65a73c4@kernel.org>
	<0a7b01daf398$9465d090$bd3171b0$@samsung.com>
	<8a729db0-f587-42b6-8003-789091986324@kernel.org>

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, August 21, 2024 5:02 PM
> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Kwanghoon Son'
> <k.son=40samsung.com>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>;
> 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Alim Akhtar'
> <alim.akhtar=40samsung.com>; 'Michael Turquette' <mturquette=40baylibre.c=
om>;
> 'Stephen Boyd' <sboyd=40kernel.org>; 'Rob Herring' <robh=40kernel.org>; '=
Conor
> Dooley' <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support for
> ExynosAuto v920 SoC
>=20
> On 21/08/2024 09:06, sunyeal.hong wrote:
> >>>>>>> +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,
> >>>>>>
> >>>>>> same question.
> >>>>>> Isn't it =22noc=22?
> >>>>>> https://lore.kernel.org/linux-samsung-
> >>>>>> soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel=40samsung.com/
> >>>>>>
> >>>>>> In my case(autov9), if put wrong clk_name dmesg will show that,
> >>>>>> exynos_arm64_register_cmu: could not enable bus clock ...; err =3D
> >>>>>> -2
> >>>>>>
> >>>>>> Kwang.
> >>>>>>
> >>>>>>
> >>>>>
> >>>>> clk_name follows the guide document provided by hw. v9 is bus, but
> >>>>> v920
> >>>> uses noc.
> >>>>
> >>>> What I mean,
> >>>>
> >>>> .clk_name		=3D =22dout_clkcmu_peric0_noc=22, // wrong
> >>>> .clk_name		=3D =22noc=22, // correct
> >>>>
> >>>> Because there is no clock-names =22dout_clkcmu_peric0_noc=22 in
> >>>> exynos/exynosautov920.dtsi.
> >>>>
> >>>
> >>> The clk_name written here has nothing to do with the device tree.
> >>> Please
> >> look at the code carefully.
> >>
> >> Hm? I see in the code clearly:
> >>
> >> 	clk_get(dev, cmu->clk_name);
> >>
> >> Where cmu is the discussed struct.
> >>
> >> If you claim it does not have anything to do with DT, then what is it
> for?
> >>
> >> Best regards,
> >> Krzysztof
> >
> > In general, clk_get is used via the clk_name declared in the DT.
> >
> > However, the question asked here is the parent clock name of peric0_noc=
,
> so it is unrelated to the device tree.
>=20
> No. The question was about clk_name entry in cmu info used directly for
> clk_get.
>=20

I have verified that peric0 has a dev parameter and that it should use a cl=
k_name that matches the clock-names declared in the device tree. I will upd=
ate the patch with a fix.

Best Regards,
sunyeal

>=20
> Best regards,
> Krzysztof
>=20



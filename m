Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3DA199FA7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223968; cv=none; b=BAB1FORxhsGg0MQLRAOCIM3dq4en5vjVn2qMr6It55wILf1uiQ9W0wyPaJY7LttZKM84wNlcyyomcMen5wTU1Q0F80U+jbBc7Lgwoj2pi9onwytu8LYqGMPb4s/dbi+hOeiHYXx52NkBGB8tmPV23vBBoAogd70s5ff15zodxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223968; c=relaxed/simple;
	bh=37Bke7vQKwVUtrkXVwH516TtsJ+C21cTW2Z5aMaeoEY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RlNlBnYs8PnYUcgGKf7sOTsw+hy4OHEJend90fkWHOja0gJ0OZZLPSACzoTSKMF0P72w4C5md8KBod1W0Vf06Ih2yIaKQqFWhgYaTMayjuj5tXze+7xrXNNklysbsb1MCzieD3YR4moyrQ10sGTACtpC3FE9hZ2vDoY0tFSxB04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lZuLfOO7; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lZuLfOO7"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240821070603epoutp024d962397fc18fce8f0c376379000b61f~trI85zdfv3014530145epoutp02E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 07:06:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240821070603epoutp024d962397fc18fce8f0c376379000b61f~trI85zdfv3014530145epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724223963;
	bh=Tu/rD+8sH0oxetGjFqGfi+bLs/ovELyht9qu+CZRRWM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lZuLfOO7FD9/JV91Z+lu4TV5Zgyi095AF/I5wwa8p4XqyVGQhtzu5FQFX+FvOFtlr
	 qW7QjwGs7xppTCQwUvbVL36n2lITtBPbGFCNLv1j7MxqiTXNSV0L0B48QuPGqRvy8N
	 f3ETqk4wyokZjWGCmEXrIKirzWrQFqGC3D00Cyrk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240821070602epcas2p3742b571f9e2871939f8cb99599fbe133~trI8ZLv4p0613906139epcas2p3g;
	Wed, 21 Aug 2024 07:06:02 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Wpcn62bV4z4x9Px; Wed, 21 Aug
	2024 07:06:02 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	49.84.10431.AD195C66; Wed, 21 Aug 2024 16:06:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240821070601epcas2p36d27dc35fb924e21cb41c532828b9492~trI7M90lo1333513335epcas2p3d;
	Wed, 21 Aug 2024 07:06:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240821070601epsmtrp1438933df200866279e45a606d1200aa0~trI7LPf6g2486924869epsmtrp1M;
	Wed, 21 Aug 2024 07:06:01 +0000 (GMT)
X-AuditID: b6c32a45-da1ff700000028bf-a9-66c591dac496
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.30.08964.9D195C66; Wed, 21 Aug 2024 16:06:01 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240821070601epsmtip22c700122096e647c0086b04bad1e37a0~trI6632bS0311503115epsmtip2k;
	Wed, 21 Aug 2024 07:06:01 +0000 (GMT)
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
In-Reply-To: <76a46e34-fc22-477d-a2e6-4767e65a73c4@kernel.org>
Subject: RE: [PATCH v6 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
Date: Wed, 21 Aug 2024 16:06:01 +0900
Message-ID: <0a7b01daf398$9465d090$bd3171b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gCAc2uXAiz2ascBkCr+LgIuZJbKAN2O2QABhTlqKwKclZoJr+tsRiA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmqe6tiUfTDI584rF4MG8bm8WaveeY
	LK5/ec5qMf/IOVaL3jVXmSzOn9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JouLp1wt/u/ZwW5x
	+E07q8W/axtZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nM
	S7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulNJoSwxpxQoFJBYXKykb2dTlF9a
	kqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ3xf9oE9oI1xhUTuycwNjCu
	0u5i5OSQEDCRuP+8n72LkYtDSGAHo8TpjjVMEM4nRokJx/oYIZxvjBK/9nYxwrQs3H6LDSKx
	l1Fi35IvzBDOS0aJz60fmUCq2AT0JVZ33warEhFoZZY4+OQ5C4jDLLCOUWLzzCPsIFWcAnYS
	z64uYgaxhQUiJS7ubwPbwSKgKnF6Uw8LiM0rYCnRem4TlC0ocXLmEzCbWUBbYtnC18wQNylI
	/Hy6jBUiLiIxu7MNLC4ikCSx5lUX2BUSAkc4JO4f/QDV4CIxY9JRVghbWOLV8S3sELaUxMv+
	Nig7X2Ly9bdMEM0NjBLX/nVDNdtLLDrzE6iIA2ibpsT6XfogpoSAssSRW1C38Ul0HP7LDhHm
	lehoE4JoVJP4dOUy1BAZiWMnnjFPYFSaheSzWUg+m4Xkm1kIuxYwsqxiFEstKM5NTy02KjCE
	x3dyfu4mRnAq1nLdwTj57Qe9Q4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxKLcqPLyrNSS0+xGgK
	DOuJzFKiyfnAbJBXEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwfEwenVAPT
	7LsxZZvy9+3V/Sa/Ia3et0Fl57SpPi2eBpq2up0v7CWPpMXLxUinqEr9+ziH7b3b3tlra9jv
	KZxfGvBn1ZzsXY/iOGSqg+WmHPhguefjW0895ZrE16V72dMc5/xLO8Sgeqx1wcJTyS0mmxjm
	tGqKWk5/c79af8sr8y/z/K6e3X918uF6w0lTn9ct3xu77+QzSy5bD3uPAnnV7b5VOZX5wp/m
	rtKP+eZ5/UXRuq+TG99ms5X9rOTecDjJzmVXoKN+p/j/Sp78tQ7qM56xt9o2TUrVCDykYhUZ
	2qh7qWia+wHrlMrPyzaob6rZk2B6o+O2aM7ipJfOwcFr+TsYG4LU/xz8ccTmY+SfyzVXP29X
	YinOSDTUYi4qTgQA7GWy8U4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvO7NiUfTDE6flrN4MG8bm8WaveeY
	LK5/ec5qMf/IOVaL3jVXmSzOn9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JouLp1wt/u/ZwW5x
	+E07q8W/axtZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJzcksSy3St0vgyph7
	7jhTwRfDir5995kbGL9pdjFyckgImEgs3H6LrYuRi0NIYDejxNczNxghEjISGxv+s0PYwhL3
	W46wQhQ9Z5SYt+UtWBGbgL7E6u7bYN0iAt3MEo/W7mICcZgFNjFKnNt9E2ruWWaJFdcbWEFa
	OAXsJJ5dXcQMYgsLhEuc3nIUzGYRUJU4vamHBcTmFbCUaD23CcoWlDg58wmYzSygLdH7sJUR
	xl628DUzxH0KEj+fLmOFiItIzO5sA4uLCCRJrHnVxTaBUXgWklGzkIyahWTULCTtCxhZVjFK
	phYU56bnFhsWGOallusVJ+YWl+al6yXn525iBMelluYOxu2rPugdYmTiYDzEKMHBrCTC2/3y
	YJoQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJtMF/1+2
	FZ06c/endG5IV+G/vNdN6wQXa/i5n+gxntCmctnaZNfCqg8pd9xyrltrWHSVxyV9PnfxCMPK
	BSciZV4tM/N6t3Z7us5Ft0mWvOm397/5VDGVR7d59seZ3SfZNaUk6jcuXCFw8NQ3HlPuggB+
	E2U15+rrobcu8kQ/+8rT/l19FpfgPKYZz5/alx127kxpOv3on5PDxh1XWxJSnn9LdXpzNsF2
	xZplD611pe/+67ZZv32/cEd3ctT5E8aqM+6/OLayQ3+xjLHdHoZXTff3XL617fGHm3yctnKL
	1rL+5Xor9Ea+7FyqgYSi/i4FpogIcSX23z8N/kY+/PtTgzW4fU6TTdejpfmZntFenkosxRmJ
	hlrMRcWJANS2BbI6AwAA
X-CMS-MailID: 20240821070601epcas2p36d27dc35fb924e21cb41c532828b9492
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

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, August 21, 2024 3:23 PM
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
> On 21/08/2024 04:23, sunyeal.hong wrote:
> > Hello Kwanghoon,
> >
> >> -----Original Message-----
> >> From: Kwanghoon Son <k.son=40samsung.com>
> >> Sent: Tuesday, August 20, 2024 6:54 PM
> >> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> >> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>;
> >> 'Chanwoo Choi' <cw00.choi=40samsung.com>; 'Alim Akhtar'
> >> <alim.akhtar=40samsung.com>; 'Michael Turquette'
> <mturquette=40baylibre.com>; 'Stephen Boyd'
> >> <sboyd=40kernel.org>; 'Rob Herring' <robh=40kernel.org>; 'Conor Dooley=
'
> >> <conor+dt=40kernel.org>
> >> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> >> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> >> linux- kernel=40vger.kernel.org
> >> Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support fo=
r
> >> ExynosAuto v920 SoC
> >>
> >> On Tue, 2024-08-20 at 10:50 +0900, sunyeal.hong wrote:
> >>> Hello Kwanghoon,
> >>>
> >>>> -----Original Message-----
> >>>> From: Kwanghoon Son <k.son=40samsung.com>
> >>>> Sent: Monday, August 19, 2024 6:32 PM
> >>>> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Krzysztof Kozlowski
> >>>> <krzk=40kernel.org>; Sylwester Nawrocki <s.nawrocki=40samsung.com>;
> >>>> Chanwoo Choi <cw00.choi=40samsung.com>; Alim Akhtar
> >>>> <alim.akhtar=40samsung.com>; Michael Turquette
> >>>> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> >>>> Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> >>>> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org=
;
> >>>> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org=
;
> >>>> linux- kernel=40vger.kernel.org
> >>>> Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support =
for
> >>>> ExynosAuto v920 SoC
> >>>>
> >>>> On Mon, 2024-08-19 at 14:24 +0900, Sunyeal Hong wrote:
> >>>>> This adds support for CMU_TOP which generates clocks for all the
> >>>>> function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> >>>>> CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this
> >>>>> block and they will generate bus clocks.
> >>>>>
> >>>>> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> >>>>> ---
> >>>>>  drivers/clk/samsung/Makefile             =7C    1 +
> >>>>>  drivers/clk/samsung/clk-exynosautov920.c =7C 1173
> >>>>> ++++++++++++++++++++++
> >>>>>  2 files changed, 1174 insertions(+)  create mode 100644
> >>>>> drivers/clk/samsung/clk-exynosautov920.c
> >>>>>
> >>>>> diff --git a/drivers/clk/samsung/Makefile
> >>>>> b/drivers/clk/samsung/Makefile index 3056944a5a54..f1ba48758c78
> >>>>> 100644
> >>>>> --- a/drivers/clk/samsung/Makefile
> >>>>> +++ b/drivers/clk/samsung/Makefile
> >>>>> =40=40 -21,6 +21,7 =40=40 obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=
=3D clk-
> >>>> exynos7.o
> >>>>>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> >>>>>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> >>>>>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> >>>>> +obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov920.o
> >>>>>  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> >>>>>  obj-=24(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> >>>>>  obj-=24(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-
> >>>> audss.o
> >>>>> diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> >>>>> b/drivers/clk/samsung/clk-exynosautov920.c
> >>>>> new file mode 100644
> >>>>> index 000000000000..c17d25e3c9a0
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/clk/samsung/clk-exynosautov920.c
> >>>>
> >>>> =5Bsnip=5D
> >>>>
> >>>>> +=7D;
> >>>>> +
> >>>>> +static const struct samsung_cmu_info peric0_cmu_info __initconst
> >>>>> +=3D
> >> =7B
> >>>>> +	.mux_clks		=3D peric0_mux_clks,
> >>>>> +	.nr_mux_clks		=3D ARRAY_SIZE(peric0_mux_clks),
> >>>>> +	.div_clks		=3D peric0_div_clks,
> >>>>> +	.nr_div_clks		=3D ARRAY_SIZE(peric0_div_clks),
> >>>>> +	.nr_clk_ids		=3D CLKS_NR_PERIC0,
> >>>>> +	.clk_regs		=3D peric0_clk_regs,
> >>>>> +	.nr_clk_regs		=3D ARRAY_SIZE(peric0_clk_regs),
> >>>>> +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,
> >>>>
> >>>> same question.
> >>>> Isn't it =22noc=22?
> >>>> https://lore.kernel.org/linux-samsung-
> >>>> soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel=40samsung.com/
> >>>>
> >>>> In my case(autov9), if put wrong clk_name dmesg will show that,
> >>>> exynos_arm64_register_cmu: could not enable bus clock ...; err =3D -=
2
> >>>>
> >>>> Kwang.
> >>>>
> >>>>
> >>>
> >>> clk_name follows the guide document provided by hw. v9 is bus, but
> >>> v920
> >> uses noc.
> >>
> >> What I mean,
> >>
> >> .clk_name		=3D =22dout_clkcmu_peric0_noc=22, // wrong
> >> .clk_name		=3D =22noc=22, // correct
> >>
> >> Because there is no clock-names =22dout_clkcmu_peric0_noc=22 in
> >> exynos/exynosautov920.dtsi.
> >>
> >
> > The clk_name written here has nothing to do with the device tree. Pleas=
e
> look at the code carefully.
>=20
> Hm? I see in the code clearly:
>=20
> 	clk_get(dev, cmu->clk_name);
>=20
> Where cmu is the discussed struct.
>=20
> If you claim it does not have anything to do with DT, then what is it for=
?
>=20
> Best regards,
> Krzysztof

In general, clk_get is used via the clk_name declared in the DT.

However, the question asked here is the parent clock name of peric0_noc, so=
 it is unrelated to the device tree.

	PNAME(mout_peric0_noc_user_p) =3D =7B =22oscclk=22, =22dout_clkcmu_peric0_=
noc=22 =7D;

So we are using clk_name as =22dout_clkcmu_peric0_noc=22.

Best Regards,
sunyeal



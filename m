Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C818B473
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724147675; cv=none; b=KAou0uNqNdyd7mskHSKiHsbGwoDDqdx0UNyEGVX+yssVmesCcqjpJP6VMIvs3caifdApj7xe3wIlZ0Cvq9HLURbQod+pxPpel+QfaFSwGo5+WCSgrmFchWi7IPOo1IFXcABDzfel+v9vcxL7G2I4uICOaIJvyOko/WUM3eqkxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724147675; c=relaxed/simple;
	bh=rsAFr7H/IgzWK005p8Im9Bg0e7SRSmrhtoNnVFssAAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:MIME-Version:
	 Content-Type:References; b=gQSqAnGIsLvPkkCZ3cIwvlQ7i6PBXoSC1Igcd2k2fXKjUlN44luoMUecfShTPYEeTZWoBYHtCifiMWWd/2QSq5DBYASTiSVo/JUVqh7NyTsyKOrV7Uc+SLWE2t8sXXGFnb4M870SyizDL3uO7KhEQekET0NPROLR4iDuwf2WFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TH9hBdqM; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TH9hBdqM"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240820095429epoutp036d63c88506e3e405df82bd674e904dfc~tZyvBOWYS1315313153epoutp03F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:54:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240820095429epoutp036d63c88506e3e405df82bd674e904dfc~tZyvBOWYS1315313153epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724147670;
	bh=AFLXNiVwSlYr3aTYFcpsOpXcL/LT46RkPbGiq8ZtSDc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TH9hBdqM1nsH9XeApvz8B11n2nJq9PifiE09HgBULRDUb6OVDW1p3L8QB6edHwnnL
	 ToZNH4eVtxUEB5vOjO8iEOL4If6oH+xmBbR33Tz4ysCWcRuEmaslkHenzJMYR3SXyo
	 tCcl9TXt8l7XjXH4wWmsnJDB1y99xACKdfPQhndc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20240820095429epcas1p3074a30dfec74590d4890ae1aefad0ff2~tZyumP3CH0244302443epcas1p3I;
	Tue, 20 Aug 2024 09:54:29 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.236]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Wp4Yw3pqQz4x9Pp; Tue, 20 Aug
	2024 09:54:28 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.46.19509.4D764C66; Tue, 20 Aug 2024 18:54:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240820095428epcas1p316c9a28149258d0681423e5c60b0f4d1~tZytR_cHK2288622886epcas1p3m;
	Tue, 20 Aug 2024 09:54:28 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240820095428epsmtrp292e56f1500bda6727c3feccb317c3d30~tZytQ-FKh1423114231epsmtrp2Y;
	Tue, 20 Aug 2024 09:54:28 +0000 (GMT)
X-AuditID: b6c32a4c-10bff70000004c35-2d-66c467d4fb98
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.80.08456.3D764C66; Tue, 20 Aug 2024 18:54:27 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240820095427epsmtip1be4bb3580c5be0cdad9e09c1388fa0b6~tZys7v3Au2079020790epsmtip1M;
	Tue, 20 Aug 2024 09:54:27 +0000 (GMT)
Message-ID: <9ee0efad7a27202e6b830996b5ee661a2d350b84.camel@samsung.com>
Subject: Re: [PATCH v6 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
From: Kwanghoon Son <k.son@samsung.com>
To: "sunyeal.hong" <sunyeal.hong@samsung.com>, 'Krzysztof Kozlowski'
	<krzk@kernel.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Chanwoo
	Choi' <cw00.choi@samsung.com>, 'Alim Akhtar' <alim.akhtar@samsung.com>,
	'Michael Turquette' <mturquette@baylibre.com>, 'Stephen Boyd'
	<sboyd@kernel.org>, 'Rob Herring' <robh@kernel.org>, 'Conor Dooley'
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 20 Aug 2024 18:54:27 +0900
In-Reply-To: <087401daf2a3$4ae602f0$e0b208d0$@samsung.com>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmru6V9CNpBuuPSVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAt0CtOzC0uzUvXy0stsTI0MDAyBSpMyM5YNXsia8E3uYpr+xtYGxgv
	SnYxcnJICJhI7F3YzdrFyMUhJLCHUaL533so5xOjxKIrJ5ggnG+MEk33m9hhWma1XWKGSOxl
	lDje9oMZJCEk8J5RYlVLKojNK+Ah0X3sCBOILSwQKfF0wQ2wGjYBdYklbWvZQZpFBH4ySTza
	dxxsH7PAUkaJSVeusYFUsQioSiy/tIcVxOYUsJJY19cAFmcW0JZYtvA12CRRAXmJhocnmCG2
	CUqcnPmEBWSQhMAWDol1LeugbnWRONixlgnCFpZ4dXwLVFxK4vO7vWwQdrbE0Y8wdonE9VmL
	WCFsY4n9SycD9XIALdaUWL9LH+IGPol3X3tYQcISArwSHW1CEKa8xK3OcohGUYkzTz+yQYQ9
	JG6shIboDiaJy69vMU1glJ+F5JlZSB6YhbBrASPzKkap1ILi3PTUZMMCQ9281HJ4zCbn525i
	BKdXLZ8djN/X/9U7xMjEwXiIUYKDWUmEt/vlwTQh3pTEyqrUovz4otKc1OJDjKbAYJ3ILCWa
	nA9M8Hkl8YYmlgYmZkbGJhaGZoZK4rxnrpSlCgmkJ5akZqemFqQWwfQxcXBKNTA1ZKX8+WRX
	fmnf7JjyL+Ky3WsUjy3zDr4Z//akWxmz7Es+J3Hjss/sNRcZjhjWvClY2MlbfOH8TI9Lu097
	7I+J/fvqScmaeNU4Rht9KT7d31Ydz0T5gxuWCbDoeu8NKXddy2dzv9C1rvNUvMzrL66Hb19Z
	XZrM7se2vEGzewaz08+ofw6FLY4dXr0s2Yz/fW7c7fx+Q0YlJ3SlTILKOZYU5ZjuXecC6noW
	RJT/UFFxX8fvtutSNWPxA/4ysfX81y9a3nka86w2OD6hgOHDN/HnGzwupe/L5Npu/+jns28x
	0gUpy58w3at8yrZua2Q9t2jGAb4XftV2DTvtNUQnv/j45mKDwo9PKbcnFJyeqsRSnJFoqMVc
	VJwIAOXV1t44BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJTvdy+pE0g+d/LCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mq6+
	vsNY0C9XMXvyHdYGxg8SXYycHBICJhKz2i4xdzFycQgJ7GaUeLT0JRtEQlSi43IjYxcjB5At
	LHH4cDFEzVtGiaZX68FqeAU8JLqPHWECsYUFIiWeLrjBDGKzCahLLGlbyw7SICLwk0li66E2
	sCJmgWWMEovvs4DYLAKqEssv7WEFsTkFrCTW9TWwQWzYwySxafcGVogGTYnW7b/ZIWxtiWUL
	X4NtEBWQl2h4eIIZ4gpBiZMzn7BMYBSchaRlFpKWWUjKFjAyr2KUTC0ozk3PLTYsMMpLLdcr
	TswtLs1L10vOz93ECI4lLa0djHtWfdA7xMjEwXiIUYKDWUmEt/vlwTQh3pTEyqrUovz4otKc
	1OJDjNIcLErivN9e96YICaQnlqRmp6YWpBbBZJk4OKUamE6LvuZamfaxYt2KLMFUg1y/fqM4
	Xa9NCVvmB0sxXm9hTs6Z1s30OPHFS6EbAlO7JQOKdq8pYnppNHX7YvflGs8i/MNyKxfpz/iX
	mzF5Lv+RsJf/3t2qrVoy6/3JQ99MxbbVfv29mNH3RF58QNrnxYk3H/R49965cOnwLqdcXxP7
	vY+amb8f7bvy5Zrn8yPrBKY4uwuVRDQkyhx5Gms/M1Cpe8VqrdCoD9+O7Jy/pUysluvbjov9
	W6fsyX81/6bWp491pgJLvec6r3zj6Kt/wvTrE//pFi3dLKfrKorU49ONC4XWrLaySNn/snLK
	YSXuZOVLLbdYHgZkODzzfr/da5Xhzid5LEaJV3MFt6zaGKDEUpyRaKjFXFScCAC+KVHWFAMA
	AA==
X-CMS-MailID: 20240820095428epcas1p316c9a28149258d0681423e5c60b0f4d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p258a29e773ebdd60573078c21f7a7da12@epcas2p2.samsung.com>
	<20240819052416.2258976-5-sunyeal.hong@samsung.com>
	<7f77dcc41173f2a20a0264b6242ecdac6ea85ad9.camel@samsung.com>
	<087401daf2a3$4ae602f0$e0b208d0$@samsung.com>

On Tue, 2024-08-20 at 10:50 +0900, sunyeal.hong wrote:
> Hello Kwanghoon,
>=20
> > -----Original Message-----
> > From: Kwanghoon Son <k.son=40samsung.com>
> > Sent: Monday, August 19, 2024 6:32 PM
> > To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Krzysztof Kozlowski
> > <krzk=40kernel.org>; Sylwester Nawrocki <s.nawrocki=40samsung.com>; Cha=
nwoo
> > Choi <cw00.choi=40samsung.com>; Alim Akhtar <alim.akhtar=40samsung.com>=
;
> > Michael Turquette <mturquette=40baylibre.com>; Stephen Boyd
> > <sboyd=40kernel.org>; Rob Herring <robh=40kernel.org>; Conor Dooley
> > <conor+dt=40kernel.org>
> > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; l=
inux-
> > kernel=40vger.kernel.org
> > Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support for
> > ExynosAuto v920 SoC
> >=20
> > On Mon, 2024-08-19 at 14:24 +0900, Sunyeal Hong wrote:
> > > This adds support for CMU_TOP which generates clocks for all the
> > > function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> > > CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> > > and they will generate bus clocks.
> > >=20
> > > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > ---
> > >  drivers/clk/samsung/Makefile             =7C    1 +
> > >  drivers/clk/samsung/clk-exynosautov920.c =7C 1173
> > > ++++++++++++++++++++++
> > >  2 files changed, 1174 insertions(+)
> > >  create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
> > >=20
> > > diff --git a/drivers/clk/samsung/Makefile
> > > b/drivers/clk/samsung/Makefile index 3056944a5a54..f1ba48758c78 10064=
4
> > > --- a/drivers/clk/samsung/Makefile
> > > +++ b/drivers/clk/samsung/Makefile
> > > =40=40 -21,6 +21,7 =40=40 obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=
=3D clk-
> > exynos7.o
> > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> > > +obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov920.o
> > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> > >  obj-=24(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> > >  obj-=24(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-
> > audss.o
> > > diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> > > b/drivers/clk/samsung/clk-exynosautov920.c
> > > new file mode 100644
> > > index 000000000000..c17d25e3c9a0
> > > --- /dev/null
> > > +++ b/drivers/clk/samsung/clk-exynosautov920.c
> >=20
> > =5Bsnip=5D
> >=20
> > > +=7D;
> > > +
> > > +static const struct samsung_cmu_info peric0_cmu_info __initconst =3D=
 =7B
> > > +	.mux_clks		=3D peric0_mux_clks,
> > > +	.nr_mux_clks		=3D ARRAY_SIZE(peric0_mux_clks),
> > > +	.div_clks		=3D peric0_div_clks,
> > > +	.nr_div_clks		=3D ARRAY_SIZE(peric0_div_clks),
> > > +	.nr_clk_ids		=3D CLKS_NR_PERIC0,
> > > +	.clk_regs		=3D peric0_clk_regs,
> > > +	.nr_clk_regs		=3D ARRAY_SIZE(peric0_clk_regs),
> > > +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,
> >=20
> > same question.
> > Isn't it =22noc=22?
> > https://lore.kernel.org/linux-samsung-
> > soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel=40samsung.com/
> >=20
> > In my case(autov9), if put wrong clk_name dmesg will show that,
> > exynos_arm64_register_cmu: could not enable bus clock ...; err =3D -2
> >=20
> > Kwang.
> >=20
> >=20
>=20
> clk_name follows the guide document provided by hw. v9 is bus, but v920 u=
ses noc.

What I mean,

.clk_name		=3D =22dout_clkcmu_peric0_noc=22, // wrong
.clk_name		=3D =22noc=22, // correct

Because there is no clock-names =22dout_clkcmu_peric0_noc=22 in
exynos/exynosautov920.dtsi.

But if you tested your patch and working fine, ignore my comment.

Kwang.

>=20
> Best Regards,
> sunyeal
>=20


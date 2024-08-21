Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DB3762F7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 02:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724206994; cv=none; b=Cu59G2g6/YtSOQSSSc5dAQSnOCP/qS6loKHqhX2YZqracy1uXIRmunPo6FO2EmhO2zPJ8Oybomv4MFmWW22f2igMu7Rk53SGOzHFARqfokUqva3nsGMYHRbHbvUUACtJuAaL4orbBszWHkY8qCedBS4N5iA7599fvRNrnYu48nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724206994; c=relaxed/simple;
	bh=MDFxxokvwSehvPaitY9/bnuWRDl/z0DoPWL9HFTKuKw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=namkmjjU7z/kdQO5QO7FKpQuDQ4s7+wZ+Nen480E7NyrQwRlJIxTea+903ghTzszjm9RoTKkFl5p3UU8Ro0bwcel2cGvaNYoc749zYfmlwNnl3TbC7SiifoIzWyY6jsP0mKEf9iUF8yoLCJXMq4gXF3A4dj9naCLa85qphH2gBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UO8UOVEc; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UO8UOVEc"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240821022309epoutp0195b7efa050b3f53ede1220eb0c16a233~tnR8o4Vnb1491914919epoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 02:23:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240821022309epoutp0195b7efa050b3f53ede1220eb0c16a233~tnR8o4Vnb1491914919epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724206989;
	bh=mVMg/IOWly8egM9jRq031+T+1t+Ts9bbv+eIW6D8tps=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=UO8UOVEcWEZbDf+voKozFNpnlbAgnglA89ld0BehoC11VW+OpkvkGAG1g/oz09Ftf
	 pchG+socXtlxK+amGs4MlbWz3zBt1AFl85Q1wRH9NwCIBG9ciVwYimhYzC+GbJTa5e
	 3n8L3h6NrCtRvve8o9ox/emAK1y7oVNIdl11eFyM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240821022308epcas2p32350663bdd11d1647835871e1cea700a~tnR8Hn0HW1553115531epcas2p3q;
	Wed, 21 Aug 2024 02:23:08 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WpVVh2gp3z4x9QF; Wed, 21 Aug
	2024 02:23:08 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	01.32.10016.C8F45C66; Wed, 21 Aug 2024 11:23:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240821022307epcas2p3b055f417a3e13a5b7285976b2ab236cf~tnR62_WnM1553115531epcas2p3j;
	Wed, 21 Aug 2024 02:23:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240821022307epsmtrp2c35cffb371068b52981b7a036fd7d867~tnR62E2Gy2345123451epsmtrp2x;
	Wed, 21 Aug 2024 02:23:07 +0000 (GMT)
X-AuditID: b6c32a48-505b770000002720-02-66c54f8cbdcb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F3.3F.08964.B8F45C66; Wed, 21 Aug 2024 11:23:07 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240821022307epsmtip2351a783eed5b135cb5a7f1abb941109c~tnR6lE-1j2804028040epsmtip2h;
	Wed, 21 Aug 2024 02:23:07 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Kwanghoon Son'" <k.son@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo	Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <9ee0efad7a27202e6b830996b5ee661a2d350b84.camel@samsung.com>
Subject: RE: [PATCH v6 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
Date: Wed, 21 Aug 2024 11:23:07 +0900
Message-ID: <0a0101daf371$0f2025b0$2d607110$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gCAc2uXAiz2ascBkCr+LgIuZJbKAN2O2QCwDDRsQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmqW6P/9E0g84N/BYP5m1js1iz9xyT
	xfUvz1kt5h85x2rRu+Yqk8X58xvYLTY9vsZq8bHnHqvF5V1z2CxmnN/HZHHxlKvF/z072C0O
	v2lntfh3bSOLA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjPmtXcwFjxXr9jdcZ61gfGu
	QhcjJ4eEgInE8r6TjF2MXBxCAjsYJS7saGCFcD4xSuz5P5UJwvnGKHF3bjMjTMu7ZXvZIRJ7
	GSX2LdnJDOG8ZJSYMHcrC0gVm4C+xOru22wgCRGBVmaJmf1TwbYwC6xjlNg88wg7SBWngKdE
	65WlzCC2sECkxMX9bWA7WARUJfZOOgBUw8HBK2Ap0bYxFyTMKyAocXLmE7AFzALaEssWvmaG
	OElB4ufTZawQcRGJ2Z1tYHERgTCJthMtYEdICJzhkNi9rJEVosFFYuWOnUwQtrDEq+Nb2CFs
	KYnP7/ayQdj5EpOvv2WCaG5glLj2rxtqm73EojM/wY5jFtCUWL9LH8SUEFCWOHIL6jY+iY7D
	f9khwrwSHW1CEI1qEp+uXIYaIiNx7MQz5gmMSrOQfDYLyWezkHwzC2HXAkaWVYxiqQXFuemp
	xUYFJvDoTs7P3cQITsRaHjsYZ7/9oHeIkYmD8RCjBAezkghv98uDaUK8KYmVValF+fFFpTmp
	xYcYTYFBPZFZSjQ5H5gL8kriDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0tSC2C6WPi
	4JRqYJKxeHW2/NpHL9lzE1ha7FYnhCW6L7t9e9LsK0lO5t6c8YcvXpFJPRUdHd9Us07ef7nl
	ac59HtU/u84f4qqen5vrMTdegP1+XY7Q3gmLlyvfEElZtuIe/8zbBhp2pkHJRlHiH/peitvK
	pBT9f9HjUbNy597PJmuYLO0tyoV+camyvTt2xuKNzey7tSofws3FdvIX5Vf8UDh5s9XqTNAn
	+y3qe1knXPt1ZtWvFd88ZarCj/svyP27LLZK6EJsx7aaOVrr9zU4vGC+Ydi2qrHl7OLfu023
	G19KS1V6ca66bPUukVpXu65pk84oVbi9mPUsvu+8mP3ctp7ruuxLxKzWfPTKW2lqtzGl6dXp
	RTox9kosxRmJhlrMRcWJAEsrwqtNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvG63/9E0g4knJC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLy7vmsFnMOL+PyeLiKVeL/3t2sFsc
	ftPOavHv2kYWBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MtbM
	/sVa8EGtYsWX/4wNjA/kuxg5OSQETCTeLdvL3sXIxSEksJtRYtvrSSwQCRmJjQ3/2SFsYYn7
	LUdYIYqeM0qc3drDDJJgE9CXWN19mw0kISLQzSxxYfZRsFHMApsYJc7tvskG0fKWSeLNm0tg
	LZwCnhKtV5aC2cIC4RKntxwFs1kEVCX2TjoA1M3BwStgKdG2MRckzCsgKHFy5hOwk5gFtCV6
	H7YywtjLFr5mhjhPQeLn02WsEHERidmdbWBxEYEwibYTLWwTGIVnIRk1C8moWUhGzULSvoCR
	ZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnBUamnuYNy+6oPeIUYmDsZDjBIczEoi
	vN0vD6YJ8aYkVlalFuXHF5XmpBYfYpTmYFES5xV/0ZsiJJCeWJKanZpakFoEk2Xi4JRqYFrP
	rWV5dyZrTRNXx3z5Bb/3W5uIPK+9+z+Wgfn57duyX5cds5Oac2T3h1Mz9IIstV6srC532FvP
	rh372ey+qMAa1btqfIu+5HVP2O+/PGP6+WU1/623PMkzemad/4PDpP2i5VFrS531Ecyme8I5
	LqZ8l83+wBLd/f9Xhzq/m5SUGePi3fu2b3xt6vVqwfrZH08m33h9bUOe3AOuhIxtX/ZyBrzb
	41t7/ckp+WvS2/9vEVxo7XPoD8dykVIn8akxPeueSh3d6WdeI+6g/un2qTnK789/Kf9fPfHh
	qeiQSdv+C+hEJRp+S2yQLyheXBk03U/G4t3njXoP47rPGMoZznk61cInKsnMtl548zOdmkwl
	luKMREMt5qLiRADBrH9aOQMAAA==
X-CMS-MailID: 20240821022307epcas2p3b055f417a3e13a5b7285976b2ab236cf
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

Hello Kwanghoon,

> -----Original Message-----
> From: Kwanghoon Son <k.son=40samsung.com>
> Sent: Tuesday, August 20, 2024 6:54 PM
> To: sunyeal.hong <sunyeal.hong=40samsung.com>; 'Krzysztof Kozlowski'
> <krzk=40kernel.org>; 'Sylwester Nawrocki' <s.nawrocki=40samsung.com>; 'Ch=
anwoo
> Choi' <cw00.choi=40samsung.com>; 'Alim Akhtar' <alim.akhtar=40samsung.com=
>;
> 'Michael Turquette' <mturquette=40baylibre.com>; 'Stephen Boyd'
> <sboyd=40kernel.org>; 'Rob Herring' <robh=40kernel.org>; 'Conor Dooley'
> <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support for
> ExynosAuto v920 SoC
>=20
> On Tue, 2024-08-20 at 10:50 +0900, sunyeal.hong wrote:
> > Hello Kwanghoon,
> >
> > > -----Original Message-----
> > > From: Kwanghoon Son <k.son=40samsung.com>
> > > Sent: Monday, August 19, 2024 6:32 PM
> > > To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Krzysztof Kozlowski
> > > <krzk=40kernel.org>; Sylwester Nawrocki <s.nawrocki=40samsung.com>;
> > > Chanwoo Choi <cw00.choi=40samsung.com>; Alim Akhtar
> > > <alim.akhtar=40samsung.com>; Michael Turquette
> > > <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> > > Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> > > Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> > > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > > linux- kernel=40vger.kernel.org
> > > Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support f=
or
> > > ExynosAuto v920 SoC
> > >
> > > On Mon, 2024-08-19 at 14:24 +0900, Sunyeal Hong wrote:
> > > > This adds support for CMU_TOP which generates clocks for all the
> > > > function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> > > > CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this
> > > > block and they will generate bus clocks.
> > > >
> > > > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > > > ---
> > > >  drivers/clk/samsung/Makefile             =7C    1 +
> > > >  drivers/clk/samsung/clk-exynosautov920.c =7C 1173
> > > > ++++++++++++++++++++++
> > > >  2 files changed, 1174 insertions(+)  create mode 100644
> > > > drivers/clk/samsung/clk-exynosautov920.c
> > > >
> > > > diff --git a/drivers/clk/samsung/Makefile
> > > > b/drivers/clk/samsung/Makefile index 3056944a5a54..f1ba48758c78
> > > > 100644
> > > > --- a/drivers/clk/samsung/Makefile
> > > > +++ b/drivers/clk/samsung/Makefile
> > > > =40=40 -21,6 +21,7 =40=40 obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=
=3D clk-
> > > exynos7.o
> > > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> > > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> > > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> > > > +obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov920.o
> > > >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> > > >  obj-=24(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> > > >  obj-=24(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-
> > > audss.o
> > > > diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> > > > b/drivers/clk/samsung/clk-exynosautov920.c
> > > > new file mode 100644
> > > > index 000000000000..c17d25e3c9a0
> > > > --- /dev/null
> > > > +++ b/drivers/clk/samsung/clk-exynosautov920.c
> > >
> > > =5Bsnip=5D
> > >
> > > > +=7D;
> > > > +
> > > > +static const struct samsung_cmu_info peric0_cmu_info __initconst =
=3D
> =7B
> > > > +	.mux_clks		=3D peric0_mux_clks,
> > > > +	.nr_mux_clks		=3D ARRAY_SIZE(peric0_mux_clks),
> > > > +	.div_clks		=3D peric0_div_clks,
> > > > +	.nr_div_clks		=3D ARRAY_SIZE(peric0_div_clks),
> > > > +	.nr_clk_ids		=3D CLKS_NR_PERIC0,
> > > > +	.clk_regs		=3D peric0_clk_regs,
> > > > +	.nr_clk_regs		=3D ARRAY_SIZE(peric0_clk_regs),
> > > > +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,
> > >
> > > same question.
> > > Isn't it =22noc=22?
> > > https://lore.kernel.org/linux-samsung-
> > > soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel=40samsung.com/
> > >
> > > In my case(autov9), if put wrong clk_name dmesg will show that,
> > > exynos_arm64_register_cmu: could not enable bus clock ...; err =3D -2
> > >
> > > Kwang.
> > >
> > >
> >
> > clk_name follows the guide document provided by hw. v9 is bus, but v920
> uses noc.
>=20
> What I mean,
>=20
> .clk_name		=3D =22dout_clkcmu_peric0_noc=22, // wrong
> .clk_name		=3D =22noc=22, // correct
>=20
> Because there is no clock-names =22dout_clkcmu_peric0_noc=22 in
> exynos/exynosautov920.dtsi.
>=20

The clk_name written here has nothing to do with the device tree. Please lo=
ok at the code carefully.

Best Regards,
Sunyeal

> But if you tested your patch and working fine, ignore my comment.
>=20
> Kwang.
>=20
> >
> > Best Regards,
> > sunyeal
> >



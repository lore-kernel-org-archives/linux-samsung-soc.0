Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445521AAA5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724118617; cv=none; b=cBh8ZPWuqmK5UdKz9PpFWkgD8pqHMMCv+gvri8EE6CtjtxFz6jVpbVfoZWLwEg/wMxorhkblQeeOmRvzxssdKyCM22iF5osFlvWMcL7QJgnl1Cik0/tiW5wM+VLgBNi6W/YC7HzsDKqyi6WoUWbF0S6XJ2+Eaj4lU9dsuMSb0SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724118617; c=relaxed/simple;
	bh=EMVOrULx2hh4+PlolF/KTsTr/YQNW+EkOPNf9eljlRA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=KsdecNQd44phPRfLk/NhLfLpSR4qj6g/ux9KnbfGknXhobzsJgKLuV4lgu5DkgA7hu19Yv46durbw9W5zAe13xSzuLRtd2IcsWNp+OfsDARZWfcqQ28vFv5m/EegsSoR8j2+RenIaiMh0x6CMo3uq21cBBDI91OS7D1tvYNCNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HpQHkMV7; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HpQHkMV7"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240820015013epoutp030e7cff9a4dd1641fb6313d55f8217f6f~tTL55yTZP2731427314epoutp03Y
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 01:50:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240820015013epoutp030e7cff9a4dd1641fb6313d55f8217f6f~tTL55yTZP2731427314epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724118613;
	bh=/hiRHchz0sNhIF3Zb1DsDFpBv74YdyUyUThL08qbzg4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HpQHkMV7xI5yDYW9e6GzPb2XGgKG4Y3H00wKgD38gmS0Vjcws/0kPtt+teNClgsQD
	 ccuLVBZncVgZd4CeP4DHuuoyxgs8AXjcZx8vcVUBB/Qs7Hnhir/cJOSVp/h4jTAzbS
	 tYfqiEb7vcQBQKWj7mxDrMFVPGkCzAa777Yqucfw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240820015012epcas2p34cc61913fd67ba4c0b131fb121ec9503~tTL5b5OiW1556615566epcas2p38;
	Tue, 20 Aug 2024 01:50:12 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.99]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Wnsq810htz4x9QG; Tue, 20 Aug
	2024 01:50:12 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	15.7B.19039.356F3C66; Tue, 20 Aug 2024 10:50:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240820015011epcas2p15cf12bdf5cb3d13fffe8f8a0fa4390f0~tTL4QCZD82831628316epcas2p1q;
	Tue, 20 Aug 2024 01:50:11 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820015011epsmtrp1436eab7281fcc82b2aa13f86d6729277~tTL4O92it3102931029epsmtrp1d;
	Tue, 20 Aug 2024 01:50:11 +0000 (GMT)
X-AuditID: b6c32a4d-305ff70000004a5f-9e-66c3f653fa8b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4E.2B.07567.356F3C66; Tue, 20 Aug 2024 10:50:11 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240820015011epsmtip2e6c671ec87e9e410fa35e58eb58f598b~tTL4B5qIF0725207252epsmtip2T;
	Tue, 20 Aug 2024 01:50:11 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Kwanghoon Son'" <k.son@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael	Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <7f77dcc41173f2a20a0264b6242ecdac6ea85ad9.camel@samsung.com>
Subject: RE: [PATCH v6 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
Date: Tue, 20 Aug 2024 10:50:11 +0900
Message-ID: <087401daf2a3$4ae602f0$e0b208d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLQL30DU0UysUOS1ES52gTWByyh0gCAc2uXAiz2ascBkCr+LrAi+mEw
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmuW7It8NpBu0bGC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLy7vmsFnMOL+PyeLiKVeL/3t2sFsc
	ftPOavHv2kYWBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGfcv/SCqeCRVMW1OUUNjJfE
	uhg5OCQETCRePbLtYuTiEBLYwyhx8M4jFgjnE6PErosdzF2MnEDON0aJcwvCYBqu39GEqNnL
	KLHkz16ompeMEnOPeIHYbAL6Equ7b7OBFIkItDJLLHr7hR3EYRZYxyixeeYRdpBJnAKeElte
	qIA0CAtESlzc38YIYrMIqErMXPgcbCivgKXE7klzoWxBiZMzn7CA2MwC2hLLFr4Gi0sIKEj8
	fLqMFSIuIjG7sw0sLiLgJrH3w1NmkL0SAmc4JE5/fMQI8YGLxOU3vBC9whKvjm9hh7ClJF72
	t0HZ+RKTr79lguhtYJS49q8bapm9xKIzP8HuZxbQlFi/Sx9ipLLEkVtQp/FJdBz+yw4R5pXo
	aBOCaFST+HTlMtQQGYljJ54xT2BUmoXksVlIHpuF5JlZCLsWMLKsYpRKLSjOTU9NNiow1M1L
	LYdHdnJ+7iZGcBLW8t3B+Hr9X71DjEwcjIcYJTiYlUR4u18eTBPiTUmsrEotyo8vKs1JLT7E
	aAoM7onMUqLJ+cA8kFcSb2hiaWBiZmZobmRqYK4kznuvdW6KkEB6YklqdmpqQWoRTB8TB6dU
	A5MUT5PXhrm2aoJZDN63Yl79mtDAPSvL7b5lqGd24HwODYPEK4tW26XHPfDJFrpbxjTxydVZ
	dScEuS/EmHZe0mQt0siN2Pjr+pno49+mzD70pWLFhZVHGIQCrhbLrRa3/bPVWCD76O7ed1vS
	pRVPL9fMPxIz/UH9toLWA3MY7qxLWlxlf3NPubz0xkVratcGuy2xPfJUQNGkZd5x+73vG1t5
	IrfGpfj/CjB9EpU/0eSYQa35b7mi3o3PFK9Z/pH0f/XGbd7MZmvfsHPf1zwriGHS7e5nSue7
	Xty9JzR7oknC7naP6z7SGifev9ty0XXvxeAsPvbV70L7N/O2T+nX43rfcqyM91D/0X8ffS1u
	9SqxFGckGmoxFxUnAgBgJskqSwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWy7bCSvG7wt8NpBl23pSwezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLy7vmsFnMOL+PyeLiKVeL/3t2sFsc
	ftPOavHv2kYWBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MnZf
	2ctWMEGq4s3UVWwNjA1iXYwcHBICJhLX72h2MXJxCAnsZpSYOP0TaxcjJ1BcRmJjw392CFtY
	4n7LEVaIoueMEmvWH2UBSbAJ6Eus7r7NBpIQEehmllg9YzlYFbPAJkaJc7tvskG0NDFJTLp2
	gAlkH6eAp8SWFyog3cIC4RKntxxlBrFZBFQlZi58DmbzClhK7J40F8oWlDg58wnYNmYBbYne
	h62MMPayha+ZIc5TkPj5dBkrRFxEYnZnG1hcRMBNYu+Hp8wTGIVnIRk1C8moWUhGzULSvoCR
	ZRWjZGpBcW56brJhgWFearlecWJucWleul5yfu4mRnBMamnsYLw3/5/eIUYmDsZDjBIczEoi
	vN0vD6YJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zWcMTtFSCA9sSQ1OzW1ILUIJsvEwSnVwHRD
	Oe2Sw4ptx98+an+8VKdxwvRM2fc7bt5OkVp56sS9gzWLau2UbN5maAdr5rk7NS90uMXQEqR4
	uuPJWwFH7+3rfa6VNsVMWvroP/vj2ULnhE2ijxv6zHgRefGcsp6WvdetjOOeWz+w3GSLYT3u
	ItJ/uNj6PZ/lzpWVIa0rJQy993P0GbFlbVxSZXeA+3CsqDC3udnpLWs4H+jt37T+b9CT9es8
	ORT5JqwXmvO59unJ7yX3d022e3D3YKDcwoYqPak1Cck7w5MyeE4ybmSP6zIrFzi7qlz7454P
	11UTTz9gcU/TnHGtX4nlyAH3C62NWYUanUZHsy/safj++svcE23p2T9XXTB44125fqLOhXdK
	LMUZiYZazEXFiQBU/GHKOAMAAA==
X-CMS-MailID: 20240820015011epcas2p15cf12bdf5cb3d13fffe8f8a0fa4390f0
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

Hello Kwanghoon,

> -----Original Message-----
> From: Kwanghoon Son <k.son=40samsung.com>
> Sent: Monday, August 19, 2024 6:32 PM
> To: Sunyeal Hong <sunyeal.hong=40samsung.com>; Krzysztof Kozlowski
> <krzk=40kernel.org>; Sylwester Nawrocki <s.nawrocki=40samsung.com>; Chanw=
oo
> Choi <cw00.choi=40samsung.com>; Alim Akhtar <alim.akhtar=40samsung.com>;
> Michael Turquette <mturquette=40baylibre.com>; Stephen Boyd
> <sboyd=40kernel.org>; Rob Herring <robh=40kernel.org>; Conor Dooley
> <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v6 4/4=5D clk: samsung: add top clock support for
> ExynosAuto v920 SoC
>=20
> On Mon, 2024-08-19 at 14:24 +0900, Sunyeal Hong wrote:
> > This adds support for CMU_TOP which generates clocks for all the
> > function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> > CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> > and they will generate bus clocks.
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> > ---
> >  drivers/clk/samsung/Makefile             =7C    1 +
> >  drivers/clk/samsung/clk-exynosautov920.c =7C 1173
> > ++++++++++++++++++++++
> >  2 files changed, 1174 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
> >
> > diff --git a/drivers/clk/samsung/Makefile
> > b/drivers/clk/samsung/Makefile index 3056944a5a54..f1ba48758c78 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > =40=40 -21,6 +21,7 =40=40 obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D =
clk-
> exynos7.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> > +obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov920.o
> >  obj-=24(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> >  obj-=24(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> >  obj-=24(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-
> audss.o
> > diff --git a/drivers/clk/samsung/clk-exynosautov920.c
> > b/drivers/clk/samsung/clk-exynosautov920.c
> > new file mode 100644
> > index 000000000000..c17d25e3c9a0
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynosautov920.c
>=20
> =5Bsnip=5D
>=20
> > +=7D;
> > +
> > +static const struct samsung_cmu_info peric0_cmu_info __initconst =3D =
=7B
> > +	.mux_clks		=3D peric0_mux_clks,
> > +	.nr_mux_clks		=3D ARRAY_SIZE(peric0_mux_clks),
> > +	.div_clks		=3D peric0_div_clks,
> > +	.nr_div_clks		=3D ARRAY_SIZE(peric0_div_clks),
> > +	.nr_clk_ids		=3D CLKS_NR_PERIC0,
> > +	.clk_regs		=3D peric0_clk_regs,
> > +	.nr_clk_regs		=3D ARRAY_SIZE(peric0_clk_regs),
> > +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,
>=20
> same question.
> Isn't it =22noc=22?
> https://lore.kernel.org/linux-samsung-
> soc/58dfae564a4a624e464c7803a309f1f07b5ae83d.camel=40samsung.com/
>=20
> In my case(autov9), if put wrong clk_name dmesg will show that,
> exynos_arm64_register_cmu: could not enable bus clock ...; err =3D -2
>=20
> Kwang.
>=20
>=20

clk_name follows the guide document provided by hw. v9 is bus, but v920 use=
s noc.

Best Regards,
sunyeal


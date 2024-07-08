Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70F780024
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439898; cv=none; b=nrj/EmcyV1QFCyAszRKQvnJcf2Gnb1lYm2zTEIVcr6P97fz1JKarXe672QuZ1GJTQnR4Bwx1Ab0bCZkomNRKtvqXO1t3cigY4oHCjgfKKbcFf67EZcPKt6Daa4CWwdPESt6wxN5Ery4NEgNN8lkG821Rasfbcm/D6v5j+yDnOik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439898; c=relaxed/simple;
	bh=5Skf7bB+Ul0fTyGPPb4IWtj1/c9ljh2yIzNDzzw9tSI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=NgiSBsD1MV5hGeRlA4nCIU5D9NE5fwKCSrUcQREHd6fgnOI5c/WjmUkmOtjVBZhAb31Rd+kb6rae8mNhQXsMXNqVzAj959nWLWpyiG/5JdEVOtAnKIeCVmRYX4duFaAXk31VlNUWC33cInJpPQjUcIAYb8imHnN3WqUmmBkVRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SUh96Ic1; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SUh96Ic1"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240708115812epoutp042ca28b9268110157858b047100083c04~gOveVNwx40744807448epoutp04F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 11:58:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240708115812epoutp042ca28b9268110157858b047100083c04~gOveVNwx40744807448epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720439892;
	bh=7xf94OXLmQc4nSIeTzwY8nKN8eX7iy549jEG1Y+T8Qw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=SUh96Ic1QjqCrQomVyQQ/CU7wYey+PABxF4A9DksZI11xLUnA+tggeMnfUnTZc7P0
	 L5Bww9NrZTdoiQ3MczwHm1UuJjZW2qloUETEJcMZuBfj0dY+R/j9yv8UzlqtMYvkd7
	 CbSSykInMNBNLeivMLho5LeM/1BKblp8Ta49yTRg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240708115812epcas5p1125b22c050f62d03e13fcc5490e8ef88~gOvd2HQrj1267712677epcas5p1k;
	Mon,  8 Jul 2024 11:58:12 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WHjLV3bXRz4x9Pr; Mon,  8 Jul
	2024 11:58:10 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.EE.09989.254DB866; Mon,  8 Jul 2024 20:58:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240708115810epcas5p312cb3cb8c418d1dfb5a57227b1418dac~gOvb6GDF30231602316epcas5p35;
	Mon,  8 Jul 2024 11:58:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240708115810epsmtrp155f7416a3c3dd0aedd5cd7f511a495f0~gOvb42ih_2293422934epsmtrp1D;
	Mon,  8 Jul 2024 11:58:10 +0000 (GMT)
X-AuditID: b6c32a4a-bffff70000002705-78-668bd4521730
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D6.03.29940.154DB866; Mon,  8 Jul 2024 20:58:09 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240708115808epsmtip22d9dc8157a9a70dfd21d679d85a68029~gOvaHY5ZP1040510405epsmtip2F;
	Mon,  8 Jul 2024 11:58:08 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sunyeal Hong'" <sunyeal.hong@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20240707231331.3433340-4-sunyeal.hong@samsung.com>
Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Mon, 8 Jul 2024 17:28:06 +0530
Message-ID: <000601dad12e$19ff3f30$4dfdbd90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQHhk3nlAbaaqcSw9i1D4A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmhm7Qle40g19HxC3W7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvzfs4Pd4vCbdlaLf9c2slg0
	LVvP5MDr8f5GK7vHplWdbB6bl9R79G1ZxejxeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndw
	vHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0IlKCmWJOaVAoYDE4mIlfTubovzSklSFjPzi
	Elul1IKUnAKTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMfxOuMhacl694/v4qewPjfKkuRk4O
	CQETiQ0/JzB3MXJxCAnsZpR43trEBOF8YpSYfWgeVOYbo8S05UuYYVpallxmgUjsZZT4uu8R
	I4TzglGieeVddpAqNgFdiR2L29hAbBGBe0wSH/eagxQxC6xjlNg88whYEaeAg8T8t1+Aijg4
	hAW8Jd635oCYLAIqEhPep4NU8ApYSnx7dIwRwhaUODnzCQuIzSygLbFs4WuogxQkfj5dxgqx
	ykni6Y61TBA14hIvj4Js4gKq2cMhseT8MqgGF4mOSTDfCEu8Or6FHcKWknjZ3wZlZ0scvziL
	DcKukOhu/QgVt5fY+egmC8idzAKaEut36UPs4pPo/f2ECSQsIcAr0dEmBFGtKtH87ioLhC0t
	MbG7mxXC9pA48GYj0wRGxVlIPpuF5LNZSD6YhbBsASPLKkbJ1ILi3PTUYtMCo7zUcnh8J+fn
	bmIEJ2Atrx2MDx980DvEyMTBeIhRgoNZSYT39OP2NCHelMTKqtSi/Pii0pzU4kOMpsDQnsgs
	JZqcD8wBeSXxhiaWBiZmZmYmlsZmhkrivK9b56YICaQnlqRmp6YWpBbB9DFxcEo1MC1N+dj/
	xG+j/NHuNVsmPmuN+tZwaZ2SzNcri6z3yt+5PWGbetoyo+13Li5f18s71VBbJaH6eenWU2Yq
	b8+/TfnaVfJkW2LqrDXPF5c7l2xwN+P8ESWUJFN18ZqmwDcTg8tFGceim9ZG3ap0nJHvfPni
	pUl7NTtOuT6K7mU0/LRLKnu5t6iOwarCX5U6G5TWPiqZuIPv/F2VBaekNfJ8g5czOEyYd2XC
	jAU6Qat+Gj5luJXLr1j89/MJPxb7iKNeeWq94ex/7lTMy76w4LSI4s1P/K75B0UP1AmvNJqo
	fZ9RpJ9TeOIn+QlTBU8Xc99R015Xu7VKf5eJ+8kshTvv49Mv3/BSbnjtMeXVHePfa6crsRRn
	JBpqMRcVJwIAI7Hx00kEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsWy7bCSvG7Qle40g/fKFmv2nmOyuP7lOavF
	/CPnWC3On9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JouLp1wt/u/ZwW5x+E07q8W/axtZLJqW
	rWdy4PV4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjfLoEr4+GvR8wF9+Uq
	Hna7NjCuluxi5OSQEDCRaFlymaWLkYtDSGA3o8Ter31sEAlpiesbJ7BD2MISK/89Z4coesYo
	0XJqDQtIgk1AV2LH4jawBhGBJ0wSWw9HgxQxC2xilDi3+yZYQkjgKKPExHnSIDangIPE/Ldf
	gOIcHMIC3hLvW3NATBYBFYkJ79NBKngFLCW+PTrGCGELSpyc+QRsFbOAtsTTm0/h7GULXzND
	3KYg8fPpMlaIE5wknu5YywRRIy7x8ugR9gmMwrOQjJqFZNQsJKNmIWlZwMiyilEytaA4Nz23
	2LDAMC+1XK84Mbe4NC9dLzk/dxMjOAK1NHcwbl/1Qe8QIxMH4yFGCQ5mJRHe04/b04R4UxIr
	q1KL8uOLSnNSiw8xSnOwKInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwJXKG6h5S4u/SPDt/
	zvvFLQXP/6sHtz2rXSzwwWtrZZTrbR/JadHsTHqrm+1dnzTX+dT5n2RXUIl1Tm65GWOcWFHN
	9dTAqyB7TvSWOyyHdm5q68m9xvY3/J58XIxpW/YBniWRgYsP57xaU86wtkrPa5bey6RHf35o
	1vGnSb+f8omla/d/KcOGJ05PQ/6+/3dva4Gw3nd29S9nMvdFJVjv6BWML5j1W37Pcc3Qp3UL
	zDmao4K+BVazB6y3XBlv8vTzT5F1jPWTep0vZ+62s3v6U/rXnFrGfqfIWrlEq08CtoXzDkst
	OHNaRkXE/uukbQtXTZ5ze9361922zeEn/kZ6y09o3f44LoHZsLOFy1eJpTgj0VCLuag4EQDE
	W2UGLwMAAA==
X-CMS-MailID: 20240708115810epcas5p312cb3cb8c418d1dfb5a57227b1418dac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p18815fee7d176f63619d244d836ab64fc
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p18815fee7d176f63619d244d836ab64fc@epcas2p1.samsung.com>
	<20240707231331.3433340-4-sunyeal.hong@samsung.com>

Hello Sunyeal,

> -----Original Message-----
> From: Sunyeal Hong <sunyeal.hong=40samsung.com>
> Sent: Monday, July 8, 2024 4:44 AM
> To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Alim Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Rob
> Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; Sunyeal Hong <sunyeal.hong=40samsung.com>
> Subject: =5BPATCH v2 3/4=5D clk: samsung: clk-pll: Add support for pll_53=
1x
>=20
> pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
> pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120 MHz)
>=20
> PLL531x
> FOUT =3D (MDIV + F/2=5E32-F=5B31=5D) * FIN/(PDIV x 2=5ESDIV)
>=20
Any reason for not mentioning equation for integer PLL?=20

> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> ---
Anyway, LGTM,

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  drivers/clk/samsung/clk-pll.c =7C 45
> +++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h =7C  1 +
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.=
c index
> 4be879ab917e..b3bcef074ab7 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> =40=40 -1261,6 +1261,48 =40=40 static const struct clk_ops
> samsung_pll2650xx_clk_min_ops =3D =7B
>  	.recalc_rate =3D samsung_pll2650xx_recalc_rate,  =7D;
>=20
> +/*
> + * PLL531X Clock Type
> + */
> +/* Maximum lock time can be 500 * PDIV cycles */
> +=23define PLL531X_LOCK_FACTOR		(500)
> +=23define PLL531X_MDIV_MASK		(0x3FF)
> +=23define PLL531X_PDIV_MASK		(0x3F)
> +=23define PLL531X_SDIV_MASK		(0x7)
> +=23define PLL531X_FDIV_MASK		(0xFFFF)
> +=23define PLL531X_MDIV_SHIFT		(16)
> +=23define PLL531X_PDIV_SHIFT		(8)
> +=23define PLL531X_SDIV_SHIFT		(0)
> +
> +static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +=7B
> +	struct samsung_clk_pll *pll =3D to_clk_pll(hw);
> +	u32 mdiv, pdiv, sdiv, pll_con0, pll_con8;
> +	s32 fdiv;
> +	u64 fout =3D parent_rate;
> +
> +	pll_con0 =3D readl_relaxed(pll->con_reg);
> +	pll_con8 =3D readl_relaxed(pll->con_reg + 20);
> +	mdiv =3D (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
> +	pdiv =3D (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
> +	sdiv =3D (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
> +	fdiv =3D (s32)(pll_con8 & PLL531X_FDIV_MASK);
> +
> +	if (fdiv >> 31)
> +		mdiv--;
> +
> +	fout *=3D ((u64)mdiv << 24) + (fdiv >> 8);
> +	do_div(fout, (pdiv << sdiv));
> +	fout >>=3D 24;
> +
> +	return (unsigned long)fout;
> +=7D
> +
> +static const struct clk_ops samsung_pll531x_clk_ops =3D =7B
> +	.recalc_rate =3D samsung_pll531x_recalc_rate, =7D;
> +
>  static void __init _samsung_clk_register_pll(struct samsung_clk_provider
> *ctx,
>  				const struct samsung_pll_clock *pll_clk)  =7B
> =40=40 -1394,6 +1436,9 =40=40 static void __init _samsung_clk_register_pl=
l(struct
> samsung_clk_provider *ctx,
>  		else
>  			init.ops =3D &samsung_pll2650xx_clk_ops;
>  		break;
> +	case pll_531x:
> +		init.ops =3D &samsung_pll531x_clk_ops;
> +		break;
>  	default:
>  		pr_warn(=22%s: Unknown pll type for pll clk %s=5Cn=22,
>  			__func__, pll_clk->name);
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.=
h
> index ffd3d52c0dec..ce9d6f21f993 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> =40=40 -41,6 +41,7 =40=40 enum samsung_pll_type =7B
>  	pll_0516x,
>  	pll_0517x,
>  	pll_0518x,
> +	pll_531x,
>  =7D;
>=20
>  =23define PLL_RATE(_fin, _m, _p, _s, _k, _ks) =5C
> --
> 2.45.2



Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999A1494BA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 04:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437600; cv=none; b=RM3CmlfEpIod+V88ZBR+GeoUt6ynZtS1vAhVvPDdnuiTaKSk6TIyZ+D7QzIRQyD493IzyCp3VrqxyvKDBrQ61iKfzGIfX8FOvqzN91HrNdwpfi4WL6lyIeJEvnFjPG7FlyDUDiX2s7Bd13dziTu4C9GtMAEBFPaTdBrKepFJ/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437600; c=relaxed/simple;
	bh=OcUBdBhOPJXpF1ZhDWGg+EuTx0n6CXN14Gm4pjBxdqk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uwCb0FjUWxuj9M4bfL3A2CvsYVqfVp8ZxXuJGBAtNvoe6TDfNN4SliZF5Qk8ENFwU79RacFcwRUitcH0C5LmKH6+KR1NbaIP9yjnPet32n5oqXJECRUlFpD6ionNE6f+/aCSkbFSkQUSEB3F1r0qk7zcQT3SpFs2wC/aMidcPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=H2zEc4QZ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="H2zEc4QZ"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240812043955epoutp040e1776c8c7f47209d6a12d272caa51d0~q4Vyexr2g2166721667epoutp04E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2024 04:39:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240812043955epoutp040e1776c8c7f47209d6a12d272caa51d0~q4Vyexr2g2166721667epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723437595;
	bh=ej7ujlPKRdvgCSrnmr/Prz0FplA5pHp++OQEMqJ3mzA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=H2zEc4QZTDEyrzMgWrbv3FHzbddeuJjbznebKhz950d9kKOYaTWVrlnaxOIHLkyLg
	 HBXhU6yacI1rJ3/X+oG1LA07xsSQb7fe7PUvIwdxFn6XGTGuiBdb3FMyh0QN2GABzY
	 zpnp7tcBMLIqWoj6R3TT9zSYJ2U4ELei0MNGG+Es=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240812043954epcas1p1844c1cfe6fe7b1538fad2ddb921b21cc~q4Vx_AGl72424824248epcas1p1P;
	Mon, 12 Aug 2024 04:39:54 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.144]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wj1yd6gdVz4x9QJ; Mon, 12 Aug
	2024 04:39:53 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	61.C4.08992.91299B66; Mon, 12 Aug 2024 13:39:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20240812043953epcas1p44d4eb166f073de2f610bade4d9b96db9~q4VwmObvh1423814238epcas1p4Z;
	Mon, 12 Aug 2024 04:39:53 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240812043953epsmtrp12116e3ba70db40e37f622995e82baf58~q4VwlR2v-2452324523epsmtrp1h;
	Mon, 12 Aug 2024 04:39:53 +0000 (GMT)
X-AuditID: b6c32a33-96dfa70000002320-fd-66b99219bab0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9F.A8.07567.91299B66; Mon, 12 Aug 2024 13:39:53 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240812043952epsmtip29ae53b3f2d98404a36d27fe69041ba31~q4VwRbZBn0281202812epsmtip2e;
	Mon, 12 Aug 2024 04:39:52 +0000 (GMT)
Message-ID: <58dfae564a4a624e464c7803a309f1f07b5ae83d.camel@samsung.com>
Subject: Re: [PATCH v5 4/4] clk: samsung: add top clock support for
 ExynosAuto v920 SoC
From: Kwanghoon Son <k.son@samsung.com>
To: Sunyeal Hong <sunyeal.hong@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
	Herring <robh@kernel.org>,  Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 12 Aug 2024 13:39:47 +0900
In-Reply-To: <20240730071221.2590284-5-sunyeal.hong@samsung.com>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmga7kpJ1pBlPfmlo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAt0CtOzC0uzUvXy0stsTI0MDAyBSpMyM74M3chW8EfoYrpM1+wNDCe
	5u9i5OCQEDCR6LoU08XIySEksINRon0LUxcjF5D9iVFi/pbNUM43RonLR68wgVSBNHx48IkF
	omMvo8S3G/4QRe8ZJU6f/wZWxCvgIXHmxlcmkA3CApES7WfLQcJsAuoSS9rWsoPUiwg8Y5I4
	9egTK4jDLLCUUWLSlWtsIFUsAqoSOy6sYQaxOQUcJLbv/8YIYjMLaEssW/gaLC4qIC/R8PAE
	M8QyQYmTM5+wgAySEFjLIfFy60lWiFNdJCZemM4IYQtLvDq+hR3ClpJ42d8GZWdLHP24lw3C
	LpG4PmsRVK+xxP6lk8E+YBbQlFi/Sx/iBj6Jd197WCFBxyvR0SYEYcpL3Oosh2gUlTjz9CMb
	RNhD4svqYEjwnGSUaPp0jWkCo/wsJM/MQvLALIRdCxiZVzGKpRYU56anJhsWGMKjNDk/dxMj
	OKFqGe9gvDz/n94hRiYOxkOMEhzMSiK8zeGb0oR4UxIrq1KL8uOLSnNSiw8xmgKDdCKzlGhy
	PjCl55XEG5pYGpiYGRmbWBiaGSqJ8565UpYqJJCeWJKanZpakFoE08fEwSnVwMSnJ/Zvg1US
	r1uuSaae24wYjvsfrOb23X1tHntw/arUtyVX+3hXPuxbsqB7+eb6q2fZuA/fiXj48gnHSt+6
	JVekeFn2/fNUvs2d8TVlVeefvBS2yn9vrRYaBlqrvb29a+F+vbnqDyZozH3EtrVzjYXrIX/e
	VI+FXYU585ga1d40e9Q3L5A3X7Cm9MDtl0lrLs4yea6WdHqt9run/dtePr0h1TxDfMt2i41G
	h5xXBy7N9lE8tH/F5cMPT90NP1IqlPSCeXLI0tumBrJLUk7/8nigc13vgQzz8sPZD3sups+/
	IJKwkftUYnDXk32PkhUnv5/xPvZRjlLR4RJvN/fLKqvvOzx2f1k7v4Dvj7Grf+hUJZbijERD
	Leai4kQAdR1AnDEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvK7kpJ1pBg3POC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Ml7t
	mMBSsEOoYtr8tWwNjN38XYycHBICJhIfHnxi6WLk4hAS2M0o0f7hMSNEQlSi43IjkM0BZAtL
	HD5cDBIWEnjLKPHiShqIzSvgIXHmxlcmkBJhgUiJ9rPlIGE2AXWJJW1r2UFGigi8YJL4/2QZ
	K0iCWWAZo8Ti+ywgNouAqsSOC2uYQWxOAQeJ7fu/MULccJpR4l3zQRaIBk2J1u2/2SFsbYll
	C1+DNYgKyEs0PDzBDHGEoMTJmU9YJjAKzkLSMgtJyywkZQsYmVcxSqYWFOem5yYbFhjmpZbr
	FSfmFpfmpesl5+duYgTHkZbGDsZ78//pHWJk4mA8xCjBwawkwtscvilNiDclsbIqtSg/vqg0
	J7X4EKM0B4uSOK/hjNkpQgLpiSWp2ampBalFMFkmDk6pBiZ3s6qwaftWbfzMGLW9qtji9irr
	87znRHpvMmWJssjO5T+0j1U3yoizPLHs1Zzi1aF3OpLE1Lhu83qG+aYusk8yvWVmzOVWUv2x
	qIXbY3vWfbXvDB7XfENdfFa9NhT52PtlWkBaRVOh+keDL4acnc7++p9ZbzI5xMyczL2ogFH2
	w//ZPqKHJ9887OoZweT9zDH77hrVSbI9P9RfnNjil32pUnx2eFJuyrmktS6xVf96O4vEJnyf
	dOGCua77m0WXNPueG659Hv/D4bV72uPlkuW1h1v7A14bnEzqClXQv37gv8Kn9nc5Gt/PPhPM
	z9pa9i6v4v0ehzU5QebJL6crpO6O2fwwpvlwcIvqTNevSizFGYmGWsxFxYkALHPv9xIDAAA=
X-CMS-MailID: 20240812043953epcas1p44d4eb166f073de2f610bade4d9b96db9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071228epcas2p1923fbb513190816d7bd9afaf0a4f5066
References: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
	<CGME20240730071228epcas2p1923fbb513190816d7bd9afaf0a4f5066@epcas2p1.samsung.com>
	<20240730071221.2590284-5-sunyeal.hong@samsung.com>

On Tue, 2024-07-30 at 16:12 +0900, Sunyeal Hong wrote:
> This adds support for CMU_TOP which generates clocks for all the
> function blocks such as CORE, HSI0/1/2, PERIC0/1 and so on. For
> CMU_TOP, PLL_SHARED0,1,2,3,4 and 5 will be the sources of this block
> and they will generate bus clocks.
>=20
> Signed-off-by: Sunyeal Hong <sunyeal.hong=40samsung.com>
> ---
>  drivers/clk/samsung/Makefile             =7C    1 +
>  drivers/clk/samsung/clk-exynosautov920.c =7C 1173 ++++++++++++++++++++++
>  2 files changed, 1174 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
>=20

=5Bsnip=5D

> +static const struct samsung_cmu_info peric0_cmu_info __initconst =3D =7B
> +	.mux_clks		=3D peric0_mux_clks,
> +	.nr_mux_clks		=3D ARRAY_SIZE(peric0_mux_clks),
> +	.div_clks		=3D peric0_div_clks,
> +	.nr_div_clks		=3D ARRAY_SIZE(peric0_div_clks),
> +	.nr_clk_ids		=3D CLKS_NR_PERIC0,
> +	.clk_regs		=3D peric0_clk_regs,
> +	.nr_clk_regs		=3D ARRAY_SIZE(peric0_clk_regs),
> +	.clk_name		=3D =22dout_clkcmu_peric0_noc=22,

Maybe silly question, (I'm really new to this cmu).
Isn't it should be =22noc=22?

I thought this name is from dt binding.
(drivers/clk/samsung/clk-exynos-arm64.c)


		parent_clk =3D clk_get(dev, cmu->clk_name);
		data =3D dev_get_drvdata(dev);

That's why GS101, and my recent v9 patch name like =22bus=22.

Best regards,
kwang.

> +=7D;
> +
> +static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
> +=7B
> +	const struct samsung_cmu_info *info;
> +	struct device *dev =3D &pdev->dev;
> +
> +	info =3D of_device_get_match_data(dev);
> +	exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +	return 0;
> +=7D
> +
> +static const struct of_device_id exynosautov920_cmu_of_match=5B=5D =3D =
=7B
> +	=7B
> +		.compatible =3D =22samsung,exynosautov920-cmu-peric0=22,
> +		.data =3D &peric0_cmu_info,
> +	=7D,
> +=7D;
> +
> +static struct platform_driver exynosautov920_cmu_driver __refdata =3D =
=7B
> +	.driver =3D =7B
> +		.name =3D =22exynosautov920-cmu=22,
> +		.of_match_table =3D exynosautov920_cmu_of_match,
> +		.suppress_bind_attrs =3D true,
> +	=7D,
> +	.probe =3D exynosautov920_cmu_probe,
> +=7D;
> +
> +static int __init exynosautov920_cmu_init(void)
> +=7B
> +	return platform_driver_register(&exynosautov920_cmu_driver);
> +=7D
> +core_initcall(exynosautov920_cmu_init);


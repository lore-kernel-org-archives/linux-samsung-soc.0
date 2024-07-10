Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78063D5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578018; cv=none; b=JHyvhbOyx+nCaow7NAdEULLX7BlxTrdqpwx+0Y+r/Uu7GpbAS/AthhsYU+xEV5Rn0CKUdF/LMH8jm9VCb42g6TS5Bqff2EEMRDYzvMTah4HYy31b4W2M8HNppP5CqZ1i6V+L446lj0g1XXGMD/of7NbPZbPqVTFytiJwtb1hpf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578018; c=relaxed/simple;
	bh=L97a4qTBn5cglkvLS0T/QeC0HA3AS5duxV2FuZpJTtw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fhmd9XC2pxO1ZS8QGuuUNeaUGyM4PcgHbxH88GYdA0f6YYbQxqgIqRygj2K442QBVMELOyQgWli8ttIx1Kgb7BXz7KtrF7DK22NQSaWeFaVJWb2lwh3OSK82Qm4es2aAubIMx4ENlg6hY2S1ytRL+v3eyn+B2CC/XmNJ1Uozymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YBbgwOFP; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YBbgwOFP"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240710022014epoutp04b36431c97d4d87372242cec21de3b053~guJaKVFxb2608526085epoutp04q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2024 02:20:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240710022014epoutp04b36431c97d4d87372242cec21de3b053~guJaKVFxb2608526085epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720578014;
	bh=j6bBsUJ9Yg8pHwdzDEEETUYrAvr7IgGTXfdC3182Rlk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YBbgwOFP/t3uZ9TGbKIgXsAEvdHdW4US0wR/Ypgl2j9T6SOofoX8RRduq/FMiaGOf
	 sX2iXJHHTiZGToM/omSYw27UOK1k4E5eUmRcE5KxJTzCCL57viNJ3wJfJbhIc42Sgt
	 iFDzTvgpGjAa5Bo8EohjVUp2sYEZta7yS21Rr/vg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240710022013epcas2p37cf991bf788d711b1c32c9f2ec930023~guJZXYVcN0470904709epcas2p3u;
	Wed, 10 Jul 2024 02:20:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WJhQj1DVxz4x9Q0; Wed, 10 Jul
	2024 02:20:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	0B.5B.09806.CDFED866; Wed, 10 Jul 2024 11:20:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240710022012epcas2p1b4e376ef5687994b408cf41663f547b9~guJYdN-wX1974219742epcas2p1b;
	Wed, 10 Jul 2024 02:20:12 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240710022012epsmtrp2f27b612e2889dc8de1e2ae42776fa8a7~guJYcb5gB0518105181epsmtrp2y;
	Wed, 10 Jul 2024 02:20:12 +0000 (GMT)
X-AuditID: b6c32a47-c6bff7000000264e-e5-668defdc4488
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	91.7A.18846.CDFED866; Wed, 10 Jul 2024 11:20:12 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240710022012epsmtip1c0547ce503e5c6ec69889dae2f41e86a~guJYNJNrV1956519565epsmtip1O;
	Wed, 10 Jul 2024 02:20:12 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Rob
 Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <000601dad12e$19ff3f30$4dfdbd90$@samsung.com>
Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Wed, 10 Jul 2024 11:20:12 +0900
Message-ID: <000201dad26f$b18c3690$14a4a3b0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJHtUpDsgLCeLIQdS8546uqgvLWdQHhk3nlAbaaqcQDPX93ALDexxMw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmue7d971pBvt/MVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20jiwOvx/sbrewem1Z1snlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B
	8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
	S2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzFt/5zFYwR63i8YuHrA2MPfJdjJwc
	EgImEgsOP2PrYuTiEBLYwSjx4spvRgjnE6NE88w/zHDO5sbrrDAtXye9gmrZySjx9O9tsISQ
	wEtGiUcnCkBsNgF9idXdt8GKRATuMEncXveQFcRhFlgHNGrmEXaQKk4BK4nbW/qZuhg5OIQF
	vCXet+aAhFkEVCVa39wBK+EVsJS4/eAXC4QtKHFy5hMwm1lAXmL72znMEBcpSPx8ugzsCBEB
	N4kDZ36wQtSISMzubIOq2cMhcWJXCITtInH4xgsmCFtY4tXxLewQtpTE53d72SDsfInJ198y
	gdwsIdDAKHHtXzfUIHuJRWd+soPczCygKbF+lz6IKSGgLHHkFtRpfBIdh/+yQ4R5JTrahCAa
	1SQ+XbkMNURG4tiJZ8wTGJVmIXlsFpLHZiF5YBbCrgWMLKsYxVILinPTU4uNCozhkZ2cn7uJ
	EZx6tdx3MM54+0HvECMTB+MhRgkOZiUR3vk3utOEeFMSK6tSi/Lji0pzUosPMZoCg3ois5Ro
	cj4w+eeVxBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cAUOe3sPIvM
	kxVK1Tda5bYLKu1hrJxtn7d8aoko0zFek9Cl8wxX+fJvKVd4tMxouwXXF4P/znUPvz+P5L/w
	u83O24TtvMzLpXWKG+yCPk8U/6h/d0O0jedhY3+eukD3Ml/ODL4la115pp3u5dqqxJrkV7Ht
	SeCzgquXL9hmbfNzzIqNZtBJ2/yA47WH0L8/DnGzZpq8nBEYVpek/3/zRy2bVSzcNg4/H7Hx
	208IyRB+byV6RPUrz9LQ49ye+refzXB5a9HIo6Zk6xgpuWfW8Ysr7n3+pnV5+5Xr90zZF0Yz
	vXicdUSIrWzqQ4EHHFn791+6m2Fy3XoP64PTsVesLmx8OHOrzuWL58UTRYMPPL+jxFKckWio
	xVxUnAgAiUIJCkYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSnO6d971pBo3HxS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxYHX4/2NVnaPTas62Tw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsErozFdz6zFcxR
	q3j84iFrA2OPfBcjJ4eEgInE10mv2LoYuTiEBLYzSpxrPccOkZCR2NjwH8oWlrjfcoQVoug5
	o8S6Z6tYQRJsAvoSq7tvg3WLCDxikvj8cxc7iMMssAlo1O6bUHM/M0o83/yREaSFU8BK4vaW
	fqYuRg4OYQFvifetOSBhFgFVidY3d8DW8QpYStx+8IsFwhaUODnzCZjNLKAt8fTmUyhbXmL7
	2znMEOcpSPx8ugzsIhEBN4kDZ36wQtSISMzubGOewCg8C8moWUhGzUIyahaSlgWMLKsYRVML
	inPTc5MLDPWKE3OLS/PS9ZLzczcxgmNQK2gH47L1f/UOMTJxMB5ilOBgVhLhnX+jO02INyWx
	siq1KD++qDQntfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qByThaIyDXMPjfCl23
	ff2y/FNfMcvp7f6b3hBnui3n3frotgVRog/LhLRbut8n5wdHnlvzqN/wVfuUw/s9ZgQdCOxZ
	5y0h+HLprWcGvNaBIjN6b4n6z9X7JXkm//6M+5GLQ3+kx3PHnU85WHKnivXPdwNbvv6nzdmf
	8oO+b2jNWJ32rzYp2d345MRzoitbnU1OPbllFtwZ7/G/zHX9pN8NYUt9z2bltpRsq58XtDJ8
	Obv0sq2LBRPZPk8qyeKUeV+Y9HDPPMM/zO/fZui4Pft+z9L9ioZo/l+T/bYKyZd3r2Gdx9b8
	2Upgde+uFb4M2QFdmjU9sV7L2ZtMdjH63L7y46wap6HoXqbUj6ldCs+VWIozEg21mIuKEwG6
	0yihMAMAAA==
X-CMS-MailID: 20240710022012epcas2p1b4e376ef5687994b408cf41663f547b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p18815fee7d176f63619d244d836ab64fc
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p18815fee7d176f63619d244d836ab64fc@epcas2p1.samsung.com>
	<20240707231331.3433340-4-sunyeal.hong@samsung.com>
	<000601dad12e$19ff3f30$4dfdbd90$@samsung.com>

Hello Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Monday, July 8, 2024 8:58 PM
> To: 'Sunyeal Hong' <sunyeal.hong@samsung.com>; 'Krzysztof Kozlowski'
> <krzk@kernel.org>; 'Sylwester Nawrocki' <s.nawrocki@samsung.com>; 'Chanwoo
> Choi' <cw00.choi@samsung.com>; 'Michael Turquette'
> <mturquette@baylibre.com>; 'Stephen Boyd' <sboyd@kernel.org>; 'Rob
> Herring' <robh@kernel.org>; 'Conor Dooley' <conor+dt@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> pll_531x
> 
> Hello Sunyeal,
> 
> > -----Original Message-----
> > From: Sunyeal Hong <sunyeal.hong@samsung.com>
> > Sent: Monday, July 8, 2024 4:44 AM
> > To: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>; Alim
> > Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
> > Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux- kernel@vger.kernel.org; Sunyeal Hong <sunyeal.hong@samsung.com>
> > Subject: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for
> > pll_531x
> >
> > pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
> > pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120
> > MHz)
> >
> > PLL531x
> > FOUT = (MDIV + F/2^32-F[31]) * FIN/(PDIV x 2^SDIV)
> >
> Any reason for not mentioning equation for integer PLL?
> 
If the F value is 0, it operates as an integer PLL. 
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> Anyway, LGTM,
> 
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> >  drivers/clk/samsung/clk-pll.c | 45
> > +++++++++++++++++++++++++++++++++++
> >  drivers/clk/samsung/clk-pll.h |  1 +
> >  2 files changed, 46 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c
> > b/drivers/clk/samsung/clk-pll.c index
> > 4be879ab917e..b3bcef074ab7 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -1261,6 +1261,48 @@ static const struct clk_ops
> > samsung_pll2650xx_clk_min_ops = {
> >  	.recalc_rate = samsung_pll2650xx_recalc_rate,  };
> >
> > +/*
> > + * PLL531X Clock Type
> > + */
> > +/* Maximum lock time can be 500 * PDIV cycles */
> > +#define PLL531X_LOCK_FACTOR		(500)
> > +#define PLL531X_MDIV_MASK		(0x3FF)
> > +#define PLL531X_PDIV_MASK		(0x3F)
> > +#define PLL531X_SDIV_MASK		(0x7)
> > +#define PLL531X_FDIV_MASK		(0xFFFF)
> > +#define PLL531X_MDIV_SHIFT		(16)
> > +#define PLL531X_PDIV_SHIFT		(8)
> > +#define PLL531X_SDIV_SHIFT		(0)
> > +
> > +static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
> > +						 unsigned long parent_rate)
> > +{
> > +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> > +	u32 mdiv, pdiv, sdiv, pll_con0, pll_con8;
> > +	s32 fdiv;
> > +	u64 fout = parent_rate;
> > +
> > +	pll_con0 = readl_relaxed(pll->con_reg);
> > +	pll_con8 = readl_relaxed(pll->con_reg + 20);
> > +	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
> > +	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
> > +	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
> > +	fdiv = (s32)(pll_con8 & PLL531X_FDIV_MASK);
> > +
> > +	if (fdiv >> 31)
> > +		mdiv--;
> > +
> > +	fout *= ((u64)mdiv << 24) + (fdiv >> 8);
> > +	do_div(fout, (pdiv << sdiv));
> > +	fout >>= 24;
> > +
> > +	return (unsigned long)fout;
> > +}
> > +
> > +static const struct clk_ops samsung_pll531x_clk_ops = {
> > +	.recalc_rate = samsung_pll531x_recalc_rate, };
> > +
> >  static void __init _samsung_clk_register_pll(struct
> > samsung_clk_provider *ctx,
> >  				const struct samsung_pll_clock *pll_clk)  { @@ -
> 1394,6 +1436,9 @@
> > static void __init _samsung_clk_register_pll(struct
> > samsung_clk_provider *ctx,
> >  		else
> >  			init.ops = &samsung_pll2650xx_clk_ops;
> >  		break;
> > +	case pll_531x:
> > +		init.ops = &samsung_pll531x_clk_ops;
> > +		break;
> >  	default:
> >  		pr_warn("%s: Unknown pll type for pll clk %s\n",
> >  			__func__, pll_clk->name);
> > diff --git a/drivers/clk/samsung/clk-pll.h
> > b/drivers/clk/samsung/clk-pll.h index ffd3d52c0dec..ce9d6f21f993
> > 100644
> > --- a/drivers/clk/samsung/clk-pll.h
> > +++ b/drivers/clk/samsung/clk-pll.h
> > @@ -41,6 +41,7 @@ enum samsung_pll_type {
> >  	pll_0516x,
> >  	pll_0517x,
> >  	pll_0518x,
> > +	pll_531x,
> >  };
> >
> >  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> > --
> > 2.45.2
> 



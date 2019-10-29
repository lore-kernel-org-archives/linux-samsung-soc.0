Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6A9CA9EC3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 10:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1509214D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 10:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NZ3wyyCS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfJ2Kht (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Oct 2019 06:37:49 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41779 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729633AbfJ2Kht (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 06:37:49 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191029103747euoutp02704c6648cdd13b2a324b762b09cabc28~SF99AtTHA2490324903euoutp02E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2019 10:37:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191029103747euoutp02704c6648cdd13b2a324b762b09cabc28~SF99AtTHA2490324903euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572345467;
        bh=5AIPGZ6iWUu/JykbNtx2D1sMG73OUJARBaRRrgIYsAo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=NZ3wyyCScsdj0nznyFBd4Pu6n5uJiSxpND4U6PhJUdEmgRnOEwNUau5UR4swEMu81
         Y3zXHz5TvoA0We7nEx4MF53/dErRKwd475QQZGBhR6N3iG7hguqM9dpoqsq4MXyxUD
         l+U2hjeRCQyYtA902tfYwWg06rKlmV7V9vQP8iFE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191029103747eucas1p10ea4a0847fc046731e44fd07917239bc~SF98ud5iJ1224412244eucas1p1e;
        Tue, 29 Oct 2019 10:37:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A7.08.04374.B7618BD5; Tue, 29
        Oct 2019 10:37:47 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191029103746eucas1p155efda28967b547c76f6fc45a9b3822b~SF98MTgv31715817158eucas1p1U;
        Tue, 29 Oct 2019 10:37:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191029103746eusmtrp1d1ccafa56617714eb99c281f1ac14b29~SF98LxkaO0838208382eusmtrp12;
        Tue, 29 Oct 2019 10:37:46 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-3e-5db8167bb0e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 46.FE.04117.A7618BD5; Tue, 29
        Oct 2019 10:37:46 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191029103746eusmtip24ee99d4a587624fafe39cfa53f6242d0~SF979SVJg1135311353eusmtip2i;
        Tue, 29 Oct 2019 10:37:46 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: add VPLL rate table
To:     Marian Mihailescu <mihailescu2m@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <24492259-9ae1-6fce-870b-2ce5f1dc9874@samsung.com>
Date:   Tue, 29 Oct 2019 11:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029004758.4380-1-mihailescu2m@gmail.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42LZduzned1qsR2xBrNucFh87LnHajHj/D4m
        i/XTfrI6MHvsnHWX3ePzJrkApigum5TUnMyy1CJ9uwSujCcTYgvm8VfsPtnO2sB4haeLkZND
        QsBE4tPRDuYuRi4OIYEVjBKTJ/9ghXC+MEp8m3qfDcL5zChx7cJfFpiWiadfsYHYQgLLGSWa
        1vpCFL1llDj55AMrSEJYwEmirfs9E4gtIqAn8X/hLrAGZgEfidftzewgNpuAoUTv0T5GEJtX
        wE7i9tafYHEWAVWJ0z17gG7i4BAViJA4/TURokRQ4uTMJ2A3cApYS0zfOJsdYqS4RNOXlawQ
        trzE9rdzmCHu/M0msW+nC4TtIrFl0QEmCFtY4tXxLewQtozE6ck9LCD3Swg0M0r07L7NDuFM
        YJS4f3wBI0SVtcTh4xdZQQ5iFtCUWL9LHyLsKDFz8j82kLCEAJ/EjbeCEDfwSUzaNp0ZIswr
        0dEmBFGtIvF71XSoE6Qkup/8Z5nAqDQLyWezkHwzC8k3sxD2LmBkWcUonlpanJueWmycl1qu
        V5yYW1yal66XnJ+7iRGYOE7/O/51B+O+P0mHGAU4GJV4eCdc3hYrxJpYVlyZe4hRgoNZSYT3
        4hmgEG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBkajL5O2
        r537/b131WuW+dyvpbPkdkS6n2xuvrusq10osnW/5Z6nqbb8nIfKux7cln194afR+gWfZCXS
        G/jOLBVOPWE9zenzk8XTxSeoJZQKT89jbTUNrzpR/1k0aO3HhvLqh0aXy6VMeYR+CGvoz4/2
        FX922HFO7a43YYflVHf3RbTfjnwbvkuJpTgj0VCLuag4EQDHzS4nGAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7pVYjtiDW6fVbX42HOP1WLG+X1M
        Fuun/WR1YPbYOesuu8fnTXIBTFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkam
        Svp2NimpOZllqUX6dgl6GU8mxBbM46/YfbKdtYHxCk8XIyeHhICJxMTTr9i6GLk4hASWMkrc
        eXuAsYuRAyghJTG/RQmiRljiz7UuqJrXjBLXXrYxgySEBZwk2rrfM4HYIgJ6Ev8X7oIq6mOU
        WHtvNQtIglnAR+J1ezM7iM0mYCjRe7SPEcTmFbCTuL31J1icRUBV4nTPHrChogIREs+334Cq
        EZQ4OfMJ2BxOAWuJ6Rtns0PMVJf4M+8SM4QtLtH0ZSUrhC0vsf3tHOYJjEKzkLTPQtIyC0nL
        LCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRGy7ZjP7fsYOx6F3yIUYCDUYmH98XV
        bbFCrIllxZW5hxglOJiVRHgvngEK8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wkvNK4g1N
        Dc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTCm/Qh9LLqgKsYi+YJdzorv
        O7wmKjudr9SYWDuT62T+u+JLu86ZKB3LZS82uWvHcMiz+dip5aIyP+65r541qaL3l8s7SY01
        DzcZdDJyvP0qqcJ3zJ/HQ23/vOQ1b87GFcSf9THQCFRUWnH9bbCQnxybG8/+y5te6xWdfLOt
        O3bJNl/bVwfWu0sosRRnJBpqMRcVJwIAnt4s+6wCAAA=
X-CMS-MailID: 20191029103746eucas1p155efda28967b547c76f6fc45a9b3822b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191029004815epcas4p32796910466992ec23adeb32180641232
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191029004815epcas4p32796910466992ec23adeb32180641232
References: <CGME20191029004815epcas4p32796910466992ec23adeb32180641232@epcas4p3.samsung.com>
        <20191029004758.4380-1-mihailescu2m@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/29/19 01:47, Marian Mihailescu wrote:
> Add new table rate for VPLL for Exynos 542x SoC required to support
> Mali GPU clock frequencies.
> 
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>

Patch applied, thank you. Please remember to also Cc in future any clk patches 
to the linux-clk@vger.kernel.org mailing list.

> ---
>  drivers/clk/samsung/clk-exynos5420.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 7670cc596c74..f3133ed467c2 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1414,6 +1414,17 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>  	PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
>  };
>  
> +static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> +	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
> +	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
> +	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
> +	PLL_35XX_RATE(24 * MHZ, 420000000U,  140, 2, 2),
> +	PLL_35XX_RATE(24 * MHZ, 350000000U,  175, 3, 2),
> +	PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
> +	PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
> +	PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
> +};
> +
>  static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
>  	[apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
>  		APLL_CON0, NULL),
> @@ -1538,6 +1549,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
>  		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
>  		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
>  		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
> +		exynos5x_plls[vpll].rate_table = exynos5420_vpll_24mhz_tbl;
>  	}
>  
>  	if (soc == EXYNOS5420)


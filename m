Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37479C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C466044F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhJOHR3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 03:17:29 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37228 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235962AbhJOHR2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 03:17:28 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211015071521euoutp02c6c993f1db888bd1a7b244fddb0d9e14~uIu5IhhaO1851718517euoutp02q
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 07:15:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211015071521euoutp02c6c993f1db888bd1a7b244fddb0d9e14~uIu5IhhaO1851718517euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634282121;
        bh=EaH3Cp31NHq2pqxFHdBRhJ/Un4ZPdVWsfbJ/WuIrQBo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=tlBxmQBb0N7ehEyqXq6CVsacR3WmMYIQYc8I6KQn7+SdQq8seut3P74lZ3e+wHfXi
         t+L4rxjh3JQOt4XrjPtpLWNB312PMLuE43zJ6HiaSz+AB1ycghWODqRKYhBvKVKHu8
         xZFovDMHNXpVi4BxQ8s3m2a9aH12hYejn+SROzWs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211015071521eucas1p2c840d078f4def7d20368dda7764c5e7e~uIu4psu8N1296312963eucas1p2L;
        Fri, 15 Oct 2021 07:15:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C6.EA.45756.88A29616; Fri, 15
        Oct 2021 08:15:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211015071520eucas1p2ba3bec44bfd9a672e4f2ab8b6d933a49~uIu4PZlH-1550115501eucas1p2U;
        Fri, 15 Oct 2021 07:15:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211015071520eusmtrp1d5f6e0460dd2c3511e6be26e9d7dda45~uIu4OltbV0515805158eusmtrp1I;
        Fri, 15 Oct 2021 07:15:20 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-5a-61692a885572
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.80.20981.88A29616; Fri, 15
        Oct 2021 08:15:20 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211015071519eusmtip2fa306cf799a72e22d8683da45b5e5baf~uIu3co5bu2780827808eusmtip23;
        Fri, 15 Oct 2021 07:15:19 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] [RFT] clk: samsung: exynos5433: update apollo
 and atlas clock probing
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <fdf392ee-ecdd-327f-1302-c8a2d216dd07@samsung.com>
Date:   Fri, 15 Oct 2021 09:15:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-3-willmcvicker@google.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djPc7odWpmJBl0NVhbXvzxntdixXcRi
        49sfTBabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4vCbdlaLf9c2slis2vWH0WLVp/+MDjwe
        23ZvY/V4f6OV3WNWQy+bx85Zd9k9Fmwq9di0qpPNY/OSeo++LasYPT5vkgvgjOKySUnNySxL
        LdK3S+DKWN72nrmgR7di6a6/rA2MN1S7GDk5JARMJP62zGbvYuTiEBJYwSix78NcJgjnC6PE
        n507WCCcz4wSJ1o3MsO0/N/VxQZiCwksZ5RouVgNUfSRUaLhyn4mkISwQLJE07c9YHNFBDYx
        STTsfcoK4jALLGSUeLNxO1g7m4ChRNdbiFG8AnYSezfsAVvBIqAq0fFyMdgkUaBJ0/42MUPU
        CEqcnPmEBcTmFLCXWL9hO1gNs4C8xPa3c5ghbHGJW0/mgz0hITCdU2LpmfVACziAHBeJ/iWe
        EC8IS7w6voUdwpaROD25hwWivplR4uG5tewQTg+jxOWmGYwQVdYSd879AhvELKApsX6XPkTY
        UeLmsU2sEPP5JG68FYS4gU9i0rbpzBBhXomONiGIajWJWcfXwa09eOES8wRGpVlIPpuF5JtZ
        SL6ZhbB3ASPLKkbx1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMDEdvrf8U87GOe++qh3iJGJ
        g/EQowQHs5II77sD6YlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeVfNXhMvJJCeWJKanZpakFoE
        k2Xi4JRqYCr8xacUU3aRQyYuVNPTIOza79m2Sm9uJT2fwyvZYBoxJ3aZxOI/Dkn+kZbyU8xk
        hI6sUZtcanL6mbuQz34O5b+H+zh6v9paeeqcn7C3wNpyvpvUlMLNMz8GpFud6Un3WpKaffjn
        I8vW03N3r7L0+9vW+uTu2SMyz7Z53nkv0O57JviZiPOyKeYtTTcOK9k/b+dbyzZzAtPkGZpT
        cvWv7wwVtXN8Ed7VYb62QreiI6J5c/iDb9xFy7f92p69g9c5d/507junrbbd+/wlKlX/y9E3
        kyzmvEr+m2AjyXfXwFGhZvGOGLb/quGbMtmfHltxt2xryKlm34meh57Xlmu2XnrG6hzQqDTb
        8Mj6Kyuaw5VYijMSDbWYi4oTAT/RV9zbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xe7odWpmJBrsvK1hc//Kc1WLHdhGL
        jW9/MFlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRotVn/4zOvB4
        bNu9jdXj/Y1Wdo9ZDb1sHjtn3WX3WLCp1GPTqk42j81L6j36tqxi9Pi8SS6AM0rPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY3nbe+aCHt2Kpbv+
        sjYw3lDtYuTkkBAwkfi/q4uti5GLQ0hgKaPE7lPTmCESMhInpzWwQtjCEn+uwRS9Z5TYf+wD
        O0hCWCBZ4uf9bnaQhIjAJiaJvtPbwKqYBRYySrRseskC0XKcUWL2jolgc9kEDCW63oLM4uTg
        FbCT2LthD1icRUBVouPlYiYQWxRo7NvX35kgagQlTs58wgJicwrYS6zfsB0szixgJjFv80Nm
        CFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeu
        l5yfu4kRGM3bjv3csoNx5auPeocYmTgYDzFKcDArifC+O5CeKMSbklhZlVqUH19UmpNafIjR
        FOificxSosn5wHSSVxJvaGZgamhiZmlgamlmrCTOa3JkTbyQQHpiSWp2ampBahFMHxMHp1QD
        07wbYpZz1BI9dk14s5tJZePsNr7WPf5d5TqqkR9VViqW6Zk6FTf9YT4T8vh9Wv2Db2YizfOZ
        XvZX3/2VwzX790Fr/x52+0fvnRKnfj7C7lB40+UMt8B3vnPrYs+q/vgpoXj32aqG+w+ZMqNT
        gpim6VjdZF+j+1jxQ8uhE/LC/z5Pf3x4f9hCkcmzXzpravIc8CxZmsu64afcdN2LTb/uf15m
        fMx+VfXVacwFWx/tW3MtWEpE+EKd1Mcbj6+bu65bWap38fbr7Zaed/J+F/hZhsy4/e1XFB/f
        3/RS3T8FJ5Y1FjvN/tfxSkY41eFSVvHxg41Pbv/X4kmfJOsZ1X76R+Gu1e3q7eWO8T1Wc10V
        KpVYijMSDbWYi4oTAYxNlgxvAwAA
X-CMS-MailID: 20211015071520eucas1p2ba3bec44bfd9a672e4f2ab8b6d933a49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211014195400eucas1p2d462745cdc4cfb504bf2f265827f9c27
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211014195400eucas1p2d462745cdc4cfb504bf2f265827f9c27
References: <20211014195347.3635601-1-willmcvicker@google.com>
        <CGME20211014195400eucas1p2d462745cdc4cfb504bf2f265827f9c27@eucas1p2.samsung.com>
        <20211014195347.3635601-3-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.10.2021 21:53, Will McVicker wrote:
> Use the samsung common clk driver to initialize the apollo and atlas
> clocks. This removes their custom init functions and uses the
> samsung_cmu_register_one() instead.
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
>   1 file changed, 48 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index f203074d858b..cec66d2a4ee2 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -3675,44 +3675,32 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
>   	{  0 },
>   };
>   
> +static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
> +	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", CLK_MOUT_APOLLO_PLL,
> +			CLK_MOUT_BUS_PLL_APOLLO_USER,
> +			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
> +			exynos5433_apolloclk_d),
> +};
> +
> +static const struct samsung_cmu_info apollo_cmu_info __initconst = {
> +	.pll_clks	= apollo_pll_clks,
> +	.nr_pll_clks	= ARRAY_SIZE(apollo_pll_clks),
> +	.mux_clks	= apollo_mux_clks,
> +	.nr_mux_clks	= ARRAY_SIZE(apollo_mux_clks),
> +	.div_clks	= apollo_div_clks,
> +	.nr_div_clks	= ARRAY_SIZE(apollo_div_clks),
> +	.gate_clks	= apollo_gate_clks,
> +	.nr_gate_clks	= ARRAY_SIZE(apollo_gate_clks),
> +	.cpu_clks	= apollo_cpu_clks,
> +	.nr_cpu_clks	= ARRAY_SIZE(apollo_cpu_clks),
> +	.nr_clk_ids	= APOLLO_NR_CLK,
> +	.clk_regs	= apollo_clk_regs,
> +	.nr_clk_regs	= ARRAY_SIZE(apollo_clk_regs),
> +};
> +
>   static void __init exynos5433_cmu_apollo_init(struct device_node *np)
>   {
> -	void __iomem *reg_base;
> -	struct samsung_clk_provider *ctx;
> -	struct clk_hw **hws;
> -
> -	reg_base = of_iomap(np, 0);
> -	if (!reg_base) {
> -		panic("%s: failed to map registers\n", __func__);
> -		return;
> -	}
> -
> -	ctx = samsung_clk_init(np, reg_base, APOLLO_NR_CLK);
> -	if (!ctx) {
> -		panic("%s: unable to allocate ctx\n", __func__);
> -		return;
> -	}
> -
> -	samsung_clk_register_pll(ctx, apollo_pll_clks,
> -				 ARRAY_SIZE(apollo_pll_clks), reg_base);
> -	samsung_clk_register_mux(ctx, apollo_mux_clks,
> -				 ARRAY_SIZE(apollo_mux_clks));
> -	samsung_clk_register_div(ctx, apollo_div_clks,
> -				 ARRAY_SIZE(apollo_div_clks));
> -	samsung_clk_register_gate(ctx, apollo_gate_clks,
> -				  ARRAY_SIZE(apollo_gate_clks));
> -
> -	hws = ctx->clk_data.hws;
> -
> -	exynos_register_cpu_clock(ctx, CLK_SCLK_APOLLO, "apolloclk",
> -		hws[CLK_MOUT_APOLLO_PLL], hws[CLK_MOUT_BUS_PLL_APOLLO_USER], 0x200,
> -		exynos5433_apolloclk_d, ARRAY_SIZE(exynos5433_apolloclk_d),
> -		CLK_CPU_HAS_E5433_REGS_LAYOUT);
> -
> -	samsung_clk_sleep_init(reg_base, apollo_clk_regs,
> -			       ARRAY_SIZE(apollo_clk_regs));
> -
> -	samsung_clk_of_add_provider(np, ctx);
> +	samsung_cmu_register_one(np, &apollo_cmu_info);
>   }
>   CLK_OF_DECLARE(exynos5433_cmu_apollo, "samsung,exynos5433-cmu-apollo",
>   		exynos5433_cmu_apollo_init);
> @@ -3932,44 +3920,32 @@ static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst =
>   	{  0 },
>   };
>   
> -static void __init exynos5433_cmu_atlas_init(struct device_node *np)
> -{
> -	void __iomem *reg_base;
> -	struct samsung_clk_provider *ctx;
> -	struct clk_hw **hws;
> -
> -	reg_base = of_iomap(np, 0);
> -	if (!reg_base) {
> -		panic("%s: failed to map registers\n", __func__);
> -		return;
> -	}
> -
> -	ctx = samsung_clk_init(np, reg_base, ATLAS_NR_CLK);
> -	if (!ctx) {
> -		panic("%s: unable to allocate ctx\n", __func__);
> -		return;
> -	}
> -
> -	samsung_clk_register_pll(ctx, atlas_pll_clks,
> -				 ARRAY_SIZE(atlas_pll_clks), reg_base);
> -	samsung_clk_register_mux(ctx, atlas_mux_clks,
> -				 ARRAY_SIZE(atlas_mux_clks));
> -	samsung_clk_register_div(ctx, atlas_div_clks,
> -				 ARRAY_SIZE(atlas_div_clks));
> -	samsung_clk_register_gate(ctx, atlas_gate_clks,
> -				  ARRAY_SIZE(atlas_gate_clks));
> -
> -	hws = ctx->clk_data.hws;
> -
> -	exynos_register_cpu_clock(ctx, CLK_SCLK_ATLAS, "atlasclk",
> -		hws[CLK_MOUT_ATLAS_PLL], hws[CLK_MOUT_BUS_PLL_ATLAS_USER], 0x200,
> -		exynos5433_atlasclk_d, ARRAY_SIZE(exynos5433_atlasclk_d),
> -		CLK_CPU_HAS_E5433_REGS_LAYOUT);
> +static const struct samsung_cpu_clock atlas_cpu_clks[] __initconst = {
> +	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", CLK_MOUT_ATLAS_PLL,
> +			CLK_MOUT_BUS_PLL_ATLAS_USER,
> +			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
> +			exynos5433_atlasclk_d),
> +};
>   
> -	samsung_clk_sleep_init(reg_base, atlas_clk_regs,
> -			       ARRAY_SIZE(atlas_clk_regs));
> +static const struct samsung_cmu_info atlas_cmu_info __initconst = {
> +	.pll_clks	= atlas_pll_clks,
> +	.nr_pll_clks	= ARRAY_SIZE(atlas_pll_clks),
> +	.mux_clks	= atlas_mux_clks,
> +	.nr_mux_clks	= ARRAY_SIZE(atlas_mux_clks),
> +	.div_clks	= atlas_div_clks,
> +	.nr_div_clks	= ARRAY_SIZE(atlas_div_clks),
> +	.gate_clks	= atlas_gate_clks,
> +	.nr_gate_clks	= ARRAY_SIZE(atlas_gate_clks),
> +	.cpu_clks	= atlas_cpu_clks,
> +	.nr_cpu_clks	= ARRAY_SIZE(atlas_cpu_clks),
> +	.nr_clk_ids	= ATLAS_NR_CLK,
> +	.clk_regs	= atlas_clk_regs,
> +	.nr_clk_regs	= ARRAY_SIZE(atlas_clk_regs),
> +};
>   
> -	samsung_clk_of_add_provider(np, ctx);
> +static void __init exynos5433_cmu_atlas_init(struct device_node *np)
> +{
> +	samsung_cmu_register_one(np, &atlas_cmu_info);
>   }
>   CLK_OF_DECLARE(exynos5433_cmu_atlas, "samsung,exynos5433-cmu-atlas",
>   		exynos5433_cmu_atlas_init);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


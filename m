Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA79DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C726A6023D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243454AbhJOXMj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 19:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239063AbhJOXMg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 19:12:36 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B525EC061570;
        Fri, 15 Oct 2021 16:10:29 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id j190so3137883pgd.0;
        Fri, 15 Oct 2021 16:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U0Vy6bVXybkv53dFNF38s80qQNlt4Z5kP9WaLGyZk/E=;
        b=O9Pb1VFAloLs1rCfcnuN/ac4CVSbFCF6MoWhzc0t6NNvReQP3lWfjGMeZlGnzLzrHS
         l4i0Y6LwhUloqmH82MQOE24or+ERzsAUtq/I4FBm/OgF9ni66crpT42+HBwsnRn30pXS
         QqqUL9DG6ghP+so0/CZwxE2oUbMfB/bL7DAD4PJFhJrg+l5AKsjpyH1RZWtKwwjXnqA6
         F/gRS0dTUSgsW2sMhK0iMFnNFjLdKJRKpAQTUX1tx0rFjWjiPh3fWBymysH8pPvDVx3a
         20+Tt+yUHjPRMLH8w+A3r3iie8NbWXH2QV0VJ5YVHr7EogSX2N6NJjcKYWuJI+TOcsOu
         4XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U0Vy6bVXybkv53dFNF38s80qQNlt4Z5kP9WaLGyZk/E=;
        b=2WE5lL6w0TAV5X8aeasilwwz3nf80OATf5fOL6fa/wFZ+hP5IYNOcv2t0rjBH5rAb9
         4Ttvlki3eX1L4XBvXBFgGFlDSnRKFwzJbCHJLZa+Yek9W3YSBXKo1N2uZQ/6EYEtZR3B
         a9P1SRdWcqaPSOxMs7B7L/+HTKPlwrFfCAGpv/IiAWtsT8HAYB6GzDdb3zXsWGGvubJ7
         kPsxV1eZg9BkamFotIXxbisCnKxvvideNiUD20iQla2S3Z0Cd8FKqw2x7+8mMI55vl2i
         jKMZM/2edL7NOprsHxgwyrLijdoDIIYKg0ERfFS74XmQLg5zF1p4YNyEuEzhX8n/BemO
         r/Ng==
X-Gm-Message-State: AOAM5317DEU2Egr3okQJjPVI4oY30xM/zaV3Q4Rp9vR5W/OLzhTvC3oE
        uT/PWINkK8CGeozmIowNXnk=
X-Google-Smtp-Source: ABdhPJxrvR29INUiL1phb2tUnsp09WITr2GSA5PvcDicS0wdhOdoyLEVHfAJAI51ZTor6YvZuytmYg==
X-Received: by 2002:a63:1444:: with SMTP id 4mr11054827pgu.251.1634339429240;
        Fri, 15 Oct 2021 16:10:29 -0700 (PDT)
Received: from [172.30.1.32] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id rj6sm2336137pjb.30.2021.10.15.16.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 16:10:28 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] [RFT] clk: samsung: exynos5433: update apollo and
 atlas clock probing
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211014195347.3635601-1-willmcvicker@google.com>
 <20211014195347.3635601-3-willmcvicker@google.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <d36e8ab1-ad0b-835d-e4a3-7f0cbb3f27ff@gmail.com>
Date:   Sat, 16 Oct 2021 08:10:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-3-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 10. 15. 오전 4:53, Will McVicker wrote:
> Use the samsung common clk driver to initialize the apollo and atlas
> clocks. This removes their custom init functions and uses the
> samsung_cmu_register_one() instead.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
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
> 

Looks good to me. Thanks for your work.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1240C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 15:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD03D61247
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 15:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238261AbhIOQBF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 12:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238257AbhIOQBC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 12:01:02 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6E6C061574;
        Wed, 15 Sep 2021 08:59:43 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id g14so3119819pfm.1;
        Wed, 15 Sep 2021 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OkiiGHbQZwoirzVbd8s1wT3AXOTUQoT8rTgbKgTYjH4=;
        b=i6EO+HrgwbvJsQQ2YpEuIGI4TcPgkJrKnEjI6rVzmv43sG7iAOiMxSi8VMiO7XfNxa
         xpZLDsFfVQU/Lzfp9ltItNYsiGW6PA2gvJNHY1/7YqNnfNiauIxwd551577USgAzG5vu
         h2KMGwriNN3SUmjFDXLuTdMYh+iYfbi8Py8eRbAut0j9y8gZwtU4EflVGllx8zeLeMTv
         B6DiJ9HjgSFfdv4UdIyMy0fLisYWx5BR9r2GKjokxyzeOjeG/YrL0qtET75pbxoB+XfD
         vDxCwfDEnPDlzKQUrYloEwtQCcTPT1mec32x40Gmc1scCqBPD6iIJSfymnvo3ilAL0d6
         ZWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OkiiGHbQZwoirzVbd8s1wT3AXOTUQoT8rTgbKgTYjH4=;
        b=M9OH8exjNYo20Z9YEUZyj9WAmNfWuJf1mtPg9A6PWaOHCnVoKwLraMAIOFQhwcj08C
         6+wI9rDTZMSq1mJToF09uVd2TeSXhJerbtCgmpPl47b2YToaMD3E4X9Asd/NKSbT7Vq2
         D1NGB7ggQcclagtg5ZZbAs/p1yGDIbNMAlyaYMcUN56ePUK0998fAEm8ER0Qif//xAcj
         0EQrBELJvovHbaTWM6L/muyzT845xGUV7zYG4uFpTz+VABV8ghJrz9PaQFnrIz8rQW6s
         fMs7I3YEpCnHNGVKfYv2FijUt7Ao0NgKDdjHc2SMg6KAZ1p7zeBUanBcDqhHki7ub9Zy
         Ta3g==
X-Gm-Message-State: AOAM531Igiqhl99QYfupE9w9pLQMyG0pUaHvYQtSBtqY5JzmX+fEpzMx
        Cu6CIfoXOMCkw/9yaA/U8j4BzI1P92M=
X-Google-Smtp-Source: ABdhPJzTCnp9h5O3IHeMY3Inj2+Eq4maNRLbgxyOToF3HlhlL29u6LufFYNlHAqNrKXM2EsrSj63KA==
X-Received: by 2002:a63:841:: with SMTP id 62mr445090pgi.354.1631721582877;
        Wed, 15 Sep 2021 08:59:42 -0700 (PDT)
Received: from [172.30.1.2] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id j6sm385502pgq.0.2021.09.15.08.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 08:59:41 -0700 (PDT)
Subject: Re: [PATCH 2/6] clk: samsung: clk-pll: Implement pll0822x PLL type
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-3-semen.protsenko@linaro.org>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <faa9a9b7-919a-5b99-f99a-9550cc3d1260@gmail.com>
Date:   Thu, 16 Sep 2021 00:59:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 9. 15. 오전 12:56, Sam Protsenko wrote:
> pll0822x PLL is used in Exynos850 SoC for top-level integer PLLs. The
> code was derived from very similar pll35xx type, with next differences:
> 
> 1. Lock time for pll0822x is 150*P_DIV, when for pll35xx it's 270*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>     performing PLL lock procedure (which is done in pll35xx
>     implementation)
> 
> When defining pll0822x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>      PLL(pll_0822x, 0, "fout_shared0_pll", "oscclk",
>          PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>          exynos850_shared0_pll_rates),
> 
> To define PLL rates table, one can use PLL_35XX_RATE() macro, e.g.:
> 
>      PLL_35XX_RATE(26 * MHZ, 1600 * MHZ, 800, 13, 0)
> 
> as it's completely appropriate for pl0822x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>      Could not lock PLL fout_shared1_pll
> 
> That can happen for example if bootloader clears that bit beforehand.
> PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
> cleared, it's assumed it was done for a reason and it shouldn't be
> possible to change that PLL's rate at all.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/clk/samsung/clk-pll.c | 91 +++++++++++++++++++++++++++++++++++
>   drivers/clk/samsung/clk-pll.h |  1 +
>   2 files changed, 92 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 5873a9354b50..03131b149c0b 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -415,6 +415,89 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
>   	.recalc_rate = samsung_pll36xx_recalc_rate,
>   };
>   
> +/*
> + * PLL0822x Clock Type
> + */
> +/* Maximum lock time can be 150 * PDIV cycles */
> +#define PLL0822X_LOCK_FACTOR		(150)
> +
> +#define PLL0822X_MDIV_MASK		(0x3FF)
> +#define PLL0822X_PDIV_MASK		(0x3F)
> +#define PLL0822X_SDIV_MASK		(0x7)
> +#define PLL0822X_MDIV_SHIFT		(16)
> +#define PLL0822X_PDIV_SHIFT		(8)
> +#define PLL0822X_SDIV_SHIFT		(0)
> +#define PLL0822X_LOCK_STAT_SHIFT	(29)
> +#define PLL0822X_ENABLE_SHIFT		(31)
> +
> +static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> +	u32 mdiv, pdiv, sdiv, pll_con3;
> +	u64 fvco = parent_rate;
> +
> +	pll_con3 = readl_relaxed(pll->con_reg);
> +	mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
> +	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
> +	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
> +
> +	fvco *= mdiv;
> +	do_div(fvco, (pdiv << sdiv));
> +
> +	return (unsigned long)fvco;
> +}
> +
> +static int samsung_pll0822x_set_rate(struct clk_hw *hw, unsigned long drate,
> +				     unsigned long prate)
> +{
> +	const struct samsung_pll_rate_table *rate;
> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> +	u32 pll_con3;
> +
> +	/* Get required rate settings from table */
> +	rate = samsung_get_pll_settings(pll, drate);
> +	if (!rate) {
> +		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
> +			drate, clk_hw_get_name(hw));
> +		return -EINVAL;
> +	}
> +
> +	/* Change PLL PMS values */
> +	pll_con3 = readl_relaxed(pll->con_reg);
> +	pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
> +			(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
> +			(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
> +	pll_con3 |= (rate->mdiv << PLL0822X_MDIV_SHIFT) |
> +			(rate->pdiv << PLL0822X_PDIV_SHIFT) |
> +			(rate->sdiv << PLL0822X_SDIV_SHIFT);
> +
> +	/* Set PLL lock time */
> +	writel_relaxed(rate->pdiv * PLL0822X_LOCK_FACTOR,
> +			pll->lock_reg);
> +
> +	/* Write PMS values */
> +	writel_relaxed(pll_con3, pll->con_reg);
> +
> +	/* Wait for PLL lock if the PLL is enabled */
> +	if (pll_con3 & BIT(pll->enable_offs))
> +		return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops samsung_pll0822x_clk_ops = {
> +	.recalc_rate = samsung_pll0822x_recalc_rate,
> +	.round_rate = samsung_pll_round_rate,
> +	.set_rate = samsung_pll0822x_set_rate,
> +	.enable = samsung_pll3xxx_enable,
> +	.disable = samsung_pll3xxx_disable,
> +};
> +
> +static const struct clk_ops samsung_pll0822x_clk_min_ops = {
> +	.recalc_rate = samsung_pll0822x_recalc_rate,
> +};
> +
>   /*
>    * PLL45xx Clock Type
>    */
> @@ -1296,6 +1379,14 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>   		else
>   			init.ops = &samsung_pll35xx_clk_ops;
>   		break;
> +	case pll_0822x:
> +		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
> +		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
> +		if (!pll->rate_table)
> +			init.ops = &samsung_pll0822x_clk_min_ops;
> +		else
> +			init.ops = &samsung_pll0822x_clk_ops;
> +		break;
>   	case pll_4500:
>   		init.ops = &samsung_pll45xx_clk_min_ops;
>   		break;
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 79e41c226b90..213e94a97f23 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -36,6 +36,7 @@ enum samsung_pll_type {
>   	pll_1451x,
>   	pll_1452x,
>   	pll_1460x,
> +	pll_0822x,
>   };
>   
>   #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> 

Even if I have not Exynos850 TRM, it looks good to me. Thanks.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

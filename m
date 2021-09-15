Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1314FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 16:11:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA69860FED
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 16:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhIOQMv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 12:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhIOQMv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 12:12:51 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97192C061574;
        Wed, 15 Sep 2021 09:11:32 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so2587374pjq.1;
        Wed, 15 Sep 2021 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kQO6nJ7xYUr/Ykm70q0a3iQ3nfJt+frCs5YZoOVN9zY=;
        b=LsLZ53W19vXphqy0E7nrOjzeG2Wbsso/8h3TJIIfQQRuc0RUgbveL6lTIGCryK5ICK
         dH2BmynoDBTi13Srk/l05UDc7tV++8V9MfHd6mfmt2pVAbzr3mlqvcRvKKUh8pFKOoZ8
         wW2ew25ZOQkBSXbDgqEfZHJ75rRJFC9eHN0Rq4SqWn5fGx2l+SbTSH9FB6bzcWnk7GiL
         OoPO5p8/W+2w+oW98TmIQmrAfw1wIr3CtAidISGz1qcygyjqeK/WUqaI82lDKe+gLvI6
         EVVO7AWLx2ThQWqH/053b9kOTd6fFdc64DAAc5YK643X1SrL5wr7gPjKmuTHe9VB/zRS
         QyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kQO6nJ7xYUr/Ykm70q0a3iQ3nfJt+frCs5YZoOVN9zY=;
        b=yNPsuqc9xqczy6dr1THQLQY/3KrbczB9cOpBXA9ltp4+xvzHJHHUn7uip8eRqmtrBg
         BJ6TAHpZlFFFSrHP8yAt0u4uYZ69BW+OIbyuAhZ25wbB40isvyMlpz9rAfSLWu/SCDPA
         E+7LGn55Uyuu+kGRJ4prREfoWGN99z2sm742RR6UIrDK8aSjcIgR9ZYAU+cwwXhgES36
         ueLg9Vb2TPv+3aAQknb72+1fnq0G6MTxmoiYbM3g6W/TVn8ozUTYEcwVsW3gxl6xe3UM
         8A25qeyQQBVjx9DrDOhzoeE3uaEudsbqGN8pfv9wcZ84Qorhcmq2BgiMFUTbFA7TgUqN
         gm3Q==
X-Gm-Message-State: AOAM531G+ehNo6tGr2M60BKwablD5au3Z/uCbEwdcAVxm+oLP2LY0dCo
        VYeN9GbmyQSFlVMgwvBVNc5rLQiMQkY=
X-Google-Smtp-Source: ABdhPJw/BYjCeW0zWZelSqU0PtOxUWW3Ypjbbznf/ZERjJWSgWst9vojOReseuHw30zHtMoa0FfIIg==
X-Received: by 2002:a17:902:b696:b0:13a:7871:55f5 with SMTP id c22-20020a170902b69600b0013a787155f5mr404069pls.60.1631722291639;
        Wed, 15 Sep 2021 09:11:31 -0700 (PDT)
Received: from [172.30.1.2] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id cm5sm200499pjb.24.2021.09.15.09.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 09:11:31 -0700 (PDT)
Subject: Re: [PATCH 3/6] clk: samsung: clk-pll: Implement pll0831x PLL type
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
 <20210914155607.14122-4-semen.protsenko@linaro.org>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <c534c85e-d5a6-43e0-25f6-3d0ff3bc1f68@gmail.com>
Date:   Thu, 16 Sep 2021 01:11:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 9. 15. 오전 12:56, Sam Protsenko wrote:
> pll0831x PLL is used in Exynos850 SoC for top-level fractional PLLs. The
> code was derived from very similar pll36xx type, with next differences:
> 
> 1. Lock time for pll0831x is 500*P_DIV, when for pll36xx it's 3000*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>     performing PLL lock procedure (which is done in pll36xx
>     implementation)
> 3. The offset from PMS-values register to K-value register is 0x8 for
>     pll0831x, when for pll36xx it's 0x4
> 
> When defining pll0831x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>      PLL(pll_0831x, 0, "fout_mmc_pll", "oscclk",
>          PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, pll0831x_26mhz_tbl),
> 
> To define PLL rates table, one can use PLL_36XX_RATE() macro, e.g.:
> 
>      PLL_36XX_RATE(26 * MHZ, 799999877, 31, 1, 0, -15124)
> 
> as it's completely appropriate for pl0831x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>      Could not lock PLL fout_mmc_pll
> 
> That can happen for example if bootloader clears that bit beforehand.
> PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
> cleared, it's assumed it was done for a reason and it shouldn't be
> possible to change that PLL's rate at all.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/clk/samsung/clk-pll.c | 105 ++++++++++++++++++++++++++++++++++
>   drivers/clk/samsung/clk-pll.h |   1 +
>   2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 03131b149c0b..83d1b03647db 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -498,6 +498,103 @@ static const struct clk_ops samsung_pll0822x_clk_min_ops = {
>   	.recalc_rate = samsung_pll0822x_recalc_rate,
>   };
>   
> +/*
> + * PLL0831x Clock Type
> + */
> +/* Maximum lock time can be 500 * PDIV cycles */
> +#define PLL0831X_LOCK_FACTOR		(500)
> +
> +#define PLL0831X_KDIV_MASK		(0xFFFF)
> +#define PLL0831X_MDIV_MASK		(0x1FF)
> +#define PLL0831X_PDIV_MASK		(0x3F)
> +#define PLL0831X_SDIV_MASK		(0x7)
> +#define PLL0831X_MDIV_SHIFT		(16)
> +#define PLL0831X_PDIV_SHIFT		(8)
> +#define PLL0831X_SDIV_SHIFT		(0)
> +#define PLL0831X_KDIV_SHIFT		(0)
> +#define PLL0831X_LOCK_STAT_SHIFT	(29)
> +#define PLL0831X_ENABLE_SHIFT		(31)
> +
> +static unsigned long samsung_pll0831x_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> +	u32 mdiv, pdiv, sdiv, pll_con3, pll_con5;
> +	s16 kdiv;
> +	u64 fvco = parent_rate;
> +
> +	pll_con3 = readl_relaxed(pll->con_reg);
> +	pll_con5 = readl_relaxed(pll->con_reg + 8);
> +	mdiv = (pll_con3 >> PLL0831X_MDIV_SHIFT) & PLL0831X_MDIV_MASK;
> +	pdiv = (pll_con3 >> PLL0831X_PDIV_SHIFT) & PLL0831X_PDIV_MASK;
> +	sdiv = (pll_con3 >> PLL0831X_SDIV_SHIFT) & PLL0831X_SDIV_MASK;
> +	kdiv = (s16)((pll_con5 >> PLL0831X_KDIV_SHIFT) & PLL0831X_KDIV_MASK);
> +
> +	fvco *= (mdiv << 16) + kdiv;
> +	do_div(fvco, (pdiv << sdiv));
> +	fvco >>= 16;
> +
> +	return (unsigned long)fvco;
> +}
> +
> +static int samsung_pll0831x_set_rate(struct clk_hw *hw, unsigned long drate,
> +				     unsigned long parent_rate)
> +{
> +	const struct samsung_pll_rate_table *rate;
> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> +	u32 pll_con3, pll_con5;
> +
> +	/* Get required rate settings from table */
> +	rate = samsung_get_pll_settings(pll, drate);
> +	if (!rate) {
> +		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
> +			drate, clk_hw_get_name(hw));
> +		return -EINVAL;
> +	}
> +
> +	pll_con3 = readl_relaxed(pll->con_reg);
> +	pll_con5 = readl_relaxed(pll->con_reg + 8);
> +
> +	/* Change PLL PMSK values */
> +	pll_con3 &= ~((PLL0831X_MDIV_MASK << PLL0831X_MDIV_SHIFT) |
> +			(PLL0831X_PDIV_MASK << PLL0831X_PDIV_SHIFT) |
> +			(PLL0831X_SDIV_MASK << PLL0831X_SDIV_SHIFT));
> +	pll_con3 |= (rate->mdiv << PLL0831X_MDIV_SHIFT) |
> +			(rate->pdiv << PLL0831X_PDIV_SHIFT) |
> +			(rate->sdiv << PLL0831X_SDIV_SHIFT);
> +	pll_con5 &= ~(PLL0831X_KDIV_MASK << PLL0831X_KDIV_SHIFT);
> +	/*
> +	 * kdiv is 16-bit 2's complement (s16), but stored as unsigned int.
> +	 * Cast it to u16 to avoid leading 0xffff's in case of negative value.
> +	 */
> +	pll_con5 |= ((u16)rate->kdiv << PLL0831X_KDIV_SHIFT);
> +
> +	/* Set PLL lock time */
> +	writel_relaxed(rate->pdiv * PLL0831X_LOCK_FACTOR, pll->lock_reg);
> +
> +	/* Write PMSK values */
> +	writel_relaxed(pll_con3, pll->con_reg);
> +	writel_relaxed(pll_con5, pll->con_reg + 8);
> +
> +	/* Wait for PLL lock if the PLL is enabled */
> +	if (pll_con3 & BIT(pll->enable_offs))
> +		return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops samsung_pll0831x_clk_ops = {
> +	.recalc_rate = samsung_pll0831x_recalc_rate,
> +	.set_rate = samsung_pll0831x_set_rate,
> +	.round_rate = samsung_pll_round_rate,
> +	.enable = samsung_pll3xxx_enable,
> +	.disable = samsung_pll3xxx_disable,
> +};
> +
> +static const struct clk_ops samsung_pll0831x_clk_min_ops = {
> +	.recalc_rate = samsung_pll0831x_recalc_rate,
> +};
> +
>   /*
>    * PLL45xx Clock Type
>    */
> @@ -1407,6 +1504,14 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>   		else
>   			init.ops = &samsung_pll36xx_clk_ops;
>   		break;
> +	case pll_0831x:
> +		pll->enable_offs = PLL0831X_ENABLE_SHIFT;
> +		pll->lock_offs = PLL0831X_LOCK_STAT_SHIFT;
> +		if (!pll->rate_table)
> +			init.ops = &samsung_pll0831x_clk_min_ops;
> +		else
> +			init.ops = &samsung_pll0831x_clk_ops;
> +		break;
>   	case pll_6552:
>   	case pll_6552_s3c2416:
>   		init.ops = &samsung_pll6552_clk_ops;
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 213e94a97f23..a739f2b7ae80 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -37,6 +37,7 @@ enum samsung_pll_type {
>   	pll_1452x,
>   	pll_1460x,
>   	pll_0822x,
> +	pll_0831x,
>   };
>   
>   #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

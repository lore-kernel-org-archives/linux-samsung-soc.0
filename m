Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8FAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:08:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49CCE61151
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 23:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238971AbhJOXK6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 19:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbhJOXK5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 19:10:57 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0580C061570;
        Fri, 15 Oct 2021 16:08:50 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q5so9867438pgr.7;
        Fri, 15 Oct 2021 16:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7YKHHarAUz7zPK3TbmlhGlIPQzv4ksZicfZhSAmj0tw=;
        b=To1CkWhCqVLUCIuzWQrwadKs+I6l1STzfvRoUdmlx0sCGHH465k6QKD3YmVAPsXCpC
         cz1/pqHxqVnxW2Yd9RZ2uTDVLAmTo+ieBo5rnjhhOhOFWfTXWvGg/Sk8l7ww59cqzNh4
         De+8Lw2VMLiFvL2TarvGaBnbq+xjXpYgUzf8rcJCULuu8zqOYRh5JIV0h4kyvMJ1pNO7
         UDpmFCZ1lgmrq/hHkgP9260PDB4OadRn2CmC8PDQJQa+wSEOdFTy106M89IRZ1YN3yDD
         9gjdpZHaBsrYA5ELnCzSrvl7wH0GIPEvbnPaIJ+/9jKh+ZjUBNJGutCUIxBO5Yn+m11u
         H6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7YKHHarAUz7zPK3TbmlhGlIPQzv4ksZicfZhSAmj0tw=;
        b=AFOIn+HfgE34TK4N8D/YYCMnaugc8L38DtKJxtOr2vMsH4lCRKjDd/H02w43KcbDOE
         lX9GqF47C2SR4ONkPELHSVi3lGhSt3oiQgYdr7049WbFvlyMwwdQTnVD+FumjCH4yRl1
         1SVswV0mEx17LgTFwS8Wgqfh/91SNfB9auxcVTlwC0KPtCDZ6/SqtHNpKyh5jeUqN2MN
         3BhLNgg+OKKFgrDmKQDE0UPfUSQ4RYtEqV4yH6UlptHxcGJO4wK6LaXPtdzR2iZL2Wrq
         6fmZ0vw4FjaVzQJbbu9WIgJnx+WJyH3Tlb6Gm9ZigugymMmDSi9I/8CVJzLuuj/Pr0Xo
         R5Fg==
X-Gm-Message-State: AOAM53333RQVDux8TlzFAC02ddCHH6P3w2iQu7UFEM2nnWSbJImwAx+j
        nxYHgRwnDCuewdldb17XgM0=
X-Google-Smtp-Source: ABdhPJw9Ir3o1s5+Gv1rHdb14B+Q3EEdhlhBl8ZSYuvTwA91nUEfQyEX94hWkJ9HD3Wd2ZIDlSmL/A==
X-Received: by 2002:a62:1408:0:b0:44d:1f0b:49be with SMTP id 8-20020a621408000000b0044d1f0b49bemr14597913pfu.28.1634339330289;
        Fri, 15 Oct 2021 16:08:50 -0700 (PDT)
Received: from [172.30.1.32] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id a15sm5751063pfl.182.2021.10.15.16.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 16:08:49 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] [RFT] clk: samsung: add support for CPU clocks
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
 <20211014195347.3635601-2-willmcvicker@google.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <54a9804d-fd1e-204c-3cb0-83f1643fb93a@gmail.com>
Date:   Sat, 16 Oct 2021 08:08:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 10. 15. 오전 4:53, Will McVicker wrote:
> Adds 'struct samsung_cpu_clock' and corresponding CPU clock registration
> function to the samsung common clk driver. This allows samsung clock
> drivers to register their CPU clocks with the samsung_cmu_register_one()
> API.
> 
> Currently the exynos5433 apollo and atlas clks have their own custom
> init functions to handle registering their CPU clocks. With this patch
> we can drop their custom CLK_OF_DECLARE functions and directly call
> samsung_cmu_register_one().
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>   drivers/clk/samsung/clk-cpu.c | 18 ++++++++++++++++++
>   drivers/clk/samsung/clk.c     |  2 ++
>   drivers/clk/samsung/clk.h     | 26 ++++++++++++++++++++++++++
>   3 files changed, 46 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 00ef4d1b0888..7f20d9aedaa9 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -469,3 +469,21 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>   	kfree(cpuclk);
>   	return ret;
>   }
> +
> +void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> +		const struct samsung_cpu_clock *list, unsigned int nr_clk)
> +{
> +	unsigned int idx;
> +	unsigned int num_cfgs;
> +	struct clk_hw **hws = ctx->clk_data.hws;
> +
> +	for (idx = 0; idx < nr_clk; idx++, list++) {
> +		/* find count of configuration rates in cfg */
> +		for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
> +			num_cfgs++;
> +
> +		exynos_register_cpu_clock(ctx, list->id, list->name, hws[list->parent_id],
> +				hws[list->alt_parent_id], list->offset, list->cfg, num_cfgs,
> +				list->flags);
> +	}
> +}
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 1949ae7851b2..336243c6f120 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -378,6 +378,8 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>   		samsung_clk_extended_sleep_init(reg_base,
>   			cmu->clk_regs, cmu->nr_clk_regs,
>   			cmu->suspend_regs, cmu->nr_suspend_regs);
> +	if (cmu->cpu_clks)
> +		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
>   
>   	samsung_clk_of_add_provider(np, ctx);
>   
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index c1e1a6b2f499..26499e97275b 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -271,6 +271,27 @@ struct samsung_pll_clock {
>   	__PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,	\
>   	      _con, _rtable)
>   
> +struct samsung_cpu_clock {
> +	unsigned int	id;
> +	const char	*name;
> +	unsigned int	parent_id;
> +	unsigned int	alt_parent_id;
> +	unsigned long	flags;
> +	int		offset;
> +	const struct exynos_cpuclk_cfg_data *cfg;
> +};
> +
> +#define CPU_CLK(_id, _name, _pid, _apid, _flags, _offset, _cfg) \
> +	{							\
> +		.id		  = _id,			\
> +		.name		  = _name,			\
> +		.parent_id	  = _pid,			\
> +		.alt_parent_id	  = _apid,			\
> +		.flags		  = _flags,			\
> +		.offset		  = _offset,			\
> +		.cfg		  = _cfg,			\
> +	}
> +
>   struct samsung_clock_reg_cache {
>   	struct list_head node;
>   	void __iomem *reg_base;
> @@ -301,6 +322,9 @@ struct samsung_cmu_info {
>   	unsigned int nr_fixed_factor_clks;
>   	/* total number of clocks with IDs assigned*/
>   	unsigned int nr_clk_ids;
> +	/* list of cpu clocks and respective count */
> +	const struct samsung_cpu_clock *cpu_clks;
> +	unsigned int nr_cpu_clks;
>   
>   	/* list and number of clocks registers */
>   	const unsigned long *clk_regs;
> @@ -350,6 +374,8 @@ extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
>   extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>   			const struct samsung_pll_clock *pll_list,
>   			unsigned int nr_clk, void __iomem *base);
> +extern void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> +		const struct samsung_cpu_clock *list, unsigned int nr_clk);
>   
>   extern struct samsung_clk_provider __init *samsung_cmu_register_one(
>   			struct device_node *,
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

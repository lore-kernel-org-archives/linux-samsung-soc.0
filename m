From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] clk: samsung: Convert common drivers to the new
 clk_hw API
Date: Fri, 21 Apr 2017 20:54:33 +0200
Message-ID: <20170421185433.b5awu24nlw7bbm5f@kozik-lap>
References: <1492694199-9553-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170420131645eucas1p2324270d9801342eeebe8eddaf8172315@eucas1p2.samsung.com>
 <1492694199-9553-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35759 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424028AbdDUSyi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2017 14:54:38 -0400
Content-Disposition: inline
In-Reply-To: <1492694199-9553-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Apr 20, 2017 at 03:16:36PM +0200, Marek Szyprowski wrote:
> Clock providers should use the new struct clk_hw based API, so convert
> Samsung clock providers and their helper functions to the new approach.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-cpu.c          | 15 +++---
>  drivers/clk/samsung/clk-pll.c          | 14 +++---
>  drivers/clk/samsung/clk-pll.h          |  4 --
>  drivers/clk/samsung/clk-s3c2410-dclk.c | 75 ++++++++++++++--------------
>  drivers/clk/samsung/clk.c              | 91 +++++++++++++++-------------------
>  drivers/clk/samsung/clk.h              |  9 ++--
>  6 files changed, 96 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 8bf7e805fd34..fbf0154b81a5 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -410,7 +410,7 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>  {
>  	struct exynos_cpuclk *cpuclk;
>  	struct clk_init_data init;
> -	struct clk *clk;
> +	struct clk *parent_clk;
>  	int ret = 0;
>  
>  	cpuclk = kzalloc(sizeof(*cpuclk), GFP_KERNEL);
> @@ -440,15 +440,15 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>  		goto free_cpuclk;
>  	}
>  
> -	clk = __clk_lookup(parent);
> -	if (!clk) {
> +	parent_clk = __clk_lookup(parent);
> +	if (!parent_clk) {

This looks unrelated to this change. Can you split it to separate
commit?

>  		pr_err("%s: could not lookup parent clock %s\n",
>  				__func__, parent);
>  		ret = -EINVAL;
>  		goto free_cpuclk;
>  	}
>  
> -	ret = clk_notifier_register(clk, &cpuclk->clk_nb);
> +	ret = clk_notifier_register(parent_clk, &cpuclk->clk_nb);
>  	if (ret) {
>  		pr_err("%s: failed to register clock notifier for %s\n",
>  				__func__, name);
> @@ -463,14 +463,13 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>  		goto unregister_clk_nb;
>  	}
>  
> -	clk = clk_register(NULL, &cpuclk->hw);
> -	if (IS_ERR(clk)) {
> +	ret = clk_hw_register(NULL, &cpuclk->hw);
> +	if (ret) {
>  		pr_err("%s: could not register cpuclk %s\n", __func__,	name);
> -		ret = PTR_ERR(clk);
>  		goto free_cpuclk_data;
>  	}
>  
> -	samsung_clk_add_lookup(ctx, clk, lookup_id);
> +	samsung_clk_add_lookup(ctx, &cpuclk->hw, lookup_id);
>  	return 0;
>  
>  free_cpuclk_data:
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 52290894857a..db680575a9bd 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1244,7 +1244,6 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  				void __iomem *base)
>  {
>  	struct samsung_clk_pll *pll;
> -	struct clk *clk;
>  	struct clk_init_data init;
>  	int ret, len;
>  
> @@ -1376,20 +1375,21 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  	pll->lock_reg = base + pll_clk->lock_offset;
>  	pll->con_reg = base + pll_clk->con_offset;
>  
> -	clk = clk_register(NULL, &pll->hw);
> -	if (IS_ERR(clk)) {
> -		pr_err("%s: failed to register pll clock %s : %ld\n",
> -			__func__, pll_clk->name, PTR_ERR(clk));
> +	ret = clk_hw_register(NULL, &pll->hw);
> +	if (ret) {
> +		pr_err("%s: failed to register pll clock %s : %d\n",
> +			__func__, pll_clk->name, ret);
>  		kfree(pll);
>  		return;
>  	}
>  
> -	samsung_clk_add_lookup(ctx, clk, pll_clk->id);
> +	samsung_clk_add_lookup(ctx, &pll->hw, pll_clk->id);
>  
>  	if (!pll_clk->alias)
>  		return;
>  
> -	ret = clk_register_clkdev(clk, pll_clk->alias, pll_clk->dev_name);
> +	ret = clk_hw_register_clkdev(&pll->hw, pll_clk->alias,
> +				     pll_clk->dev_name);
>  	if (ret)
>  		pr_err("%s: failed to register lookup for %s : %d",
>  			__func__, pll_clk->name, ret);
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index a1ca0233cb4b..61eb8abbfd9c 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -103,8 +103,4 @@ struct samsung_pll_rate_table {
>  	unsigned int vsel;
>  };
>  
> -extern struct clk * __init samsung_clk_register_pll2550x(const char *name,
> -			const char *pname, const void __iomem *reg_base,
> -			const unsigned long offset);
> -

The same, looks unrelated so maybe split it out?


Best regards,
Krzysztof

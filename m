From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Thu, 8 Jun 2017 19:04:11 +0200
Message-ID: <20170608170411.cfqvqmgzgi6qs7hz@kozik-lap>
References: <CGME20170608141722epcas5p2310095ad549f30841430f5cc3e364908@epcas5p2.samsung.com>
 <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33338 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbdFHREP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 13:04:15 -0400
Content-Disposition: inline
In-Reply-To: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, cw00.choi@samsung.com, b.zolnierkie@samsung.com

On Thu, Jun 08, 2017 at 04:17:11PM +0200, Sylwester Nawrocki wrote:
> The existing enable/disable ops for PLL35XX are made more generic
> and used also for PLL36XX. This fixes issues in the kernel with
> PLL36XX PLLs when the PLL has not been already enabled by bootloader.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since RFC version:
>  - fixed wrong bit handling in samsung_pll3xxx_disable()
>  - pll->lock_offs used and comment improved in samsung_pll35xx_set_rate()
> ---
>  drivers/clk/samsung/clk-pll.c | 87 +++++++++++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 5229089..5c4899c 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -23,6 +23,10 @@ struct samsung_clk_pll {
>  	struct clk_hw		hw;
>  	void __iomem		*lock_reg;
>  	void __iomem		*con_reg;
> +	/* PLL enable control bit offset in @con_reg register */
> +	unsigned short		enable_offs;
> +	/* PLL lock status bit offset in @con_reg register */
> +	unsigned short		lock_offs;
>  	enum samsung_pll_type	type;
>  	unsigned int		rate_count;
>  	const struct samsung_pll_rate_table *rate_table;
> @@ -61,6 +65,34 @@ static long samsung_pll_round_rate(struct clk_hw *hw,
>  	return rate_table[i - 1].rate;
>  }
> 
> +static int samsung_pll3xxx_enable(struct clk_hw *hw)
> +{
> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(pll->con_reg);
> +	tmp |= BIT(pll->enable_offs);
> +	writel_relaxed(tmp, pll->con_reg);
> +
> +	/* wait lock time */
> +	do {
> +		cpu_relax();
> +		tmp = readl_relaxed(pll->con_reg);
> +	} while (!(tmp & BIT(pll->lock_offs)));
> +
> +	return 0;
> +}
> +
> +static void samsung_pll3xxx_disable(struct clk_hw *hw)
> +{
> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(pll->con_reg);
> +	tmp &= ~BIT(pll->enable_offs);
> +	writel_relaxed(tmp, pll->con_reg);
> +}
> +
>  /*
>   * PLL2126 Clock Type
>   */
> @@ -142,34 +174,6 @@ static unsigned long samsung_pll3000_recalc_rate(struct clk_hw *hw,
>  #define PLL35XX_LOCK_STAT_SHIFT	(29)
>  #define PLL35XX_ENABLE_SHIFT	(31)
> 
> -static int samsung_pll35xx_enable(struct clk_hw *hw)
> -{
> -	struct samsung_clk_pll *pll = to_clk_pll(hw);
> -	u32 tmp;
> -
> -	tmp = readl_relaxed(pll->con_reg);
> -	tmp |= BIT(PLL35XX_ENABLE_SHIFT);
> -	writel_relaxed(tmp, pll->con_reg);
> -
> -	/* wait_lock_time */
> -	do {
> -		cpu_relax();
> -		tmp = readl_relaxed(pll->con_reg);
> -	} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
> -
> -	return 0;
> -}
> -
> -static void samsung_pll35xx_disable(struct clk_hw *hw)
> -{
> -	struct samsung_clk_pll *pll = to_clk_pll(hw);
> -	u32 tmp;
> -
> -	tmp = readl_relaxed(pll->con_reg);
> -	tmp &= ~BIT(PLL35XX_ENABLE_SHIFT);
> -	writel_relaxed(tmp, pll->con_reg);
> -}
> -
>  static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
>  				unsigned long parent_rate)
>  {
> @@ -238,12 +242,12 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>  			(rate->sdiv << PLL35XX_SDIV_SHIFT);
>  	writel_relaxed(tmp, pll->con_reg);
> 
> -	/* wait_lock_time if enabled */
> -	if (tmp & BIT(PLL35XX_ENABLE_SHIFT)) {
> +	/* Wait until the PLL is locked if it is enabled. */
> +	if (tmp & BIT(pll->enable_offs)) {
>  		do {
>  			cpu_relax();
>  			tmp = readl_relaxed(pll->con_reg);
> -		} while (!(tmp & BIT(PLL35XX_LOCK_STAT_SHIFT)));
> +		} while (!(tmp & BIT(pll->lock_offs)));
>  	}
>  	return 0;
>  }
> @@ -252,8 +256,8 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>  	.recalc_rate = samsung_pll35xx_recalc_rate,
>  	.round_rate = samsung_pll_round_rate,
>  	.set_rate = samsung_pll35xx_set_rate,
> -	.enable = samsung_pll35xx_enable,
> -	.disable = samsung_pll35xx_disable,
> +	.enable = samsung_pll3xxx_enable,
> +	.disable = samsung_pll3xxx_disable,
>  };
> 
>  static const struct clk_ops samsung_pll35xx_clk_min_ops = {
> @@ -275,6 +279,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>  #define PLL36XX_SDIV_SHIFT	(0)
>  #define PLL36XX_KDIV_SHIFT	(0)
>  #define PLL36XX_LOCK_STAT_SHIFT	(29)
> +#define PLL36XX_ENABLE_SHIFT	(31)

Everything looks good... but you are aware that lock_stat and enable
offsets are equal to PLL35XX so thedisable/enable ops could be re-used
directly?

Best regards,
Krzysztof

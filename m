From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Sat, 22 Apr 2017 17:22:36 +0200
Message-ID: <20170422152236.tbf4iuoadqrvoc2n@kozik-lap>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
 <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36168 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425082AbdDVPWl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Apr 2017 11:22:41 -0400
Content-Disposition: inline
In-Reply-To: <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, javier@osg.samsung.com, jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com

On Fri, Apr 21, 2017 at 07:19:45PM +0200, Sylwester Nawrocki wrote:
> The existing enable/disable ops for PLL35XX are made more generic
> and used also for PLL36XX. This fixes issues in the kernel with
> PLL36XX PLLs when the PLL has not been already enabled by bootloader.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 85 +++++++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 5229089..10c76eb 100644
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
> +	tmp |= BIT(pll->enable_offs);

I think you meant here:
	tmp &= ~BIT()

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
> @@ -239,11 +243,11 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>  	writel_relaxed(tmp, pll->con_reg);
>  
>  	/* wait_lock_time if enabled */
> -	if (tmp & BIT(PLL35XX_ENABLE_SHIFT)) {
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
>  
>  static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
>  				unsigned long parent_rate)
> @@ -354,10 +359,12 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
>  	writel_relaxed(pll_con1, pll->con_reg + 4);
>  
>  	/* wait_lock_time */
> -	do {
> -		cpu_relax();
> -		tmp = readl_relaxed(pll->con_reg);
> -	} while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));
> +	if (pll_con0 & BIT(pll->enable_offs)) {

Why this additional if() is needed?

> +		do {
> +			cpu_relax();
> +			tmp = readl_relaxed(pll->con_reg);
> +		} while (!(tmp & BIT(PLL36XX_LOCK_STAT_SHIFT)));

To be consistent:
BIT(pll->lock_offs)?

Best regards,
Krzysztof

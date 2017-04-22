From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Fri, 21 Apr 2017 19:51:27 -0700
Message-ID: <20170422025127.GS7065@codeaurora.org>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
 <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, javier@osg.samsung.com, krzk@kernel.org, jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04/21, Sylwester Nawrocki wrote:
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

Not a problem with this patch because we're moving code around,
but this is a potential infinite loop that should have some sort
of timeout so we don't sit here forever trying to see a bit
toggle.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

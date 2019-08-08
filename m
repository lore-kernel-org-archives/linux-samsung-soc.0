From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: Change signature of
 exynos5_subcmus_init() function
Date: Thu, 8 Aug 2019 13:49:16 +0200
Message-ID: <c879af19-befc-71a0-5691-38cd873560eb@samsung.com>
References: <CGME20190807162511eucas1p2eedb33bdee87f80528b59bb4e869daf1@eucas1p2.samsung.com>
        <20190807162456.28694-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807162456.28694-1-s.nawrocki@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, sboyd@kernel.org, mturquette@baylibre.com
Cc: linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, cw00.choi@samsung.com, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


On 2019-08-07 18:24, Sylwester Nawrocki wrote:
> In order to make it easier in subsequent patch to create different subcmu
> lists for exynos5420 and exynos5800 SoCs the code is rewritten so we pass
> an array of pointers to the subcmus initialization function.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos5-subcmu.c | 16 +++----
>   drivers/clk/samsung/clk-exynos5-subcmu.h |  2 +-
>   drivers/clk/samsung/clk-exynos5250.c     |  7 ++-
>   drivers/clk/samsung/clk-exynos5420.c     | 60 ++++++++++++++----------
>   4 files changed, 49 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
> index 91db7894125d..65c82d922b05 100644
> --- a/drivers/clk/samsung/clk-exynos5-subcmu.c
> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
> @@ -14,7 +14,7 @@
>   #include "clk-exynos5-subcmu.h"
>   
>   static struct samsung_clk_provider *ctx;
> -static const struct exynos5_subcmu_info *cmu;
> +static const struct exynos5_subcmu_info **cmu;
>   static int nr_cmus;
>   
>   static void exynos5_subcmu_clk_save(void __iomem *base,
> @@ -56,17 +56,17 @@ static void exynos5_subcmu_defer_gate(struct samsung_clk_provider *ctx,
>    * when OF-core populates all device-tree nodes.
>    */
>   void exynos5_subcmus_init(struct samsung_clk_provider *_ctx, int _nr_cmus,
> -			  const struct exynos5_subcmu_info *_cmu)
> +			  const struct exynos5_subcmu_info **_cmu)
>   {
>   	ctx = _ctx;
>   	cmu = _cmu;
>   	nr_cmus = _nr_cmus;
>   
>   	for (; _nr_cmus--; _cmu++) {
> -		exynos5_subcmu_defer_gate(ctx, _cmu->gate_clks,
> -					  _cmu->nr_gate_clks);
> -		exynos5_subcmu_clk_save(ctx->reg_base, _cmu->suspend_regs,
> -					_cmu->nr_suspend_regs);
> +		exynos5_subcmu_defer_gate(ctx, (*_cmu)->gate_clks,
> +					  (*_cmu)->nr_gate_clks);
> +		exynos5_subcmu_clk_save(ctx->reg_base, (*_cmu)->suspend_regs,
> +					(*_cmu)->nr_suspend_regs);
>   	}
>   }
>   
> @@ -163,9 +163,9 @@ static int __init exynos5_clk_probe(struct platform_device *pdev)
>   		if (of_property_read_string(np, "label", &name) < 0)
>   			continue;
>   		for (i = 0; i < nr_cmus; i++)
> -			if (strcmp(cmu[i].pd_name, name) == 0)
> +			if (strcmp(cmu[i]->pd_name, name) == 0)
>   				exynos5_clk_register_subcmu(&pdev->dev,
> -							    &cmu[i], np);
> +							    cmu[i], np);
>   	}
>   	return 0;
>   }
> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.h b/drivers/clk/samsung/clk-exynos5-subcmu.h
> index 755ee8aaa3de..9ae5356f25aa 100644
> --- a/drivers/clk/samsung/clk-exynos5-subcmu.h
> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.h
> @@ -21,6 +21,6 @@ struct exynos5_subcmu_info {
>   };
>   
>   void exynos5_subcmus_init(struct samsung_clk_provider *ctx, int nr_cmus,
> -			  const struct exynos5_subcmu_info *cmu);
> +			  const struct exynos5_subcmu_info **cmu);
>   
>   #endif
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index f2b896881768..931c70a4da19 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -681,6 +681,10 @@ static const struct exynos5_subcmu_info exynos5250_disp_subcmu = {
>   	.pd_name	= "DISP1",
>   };
>   
> +static const struct exynos5_subcmu_info *exynos5250_subcmus[] = {
> +	&exynos5250_disp_subcmu,
> +};
> +
>   static const struct samsung_pll_rate_table vpll_24mhz_tbl[] __initconst = {
>   	/* sorted in descending order */
>   	/* PLL_36XX_RATE(rate, m, p, s, k) */
> @@ -843,7 +847,8 @@ static void __init exynos5250_clk_init(struct device_node *np)
>   
>   	samsung_clk_sleep_init(reg_base, exynos5250_clk_regs,
>   			       ARRAY_SIZE(exynos5250_clk_regs));
> -	exynos5_subcmus_init(ctx, 1, &exynos5250_disp_subcmu);
> +	exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5250_subcmus),
> +			     exynos5250_subcmus);
>   
>   	samsung_clk_of_add_provider(np, ctx);
>   
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 01bca5a498b2..fdb17c799aa5 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1281,32 +1281,40 @@ static struct exynos5_subcmu_reg_dump exynos5x_mfc_suspend_regs[] = {
>   	{ DIV4_RATIO, 0, 0x3 },			/* DIV dout_mfc_blk */
>   };
>   
> -static const struct exynos5_subcmu_info exynos5x_subcmus[] = {
> -	{
> -		.div_clks	= exynos5x_disp_div_clks,
> -		.nr_div_clks	= ARRAY_SIZE(exynos5x_disp_div_clks),
> -		.gate_clks	= exynos5x_disp_gate_clks,
> -		.nr_gate_clks	= ARRAY_SIZE(exynos5x_disp_gate_clks),
> -		.suspend_regs	= exynos5x_disp_suspend_regs,
> -		.nr_suspend_regs = ARRAY_SIZE(exynos5x_disp_suspend_regs),
> -		.pd_name	= "DISP",
> -	}, {
> -		.div_clks	= exynos5x_gsc_div_clks,
> -		.nr_div_clks	= ARRAY_SIZE(exynos5x_gsc_div_clks),
> -		.gate_clks	= exynos5x_gsc_gate_clks,
> -		.nr_gate_clks	= ARRAY_SIZE(exynos5x_gsc_gate_clks),
> -		.suspend_regs	= exynos5x_gsc_suspend_regs,
> -		.nr_suspend_regs = ARRAY_SIZE(exynos5x_gsc_suspend_regs),
> -		.pd_name	= "GSC",
> -	}, {
> -		.div_clks	= exynos5x_mfc_div_clks,
> -		.nr_div_clks	= ARRAY_SIZE(exynos5x_mfc_div_clks),
> -		.gate_clks	= exynos5x_mfc_gate_clks,
> -		.nr_gate_clks	= ARRAY_SIZE(exynos5x_mfc_gate_clks),
> -		.suspend_regs	= exynos5x_mfc_suspend_regs,
> -		.nr_suspend_regs = ARRAY_SIZE(exynos5x_mfc_suspend_regs),
> -		.pd_name	= "MFC",
> -	},
> +static const struct exynos5_subcmu_info exynos5x_disp_subcmu = {
> +	.div_clks	= exynos5x_disp_div_clks,
> +	.nr_div_clks	= ARRAY_SIZE(exynos5x_disp_div_clks),
> +	.gate_clks	= exynos5x_disp_gate_clks,
> +	.nr_gate_clks	= ARRAY_SIZE(exynos5x_disp_gate_clks),
> +	.suspend_regs	= exynos5x_disp_suspend_regs,
> +	.nr_suspend_regs = ARRAY_SIZE(exynos5x_disp_suspend_regs),
> +	.pd_name	= "DISP",
> +};
> +
> +static const struct exynos5_subcmu_info exynos5x_gsc_subcmu = {
> +	.div_clks	= exynos5x_gsc_div_clks,
> +	.nr_div_clks	= ARRAY_SIZE(exynos5x_gsc_div_clks),
> +	.gate_clks	= exynos5x_gsc_gate_clks,
> +	.nr_gate_clks	= ARRAY_SIZE(exynos5x_gsc_gate_clks),
> +	.suspend_regs	= exynos5x_gsc_suspend_regs,
> +	.nr_suspend_regs = ARRAY_SIZE(exynos5x_gsc_suspend_regs),
> +	.pd_name	= "GSC",
> +};
> +
> +static const struct exynos5_subcmu_info exynos5x_mfc_subcmu = {
> +	.div_clks	= exynos5x_mfc_div_clks,
> +	.nr_div_clks	= ARRAY_SIZE(exynos5x_mfc_div_clks),
> +	.gate_clks	= exynos5x_mfc_gate_clks,
> +	.nr_gate_clks	= ARRAY_SIZE(exynos5x_mfc_gate_clks),
> +	.suspend_regs	= exynos5x_mfc_suspend_regs,
> +	.nr_suspend_regs = ARRAY_SIZE(exynos5x_mfc_suspend_regs),
> +	.pd_name	= "MFC",
> +};
> +
> +static const struct exynos5_subcmu_info *exynos5x_subcmus[] = {
> +	&exynos5x_disp_subcmu,
> +	&exynos5x_gsc_subcmu,
> +	&exynos5x_mfc_subcmu,
>   };
>   
>   static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __initconst = {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

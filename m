From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] clk/samsung: Use CLK_OF_DECLARE_DRIVER initialization
 method for CLKOUT
Date: Wed, 26 Oct 2016 18:10:52 +0900
Message-ID: <5810731C.6050100@samsung.com>
References: <CGME20161026061227eucas1p20fb865eafd802044ed79ce336fa90eab@eucas1p2.samsung.com>
 <1477462340-7867-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1477462340-7867-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 2016년 10월 26일 15:12, Marek Szyprowski wrote:
> The Exynos PMU node is an interrupt, clock and PMU (Power Management Unit)
> controller, and these functionalities are supported by different drivers
> that matches the same compatible strings.
> 
> Since commit 989eafd0b609 ("clk: core: Avoid double initialization of
> clocks") the OF core flags clock controllers registered with the
> CLK_OF_DECLARE() macro as OF_POPULATED, so platform devices with the same
> compatible string will not be registered.
> 
> This prevents the PMU platform device to be created, so the Exynos PMU
> driver is never probed. This breaks (among other things) Suspend-to-RAM.
> 
> Fix this by changing CLKOUT driver initialization method to
> CLK_OF_DECLARE_DRIVER(), which doesn't clear the OF_POPULATED flag, so
> later a platform device is created and the Exynos PMU platform driver
> can be be probed properly.
> 
> Fixes: 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - switched to CLK_OF_DECLARE_DRIVER instead of calling
>   of_node_clear_flag(node, OF_POPULATED) as suggested by Stephen Boyd
> 
> v1: https://www.spinics.net/lists/linux-clk/msg12833.html
> - initial version
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 96fab6cfb202..6c6afb87b4ce 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -132,28 +132,34 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
>  	pr_err("%s: failed to register clkout clock\n", __func__);
>  }
>  
> +/*
> + * We use CLK_OF_DECLARE_DRIVER initialization method to avoid setting
> + * the OF_POPULATED flag on the pmu device tree node, so later the
> + * Exynos PMU platform device can be properly probed with PMU driver.
> + */
> +
>  static void __init exynos4_clkout_init(struct device_node *node)
>  {
>  	exynos_clkout_init(node, EXYNOS4_CLKOUT_MUX_MASK);
>  }
> -CLK_OF_DECLARE(exynos4210_clkout, "samsung,exynos4210-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos4210_clkout, "samsung,exynos4210-pmu",
>  		exynos4_clkout_init);
> -CLK_OF_DECLARE(exynos4212_clkout, "samsung,exynos4212-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos4212_clkout, "samsung,exynos4212-pmu",
>  		exynos4_clkout_init);
> -CLK_OF_DECLARE(exynos4412_clkout, "samsung,exynos4412-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos4412_clkout, "samsung,exynos4412-pmu",
>  		exynos4_clkout_init);
> -CLK_OF_DECLARE(exynos3250_clkout, "samsung,exynos3250-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos3250_clkout, "samsung,exynos3250-pmu",
>  		exynos4_clkout_init);
>  
>  static void __init exynos5_clkout_init(struct device_node *node)
>  {
>  	exynos_clkout_init(node, EXYNOS5_CLKOUT_MUX_MASK);
>  }
> -CLK_OF_DECLARE(exynos5250_clkout, "samsung,exynos5250-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos5250_clkout, "samsung,exynos5250-pmu",
>  		exynos5_clkout_init);
> -CLK_OF_DECLARE(exynos5410_clkout, "samsung,exynos5410-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos5410_clkout, "samsung,exynos5410-pmu",
>  		exynos5_clkout_init);
> -CLK_OF_DECLARE(exynos5420_clkout, "samsung,exynos5420-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos5420_clkout, "samsung,exynos5420-pmu",
>  		exynos5_clkout_init);
> -CLK_OF_DECLARE(exynos5433_clkout, "samsung,exynos5433-pmu",
> +CLK_OF_DECLARE_DRIVER(exynos5433_clkout, "samsung,exynos5433-pmu",
>  		exynos5_clkout_init);
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi

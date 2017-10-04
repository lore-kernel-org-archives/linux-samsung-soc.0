From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 3/9] clk: samsung: Remove double assignment to CLK_ARM_CLK
 id in Exynos4 driver
Date: Wed, 4 Oct 2017 22:42:07 +0900
Message-ID: <CAGTfZH3oj57_1+6ar3N33j_R=S6idL_B2bvJrWpsbeaMXbBZLg@mail.gmail.com>
References: <CGME20171003100030eucas1p1a20ef57eada2009d1c83804b475fd1b6@eucas1p1.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-4-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171003100016.32029-4-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> CLK_ARM_CLK ("armclk") clock is provided by cpu-clk subdriver, which is
> instantiated after creating all divider clocks from exynos4_div_clks
> array. There is no point assigning this id to "div_core2" clock and later
> overwrite with proper "armcpu" clock by cpu-clk subdriver.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 3fbfd9ed82b7..3bd2d84b2a17 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -721,7 +721,7 @@ static const struct samsung_div_clock exynos4_div_clks[] __initconst = {
>         DIV(0, "div_periph", "div_core2", DIV_CPU0, 12, 3),
>         DIV(0, "div_atb", "mout_core", DIV_CPU0, 16, 3),
>         DIV(0, "div_pclk_dbg", "div_atb", DIV_CPU0, 20, 3),
> -       DIV(CLK_ARM_CLK, "div_core2", "div_core", DIV_CPU0, 28, 3),
> +       DIV(0, "div_core2", "div_core", DIV_CPU0, 28, 3),
>         DIV(0, "div_copy", "mout_hpm", DIV_CPU1, 0, 3),
>         DIV(0, "div_hpm", "div_copy", DIV_CPU1, 4, 3),
>         DIV(0, "div_clkout_cpu", "mout_clkout_cpu", CLKOUT_CMU_CPU, 8, 6),

The exynos_register_cpu_clock() calls samsung_clk_add_lookup() which
overwrites the clk_hw. Looks good to me.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Additionally,
IMO, samsung_clk_add_lookup() might have to check whether
'ctx->clk_data.hws[id]' is NULL or not before adding lookup_id in
order to prevent the overwriting.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

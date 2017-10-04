From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 6/9] clk: samsung: Rework clkdev alias handling in
 Exynos5440 driver
Date: Thu, 5 Oct 2017 00:02:33 +0900
Message-ID: <CAGTfZH3y7A0JrFBnvBWigALDB2miJz94qDsmEuJjGg54ydMd=w@mail.gmail.com>
References: <CGME20171003100031eucas1p145edaae6b857c194139d594ebdc9447e@eucas1p1.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-7-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171003100016.32029-7-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Exynos5440 still uses old, non-dt CPUfreq driver, which requires clkdev
> aliases to get access to proper clocks. Create those aliases using
> samsung_clk_register_alias() function instead of using *_A clock macros,
> which will be removed soon.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5440.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
> index a80f3ef20801..b08bd54c5e76 100644
> --- a/drivers/clk/samsung/clk-exynos5440.c
> +++ b/drivers/clk/samsung/clk-exynos5440.c
> @@ -53,8 +53,7 @@ static const struct samsung_fixed_factor_clock exynos5440_fixed_factor_clks[] __
>  /* mux clocks */
>  static const struct samsung_mux_clock exynos5440_mux_clks[] __initconst = {
>         MUX(0, "mout_spi", mout_spi_p, MISC_DOUT1, 5, 1),
> -       MUX_A(CLK_ARM_CLK, "arm_clk", mout_armclk_p,
> -                       CPU_CLK_STATUS, 0, 1, "armclk"),
> +       MUX(CLK_ARM_CLK, "arm_clk", mout_armclk_p, CPU_CLK_STATUS, 0, 1),
>  };
>
>  /* divider clocks */
> @@ -117,6 +116,13 @@ static const struct samsung_pll_clock exynos5440_plls[] __initconst = {
>         PLL(pll_2550x, CLK_CPLLB, "cpllb", "xtal", 0, 0x50, NULL),
>  };
>
> +/*
> + * Clock aliases for legacy clkdev look-up.
> + */
> +static const struct samsung_clock_alias exynos5440_aliases[] __initconst = {
> +       ALIAS(CLK_ARM_CLK, NULL, "armclk"),
> +};
> +
>  /* register exynos5440 clocks */
>  static void __init exynos5440_clk_init(struct device_node *np)
>  {
> @@ -147,6 +153,8 @@ static void __init exynos5440_clk_init(struct device_node *np)
>                         ARRAY_SIZE(exynos5440_div_clks));
>         samsung_clk_register_gate(ctx, exynos5440_gate_clks,
>                         ARRAY_SIZE(exynos5440_gate_clks));
> +       samsung_clk_register_alias(ctx, exynos5440_aliases,
> +                                               ARRAY_SIZE(exynos5440_aliases));
>
>         samsung_clk_of_add_provider(np, ctx);
>
> --
> 2.14.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

On this patchset, patch9 removes the *_A macro as the Marek's comment.
So, this patch looks good to me.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

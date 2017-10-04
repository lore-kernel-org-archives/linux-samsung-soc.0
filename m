From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 1/9] clk: samsung: Remove support for obsolete Exynos4212
 CPU clock
Date: Wed, 4 Oct 2017 21:50:11 +0900
Message-ID: <CAGTfZH0z5SzU2Lzv=YJxR=JH63piFG2_yDfzBs51LtF4nwz-Pw@mail.gmail.com>
References: <CGME20171003100029eucas1p2c706e911f316a58f35be7c443824f07c@eucas1p2.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-2-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34951 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdJDMuw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:50:52 -0400
In-Reply-To: <20171003100016.32029-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi,

On Tue, Oct 3, 2017 at 7:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Support for Exynos 4212 SoC has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep dead code.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 33 ++++-----------------------------
>  1 file changed, 4 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index e40b77583c47..9a51ce9a658f 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -1401,24 +1401,6 @@ static const struct exynos_cpuclk_cfg_data e4210_armclk_d[] __initconst = {
>         {  0 },
>  };
>
> -static const struct exynos_cpuclk_cfg_data e4212_armclk_d[] __initconst = {
> -       { 1500000, E4210_CPU_DIV0(2, 1, 6, 0, 7, 3), E4210_CPU_DIV1(2, 6), },
> -       { 1400000, E4210_CPU_DIV0(2, 1, 6, 0, 7, 3), E4210_CPU_DIV1(2, 6), },
> -       { 1300000, E4210_CPU_DIV0(2, 1, 5, 0, 7, 3), E4210_CPU_DIV1(2, 5), },
> -       { 1200000, E4210_CPU_DIV0(2, 1, 5, 0, 7, 3), E4210_CPU_DIV1(2, 5), },
> -       { 1100000, E4210_CPU_DIV0(2, 1, 4, 0, 6, 3), E4210_CPU_DIV1(2, 4), },
> -       { 1000000, E4210_CPU_DIV0(1, 1, 4, 0, 5, 2), E4210_CPU_DIV1(2, 4), },
> -       {  900000, E4210_CPU_DIV0(1, 1, 3, 0, 5, 2), E4210_CPU_DIV1(2, 3), },
> -       {  800000, E4210_CPU_DIV0(1, 1, 3, 0, 5, 2), E4210_CPU_DIV1(2, 3), },
> -       {  700000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
> -       {  600000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
> -       {  500000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
> -       {  400000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
> -       {  300000, E4210_CPU_DIV0(1, 1, 2, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
> -       {  200000, E4210_CPU_DIV0(1, 1, 1, 0, 3, 1), E4210_CPU_DIV1(2, 3), },
> -       {  0 },
> -};
> -
>  #define E4412_CPU_DIV1(cores, hpm, copy)                               \
>                 (((cores) << 8) | ((hpm) << 4) | ((copy) << 0))
>
> @@ -1533,17 +1515,10 @@ static void __init exynos4_clk_init(struct device_node *np,
>                 samsung_clk_register_fixed_factor(ctx,
>                         exynos4x12_fixed_factor_clks,
>                         ARRAY_SIZE(exynos4x12_fixed_factor_clks));
> -               if (of_machine_is_compatible("samsung,exynos4412")) {
> -                       exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
> -                               mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
> -                               e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
> -                               CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
> -               } else {
> -                       exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
> -                               mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
> -                               e4212_armclk_d, ARRAY_SIZE(e4212_armclk_d),
> -                               CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
> -               }
> +               exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
> +                       mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
> +                       e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
> +                       CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
>         }
>
>         samsung_clk_register_alias(ctx, exynos4_aliases,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

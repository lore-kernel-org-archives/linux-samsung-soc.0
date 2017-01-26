From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Correct typos in SoC name
Date: Thu, 26 Jan 2017 23:31:58 +0900
Message-ID: <CAGTfZH3n+t1cpER8aiYNXzKEtvXbgfSebeVOeP0O87=ZQvKJ9g@mail.gmail.com>
References: <CGME20170126124348eucas1p19cd1a8f28f657f523ac46b48bf699674@eucas1p1.samsung.com>
 <1485434622-6936-1-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:33116 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752601AbdAZOck (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 09:32:40 -0500
Received: by mail-qt0-f196.google.com with SMTP id n13so38921481qtc.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2017 06:32:40 -0800 (PST)
In-Reply-To: <1485434622-6936-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

Thanks for fixup.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

2017-01-26 21:43 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> This patch fixes simple typos in Exynos5433 clocks driver. The SoC name
> was refered a few times as '5443' instead of '5433'.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 0db5204c307c..8fd7f6e88e3c 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -6,7 +6,7 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   *
> - * Common Clock Framework support for Exynos5443 SoC.
> + * Common Clock Framework support for Exynos5433 SoC.
>   */
>
>  #include <linux/clk-provider.h>
> @@ -698,7 +698,7 @@
>   * ATLAS_PLL & APOLLO_PLL & MEM0_PLL & MEM1_PLL & BUS_PLL & MFC_PLL
>   * & MPHY_PLL & G3D_PLL & DISP_PLL & ISP_PLL
>   */
> -static const struct samsung_pll_rate_table exynos5443_pll_rates[] __initconst = {
> +static const struct samsung_pll_rate_table exynos5433_pll_rates[] __initconst = {
>         PLL_35XX_RATE(2500000000U, 625, 6,  0),
>         PLL_35XX_RATE(2400000000U, 500, 5,  0),
>         PLL_35XX_RATE(2300000000U, 575, 6,  0),
> @@ -749,7 +749,7 @@
>  };
>
>  /* AUD_PLL */
> -static const struct samsung_pll_rate_table exynos5443_aud_pll_rates[] __initconst = {
> +static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initconst = {
>         PLL_36XX_RATE(400000000U, 200, 3, 2,      0),
>         PLL_36XX_RATE(393216000U, 197, 3, 2, -25690),
>         PLL_36XX_RATE(384000000U, 128, 2, 2,      0),
> @@ -764,9 +764,9 @@
>
>  static const struct samsung_pll_clock top_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_ISP_PLL, "fout_isp_pll", "oscclk",
> -               ISP_PLL_LOCK, ISP_PLL_CON0, exynos5443_pll_rates),
> +               ISP_PLL_LOCK, ISP_PLL_CON0, exynos5433_pll_rates),
>         PLL(pll_36xx, CLK_FOUT_AUD_PLL, "fout_aud_pll", "oscclk",
> -               AUD_PLL_LOCK, AUD_PLL_CON0, exynos5443_aud_pll_rates),
> +               AUD_PLL_LOCK, AUD_PLL_CON0, exynos5433_aud_pll_rates),
>  };
>
>  static const struct samsung_cmu_info top_cmu_info __initconst = {
> @@ -820,7 +820,7 @@ static void __init exynos5433_cmu_top_init(struct device_node *np)
>
>  static const struct samsung_pll_clock cpif_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_MPHY_PLL, "fout_mphy_pll", "oscclk",
> -               MPHY_PLL_LOCK, MPHY_PLL_CON0, exynos5443_pll_rates),
> +               MPHY_PLL_LOCK, MPHY_PLL_CON0, exynos5433_pll_rates),
>  };
>
>  static const struct samsung_mux_clock cpif_mux_clks[] __initconst = {
> @@ -1011,13 +1011,13 @@ static void __init exynos5433_cmu_cpif_init(struct device_node *np)
>
>  static const struct samsung_pll_clock mif_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_MEM0_PLL, "fout_mem0_pll", "oscclk",
> -               MEM0_PLL_LOCK, MEM0_PLL_CON0, exynos5443_pll_rates),
> +               MEM0_PLL_LOCK, MEM0_PLL_CON0, exynos5433_pll_rates),
>         PLL(pll_35xx, CLK_FOUT_MEM1_PLL, "fout_mem1_pll", "oscclk",
> -               MEM1_PLL_LOCK, MEM1_PLL_CON0, exynos5443_pll_rates),
> +               MEM1_PLL_LOCK, MEM1_PLL_CON0, exynos5433_pll_rates),
>         PLL(pll_35xx, CLK_FOUT_BUS_PLL, "fout_bus_pll", "oscclk",
> -               BUS_PLL_LOCK, BUS_PLL_CON0, exynos5443_pll_rates),
> +               BUS_PLL_LOCK, BUS_PLL_CON0, exynos5433_pll_rates),
>         PLL(pll_35xx, CLK_FOUT_MFC_PLL, "fout_mfc_pll", "oscclk",
> -               MFC_PLL_LOCK, MFC_PLL_CON0, exynos5443_pll_rates),
> +               MFC_PLL_LOCK, MFC_PLL_CON0, exynos5433_pll_rates),
>  };
>
>  /* list of all parent clock list */
> @@ -2539,7 +2539,7 @@ static void __init exynos5433_cmu_g2d_init(struct device_node *np)
>
>  static const struct samsung_pll_clock disp_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_DISP_PLL, "fout_disp_pll", "oscclk",
> -               DISP_PLL_LOCK, DISP_PLL_CON0, exynos5443_pll_rates),
> +               DISP_PLL_LOCK, DISP_PLL_CON0, exynos5433_pll_rates),
>  };
>
>  static const struct samsung_fixed_factor_clock disp_fixed_factor_clks[] __initconst = {
> @@ -3224,7 +3224,7 @@ static void __init exynos5433_cmu_aud_init(struct device_node *np)
>
>  static const struct samsung_pll_clock g3d_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_G3D_PLL, "fout_g3d_pll", "oscclk",
> -               G3D_PLL_LOCK, G3D_PLL_CON0, exynos5443_pll_rates),
> +               G3D_PLL_LOCK, G3D_PLL_CON0, exynos5433_pll_rates),
>  };
>
>  static const struct samsung_mux_clock g3d_mux_clks[] __initconst = {
> @@ -3514,7 +3514,7 @@ static void __init exynos5433_cmu_gscl_init(struct device_node *np)
>
>  static const struct samsung_pll_clock apollo_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_APOLLO_PLL, "fout_apollo_pll", "oscclk",
> -               APOLLO_PLL_LOCK, APOLLO_PLL_CON0, exynos5443_pll_rates),
> +               APOLLO_PLL_LOCK, APOLLO_PLL_CON0, exynos5433_pll_rates),
>  };
>
>  static const struct samsung_mux_clock apollo_mux_clks[] __initconst = {
> @@ -3737,7 +3737,7 @@ static void __init exynos5433_cmu_apollo_init(struct device_node *np)
>
>  static const struct samsung_pll_clock atlas_pll_clks[] __initconst = {
>         PLL(pll_35xx, CLK_FOUT_ATLAS_PLL, "fout_atlas_pll", "oscclk",
> -               ATLAS_PLL_LOCK, ATLAS_PLL_CON0, exynos5443_pll_rates),
> +               ATLAS_PLL_LOCK, ATLAS_PLL_CON0, exynos5433_pll_rates),
>  };
>
>  static const struct samsung_mux_clock atlas_mux_clks[] __initconst = {
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

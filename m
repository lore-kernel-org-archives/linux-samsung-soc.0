From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH 3/3] clk: exynos5410: Added clocks BPLL, DPLL, EPLL, IPLL,
 MPLL, and VPLL
Date: Thu, 31 Jul 2014 11:49:00 +0530
Message-ID: <CAJuA9ah1jdTkM93Jxf70hvmhSsjoN5_zjiGtVBPjVUJ1zneDcQ@mail.gmail.com>
References: <1406730963-30658-1-git-send-email-hsnaves@gmail.com>
	<1406730963-30658-3-git-send-email-hsnaves@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:44729 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756247AbaGaGTB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 02:19:01 -0400
Received: by mail-la0-f50.google.com with SMTP id gf5so1655114lab.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2014 23:19:00 -0700 (PDT)
In-Reply-To: <1406730963-30658-3-git-send-email-hsnaves@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Humberto Silva Naves <hsnaves@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

Hi Humberto,

On Wed, Jul 30, 2014 at 8:06 PM, Humberto Silva Naves <hsnaves@gmail.com> wrote:
> Added the remaining PLL clocks, and also registered the configuration
> tables with the PLL coefficients for the supported frequencies.
> These frequency tables are valid when a 24MHz clock is supplied as the
> input clock source (which I believe is always the case). Furthermore,
> the corresponding constants for these PLL clocks were addded to the
> dt-bindings header file. While at it, the constant definitions were
> reordered alphabetically.
>
> Signed-off-by: Humberto Silva Naves <hsnaves@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos5410.c   |  128 +++++++++++++++++++++++++++++---
>  include/dt-bindings/clock/exynos5410.h |   12 ++-
>  2 files changed, 127 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index aaca65d..7f4b3ea 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -156,9 +156,10 @@
>
>  /* list of PLLs */
>  enum exynos5410_plls {
> -       apll, cpll, mpll,
> -       bpll, kpll,
> -       nr_plls                 /* number of PLLs */
> +       apll, bpll, cpll,
> +       dpll, epll, ipll,
> +       kpll, mpll, vpll,
> +       nr_plls                 /* number of PLLs */
>  };
>
>  static void __iomem *reg_base;
> @@ -398,17 +399,126 @@ static struct samsung_gate_clock exynos5410_gate_clks[] __initdata = {
>                         SRC_MASK_PERIC0, 8, CLK_SET_RATE_PARENT, 0),
>  };
>
> +static struct samsung_pll_rate_table apll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_35XX_RATE(rate, m, p, s) */
> +       PLL_35XX_RATE(2100000000, 175, 2, 0),
> +       PLL_35XX_RATE(2000000000, 250, 3, 0),
> +       PLL_35XX_RATE(1900000000, 475, 6, 0),
> +       PLL_35XX_RATE(1800000000, 225, 3, 0),
> +       PLL_35XX_RATE(1700000000, 425, 6, 0),
> +       PLL_35XX_RATE(1600000000, 200, 3, 0),
> +       PLL_35XX_RATE(1500000000, 250, 4, 0),
> +       PLL_35XX_RATE(1400000000, 175, 3, 0),
> +       PLL_35XX_RATE(1300000000, 325, 6, 0),
> +       PLL_35XX_RATE(1200000000, 100, 2, 0),
> +       PLL_35XX_RATE(1100000000, 275, 3, 1),
> +       PLL_35XX_RATE(1000000000, 250, 3, 1),
> +       PLL_35XX_RATE(900000000, 150, 2, 1),
> +       PLL_35XX_RATE(800000000, 200, 3, 1),
> +       PLL_35XX_RATE(700000000, 175, 3, 1),
> +       PLL_35XX_RATE(600000000, 100, 2, 1),
> +       PLL_35XX_RATE(500000000, 250, 3, 2),
> +       PLL_35XX_RATE(400000000, 200, 3, 2),
> +       PLL_35XX_RATE(300000000, 100, 2, 2),
> +       PLL_35XX_RATE(200000000, 200, 3, 3),
> +       { },
> +};
> +
> +static struct samsung_pll_rate_table cpll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_35XX_RATE(rate, m, p, s) */
> +       PLL_35XX_RATE(666000000, 222, 4, 1),
> +       PLL_35XX_RATE(640000000, 160, 3, 1),
> +       PLL_35XX_RATE(320000000, 160, 3, 2),
> +       { },
> +};
> +
> +static struct samsung_pll_rate_table dpll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_35XX_RATE(rate, m, p, s) */
> +       PLL_35XX_RATE(600000000, 200, 4, 1),
> +       { },
> +};
> +
> +static struct samsung_pll_rate_table epll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_36XX_RATE(rate, m, p, s, k) */
> +       PLL_36XX_RATE(600000000, 100, 2, 1,      0),
> +       PLL_36XX_RATE(400000000, 200, 3, 2,      0),
> +       PLL_36XX_RATE(200000000, 200, 3, 3,      0),
> +       PLL_36XX_RATE(180633600, 301, 5, 3,  -3670),
> +       PLL_36XX_RATE( 67737600, 452, 5, 5, -27263),
> +       PLL_36XX_RATE( 49152000, 197, 3, 5, -25690),
> +       PLL_36XX_RATE( 45158401, 181, 3, 5, -24012),
> +       { },
> +};
> +
> +static struct samsung_pll_rate_table ipll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_35XX_RATE(rate, m, p, s, k) */
> +       PLL_35XX_RATE(864000000, 288, 4, 1),
> +       PLL_35XX_RATE(666000000, 222, 4, 1),
> +       PLL_35XX_RATE(432000000, 288, 4, 2),
> +       { },
> +};
> +
> +static struct samsung_pll_rate_table kpll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_35XX_RATE(rate, m, p, s) */
> +       PLL_35XX_RATE(1500000000, 250, 4, 0),
> +       PLL_35XX_RATE(1400000000, 175, 3, 0),
> +       PLL_35XX_RATE(1300000000, 325, 6, 0),
> +       PLL_35XX_RATE(1200000000, 100, 2, 0),
> +       PLL_35XX_RATE(1100000000, 275, 3, 1),
> +       PLL_35XX_RATE(1000000000, 250, 3, 1),
> +       PLL_35XX_RATE(900000000, 150, 2, 1),
> +       PLL_35XX_RATE(800000000, 200, 3, 1),
> +       PLL_35XX_RATE(700000000, 175, 3, 1),
> +       PLL_35XX_RATE(600000000, 100, 2, 1),
> +       PLL_35XX_RATE(500000000, 250, 3, 2),
> +       PLL_35XX_RATE(400000000, 200, 3, 2),
> +       PLL_35XX_RATE(300000000, 100, 2, 2),
> +       PLL_35XX_RATE(200000000, 200, 3, 3),
> +       { },
> +};
> +
> +static struct samsung_pll_rate_table vpll_24mhz_tbl[] __initdata = {
> +       /* sorted in descending order */
> +       /* PLL_36XX_RATE(rate, m, p, s, k) */
> +       PLL_36XX_RATE(880000000, 220, 3, 1, 0),
> +       PLL_36XX_RATE(640000000, 160, 3, 1, 0),
> +       PLL_36XX_RATE(532000000, 133, 3, 1, 0),
> +       PLL_36XX_RATE(480000000, 240, 3, 2, 0),
> +       PLL_36XX_RATE(440000000, 220, 3, 2, 0),
> +       PLL_36XX_RATE(350000000, 175, 3, 2, 0),
> +       PLL_36XX_RATE(333000000, 111, 2, 2, 0),
> +       PLL_36XX_RATE(266000000, 133, 3, 2, 0),
> +       PLL_36XX_RATE(177000000, 118, 2, 3, 0),
> +       PLL_36XX_RATE(123500000, 330, 4, 4, 0),
> +       PLL_36XX_RATE( 89000000, 178, 3, 4, 0),
> +       { },
> +};
> +
>  static struct samsung_pll_clock exynos5410_plls[nr_plls] __initdata = {
>         [apll] = PLL(pll_35xx, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
> -               APLL_CON0, NULL),
> -       [cpll] = PLL(pll_35xx, CLK_FOUT_CPLL, "fout_cpll", "fin_pll", CPLL_LOCK,
> -               CPLL_CON0, NULL),
> -       [mpll] = PLL(pll_35xx, CLK_FOUT_MPLL, "fout_mpll", "fin_pll", MPLL_LOCK,
> -               MPLL_CON0, NULL),
> +               APLL_CON0, apll_24mhz_tbl),
>         [bpll] = PLL(pll_35xx, CLK_FOUT_BPLL, "fout_bpll", "fin_pll", BPLL_LOCK,
>                 BPLL_CON0, NULL),
> +       [cpll] = PLL(pll_35xx, CLK_FOUT_CPLL, "fout_cpll", "fin_pll", CPLL_LOCK,
> +               CPLL_CON0, cpll_24mhz_tbl),
> +       [dpll] = PLL(pll_35xx, CLK_FOUT_DPLL, "fout_dpll", "fin_pll", DPLL_LOCK,
> +               DPLL_CON0, dpll_24mhz_tbl),
> +       [epll] = PLL(pll_36xx, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
> +               EPLL_CON0, epll_24mhz_tbl),
> +       [ipll] = PLL(pll_35xx, CLK_FOUT_IPLL, "fout_ipll", "fin_pll", IPLL_LOCK,
> +               IPLL_CON0, ipll_24mhz_tbl),
>         [kpll] = PLL(pll_35xx, CLK_FOUT_KPLL, "fout_kpll", "fin_pll", KPLL_LOCK,
> -               KPLL_CON0, NULL),
> +               KPLL_CON0, kpll_24mhz_tbl),
> +       [mpll] = PLL(pll_35xx, CLK_FOUT_MPLL, "fout_mpll", "fin_pll", MPLL_LOCK,
> +               MPLL_CON0, NULL),
> +       [vpll] = PLL(pll_36xx, CLK_FOUT_VPLL, "fout_vpll", "mout_vpllsrc",
> +               VPLL_LOCK, VPLL_CON0, vpll_24mhz_tbl),
>  };

It would be better to check the parent rate and then conditionally
assign the rate table.

>
>  /* register exynos5410 clocks */
> diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
> index 9b180f0..46e85dc 100644
> --- a/include/dt-bindings/clock/exynos5410.h
> +++ b/include/dt-bindings/clock/exynos5410.h
> @@ -4,10 +4,14 @@
>  /* core clocks */
>  #define CLK_FIN_PLL 1
>  #define CLK_FOUT_APLL 2
> -#define CLK_FOUT_CPLL 3
> -#define CLK_FOUT_MPLL 4
> -#define CLK_FOUT_BPLL 5
> -#define CLK_FOUT_KPLL 6
> +#define CLK_FOUT_BPLL 3
> +#define CLK_FOUT_CPLL 4
> +#define CLK_FOUT_DPLL 5
> +#define CLK_FOUT_EPLL 6
> +#define CLK_FOUT_IPLL 7
> +#define CLK_FOUT_KPLL 8
> +#define CLK_FOUT_MPLL 9
> +#define CLK_FOUT_VPLL 10

The reordering of the definitions could be avoided. It is not really
helping in anyway.

Thanks,
Thomas.

>
>  /* gate for special clocks (sclk) */
>  #define CLK_SCLK_UART0 128
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

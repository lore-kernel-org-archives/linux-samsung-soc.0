From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 6/6] clk: samsung: Add EPLL and VPLL freq table for
 exynos5250 SoC
Date: Wed, 12 Jun 2013 13:52:13 -0700
Message-ID: <CAD=FV=WN21XTu5vjj=SRiUjS08HuV3jPr=WO=v9-_f1+G1dJaA@mail.gmail.com>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com>
	<1370272196-4346-7-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:43275 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758005Ab3FLUwP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 16:52:15 -0400
Received: by mail-lb0-f177.google.com with SMTP id 10so8459149lbf.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 13:52:14 -0700 (PDT)
In-Reply-To: <1370272196-4346-7-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, Patch Tracking <patches@linaro.org>

Yadwinder,

On Mon, Jun 3, 2013 at 8:09 AM, Yadwinder Singh Brar
<yadi.brar@samsung.com> wrote:
> Adds the EPLL and VPLL freq table for exynos5250 SoC.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |   53 ++++++++++++++++++++++++++++++++--
>  drivers/clk/samsung/clk.h            |    2 +
>  2 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 70cc6cf..f98c19d 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -472,11 +472,34 @@ static __initdata struct of_device_id ext_clk_match[] = {
>         { },
>  };
>
> +static __initdata struct samsung_pll_rate_table vpll_24mhz_tbl[] = {
> +       /* sorted in descending order */
> +       /* PLL_36XX_RATE(rate, m, p, s, k) */
> +       PLL_36XX_RATE(266000000, 266, 3, 3, 0),
> +       /* Not in UM, but need for eDP on snow */
> +       PLL_36XX_RATE(70500000, 94, 2, 4, 0),
> +};
> +
> +static __initdata struct samsung_pll_rate_table epll_24mhz_tbl[] = {
> +       /* sorted in descending order */
> +       /* PLL_36XX_RATE(rate, m, p, s, k) */
> +       PLL_36XX_RATE(192000000, 48, 3, 1, 0),
> +       PLL_36XX_RATE(180633600, 45, 3, 1, 10381),
> +       PLL_36XX_RATE(180000000, 45, 3, 1, 0),
> +       PLL_36XX_RATE(73728000, 73, 3, 3, 47710),
> +       PLL_36XX_RATE(67737600, 90, 4, 3, 20762),
> +       PLL_36XX_RATE(49152000, 49, 3, 3, 9962),
> +       PLL_36XX_RATE(45158400, 45, 3, 3, 10381),
> +       PLL_36XX_RATE(32768000, 131, 3, 5, 4719),
> +};
> +
>  /* register exynox5250 clocks */
>  void __init exynos5250_clk_init(struct device_node *np)
>  {
>         void __iomem *reg_base;
>         struct clk *apll, *mpll, *epll, *vpll, *bpll, *gpll, *cpll;
> +       struct clk *vpllsrc;
> +       unsigned long fin_pll_rate, mout_vpllsrc_rate = 0;
>
>         if (np) {
>                 reg_base = of_iomap(np, 0);
> @@ -496,6 +519,11 @@ void __init exynos5250_clk_init(struct device_node *np)
>         samsung_clk_register_mux(exynos5250_pll_pmux_clks,
>                         ARRAY_SIZE(exynos5250_pll_pmux_clks));
>
> +       fin_pll_rate = _get_rate("fin_pll");
> +       vpllsrc = __clk_lookup("mout_vpllsrc");
> +       if (vpllsrc)
> +               mout_vpllsrc_rate = clk_get_rate(vpllsrc);
> +
>         apll = samsung_clk_register_pll35xx("fout_apll", "fin_pll",
>                         reg_base, NULL, 0);
>         mpll = samsung_clk_register_pll35xx("fout_mpll", "fin_pll",
> @@ -506,10 +534,29 @@ void __init exynos5250_clk_init(struct device_node *np)
>                         reg_base + 0x10050, NULL, 0);
>         cpll = samsung_clk_register_pll35xx("fout_cpll", "fin_pll",
>                         reg_base + 0x10020, NULL, 0);
> -       epll = samsung_clk_register_pll36xx("fout_epll", "fin_pll",
> -                       reg_base + 0x10030, NULL, 0);
> -       vpll = samsung_clk_register_pll36xx("fout_vpll", "mout_vpllsrc",
> +
> +       if (fin_pll_rate == (24 * MHZ)) {
> +               epll = samsung_clk_register_pll36xx("fout_epll", "fin_pll",
> +                               reg_base + 0x10030, epll_24mhz_tbl,
> +                               ARRAY_SIZE(epll_24mhz_tbl));
> +       } else {
> +               pr_warn("%s: valid epll rate_table missing for\n"
> +                       "parent fin_pll:%lu hz\n", __func__, fin_pll_rate);

It seems like we could just have a warning once at the top of this
file.  ...and since we think nobody has designed a 5250 with a 26MHz
input clock we could even just consider it an error at the moment to
avoid adding a bunch of code.

You could also avoid all of these "if" statements with a level of indirection.

enum {
  EPLL, VPLL
};

samsung_pll_rate_table *plls_24mhz[] = { epll_24mhz_tbl, vpll_24mhz_tbl };
samsung_pll_rate_table *plls_default[] = { };

...of course you'd need a parallel table for sizes.  That does suggest
that Tomasz's thought of terminating the list with a sentinal would be
cleaner.

-Doug

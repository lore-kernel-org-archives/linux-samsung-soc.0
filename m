From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 6/6] clk: samsung: Add EPLL and VPLL freq table for
 exynos5250 SoC
Date: Fri, 31 May 2013 10:58:07 -0700
Message-ID: <CAD=FV=UXV59zcrhLxjnU0LgX1LR855mQUd-xMM4bbXhRmB7UyQ@mail.gmail.com>
References: <1370003496-19288-1-git-send-email-vikas.sajjan@linaro.org>
	<1370003496-19288-7-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:54922 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753869Ab3EaR6M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 13:58:12 -0400
Received: by mail-lb0-f170.google.com with SMTP id t13so1979587lbd.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 10:58:10 -0700 (PDT)
In-Reply-To: <1370003496-19288-7-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas and Yadwinder,

On Fri, May 31, 2013 at 5:31 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds the EPLL and VPLL freq table for exynos5250 SoC.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |   48 +++++++++++++++++++++++++++++++---
>  drivers/clk/samsung/clk.h            |    2 ++
>  2 files changed, 47 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index b0e6680..0566421 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -473,11 +473,32 @@ static __initdata struct of_device_id ext_clk_match[] = {
>         { },
>  };
>
> +static const struct samsung_pll_rate_table vpll_24mhz_tbl[] = {
> +       /* sorted in descending order */
> +       /* PLL_36XX_RATE(rate, m, p, s, k) */
> +       PLL_36XX_RATE(266000000, 266, 3, 3, 0),
> +       PLL_36XX_RATE(70500000, 94, 2, 4, 0),

Would be nice to include the comment that you included in our gerrit:
that the 70.5 is not in the manual but is used by exynos5250-snow.


> +       fin_pll_rate = _get_rate("fin_pll");
> +       mout_vpllsrc_rate = _get_rate("mout_vpllsrc");

This line is why you added an alias for mout_vpllsrc.  I'd rather not
see that since it also exports the clock to other places.

I've changed this to use __clk_lookup().  That function _is_ exported
by <linux/clk-provider.h> and we are a clock provider, so it seems
legit to use that.  ...and it's nice not to have an extra clock alias.

See my changes to <https://gerrit.chromium.org/gerrit/#/c/56797/> for
an example.


> @@ -507,10 +531,28 @@ void __init exynos5250_clk_init(struct device_node *np)
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
> +               pr_warn("Exynos5250: valid epll rate_table missing for\n"
> +                       "parent fin_pll:%lu hz\n", fin_pll_rate);

nit: use %s and __func__ rather than adding Exynos5250 hardcoded in here?


-Doug

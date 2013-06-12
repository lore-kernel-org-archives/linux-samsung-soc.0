From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 2/6] clk: samsung: Add support to register rate_table
 for PLL3xxx
Date: Wed, 12 Jun 2013 13:43:37 -0700
Message-ID: <CAD=FV=VamHixgMTn=yxH3C0jfsAG3R5Dfr7UquH_+bfNFMqAKw@mail.gmail.com>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com>
	<1370272196-4346-3-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:44209 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756176Ab3FLUnj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 16:43:39 -0400
Received: by mail-la0-f41.google.com with SMTP id fn20so8366609lab.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 13:43:37 -0700 (PDT)
In-Reply-To: <1370272196-4346-3-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, Patch Tracking <patches@linaro.org>

Yadwinder,

On Mon, Jun 3, 2013 at 8:09 AM, Yadwinder Singh Brar
<yadi.brar@samsung.com> wrote:
> This patch defines a common rate_table which will contain recommended p, m, s,
> k values for supported rates that needs to be changed for changing
> corresponding PLL's rate.
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c    |    8 +++---
>  drivers/clk/samsung/clk-exynos5250.c |   14 ++++++------
>  drivers/clk/samsung/clk-pll.c        |   22 +++++++++++++++++++-
>  drivers/clk/samsung/clk-pll.h        |   35 ++++++++++++++++++++++++++++++++-
>  4 files changed, 64 insertions(+), 15 deletions(-)

Using something like patman
<http://git.denx.de/?p=u-boot.git;a=blob;f=tools/patman/README;hb=refs/heads/master>
would really help here so you could get some version history.  I see
it in 0/6 but that's a bit of a pain...

Did you and Tomasz ever come to an agreement about whether the fin
freq needs to be specified with the PMSK values?


> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index ba33bc6..e02a342 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -1028,13 +1028,13 @@ void __init exynos4_clk_init(struct device_node *np, enum exynos4_soc exynos4_so
>                                         reg_base + VPLL_CON0, pll_4650c);
>         } else {
>                 apll = samsung_clk_register_pll35xx("fout_apll", "fin_pll",
> -                                       reg_base + APLL_LOCK);
> +                                       reg_base + APLL_LOCK, NULL, 0);
>                 mpll = samsung_clk_register_pll35xx("fout_mpll", "fin_pll",
> -                                       reg_base + E4X12_MPLL_LOCK);
> +                                       reg_base + E4X12_MPLL_LOCK, NULL, 0);
>                 epll = samsung_clk_register_pll36xx("fout_epll", "fin_pll",
> -                                       reg_base + EPLL_LOCK);
> +                                       reg_base + EPLL_LOCK, NULL, 0);
>                 vpll = samsung_clk_register_pll36xx("fout_vpll", "fin_pll",
> -                                       reg_base + VPLL_LOCK);
> +                                       reg_base + VPLL_LOCK, NULL, 0);
>         }
>
>         samsung_clk_add_lookup(apll, fout_apll);
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 687b580..ddf10ca 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -491,19 +491,19 @@ void __init exynos5250_clk_init(struct device_node *np)
>                         ext_clk_match);
>
>         apll = samsung_clk_register_pll35xx("fout_apll", "fin_pll",
> -                       reg_base);
> +                       reg_base, NULL, 0);
>         mpll = samsung_clk_register_pll35xx("fout_mpll", "fin_pll",
> -                       reg_base + 0x4000);
> +                       reg_base + 0x4000, NULL, 0);
>         bpll = samsung_clk_register_pll35xx("fout_bpll", "fin_pll",
> -                       reg_base + 0x20010);
> +                       reg_base + 0x20010, NULL, 0);
>         gpll = samsung_clk_register_pll35xx("fout_gpll", "fin_pll",
> -                       reg_base + 0x10050);
> +                       reg_base + 0x10050, NULL, 0);
>         cpll = samsung_clk_register_pll35xx("fout_cpll", "fin_pll",
> -                       reg_base + 0x10020);
> +                       reg_base + 0x10020, NULL, 0);
>         epll = samsung_clk_register_pll36xx("fout_epll", "fin_pll",
> -                       reg_base + 0x10030);
> +                       reg_base + 0x10030, NULL, 0);
>         vpll = samsung_clk_register_pll36xx("fout_vpll", "mout_vpllsrc",
> -                       reg_base + 0x10040);
> +                       reg_base + 0x10040, NULL, 0);
>
>         samsung_clk_register_fixed_rate(exynos5250_fixed_rate_clks,
>                         ARRAY_SIZE(exynos5250_fixed_rate_clks));
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index a7d8ad9..cba73a4 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -16,6 +16,8 @@
>  struct samsung_clk_pll {
>         struct clk_hw           hw;
>         const void __iomem      *base;
> +       const struct samsung_pll_rate_table *rate_table;
> +       unsigned int rate_count;
>  };
>
>  #define to_clk_pll(_hw) container_of(_hw, struct samsung_clk_pll, hw)
> @@ -62,7 +64,9 @@ static const struct clk_ops samsung_pll35xx_clk_ops = {
>  };
>
>  struct clk * __init samsung_clk_register_pll35xx(const char *name,
> -                       const char *pname, const void __iomem *base)
> +                       const char *pname, const void __iomem *base,
> +                       const struct samsung_pll_rate_table *rate_table,
> +                       const unsigned int rate_count)
>  {
>         struct samsung_clk_pll *pll;
>         struct clk *clk;
> @@ -80,6 +84,12 @@ struct clk * __init samsung_clk_register_pll35xx(const char *name,
>         init.parent_names = &pname;
>         init.num_parents = 1;
>
> +       if (rate_table && rate_count) {
> +               pll->rate_count = rate_count;
> +               pll->rate_table = kmemdup(rate_table, rate_count *
> +                       sizeof(struct samsung_pll_rate_table), GFP_KERNEL);
> +       }
> +
>         pll->hw.init = &init;
>         pll->base = base;
>
> @@ -137,7 +147,9 @@ static const struct clk_ops samsung_pll36xx_clk_ops = {
>  };
>
>  struct clk * __init samsung_clk_register_pll36xx(const char *name,
> -                       const char *pname, const void __iomem *base)
> +                       const char *pname, const void __iomem *base,
> +                       const struct samsung_pll_rate_table *rate_table,
> +                       const unsigned int rate_count)
>  {
>         struct samsung_clk_pll *pll;
>         struct clk *clk;
> @@ -155,6 +167,12 @@ struct clk * __init samsung_clk_register_pll36xx(const char *name,
>         init.parent_names = &pname;
>         init.num_parents = 1;
>
> +       if (rate_table && rate_count) {
> +               pll->rate_count = rate_count;
> +               pll->rate_table = kmemdup(rate_table, rate_count *
> +                       sizeof(struct samsung_pll_rate_table), GFP_KERNEL);

To me I'd rather see the tables left as "init", not "init_data" and
avoid the strdup().  The small amount of waste from multiple tables
doesn't seem worth the extra allocation.

...but I don't really care much either way.

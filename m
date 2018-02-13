From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/7] clk: samsung: add compile time PLL rate validators
Date: Tue, 13 Feb 2018 15:25:07 +0100
Message-ID: <CAJKOXPepJYC8-mRm=k_-GdVn_ovJBK3UK9TkSpG0F8tviEgVvg@mail.gmail.com>
References: <CGME20180213134104eucas1p133aff142a675b378c5d531ca20ef29c8@eucas1p1.samsung.com>
 <20180213134032.30235-1-a.hajda@samsung.com> <20180213134032.30235-8-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180213134032.30235-8-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 13, 2018 at 2:40 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Rates declared in PLL rate tables should match exactly rates calculated
> from PLL coefficients. To avoid possible mistakes we can use compile
> time validation.
> The patch introduces such validators and expands all initializers
> with additional input frequency parameter, required to validate rates.
> Since S3C24xx PLLs requires different validators two new macros have
> been introduced to deal with it.
> As the patch adds only compile time validators it should not have impact
> on compiled code.

Cool! One nit below.

(...)

>
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index bbfa57b4e017..492d51691080 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -140,7 +140,7 @@ static const struct samsung_div_clock topc_div_clks[] __initconst = {
>  };
>
>  static const struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initconst = {
> -       PLL_36XX_RATE(491519897, 20, 1, 0, 31457),
> +       PLL_36XX_RATE(24 * MHZ, 491519897, 20, 1, 0, 31457),
>         {},
>  };
>
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 61eb8abbfd9c..b1ee0e801d3e 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -41,35 +41,69 @@ enum samsung_pll_type {
>         pll_1460x,
>  };
>
> -#define PLL_35XX_RATE(_rate, _m, _p, _s)                       \
> +/*
> + * To validate PLL rates we need compile time checker.
> + * Since BUILD_BUG_ON does work with initializers, we need some replacement.

I think you meant here:
s/does/does not/

Anyway:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 5/6] clk: samsung: Reorder MUX registration for mout_vpllsrc
Date: Wed, 12 Jun 2013 23:06:53 +0200
Message-ID: <6043487.0U6pzGhZid@flatron>
References: <1370272196-4346-1-git-send-email-yadi.brar@samsung.com> <1370272196-4346-6-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:51154 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932129Ab3FLVG4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:06:56 -0400
Received: by mail-ee0-f45.google.com with SMTP id c1so4356451eek.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:06:55 -0700 (PDT)
In-Reply-To: <1370272196-4346-6-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, dianders@chromium.org, t.figa@samsung.com, vikas.sajjan@linaro.org, patches@linaro.org

On Monday 03 of June 2013 20:39:55 Yadwinder Singh Brar wrote:
> From: Vikas Sajjan <vikas.sajjan@linaro.org>
> 
> While trying to get rate of "mout_vpllsrc" MUX (parent) for registering
> the "fout_vpll" (child), we found get rate was failing.
> 
> So this patch moves the mout_vpllsrc MUX out of the existing common list
> and registers the mout_vpllsrc MUX before the PLL registrations.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

> diff --git a/drivers/clk/samsung/clk-exynos5250.c
> b/drivers/clk/samsung/clk-exynos5250.c index ddf10ca..70cc6cf 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -207,6 +207,10 @@ struct samsung_fixed_factor_clock
> exynos5250_fixed_factor_clks[] __initdata = { FFACTOR(none,
> "fout_bplldiv2", "fout_bpll", 1, 2, 0),
>  };
> 
> +struct samsung_mux_clock exynos5250_pll_pmux_clks[] __initdata = {
> +	MUX(none, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
> +};
> +
>  struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
>  	MUX(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
>  	MUX(none, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
> @@ -214,7 +218,6 @@ struct samsung_mux_clock exynos5250_mux_clks[]
> __initdata = { MUX(none, "sclk_mpll", mout_mpll_p, SRC_CORE1, 8, 1),
>  	MUX(none, "mout_bpll_fout", mout_bpll_fout_p, PLL_DIV2_SEL, 0, 1),
>  	MUX(none, "sclk_bpll", mout_bpll_p, SRC_CDREX, 0, 1),
> -	MUX(none, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
>  	MUX(none, "sclk_vpll", mout_vpll_p, SRC_TOP2, 16, 1),
>  	MUX(none, "sclk_epll", mout_epll_p, SRC_TOP2, 12, 1),
>  	MUX(none, "sclk_cpll", mout_cpll_p, SRC_TOP2, 8, 1),
> @@ -490,6 +493,9 @@ void __init exynos5250_clk_init(struct device_node
> *np) ARRAY_SIZE(exynos5250_fixed_rate_ext_clks),
>  			ext_clk_match);
> 
> +	samsung_clk_register_mux(exynos5250_pll_pmux_clks,
> +			ARRAY_SIZE(exynos5250_pll_pmux_clks));
> +
>  	apll = samsung_clk_register_pll35xx("fout_apll", "fin_pll",
>  			reg_base, NULL, 0);
>  	mpll = samsung_clk_register_pll35xx("fout_mpll", "fin_pll",

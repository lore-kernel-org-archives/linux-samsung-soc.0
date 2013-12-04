From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2] clk: exynos5420: fix cpll clock register offsets
Date: Wed, 04 Dec 2013 12:25:27 -0800
Message-ID: <20131204202527.29850.94931@quantum>
References: <1380186395-28814-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f54.google.com ([209.85.213.54]:34584 "EHLO
	mail-yh0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755220Ab3LDUZh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Dec 2013 15:25:37 -0500
Received: by mail-yh0-f54.google.com with SMTP id z12so11968238yhz.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2013 12:25:36 -0800 (PST)
In-Reply-To: <1380186395-28814-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, yadi.brar@samsung.com, t.figa@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

Quoting Chander Kashyap (2013-09-26 02:06:35)
> Fixes cpll control and lock register offset values for Exynos5420 SoC.
> 
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Taken into clk-next.

Thanks,
Mike

> ---
> Changes Since v1:
>         - Fixed patch subject as per Kukgin suggestion.
> 
>  drivers/clk/samsung/clk-exynos5420.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 86dfc64..892aac0 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -730,8 +730,8 @@ struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>  struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
>         [apll] = PLL(pll_2550, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
>                 APLL_CON0, NULL),
> -       [cpll] = PLL(pll_2550, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
> -               MPLL_CON0, NULL),
> +       [cpll] = PLL(pll_2550, fout_cpll, "fout_cpll", "fin_pll", CPLL_LOCK,
> +               CPLL_CON0, NULL),
>         [dpll] = PLL(pll_2550, fout_dpll, "fout_dpll", "fin_pll", DPLL_LOCK,
>                 DPLL_CON0, NULL),
>         [epll] = PLL(pll_2650, fout_epll, "fout_epll", "fin_pll", EPLL_LOCK,
> -- 
> 1.7.9.5
> 

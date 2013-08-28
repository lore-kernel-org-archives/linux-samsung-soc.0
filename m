From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420 SoC
Date: Wed, 28 Aug 2013 10:18:32 +0200
Message-ID: <1819543.NdlB5vViSf@flatron>
References: <1376301734-21847-1-git-send-email-vikas.sajjan@linaro.org> <1376301734-21847-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:50048 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752569Ab3H1ISf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 04:18:35 -0400
Received: by mail-ea0-f179.google.com with SMTP id b10so2725241eae.24
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 01:18:34 -0700 (PDT)
In-Reply-To: <1376301734-21847-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: mturquette@linaro.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, dianders@chromium.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

On Monday 12 of August 2013 15:32:14 Vikas Sajjan wrote:
> Adds APLL, KPLL, EPLL and VPLL freq table for exynos5420 SoC.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |   81
> ++++++++++++++++++++++++++++++++++ 1 file changed, 81 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c
> b/drivers/clk/samsung/clk-exynos5420.c index e035fd0..42cea7e 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -757,10 +757,81 @@ static struct of_device_id ext_clk_match[]
> __initdata = { { },
>  };
> 
> +static struct samsung_pll_rate_table apll_24mhz_tbl[] __initdata = {
> +	/* sorted in descending order */
> +	/* PLL_35XX_RATE(rate, m, p, s) */
> +	PLL_35XX_RATE(2000000000, 250, 3, 0),
> +	PLL_35XX_RATE(1900000000, 475, 6, 0),
> +	PLL_35XX_RATE(1800000000, 225, 3, 0),
> +	PLL_35XX_RATE(1700000000, 425, 6, 0),
> +	PLL_35XX_RATE(1600000000, 200, 3, 0),
> +	PLL_35XX_RATE(1500000000, 250, 4, 0),
> +	PLL_35XX_RATE(1400000000, 175, 3, 0),
> +	PLL_35XX_RATE(1300000000, 325, 6, 0),
> +	PLL_35XX_RATE(1200000000, 200, 2, 1),
> +	PLL_35XX_RATE(1100000000, 275, 3, 1),
> +	PLL_35XX_RATE(1000000000, 250, 3, 1),
> +	PLL_35XX_RATE(900000000, 150, 2, 1),
> +	PLL_35XX_RATE(800000000, 200, 3, 1),
> +	PLL_35XX_RATE(700000000, 175, 3, 1),
> +	PLL_35XX_RATE(600000000, 200, 2, 2),
> +	PLL_35XX_RATE(500000000, 250, 3, 2),
> +	PLL_35XX_RATE(400000000, 200, 3, 2),
> +	PLL_35XX_RATE(300000000, 400, 4, 3),
> +	PLL_35XX_RATE(200000000, 200, 3, 3),
> +	{ },
> +};
> +
> +static struct samsung_pll_rate_table kpll_24mhz_tbl[] __initdata = {
> +	/* sorted in descending order */
> +	/* PLL_35XX_RATE(rate, m, p, s) */
> +	PLL_35XX_RATE(1300000000, 325, 6, 0),
> +	PLL_35XX_RATE(1200000000, 200, 2, 1),
> +	PLL_35XX_RATE(1100000000, 275, 3, 1),
> +	PLL_35XX_RATE(1000000000, 250, 3, 1),
> +	PLL_35XX_RATE(900000000, 150, 2, 1),
> +	PLL_35XX_RATE(800000000, 200, 3, 1),
> +	PLL_35XX_RATE(700000000, 175, 3, 1),
> +	PLL_35XX_RATE(600000000, 200, 2, 2),
> +	PLL_35XX_RATE(500000000, 250, 3, 2),
> +	PLL_35XX_RATE(400000000, 200, 3, 2),
> +	PLL_35XX_RATE(300000000, 400, 4, 3),
> +	PLL_35XX_RATE(200000000, 200, 3, 3),
> +	{ },
> +};
> +
> +static struct samsung_pll_rate_table epll_24mhz_tbl[] __initdata = {
> +	/* sorted in descending order */
> +	/* PLL_36XX_RATE(rate, m, p, s, k) */
> +	PLL_36XX_RATE(192000000, 64, 2, 2, 0),
> +	PLL_36XX_RATE(180633600, 45, 3, 1, 10381),

This one is in fact 180633605 Hz.

> +	PLL_36XX_RATE(180000000, 45, 3, 1, 0),
> +	PLL_36XX_RATE(73728000, 98, 2, 4, 19923),
> +	PLL_36XX_RATE(67737600, 90, 2, 4, 20762),

67737602 Hz

> +	PLL_36XX_RATE(49152000, 98, 3, 4, 19923),
> +	PLL_36XX_RATE(45158400, 90, 3, 4, 20762),

45158401 Hz

> +	PLL_36XX_RATE(32768000, 131, 3, 5, 4719),

32768001 Hz

> +	{ },
> +};
> +
> +static struct samsung_pll_rate_table vpll_24mhz_tbl[] __initdata = {
> +	/* sorted in descending order */
> +	/* PLL_35XX_RATE(rate, m, p, s) */
> +	PLL_35XX_RATE(533000000, 533, 6, 2),
> +	PLL_35XX_RATE(480000000, 160, 2, 2),
> +	PLL_35XX_RATE(420000000, 140, 2, 2),
> +	PLL_35XX_RATE(350000000, 175, 3, 2),
> +	PLL_35XX_RATE(266000000, 266, 3, 3),
> +	PLL_35XX_RATE(177000000, 118, 2, 3),
> +	PLL_35XX_RATE(100000000, 200, 3, 4),
> +	{ },
> +};
> +
>  /* register exynos5420 clocks */
>  static void __init exynos5420_clk_init(struct device_node *np)
>  {
>  	void __iomem *reg_base;
> +	unsigned long fin_pll_rate;

This variable seems to be unnecessary. See below.

> 
>  	if (np) {
>  		reg_base = of_iomap(np, 0);
> @@ -776,6 +847,16 @@ static void __init exynos5420_clk_init(struct
> device_node *np)
> samsung_clk_of_register_fixed_ext(exynos5420_fixed_rate_ext_clks,
> ARRAY_SIZE(exynos5420_fixed_rate_ext_clks),
>  			ext_clk_match);
> +
> +	fin_pll_rate = _get_rate("fin_pll");
> +
> +	if (fin_pll_rate == 24 * MHZ) {

You can simplify this to

	if (_get_rate("fin_pll") == 24 * MHZ) {

Best regards,
Tomasz

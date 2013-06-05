From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] clk: exynos5440: Staticize local symbols
Date: Wed, 05 Jun 2013 21:18:18 +0900
Message-ID: <08f601ce61e6$c3074910$4915db30$%kim@samsung.com>
References: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
 <1366106719-26342-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20750 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389Ab3FEMST (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 08:18:19 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNX00F4L66IKTR0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Jun 2013 21:18:18 +0900 (KST)
In-reply-to: <1366106719-26342-3-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, thomas.abraham@linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> These symbols are used only in this file and hence should be
> static.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5440.c |   17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5440.c
> b/drivers/clk/samsung/clk-exynos5440.c
> index a0a094c..ac6c95f 100644
> --- a/drivers/clk/samsung/clk-exynos5440.c
> +++ b/drivers/clk/samsung/clk-exynos5440.c
> @@ -42,12 +42,14 @@ PNAME(mout_armclk_p)	= { "cplla", "cpllb" };
>  PNAME(mout_spi_p)	= { "div125", "div200" };
> 
>  /* fixed rate clocks generated outside the soc */
> -struct samsung_fixed_rate_clock exynos5440_fixed_rate_ext_clks[]
> __initdata = {
> +static struct
> +samsung_fixed_rate_clock exynos5440_fixed_rate_ext_clks[] __initdata = {
>  	FRATE(none, "xtal", NULL, CLK_IS_ROOT, 0),
>  };
> 
>  /* fixed rate clocks */
> -struct samsung_fixed_rate_clock exynos5440_fixed_rate_clks[] __initdata =
> {
> +static struct
> +samsung_fixed_rate_clock exynos5440_fixed_rate_clks[] __initdata = {
>  	FRATE(none, "ppll", NULL, CLK_IS_ROOT, 1000000000),
>  	FRATE(none, "usb_phy0", NULL, CLK_IS_ROOT, 60000000),
>  	FRATE(none, "usb_phy1", NULL, CLK_IS_ROOT, 60000000),
> @@ -56,26 +58,27 @@ struct samsung_fixed_rate_clock
> exynos5440_fixed_rate_clks[] __initdata = {
>  };
> 
>  /* fixed factor clocks */
> -struct samsung_fixed_factor_clock exynos5440_fixed_factor_clks[]
> __initdata = {
> +static struct
> +samsung_fixed_factor_clock exynos5440_fixed_factor_clks[] __initdata = {
>  	FFACTOR(none, "div250", "ppll", 1, 4, 0),
>  	FFACTOR(none, "div200", "ppll", 1, 5, 0),
>  	FFACTOR(none, "div125", "div250", 1, 2, 0),
>  };
> 
>  /* mux clocks */
> -struct samsung_mux_clock exynos5440_mux_clks[] __initdata = {
> +static struct samsung_mux_clock exynos5440_mux_clks[] __initdata = {
>  	MUX(none, "mout_spi", mout_spi_p, MISC_DOUT1, 5, 1),
>  	MUX_A(arm_clk, "arm_clk", mout_armclk_p,
>  			CPU_CLK_STATUS, 0, 1, "armclk"),
>  };
> 
>  /* divider clocks */
> -struct samsung_div_clock exynos5440_div_clks[] __initdata = {
> +static struct samsung_div_clock exynos5440_div_clks[] __initdata = {
>  	DIV(spi_baud, "div_spi", "mout_spi", MISC_DOUT1, 3, 2),
>  };
> 
>  /* gate clocks */
> -struct samsung_gate_clock exynos5440_gate_clks[] __initdata = {
> +static struct samsung_gate_clock exynos5440_gate_clks[] __initdata = {
>  	GATE(pb0_250, "pb0_250", "div250", CLKEN_OV_VAL, 3, 0, 0),
>  	GATE(pr0_250, "pr0_250", "div250", CLKEN_OV_VAL, 4, 0, 0),
>  	GATE(pr1_250, "pr1_250", "div250", CLKEN_OV_VAL, 5, 0, 0),
> @@ -104,7 +107,7 @@ static __initdata struct of_device_id ext_clk_match[]
> = {
>  };
> 
>  /* register exynos5440 clocks */
> -void __init exynos5440_clk_init(struct device_node *np)
> +static void __init exynos5440_clk_init(struct device_node *np)
>  {
>  	void __iomem *reg_base;
> 
> --
> 1.7.9.5

Same...

Other look good to me,

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin

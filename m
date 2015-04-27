From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH v3 10/10] clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED
 flag to prevent the hang for suspend-to-ram
Date: Mon, 27 Apr 2015 22:49:59 +0900
Message-ID: <CAJKOXPfjo_LovrCbBccrPVKSnUBCJNd8+eKQGa40UwDzkL1=zg@mail.gmail.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
	<1430134597-14668-11-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:36096 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964826AbbD0NuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 09:50:03 -0400
In-Reply-To: <1430134597-14668-11-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>

2015-04-27 20:36 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> From: Jonghwa Lee <jonghwa3.lee@samsung.com>
>
> Some clocks are required being unmasked for suspend-to-ram. Otherwise,
> PMU (Power Management Unit) will stick and power line never down.

You mean "will stuck and never power down"?

One minor nit below, but overall looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Best regards,
Krzysztof


>
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 39c9564..84f02ec 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -697,11 +697,14 @@ static struct samsung_gate_clock top_gate_clks[] __initdata = {
>         GATE(CLK_SCLK_PCM1_PERIC, "sclk_pcm1_peric", "div_sclk_pcm1",
>                         ENABLE_SCLK_TOP_PERIC, 7, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_SCLK_UART2_PERIC, "sclk_uart2_peric", "div_sclk_uart2",
> -                       ENABLE_SCLK_TOP_PERIC, 5, CLK_SET_RATE_PARENT, 0),
> +                       ENABLE_SCLK_TOP_PERIC, 5, CLK_SET_RATE_PARENT |
> +                       CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_SCLK_UART1_PERIC, "sclk_uart1_peric", "div_sclk_uart1",
> -                       ENABLE_SCLK_TOP_PERIC, 4, CLK_SET_RATE_PARENT, 0),
> +                       ENABLE_SCLK_TOP_PERIC, 4, CLK_SET_RATE_PARENT |
> +                       CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_SCLK_UART0_PERIC, "sclk_uart0_peric", "div_sclk_uart0",
> -                       ENABLE_SCLK_TOP_PERIC, 3, CLK_SET_RATE_PARENT, 0),
> +                       ENABLE_SCLK_TOP_PERIC, 3, CLK_SET_RATE_PARENT |
> +                       CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_SCLK_SPI2_PERIC, "sclk_spi2_peric", "div_sclk_spi2_b",
>                         ENABLE_SCLK_TOP_PERIC, 2, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_SCLK_SPI1_PERIC, "sclk_spi1_peric", "div_sclk_spi1_b",
> @@ -862,7 +865,7 @@ static struct samsung_div_clock cpif_div_clks[] __initdata = {
>  static struct samsung_gate_clock cpif_gate_clks[] __initdata = {
>         /* ENABLE_SCLK_CPIF */
>         GATE(CLK_SCLK_MPHY_PLL, "sclk_mphy_pll", "mout_mphy_pll",
> -                       ENABLE_SCLK_CPIF, 9, 0, 0),
> +                       ENABLE_SCLK_CPIF, 9, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_SCLK_UFS_MPHY, "sclk_ufs_mphy", "div_sclk_mphy",
>                         ENABLE_SCLK_CPIF, 4, 0, 0),
>  };
> @@ -1444,6 +1447,7 @@ static struct samsung_gate_clock mif_gate_clks[] __initdata = {
>         GATE(CLK_PCLK_ASYNCAXI_NOC_P_CCI, "pclk_asyncaxi_noc_p_cci",
>                         "div_aclk_mif_133", ENABLE_PCLK_MIF, 21,
>                         CLK_IGNORE_UNUSED, 0),
> +

This new line seems unrelated.

>         GATE(CLK_PCLK_ASYNCAXI_CP1, "pclk_asyncaxi_cp1", "div_aclk_mif_133",
>                         ENABLE_PCLK_MIF, 19, 0, 0),
>         GATE(CLK_PCLK_ASYNCAXI_CP0, "pclk_asyncaxi_cp0", "div_aclk_mif_133",

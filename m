From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos4: Staticize local symbols
Date: Wed, 5 Jun 2013 17:32:08 +0530
Message-ID: <CAK9yfHxQ2HHO1w9hJaoEYurivdCudoZqJfnU2StTBpwSp1t6Aw@mail.gmail.com>
References: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:62844 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753326Ab3FEMCJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 08:02:09 -0400
Received: by mail-ob0-f169.google.com with SMTP id up14so2445434obb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jun 2013 05:02:08 -0700 (PDT)
In-Reply-To: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Ping..

On 16 April 2013 15:35, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> These symbols are used only in this file and hence should be
> static.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos4.c |   26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 7104669..26f2a85 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -339,24 +339,26 @@ PNAME(mout_user_aclk200_p4x12) = {"fin_pll", "div_aclk200", };
>  PNAME(mout_user_aclk266_gps_p4x12) = {"fin_pll", "div_aclk266_gps", };
>
>  /* fixed rate clocks generated outside the soc */
> -struct samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata = {
> +static struct
> +samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata = {
>         FRATE(xxti, "xxti", NULL, CLK_IS_ROOT, 0),
>         FRATE(xusbxti, "xusbxti", NULL, CLK_IS_ROOT, 0),
>  };
>
>  /* fixed rate clocks generated inside the soc */
> -struct samsung_fixed_rate_clock exynos4_fixed_rate_clks[] __initdata = {
> +static struct samsung_fixed_rate_clock exynos4_fixed_rate_clks[] __initdata = {
>         FRATE(none, "sclk_hdmi24m", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(none, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
>         FRATE(none, "sclk_usbphy0", NULL, CLK_IS_ROOT, 48000000),
>  };
>
> -struct samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata = {
> +static struct
> +samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata = {
>         FRATE(none, "sclk_usbphy1", NULL, CLK_IS_ROOT, 48000000),
>  };
>
>  /* list of mux clocks supported in all exynos4 soc's */
> -struct samsung_mux_clock exynos4_mux_clks[] __initdata = {
> +static struct samsung_mux_clock exynos4_mux_clks[] __initdata = {
>         MUX_F(mout_apll, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
>                         CLK_SET_RATE_PARENT, 0),
>         MUX(none, "mout_hdmi", mout_hdmi_p, SRC_TV, 0, 1),
> @@ -373,7 +375,7 @@ struct samsung_mux_clock exynos4_mux_clks[] __initdata = {
>  };
>
>  /* list of mux clocks supported in exynos4210 soc */
> -struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
> +static struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
>         MUX(none, "mout_aclk200", sclk_ampll_p4210, SRC_TOP0, 12, 1),
>         MUX(none, "mout_aclk100", sclk_ampll_p4210, SRC_TOP0, 16, 1),
>         MUX(none, "mout_aclk160", sclk_ampll_p4210, SRC_TOP0, 20, 1),
> @@ -424,7 +426,7 @@ struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
>  };
>
>  /* list of mux clocks supported in exynos4x12 soc */
> -struct samsung_mux_clock exynos4x12_mux_clks[] __initdata = {
> +static struct samsung_mux_clock exynos4x12_mux_clks[] __initdata = {
>         MUX(mout_mpll_user_c, "mout_mpll_user_c", mout_mpll_user_p4x12,
>                         SRC_CPU, 24, 1),
>         MUX(none, "mout_aclk266_gps", aclk_p4412, SRC_TOP1, 4, 1),
> @@ -488,7 +490,7 @@ struct samsung_mux_clock exynos4x12_mux_clks[] __initdata = {
>  };
>
>  /* list of divider clocks supported in all exynos4 soc's */
> -struct samsung_div_clock exynos4_div_clks[] __initdata = {
> +static struct samsung_div_clock exynos4_div_clks[] __initdata = {
>         DIV(none, "div_core", "mout_core", DIV_CPU0, 0, 3),
>         DIV(none, "div_core2", "div_core", DIV_CPU0, 28, 3),
>         DIV(none, "div_fimc0", "mout_fimc0", DIV_CAM, 0, 4),
> @@ -551,7 +553,7 @@ struct samsung_div_clock exynos4_div_clks[] __initdata = {
>  };
>
>  /* list of divider clocks supported in exynos4210 soc */
> -struct samsung_div_clock exynos4210_div_clks[] __initdata = {
> +static struct samsung_div_clock exynos4210_div_clks[] __initdata = {
>         DIV(aclk200, "aclk200", "mout_aclk200", DIV_TOP, 0, 3),
>         DIV(none, "div_g2d", "mout_g2d", DIV_IMAGE, 0, 4),
>         DIV(none, "div_fimd1", "mout_fimd1", E4210_DIV_LCD1, 0, 4),
> @@ -562,7 +564,7 @@ struct samsung_div_clock exynos4210_div_clks[] __initdata = {
>  };
>
>  /* list of divider clocks supported in exynos4x12 soc */
> -struct samsung_div_clock exynos4x12_div_clks[] __initdata = {
> +static struct samsung_div_clock exynos4x12_div_clks[] __initdata = {
>         DIV(none, "div_mdnie0", "mout_mdnie0", DIV_LCD0, 4, 4),
>         DIV(none, "div_mdnie_pwm0", "mout_mdnie_pwm0", DIV_LCD0, 8, 4),
>         DIV(none, "div_mdnie_pwm_pre0", "div_mdnie_pwm0", DIV_LCD0, 12, 4),
> @@ -586,7 +588,7 @@ struct samsung_div_clock exynos4x12_div_clks[] __initdata = {
>  };
>
>  /* list of gate clocks supported in all exynos4 soc's */
> -struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
> +static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
>         /*
>          * After all Exynos4 based platforms are migrated to use device tree,
>          * the device name and clock alias names specified below for some
> @@ -778,7 +780,7 @@ struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
>  };
>
>  /* list of gate clocks supported in exynos4210 soc */
> -struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
> +static struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
>         GATE(tvenc, "tvenc", "aclk160", GATE_IP_TV, 2, 0, 0),
>         GATE(g2d, "g2d", "aclk200", E4210_GATE_IP_IMAGE, 0, 0, 0),
>         GATE(rotator, "rotator", "aclk200", E4210_GATE_IP_IMAGE, 1, 0, 0),
> @@ -812,7 +814,7 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
>  };
>
>  /* list of gate clocks supported in exynos4x12 soc */
> -struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
> +static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
>         GATE(audss, "audss", "sclk_epll", E4X12_GATE_IP_MAUDIO, 0, 0, 0),
>         GATE(mdnie0, "mdnie0", "aclk160", GATE_IP_LCD0, 2, 0, 0),
>         GATE(rotator, "rotator", "aclk200", E4X12_GATE_IP_IMAGE, 1, 0, 0),
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin

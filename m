From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: Exynos5250: Add clocks for G3D
Date: Wed, 22 May 2013 00:50:40 +0200
Message-ID: <59532716.tUOcOF6tE1@flatron>
References: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:39985 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522Ab3EUWuo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 18:50:44 -0400
Received: by mail-ee0-f43.google.com with SMTP id d41so769621eek.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 15:50:43 -0700 (PDT)
In-Reply-To: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, arunkk.samsung@gmail.com

Hi Arun,

Please see my comments inline.

On Tuesday 21 of May 2013 18:06:41 Arun Kumar K wrote:
> This patch adds the required clocks for ARM Mali IP
> in Exynos5250.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos5250-clock.txt         |    2 ++
>  drivers/clk/samsung/clk-exynos5250.c                       |   12
> +++++++++++- 2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt index
> 1a05761..5b93637 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> @@ -155,6 +155,8 @@ clock which they consume.
>    dp			342
>    mixer			343
>    hdmi			344
> +  g3d			345
> +  aclk_400_g3d		346
> 
>  Example 1: An example of a clock controller node is listed below.
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c
> b/drivers/clk/samsung/clk-exynos5250.c index 5c97e75..7d87500 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -23,6 +23,7 @@
>  #define DIV_CPU0		0x500
>  #define SRC_CORE1		0x4204
>  #define SRC_TOP0		0x10210
> +#define SRC_TOP1		0x10214
>  #define SRC_TOP2		0x10218
>  #define SRC_GSCL		0x10220
>  #define SRC_DISP1_0		0x1022c
> @@ -55,6 +56,7 @@
>  #define DIV_PERIC5		0x1056c
>  #define GATE_IP_GSCL		0x10920
>  #define GATE_IP_MFC		0x1092c
> +#define GATE_IP_G3D		0x10930
>  #define GATE_IP_GEN		0x10934
>  #define GATE_IP_FSYS		0x10944
>  #define GATE_IP_PERIC		0x10950
> @@ -98,7 +100,7 @@ enum exynos5250_clks {
>  	spi2, i2s1, i2s2, pcm1, pcm2, pwm, spdif, ac97, hsi2c0, hsi2c1,
> hsi2c2, hsi2c3, chipid, sysreg, pmu, cmu_top, cmu_core, cmu_mem, tzpc0,
> tzpc1, tzpc2, tzpc3, tzpc4, tzpc5, tzpc6, tzpc7, tzpc8, tzpc9,
> hdmi_cec, mct, -	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, 
hdmi,
> +	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi, g3d, 
aclk_400_g3d,
> 
>  	nr_clks,
>  };
> @@ -112,6 +114,7 @@ static __initdata unsigned long
> exynos5250_clk_regs[] = { DIV_CPU0,
>  	SRC_CORE1,
>  	SRC_TOP0,
> +	SRC_TOP1,
>  	SRC_TOP2,
>  	SRC_GSCL,
>  	SRC_DISP1_0,
> @@ -164,10 +167,12 @@ PNAME(mout_vpllsrc_p)	= { "fin_pll",
> "sclk_hdmi27m" }; PNAME(mout_vpll_p)	= { "mout_vpllsrc", "fout_vpll" };
>  PNAME(mout_cpll_p)	= { "fin_pll", "fout_cpll" };
>  PNAME(mout_epll_p)	= { "fin_pll", "fout_epll" };
> +PNAME(mout_gpll_p)	= { "fin_pll", "fout_gpll" };
>  PNAME(mout_mpll_user_p)	= { "fin_pll", "sclk_mpll" };
>  PNAME(mout_bpll_user_p)	= { "fin_pll", "sclk_bpll" };
>  PNAME(mout_aclk166_p)	= { "sclk_cpll", "sclk_mpll_user" };
>  PNAME(mout_aclk200_p)	= { "sclk_mpll_user", "sclk_bpll_user" };
> +PNAME(mout_aclk400_p)	= { "aclk_400_g3d_mid", "sclk_gpll" };
>  PNAME(mout_hdmi_p)	= { "div_hdmi_pixel", "sclk_hdmiphy" };
>  PNAME(mout_usb3_p)	= { "sclk_mpll_user", "sclk_cpll" };
>  PNAME(mout_group1_p)	= { "fin_pll", "fin_pll", "sclk_hdmi27m",
> @@ -223,6 +228,9 @@ struct samsung_mux_clock exynos5250_mux_clks[]
> __initdata = { MUX(none, "mout_aclk166", mout_aclk166_p, SRC_TOP0, 8,
> 1),
>  	MUX(none, "mout_aclk333", mout_aclk166_p, SRC_TOP0, 16, 1),
>  	MUX(none, "mout_aclk200", mout_aclk200_p, SRC_TOP0, 12, 1),
> +	MUX(none, "aclk_400_g3d_mid", mout_aclk200_p, SRC_TOP0, 20, 1),
> +	MUX(none, "sclk_gpll", mout_gpll_p, SRC_TOP2, 28, 1),
> +	MUX(none, "mout_aclk400", mout_aclk400_p, SRC_TOP1, 28, 1),
>  	MUX(none, "mout_cam_bayer", mout_group1_p, SRC_GSCL, 12, 4),
>  	MUX(none, "mout_cam0", mout_group1_p, SRC_GSCL, 16, 4),
>  	MUX(none, "mout_cam1", mout_group1_p, SRC_GSCL, 20, 4),
> @@ -262,6 +270,7 @@ struct samsung_div_clock exynos5250_div_clks[]
> __initdata = { DIV(none, "aclk166", "mout_aclk166", DIV_TOP0, 8, 3),
>  	DIV(none, "aclk333", "mout_aclk333", DIV_TOP0, 20, 3),
>  	DIV(none, "aclk200", "mout_aclk200", DIV_TOP0, 12, 3),
> +	DIV(aclk_400_g3d, "aclk_400_g3d", "mout_aclk400", DIV_TOP0, 24, 
3),

Do you need to export this div clock? If it's a parent of a gate clock, 
then you can simply add CLK_SET_RATE_PARENT flag to the gate clock and 
calling set_rate on it will reconfigure the divider.

>  	DIV(none, "div_cam_bayer", "mout_cam_bayer", DIV_GSCL, 12, 4),
>  	DIV(none, "div_cam0", "mout_cam0", DIV_GSCL, 16, 4),
>  	DIV(none, "div_cam1", "mout_cam1", DIV_GSCL, 20, 4),
> @@ -462,6 +471,7 @@ struct samsung_gate_clock exynos5250_gate_clks[]
> __initdata = { GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
>  	GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
>  	GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
> +	GATE(g3d, "g3d", "aclk_400_g3d", GATE_IP_G3D, 0, 0, 0),

This would be then:

	GATE(g3d, "g3d", "aclk_400_g3d", GATE_IP_G3D, 0, 
					CLK_SET_RATE_PARENT, 0),

Best regards,
Tomasz

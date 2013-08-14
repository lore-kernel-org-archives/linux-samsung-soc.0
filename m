From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3] clk: Exynos5250: Add clocks for G3D
Date: Wed, 14 Aug 2013 14:44:41 +0200
Message-ID: <1683305.0BkA2RUk5R@amdc1227>
References: <1376478606-15168-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28441 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932555Ab3HNMot (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 08:44:49 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRI003QXU273W20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 13:44:47 +0100 (BST)
In-reply-to: <1376478606-15168-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, dianders@chromium.org, arunkk.samsung@gmail.com

Hi Arun,

On Wednesday 14 of August 2013 16:40:05 Arun Kumar K wrote:
> This patch adds the required clocks for ARM Mali IP
> in Exynos5250.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Acked-by: Mike Turquette <mturquette@linaro.org>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes from v2
> - Rebased on clk-next
> Changes from v1
> - Removed exporting of parent DIV clock for g3d
>   as per Tomsz Figa's comment.
> ---
>  .../devicetree/bindings/clock/exynos5250-clock.txt |    1 +
>  drivers/clk/samsung/clk-exynos5250.c               |   12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt index
> 24765c1..bb3dd95 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> @@ -159,6 +159,7 @@ clock which they consume.
>    mixer			343
>    hdmi			344
>    g2d			345
> +  g3d			346
> 
> 
>     [Clock Muxes]
> diff --git a/drivers/clk/samsung/clk-exynos5250.c
> b/drivers/clk/samsung/clk-exynos5250.c index a9916a4..892a5ac 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -34,6 +34,7 @@
>  #define VPLL_CON0		0x10140
>  #define GPLL_CON0		0x10150
>  #define SRC_TOP0		0x10210
> +#define SRC_TOP1		0x10214
>  #define SRC_TOP2		0x10218
>  #define SRC_GSCL		0x10220
>  #define SRC_DISP1_0		0x1022c
> @@ -66,6 +67,7 @@
>  #define DIV_PERIC5		0x1056c
>  #define GATE_IP_GSCL		0x10920
>  #define GATE_IP_MFC		0x1092c
> +#define GATE_IP_G3D		0x10930
>  #define GATE_IP_GEN		0x10934
>  #define GATE_IP_FSYS		0x10944
>  #define GATE_IP_PERIC		0x10950
> @@ -120,7 +122,7 @@ enum exynos5250_clks {
>  	spi2, i2s1, i2s2, pcm1, pcm2, pwm, spdif, ac97, hsi2c0, hsi2c1, hsi2c2,
> hsi2c3, chipid, sysreg, pmu, cmu_top, cmu_core, cmu_mem, tzpc0, tzpc1,
> tzpc2, tzpc3, tzpc4, tzpc5, tzpc6, tzpc7, tzpc8, tzpc9, hdmi_cec, mct,
> -	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi, g2d,
> +	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi, g2d, g3d,
> 
>  	/* mux clocks */
>  	mout_hdmi = 1024,
> @@ -137,6 +139,7 @@ static unsigned long exynos5250_clk_regs[] __initdata
> = { DIV_CPU0,
>  	SRC_CORE1,
>  	SRC_TOP0,
> +	SRC_TOP1,
>  	SRC_TOP2,
>  	SRC_GSCL,
>  	SRC_DISP1_0,
> @@ -190,10 +193,12 @@ PNAME(mout_vpllsrc_p)	= { "fin_pll", 
"sclk_hdmi27m"
> }; PNAME(mout_vpll_p)	= { "mout_vpllsrc", "fout_vpll" };
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
> @@ -252,6 +257,9 @@ static struct samsung_mux_clock exynos5250_mux_clks[]
> __initdata = { MUX(none, "mout_aclk166", mout_aclk166_p, SRC_TOP0, 8,
> 1),
>  	MUX(none, "mout_aclk333", mout_aclk166_p, SRC_TOP0, 16, 1),
>  	MUX(none, "mout_aclk200", mout_aclk200_p, SRC_TOP0, 12, 1),
> +	MUX(none, "aclk_400_g3d_mid", mout_aclk200_p, SRC_TOP0, 20, 1),

Name of this clock looks out of line looking at other clocks defined in 
this file. Shouldn't it be something like "mout_aclk400_g3d_mid"?

> +	MUX(none, "sclk_gpll", mout_gpll_p, SRC_TOP2, 28, 1),
> +	MUX(none, "mout_aclk400", mout_aclk400_p, SRC_TOP1, 28, 1),

According to the documentation I have, this clock should be called 
"mout_aclk400_g3d".

>  	MUX(none, "mout_cam_bayer", mout_group1_p, SRC_GSCL, 12, 4),
>  	MUX(none, "mout_cam0", mout_group1_p, SRC_GSCL, 16, 4),
>  	MUX(none, "mout_cam1", mout_group1_p, SRC_GSCL, 20, 4),
> @@ -291,6 +299,7 @@ static struct samsung_div_clock exynos5250_div_clks[]
> __initdata = { DIV(none, "aclk166", "mout_aclk166", DIV_TOP0, 8, 3),
>  	DIV(none, "aclk333", "mout_aclk333", DIV_TOP0, 20, 3),
>  	DIV(none, "aclk200", "mout_aclk200", DIV_TOP0, 12, 3),
> +	DIV(none, "aclk_400_g3d", "mout_aclk400", DIV_TOP0, 24, 3),

Hmm, what about div_aclk400_g3d, since it is a divider?

Best regards,
Tomasz

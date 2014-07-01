From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 1/7] clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER
 clocks
Date: Tue, 01 Jul 2014 10:46:29 +0200
Message-ID: <53B27565.8090703@gmx.net>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com> <1404202211-15788-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:53030 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754237AbaGAIqu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:46:50 -0400
In-Reply-To: <1404202211-15788-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>

Hello Marek,

I think this particular clock setup should already be handled by this patch:
http://www.spinics.net/lists/arm-kernel/msg320013.html

Or am I missing something here?

With best wishes,
Tobias


Marek Szyprowski wrote:
> This patch adds support for exporting mout_hdmi and mout_mixer to device
> tree. Access to those clocks is required to correctly setup HDMI module
> on Exynos 4210 and 4x12 SoCs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> CC: Mike Turquette <mturquette@linaro.org>
> CC: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c   | 4 ++--
>  include/dt-bindings/clock/exynos4.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 4f150c9dd38c..a30a779869eb 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -440,7 +440,7 @@ static struct samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata =
>  static struct samsung_mux_clock exynos4_mux_clks[] __initdata = {
>  	MUX_FA(CLK_MOUT_APLL, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
>  			CLK_SET_RATE_PARENT, 0, "mout_apll"),
> -	MUX(0, "mout_hdmi", mout_hdmi_p, SRC_TV, 0, 1),
> +	MUX(CLK_MOUT_HDMI, "mout_hdmi", mout_hdmi_p, SRC_TV, 0, 1),
>  	MUX(0, "mout_mfc1", sclk_evpll_p, SRC_MFC, 4, 1),
>  	MUX(0, "mout_mfc", mout_mfc_p, SRC_MFC, 8, 1),
>  	MUX_F(CLK_MOUT_G3D1, "mout_g3d1", sclk_evpll_p, SRC_G3D, 4, 1,
> @@ -463,7 +463,7 @@ static struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
>  	MUX(0, "mout_aclk100", sclk_ampll_p4210, SRC_TOP0, 16, 1),
>  	MUX(0, "mout_aclk160", sclk_ampll_p4210, SRC_TOP0, 20, 1),
>  	MUX(0, "mout_aclk133", sclk_ampll_p4210, SRC_TOP0, 24, 1),
> -	MUX(0, "mout_mixer", mout_mixer_p4210, SRC_TV, 4, 1),
> +	MUX(CLK_MOUT_MIXER, "mout_mixer", mout_mixer_p4210, SRC_TV, 4, 1),
>  	MUX(0, "mout_dac", mout_dac_p4210, SRC_TV, 8, 1),
>  	MUX(0, "mout_g2d0", sclk_ampll_p4210, E4210_SRC_IMAGE, 0, 1),
>  	MUX(0, "mout_g2d1", sclk_evpll_p, E4210_SRC_IMAGE, 4, 1),
> diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
> index 1106ca540a96..5bfb3509ee3c 100644
> --- a/include/dt-bindings/clock/exynos4.h
> +++ b/include/dt-bindings/clock/exynos4.h
> @@ -229,6 +229,8 @@
>  #define CLK_MOUT_G3D1		393
>  #define CLK_MOUT_G3D		394
>  #define CLK_ACLK400_MCUISP	395 /* Exynos4x12 only */
> +#define CLK_MOUT_HDMI		396
> +#define CLK_MOUT_MIXER		397
>  
>  /* div clocks */
>  #define CLK_DIV_ISP0		450 /* Exynos4x12 only */
> 

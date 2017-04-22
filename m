From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 2/7] clk: samsung: Add definitions of some audio
 related clocks
Date: Sat, 22 Apr 2017 17:27:05 +0200
Message-ID: <20170422152705.mvnycub4unjlseeq@kozik-lap>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172023epcas1p3dd7397c8c61daa548ffac88a76e53113@epcas1p3.samsung.com>
 <1492795191-31298-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33934 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425284AbdDVP1J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Apr 2017 11:27:09 -0400
Content-Disposition: inline
In-Reply-To: <1492795191-31298-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, javier@osg.samsung.com, jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com

On Fri, Apr 21, 2017 at 07:19:46PM +0200, Sylwester Nawrocki wrote:
> This patch adds missing definitions of mux clocks required for using
> EPLL as the audio subsystem root clock on exynos5420/exynos5422 SoCs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c   | 13 ++++++++-----
>  include/dt-bindings/clock/exynos5420.h |  3 +++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index cdc092a..87c711a 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -477,8 +477,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
>  					"mout_sclk_mpll", "ff_dout_spll2",
>  					"mout_sclk_spll", "mout_sclk_epll"};
>  PNAME(mout_mau_epll_clk_5800_p)	= { "mout_sclk_epll", "mout_sclk_dpll",
> -					"mout_sclk_mpll",
> -					"ff_dout_spll2" };
> +					"mout_sclk_mpll", "ff_dout_spll2" };

Please split up cleaning from adding new features/clocks. While in
cleaning mode, you might also consider fixing some checkpatch errors and
warnings. There are few (without --strict).

>  PNAME(mout_group8_5800_p)	= { "dout_aclk432_scaler", "dout_sclk_sw" };
>  PNAME(mout_group9_5800_p)	= { "dout_osc_div", "mout_sw_aclk432_scaler" };
>  PNAME(mout_group10_5800_p)	= { "dout_aclk432_cam", "dout_sclk_sw" };
> @@ -487,6 +486,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
>  PNAME(mout_group13_5800_p)	= { "dout_osc_div", "mout_sw_aclkfl1_550_cam" };
>  PNAME(mout_group14_5800_p)	= { "dout_aclk550_cam", "dout_sclk_sw" };
>  PNAME(mout_group15_5800_p)	= { "dout_osc_div", "mout_sw_aclk550_cam" };
> +PNAME(mout_group16_5800_p)	= { "dout_osc_div", "mout_mau_epll_clk" };
>  
>  /* fixed rate clocks generated outside the soc */
>  static struct samsung_fixed_rate_clock
> @@ -536,8 +536,8 @@ static void __init exynos5420_clk_sleep_init(void) {}
>  
>  	MUX(CLK_MOUT_MX_MSPLL_CCORE, "mout_mx_mspll_ccore",
>  			mout_mx_mspll_ccore_p, SRC_TOP7, 16, 2),
> -	MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p, SRC_TOP7,
> -			20, 2),
> +	MUX(CLK_MOUT_MAU_EPLL, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p,
> +							SRC_TOP7, 20, 2),

How about not changing the indention level of new line? On the other
hand, if you want to change it so maybe align it with opening
parenthesis?

(same in other places below)

Best regards,
Krzysztof

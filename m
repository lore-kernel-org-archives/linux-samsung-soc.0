From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v1 02/50] clk: samsung: add IDs for Exynos5420 NoC
 clocks
Date: Tue, 16 Jul 2019 18:26:06 +0900
Message-ID: <b8503015-732f-7ac5-1b25-50e943d27e55@samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124435eucas1p2099cd7670a3d85d9b11eb0ff86041a2a@eucas1p2.samsung.com>
        <20190715124417.4787-3-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-3-l.luba@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

You don't need to make the separate patches according to
the type of clock just in order to add the ID by handling them
from devicetree.

Please merge following patches to one patch 
- patch2, patch4~patch7, patch9, patch11, patch12, patch14, patch17
and separate from patch13, patch15, patch16 for adding the ID


On 19. 7. 15. 오후 9:43, Lukasz Luba wrote:
> The patch adds NoC WCORE clock IDs needed used for changing parent of the
> main NoC clock from the DT device.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 16ad498e3f3f..d353870e7fda 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -463,7 +463,8 @@ static const struct samsung_fixed_factor_clock
>  static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
>  	MUX(0, "mout_aclk400_isp", mout_group3_5800_p, SRC_TOP0, 0, 3),
>  	MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
> -	MUX(0, "mout_aclk400_wcore", mout_group2_5800_p, SRC_TOP0, 16, 3),
> +	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group2_5800_p,
> +			SRC_TOP0, 16, 3),
>  	MUX(0, "mout_aclk100_noc", mout_group1_5800_p, SRC_TOP0, 20, 2),
>  
>  	MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
> @@ -548,7 +549,8 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
>  
>  	MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
>  	MUX(0, "mout_aclk400_mscl", mout_group1_p, SRC_TOP0, 4, 2),
> -	MUX(0, "mout_aclk400_wcore", mout_group1_p, SRC_TOP0, 16, 2),
> +	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group1_p,
> +			SRC_TOP0, 16, 2),
>  	MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
>  
>  	MUX(0, "mout_aclk333_432_gscl", mout_group4_p, SRC_TOP1, 0, 2),
> @@ -674,8 +676,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
>  			SRC_TOP10, 8, 1),
>  	MUX(0, "mout_sw_aclk200_fsys2", mout_sw_aclk200_fsys2_p,
>  			SRC_TOP10, 12, 1),
> -	MUX(0, "mout_sw_aclk400_wcore", mout_sw_aclk400_wcore_p,
> -			SRC_TOP10, 16, 1),
> +	MUX(CLK_MOUT_SW_ACLK400_WCORE, "mout_sw_aclk400_wcore",
> +			mout_sw_aclk400_wcore_p, SRC_TOP10, 16, 1),
>  	MUX(0, "mout_sw_aclk100_noc", mout_sw_aclk100_noc_p,
>  			SRC_TOP10, 20, 1),
>  	MUX(0, "mout_sw_pclk200_fsys", mout_sw_pclk200_fsys_p,
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

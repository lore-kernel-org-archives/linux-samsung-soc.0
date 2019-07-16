From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v1 10/50] clk: samsung: change ACLK100_NOC clocks
 definitions Exynos5x
Date: Tue, 16 Jul 2019 19:01:13 +0900
Message-ID: <63cb24f8-5666-3fb4-0c98-ecc54cd4266f@samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124441eucas1p29f1205c20e9bea5b33f8f0b5747b1102@eucas1p2.samsung.com>
        <20190715124417.4787-11-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-11-l.luba@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

I checked the range of ratio as following: Looks good to me.
But, you better to make it to fix the ratio range without adding ID.
Please merge the code related to adding IDs into one patch.
- Exynos5422 TRM ACLK_100_NOC_RATIO [23:20]
- Exynos5420 TRM ACLK_100_NOC_RATIO [22:20]

On 19. 7. 15. 오후 9:43, Lukasz Luba wrote:
> The ACLK100_NOC has different topology in Exynos5420 and 5422/5800.  In
> Exynos5420 this clock divider has 3 bits while in 5422/5800 has 4 bits.
> The patch adds needed dividers in the exynos5800_div_clks, updates
> exynos5x_div_clks and exynos5420_div_clks properly. It also adds IDs to
> manage clocks from DT.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 6164d0ca75e0..c13f34d3d9a1 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -471,7 +471,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
>  			SRC_TOP0, 4, 3),
>  	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group2_5800_p,
>  			SRC_TOP0, 16, 3),
> -	MUX(0, "mout_aclk100_noc", mout_group1_5800_p, SRC_TOP0, 20, 2),
> +	MUX(CLK_MOUT_ACLK100_NOC, "mout_aclk100_noc", mout_group1_5800_p,
> +			SRC_TOP0, 20, 2),

Please squash this code to the patch which add the IDs.
Actually, it is not related to fix the rate range of clock.

>  
>  	MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
>  	MUX(0, "mout_aclk333_432_isp", mout_group6_5800_p, SRC_TOP1, 4, 2),
> @@ -534,6 +535,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
>  static const struct samsung_div_clock exynos5800_div_clks[] __initconst = {
>  	DIV(CLK_DOUT_ACLK400_WCORE, "dout_aclk400_wcore",
>  			"mout_aclk400_wcore", DIV_TOP0, 16, 3),
> +	DIV(CLK_DOUT_ACLK100_NOC, "dout_aclk100_noc", "mout_aclk100_noc",
> +				DIV_TOP0, 20, 4),

>  	DIV(CLK_DOUT_ACLK266_ISP, "dout_aclk266_isp", "mout_aclk266_isp",
>  				DIV_TOP8, 12, 3),
>  	DIV(0, "dout_aclk550_cam", "mout_aclk550_cam",
> @@ -569,7 +572,8 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
>  			SRC_TOP0, 4, 2),
>  	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group1_p,
>  			SRC_TOP0, 16, 2),
> -	MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
> +	MUX(CLK_MOUT_ACLK100_NOC, "mout_aclk100_noc", mout_group1_p,
> +			SRC_TOP0, 20, 2),

ditto.
Please squash this code to the patch which add the IDs.
Actually, it is not related to fix the rate range of clock.

>  
>  	MUX(0, "mout_aclk333_432_gscl", mout_group4_p, SRC_TOP1, 0, 2),
>  	MUX(0, "mout_aclk333_432_isp", mout_group4_p,
> @@ -600,6 +604,8 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
>  static const struct samsung_div_clock exynos5420_div_clks[] __initconst = {
>  	DIV(CLK_DOUT_ACLK400_WCORE, "dout_aclk400_wcore",
>  			"mout_aclk400_wcore", DIV_TOP0, 16, 3),
> +	DIV(CLK_DOUT_ACLK100_NOC, "dout_aclk100_noc", "mout_aclk100_noc",
> +			DIV_TOP0, 20, 3),
>  };
>  
>  static const struct samsung_gate_clock exynos5420_gate_clks[] __initconst = {
> @@ -798,8 +804,6 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
>  			DIV_TOP0, 8, 3),
>  	DIV(CLK_DOUT_ACLK200_FSYS2, "dout_aclk200_fsys2", "mout_aclk200_fsys2",
>  			DIV_TOP0, 12, 3),
> -	DIV(CLK_DOUT_ACLK100_NOC, "dout_aclk100_noc", "mout_aclk100_noc",
> -			DIV_TOP0, 20, 3),
>  	DIV(CLK_DOUT_PCLK200_FSYS, "dout_pclk200_fsys", "mout_pclk200_fsys",
>  			DIV_TOP0, 24, 3),
>  	DIV(CLK_DOUT_ACLK200_FSYS, "dout_aclk200_fsys", "mout_aclk200_fsys",
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

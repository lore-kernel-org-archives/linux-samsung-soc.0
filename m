From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/11] clk: samsung: exynos7: Change the CMU_TOPC block
 clock name
Date: Mon, 07 Sep 2015 14:33:43 +0900
Message-ID: <55ED21B7.6080608@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
 <1441366637-28001-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52764 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257AbbIGFdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 01:33:52 -0400
In-reply-to: <1441366637-28001-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

On 04.09.2015 20:37, Alim Akhtar wrote:
> Corrects the CMU_TOPC block clock name as per user manual.
> This also adds few of the missing gate clocks of topc block.
> This does not change any functionalies.

s/functionalies/functionalities/

Yes, it does change. After adding new gates without users, kernel will
disable them. Previously these gates remained in default reset state
(probably "pass") or in state set by bootloader (also "pass").

Please update the changelog and of course test the patchset for any
issues in different components depending on these clocks. Depending
directly or indirectly.

Split the patch into:
1. clean up/rename,
2. addition of new mux/gate clock.

Currently it is more difficult to review the patch.

Best regards,
Krzysztof


> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c       |   90 +++++++++++++++++++------------
>  include/dt-bindings/clock/exynos7-clk.h |   11 +++-
>  2 files changed, 67 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index 380608b..2394bde 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -35,38 +35,39 @@
>  #define DIV_TOPC1		0x0604
>  #define DIV_TOPC3		0x060C
>  #define ENABLE_ACLK_TOPC1	0x0804
> +#define ENABLE_SCLK_TOPC1	0x0A04
>  
>  static struct samsung_fixed_factor_clock topc_fixed_factor_clks[] __initdata = {
> -	FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_bus0_pll_ctrl", 1, 2, 0),
> +	FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_topc_bus0_pll", 1, 2, 0),
>  	FFACTOR(0, "ffac_topc_bus0_pll_div4",
>  		"ffac_topc_bus0_pll_div2", 1, 2, 0),
> -	FFACTOR(0, "ffac_topc_bus1_pll_div2", "mout_bus1_pll_ctrl", 1, 2, 0),
> -	FFACTOR(0, "ffac_topc_cc_pll_div2", "mout_cc_pll_ctrl", 1, 2, 0),
> -	FFACTOR(0, "ffac_topc_mfc_pll_div2", "mout_mfc_pll_ctrl", 1, 2, 0),
> +	FFACTOR(0, "ffac_topc_bus1_pll_div2", "mout_topc_bus1_pll", 1, 2, 0),
> +	FFACTOR(0, "ffac_topc_cc_pll_div2", "mout_topc_cc_pll", 1, 2, 0),
> +	FFACTOR(0, "ffac_topc_mfc_pll_div2", "mout_topc_mfc_pll", 1, 2, 0),
>  };
>  
>  /* List of parent clocks for Muxes in CMU_TOPC */
> -PNAME(mout_aud_pll_ctrl_p)	= { "fin_pll", "fout_aud_pll" };
> -PNAME(mout_bus0_pll_ctrl_p)	= { "fin_pll", "fout_bus0_pll" };
> -PNAME(mout_bus1_pll_ctrl_p)	= { "fin_pll", "fout_bus1_pll" };
> -PNAME(mout_cc_pll_ctrl_p)	= { "fin_pll", "fout_cc_pll" };
> -PNAME(mout_mfc_pll_ctrl_p)	= { "fin_pll", "fout_mfc_pll" };
> +PNAME(mout_topc_aud_pll_ctrl_p)	= { "fin_pll", "fout_aud_pll" };
> +PNAME(mout_topc_bus0_pll_ctrl_p)	= { "fin_pll", "fout_bus0_pll" };
> +PNAME(mout_topc_bus1_pll_ctrl_p)	= { "fin_pll", "fout_bus1_pll" };
> +PNAME(mout_topc_cc_pll_ctrl_p)	= { "fin_pll", "fout_cc_pll" };
> +PNAME(mout_topc_mfc_pll_ctrl_p)	= { "fin_pll", "fout_mfc_pll" };
>  
> -PNAME(mout_topc_group2) = { "mout_sclk_bus0_pll_cmuc",
> -	"mout_sclk_bus1_pll_cmuc", "mout_sclk_cc_pll_cmuc",
> -	"mout_sclk_mfc_pll_cmuc" };
> +PNAME(mout_topc_group2) = { "mout_topc_bus0_pll_half",
> +	"mout_topc_bus1_pll_half", "mout_topc_cc_pll_half",
> +	"mout_topc_mfc_pll_half" };
>  
> -PNAME(mout_sclk_bus0_pll_cmuc_p) = { "mout_bus0_pll_ctrl",
> +PNAME(mout_topc_bus0_pll_half_p) = { "mout_topc_bus0_pll",
>  	"ffac_topc_bus0_pll_div2", "ffac_topc_bus0_pll_div4"};
> -PNAME(mout_sclk_bus1_pll_cmuc_p) = { "mout_bus1_pll_ctrl",
> +PNAME(mout_topc_bus1_pll_half_p) = { "mout_topc_bus1_pll",
>  	"ffac_topc_bus1_pll_div2"};
> -PNAME(mout_sclk_cc_pll_cmuc_p) = { "mout_cc_pll_ctrl",
> +PNAME(mout_topc_cc_pll_half_p) = { "mout_topc_cc_pll",
>  	"ffac_topc_cc_pll_div2"};
> -PNAME(mout_sclk_mfc_pll_cmuc_p) = { "mout_mfc_pll_ctrl",
> +PNAME(mout_topc_mfc_pll_half_p) = { "mout_topc_mfc_pll",
>  	"ffac_topc_mfc_pll_div2"};
>  
>  
> -PNAME(mout_sclk_bus0_pll_out_p) = {"mout_bus0_pll_ctrl",
> +PNAME(mout_topc_bus0_pll_out_p) = {"mout_topc_bus0_pll",
>  	"ffac_topc_bus0_pll_div2"};
>  
>  static unsigned long topc_clk_regs[] __initdata = {
> @@ -90,22 +91,26 @@ static unsigned long topc_clk_regs[] __initdata = {
>  };
>  
>  static struct samsung_mux_clock topc_mux_clks[] __initdata = {
> -	MUX(0, "mout_bus0_pll_ctrl", mout_bus0_pll_ctrl_p, MUX_SEL_TOPC0, 0, 1),
> -	MUX(0, "mout_bus1_pll_ctrl", mout_bus1_pll_ctrl_p, MUX_SEL_TOPC0, 4, 1),
> -	MUX(0, "mout_cc_pll_ctrl", mout_cc_pll_ctrl_p, MUX_SEL_TOPC0, 8, 1),
> -	MUX(0, "mout_mfc_pll_ctrl", mout_mfc_pll_ctrl_p, MUX_SEL_TOPC0, 12, 1),
> -
> -	MUX(0, "mout_sclk_bus0_pll_cmuc", mout_sclk_bus0_pll_cmuc_p,
> +	MUX(0, "mout_topc_bus0_pll", mout_topc_bus0_pll_ctrl_p,
> +		MUX_SEL_TOPC0, 0, 1),
> +	MUX(0, "mout_topc_bus1_pll", mout_topc_bus1_pll_ctrl_p,
> +		MUX_SEL_TOPC0, 4, 1),
> +	MUX(0, "mout_topc_cc_pll", mout_topc_cc_pll_ctrl_p,
> +		MUX_SEL_TOPC0, 8, 1),
> +	MUX(0, "mout_topc_mfc_pll", mout_topc_mfc_pll_ctrl_p,
> +		MUX_SEL_TOPC0, 12, 1),
> +	MUX(0, "mout_topc_bus0_pll_half", mout_topc_bus0_pll_half_p,
>  		MUX_SEL_TOPC0, 16, 2),
> -	MUX(0, "mout_sclk_bus1_pll_cmuc", mout_sclk_bus1_pll_cmuc_p,
> +	MUX(0, "mout_topc_bus1_pll_half", mout_topc_bus1_pll_half_p,
>  		MUX_SEL_TOPC0, 20, 1),
> -	MUX(0, "mout_sclk_cc_pll_cmuc", mout_sclk_cc_pll_cmuc_p,
> +	MUX(0, "mout_topc_cc_pll_half", mout_topc_cc_pll_half_p,
>  		MUX_SEL_TOPC0, 24, 1),
> -	MUX(0, "mout_sclk_mfc_pll_cmuc", mout_sclk_mfc_pll_cmuc_p,
> +	MUX(0, "mout_topc_mfc_pll_half", mout_topc_mfc_pll_half_p,
>  		MUX_SEL_TOPC0, 28, 1),
>  
> -	MUX(0, "mout_aud_pll_ctrl", mout_aud_pll_ctrl_p, MUX_SEL_TOPC1, 0, 1),
> -	MUX(0, "mout_sclk_bus0_pll_out", mout_sclk_bus0_pll_out_p,
> +	MUX(0, "mout_topc_aud_pll", mout_topc_aud_pll_ctrl_p,
> +		MUX_SEL_TOPC1, 0, 1),
> +	MUX(0, "mout_topc_bus0_pll_out", mout_topc_bus0_pll_out_p,
>  		MUX_SEL_TOPC1, 16, 1),
>  
>  	MUX(0, "mout_aclk_ccore_133", mout_topc_group2,	MUX_SEL_TOPC2, 4, 2),
> @@ -123,15 +128,15 @@ static struct samsung_div_clock topc_div_clks[] __initdata = {
>  	DIV(DOUT_ACLK_PERIS, "dout_aclk_peris_66", "mout_aclk_peris_66",
>  		DIV_TOPC1, 24, 4),
>  
> -	DIV(DOUT_SCLK_BUS0_PLL, "dout_sclk_bus0_pll", "mout_sclk_bus0_pll_out",
> +	DIV(DOUT_SCLK_BUS0_PLL, "dout_sclk_bus0_pll", "mout_topc_bus0_pll_out",
>  		DIV_TOPC3, 0, 4),
> -	DIV(DOUT_SCLK_BUS1_PLL, "dout_sclk_bus1_pll", "mout_bus1_pll_ctrl",
> +	DIV(DOUT_SCLK_BUS1_PLL, "dout_sclk_bus1_pll", "mout_topc_bus1_pll",
>  		DIV_TOPC3, 8, 4),
> -	DIV(DOUT_SCLK_CC_PLL, "dout_sclk_cc_pll", "mout_cc_pll_ctrl",
> +	DIV(DOUT_SCLK_CC_PLL, "dout_sclk_cc_pll", "mout_topc_cc_pll",
>  		DIV_TOPC3, 12, 4),
> -	DIV(DOUT_SCLK_MFC_PLL, "dout_sclk_mfc_pll", "mout_mfc_pll_ctrl",
> +	DIV(DOUT_SCLK_MFC_PLL, "dout_sclk_mfc_pll", "mout_topc_mfc_pll",
>  		DIV_TOPC3, 16, 4),
> -	DIV(DOUT_SCLK_AUD_PLL, "dout_sclk_aud_pll", "mout_aud_pll_ctrl",
> +	DIV(DOUT_SCLK_AUD_PLL, "dout_sclk_aud_pll", "mout_topc_aud_pll",
>  		DIV_TOPC3, 28, 4),
>  };
>  
> @@ -143,6 +148,25 @@ static struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initdata = {
>  static struct samsung_gate_clock topc_gate_clks[] __initdata = {
>  	GATE(ACLK_MSCL_532, "aclk_mscl_532", "dout_aclk_mscl_532",
>  		ENABLE_ACLK_TOPC1, 20, 0, 0),
> +
> +	GATE(SCLK_AUD_PLL, "sclk_aud_pll", "dout_sclk_aud_pll",
> +		ENABLE_SCLK_TOPC1, 20, 0, 0),
> +	GATE(SCLK_MFC_PLL_B, "sclk_mfc_pll_b", "dout_sclk_mfc_pll",
> +		ENABLE_SCLK_TOPC1, 17, 0, 0),
> +	GATE(SCLK_MFC_PLL_A, "sclk_mfc_pll_a", "dout_sclk_mfc_pll",
> +		ENABLE_SCLK_TOPC1, 16, 0, 0),
> +	GATE(SCLK_BUS1_PLL_B, "sclk_bus1_pll_b", "dout_sclk_bus1_pll",
> +		ENABLE_SCLK_TOPC1, 13, 0, 0),
> +	GATE(SCLK_BUS1_PLL_A, "sclk_bus1_pll_a", "dout_sclk_bus1_pll",
> +		ENABLE_SCLK_TOPC1, 12, 0, 0),
> +	GATE(SCLK_BUS0_PLL_B, "sclk_bus0_pll_b", "dout_sclk_bus0_pll",
> +		ENABLE_SCLK_TOPC1, 5, 0, 0),
> +	GATE(SCLK_BUS0_PLL_A, "sclk_bus0_pll_a", "dout_sclk_bus0_pll",
> +		ENABLE_SCLK_TOPC1, 4, 0, 0),
> +	GATE(SCLK_CC_PLL_B, "sclk_cc_pll_b", "dout_sclk_cc_pll",
> +		ENABLE_SCLK_TOPC1, 1, 0, 0),
> +	GATE(SCLK_CC_PLL_A, "sclk_cc_pll_a", "dout_sclk_cc_pll",
> +		ENABLE_SCLK_TOPC1, 0, 0, 0),
>  };
>  
>  static struct samsung_pll_clock topc_pll_clks[] __initdata = {
> diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
> index e33c75a..b63eba6 100644
> --- a/include/dt-bindings/clock/exynos7-clk.h
> +++ b/include/dt-bindings/clock/exynos7-clk.h
> @@ -21,7 +21,16 @@
>  #define ACLK_MSCL_532			8
>  #define DOUT_SCLK_AUD_PLL		9
>  #define FOUT_AUD_PLL			10
> -#define TOPC_NR_CLK			11
> +#define SCLK_AUD_PLL			11
> +#define SCLK_MFC_PLL_B			12
> +#define SCLK_MFC_PLL_A			13
> +#define SCLK_BUS1_PLL_B			14
> +#define SCLK_BUS1_PLL_A			15
> +#define SCLK_BUS0_PLL_B			16
> +#define SCLK_BUS0_PLL_A			17
> +#define SCLK_CC_PLL_B			18
> +#define SCLK_CC_PLL_A			19
> +#define TOPC_NR_CLK			20
>  
>  /* TOP0 */
>  #define DOUT_ACLK_PERIC1		1
> 

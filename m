From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 08/13] clk: samsung: exynos5433: Add clocks for CMU_DISP
 domain
Date: Tue, 03 Feb 2015 13:17:48 +0100
Message-ID: <54D0BC6C.9020008@samsung.com>
References: <1422887047-30911-1-git-send-email-cw00.choi@samsung.com>
 <1422887047-30911-9-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35982 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755421AbbBCMRy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 07:17:54 -0500
In-reply-to: <1422887047-30911-9-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hi Chanwoo,

On 02/02/15 15:24, Chanwoo Choi wrote:
> This patch adds the the mux/divider/gate clocks for CMU_DISP domain which
> includes the clocks of Display IPs (DECON/HDMI/DSIM/MIXER). The CMU_DISP clocks
> is used to need the source clock of CMU_MIF domain so, the CMU_MIF's clocks
> related to CMU_DISP should be always on state.

Are you sure we need to add anything to CMU_MIF in this patch ?

> Also, CMU_DISP must need the source clock of 'sclk_hdmi_spdif_disp'
> from CMU_TOP domain. This patch adds the clocks of CMU_TOP related to HDMI.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 437 +++++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos5433.h | 114 ++++++++-
>  2 files changed, 550 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 3d6164e..cf3f0ac 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -245,6 +245,8 @@ PNAME(mout_sclk_audio1_p)	= { "ioclk_audiocdclk1", "oscclk",
>  PNAME(mout_sclk_audio0_p)	= { "ioclk_audiocdclk0", "oscclk",
>  				    "mout_aud_pll_user_t",};
>  
> +PNAME(mout_sclk_hdmi_spdif_p)	= { "sclk_audio1", "ioclk_spdif_extclk", };
> +
>  static struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initdata = {
>  	FFACTOR(0, "oscclk_efuse_common", "oscclk", 1, 1, 0),
>  };
> @@ -395,6 +397,10 @@ static struct samsung_mux_clock top_mux_clks[] __initdata = {
>  			MUX_SEL_TOP_PERIC1, 4, 2),
>  	MUX(CLK_MOUT_SCLK_AUDIO0, "mout_sclk_audio0", mout_sclk_audio0_p,
>  			MUX_SEL_TOP_PERIC1, 0, 2),
> +
> +	/* MUX_SEL_TOP_DISP */
> +	MUX(CLK_MOUT_SCLK_HDMI_SPDIF, "mout_sclk_hdmi_spdif",
> +			mout_sclk_hdmi_spdif_p, MUX_SEL_TOP_DISP, 0, 1),
>  };
>  
>  static struct samsung_div_clock top_div_clks[] __initdata = {
> @@ -1360,6 +1366,11 @@ static struct samsung_gate_clock mif_gate_clks[] __initdata = {
>  			ENABLE_SCLK_MIF, 1, CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_SCLK_BUS_PLL_ATLAS, "sclk_bus_pll_atlas", "sclk_bus_pll",
>  			ENABLE_SCLK_MIF, 0, CLK_IGNORE_UNUSED, 0),
> +
> +	/* ENABLE_SCLK_TOP_DISP */
> +	GATE(CLK_SCLK_HDMI_SPDIF_DISP, "sclk_hdmi_spdif_disp",
> +			"mout_sclk_hdmi_spdif", ENABLE_SCLK_TOP_DISP, 0,
> +			CLK_IGNORE_UNUSED, 0),

I think this clock should be added to top_gate_clks[] table instead, i.e.
it seems to belong to CMU_TOP, not CMU_MIF. Can you double check it ?

If you confirm this I will add following change when applying, no need
to resend again:

----8<-------
diff --git a/drivers/clk/samsung/clk-exynos5433.c
b/drivers/clk/samsung/clk-exynos5433.c
index cf3f0ac..edf9795 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -556,6 +556,11 @@ static struct samsung_gate_clock top_gate_clks[]
__initdata = {
                        MUX_ENABLE_TOP_PERIC1, 4, 0, 0),
        GATE(CLK_SCLK_AUDIO0, "sclk_audio0", "div_sclk_audio0",
                        MUX_ENABLE_TOP_PERIC1, 0, 0, 0),
+
+       /* ENABLE_SCLK_TOP_DISP */
+       GATE(CLK_SCLK_HDMI_SPDIF_DISP, "sclk_hdmi_spdif_disp",
+                       "mout_sclk_hdmi_spdif", ENABLE_SCLK_TOP_DISP, 0,
+                       CLK_IGNORE_UNUSED, 0),
 };

 /*
@@ -1366,11 +1371,6 @@ static struct samsung_gate_clock mif_gate_clks[]
__initdata = {
                        ENABLE_SCLK_MIF, 1, CLK_IGNORE_UNUSED, 0),
        GATE(CLK_SCLK_BUS_PLL_ATLAS, "sclk_bus_pll_atlas", "sclk_bus_pll",
                        ENABLE_SCLK_MIF, 0, CLK_IGNORE_UNUSED, 0),
-
-       /* ENABLE_SCLK_TOP_DISP */
-       GATE(CLK_SCLK_HDMI_SPDIF_DISP, "sclk_hdmi_spdif_disp",
-                       "mout_sclk_hdmi_spdif", ENABLE_SCLK_TOP_DISP, 0,
-                       CLK_IGNORE_UNUSED, 0),
 };
----8<-------

--
Thanks,
Sylwester

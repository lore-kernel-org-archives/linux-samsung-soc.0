From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/9] clk: samsung: Remove clkdev alias support in Exynos4
 clk driver
Date: Tue, 03 Oct 2017 12:00:09 +0200
Message-ID: <20171003100016.32029-3-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100029eucas1p1e141119212369955ea3017b6aee183dc@eucas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

All Exynos4 boards have been fully converted to device-tree and use generic
dt-based CPUfreq driver, so there is no need to create any clkdev aliases
for the clocks. Drop all the code related to aliases handling.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 47 +++++++++------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 9a51ce9a658f..3fbfd9ed82b7 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -535,9 +535,8 @@ static const struct samsung_fixed_factor_clock exynos4x12_fixed_factor_clks[] __
 
 /* list of mux clocks supported in all exynos4 soc's */
 static const struct samsung_mux_clock exynos4_mux_clks[] __initconst = {
-	MUX_FA(CLK_MOUT_APLL, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
-			CLK_SET_RATE_PARENT | CLK_RECALC_NEW_RATES, 0,
-			"mout_apll"),
+	MUX_F(CLK_MOUT_APLL, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
+			CLK_SET_RATE_PARENT | CLK_RECALC_NEW_RATES, 0),
 	MUX(CLK_MOUT_HDMI, "mout_hdmi", mout_hdmi_p, SRC_TV, 0, 1),
 	MUX(0, "mout_mfc1", sclk_evpll_p, SRC_MFC, 4, 1),
 	MUX(0, "mout_mfc", mout_mfc_p, SRC_MFC, 8, 1),
@@ -838,11 +837,6 @@ static const struct samsung_div_clock exynos4x12_div_clks[] __initconst = {
 
 /* list of gate clocks supported in all exynos4 soc's */
 static const struct samsung_gate_clock exynos4_gate_clks[] __initconst = {
-	/*
-	 * After all Exynos4 based platforms are migrated to use device tree,
-	 * the device name and clock alias names specified below for some
-	 * of the clocks can be removed.
-	 */
 	GATE(CLK_PPMULEFT, "ppmuleft", "aclk200", GATE_IP_LEFTBUS, 1, 0, 0),
 	GATE(CLK_PPMURIGHT, "ppmuright", "aclk200", GATE_IP_RIGHTBUS, 1, 0, 0),
 	GATE(CLK_SCLK_HDMI, "sclk_hdmi", "mout_hdmi", SRC_MASK_TV, 0, 0, 0),
@@ -1190,20 +1184,6 @@ static const struct samsung_gate_clock exynos4x12_gate_clks[] __initconst = {
 		0),
 };
 
-static const struct samsung_clock_alias exynos4_aliases[] __initconst = {
-	ALIAS(CLK_MOUT_CORE, NULL, "moutcore"),
-	ALIAS(CLK_ARM_CLK, NULL, "armclk"),
-	ALIAS(CLK_SCLK_APLL, NULL, "mout_apll"),
-};
-
-static const struct samsung_clock_alias exynos4210_aliases[] __initconst = {
-	ALIAS(CLK_SCLK_MPLL, NULL, "mout_mpll"),
-};
-
-static const struct samsung_clock_alias exynos4x12_aliases[] __initconst = {
-	ALIAS(CLK_MOUT_MPLL_USER_C, NULL, "mout_mpll"),
-};
-
 /*
  * The parent of the fin_pll clock is selected by the XOM[0] bit. This bit
  * resides in chipid register space, outside of the clock controller memory
@@ -1340,14 +1320,14 @@ static const struct samsung_pll_rate_table exynos4x12_vpll_rates[] __initconst =
 };
 
 static struct samsung_pll_clock exynos4210_plls[nr_plls] __initdata = {
-	[apll] = PLL_A(pll_4508, CLK_FOUT_APLL, "fout_apll", "fin_pll",
-		APLL_LOCK, APLL_CON0, "fout_apll", NULL),
-	[mpll] = PLL_A(pll_4508, CLK_FOUT_MPLL, "fout_mpll", "fin_pll",
-		E4210_MPLL_LOCK, E4210_MPLL_CON0, "fout_mpll", NULL),
-	[epll] = PLL_A(pll_4600, CLK_FOUT_EPLL, "fout_epll", "fin_pll",
-		EPLL_LOCK, EPLL_CON0, "fout_epll", NULL),
-	[vpll] = PLL_A(pll_4650c, CLK_FOUT_VPLL, "fout_vpll", "mout_vpllsrc",
-		VPLL_LOCK, VPLL_CON0, "fout_vpll", NULL),
+	[apll] = PLL(pll_4508, CLK_FOUT_APLL, "fout_apll", "fin_pll",
+		APLL_LOCK, APLL_CON0, NULL),
+	[mpll] = PLL(pll_4508, CLK_FOUT_MPLL, "fout_mpll", "fin_pll",
+		E4210_MPLL_LOCK, E4210_MPLL_CON0, NULL),
+	[epll] = PLL(pll_4600, CLK_FOUT_EPLL, "fout_epll", "fin_pll",
+		EPLL_LOCK, EPLL_CON0, NULL),
+	[vpll] = PLL(pll_4650c, CLK_FOUT_VPLL, "fout_vpll", "mout_vpllsrc",
+		VPLL_LOCK, VPLL_CON0, NULL),
 };
 
 static struct samsung_pll_clock exynos4x12_plls[nr_plls] __initdata = {
@@ -1494,8 +1474,6 @@ static void __init exynos4_clk_init(struct device_node *np,
 			ARRAY_SIZE(exynos4210_div_clks));
 		samsung_clk_register_gate(ctx, exynos4210_gate_clks,
 			ARRAY_SIZE(exynos4210_gate_clks));
-		samsung_clk_register_alias(ctx, exynos4210_aliases,
-			ARRAY_SIZE(exynos4210_aliases));
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4210_fixed_factor_clks,
 			ARRAY_SIZE(exynos4210_fixed_factor_clks));
@@ -1510,8 +1488,6 @@ static void __init exynos4_clk_init(struct device_node *np,
 			ARRAY_SIZE(exynos4x12_div_clks));
 		samsung_clk_register_gate(ctx, exynos4x12_gate_clks,
 			ARRAY_SIZE(exynos4x12_gate_clks));
-		samsung_clk_register_alias(ctx, exynos4x12_aliases,
-			ARRAY_SIZE(exynos4x12_aliases));
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4x12_fixed_factor_clks,
 			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
@@ -1521,9 +1497,6 @@ static void __init exynos4_clk_init(struct device_node *np,
 			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
 	}
 
-	samsung_clk_register_alias(ctx, exynos4_aliases,
-			ARRAY_SIZE(exynos4_aliases));
-
 	if (soc == EXYNOS4X12)
 		exynos4x12_core_down_clock();
 	exynos4_clk_sleep_init();
-- 
2.14.2


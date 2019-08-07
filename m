From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/2] clk: samsung: exynos5800: Move MAU subsystem clocks to
 MAU sub-CMU
Date: Wed,  7 Aug 2019 18:24:56 +0200
Message-ID: <20190807162456.28694-2-s.nawrocki@samsung.com>
References: <20190807162456.28694-1-s.nawrocki@samsung.com>
        <CGME20190807162519eucas1p2b9dd9f31cc6e60e0bc935e9a6ceef908@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807162456.28694-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, mturquette@baylibre.com
Cc: linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, cw00.choi@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes broken sound on Exynos5422/5800 platforms after
system/suspend resume cycle in cases where the audio root clock
is derived from MAU_EPLL_CLK.

In order to preserve state of the USER_MUX_MAU_EPLL_CLK clock mux
during system suspend/resume cycle for Exynos5800 we group the MAU
block input clocks in "MAU" sub-CMU and add the clock mux control
bit to .suspend_regs.  This ensures that user configuration of the mux
is not lost after the PMU block changes the mux setting to OSC_DIV
when switching off the MAU power domain.

Adding the SRC_TOP9 register to exynos5800_clk_regs[] array is not
sufficient as at the time of the syscore_ops suspend call MAU power
domain is already turned off and we already save and subsequently
restore an incorrect register's value.

Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
Reported-by: Jaafar Ali <jaafarkhalaf@gmail.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 54 ++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index fdb17c799aa5..b52daf5aa755 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -534,8 +534,6 @@ static const struct samsung_gate_clock exynos5800_gate_clks[] __initconst = {
 				GATE_BUS_TOP, 24, 0, 0),
 	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
 				GATE_BUS_TOP, 27, CLK_IS_CRITICAL, 0),
-	GATE(CLK_MAU_EPLL, "mau_epll", "mout_user_mau_epll",
-			SRC_MASK_TOP7, 20, CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
@@ -577,8 +575,13 @@ static const struct samsung_div_clock exynos5420_div_clks[] __initconst = {
 
 static const struct samsung_gate_clock exynos5420_gate_clks[] __initconst = {
 	GATE(CLK_SECKEY, "seckey", "aclk66_psgen", GATE_BUS_PERIS1, 1, 0, 0),
+	/* Maudio Block */
 	GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
 			SRC_MASK_TOP7, 20, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_SCLK_MAUDIO0, "sclk_maudio0", "dout_maudio0",
+		GATE_TOP_SCLK_MAU, 0, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_SCLK_MAUPCM0, "sclk_maupcm0", "dout_maupcm0",
+		GATE_TOP_SCLK_MAU, 1, CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
@@ -1017,12 +1020,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_SCLK_DP1, "sclk_dp1", "dout_dp1",
 			GATE_TOP_SCLK_DISP1, 20, CLK_SET_RATE_PARENT, 0),
 
-	/* Maudio Block */
-	GATE(CLK_SCLK_MAUDIO0, "sclk_maudio0", "dout_maudio0",
-		GATE_TOP_SCLK_MAU, 0, CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_SCLK_MAUPCM0, "sclk_maupcm0", "dout_maupcm0",
-		GATE_TOP_SCLK_MAU, 1, CLK_SET_RATE_PARENT, 0),
-
 	/* FSYS Block */
 	GATE(CLK_TSI, "tsi", "aclk200_fsys", GATE_BUS_FSYS0, 0, 0, 0),
 	GATE(CLK_PDMA0, "pdma0", "aclk200_fsys", GATE_BUS_FSYS0, 1, 0, 0),
@@ -1281,6 +1278,20 @@ static struct exynos5_subcmu_reg_dump exynos5x_mfc_suspend_regs[] = {
 	{ DIV4_RATIO, 0, 0x3 },			/* DIV dout_mfc_blk */
 };
 
+
+static const struct samsung_gate_clock exynos5800_mau_gate_clks[] __initconst = {
+	GATE(CLK_MAU_EPLL, "mau_epll", "mout_user_mau_epll",
+			SRC_MASK_TOP7, 20, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_SCLK_MAUDIO0, "sclk_maudio0", "dout_maudio0",
+		GATE_TOP_SCLK_MAU, 0, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_SCLK_MAUPCM0, "sclk_maupcm0", "dout_maupcm0",
+		GATE_TOP_SCLK_MAU, 1, CLK_SET_RATE_PARENT, 0),
+};
+
+static struct exynos5_subcmu_reg_dump exynos5800_mau_suspend_regs[] = {
+	{ SRC_TOP9, 0, BIT(8) },
+};
+
 static const struct exynos5_subcmu_info exynos5x_disp_subcmu = {
 	.div_clks	= exynos5x_disp_div_clks,
 	.nr_div_clks	= ARRAY_SIZE(exynos5x_disp_div_clks),
@@ -1311,12 +1322,27 @@ static const struct exynos5_subcmu_info exynos5x_mfc_subcmu = {
 	.pd_name	= "MFC",
 };
 
+static const struct exynos5_subcmu_info exynos5800_mau_subcmu = {
+	.gate_clks	= exynos5800_mau_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(exynos5800_mau_gate_clks),
+	.suspend_regs	= exynos5800_mau_suspend_regs,
+	.nr_suspend_regs = ARRAY_SIZE(exynos5800_mau_suspend_regs),
+	.pd_name	= "MAU",
+};
+
 static const struct exynos5_subcmu_info *exynos5x_subcmus[] = {
 	&exynos5x_disp_subcmu,
 	&exynos5x_gsc_subcmu,
 	&exynos5x_mfc_subcmu,
 };
 
+static const struct exynos5_subcmu_info *exynos5800_subcmus[] = {
+	&exynos5x_disp_subcmu,
+	&exynos5x_gsc_subcmu,
+	&exynos5x_mfc_subcmu,
+	&exynos5800_mau_subcmu,
+};
+
 static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __initconst = {
 	PLL_35XX_RATE(24 * MHZ, 2000000000, 250, 3, 0),
 	PLL_35XX_RATE(24 * MHZ, 1900000000, 475, 6, 0),
@@ -1547,11 +1573,17 @@ static void __init exynos5x_clk_init(struct device_node *np,
 	samsung_clk_extended_sleep_init(reg_base,
 		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
 		exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));
-	if (soc == EXYNOS5800)
+
+	if (soc == EXYNOS5800) {
 		samsung_clk_sleep_init(reg_base, exynos5800_clk_regs,
 				       ARRAY_SIZE(exynos5800_clk_regs));
-	exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5x_subcmus),
-			     exynos5x_subcmus);
+
+		exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5800_subcmus),
+				     exynos5800_subcmus);
+	} else {
+		exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5x_subcmus),
+				     exynos5x_subcmus);
+	}
 
 	samsung_clk_of_add_provider(np, ctx);
 }
-- 
2.17.1

From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 12/12] clk: samsung: exynos7: Add required clock tree for UFS
Date: Thu, 10 Sep 2015 14:14:37 +0530
Message-ID: <1441874677-24148-13-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding required mux/div/gate clocks for UFS controller
present on Exynos7.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |  107 +++++++++++++++++++++++++++++++
 include/dt-bindings/clock/exynos7-clk.h |   24 ++++++-
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index d4c6e47..cd25661 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -479,12 +479,21 @@ static struct samsung_mux_clock top1_mux_clks[] __initdata = {
 	MUX(0, "mout_aclk_fsys1_200", mout_top1_group1, MUX_SEL_TOP13, 24, 2),
 	MUX(0, "mout_aclk_fsys0_200", mout_top1_group1, MUX_SEL_TOP13, 28, 2),
 
+	MUX(0, "mout_sclk_phy_fsys0_26m", mout_top1_group1,
+		MUX_SEL_TOP1_FSYS0, 0, 2),
 	MUX(0, "mout_sclk_mmc2", mout_top1_group1, MUX_SEL_TOP1_FSYS0, 16, 2),
 	MUX(0, "mout_sclk_usbdrd300", mout_top1_group1,
 		MUX_SEL_TOP1_FSYS0, 28, 2),
 
+	MUX(0, "mout_sclk_phy_fsys1", mout_top1_group1,
+		MUX_SEL_TOP1_FSYS1, 0, 2),
+	MUX(0, "mout_sclk_ufsunipro20", mout_top1_group1,
+		MUX_SEL_TOP1_FSYS1, 16, 2),
+
 	MUX(0, "mout_sclk_mmc1", mout_top1_group1, MUX_SEL_TOP1_FSYS11, 0, 2),
 	MUX(0, "mout_sclk_mmc0", mout_top1_group1, MUX_SEL_TOP1_FSYS11, 12, 2),
+	MUX(0, "mout_sclk_phy_fsys1_26m", mout_top1_group1,
+		MUX_SEL_TOP1_FSYS11, 24, 2),
 };
 
 static struct samsung_div_clock top1_div_clks[] __initdata = {
@@ -493,6 +502,13 @@ static struct samsung_div_clock top1_div_clks[] __initdata = {
 	DIV(DOUT_ACLK_FSYS0_200, "dout_aclk_fsys0_200", "mout_aclk_fsys0_200",
 		DIV_TOP13, 28, 4),
 
+	DIV(DOUT_SCLK_PHY_FSYS1, "dout_sclk_phy_fsys1",
+		"mout_sclk_phy_fsys1", DIV_TOP1_FSYS1, 0, 6),
+
+	DIV(DOUT_SCLK_UFSUNIPRO20, "dout_sclk_ufsunipro20",
+		"mout_sclk_ufsunipro20",
+		DIV_TOP1_FSYS1, 16, 6),
+
 	DIV(DOUT_SCLK_MMC2, "dout_sclk_mmc2", "mout_sclk_mmc2",
 		DIV_TOP1_FSYS0, 16, 10),
 	DIV(0, "dout_sclk_usbdrd300", "mout_sclk_usbdrd300",
@@ -502,6 +518,9 @@ static struct samsung_div_clock top1_div_clks[] __initdata = {
 		DIV_TOP1_FSYS11, 0, 10),
 	DIV(DOUT_SCLK_MMC0, "dout_sclk_mmc0", "mout_sclk_mmc0",
 		DIV_TOP1_FSYS11, 12, 10),
+
+	DIV(DOUT_SCLK_PHY_FSYS1_26M, "dout_sclk_phy_fsys1_26m",
+		"mout_sclk_phy_fsys1_26m", DIV_TOP1_FSYS11, 24, 6),
 };
 
 static struct samsung_gate_clock top1_gate_clks[] __initdata = {
@@ -510,6 +529,12 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 	GATE(0, "sclk_usbdrd300", "dout_sclk_usbdrd300",
 		ENABLE_SCLK_TOP1_FSYS0, 28, 0, 0),
 
+	GATE(CLK_SCLK_PHY_FSYS1, "sclk_phy_fsys1", "dout_sclk_phy_fsys1",
+		ENABLE_SCLK_TOP1_FSYS1, 0, CLK_SET_RATE_PARENT, 0),
+
+	GATE(CLK_SCLK_UFSUNIPRO20, "sclk_ufsunipro20", "dout_sclk_ufsunipro20",
+		ENABLE_SCLK_TOP1_FSYS1, 16, CLK_SET_RATE_PARENT, 0),
+
 	GATE(CLK_SCLK_MMC1, "sclk_mmc1", "dout_sclk_mmc1",
 		ENABLE_SCLK_TOP1_FSYS11, 0, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_MMC0, "sclk_mmc0", "dout_sclk_mmc0",
@@ -519,6 +544,10 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_ACLK_FSYS1_200, "aclk_fsys1_200", "dout_aclk_fsys1_200",
 		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT, 0),
+
+	GATE(CLK_SCLK_PHY_FSYS1_26M, "sclk_phy_fsys1_26m",
+		"dout_sclk_phy_fsys1_26m", ENABLE_SCLK_TOP1_FSYS11,
+		24, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initdata = {
@@ -958,22 +987,54 @@ CLK_OF_DECLARE(exynos7_clk_fsys0, "samsung,exynos7-clock-fsys0",
 /* Register Offset definitions for CMU_FSYS1 (0x156E0000) */
 #define MUX_SEL_FSYS10			0x0200
 #define MUX_SEL_FSYS11			0x0204
+#define MUX_SEL_FSYS12			0x0208
+#define DIV_FSYS1			0x0600
 #define ENABLE_ACLK_FSYS1		0x0800
+#define ENABLE_PCLK_FSYS1               0x0900
+#define ENABLE_SCLK_FSYS11              0x0A04
+#define ENABLE_SCLK_FSYS12              0x0A08
+#define ENABLE_SCLK_FSYS13              0x0A0C
 
 /*
  * List of parent clocks for Muxes in CMU_FSYS1
  */
 PNAME(mout_aclk_fsys1_200_user_p)	= { "fin_pll", "aclk_fsys1_200" };
+PNAME(mout_fsys1_group_p)	= { "fin_pll", "fin_pll_26m",
+				"sclk_phy_fsys1_26m" };
 PNAME(mout_sclk_mmc0_user_p)		= { "fin_pll", "sclk_mmc0" };
 PNAME(mout_sclk_mmc1_user_p)		= { "fin_pll", "sclk_mmc1" };
+PNAME(mout_sclk_ufsunipro20_user_p)  = { "fin_pll", "sclk_ufsunipro20" };
+PNAME(mout_phyclk_ufs20_tx0_user_p) = { "fin_pll", "phyclk_ufs20_tx0_symbol" };
+PNAME(mout_phyclk_ufs20_rx0_user_p) = { "fin_pll", "phyclk_ufs20_rx0_symbol" };
+PNAME(mout_phyclk_ufs20_rx1_user_p) = { "fin_pll", "phyclk_ufs20_rx1_symbol" };
+
+/* fixed rate clocks used in the FSYS1 block */
+struct samsung_fixed_rate_clock fixed_rate_clks_fsys1[] __initdata = {
+	FRATE(PHYCLK_UFS20_TX0_SYMBOL, "phyclk_ufs20_tx0_symbol", NULL,
+			CLK_IS_ROOT, 300000000),
+	FRATE(PHYCLK_UFS20_RX0_SYMBOL, "phyclk_ufs20_rx0_symbol", NULL,
+			CLK_IS_ROOT, 300000000),
+	FRATE(PHYCLK_UFS20_RX1_SYMBOL, "phyclk_ufs20_rx1_symbol", NULL,
+			CLK_IS_ROOT, 300000000),
+};
 
 static unsigned long fsys1_clk_regs[] __initdata = {
 	MUX_SEL_FSYS10,
 	MUX_SEL_FSYS11,
+	MUX_SEL_FSYS12,
+	DIV_FSYS1,
 	ENABLE_ACLK_FSYS1,
+	ENABLE_PCLK_FSYS1,
+	ENABLE_SCLK_FSYS11,
+	ENABLE_SCLK_FSYS12,
+	ENABLE_SCLK_FSYS13,
 };
 
 static struct samsung_mux_clock fsys1_mux_clks[] __initdata = {
+	MUX(MOUT_FSYS1_PHYCLK_SEL1, "mout_fsys1_phyclk_sel1",
+		mout_fsys1_group_p, MUX_SEL_FSYS10, 16, 2),
+	MUX(0, "mout_fsys1_phyclk_sel0", mout_fsys1_group_p,
+		 MUX_SEL_FSYS10, 20, 2),
 	MUX(0, "mout_aclk_fsys1_200_user", mout_aclk_fsys1_200_user_p,
 		MUX_SEL_FSYS10, 28, 1),
 
@@ -981,18 +1042,64 @@ static struct samsung_mux_clock fsys1_mux_clks[] __initdata = {
 		MUX_SEL_FSYS11, 24, 1),
 	MUX(0, "mout_sclk_mmc0_user", mout_sclk_mmc0_user_p,
 		MUX_SEL_FSYS11, 28, 1),
+	MUX(0, "mout_sclk_ufsunipro20_user", mout_sclk_ufsunipro20_user_p,
+		MUX_SEL_FSYS11, 20, 1),
+
+	MUX(0, "mout_phyclk_ufs20_rx1_symbol_user",
+		mout_phyclk_ufs20_rx1_user_p, MUX_SEL_FSYS12, 16, 1),
+	MUX(0, "mout_phyclk_ufs20_rx0_symbol_user",
+		mout_phyclk_ufs20_rx0_user_p, MUX_SEL_FSYS12, 24, 1),
+	MUX(0, "mout_phyclk_ufs20_tx0_symbol_user",
+		mout_phyclk_ufs20_tx0_user_p, MUX_SEL_FSYS12, 28, 1),
+};
+
+static struct samsung_div_clock fsys1_div_clks[] __initdata = {
+	DIV(DOUT_PCLK_FSYS1, "dout_pclk_fsys1", "mout_aclk_fsys1_200_user",
+		DIV_FSYS1, 0, 2),
 };
 
 static struct samsung_gate_clock fsys1_gate_clks[] __initdata = {
+	GATE(SCLK_UFSUNIPRO20_USER, "sclk_ufsunipro20_user",
+		"mout_sclk_ufsunipro20_user",
+		ENABLE_SCLK_FSYS11, 20, 0, 0),
+
 	GATE(ACLK_MMC1, "aclk_mmc1", "mout_aclk_fsys1_200_user",
 		ENABLE_ACLK_FSYS1, 29, 0, 0),
 	GATE(ACLK_MMC0, "aclk_mmc0", "mout_aclk_fsys1_200_user",
 		ENABLE_ACLK_FSYS1, 30, 0, 0),
+
+	GATE(ACLK_UFS20_LINK, "aclk_ufs20_link", "dout_pclk_fsys1",
+		ENABLE_ACLK_FSYS1, 31, 0, 0),
+	GATE(PCLK_GPIO_FSYS1, "pclk_gpio_fsys1", "mout_aclk_fsys1_200_user",
+		ENABLE_PCLK_FSYS1, 30, 0, 0),
+
+	GATE(PHYCLK_UFS20_RX1_SYMBOL_USER, "phyclk_ufs20_rx1_symbol_user",
+		"mout_phyclk_ufs20_rx1_symbol_user",
+		ENABLE_SCLK_FSYS12, 16, 0, 0),
+	GATE(PHYCLK_UFS20_RX0_SYMBOL_USER, "phyclk_ufs20_rx0_symbol_user",
+		"mout_phyclk_ufs20_rx0_symbol_user",
+		ENABLE_SCLK_FSYS12, 24, 0, 0),
+	GATE(PHYCLK_UFS20_TX0_SYMBOL_USER, "phyclk_ufs20_tx0_symbol_user",
+		"mout_phyclk_ufs20_tx0_symbol_user",
+		ENABLE_SCLK_FSYS12, 28, 0, 0),
+
+	GATE(OSCCLK_PHY_CLKOUT_EMBEDDED_COMBO_PHY,
+		"oscclk_phy_clkout_embedded_combo_phy",
+		"fin_pll",
+		ENABLE_SCLK_FSYS12, 4, CLK_IGNORE_UNUSED, 0),
+
+	GATE(SCLK_COMBO_PHY_EMBEDDED_26M, "sclk_combo_phy_embedded_26m",
+		"mout_fsys1_phyclk_sel1",
+		ENABLE_SCLK_FSYS13, 24, CLK_IGNORE_UNUSED, 0),
 };
 
 static struct samsung_cmu_info fsys1_cmu_info __initdata = {
+	.fixed_clks		= fixed_rate_clks_fsys1,
+	.nr_fixed_clks		= ARRAY_SIZE(fixed_rate_clks_fsys1),
 	.mux_clks		= fsys1_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys1_mux_clks),
+	.div_clks		= fsys1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(fsys1_div_clks),
 	.gate_clks		= fsys1_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
 	.nr_clk_ids		= FSYS1_NR_CLK,
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index acdf2e5..10c5586 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -64,7 +64,14 @@
 #define CLK_SCLK_MMC0			8
 #define CLK_ACLK_FSYS0_200		9
 #define CLK_ACLK_FSYS1_200		10
-#define TOP1_NR_CLK			11
+#define CLK_SCLK_PHY_FSYS1		11
+#define CLK_SCLK_PHY_FSYS1_26M		12
+#define MOUT_SCLK_UFSUNIPRO20		13
+#define DOUT_SCLK_UFSUNIPRO20		14
+#define CLK_SCLK_UFSUNIPRO20		15
+#define DOUT_SCLK_PHY_FSYS1		16
+#define DOUT_SCLK_PHY_FSYS1_26M		17
+#define TOP1_NR_CLK			18
 
 /* CCORE */
 #define PCLK_RTC			1
@@ -139,7 +146,20 @@
 /* FSYS1 */
 #define ACLK_MMC1			1
 #define ACLK_MMC0			2
-#define FSYS1_NR_CLK			3
+#define PHYCLK_UFS20_TX0_SYMBOL		3
+#define PHYCLK_UFS20_RX0_SYMBOL		4
+#define PHYCLK_UFS20_RX1_SYMBOL		5
+#define ACLK_UFS20_LINK			6
+#define SCLK_UFSUNIPRO20_USER		7
+#define PHYCLK_UFS20_RX1_SYMBOL_USER	8
+#define PHYCLK_UFS20_RX0_SYMBOL_USER	9
+#define PHYCLK_UFS20_TX0_SYMBOL_USER	10
+#define OSCCLK_PHY_CLKOUT_EMBEDDED_COMBO_PHY	11
+#define SCLK_COMBO_PHY_EMBEDDED_26M	12
+#define DOUT_PCLK_FSYS1			13
+#define PCLK_GPIO_FSYS1			14
+#define MOUT_FSYS1_PHYCLK_SEL1		15
+#define FSYS1_NR_CLK			16
 
 /* MSCL */
 #define USERMUX_ACLK_MSCL_532		1
-- 
1.7.10.4


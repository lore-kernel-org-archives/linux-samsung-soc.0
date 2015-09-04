From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 03/11] clk: samsung: exynos7: Corrects CMU_TOP1 clocks names
Date: Fri, 04 Sep 2015 17:07:08 +0530
Message-ID: <1441366637-28001-4-git-send-email-alim.akhtar@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch rename CMU_TOP1 clocks names to match with user manual.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |   50 ++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index f9aac4a..ba84e9b 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -409,23 +409,23 @@ CLK_OF_DECLARE(exynos7_clk_top0, "samsung,exynos7-clock-top0",
 #define ENABLE_SCLK_TOP1_FSYS11		0x0A2C
 
 /* List of parent clocks for Muxes in CMU_TOP1 */
-PNAME(mout_top1_bus0_pll_p)	= { "fin_pll", "dout_sclk_bus0_pll" };
-PNAME(mout_top1_bus1_pll_p)	= { "fin_pll", "dout_sclk_bus1_pll_b" };
-PNAME(mout_top1_cc_pll_p)	= { "fin_pll", "dout_sclk_cc_pll_b" };
-PNAME(mout_top1_mfc_pll_p)	= { "fin_pll", "dout_sclk_mfc_pll_b" };
+PNAME(mout_top1_bus0_pll_user_p)	= { "fin_pll", "sclk_bus0_pll_b" };
+PNAME(mout_top1_bus1_pll_user_p)	= { "fin_pll", "sclk_bus1_pll_b" };
+PNAME(mout_top1_cc_pll_user_p)	= { "fin_pll", "sclk_cc_pll_b" };
+PNAME(mout_top1_mfc_pll_user_p)	= { "fin_pll", "sclk_mfc_pll_b" };
 
-PNAME(mout_top1_half_bus0_pll_p) = {"mout_top1_bus0_pll",
+PNAME(mout_top1_bus0_pll_half_p) = {"mout_top1_bus0_pll_user",
 	"ffac_top1_bus0_pll_div2"};
-PNAME(mout_top1_half_bus1_pll_p) = {"mout_top1_bus1_pll",
+PNAME(mout_top1_bus1_pll_half_p) = {"mout_top1_bus1_pll_user",
 	"ffac_top1_bus1_pll_div2"};
-PNAME(mout_top1_half_cc_pll_p) = {"mout_top1_cc_pll",
+PNAME(mout_top1_cc_pll_half_p) = {"mout_top1_cc_pll_user",
 	"ffac_top1_cc_pll_div2"};
-PNAME(mout_top1_half_mfc_pll_p) = {"mout_top1_mfc_pll",
+PNAME(mout_top1_mfc_pll_half_p) = {"mout_top1_mfc_pll_user",
 	"ffac_top1_mfc_pll_div2"};
 
-PNAME(mout_top1_group1) = {"mout_top1_half_bus0_pll",
-	"mout_top1_half_bus1_pll", "mout_top1_half_cc_pll",
-	"mout_top1_half_mfc_pll"};
+PNAME(mout_top1_group1) = {"mout_top1_bus0_pll_half",
+	"mout_top1_bus1_pll_half", "mout_top1_cc_pll_half",
+	"mout_top1_mfc_pll_half"};
 
 static unsigned long top1_clk_regs[] __initdata = {
 	MUX_SEL_TOP10,
@@ -445,20 +445,22 @@ static unsigned long top1_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock top1_mux_clks[] __initdata = {
-	MUX(0, "mout_top1_mfc_pll", mout_top1_mfc_pll_p, MUX_SEL_TOP10, 4, 1),
-	MUX(0, "mout_top1_cc_pll", mout_top1_cc_pll_p, MUX_SEL_TOP10, 8, 1),
-	MUX(0, "mout_top1_bus1_pll", mout_top1_bus1_pll_p,
+	MUX(0, "mout_top1_mfc_pll_user", mout_top1_mfc_pll_user_p,
+		MUX_SEL_TOP10, 4, 1),
+	MUX(0, "mout_top1_cc_pll_user", mout_top1_cc_pll_user_p,
+		MUX_SEL_TOP10, 8, 1),
+	MUX(0, "mout_top1_bus1_pll_user", mout_top1_bus1_pll_user_p,
 		MUX_SEL_TOP10, 12, 1),
-	MUX(0, "mout_top1_bus0_pll", mout_top1_bus0_pll_p,
+	MUX(0, "mout_top1_bus0_pll_user", mout_top1_bus0_pll_user_p,
 		MUX_SEL_TOP10, 16, 1),
 
-	MUX(0, "mout_top1_half_mfc_pll", mout_top1_half_mfc_pll_p,
+	MUX(0, "mout_top1_mfc_pll_half", mout_top1_mfc_pll_half_p,
 		MUX_SEL_TOP11, 4, 1),
-	MUX(0, "mout_top1_half_cc_pll", mout_top1_half_cc_pll_p,
+	MUX(0, "mout_top1_cc_pll_half", mout_top1_cc_pll_half_p,
 		MUX_SEL_TOP11, 8, 1),
-	MUX(0, "mout_top1_half_bus1_pll", mout_top1_half_bus1_pll_p,
+	MUX(0, "mout_top1_bus1_pll_half", mout_top1_bus1_pll_half_p,
 		MUX_SEL_TOP11, 12, 1),
-	MUX(0, "mout_top1_half_bus0_pll", mout_top1_half_bus0_pll_p,
+	MUX(0, "mout_top1_bus0_pll_half", mout_top1_bus0_pll_half_p,
 		MUX_SEL_TOP11, 16, 1),
 
 	MUX(0, "mout_aclk_fsys1_200", mout_top1_group1, MUX_SEL_TOP13, 24, 2),
@@ -502,10 +504,12 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 };
 
 static struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initdata = {
-	FFACTOR(0, "ffac_top1_bus0_pll_div2", "mout_top1_bus0_pll", 1, 2, 0),
-	FFACTOR(0, "ffac_top1_bus1_pll_div2", "mout_top1_bus1_pll", 1, 2, 0),
-	FFACTOR(0, "ffac_top1_cc_pll_div2", "mout_top1_cc_pll", 1, 2, 0),
-	FFACTOR(0, "ffac_top1_mfc_pll_div2", "mout_top1_mfc_pll", 1, 2, 0),
+	FFACTOR(0, "ffac_top1_bus0_pll_div2", "mout_top1_bus0_pll_user",
+		1, 2, 0),
+	FFACTOR(0, "ffac_top1_bus1_pll_div2", "mout_top1_bus1_pll_user",
+		1, 2, 0),
+	FFACTOR(0, "ffac_top1_cc_pll_div2", "mout_top1_cc_pll_user", 1, 2, 0),
+	FFACTOR(0, "ffac_top1_mfc_pll_div2", "mout_top1_mfc_pll_user", 1, 2, 0),
 };
 
 static struct samsung_cmu_info top1_cmu_info __initdata = {
-- 
1.7.10.4


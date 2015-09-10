From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 03/12] clk: samsung: exynos7: Corrects CMU_TOP0 clocks names
Date: Thu, 10 Sep 2015 14:14:28 +0530
Message-ID: <1441874677-24148-4-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch renames CMU_TOP0 clocks names to match with user manual.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |   67 ++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index e11449b..84a6e50 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -232,30 +232,30 @@ CLK_OF_DECLARE(exynos7_clk_topc, "samsung,exynos7-clock-topc",
 #define ENABLE_SCLK_TOP0_PERIC3		0x0A3C
 
 /* List of parent clocks for Muxes in CMU_TOP0 */
-PNAME(mout_bus0_pll_p)	= { "fin_pll", "dout_sclk_bus0_pll" };
-PNAME(mout_bus1_pll_p)	= { "fin_pll", "dout_sclk_bus1_pll" };
-PNAME(mout_cc_pll_p)	= { "fin_pll", "dout_sclk_cc_pll" };
-PNAME(mout_mfc_pll_p)	= { "fin_pll", "dout_sclk_mfc_pll" };
-PNAME(mout_aud_pll_p)	= { "fin_pll", "dout_sclk_aud_pll" };
+PNAME(mout_top0_bus0_pll_user_p)	= { "fin_pll", "sclk_bus0_pll_a" };
+PNAME(mout_top0_bus1_pll_user_p)	= { "fin_pll", "sclk_bus1_pll_a" };
+PNAME(mout_top0_cc_pll_user_p)	= { "fin_pll", "sclk_cc_pll_a" };
+PNAME(mout_top0_mfc_pll_user_p)	= { "fin_pll", "sclk_mfc_pll_a" };
+PNAME(mout_top0_aud_pll_user_p)	= { "fin_pll", "sclk_aud_pll" };
 
-PNAME(mout_top0_half_bus0_pll_p) = {"mout_top0_bus0_pll",
+PNAME(mout_top0_bus0_pll_half_p) = {"mout_top0_bus0_pll_user",
 	"ffac_top0_bus0_pll_div2"};
-PNAME(mout_top0_half_bus1_pll_p) = {"mout_top0_bus1_pll",
+PNAME(mout_top0_bus1_pll_half_p) = {"mout_top0_bus1_pll_user",
 	"ffac_top0_bus1_pll_div2"};
-PNAME(mout_top0_half_cc_pll_p) = {"mout_top0_cc_pll",
+PNAME(mout_top0_cc_pll_half_p) = {"mout_top0_cc_pll_user",
 	"ffac_top0_cc_pll_div2"};
-PNAME(mout_top0_half_mfc_pll_p) = {"mout_top0_mfc_pll",
+PNAME(mout_top0_mfc_pll_half_p) = {"mout_top0_mfc_pll_user",
 	"ffac_top0_mfc_pll_div2"};
 
-PNAME(mout_top0_group1) = {"mout_top0_half_bus0_pll",
-	"mout_top0_half_bus1_pll", "mout_top0_half_cc_pll",
-	"mout_top0_half_mfc_pll"};
+PNAME(mout_top0_group1) = {"mout_top0_bus0_pll_half",
+	"mout_top0_bus1_pll_half", "mout_top0_cc_pll_half",
+	"mout_top0_mfc_pll_half"};
 PNAME(mout_top0_group3) = {"ioclk_audiocdclk0",
 	"ioclk_audiocdclk1", "ioclk_spdif_extclk",
-	"mout_top0_aud_pll", "mout_top0_half_bus0_pll",
-	"mout_top0_half_bus1_pll"};
-PNAME(mout_top0_group4) = {"ioclk_audiocdclk1", "mout_top0_aud_pll",
-	"mout_top0_half_bus0_pll", "mout_top0_half_bus1_pll"};
+	"mout_top0_aud_pll_user", "mout_top0_bus0_pll_half",
+	"mout_top0_bus1_pll_half"};
+PNAME(mout_top0_group4) = {"ioclk_audiocdclk1", "mout_top0_aud_pll_user",
+	"mout_top0_bus0_pll_half", "mout_top0_bus1_pll_half"};
 
 static unsigned long top0_clk_regs[] __initdata = {
 	MUX_SEL_TOP00,
@@ -277,19 +277,24 @@ static unsigned long top0_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock top0_mux_clks[] __initdata = {
-	MUX(0, "mout_top0_aud_pll", mout_aud_pll_p, MUX_SEL_TOP00, 0, 1),
-	MUX(0, "mout_top0_mfc_pll", mout_mfc_pll_p, MUX_SEL_TOP00, 4, 1),
-	MUX(0, "mout_top0_cc_pll", mout_cc_pll_p, MUX_SEL_TOP00, 8, 1),
-	MUX(0, "mout_top0_bus1_pll", mout_bus1_pll_p, MUX_SEL_TOP00, 12, 1),
-	MUX(0, "mout_top0_bus0_pll", mout_bus0_pll_p, MUX_SEL_TOP00, 16, 1),
-
-	MUX(0, "mout_top0_half_mfc_pll", mout_top0_half_mfc_pll_p,
+	MUX(0, "mout_top0_aud_pll_user", mout_top0_aud_pll_user_p,
+		MUX_SEL_TOP00, 0, 1),
+	MUX(0, "mout_top0_mfc_pll_user", mout_top0_mfc_pll_user_p,
+		MUX_SEL_TOP00, 4, 1),
+	MUX(0, "mout_top0_cc_pll_user", mout_top0_cc_pll_user_p,
+		MUX_SEL_TOP00, 8, 1),
+	MUX(0, "mout_top0_bus1_pll_user", mout_top0_bus1_pll_user_p,
+		MUX_SEL_TOP00, 12, 1),
+	MUX(0, "mout_top0_bus0_pll_user", mout_top0_bus0_pll_user_p,
+		MUX_SEL_TOP00, 16, 1),
+
+	MUX(0, "mout_top0_mfc_pll_half", mout_top0_mfc_pll_half_p,
 		MUX_SEL_TOP01, 4, 1),
-	MUX(0, "mout_top0_half_cc_pll", mout_top0_half_cc_pll_p,
+	MUX(0, "mout_top0_cc_pll_half", mout_top0_cc_pll_half_p,
 		MUX_SEL_TOP01, 8, 1),
-	MUX(0, "mout_top0_half_bus1_pll", mout_top0_half_bus1_pll_p,
+	MUX(0, "mout_top0_bus1_pll_half", mout_top0_bus1_pll_half_p,
 		MUX_SEL_TOP01, 12, 1),
-	MUX(0, "mout_top0_half_bus0_pll", mout_top0_half_bus0_pll_p,
+	MUX(0, "mout_top0_bus0_pll_half", mout_top0_bus0_pll_half_p,
 		MUX_SEL_TOP01, 16, 1),
 
 	MUX(0, "mout_aclk_peric1_66", mout_top0_group1, MUX_SEL_TOP03, 12, 2),
@@ -364,10 +369,12 @@ static struct samsung_gate_clock top0_gate_clks[] __initdata = {
 };
 
 static struct samsung_fixed_factor_clock top0_fixed_factor_clks[] __initdata = {
-	FFACTOR(0, "ffac_top0_bus0_pll_div2", "mout_top0_bus0_pll", 1, 2, 0),
-	FFACTOR(0, "ffac_top0_bus1_pll_div2", "mout_top0_bus1_pll", 1, 2, 0),
-	FFACTOR(0, "ffac_top0_cc_pll_div2", "mout_top0_cc_pll", 1, 2, 0),
-	FFACTOR(0, "ffac_top0_mfc_pll_div2", "mout_top0_mfc_pll", 1, 2, 0),
+	FFACTOR(0, "ffac_top0_bus0_pll_div2", "mout_top0_bus0_pll_user",
+		1, 2, 0),
+	FFACTOR(0, "ffac_top0_bus1_pll_div2", "mout_top0_bus1_pll_user",
+		1, 2, 0),
+	FFACTOR(0, "ffac_top0_cc_pll_div2", "mout_top0_cc_pll_user", 1, 2, 0),
+	FFACTOR(0, "ffac_top0_mfc_pll_div2", "mout_top0_mfc_pll_user", 1, 2, 0),
 };
 
 static struct samsung_cmu_info top0_cmu_info __initdata = {
-- 
1.7.10.4


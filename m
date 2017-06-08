From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/3] clk: samsung: Add missing exynos5420 audio related
 clocks
Date: Thu, 08 Jun 2017 16:17:12 +0200
Message-ID: <1496931433-5712-2-git-send-email-s.nawrocki@samsung.com>
References: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170608141726epcas1p1ab3faf22e9f398ae4cf23f84f487d123@epcas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds missing definitions of mux clocks required for using
EPLL as the audio subsystem root clock on exynos5420/exynos5422 SoCs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since RFC version:
  - dropped one clean up chunk
---
 drivers/clk/samsung/clk-exynos5420.c   | 10 +++++++---
 include/dt-bindings/clock/exynos5420.h |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index cdc092a..6f1d6c0 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -487,6 +487,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 PNAME(mout_group13_5800_p)	= { "dout_osc_div", "mout_sw_aclkfl1_550_cam" };
 PNAME(mout_group14_5800_p)	= { "dout_aclk550_cam", "dout_sclk_sw" };
 PNAME(mout_group15_5800_p)	= { "dout_osc_div", "mout_sw_aclk550_cam" };
+PNAME(mout_group16_5800_p)	= { "dout_osc_div", "mout_mau_epll_clk" };

 /* fixed rate clocks generated outside the soc */
 static struct samsung_fixed_rate_clock
@@ -536,8 +537,8 @@ static void __init exynos5420_clk_sleep_init(void) {}

 	MUX(CLK_MOUT_MX_MSPLL_CCORE, "mout_mx_mspll_ccore",
 			mout_mx_mspll_ccore_p, SRC_TOP7, 16, 2),
-	MUX(0, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p, SRC_TOP7,
-			20, 2),
+	MUX(CLK_MOUT_MAU_EPLL, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p,
+							SRC_TOP7, 20, 2),
 	MUX(0, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
 	MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),

@@ -546,6 +547,8 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	MUX(0, "mout_aclk432_cam", mout_group6_5800_p, SRC_TOP8, 24, 2),
 	MUX(0, "mout_aclk432_scaler", mout_group6_5800_p, SRC_TOP8, 28, 2),

+	MUX(CLK_MOUT_USER_MAU_EPLL, "mout_user_mau_epll", mout_group16_5800_p,
+							SRC_TOP9, 8, 1),
 	MUX(0, "mout_user_aclk550_cam", mout_group15_5800_p,
 							SRC_TOP9, 16, 1),
 	MUX(0, "mout_user_aclkfl1_550_cam", mout_group13_5800_p,
@@ -703,7 +706,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	MUX(0, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
 	MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
 	MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
-	MUX(0, "mout_sclk_epll", mout_epll_p, SRC_TOP6, 20, 1),
+	MUX(CLK_MOUT_EPLL, "mout_sclk_epll", mout_epll_p, SRC_TOP6, 20, 1),
 	MUX(0, "mout_sclk_dpll", mout_dpll_p, SRC_TOP6, 24, 1),
 	MUX(0, "mout_sclk_cpll", mout_cpll_p, SRC_TOP6, 28, 1),

@@ -1399,6 +1402,7 @@ static void __init exynos5x_clk_init(struct device_node *np,

 	if (_get_rate("fin_pll") == 24 * MHZ) {
 		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
+		exynos5x_plls[epll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[bpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 	}
diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index 6fd21c2..2740ae0 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -217,6 +217,9 @@
 #define CLK_MOUT_MCLK_CDREX	654
 #define CLK_MOUT_BPLL		655
 #define CLK_MOUT_MX_MSPLL_CCORE	656
+#define CLK_MOUT_EPLL		657
+#define CLK_MOUT_MAU_EPLL	658
+#define CLK_MOUT_USER_MAU_EPLL	659

 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
--
1.9.1


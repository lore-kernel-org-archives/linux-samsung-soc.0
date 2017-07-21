From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/3] clk: samsung: exynos542x: Enable clock rate propagation
 up to the EPLL
Date: Fri, 21 Jul 2017 18:36:44 +0200
Message-ID: <1500655004-29816-3-git-send-email-s.nawrocki@samsung.com>
References: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170721163755epcas1p2bfa1025557002ae5f89309aecd64c411@epcas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, cw00.choi@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

CLK_SET_RATE_PARENT flag is added to the clocks between the EPLL
and the audio subsystem clock controller so that the EPLL's output
frequency can be set indirectly with clk_set_rate() on a leaf clock.
That should be safe as EPLL is normally only used to generate clock
for the audio subsystem.
With this change we can avoid passing the EPPL clock to the ASoC
machine driver.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 5ae9364..2560196 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -537,8 +537,8 @@ static void __init exynos5420_clk_sleep_init(void) {}
 
 	MUX(CLK_MOUT_MX_MSPLL_CCORE, "mout_mx_mspll_ccore",
 			mout_mx_mspll_ccore_p, SRC_TOP7, 16, 2),
-	MUX(CLK_MOUT_MAU_EPLL, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p,
-							SRC_TOP7, 20, 2),
+	MUX_F(CLK_MOUT_MAU_EPLL, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p,
+			SRC_TOP7, 20, 2, CLK_SET_RATE_PARENT, 0),
 	MUX(0, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
 	MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
 
@@ -547,8 +547,8 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	MUX(0, "mout_aclk432_cam", mout_group6_5800_p, SRC_TOP8, 24, 2),
 	MUX(0, "mout_aclk432_scaler", mout_group6_5800_p, SRC_TOP8, 28, 2),
 
-	MUX(CLK_MOUT_USER_MAU_EPLL, "mout_user_mau_epll", mout_group16_5800_p,
-							SRC_TOP9, 8, 1),
+	MUX_F(CLK_MOUT_USER_MAU_EPLL, "mout_user_mau_epll", mout_group16_5800_p,
+			SRC_TOP9, 8, 1, CLK_SET_RATE_PARENT, 0),
 	MUX(0, "mout_user_aclk550_cam", mout_group15_5800_p,
 							SRC_TOP9, 16, 1),
 	MUX(0, "mout_user_aclkfl1_550_cam", mout_group13_5800_p,
@@ -591,7 +591,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
 				GATE_BUS_TOP, 27, CLK_IS_CRITICAL, 0),
 	GATE(CLK_MAU_EPLL, "mau_epll", "mout_user_mau_epll",
-			SRC_MASK_TOP7, 20, 0, 0),
+			SRC_MASK_TOP7, 20, CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
@@ -633,7 +633,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 
 static const struct samsung_gate_clock exynos5420_gate_clks[] __initconst = {
 	GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
-			SRC_MASK_TOP7, 20, 0, 0),
+			SRC_MASK_TOP7, 20, CLK_SET_RATE_PARENT, 0),
 };
 
 static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
@@ -713,7 +713,8 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	MUX(0, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
 	MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
 	MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
-	MUX(CLK_MOUT_EPLL, "mout_sclk_epll", mout_epll_p, SRC_TOP6, 20, 1),
+	MUX_F(CLK_MOUT_EPLL, "mout_sclk_epll", mout_epll_p, SRC_TOP6, 20, 1,
+			CLK_SET_RATE_PARENT, 0),
 	MUX(0, "mout_sclk_dpll", mout_dpll_p, SRC_TOP6, 24, 1),
 	MUX(0, "mout_sclk_cpll", mout_cpll_p, SRC_TOP6, 28, 1),
 
-- 
1.9.1

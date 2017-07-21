From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/3] clk: samsung: Fix mau_epll clock definition for
 exynos5422
Date: Fri, 21 Jul 2017 18:36:42 +0200
Message-ID: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
References: <CGME20170721163709epcas5p11c27574e84ceebbb3387ffeb3f402043@epcas5p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44079 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbdGUQhN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 12:37:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, cw00.choi@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Parent clock of the MAU_EPLL gate clock on exynos5422 is
"mout_user_mau_epll", not "mout_mau_epll_clk". This change
only affects exynos5422/5800.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 9a6476a..5ae9364 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -590,6 +590,8 @@ static void __init exynos5420_clk_sleep_init(void) {}
 				GATE_BUS_TOP, 24, 0, 0),
 	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
 				GATE_BUS_TOP, 27, CLK_IS_CRITICAL, 0),
+	GATE(CLK_MAU_EPLL, "mau_epll", "mout_user_mau_epll",
+			SRC_MASK_TOP7, 20, 0, 0),
 };
 
 static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
@@ -629,6 +631,11 @@ static void __init exynos5420_clk_sleep_init(void) {}
 			"mout_aclk400_wcore_bpll", DIV_TOP0, 16, 3),
 };
 
+static const struct samsung_gate_clock exynos5420_gate_clks[] __initconst = {
+	GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
+			SRC_MASK_TOP7, 20, 0, 0),
+};
+
 static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(0, "mout_user_pclk66_gpio", mout_user_pclk66_gpio_p,
 			SRC_TOP7, 4, 1),
@@ -1001,9 +1008,6 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	GATE(0, "aclk300_disp1", "mout_user_aclk300_disp1",
 			SRC_MASK_TOP2, 24, CLK_IS_CRITICAL, 0),
 
-	GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
-			SRC_MASK_TOP7, 20, 0, 0),
-
 	/* sclk */
 	GATE(CLK_SCLK_UART0, "sclk_uart0", "dout_uart0",
 		GATE_TOP_SCLK_PERIC, 0, CLK_SET_RATE_PARENT, 0),
@@ -1440,6 +1444,8 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				ARRAY_SIZE(exynos5420_mux_clks));
 		samsung_clk_register_div(ctx, exynos5420_div_clks,
 				ARRAY_SIZE(exynos5420_div_clks));
+		samsung_clk_register_gate(ctx, exynos5420_gate_clks,
+				ARRAY_SIZE(exynos5420_gate_clks));
 	} else {
 		samsung_clk_register_fixed_factor(
 				ctx, exynos5800_fixed_factor_clks,
-- 
1.9.1

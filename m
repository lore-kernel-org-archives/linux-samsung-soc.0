From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/3] clk: samsung: exynos542x: Add EPLL rate table
Date: Thu, 08 Jun 2017 16:17:13 +0200
Message-ID: <1496931433-5712-3-git-send-email-s.nawrocki@samsung.com>
References: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170608141730epcas1p19ca02cb0fd55506f88fcd68414fde70d@epcas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1496931433-5712-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

A specific clock rate table is added for EPLL so it is possible
to set frequency of the EPLL output clock as a multiple of various
audio sampling rates.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 6f1d6c0..0ba71bf 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1280,2 +1280,2 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	PLL_35XX_RATE(200000000,  200, 3, 3),
 };

+static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
+	PLL_36XX_RATE(600000000U, 100, 2, 1, 0),
+	PLL_36XX_RATE(400000000U, 200, 2, 2, 0),
+	PLL_36XX_RATE(393216000U, 197, 3, 2, 25690),
+	PLL_36XX_RATE(361267200U, 301, 5, 2, 3671),
+	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
+	PLL_36XX_RATE(196608000U, 197, 3, 3, -25690),
+	PLL_36XX_RATE(180633600U, 301, 5, 3, 3671),
+	PLL_36XX_RATE(131072000U, 131, 3, 3, 4719),
+	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
+	PLL_36XX_RATE(65536000U, 131, 3, 4, 4719),
+	PLL_36XX_RATE(49152000U, 197, 3, 5, 25690),
+	PLL_36XX_RATE(45158400U, 301, 5, 3, 3671),
+	PLL_36XX_RATE(32768000U, 131, 3, 5, 4719),
+};
+
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
 	[apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
@@ -1287,7 +1303,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 		CPLL_CON0, NULL),
 	[dpll] = PLL(pll_2550, CLK_FOUT_DPLL, "fout_dpll", "fin_pll", DPLL_LOCK,
 		DPLL_CON0, NULL),
-	[epll] = PLL(pll_2650, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
+	[epll] = PLL(pll_36xx, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
 		EPLL_CON0, NULL),
 	[rpll] = PLL(pll_2650, CLK_FOUT_RPLL, "fout_rpll", "fin_pll", RPLL_LOCK,
 		RPLL_CON0, NULL),
@@ -1402,7 +1418,7 @@ static void __init exynos5x_clk_init(struct device_node *np,

 	if (_get_rate("fin_pll") == 24 * MHZ) {
 		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
-		exynos5x_plls[epll].rate_table = exynos5420_pll2550x_24mhz_tbl;
+		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[bpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 	}
--
1.9.1


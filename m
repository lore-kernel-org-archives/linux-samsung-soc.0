From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 3/3] clk: samsung: exynos542x: Add EPLL rate table
Date: Fri, 09 Jun 2017 12:38:31 +0200
Message-ID: <1497004711-24052-3-git-send-email-s.nawrocki@samsung.com>
References: <1497004711-24052-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170609103856epcas5p32a847b79d540f4b2105990f499b3f59e@epcas5p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12064 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751598AbdFIKjA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 06:39:00 -0400
In-reply-to: <1497004711-24052-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

A specific clock rate table is added for EPLL so it is possible
to set frequency of the EPLL output clock as multiple of various
audio sampling rates.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - fixed coefficient for 400 MHZ rate
 - dropped 45158400 Hz rate entry
---
 drivers/clk/samsung/clk-exynos5420.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 6f1d6c0..0748a0b 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1280,6 +1280,21 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	PLL_35XX_RATE(200000000,  200, 3, 3),
 };
 
+static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
+	PLL_36XX_RATE(600000000U, 100, 2, 1, 0),
+	PLL_36XX_RATE(400000000U, 200, 3, 2, 0),
+	PLL_36XX_RATE(393216000U, 197, 3, 2, 25690),
+	PLL_36XX_RATE(361267200U, 301, 5, 2, 3671),
+	PLL_36XX_RATE(200000000U, 200, 3, 3, 0),
+	PLL_36XX_RATE(196608000U, 197, 3, 3, -25690),
+	PLL_36XX_RATE(180633600U, 301, 5, 3, 3671),
+	PLL_36XX_RATE(131072000U, 131, 3, 3, 4719),
+	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
+	PLL_36XX_RATE(65536000U, 131, 3, 4, 4719),
+	PLL_36XX_RATE(49152000U, 197, 3, 5, 25690),
+	PLL_36XX_RATE(32768000U, 131, 3, 5, 4719),
+};
+
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
 	[apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
@@ -1287,7 +1302,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 		CPLL_CON0, NULL),
 	[dpll] = PLL(pll_2550, CLK_FOUT_DPLL, "fout_dpll", "fin_pll", DPLL_LOCK,
 		DPLL_CON0, NULL),
-	[epll] = PLL(pll_2650, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
+	[epll] = PLL(pll_36xx, CLK_FOUT_EPLL, "fout_epll", "fin_pll", EPLL_LOCK,
 		EPLL_CON0, NULL),
 	[rpll] = PLL(pll_2650, CLK_FOUT_RPLL, "fout_rpll", "fin_pll", RPLL_LOCK,
 		RPLL_CON0, NULL),
@@ -1402,7 +1417,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 
 	if (_get_rate("fin_pll") == 24 * MHZ) {
 		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
-		exynos5x_plls[epll].rate_table = exynos5420_pll2550x_24mhz_tbl;
+		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[bpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 	}
-- 
1.9.1

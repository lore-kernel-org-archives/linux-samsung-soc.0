From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/9] clk: samsung: Remove clkdev alias support in Exynos5250
 clk driver
Date: Tue, 03 Oct 2017 12:00:11 +0200
Message-ID: <20171003100016.32029-5-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100030eucas1p1b47a46931ca138eb92d4950f44f6f737@eucas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

All Exynos5250 boards have been fully converted to device-tree and use
generic dt-based CPUfreq driver, so there is no need to create any clkdev
aliases for the clocks. Drop all the code related to aliases handling.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 27a227d6620c..9b073c98a891 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -293,14 +293,14 @@ static const struct samsung_mux_clock exynos5250_mux_clks[] __initconst = {
 	/*
 	 * CMU_CPU
 	 */
-	MUX_FA(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
-					CLK_SET_RATE_PARENT, 0, "mout_apll"),
-	MUX_A(0, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1, "mout_cpu"),
+	MUX_F(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
+					CLK_SET_RATE_PARENT, 0),
+	MUX(0, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
 
 	/*
 	 * CMU_CORE
 	 */
-	MUX_A(0, "mout_mpll", mout_mpll_p, SRC_CORE1, 8, 1, "mout_mpll"),
+	MUX(0, "mout_mpll", mout_mpll_p, SRC_CORE1, 8, 1),
 
 	/*
 	 * CMU_TOP
@@ -391,7 +391,7 @@ static const struct samsung_div_clock exynos5250_div_clks[] __initconst = {
 	 */
 	DIV(0, "div_arm", "mout_cpu", DIV_CPU0, 0, 3),
 	DIV(0, "div_apll", "mout_apll", DIV_CPU0, 24, 3),
-	DIV_A(0, "div_arm2", "div_arm", DIV_CPU0, 28, 3, "armclk"),
+	DIV(0, "div_arm2", "div_arm", DIV_CPU0, 28, 3),
 
 	/*
 	 * CMU_TOP
@@ -743,10 +743,10 @@ static const struct samsung_pll_rate_table apll_24mhz_tbl[] __initconst = {
 };
 
 static struct samsung_pll_clock exynos5250_plls[nr_plls] __initdata = {
-	[apll] = PLL_A(pll_35xx, CLK_FOUT_APLL, "fout_apll", "fin_pll",
-		APLL_LOCK, APLL_CON0, "fout_apll", NULL),
-	[mpll] = PLL_A(pll_35xx, CLK_FOUT_MPLL, "fout_mpll", "fin_pll",
-		MPLL_LOCK, MPLL_CON0, "fout_mpll", NULL),
+	[apll] = PLL(pll_35xx, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
+		APLL_CON0, NULL),
+	[mpll] = PLL(pll_35xx, CLK_FOUT_MPLL, "fout_mpll", "fin_pll", MPLL_LOCK,
+		MPLL_CON0, NULL),
 	[bpll] = PLL(pll_35xx, CLK_FOUT_BPLL, "fout_bpll", "fin_pll", BPLL_LOCK,
 		BPLL_CON0, NULL),
 	[gpll] = PLL(pll_35xx, CLK_FOUT_GPLL, "fout_gpll", "fin_pll", GPLL_LOCK,
-- 
2.14.2


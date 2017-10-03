From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/9] clk: samsung: Remove support for obsolete Exynos4212
 CPU clock
Date: Tue, 03 Oct 2017 12:00:08 +0200
Message-ID: <20171003100016.32029-2-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100029eucas1p2c706e911f316a58f35be7c443824f07c@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Support for Exynos 4212 SoC has been removed by commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
to keep dead code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 33 ++++-----------------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index e40b77583c47..9a51ce9a658f 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1401,24 +1401,6 @@ static const struct exynos_cpuclk_cfg_data e4210_armclk_d[] __initconst = {
 	{  0 },
 };
 
-static const struct exynos_cpuclk_cfg_data e4212_armclk_d[] __initconst = {
-	{ 1500000, E4210_CPU_DIV0(2, 1, 6, 0, 7, 3), E4210_CPU_DIV1(2, 6), },
-	{ 1400000, E4210_CPU_DIV0(2, 1, 6, 0, 7, 3), E4210_CPU_DIV1(2, 6), },
-	{ 1300000, E4210_CPU_DIV0(2, 1, 5, 0, 7, 3), E4210_CPU_DIV1(2, 5), },
-	{ 1200000, E4210_CPU_DIV0(2, 1, 5, 0, 7, 3), E4210_CPU_DIV1(2, 5), },
-	{ 1100000, E4210_CPU_DIV0(2, 1, 4, 0, 6, 3), E4210_CPU_DIV1(2, 4), },
-	{ 1000000, E4210_CPU_DIV0(1, 1, 4, 0, 5, 2), E4210_CPU_DIV1(2, 4), },
-	{  900000, E4210_CPU_DIV0(1, 1, 3, 0, 5, 2), E4210_CPU_DIV1(2, 3), },
-	{  800000, E4210_CPU_DIV0(1, 1, 3, 0, 5, 2), E4210_CPU_DIV1(2, 3), },
-	{  700000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
-	{  600000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
-	{  500000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
-	{  400000, E4210_CPU_DIV0(1, 1, 3, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
-	{  300000, E4210_CPU_DIV0(1, 1, 2, 0, 4, 2), E4210_CPU_DIV1(2, 3), },
-	{  200000, E4210_CPU_DIV0(1, 1, 1, 0, 3, 1), E4210_CPU_DIV1(2, 3), },
-	{  0 },
-};
-
 #define E4412_CPU_DIV1(cores, hpm, copy)				\
 		(((cores) << 8) | ((hpm) << 4) | ((copy) << 0))
 
@@ -1533,17 +1515,10 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4x12_fixed_factor_clks,
 			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
-		if (of_machine_is_compatible("samsung,exynos4412")) {
-			exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-				mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
-				e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
-				CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
-		} else {
-			exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-				mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
-				e4212_armclk_d, ARRAY_SIZE(e4212_armclk_d),
-				CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
-		}
+		exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
+			mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
+			e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
+			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
 	}
 
 	samsung_clk_register_alias(ctx, exynos4_aliases,
-- 
2.14.2


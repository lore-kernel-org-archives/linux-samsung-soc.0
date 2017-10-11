From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/5] clk: samsung: Instantiate Exynos4412 ISP clocks only
 when available
Date: Wed, 11 Oct 2017 11:25:11 +0200
Message-ID: <20171011092515.1698-2-m.szyprowski@samsung.com>
References: <20171011092515.1698-1-m.szyprowski@samsung.com>
        <CGME20171011092520eucas1p2a86dcd52a7c0c4b329563e5eaad3fd76@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171011092515.1698-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Some registers for the Exynos 4412 ISP (Camera subsystem) clocks are
located in the ISP power domain. Istatiate those clocks only when
provided clock registers resource covers those registers. This is
a preparation for adding a separate clock driver for ISP clocks,
which will be intergated with power domain using runtime PM feature.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos4.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index e40b77583c47..bdd68247e054 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -822,6 +822,12 @@ static const struct samsung_div_clock exynos4x12_div_clks[] __initconst = {
 	DIV(0, "div_spi1_isp", "mout_spi1_isp", E4X12_DIV_ISP, 16, 4),
 	DIV(0, "div_spi1_isp_pre", "div_spi1_isp", E4X12_DIV_ISP, 20, 8),
 	DIV(0, "div_uart_isp", "mout_uart_isp", E4X12_DIV_ISP, 28, 4),
+	DIV(CLK_SCLK_FIMG2D, "sclk_fimg2d", "mout_g2d", DIV_DMC1, 0, 4),
+	DIV(CLK_DIV_C2C, "div_c2c", "mout_c2c", DIV_DMC1, 4, 3),
+	DIV(0, "div_c2c_aclk", "div_c2c", DIV_DMC1, 12, 3),
+};
+
+static struct samsung_div_clock exynos4x12_isp_div_clks[] = {
 	DIV_F(CLK_DIV_ISP0, "div_isp0", "aclk200", E4X12_DIV_ISP0, 0, 3,
 						CLK_GET_RATE_NOCACHE, 0),
 	DIV_F(CLK_DIV_ISP1, "div_isp1", "aclk200", E4X12_DIV_ISP0, 4, 3,
@@ -831,9 +837,6 @@ static const struct samsung_div_clock exynos4x12_div_clks[] __initconst = {
 						4, 3, CLK_GET_RATE_NOCACHE, 0),
 	DIV_F(CLK_DIV_MCUISP1, "div_mcuisp1", "div_mcuisp0", E4X12_DIV_ISP1,
 						8, 3, CLK_GET_RATE_NOCACHE, 0),
-	DIV(CLK_SCLK_FIMG2D, "sclk_fimg2d", "mout_g2d", DIV_DMC1, 0, 4),
-	DIV(CLK_DIV_C2C, "div_c2c", "mout_c2c", DIV_DMC1, 4, 3),
-	DIV(0, "div_c2c_aclk", "div_c2c", DIV_DMC1, 12, 3),
 };
 
 /* list of gate clocks supported in all exynos4 soc's */
@@ -1132,6 +1135,13 @@ static const struct samsung_gate_clock exynos4x12_gate_clks[] __initconst = {
 			0, 0),
 	GATE(CLK_I2S0, "i2s0", "aclk100", E4X12_GATE_IP_MAUDIO, 3,
 			0, 0),
+	GATE(CLK_G2D, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
+	GATE(CLK_SMMU_G2D, "smmu_g2d", "aclk200", GATE_IP_DMC, 24, 0, 0),
+	GATE(CLK_TMU_APBIF, "tmu_apbif", "aclk100", E4X12_GATE_IP_PERIR, 17, 0,
+		0),
+};
+
+static struct samsung_gate_clock exynos4x12_isp_gate_clks[] = {
 	GATE(CLK_FIMC_ISP, "isp", "aclk200", E4X12_GATE_ISP0, 0,
 			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
 	GATE(CLK_FIMC_DRC, "drc", "aclk200", E4X12_GATE_ISP0, 1,
@@ -1184,10 +1194,6 @@ static const struct samsung_gate_clock exynos4x12_gate_clks[] __initconst = {
 			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
 	GATE(CLK_SPI1_ISP, "spi1_isp", "aclk200", E4X12_GATE_ISP1, 13,
 			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_G2D, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
-	GATE(CLK_SMMU_G2D, "smmu_g2d", "aclk200", GATE_IP_DMC, 24, 0, 0),
-	GATE(CLK_TMU_APBIF, "tmu_apbif", "aclk100", E4X12_GATE_IP_PERIR, 17, 0,
-		0),
 };
 
 static const struct samsung_clock_alias exynos4_aliases[] __initconst = {
@@ -1522,6 +1528,8 @@ static void __init exynos4_clk_init(struct device_node *np,
 			e4210_armclk_d, ARRAY_SIZE(e4210_armclk_d),
 			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
 	} else {
+		struct resource res;
+
 		samsung_clk_register_mux(ctx, exynos4x12_mux_clks,
 			ARRAY_SIZE(exynos4x12_mux_clks));
 		samsung_clk_register_div(ctx, exynos4x12_div_clks,
@@ -1533,6 +1541,15 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4x12_fixed_factor_clks,
 			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
+
+		of_address_to_resource(np, 0, &res);
+		if (resource_size(&res) > 0x18000) {
+			samsung_clk_register_div(ctx, exynos4x12_isp_div_clks,
+				ARRAY_SIZE(exynos4x12_isp_div_clks));
+			samsung_clk_register_gate(ctx, exynos4x12_isp_gate_clks,
+				ARRAY_SIZE(exynos4x12_isp_gate_clks));
+		}
+
 		if (of_machine_is_compatible("samsung,exynos4412")) {
 			exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
 				mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
-- 
2.14.2


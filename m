From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] clk: samsung: Remove obsolete code for Exynos4412 ISP
 clocks
Date: Mon, 02 Oct 2017 12:47:59 +0200
Message-ID: <20171002104759.25944-5-m.szyprowski@samsung.com>
References: <20171002104759.25944-1-m.szyprowski@samsung.com>
        <CGME20171002104826eucas1p17b7ea22d3984f1dea0e3efb45733d728@eucas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171002104759.25944-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos4412 ISP clock are provided by separate Exynos4412 ISP clock
driver, so support for them in Exynos4-clk driver can be removed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c   | 81 -------------------------------------
 include/dt-bindings/clock/exynos4.h | 30 --------------
 2 files changed, 111 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index bdd68247e054..69649dc6a9cf 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -123,10 +123,6 @@
 #define CLKOUT_CMU_CPU		0x14a00
 #define PWR_CTRL1		0x15020
 #define E4X12_PWR_CTRL2		0x15024
-#define E4X12_DIV_ISP0		0x18300
-#define E4X12_DIV_ISP1		0x18304
-#define E4X12_GATE_ISP0		0x18800
-#define E4X12_GATE_ISP1		0x18804
 
 /* Below definitions are used for PWR_CTRL settings */
 #define PWR_CTRL1_CORE2_DOWN_RATIO(x)		(((x) & 0x7) << 28)
@@ -827,18 +823,6 @@ static const struct samsung_div_clock exynos4x12_div_clks[] __initconst = {
 	DIV(0, "div_c2c_aclk", "div_c2c", DIV_DMC1, 12, 3),
 };
 
-static struct samsung_div_clock exynos4x12_isp_div_clks[] = {
-	DIV_F(CLK_DIV_ISP0, "div_isp0", "aclk200", E4X12_DIV_ISP0, 0, 3,
-						CLK_GET_RATE_NOCACHE, 0),
-	DIV_F(CLK_DIV_ISP1, "div_isp1", "aclk200", E4X12_DIV_ISP0, 4, 3,
-						CLK_GET_RATE_NOCACHE, 0),
-	DIV(0, "div_mpwm", "div_isp1", E4X12_DIV_ISP1, 0, 3),
-	DIV_F(CLK_DIV_MCUISP0, "div_mcuisp0", "aclk400_mcuisp", E4X12_DIV_ISP1,
-						4, 3, CLK_GET_RATE_NOCACHE, 0),
-	DIV_F(CLK_DIV_MCUISP1, "div_mcuisp1", "div_mcuisp0", E4X12_DIV_ISP1,
-						8, 3, CLK_GET_RATE_NOCACHE, 0),
-};
-
 /* list of gate clocks supported in all exynos4 soc's */
 static const struct samsung_gate_clock exynos4_gate_clks[] __initconst = {
 	/*
@@ -1141,61 +1125,6 @@ static const struct samsung_gate_clock exynos4x12_gate_clks[] __initconst = {
 		0),
 };
 
-static struct samsung_gate_clock exynos4x12_isp_gate_clks[] = {
-	GATE(CLK_FIMC_ISP, "isp", "aclk200", E4X12_GATE_ISP0, 0,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_FIMC_DRC, "drc", "aclk200", E4X12_GATE_ISP0, 1,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_FIMC_FD, "fd", "aclk200", E4X12_GATE_ISP0, 2,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_FIMC_LITE0, "lite0", "aclk200", E4X12_GATE_ISP0, 3,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_FIMC_LITE1, "lite1", "aclk200", E4X12_GATE_ISP0, 4,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_MCUISP, "mcuisp", "aclk200", E4X12_GATE_ISP0, 5,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_GICISP, "gicisp", "aclk200", E4X12_GATE_ISP0, 7,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SMMU_ISP, "smmu_isp", "aclk200", E4X12_GATE_ISP0, 8,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SMMU_DRC, "smmu_drc", "aclk200", E4X12_GATE_ISP0, 9,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SMMU_FD, "smmu_fd", "aclk200", E4X12_GATE_ISP0, 10,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SMMU_LITE0, "smmu_lite0", "aclk200", E4X12_GATE_ISP0, 11,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SMMU_LITE1, "smmu_lite1", "aclk200", E4X12_GATE_ISP0, 12,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_PPMUISPMX, "ppmuispmx", "aclk200", E4X12_GATE_ISP0, 20,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_PPMUISPX, "ppmuispx", "aclk200", E4X12_GATE_ISP0, 21,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_MCUCTL_ISP, "mcuctl_isp", "aclk200", E4X12_GATE_ISP0, 23,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_MPWM_ISP, "mpwm_isp", "aclk200", E4X12_GATE_ISP0, 24,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_I2C0_ISP, "i2c0_isp", "aclk200", E4X12_GATE_ISP0, 25,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_I2C1_ISP, "i2c1_isp", "aclk200", E4X12_GATE_ISP0, 26,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_MTCADC_ISP, "mtcadc_isp", "aclk200", E4X12_GATE_ISP0, 27,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_PWM_ISP, "pwm_isp", "aclk200", E4X12_GATE_ISP0, 28,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_WDT_ISP, "wdt_isp", "aclk200", E4X12_GATE_ISP0, 30,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_UART_ISP, "uart_isp", "aclk200", E4X12_GATE_ISP0, 31,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_ASYNCAXIM, "asyncaxim", "aclk200", E4X12_GATE_ISP1, 0,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SMMU_ISPCX, "smmu_ispcx", "aclk200", E4X12_GATE_ISP1, 4,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SPI0_ISP, "spi0_isp", "aclk200", E4X12_GATE_ISP1, 12,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-	GATE(CLK_SPI1_ISP, "spi1_isp", "aclk200", E4X12_GATE_ISP1, 13,
-			CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
-};
-
 static const struct samsung_clock_alias exynos4_aliases[] __initconst = {
 	ALIAS(CLK_MOUT_CORE, NULL, "moutcore"),
 	ALIAS(CLK_ARM_CLK, NULL, "armclk"),
@@ -1528,8 +1457,6 @@ static void __init exynos4_clk_init(struct device_node *np,
 			e4210_armclk_d, ARRAY_SIZE(e4210_armclk_d),
 			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
 	} else {
-		struct resource res;
-
 		samsung_clk_register_mux(ctx, exynos4x12_mux_clks,
 			ARRAY_SIZE(exynos4x12_mux_clks));
 		samsung_clk_register_div(ctx, exynos4x12_div_clks,
@@ -1542,14 +1469,6 @@ static void __init exynos4_clk_init(struct device_node *np,
 			exynos4x12_fixed_factor_clks,
 			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
 
-		of_address_to_resource(np, 0, &res);
-		if (resource_size(&res) > 0x18000) {
-			samsung_clk_register_div(ctx, exynos4x12_isp_div_clks,
-				ARRAY_SIZE(exynos4x12_isp_div_clks));
-			samsung_clk_register_gate(ctx, exynos4x12_isp_gate_clks,
-				ARRAY_SIZE(exynos4x12_isp_gate_clks));
-		}
-
 		if (of_machine_is_compatible("samsung,exynos4412")) {
 			exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
 				mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index bf44a7c5eccc..5106943a1fd0 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -190,32 +190,6 @@
 #define CLK_MIPI_HSI		349 /* Exynos4210 only */
 #define CLK_PIXELASYNCM0	351
 #define CLK_PIXELASYNCM1	352
-#define CLK_FIMC_LITE0		353 /* Exynos4x12 only */
-#define CLK_FIMC_LITE1		354 /* Exynos4x12 only */
-#define CLK_PPMUISPX		355 /* Exynos4x12 only */
-#define CLK_PPMUISPMX		356 /* Exynos4x12 only */
-#define CLK_FIMC_ISP		357 /* Exynos4x12 only */
-#define CLK_FIMC_DRC		358 /* Exynos4x12 only */
-#define CLK_FIMC_FD		359 /* Exynos4x12 only */
-#define CLK_MCUISP		360 /* Exynos4x12 only */
-#define CLK_GICISP		361 /* Exynos4x12 only */
-#define CLK_SMMU_ISP		362 /* Exynos4x12 only */
-#define CLK_SMMU_DRC		363 /* Exynos4x12 only */
-#define CLK_SMMU_FD		364 /* Exynos4x12 only */
-#define CLK_SMMU_LITE0		365 /* Exynos4x12 only */
-#define CLK_SMMU_LITE1		366 /* Exynos4x12 only */
-#define CLK_MCUCTL_ISP		367 /* Exynos4x12 only */
-#define CLK_MPWM_ISP		368 /* Exynos4x12 only */
-#define CLK_I2C0_ISP		369 /* Exynos4x12 only */
-#define CLK_I2C1_ISP		370 /* Exynos4x12 only */
-#define CLK_MTCADC_ISP		371 /* Exynos4x12 only */
-#define CLK_PWM_ISP		372 /* Exynos4x12 only */
-#define CLK_WDT_ISP		373 /* Exynos4x12 only */
-#define CLK_UART_ISP		374 /* Exynos4x12 only */
-#define CLK_ASYNCAXIM		375 /* Exynos4x12 only */
-#define CLK_SMMU_ISPCX		376 /* Exynos4x12 only */
-#define CLK_SPI0_ISP		377 /* Exynos4x12 only */
-#define CLK_SPI1_ISP		378 /* Exynos4x12 only */
 #define CLK_PWM_ISP_SCLK	379 /* Exynos4x12 only */
 #define CLK_SPI0_ISP_SCLK	380 /* Exynos4x12 only */
 #define CLK_SPI1_ISP_SCLK	381 /* Exynos4x12 only */
@@ -257,10 +231,6 @@
 #define CLK_PPMUACP		415
 
 /* div clocks */
-#define CLK_DIV_ISP0		450 /* Exynos4x12 only */
-#define CLK_DIV_ISP1		451 /* Exynos4x12 only */
-#define CLK_DIV_MCUISP0		452 /* Exynos4x12 only */
-#define CLK_DIV_MCUISP1		453 /* Exynos4x12 only */
 #define CLK_DIV_ACLK200		454 /* Exynos4x12 only */
 #define CLK_DIV_ACLK400_MCUISP	455 /* Exynos4x12 only */
 #define CLK_DIV_ACP		456
-- 
2.14.2


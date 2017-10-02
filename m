From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] ARM: dts: exynos: Add Exynos4412 ISP clock controller
Date: Mon, 02 Oct 2017 12:47:58 +0200
Message-ID: <20171002104759.25944-4-m.szyprowski@samsung.com>
References: <20171002104759.25944-1-m.szyprowski@samsung.com>
        <CGME20171002104826eucas1p15c0d0d9038e5b1119fd244ecab502d35@eucas1p1.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171002104759.25944-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos4412 ISP clock controller is located in the SOC area, which belongs
to ISP power domain. This patch instantiates a separate clock driver
for those clocks, updates all clients of ISP clocks and ensures that the
driver is properly integrated in ISP power domin.

This finally solves all the mysterious freezes in accessing ISP clocks
when ISP power domain is disabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 71 ++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 7ff03a7e8fb9..2a2f1e596672 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -191,10 +191,19 @@
 
 	clock: clock-controller@10030000 {
 		compatible = "samsung,exynos4412-clock";
-		reg = <0x10030000 0x20000>;
+		reg = <0x10030000 0x18000>;
 		#clock-cells = <1>;
 	};
 
+	isp_clock: clock-controller@10048000 {
+		compatible = "samsung,exynos4412-isp-clock";
+		reg = <0x10048000 0x1000>;
+		#clock-cells = <1>;
+		power-domains = <&pd_isp>;
+		clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
+		clock-names = "aclk200", "aclk400_mcuisp";
+	};
+
 	mct@10050000 {
 		compatible = "samsung,exynos4412-mct";
 		reg = <0x10050000 0x800>;
@@ -257,7 +266,7 @@
 			reg = <0x12390000 0x1000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_isp>;
-			clocks = <&clock CLK_FIMC_LITE0>;
+			clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
 			clock-names = "flite";
 			iommus = <&sysmmu_fimc_lite0>;
 			status = "disabled";
@@ -268,7 +277,7 @@
 			reg = <0x123A0000 0x1000>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_isp>;
-			clocks = <&clock CLK_FIMC_LITE1>;
+			clocks = <&isp_clock CLK_ISP_FIMC_LITE1>;
 			clock-names = "flite";
 			iommus = <&sysmmu_fimc_lite1>;
 			status = "disabled";
@@ -280,29 +289,35 @@
 			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_isp>;
-			clocks = <&clock CLK_FIMC_LITE0>,
-				 <&clock CLK_FIMC_LITE1>, <&clock CLK_PPMUISPX>,
-				 <&clock CLK_PPMUISPMX>,
+			clocks = <&isp_clock CLK_ISP_FIMC_LITE0>,
+				 <&isp_clock CLK_ISP_FIMC_LITE1>,
+				 <&isp_clock CLK_ISP_PPMUISPX>,
+				 <&isp_clock CLK_ISP_PPMUISPMX>,
+				 <&isp_clock CLK_ISP_FIMC_ISP>,
+				 <&isp_clock CLK_ISP_FIMC_DRC>,
+				 <&isp_clock CLK_ISP_FIMC_FD>,
+				 <&isp_clock CLK_ISP_MCUISP>,
+				 <&isp_clock CLK_ISP_GICISP>,
+				 <&isp_clock CLK_ISP_MCUCTL_ISP>,
+				 <&isp_clock CLK_ISP_PWM_ISP>,
+				 <&isp_clock CLK_ISP_DIV_ISP0>,
+				 <&isp_clock CLK_ISP_DIV_ISP1>,
+				 <&isp_clock CLK_ISP_DIV_MCUISP0>,
+				 <&isp_clock CLK_ISP_DIV_MCUISP1>,
 				 <&clock CLK_MOUT_MPLL_USER_T>,
-				 <&clock CLK_FIMC_ISP>, <&clock CLK_FIMC_DRC>,
-				 <&clock CLK_FIMC_FD>, <&clock CLK_MCUISP>,
-				 <&clock CLK_GICISP>, <&clock CLK_MCUCTL_ISP>,
-				 <&clock CLK_PWM_ISP>,
-				 <&clock CLK_DIV_ISP0>, <&clock CLK_DIV_ISP1>,
-				 <&clock CLK_DIV_MCUISP0>,
-				 <&clock CLK_DIV_MCUISP1>,
-				 <&clock CLK_UART_ISP_SCLK>,
-				 <&clock CLK_ACLK200>, <&clock CLK_DIV_ACLK200>,
+				 <&clock CLK_ACLK200>,
 				 <&clock CLK_ACLK400_MCUISP>,
-				 <&clock CLK_DIV_ACLK400_MCUISP>;
+				 <&clock CLK_DIV_ACLK200>,
+				 <&clock CLK_DIV_ACLK400_MCUISP>,
+				 <&clock CLK_UART_ISP_SCLK>;
 			clock-names = "lite0", "lite1", "ppmuispx",
-				      "ppmuispmx", "mpll", "isp",
+				      "ppmuispmx", "isp",
 				      "drc", "fd", "mcuisp",
 				      "gicisp", "mcuctl_isp", "pwm_isp",
 				      "ispdiv0", "ispdiv1", "mcuispdiv0",
-				      "mcuispdiv1", "uart", "aclk200",
-				      "div_aclk200", "aclk400mcuisp",
-				      "div_aclk400mcuisp";
+				      "mcuispdiv1", "mpll", "aclk200",
+				      "aclk400mcuisp", "div_aclk200",
+				      "div_aclk400mcuisp", "uart";
 			iommus = <&sysmmu_fimc_isp>, <&sysmmu_fimc_drc>,
 				 <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
 			iommu-names = "isp", "drc", "fd", "mcuctl";
@@ -318,7 +333,7 @@
 			i2c1_isp: i2c-isp@12140000 {
 				compatible = "samsung,exynos4212-i2c-isp";
 				reg = <0x12140000 0x100>;
-				clocks = <&clock CLK_I2C1_ISP>;
+				clocks = <&isp_clock CLK_ISP_I2C1_ISP>;
 				clock-names = "i2c_isp";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -355,7 +370,7 @@
 		interrupts = <16 2>;
 		power-domains = <&pd_isp>;
 		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_ISP>;
+		clocks = <&isp_clock CLK_ISP_SMMU_ISP>;
 		#iommu-cells = <0>;
 	};
 
@@ -366,7 +381,7 @@
 		interrupts = <16 3>;
 		power-domains = <&pd_isp>;
 		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_DRC>;
+		clocks = <&isp_clock CLK_ISP_SMMU_DRC>;
 		#iommu-cells = <0>;
 	};
 
@@ -377,7 +392,7 @@
 		interrupts = <16 4>;
 		power-domains = <&pd_isp>;
 		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FD>;
+		clocks = <&isp_clock CLK_ISP_SMMU_FD>;
 		#iommu-cells = <0>;
 	};
 
@@ -388,7 +403,7 @@
 		interrupts = <16 5>;
 		power-domains = <&pd_isp>;
 		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_ISPCX>;
+		clocks = <&isp_clock CLK_ISP_SMMU_ISPCX>;
 		#iommu-cells = <0>;
 	};
 
@@ -399,7 +414,8 @@
 		interrupts = <16 0>;
 		power-domains = <&pd_isp>;
 		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_LITE0>, <&clock CLK_FIMC_LITE0>;
+		clocks = <&isp_clock CLK_ISP_SMMU_LITE0>,
+			 <&isp_clock CLK_ISP_FIMC_LITE0>;
 		#iommu-cells = <0>;
 	};
 
@@ -410,7 +426,8 @@
 		interrupts = <16 1>;
 		power-domains = <&pd_isp>;
 		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_LITE1>, <&clock CLK_FIMC_LITE1>;
+		clocks = <&isp_clock CLK_ISP_SMMU_LITE1>,
+			 <&isp_clock CLK_ISP_FIMC_LITE1>;
 		#iommu-cells = <0>;
 	};
 
-- 
2.14.2


From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] arm64: dts: exynos: Fix IRQ type flags for Exynos5433 SoC
Date: Thu, 17 Nov 2016 15:27:29 +0100
Message-ID: <1479392849-18049-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39080 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934235AbcKQO1p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 09:27:45 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS02NE8IU6KUD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 23:27:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts. The
GIC requires shared interrupts to be edge rising or level high. Platform
declares support for both. Set all interrupts type to level high, as this
works fine - tested on Exynos5433-based TM2 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
Changelog:
v2:
- fixed also interrupts defined in exynos5433-pinctrl.dtsi
---
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |  22 +++-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 129 +++++++++++----------
 2 files changed, 85 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
index 796881310bf6..ad71247b074f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
@@ -40,9 +40,14 @@
 
 		interrupt-controller;
 		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 0 0>, <GIC_SPI 1 0>, <GIC_SPI 2 0>,
-			<GIC_SPI 3 0>, <GIC_SPI 4 0>, <GIC_SPI 5 0>,
-			<GIC_SPI 6 0>, <GIC_SPI 7 0>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 	};
 
@@ -52,9 +57,14 @@
 
 		interrupt-controller;
 		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 8 0>, <GIC_SPI 9 0>, <GIC_SPI 10 0>,
-			<GIC_SPI 11 0>, <GIC_SPI 12 0>, <GIC_SPI 13 0>,
-			<GIC_SPI 14 0>, <GIC_SPI 15 0>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 	};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 2a575af9e63e..64226d5ae471 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -528,7 +528,7 @@
 		tmu_atlas0: tmu@10060000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10060000 0x200>;
-			interrupts = <GIC_SPI 95 0>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU0_APBIF>,
 				<&cmu_peris CLK_SCLK_TMU0>;
 			clock-names = "tmu_apbif", "tmu_sclk";
@@ -539,7 +539,7 @@
 		tmu_atlas1: tmu@10068000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10068000 0x200>;
-			interrupts = <GIC_SPI 96 0>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU0_APBIF>,
 				<&cmu_peris CLK_SCLK_TMU0>;
 			clock-names = "tmu_apbif", "tmu_sclk";
@@ -550,7 +550,7 @@
 		tmu_g3d: tmu@10070000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10070000 0x200>;
-			interrupts = <GIC_SPI 99 0>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
 				<&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
@@ -561,7 +561,7 @@
 		tmu_apollo: tmu@10078000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x10078000 0x200>;
-			interrupts = <GIC_SPI 115 0>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
 				<&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
@@ -572,7 +572,7 @@
 		tmu_isp: tmu@1007c000 {
 			compatible = "samsung,exynos5433-tmu";
 			reg = <0x1007c000 0x200>;
-			interrupts = <GIC_SPI 94 0>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_PCLK_TMU1_APBIF>,
 				<&cmu_peris CLK_SCLK_TMU1>;
 			clock-names = "tmu_apbif", "tmu_sclk";
@@ -583,12 +583,18 @@
 		mct@101c0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x101c0000 0x800>;
-			interrupts = <GIC_SPI 102 0>, <GIC_SPI 103 0>,
-				<GIC_SPI 104 0>, <GIC_SPI 105 0>,
-				<GIC_SPI 106 0>, <GIC_SPI 107 0>,
-				<GIC_SPI 108 0>, <GIC_SPI 109 0>,
-				<GIC_SPI 110 0>, <GIC_SPI 111 0>,
-				<GIC_SPI 112 0>, <GIC_SPI 113 0>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&xxti>, <&cmu_peris CLK_PCLK_MCT>;
 			clock-names = "fin_pll", "mct";
 		};
@@ -599,62 +605,62 @@
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos7-wakeup-eint";
-				interrupts = <GIC_SPI 16 0>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
 		pinctrl_aud: pinctrl@114b0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x114b0000 0x1000>;
-			interrupts = <GIC_SPI 68 0>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_cpif: pinctrl@10fe0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x10fe0000 0x1000>;
-			interrupts = <GIC_SPI 179 0>;
+			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_ese: pinctrl@14ca0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x14ca0000 0x1000>;
-			interrupts = <GIC_SPI 413 0>;
+			interrupts = <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_finger: pinctrl@14cb0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x14cb0000 0x1000>;
-			interrupts = <GIC_SPI 414 0>;
+			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_fsys: pinctrl@15690000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x15690000 0x1000>;
-			interrupts = <GIC_SPI 229 0>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_imem: pinctrl@11090000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x11090000 0x1000>;
-			interrupts = <GIC_SPI 325 0>;
+			interrupts = <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_nfc: pinctrl@14cd0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x14cd0000 0x1000>;
-			interrupts = <GIC_SPI 441 0>;
+			interrupts = <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_peric: pinctrl@14cc0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x14cc0000 0x1100>;
-			interrupts = <GIC_SPI 440 0>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_touch: pinctrl@14ce0000 {
 			compatible = "samsung,exynos5433-pinctrl";
 			reg = <0x14ce0000 0x1100>;
-			interrupts = <GIC_SPI 442 0>;
+			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pmu_system_controller: system-controller@105c0000 {
@@ -699,8 +705,9 @@
 				"aclk_xiu_decon0x", "pclk_smmu_decon0x",
 				"sclk_decon_vclk", "sclk_decon_eclk";
 			interrupt-names = "fifo", "vsync", "lcd_sys";
-			interrupts = <GIC_SPI 201 0>, <GIC_SPI 202 0>,
-				   <GIC_SPI 203 0>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,disp-sysreg = <&syscon_disp>;
 			status = "disabled";
 			iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
@@ -723,7 +730,7 @@
 		dsi: dsi@13900000 {
 			compatible = "samsung,exynos5433-mipi-dsi";
 			reg = <0x13900000 0xC0>;
-			interrupts = <GIC_SPI 205 0>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&mipi_phy 1>;
 			phy-names = "dsim";
 			clocks = <&cmu_disp CLK_PCLK_DSIM0>,
@@ -864,7 +871,7 @@
 		sysmmu_decon0x: sysmmu@0x13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
-			interrupts = <GIC_SPI 192 0>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "pclk", "aclk";
 			clocks = <&cmu_disp CLK_PCLK_SMMU_DECON0X>,
 				<&cmu_disp CLK_ACLK_SMMU_DECON0X>;
@@ -874,7 +881,7 @@
 		sysmmu_decon1x: sysmmu@0x13a10000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a10000 0x1000>;
-			interrupts = <GIC_SPI 194 0>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "pclk", "aclk";
 			clocks = <&cmu_disp CLK_PCLK_SMMU_DECON1X>,
 				<&cmu_disp CLK_ACLK_SMMU_DECON1X>;
@@ -944,7 +951,7 @@
 		serial_0: serial@14c10000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c10000 0x100>;
-			interrupts = <GIC_SPI 421 0>;
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART0>,
 				<&cmu_peric CLK_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
@@ -956,7 +963,7 @@
 		serial_1: serial@14c20000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c20000 0x100>;
-			interrupts = <GIC_SPI 422 0>;
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART1>,
 				<&cmu_peric CLK_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
@@ -968,7 +975,7 @@
 		serial_2: serial@14c30000 {
 			compatible = "samsung,exynos5433-uart";
 			reg = <0x14c30000 0x100>;
-			interrupts = <GIC_SPI 423 0>;
+			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peric CLK_PCLK_UART2>,
 				<&cmu_peric CLK_SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
@@ -980,7 +987,7 @@
 		spi_0: spi@14d20000 {
 			compatible = "samsung,exynos5433-spi";
 			reg = <0x14d20000 0x100>;
-			interrupts = <GIC_SPI 432 0>;
+			interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma0 9>, <&pdma0 8>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
@@ -999,7 +1006,7 @@
 		spi_1: spi@14d30000 {
 			compatible = "samsung,exynos5433-spi";
 			reg = <0x14d30000 0x100>;
-			interrupts = <GIC_SPI 433 0>;
+			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma0 11>, <&pdma0 10>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
@@ -1018,7 +1025,7 @@
 		spi_2: spi@14d40000 {
 			compatible = "samsung,exynos5433-spi";
 			reg = <0x14d40000 0x100>;
-			interrupts = <GIC_SPI 434 0>;
+			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma0 13>, <&pdma0 12>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
@@ -1037,7 +1044,7 @@
 		spi_3: spi@14d50000 {
 			compatible = "samsung,exynos5433-spi";
 			reg = <0x14d50000 0x100>;
-			interrupts = <GIC_SPI 447 0>;
+			interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma0 23>, <&pdma0 22>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
@@ -1056,7 +1063,7 @@
 		spi_4: spi@14d00000 {
 			compatible = "samsung,exynos5433-spi";
 			reg = <0x14d00000 0x100>;
-			interrupts = <GIC_SPI 412 0>;
+			interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma0 25>, <&pdma0 24>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
@@ -1075,7 +1082,7 @@
 		adc: adc@14d10000 {
 			compatible = "samsung,exynos7-adc";
 			reg = <0x14d10000 0x100>;
-			interrupts = <GIC_SPI 438 0>;
+			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "adc";
 			clocks = <&cmu_peric CLK_PCLK_ADCIF>;
 			#io-channel-cells = <1>;
@@ -1086,9 +1093,11 @@
 		pwm: pwm@14dd0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x14dd0000 0x100>;
-			interrupts = <GIC_SPI 416 0>, <GIC_SPI 417 0>,
-				<GIC_SPI 418 0>, <GIC_SPI 419 0>,
-				<GIC_SPI 420 0>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			clocks = <&cmu_peric CLK_PCLK_PWM>;
 			clock-names = "timers";
@@ -1099,7 +1108,7 @@
 		hsi2c_0: hsi2c@14e40000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e40000 0x1000>;
-			interrupts = <GIC_SPI 428 0>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1112,7 +1121,7 @@
 		hsi2c_1: hsi2c@14e50000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e50000 0x1000>;
-			interrupts = <GIC_SPI 429 0>;
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1125,7 +1134,7 @@
 		hsi2c_2: hsi2c@14e60000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e60000 0x1000>;
-			interrupts = <GIC_SPI 430 0>;
+			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1138,7 +1147,7 @@
 		hsi2c_3: hsi2c@14e70000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14e70000 0x1000>;
-			interrupts = <GIC_SPI 431 0>;
+			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1151,7 +1160,7 @@
 		hsi2c_4: hsi2c@14ec0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ec0000 0x1000>;
-			interrupts = <GIC_SPI 424 0>;
+			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1164,7 +1173,7 @@
 		hsi2c_5: hsi2c@14ed0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ed0000 0x1000>;
-			interrupts = <GIC_SPI 425 0>;
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1177,7 +1186,7 @@
 		hsi2c_6: hsi2c@14ee0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ee0000 0x1000>;
-			interrupts = <GIC_SPI 426 0>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1190,7 +1199,7 @@
 		hsi2c_7: hsi2c@14ef0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14ef0000 0x1000>;
-			interrupts = <GIC_SPI 427 0>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1203,7 +1212,7 @@
 		hsi2c_8: hsi2c@14d90000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14d90000 0x1000>;
-			interrupts = <GIC_SPI 443 0>;
+			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1216,7 +1225,7 @@
 		hsi2c_9: hsi2c@14da0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14da0000 0x1000>;
-			interrupts = <GIC_SPI 444 0>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1229,7 +1238,7 @@
 		hsi2c_10: hsi2c@14de0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14de0000 0x1000>;
-			interrupts = <GIC_SPI 445 0>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1242,7 +1251,7 @@
 		hsi2c_11: hsi2c@14df0000 {
 			compatible = "samsung,exynos7-hsi2c";
 			reg = <0x14df0000 0x1000>;
-			interrupts = <GIC_SPI 446 0>;
+			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -1265,7 +1274,7 @@
 			dwc3@15400000 {
 				compatible = "snps,dwc3";
 				reg = <0x15400000 0x10000>;
-				interrupts = <GIC_SPI 231 0>;
+				interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
@@ -1312,7 +1321,7 @@
 			usbdrd_dwc3_0: dwc3@15a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x15a00000 0x10000>;
-				interrupts = <GIC_SPI 244 0>;
+				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbhost30_phy 0>, <&usbhost30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
@@ -1320,7 +1329,7 @@
 
 		mshc_0: mshc@15540000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
-			interrupts = <GIC_SPI 225 0>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x15540000 0x2000>;
@@ -1333,7 +1342,7 @@
 
 		mshc_1: mshc@15550000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
-			interrupts = <GIC_SPI 226 0>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x15550000 0x2000>;
@@ -1346,7 +1355,7 @@
 
 		mshc_2: mshc@15560000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
-			interrupts = <GIC_SPI 227 0>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x15560000 0x2000>;
@@ -1366,7 +1375,7 @@
 			pdma0: pdma@15610000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x15610000 0x1000>;
-				interrupts = <GIC_SPI 228 0>;
+				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cmu_fsys CLK_PDMA0>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
@@ -1377,7 +1386,7 @@
 			pdma1: pdma@15600000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x15600000 0x1000>;
-				interrupts = <GIC_SPI 246 0>;
+				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cmu_fsys CLK_PDMA1>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
@@ -1397,7 +1406,7 @@
 			adma: adma@11420000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x11420000 0x1000>;
-				interrupts = <GIC_SPI 73 0>;
+				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cmu_aud CLK_ACLK_DMAC>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
@@ -1410,7 +1419,7 @@
 				reg = <0x11440000 0x100>;
 				dmas = <&adma 0 &adma 2>;
 				dma-names = "tx", "rx";
-				interrupts = <GIC_SPI 70 0>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
@@ -1425,7 +1434,7 @@
 			serial_3: serial@11460000 {
 				compatible = "samsung,exynos5433-uart";
 				reg = <0x11460000 0x100>;
-				interrupts = <GIC_SPI 67 0>;
+				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
 					<&cmu_aud CLK_SCLK_AUD_UART>;
 				clock-names = "uart", "clk_uart_baud0";
-- 
1.9.1

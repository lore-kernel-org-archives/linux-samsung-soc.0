From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos: Add soc node to exynos5440
Date: Tue, 06 Feb 2018 12:31:50 +0100
Message-ID: <1517916710-13970-1-git-send-email-m.purski@samsung.com>
References: <CGME20180206113158eucas1p1c5cb146fb80116232d0d79634a48d210@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34481 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752246AbeBFLcC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 06:32:02 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

The exynos5440 device tree is the only one left, which does not use
"soc" node. Add a "soc" node to exynos5440.dtsi in order to make it
compatible with other exynos DTS.

Signed-off-by: Maciej Purski <m.purski@samsung.com>

---
Changes in v2:
- move the "thermal-zones" node outside the "soc" node
---
 arch/arm/boot/dts/exynos5440.dtsi | 514 +++++++++++++++++++-------------------
 1 file changed, 261 insertions(+), 253 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index fce9e26..f3abecc4 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -26,24 +26,6 @@
 		tmuctrl2 = &tmuctrl_2;
 	};
 
-	clock: clock-controller@160000 {
-		compatible = "samsung,exynos5440-clock";
-		reg = <0x160000 0x1000>;
-		#clock-cells = <1>;
-	};
-
-	gic: interrupt-controller@2e0000 {
-		compatible = "arm,cortex-a15-gic";
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		reg =	<0x2E1000 0x1000>,
-			<0x2E2000 0x2000>,
-			<0x2E4000 0x2000>,
-			<0x2E6000 0x2000>;
-		interrupts = <GIC_PPI 9
-				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -70,182 +52,290 @@
 		};
 	};
 
-	arm-pmu {
-		compatible = "arm,cortex-a15-pmu", "arm,cortex-a9-pmu";
-		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-	};
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
 
-	timer {
-		compatible = "arm,cortex-a15-timer",
-			     "arm,armv7-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-		clock-frequency = <50000000>;
-	};
+		clock: clock-controller@160000 {
+			compatible = "samsung,exynos5440-clock";
+			reg = <0x160000 0x1000>;
+			#clock-cells = <1>;
+		};
 
-	cpufreq@160000 {
-		compatible = "samsung,exynos5440-cpufreq";
-		reg = <0x160000 0x1000>;
-		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-		operating-points = <
-				/* KHz	  uV */
-				1500000 1100000
-				1400000 1075000
-				1300000 1050000
-				1200000 1025000
-				1100000 1000000
-				1000000 975000
-				900000  950000
-				800000  925000
-		>;
-	};
+		gic: interrupt-controller@2e0000 {
+			compatible = "arm,cortex-a15-gic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg =	<0x2E1000 0x1000>,
+				<0x2E2000 0x2000>,
+				<0x2E4000 0x2000>,
+				<0x2E6000 0x2000>;
+			interrupts = <GIC_PPI 9
+					(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
 
-	serial_0: serial@b0000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0xB0000 0x1000>;
-		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>, <&clock CLK_B_125>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
 
-	serial_1: serial@c0000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0xC0000 0x1000>;
-		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>, <&clock CLK_B_125>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
+		arm-pmu {
+			compatible = "arm,cortex-a15-pmu", "arm,cortex-a9-pmu";
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+		};
 
-	spi_0: spi@d0000 {
-		compatible = "samsung,exynos5440-spi";
-		reg = <0xD0000 0x100>;
-		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		samsung,spi-src-clk = <0>;
-		num-cs = <1>;
-		clocks = <&clock CLK_B_125>, <&clock CLK_SPI_BAUD>;
-		clock-names = "spi", "spi_busclk0";
-	};
+		timer {
+			compatible = "arm,cortex-a15-timer",
+				     "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			clock-frequency = <50000000>;
+		};
 
-	pin_ctrl: pinctrl@e0000 {
-		compatible = "samsung,exynos5440-pinctrl";
-		reg = <0xE0000 0x1000>;
-		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		#gpio-cells = <2>;
+		cpufreq@160000 {
+			compatible = "samsung,exynos5440-cpufreq";
+			reg = <0x160000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points = <
+					/* KHz	  uV */
+					1500000 1100000
+					1400000 1075000
+					1300000 1050000
+					1200000 1025000
+					1100000 1000000
+					1000000 975000
+					900000  950000
+					800000  925000
+			>;
+		};
 
-		fan: fan {
-			samsung,exynos5440-pin-function = <1>;
+		serial_0: serial@b0000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0xB0000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>, <&clock CLK_B_125>;
+			clock-names = "uart", "clk_uart_baud0";
 		};
 
-		hdd_led0: hdd_led0 {
-			samsung,exynos5440-pin-function = <2>;
+		serial_1: serial@c0000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0xC0000 0x1000>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>, <&clock CLK_B_125>;
+			clock-names = "uart", "clk_uart_baud0";
 		};
 
-		hdd_led1: hdd_led1 {
-			samsung,exynos5440-pin-function = <3>;
+		spi_0: spi@d0000 {
+			compatible = "samsung,exynos5440-spi";
+			reg = <0xD0000 0x100>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			samsung,spi-src-clk = <0>;
+			num-cs = <1>;
+			clocks = <&clock CLK_B_125>, <&clock CLK_SPI_BAUD>;
+			clock-names = "spi", "spi_busclk0";
 		};
 
-		uart1: uart1 {
-			samsung,exynos5440-pin-function = <4>;
+		pin_ctrl: pinctrl@e0000 {
+			compatible = "samsung,exynos5440-pinctrl";
+			reg = <0xE0000 0x1000>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#gpio-cells = <2>;
+
+			fan: fan {
+				samsung,exynos5440-pin-function = <1>;
+			};
+
+			hdd_led0: hdd_led0 {
+				samsung,exynos5440-pin-function = <2>;
+			};
+
+			hdd_led1: hdd_led1 {
+				samsung,exynos5440-pin-function = <3>;
+			};
+
+			uart1: uart1 {
+				samsung,exynos5440-pin-function = <4>;
+			};
 		};
-	};
 
-	i2c@f0000 {
-		compatible = "samsung,exynos5440-i2c";
-		reg = <0xF0000 0x1000>;
-		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "i2c";
-	};
+		i2c@f0000 {
+			compatible = "samsung,exynos5440-i2c";
+			reg = <0xF0000 0x1000>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "i2c";
+		};
 
-	i2c@100000 {
-		compatible = "samsung,exynos5440-i2c";
-		reg = <0x100000 0x1000>;
-		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "i2c";
-	};
+		i2c@100000 {
+			compatible = "samsung,exynos5440-i2c";
+			reg = <0x100000 0x1000>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "i2c";
+		};
 
-	watchdog@110000 {
-		compatible = "samsung,s3c6410-wdt";
-		reg = <0x110000 0x1000>;
-		interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "watchdog";
-	};
+		watchdog@110000 {
+			compatible = "samsung,s3c6410-wdt";
+			reg = <0x110000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "watchdog";
+		};
 
-	gmac: ethernet@230000 {
-		compatible = "snps,dwmac-3.70a", "snps,dwmac";
-		reg = <0x00230000 0x8000>;
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "macirq";
-		phy-mode = "sgmii";
-		clocks = <&clock CLK_GMAC0>;
-		clock-names = "stmmaceth";
-	};
+		gmac: ethernet@230000 {
+			compatible = "snps,dwmac-3.70a", "snps,dwmac";
+			reg = <0x00230000 0x8000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			phy-mode = "sgmii";
+			clocks = <&clock CLK_GMAC0>;
+			clock-names = "stmmaceth";
+		};
 
-	amba {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
-		ranges;
-	};
+		amba {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges;
+		};
 
-	rtc@130000 {
-		compatible = "samsung,s3c6410-rtc";
-		reg = <0x130000 0x1000>;
-		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "rtc";
-	};
+		rtc@130000 {
+			compatible = "samsung,s3c6410-rtc";
+			reg = <0x130000 0x1000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "rtc";
+		};
 
-	tmuctrl_0: tmuctrl@160118 {
-		compatible = "samsung,exynos5440-tmu";
-		reg = <0x160118 0x230>, <0x160368 0x10>;
-		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "tmu_apbif";
-		#include "exynos5440-tmu-sensor-conf.dtsi"
-	};
+		tmuctrl_0: tmuctrl@160118 {
+			compatible = "samsung,exynos5440-tmu";
+			reg = <0x160118 0x230>, <0x160368 0x10>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "tmu_apbif";
+			#include "exynos5440-tmu-sensor-conf.dtsi"
+		};
 
-	tmuctrl_1: tmuctrl@16011c {
-		compatible = "samsung,exynos5440-tmu";
-		reg = <0x16011C 0x230>, <0x160368 0x10>;
-		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "tmu_apbif";
-		#include "exynos5440-tmu-sensor-conf.dtsi"
-	};
+		tmuctrl_1: tmuctrl@16011c {
+			compatible = "samsung,exynos5440-tmu";
+			reg = <0x16011C 0x230>, <0x160368 0x10>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "tmu_apbif";
+			#include "exynos5440-tmu-sensor-conf.dtsi"
+		};
+
+		tmuctrl_2: tmuctrl@160120 {
+			compatible = "samsung,exynos5440-tmu";
+			reg = <0x160120 0x230>, <0x160368 0x10>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_B_125>;
+			clock-names = "tmu_apbif";
+			#include "exynos5440-tmu-sensor-conf.dtsi"
+		};
 
-	tmuctrl_2: tmuctrl@160120 {
-		compatible = "samsung,exynos5440-tmu";
-		reg = <0x160120 0x230>, <0x160368 0x10>;
-		interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_B_125>;
-		clock-names = "tmu_apbif";
-		#include "exynos5440-tmu-sensor-conf.dtsi"
+		sata@210000 {
+			compatible = "snps,exynos5440-ahci";
+			reg = <0x210000 0x10000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_SATA>;
+			clock-names = "sata";
+		};
+
+		ohci@220000 {
+			compatible = "samsung,exynos5440-ohci";
+			reg = <0x220000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_USB>;
+			clock-names = "usbhost";
+		};
+
+		ehci@221000 {
+			compatible = "samsung,exynos5440-ehci";
+			reg = <0x221000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_USB>;
+			clock-names = "usbhost";
+		};
+
+		pcie_phy0: pcie-phy@270000 {
+			#phy-cells = <0>;
+			compatible = "samsung,exynos5440-pcie-phy";
+			reg = <0x270000 0x1000>, <0x271000 0x40>;
+		};
+
+		pcie_phy1: pcie-phy@272000 {
+			#phy-cells = <0>;
+			compatible = "samsung,exynos5440-pcie-phy";
+			reg = <0x272000 0x1000>, <0x271040 0x40>;
+		};
+
+		pcie_0: pcie@290000 {
+			compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
+			reg = <0x290000 0x1000>, <0x40000000 0x1000>;
+			reg-names = "elbi", "config";
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_PR0_250_O>, <&clock CLK_PB0_250_O>;
+			clock-names = "pcie", "pcie_bus";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			phys = <&pcie_phy0>;
+			ranges = <0x81000000 0 0	  0x40001000 0 0x00010000   /* downstream I/O */
+				  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
+			bus-range = <0x00 0xff>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0x0 0 &gic 53>;
+			num-lanes = <4>;
+			status = "disabled";
+		};
+
+		pcie_1: pcie@2a0000 {
+			compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
+			reg = <0x2a0000 0x1000>, <0x60000000 0x1000>;
+			reg-names = "elbi", "config";
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_PR1_250_O>, <&clock CLK_PB0_250_O>;
+			clock-names = "pcie", "pcie_bus";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			phys = <&pcie_phy1>;
+			ranges = <0x81000000 0 0	  0x60001000 0 0x00010000   /* downstream I/O */
+				  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
+			bus-range = <0x00 0xff>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0x0 0 &gic 56>;
+			num-lanes = <4>;
+			status = "disabled";
+		};
 	};
 
 	thermal-zones {
@@ -262,86 +352,4 @@
 		       #include "exynos5440-trip-points.dtsi"
 		};
 	};
-
-	sata@210000 {
-		compatible = "snps,exynos5440-ahci";
-		reg = <0x210000 0x10000>;
-		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_SATA>;
-		clock-names = "sata";
-	};
-
-	ohci@220000 {
-		compatible = "samsung,exynos5440-ohci";
-		reg = <0x220000 0x1000>;
-		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_USB>;
-		clock-names = "usbhost";
-	};
-
-	ehci@221000 {
-		compatible = "samsung,exynos5440-ehci";
-		reg = <0x221000 0x1000>;
-		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_USB>;
-		clock-names = "usbhost";
-	};
-
-	pcie_phy0: pcie-phy@270000 {
-		#phy-cells = <0>;
-		compatible = "samsung,exynos5440-pcie-phy";
-		reg = <0x270000 0x1000>, <0x271000 0x40>;
-	};
-
-	pcie_phy1: pcie-phy@272000 {
-		#phy-cells = <0>;
-		compatible = "samsung,exynos5440-pcie-phy";
-		reg = <0x272000 0x1000>, <0x271040 0x40>;
-	};
-
-	pcie_0: pcie@290000 {
-		compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
-		reg = <0x290000 0x1000>, <0x40000000 0x1000>;
-		reg-names = "elbi", "config";
-		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_PR0_250_O>, <&clock CLK_PB0_250_O>;
-		clock-names = "pcie", "pcie_bus";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		phys = <&pcie_phy0>;
-		ranges = <0x81000000 0 0	  0x40001000 0 0x00010000   /* downstream I/O */
-			  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
-		bus-range = <0x00 0xff>;
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0x0 0 &gic 53>;
-		num-lanes = <4>;
-		status = "disabled";
-	};
-
-	pcie_1: pcie@2a0000 {
-		compatible = "samsung,exynos5440-pcie", "snps,dw-pcie";
-		reg = <0x2a0000 0x1000>, <0x60000000 0x1000>;
-		reg-names = "elbi", "config";
-		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_PR1_250_O>, <&clock CLK_PB0_250_O>;
-		clock-names = "pcie", "pcie_bus";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		phys = <&pcie_phy1>;
-		ranges = <0x81000000 0 0	  0x60001000 0 0x00010000   /* downstream I/O */
-			  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
-		bus-range = <0x00 0xff>;
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0x0 0 &gic 56>;
-		num-lanes = <4>;
-		status = "disabled";
-	};
 };
-- 
2.7.4

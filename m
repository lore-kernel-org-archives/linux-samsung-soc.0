From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 5/8] ARM: dts: refactor Odroid DTS file and add support for
 Odroid X2 and U2/U3
Date: Mon, 14 Jul 2014 14:48:23 +0200
Message-ID: <1405342106-10585-6-git-send-email-m.szyprowski@samsung.com>
References: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29050 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754837AbaGNMsl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:48:41 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8P0095OCWT9R70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Jul 2014 13:48:29 +0100 (BST)
In-reply-to: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

This patch moves some parts of exynos4412-odroidx.dts to common
exynos4412-odroid-common.dtsi file and adds support for Odroid X2 and
U2/U3 boards. X2 is same as X, but it has faster SoC module (1.7GHz
instead of 1.4GHz), while U2/U3 differs from X2 by different way of
routing signals to host USB hub. It also lacks some hw modules not yet
supported by those dts files (i.e. LCD & touch panel).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/Makefile                         |   2 +
 ...2-odroidx.dts => exynos4412-odroid-common.dtsi} |  57 +---
 arch/arm/boot/dts/exynos4412-odroidu3.dts          |  49 ++++
 arch/arm/boot/dts/exynos4412-odroidx.dts           | 326 +--------------------
 arch/arm/boot/dts/exynos4412-odroidx2.dts          |  23 ++
 5 files changed, 89 insertions(+), 368 deletions(-)
 copy arch/arm/boot/dts/{exynos4412-odroidx.dts => exynos4412-odroid-common.dtsi} (86%)
 create mode 100644 arch/arm/boot/dts/exynos4412-odroidu3.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-odroidx2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index adb5ed9e269e..ed2f4e115134 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -66,7 +66,9 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
 	exynos4210-universal_c210.dtb \
+	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
+	exynos4412-odroidx2.dtb \
 	exynos4412-origen.dtb \
 	exynos4412-smdk4412.dtb \
 	exynos4412-tiny4412.dtb \
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
similarity index 86%
copy from arch/arm/boot/dts/exynos4412-odroidx.dts
copy to arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index bcf331543fb0..f793f3b8f0b9 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -1,48 +1,20 @@
 /*
- * Hardkernel's Exynos4412 based ODROID-X board device tree source
- *
- * Copyright (c) 2012 Dongjin Kim <tobetter@gmail.com>
- *
- * Device tree source file for Hardkernel's ODROID-X board which is based on
- * Samsung's Exynos4412 SoC.
+ * Common definition for Hardkernel's Exynos4412 based ODROID-X/X2/U2/U3 boards
+ * device tree source
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
 */
 
-/dts-v1/;
 #include "exynos4412.dtsi"
 
 / {
-	model = "Hardkernel ODROID-X board based on Exynos4412";
-	compatible = "hardkernel,odroid-x", "samsung,exynos4412", "samsung,exynos4";
-
-	memory {
-		reg = <0x40000000 0x3FF00000>;
-	};
-
 	firmware@0204F000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0204F000 0x1000>;
 	};
 
-	leds {
-		compatible = "gpio-leds";
-		led1 {
-			label = "led1:heart";
-			gpios = <&gpc1 0 1>;
-			default-state = "on";
-			linux,default-trigger = "heartbeat";
-		};
-		led2 {
-			label = "led2:mmc0";
-			gpios = <&gpc1 2 1>;
-			default-state = "on";
-			linux,default-trigger = "mmc0";
-		};
-	};
-
 	mmc@12550000 {
 		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
 		pinctrl-names = "default";
@@ -63,16 +35,6 @@
 		};
 	};
 
-	regulator_p3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "p3v3_en";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpa1 1 1>;
-		enable-active-high;
-		regulator-boot-on;
-	};
-
 	watchdog@10060000 {
 		status = "okay";
 	};
@@ -123,14 +85,6 @@
 		status = "okay";
 	};
 
-	serial@13820000 {
-		status = "okay";
-	};
-
-	serial@13830000 {
-		status = "okay";
-	};
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -148,7 +102,7 @@
 		pinctrl-names = "default";
 		status = "okay";
 
-		usb3503@08 {
+		usb3503: usb3503@08 {
 			compatible = "smsc,usb3503";
 			reg = <0x08>;
 
@@ -359,10 +313,7 @@
 		vusb_a-supply = <&ldo12_reg>;
 	};
 
-	ehci@12580000 {
+	ehci: ehci@12580000 {
 		status = "okay";
-		port@1 {
-			status = "okay";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
new file mode 100644
index 000000000000..287aa0d1f978
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -0,0 +1,49 @@
+/*
+ * Hardkernel's Exynos4412 based ODROID-U3 board device tree source
+ *
+ * Copyright (c) 2014 Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U3 board which is based
+ * on Samsung's Exynos4412 SoC.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+#include "exynos4412-odroid-common.dtsi"
+
+/ {
+	model = "Hardkernel ODROID-U3 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u3", "samsung,exynos4412", "samsung,exynos4";
+
+	memory {
+		reg = <0x40000000 0x7FF00000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			label = "led1:heart";
+			gpios = <&gpc1 0 1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&usb3503 {
+	clock-names = "refclk";
+	clocks = <&pmu_system_controller 0>;
+	refclk-frequency = <24000000>;
+};
+
+&ehci {
+	port@1 {
+		status = "okay";
+	};
+	port@2 {
+		status = "okay";
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index bcf331543fb0..8b453a31410d 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -3,8 +3,8 @@
  *
  * Copyright (c) 2012 Dongjin Kim <tobetter@gmail.com>
  *
- * Device tree source file for Hardkernel's ODROID-X board which is based on
- * Samsung's Exynos4412 SoC.
+ * Device tree source file for Hardkernel's ODROID-X board which is based
+ * on Samsung's Exynos4412 SoC.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -12,7 +12,7 @@
 */
 
 /dts-v1/;
-#include "exynos4412.dtsi"
+#include "exynos4412-odroid-common.dtsi"
 
 / {
 	model = "Hardkernel ODROID-X board based on Exynos4412";
@@ -22,11 +22,6 @@
 		reg = <0x40000000 0x3FF00000>;
 	};
 
-	firmware@0204F000 {
-		compatible = "samsung,secure-firmware";
-		reg = <0x0204F000 0x1000>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 		led1 {
@@ -43,24 +38,12 @@
 		};
 	};
 
-	mmc@12550000 {
-		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
-		pinctrl-names = "default";
-		vmmc-supply = <&ldo20_reg &buck8_reg>;
+	serial@13820000 {
 		status = "okay";
+	};
 
-		num-slots = <1>;
-		supports-highspeed;
-		broken-cd;
-		card-detect-delay = <200>;
-		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3>;
-		samsung,dw-mshc-ddr-timing = <1 2>;
-
-		slot@0 {
-			reg = <0>;
-			bus-width = <8>;
-		};
+	serial@13830000 {
+		status = "okay";
 	};
 
 	regulator_p3v3 {
@@ -70,299 +53,12 @@
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpa1 1 1>;
 		enable-active-high;
-		regulator-boot-on;
-	};
-
-	watchdog@10060000 {
-		status = "okay";
-	};
-
-	rtc@10070000 {
-		status = "okay";
-	};
-
-	g2d@10800000 {
-		status = "okay";
-	};
-
-	camera {
-		status = "okay";
-		pinctrl-names = "default";
-		pinctrl-0 = <>;
-
-		fimc_0: fimc@11800000 {
-			status = "okay";
-		};
-
-		fimc_1: fimc@11810000 {
-			status = "okay";
-		};
-
-		fimc_2: fimc@11820000 {
-			status = "okay";
-		};
-
-		fimc_3: fimc@11830000 {
-			status = "okay";
-		};
-	};
-
-	sdhci@12530000 {
-		bus-width = <4>;
-		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-		pinctrl-names = "default";
-		vmmc-supply = <&ldo4_reg &ldo21_reg>;
-		status = "okay";
-	};
-
-	serial@13800000 {
-		status = "okay";
-	};
-
-	serial@13810000 {
-		status = "okay";
-	};
-
-	serial@13820000 {
-		status = "okay";
-	};
-
-	serial@13830000 {
-		status = "okay";
-	};
-
-	fixed-rate-clocks {
-		xxti {
-			compatible = "samsung,clock-xxti";
-			clock-frequency = <0>;
-		};
-
-		xusbxti {
-			compatible = "samsung,clock-xusbxti";
-			clock-frequency = <24000000>;
-		};
-	};
-
-	i2c@13860000 {
-		pinctrl-0 = <&i2c0_bus>;
-		pinctrl-names = "default";
-		status = "okay";
-
-		usb3503@08 {
-			compatible = "smsc,usb3503";
-			reg = <0x08>;
-
-			intn-gpios = <&gpx3 0 0>;
-			connect-gpios = <&gpx3 4 0>;
-			reset-gpios = <&gpx3 5 0>;
-			initial-mode = <1>;
-		};
-
-		max77686: pmic@09 {
-			compatible = "maxim,max77686";
-			reg = <0x09>;
-			#clock-cells = <1>;
-
-			voltage-regulators {
-				ldo1_reg: LDO1 {
-					regulator-name = "VDD_ALIVE_1.0V";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				ldo2_reg: LDO2 {
-					regulator-name = "VDDQ_M1_2_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo3_reg: LDO3 {
-					regulator-name = "VDDQ_EXT_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo4_reg: LDO4 {
-					regulator-name = "VDDQ_MMC2_2.8V";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo5_reg: LDO5 {
-					regulator-name = "VDDQ_MMC1_3_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo6_reg: LDO6 {
-					regulator-name = "VDD10_MPLL_1.0V";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				ldo7_reg: LDO7 {
-					regulator-name = "VDD10_XPLL_1.0V";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				ldo11_reg: LDO11 {
-					regulator-name = "VDD18_ABB1_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo12_reg: LDO12 {
-					regulator-name = "VDD33_USB_3.3V";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo13_reg: LDO13 {
-					regulator-name = "VDDQ_C2C_W_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo14_reg: LDO14 {
-					regulator-name = "VDD18_ABB0_2_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo15_reg: LDO15 {
-					regulator-name = "VDD10_HSIC_1.0V";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo16_reg: LDO16 {
-					regulator-name = "VDD18_HSIC_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo20_reg: LDO20 {
-					regulator-name = "LDO20_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-boot-on;
-				};
-
-				ldo21_reg: LDO21 {
-					regulator-name = "LDO21_3.3V";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo25_reg: LDO25 {
-					regulator-name = "VDDQ_LCD_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck1_reg: BUCK1 {
-					regulator-name = "vdd_mif";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck2_reg: BUCK2 {
-					regulator-name = "vdd_arm";
-					regulator-min-microvolt = <900000>;
-					regulator-max-microvolt = <1350000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck3_reg: BUCK3 {
-					regulator-name = "vdd_int";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck4_reg: BUCK4 {
-					regulator-name = "vdd_g3d";
-					regulator-min-microvolt = <900000>;
-					regulator-max-microvolt = <1100000>;
-					regulator-microvolt-offset = <50000>;
-				};
-
-				buck5_reg: BUCK5 {
-					regulator-name = "VDDQ_CKEM1_2_1.2V";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck6_reg: BUCK6 {
-					regulator-name = "BUCK6_1.35V";
-					regulator-min-microvolt = <1350000>;
-					regulator-max-microvolt = <1350000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck7_reg: BUCK7 {
-					regulator-name = "BUCK7_2.0V";
-					regulator-min-microvolt = <2000000>;
-					regulator-max-microvolt = <2000000>;
-					regulator-always-on;
-				};
-
-				buck8_reg: BUCK8 {
-					regulator-name = "BUCK8_2.8V";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					regulator-always-on;
-				};
-			};
-		};
-	};
-
-	exynos-usbphy@125B0000 {
-		status = "okay";
-	};
-
-	hsotg@12480000 {
-		status = "okay";
-		vusb_d-supply = <&ldo15_reg>;
-		vusb_a-supply = <&ldo12_reg>;
+		regulator-always-on;
 	};
+};
 
-	ehci@12580000 {
+&ehci {
+	port@1 {
 		status = "okay";
-		port@1 {
-			status = "okay";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos4412-odroidx2.dts b/arch/arm/boot/dts/exynos4412-odroidx2.dts
new file mode 100644
index 000000000000..e9ae161a4117
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-odroidx2.dts
@@ -0,0 +1,23 @@
+/*
+ * Hardkernel's Exynos4412 based ODROID-X2 board device tree source
+ *
+ * Copyright (c) 2012 Dongjin Kim <tobetter@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-X2 board which is based
+ * on Samsung's Exynos4412 SoC.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include "exynos4412-odroidx.dts"
+
+/ {
+	model = "Hardkernel ODROID-X2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-x2", "samsung,exynos4412", "samsung,exynos4";
+
+	memory {
+		reg = <0x40000000 0x7FF00000>;
+	};
+};
-- 
1.9.2

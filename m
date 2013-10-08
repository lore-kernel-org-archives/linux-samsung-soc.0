From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ARM: dts: Rename Exynos5250 ChromeOS common file to have exynos prefix
Date: Tue,  8 Oct 2013 12:20:08 +0100
Message-ID: <1381231209-9273-4-git-send-email-broonie@kernel.org>
References: <1381231209-9273-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52057 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050Ab3JHLUs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 07:20:48 -0400
In-Reply-To: <1381231209-9273-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Make it easier to notice the common file for ChromeOS devices based on
the Exynos5250 by giving it the exynos5250 prefix that the boards have.

Signed-off-by: Mark Brown <broonie@linaro.org>
Acked-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi        | 313 --------------------------
 arch/arm/boot/dts/exynos5250-cros-common.dtsi | 313 ++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-snow.dts         |   2 +-
 3 files changed, 314 insertions(+), 314 deletions(-)
 delete mode 100644 arch/arm/boot/dts/cros5250-common.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5250-cros-common.dtsi

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
deleted file mode 100644
index 7dbba08..0000000
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ /dev/null
@@ -1,313 +0,0 @@
-/*
- * Common device tree include for all Exynos 5250 boards based off of Daisy.
- *
- * Copyright (c) 2012 Google, Inc
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-/ {
-	aliases {
-	};
-
-	memory {
-		reg = <0x40000000 0x80000000>;
-	};
-
-	chosen {
-	};
-
-	pinctrl@11400000 {
-		/*
-		 * Disabled pullups since external part has its own pullups and
-		 * double-pulling gets us out of spec in some cases.
-		 */
-		i2c2_bus: i2c2-bus {
-			samsung,pin-pud = <0>;
-		};
-	};
-
-	i2c@12C60000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <378000>;
-
-		max77686@09 {
-			compatible = "maxim,max77686";
-			reg = <0x09>;
-
-			voltage-regulators {
-				ldo1_reg: LDO1 {
-					regulator-name = "P1.0V_LDO_OUT1";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				ldo2_reg: LDO2 {
-					regulator-name = "P1.8V_LDO_OUT2";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo3_reg: LDO3 {
-					regulator-name = "P1.8V_LDO_OUT3";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo7_reg: LDO7 {
-					regulator-name = "P1.1V_LDO_OUT7";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					regulator-always-on;
-				};
-
-				ldo8_reg: LDO8 {
-					regulator-name = "P1.0V_LDO_OUT8";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				ldo10_reg: LDO10 {
-					regulator-name = "P1.8V_LDO_OUT10";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo12_reg: LDO12 {
-					regulator-name = "P3.0V_LDO_OUT12";
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-					regulator-always-on;
-				};
-
-				ldo14_reg: LDO14 {
-					regulator-name = "P1.8V_LDO_OUT14";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				ldo15_reg: LDO15 {
-					regulator-name = "P1.0V_LDO_OUT15";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				ldo16_reg: LDO16 {
-					regulator-name = "P1.8V_LDO_OUT16";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				buck1_reg: BUCK1 {
-					regulator-name = "vdd_mif";
-					regulator-min-microvolt = <950000>;
-					regulator-max-microvolt = <1300000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck2_reg: BUCK2 {
-					regulator-name = "vdd_arm";
-					regulator-min-microvolt = <850000>;
-					regulator-max-microvolt = <1350000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck3_reg: BUCK3 {
-					regulator-name = "vdd_int";
-					regulator-min-microvolt = <900000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck4_reg: BUCK4 {
-					regulator-name = "vdd_g3d";
-					regulator-min-microvolt = <850000>;
-					regulator-max-microvolt = <1300000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck5_reg: BUCK5 {
-					regulator-name = "P1.8V_BUCK_OUT5";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				buck6_reg: BUCK6 {
-					regulator-name = "P1.35V_BUCK_OUT6";
-					regulator-min-microvolt = <1350000>;
-					regulator-max-microvolt = <1350000>;
-					regulator-always-on;
-				};
-
-				buck7_reg: BUCK7 {
-					regulator-name = "P2.0V_BUCK_OUT7";
-					regulator-min-microvolt = <2000000>;
-					regulator-max-microvolt = <2000000>;
-					regulator-always-on;
-				};
-
-				buck8_reg: BUCK8 {
-					regulator-name = "P2.85V_BUCK_OUT8";
-					regulator-min-microvolt = <2850000>;
-					regulator-max-microvolt = <2850000>;
-					regulator-always-on;
-				};
-			};
-		};
-	};
-
-	i2c@12C70000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <378000>;
-
-		trackpad {
-			reg = <0x67>;
-			compatible = "cypress,cyapa";
-			interrupts = <2 0>;
-			interrupt-parent = <&gpx1>;
-			wakeup-source;
-		};
-	};
-
-	i2c@12C80000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <66000>;
-
-		hdmiddc@50 {
-			compatible = "samsung,exynos4210-hdmiddc";
-			reg = <0x50>;
-		};
-	};
-
-	i2c@12C90000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <66000>;
-	};
-
-	i2c@12CA0000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <66000>;
-	};
-
-	i2c@12CB0000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <66000>;
-	};
-
-	i2c@12CD0000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <66000>;
-	};
-
-	i2c@12CE0000 {
-		status = "okay";
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-max-bus-freq = <378000>;
-
-		hdmiphy@38 {
-			compatible = "samsung,exynos4212-hdmiphy";
-			reg = <0x38>;
-		};
-	};
-
-	dwmmc0@12200000 {
-		num-slots = <1>;
-		supports-highspeed;
-		broken-cd;
-		fifo-depth = <0x80>;
-		card-detect-delay = <200>;
-		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3>;
-		samsung,dw-mshc-ddr-timing = <1 2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8>;
-
-		slot@0 {
-			reg = <0>;
-			bus-width = <8>;
-		};
-	};
-
-	dwmmc1@12210000 {
-		status = "disabled";
-	};
-
-	dwmmc2@12220000 {
-		num-slots = <1>;
-		supports-highspeed;
-		fifo-depth = <0x80>;
-		card-detect-delay = <200>;
-		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3>;
-		samsung,dw-mshc-ddr-timing = <1 2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-
-		slot@0 {
-			reg = <0>;
-			bus-width = <4>;
-			wp-gpios = <&gpc2 1 0>;
-		};
-	};
-
-	dwmmc3@12230000 {
-		num-slots = <1>;
-		supports-highspeed;
-		broken-cd;
-		fifo-depth = <0x80>;
-		card-detect-delay = <200>;
-		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3>;
-		samsung,dw-mshc-ddr-timing = <1 2>;
-		/* See board-specific dts files for pin setup */
-
-		slot@0 {
-			reg = <0>;
-			bus-width = <4>;
-		};
-	};
-
-	spi_1: spi@12d30000 {
-		status = "okay";
-		samsung,spi-src-clk = <0>;
-		num-cs = <1>;
-	};
-
-	hdmi {
-		hpd-gpio = <&gpx3 7 0>;
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		power {
-			label = "Power";
-			gpios = <&gpx1 3 1>;
-			linux,code = <116>; /* KEY_POWER */
-			gpio-key,wakeup;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/exynos5250-cros-common.dtsi b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
new file mode 100644
index 0000000..7dbba08
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
@@ -0,0 +1,313 @@
+/*
+ * Common device tree include for all Exynos 5250 boards based off of Daisy.
+ *
+ * Copyright (c) 2012 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/ {
+	aliases {
+	};
+
+	memory {
+		reg = <0x40000000 0x80000000>;
+	};
+
+	chosen {
+	};
+
+	pinctrl@11400000 {
+		/*
+		 * Disabled pullups since external part has its own pullups and
+		 * double-pulling gets us out of spec in some cases.
+		 */
+		i2c2_bus: i2c2-bus {
+			samsung,pin-pud = <0>;
+		};
+	};
+
+	i2c@12C60000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <378000>;
+
+		max77686@09 {
+			compatible = "maxim,max77686";
+			reg = <0x09>;
+
+			voltage-regulators {
+				ldo1_reg: LDO1 {
+					regulator-name = "P1.0V_LDO_OUT1";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo2_reg: LDO2 {
+					regulator-name = "P1.8V_LDO_OUT2";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo3_reg: LDO3 {
+					regulator-name = "P1.8V_LDO_OUT3";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo7_reg: LDO7 {
+					regulator-name = "P1.1V_LDO_OUT7";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+				};
+
+				ldo8_reg: LDO8 {
+					regulator-name = "P1.0V_LDO_OUT8";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo10_reg: LDO10 {
+					regulator-name = "P1.8V_LDO_OUT10";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo12_reg: LDO12 {
+					regulator-name = "P3.0V_LDO_OUT12";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
+				};
+
+				ldo14_reg: LDO14 {
+					regulator-name = "P1.8V_LDO_OUT14";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo15_reg: LDO15 {
+					regulator-name = "P1.0V_LDO_OUT15";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				ldo16_reg: LDO16 {
+					regulator-name = "P1.8V_LDO_OUT16";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				buck1_reg: BUCK1 {
+					regulator-name = "vdd_mif";
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck2_reg: BUCK2 {
+					regulator-name = "vdd_arm";
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck3_reg: BUCK3 {
+					regulator-name = "vdd_int";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck4_reg: BUCK4 {
+					regulator-name = "vdd_g3d";
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck5_reg: BUCK5 {
+					regulator-name = "P1.8V_BUCK_OUT5";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				buck6_reg: BUCK6 {
+					regulator-name = "P1.35V_BUCK_OUT6";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+				};
+
+				buck7_reg: BUCK7 {
+					regulator-name = "P2.0V_BUCK_OUT7";
+					regulator-min-microvolt = <2000000>;
+					regulator-max-microvolt = <2000000>;
+					regulator-always-on;
+				};
+
+				buck8_reg: BUCK8 {
+					regulator-name = "P2.85V_BUCK_OUT8";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+			};
+		};
+	};
+
+	i2c@12C70000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <378000>;
+
+		trackpad {
+			reg = <0x67>;
+			compatible = "cypress,cyapa";
+			interrupts = <2 0>;
+			interrupt-parent = <&gpx1>;
+			wakeup-source;
+		};
+	};
+
+	i2c@12C80000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4210-hdmiddc";
+			reg = <0x50>;
+		};
+	};
+
+	i2c@12C90000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+	};
+
+	i2c@12CA0000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+	};
+
+	i2c@12CB0000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+	};
+
+	i2c@12CD0000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+	};
+
+	i2c@12CE0000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <378000>;
+
+		hdmiphy@38 {
+			compatible = "samsung,exynos4212-hdmiphy";
+			reg = <0x38>;
+		};
+	};
+
+	dwmmc0@12200000 {
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
+		fifo-depth = <0x80>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
+	dwmmc1@12210000 {
+		status = "disabled";
+	};
+
+	dwmmc2@12220000 {
+		num-slots = <1>;
+		supports-highspeed;
+		fifo-depth = <0x80>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+			wp-gpios = <&gpc2 1 0>;
+		};
+	};
+
+	dwmmc3@12230000 {
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
+		fifo-depth = <0x80>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		/* See board-specific dts files for pin setup */
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+		};
+	};
+
+	spi_1: spi@12d30000 {
+		status = "okay";
+		samsung,spi-src-clk = <0>;
+		num-cs = <1>;
+	};
+
+	hdmi {
+		hpd-gpio = <&gpx3 7 0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpx1 3 1>;
+			linux,code = <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fd711e2..7e2669c 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -10,7 +10,7 @@
 
 /dts-v1/;
 #include "exynos5250.dtsi"
-#include "cros5250-common.dtsi"
+#include "exynos5250-cros-common.dtsi"
 
 / {
 	model = "Google Snow";
-- 
1.8.4.rc3

From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] ARM: dts: Use labels for overriding nodes in exynos4210-universal
Date: Thu, 11 Jun 2015 21:00:56 +0900
Message-ID: <1434024056-20337-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f196.google.com ([209.85.192.196]:34870 "EHLO
	mail-pd0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884AbbFKMBo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 08:01:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Usage of labels instead of full paths reduces possible mistakes when
overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

---

This one was missed during last label refactor. Rebased on Kukjin's
for-next.

Tested by comparison of DTB and decompiled DTS.
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 614 ++++++++++++------------
 1 file changed, 307 insertions(+), 307 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d4f2b11319dd..ce1949b40912 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -69,66 +69,6 @@
 		enable-active-high;
 	};
 
-	hsotg@12480000 {
-		vusb_d-supply = <&ldo3_reg>;
-		vusb_a-supply = <&ldo8_reg>;
-		dr_mode = "peripheral";
-		status = "okay";
-	};
-
-	sdhci_emmc: sdhci@12510000 {
-		bus-width = <8>;
-		non-removable;
-		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
-		pinctrl-names = "default";
-		vmmc-supply = <&vemmc_reg>;
-		status = "okay";
-	};
-
-	sdhci_sd: sdhci@12530000 {
-		bus-width = <4>;
-		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
-		pinctrl-names = "default";
-		vmmc-supply = <&ldo5_reg>;
-		cd-gpios = <&gpx3 4 0>;
-		cd-inverted;
-		status = "okay";
-	};
-
-	ehci@12580000 {
-		status = "okay";
-		port@0 {
-			status = "okay";
-		};
-	};
-
-	ohci@12590000 {
-		status = "okay";
-		port@0 {
-			status = "okay";
-		};
-	};
-
-	exynos-usbphy@125B0000 {
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
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -186,218 +126,6 @@
 		enable-active-high;
 	};
 
-	i2c@13890000 {
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-slave-addr = <0x10>;
-		samsung,i2c-max-bus-freq = <100000>;
-		pinctrl-0 = <&i2c3_bus>;
-		pinctrl-names = "default";
-		status = "okay";
-
-		tsp@4a {
-			/* TBD: Atmel maXtouch touchscreen */
-			reg = <0x4a>;
-		};
-	};
-
-	i2c@138B0000 {
-		samsung,i2c-sda-delay = <100>;
-		samsung,i2c-slave-addr = <0x10>;
-		samsung,i2c-max-bus-freq = <100000>;
-		pinctrl-0 = <&i2c5_bus>;
-		pinctrl-names = "default";
-		status = "okay";
-
-		vdd_arm_reg: pmic@60 {
-			compatible = "maxim,max8952";
-			reg = <0x60>;
-
-			max8952,vid-gpios = <&gpx0 3 0>, <&gpx0 4 0>;
-			max8952,default-mode = <0>;
-			max8952,dvs-mode-microvolt = <1250000>, <1200000>,
-							<1050000>, <950000>;
-			max8952,sync-freq = <0>;
-			max8952,ramp-speed = <0>;
-
-			regulator-name = "vdd_arm";
-			regulator-min-microvolt = <770000>;
-			regulator-max-microvolt = <1400000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		pmic@66 {
-			compatible = "national,lp3974";
-			reg = <0x66>;
-
-			max8998,pmic-buck1-default-dvs-idx = <0>;
-			max8998,pmic-buck1-dvs-gpios = <&gpx0 5 0>,
-							<&gpx0 6 0>;
-			max8998,pmic-buck1-dvs-voltage = <1100000>, <1000000>,
-							<1100000>, <1000000>;
-
-			max8998,pmic-buck2-default-dvs-idx = <0>;
-			max8998,pmic-buck2-dvs-gpio = <&gpe2 0 0>;
-			max8998,pmic-buck2-dvs-voltage = <1200000>, <1100000>;
-
-			regulators {
-				ldo2_reg: LDO2 {
-					regulator-name = "VALIVE_1.2V";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-				};
-
-				ldo3_reg: LDO3 {
-					regulator-name = "VUSB+MIPI_1.1V";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					regulator-always-on;
-				};
-
-				ldo4_reg: LDO4 {
-					regulator-name = "VADC_3.3V";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-				};
-
-				ldo5_reg: LDO5 {
-					regulator-name = "VTF_2.8V";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-				};
-
-				ldo6_reg: LDO6 {
-					regulator-name = "LDO6";
-					regulator-min-microvolt = <2000000>;
-					regulator-max-microvolt = <2000000>;
-				};
-
-				ldo7_reg: LDO7 {
-					regulator-name = "VLCD+VMIPI_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				ldo8_reg: LDO8 {
-					regulator-name = "VUSB+VDAC_3.3V";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-always-on;
-				};
-
-				ldo9_reg: LDO9 {
-					regulator-name = "VCC_2.8V";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					regulator-always-on;
-				};
-
-				ldo10_reg: LDO10 {
-					regulator-name = "VPLL_1.1V";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					regulator-boot-on;
-					regulator-always-on;
-				};
-
-				ldo11_reg: LDO11 {
-					regulator-name = "CAM_AF_3.3V";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-				};
-
-				ldo12_reg: LDO12 {
-					regulator-name = "PS_2.8V";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-				};
-
-				ldo13_reg: LDO13 {
-					regulator-name = "VHIC_1.2V";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-				};
-
-				ldo14_reg: LDO14 {
-					regulator-name = "CAM_I_HOST_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				ldo15_reg: LDO15 {
-					regulator-name = "CAM_S_DIG+FM33_CORE_1.2V";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-				};
-
-				ldo16_reg: LDO16 {
-					regulator-name = "CAM_S_ANA_2.8V";
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-				};
-
-				ldo17_reg: LDO17 {
-					regulator-name = "VCC_3.0V_LCD";
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-				};
-
-				buck1_reg: BUCK1 {
-					regulator-name = "VINT_1.1V";
-					regulator-min-microvolt = <750000>;
-					regulator-max-microvolt = <1500000>;
-					regulator-boot-on;
-					regulator-always-on;
-				};
-
-				buck2_reg: BUCK2 {
-					regulator-name = "VG3D_1.1V";
-					regulator-min-microvolt = <750000>;
-					regulator-max-microvolt = <1500000>;
-					regulator-boot-on;
-				};
-
-				buck3_reg: BUCK3 {
-					regulator-name = "VCC_1.8V";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-
-				buck4_reg: BUCK4 {
-					regulator-name = "VMEM_1.2V";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-				};
-
-				ap32khz_reg: EN32KHz-AP {
-					regulator-name = "32KHz AP";
-					regulator-always-on;
-				};
-
-				cp32khz_reg: EN32KHz-CP {
-					regulator-name = "32KHz CP";
-				};
-
-				vichg_reg: ENVICHG {
-					regulator-name = "VICHG";
-				};
-
-				safeout1_reg: ESAFEOUT1 {
-					regulator-name = "SAFEOUT1";
-					regulator-always-on;
-				};
-
-				safeout2_reg: ESAFEOUT2 {
-					regulator-name = "SAFEOUT2";
-					regulator-boot-on;
-				};
-			};
-		};
-	};
-
 	spi-lcd {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
@@ -446,27 +174,6 @@
 		};
 	};
 
-	fimd: fimd@11c00000 {
-		pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
-		pinctrl-names = "default";
-		status = "okay";
-		samsung,invert-vden;
-		samsung,invert-vclk;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@3 {
-			reg = <3>;
-			fimd_dpi_ep: endpoint {
-				remote-endpoint = <&lcd_ep>;
-			};
-		};
-	};
-
-	pwm@139D0000 {
-		compatible = "samsung,s5p6440-pwm";
-		status = "okay";
-	};
-
 	camera {
 		status = "okay";
 
@@ -526,24 +233,281 @@
 		pinctrl-names = "default";
 		status = "okay";
 	};
+};
 
-	mixer@12C10000 {
+&ehci {
+	status = "okay";
+	port@0 {
 		status = "okay";
 	};
+};
 
-	hdmi@12D00000 {
-		hpd-gpio = <&gpx3 7 0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_hpd>;
-		hdmi-en-supply = <&hdmi_en>;
-		vdd-supply = <&ldo3_reg>;
-		vdd_osc-supply = <&ldo4_reg>;
-		vdd_pll-supply = <&ldo3_reg>;
-		ddc = <&hdmi_ddc>;
-		status = "okay";
+&exynos_usbphy {
+	status = "okay";
+};
+
+&fimd {
+	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
+	pinctrl-names = "default";
+	status = "okay";
+	samsung,invert-vden;
+	samsung,invert-vclk;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	port@3 {
+		reg = <3>;
+		fimd_dpi_ep: endpoint {
+			remote-endpoint = <&lcd_ep>;
+		};
+	};
+};
+
+&hdmi {
+	hpd-gpio = <&gpx3 7 0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd>;
+	hdmi-en-supply = <&hdmi_en>;
+	vdd-supply = <&ldo3_reg>;
+	vdd_osc-supply = <&ldo4_reg>;
+	vdd_pll-supply = <&ldo3_reg>;
+	ddc = <&hdmi_ddc>;
+	status = "okay";
+};
+
+&hsotg {
+	vusb_d-supply = <&ldo3_reg>;
+	vusb_a-supply = <&ldo8_reg>;
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&i2c_3 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	tsp@4a {
+		/* TBD: Atmel maXtouch touchscreen */
+		reg = <0x4a>;
+	};
+};
+
+&i2c_5 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_arm_reg: pmic@60 {
+		compatible = "maxim,max8952";
+		reg = <0x60>;
+
+		max8952,vid-gpios = <&gpx0 3 0>, <&gpx0 4 0>;
+		max8952,default-mode = <0>;
+		max8952,dvs-mode-microvolt = <1250000>, <1200000>,
+						<1050000>, <950000>;
+		max8952,sync-freq = <0>;
+		max8952,ramp-speed = <0>;
+
+		regulator-name = "vdd_arm";
+		regulator-min-microvolt = <770000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-always-on;
+		regulator-boot-on;
 	};
 
-	i2c@138E0000 {
+	pmic@66 {
+		compatible = "national,lp3974";
+		reg = <0x66>;
+
+		max8998,pmic-buck1-default-dvs-idx = <0>;
+		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 0>,
+						<&gpx0 6 0>;
+		max8998,pmic-buck1-dvs-voltage = <1100000>, <1000000>,
+						<1100000>, <1000000>;
+
+		max8998,pmic-buck2-default-dvs-idx = <0>;
+		max8998,pmic-buck2-dvs-gpio = <&gpe2 0 0>;
+		max8998,pmic-buck2-dvs-voltage = <1200000>, <1100000>;
+
+		regulators {
+			ldo2_reg: LDO2 {
+				regulator-name = "VALIVE_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "VUSB+MIPI_1.1V";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "VADC_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "VTF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "LDO6";
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+			};
+
+			ldo7_reg: LDO7 {
+				regulator-name = "VLCD+VMIPI_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo8_reg: LDO8 {
+				regulator-name = "VUSB+VDAC_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			ldo9_reg: LDO9 {
+				regulator-name = "VCC_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name = "VPLL_1.1V";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo11_reg: LDO11 {
+				regulator-name = "CAM_AF_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo12_reg: LDO12 {
+				regulator-name = "PS_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo13_reg: LDO13 {
+				regulator-name = "VHIC_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			ldo14_reg: LDO14 {
+				regulator-name = "CAM_I_HOST_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo15_reg: LDO15 {
+				regulator-name = "CAM_S_DIG+FM33_CORE_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			ldo16_reg: LDO16 {
+				regulator-name = "CAM_S_ANA_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo17_reg: LDO17 {
+				regulator-name = "VCC_3.0V_LCD";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name = "VINT_1.1V";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "VG3D_1.1V";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name = "VCC_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name = "VMEM_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			ap32khz_reg: EN32KHz-AP {
+				regulator-name = "32KHz AP";
+				regulator-always-on;
+			};
+
+			cp32khz_reg: EN32KHz-CP {
+				regulator-name = "32KHz CP";
+			};
+
+			vichg_reg: ENVICHG {
+				regulator-name = "VICHG";
+			};
+
+			safeout1_reg: ESAFEOUT1 {
+				regulator-name = "SAFEOUT1";
+				regulator-always-on;
+			};
+
+			safeout2_reg: ESAFEOUT2 {
+				regulator-name = "SAFEOUT2";
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&i2c_8 {
+	status = "okay";
+};
+
+&mdma1 {
+	reg = <0x12840000 0x1000>;
+};
+
+&mixer {
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+	port@0 {
 		status = "okay";
 	};
 };
@@ -564,6 +528,42 @@
 	};
 };
 
-&mdma1 {
-	reg = <0x12840000 0x1000>;
+&pwm {
+	compatible = "samsung,s5p6440-pwm";
+	status = "okay";
+};
+
+&sdhci_0 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
+	pinctrl-names = "default";
+	vmmc-supply = <&vemmc_reg>;
+	status = "okay";
+};
+
+&sdhci_2 {
+	bus-width = <4>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
+	pinctrl-names = "default";
+	vmmc-supply = <&ldo5_reg>;
+	cd-gpios = <&gpx3 4 0>;
+	cd-inverted;
+	status = "okay";
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&serial_1 {
+	status = "okay";
+};
+
+&serial_2 {
+	status = "okay";
+};
+
+&serial_3 {
+	status = "okay";
 };
-- 
2.1.4

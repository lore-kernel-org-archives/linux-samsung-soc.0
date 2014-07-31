From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 0/4] ARM: dts: exynos: Prepare Spring
Date: Thu, 31 Jul 2014 18:21:51 +0200
Message-ID: <53DA6D1F.3040102@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030601000900020207040104"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36424 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbaGaQVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 12:21:54 -0400
In-Reply-To: <1406822910-6255-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

This is a multi-part message in MIME format.
--------------030601000900020207040104
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 31.07.2014 18:08, schrieb Andreas Färber:
> Hello,
> 
> Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15 
> based attempts by Stephan and me that broke for 3.16, I've prepared a 
> device tree for the HP Chromebook 11 aka Google Spring.
> 
> v4 fixes a pinctrl bug.

Once again, resulting Snow vs. Spring diff attached for convenience.

Andreas

-- 
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imendörffer; HRB 16746 AG Nürnberg

--------------030601000900020207040104
Content-Type: text/x-patch;
 name="spring-snow.v4.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="spring-snow.v4.diff"

--- arch/arm/boot/dts/exynos5250-snow.dts	2014-07-31 18:10:49.680004102 +0200
+++ arch/arm/boot/dts/exynos5250-spring.dts	2014-07-31 18:10:51.100004102 +0200
@@ -1,12 +1,13 @@
 /*
- * Google Snow board device tree source
+ * Google Spring board device tree source
  *
- * Copyright (c) 2012 Google, Inc
+ * Copyright (c) 2013 Google, Inc
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
-*/
+ */
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
@@ -14,26 +15,21 @@
 #include "exynos5250.dtsi"
 
 / {
-	model = "Google Snow";
-	compatible = "google,snow", "samsung,exynos5250", "samsung,exynos5";
-
-	aliases {
-		i2c104 = &i2c_104;
-	};
+	model = "Google Spring";
+	compatible = "google,spring", "samsung,exynos5250", "samsung,exynos5";
 
 	memory {
 		reg = <0x40000000 0x80000000>;
 	};
 
 	chosen {
-	};
-
-	rtc@101E0000 {
-		status = "okay";
+		bootargs = "console=tty1";
 	};
 
 	gpio-keys {
 		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&power_key_irq>, <&lid_irq>;
 
 		power {
 			label = "Power";
@@ -52,145 +48,12 @@
 		};
 	};
 
-	vbat: vbat-fixed-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vbat-supply";
-		regulator-boot-on;
-	};
-
-	i2c-arbitrator {
-		compatible = "i2c-arb-gpio-challenge";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c-parent = <&{/i2c@12CA0000}>;
-
-		our-claim-gpio = <&gpf0 3 GPIO_ACTIVE_LOW>;
-		their-claim-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
-		slew-delay-us = <10>;
-		wait-retry-us = <3000>;
-		wait-free-us = <50000>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&arb_our_claim &arb_their_claim>;
-
-		/* Use ID 104 as a hint that we're on physical bus 4 */
-		i2c_104: i2c@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			battery: sbs-battery@b {
-				compatible = "sbs,sbs-battery";
-				reg = <0xb>;
-				sbs,poll-retry-count = <1>;
-			};
-
-			cros_ec: embedded-controller {
-				compatible = "google,cros-ec-i2c";
-				reg = <0x1e>;
-				interrupts = <6 0>;
-				interrupt-parent = <&gpx1>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&ec_irq>;
-				wakeup-source;
-			};
-
-			power-regulator {
-				compatible = "ti,tps65090";
-				reg = <0x48>;
-
-				/*
-				 * Config irq to disable internal pulls
-				 * even though we run in polling mode.
-				 */
-				pinctrl-names = "default";
-				pinctrl-0 = <&tps65090_irq>;
-
-				vsys1-supply = <&vbat>;
-				vsys2-supply = <&vbat>;
-				vsys3-supply = <&vbat>;
-				infet1-supply = <&vbat>;
-				infet2-supply = <&vbat>;
-				infet3-supply = <&vbat>;
-				infet4-supply = <&vbat>;
-				infet5-supply = <&vbat>;
-				infet6-supply = <&vbat>;
-				infet7-supply = <&vbat>;
-				vsys-l1-supply = <&vbat>;
-				vsys-l2-supply = <&vbat>;
-
-				regulators {
-					dcdc1 {
-						ti,enable-ext-control;
-					};
-					dcdc2 {
-						ti,enable-ext-control;
-					};
-					dcdc3 {
-						ti,enable-ext-control;
-					};
-					fet1 {
-						regulator-name = "vcd_led";
-						ti,overcurrent-wait = <3>;
-					};
-					tps65090_fet2: fet2 {
-						regulator-name = "video_mid";
-						regulator-always-on;
-						ti,overcurrent-wait = <3>;
-					};
-					fet3 {
-						regulator-name = "wwan_r";
-						regulator-always-on;
-						ti,overcurrent-wait = <3>;
-					};
-					fet4 {
-						regulator-name = "sdcard";
-						ti,overcurrent-wait = <3>;
-					};
-					fet5 {
-						regulator-name = "camout";
-						regulator-always-on;
-						ti,overcurrent-wait = <3>;
-					};
-					fet6 {
-						regulator-name = "lcd_vdd";
-						ti,overcurrent-wait = <3>;
-					};
-					tps65090_fet7: fet7 {
-						regulator-name = "video_mid_1a";
-						regulator-always-on;
-						ti,overcurrent-wait = <3>;
-					};
-					ldo1 {
-					};
-					ldo2 {
-					};
-				};
-
-				charger {
-					compatible = "ti,tps65090-charger";
-				};
-			};
-		};
-	};
-
-	sound {
-		compatible = "google,snow-audio-max98095";
-
-		samsung,model = "Snow-I2S-MAX98095";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&max98095>;
-	};
-
 	usb3_vbus_reg: regulator-usb3 {
 		compatible = "regulator-fixed";
 		regulator-name = "P5.0V_USB3CON";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpx2 7 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&usb3_vbus_en>;
+		gpio = <&gpe1 0 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
 
@@ -198,6 +61,11 @@
 		samsung,vbus-gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
 	};
 
+	usb-hub {
+		compatible = "smsc,usb3503a";
+		reset-gpios = <&hsic_reset>;
+	};
+
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -211,19 +79,10 @@
 		pinctrl-0 = <&hdmi_hpd_irq>;
 		phy = <&hdmiphy>;
 		ddc = <&i2c_2>;
-		hdmi-en-supply = <&tps65090_fet7>;
-		vdd-supply = <&ldo8_reg>;
-		vdd_osc-supply = <&ldo10_reg>;
-		vdd_pll-supply = <&ldo8_reg>;
-	};
-
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 0 1000000 0>;
-		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
-		default-brightness-level = <7>;
-		pinctrl-0 = <&pwm0_out>;
-		pinctrl-names = "default";
+		hdmi-en-supply = <&s5m_ldo8_reg>;
+		vdd-supply = <&s5m_ldo8_reg>;
+		vdd_osc-supply = <&s5m_ldo10_reg>;
+		vdd_pll-supply = <&s5m_ldo8_reg>;
 	};
 
 	fimd@14400000 {
@@ -240,172 +99,241 @@
 		samsung,ycbcr-coeff = <0>;
 		samsung,color-depth = <1>;
 		samsung,link-rate = <0x0a>;
-		samsung,lane-count = <2>;
-		samsung,hpd-gpio = <&gpx0 7 GPIO_ACTIVE_HIGH>;
-
-		display-timings {
-			native-mode = <&timing1>;
-
-			timing1: timing@1 {
-				clock-frequency = <70589280>;
-				hactive = <1366>;
-				vactive = <768>;
-				hfront-porch = <40>;
-				hback-porch = <40>;
-				hsync-len = <32>;
-				vback-porch = <10>;
-				vfront-porch = <12>;
-				vsync-len = <6>;
-			};
-		};
+		samsung,lane-count = <1>;
+		samsung,hpd-gpio = <&gpc3 0 GPIO_ACTIVE_HIGH>;
 	};
 };
 
+&dp_hpd {
+	samsung,pins = "gpc3-0";
+	samsung,pin-function = <0>;
+	samsung,pin-pud = <3>;
+	samsung,pin-drv = <0>;
+};
+
 &i2c_0 {
 	status = "okay";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
 
-	max77686@09 {
-		compatible = "maxim,max77686";
+	s5m8767-pmic@66 {
+		compatible = "samsung,s5m8767-pmic";
+		reg = <0x66>;
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 0>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&max77686_irq>;
+		pinctrl-0 = <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>;
 		wakeup-source;
-		reg = <0x09>;
-		#clock-cells = <1>;
 
-		voltage-regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "P1.0V_LDO_OUT1";
+		s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>, /* DVS1 */
+		                              <&gpd1 1 GPIO_ACTIVE_LOW>, /* DVS2 */
+		                              <&gpd1 2 GPIO_ACTIVE_LOW>; /* DVS3 */
+
+		s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>, /* SET1 */
+		                             <&gpx2 4 GPIO_ACTIVE_LOW>, /* SET2 */
+		                             <&gpx2 5 GPIO_ACTIVE_LOW>; /* SET3 */
+
+		/*
+		 * The following arrays of DVS voltages are not used, since we are
+		 * not using GPIOs to control PMIC bucks, but they must be defined
+		 * to please the driver.
+		 */
+		s5m8767,pmic-buck2-dvs-voltage = <1350000>, <1300000>,
+		                                 <1250000>, <1200000>,
+		                                 <1150000>, <1100000>,
+		                                 <1000000>, <950000>;
+
+		s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
+		                                 <1100000>, <1100000>,
+		                                 <1000000>, <1000000>,
+		                                 <1000000>, <1000000>;
+
+		s5m8767,pmic-buck4-dvs-voltage = <1200000>, <1200000>,
+		                                 <1200000>, <1200000>,
+		                                 <1200000>, <1200000>,
+		                                 <1200000>, <1200000>;
+
+		clocks {
+			compatible = "samsung,s5m8767-clk";
+			#clock-cells = <1>;
+			clock-output-names = "en32khz_ap",
+			                     "en32khz_cp",
+			                     "en32khz_bt";
+		};
+
+		regulators {
+			s5m_ldo4_reg: LDO4 {
+				regulator-name = "P1.0V_LDO_OUT4";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+				op_mode = <0>;
 			};
 
-			ldo2_reg: LDO2 {
-				regulator-name = "P1.8V_LDO_OUT2";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
+			s5m_ldo5_reg: LDO5 {
+				regulator-name = "P1.0V_LDO_OUT5";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+				op_mode = <0>;
 			};
 
-			ldo3_reg: LDO3 {
-				regulator-name = "P1.8V_LDO_OUT3";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
+			s5m_ldo6_reg: LDO6 {
+				regulator-name = "vdd_mydp";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+				op_mode = <3>;
 			};
 
-			ldo7_reg: LDO7 {
+			s5m_ldo7_reg: LDO7 {
 				regulator-name = "P1.1V_LDO_OUT7";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+				op_mode = <3>;
 			};
 
-			ldo8_reg: LDO8 {
+			s5m_ldo8_reg: LDO8 {
 				regulator-name = "P1.0V_LDO_OUT8";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+				op_mode = <3>;
 			};
 
-			ldo10_reg: LDO10 {
+			s5m_ldo10_reg: LDO10 {
 				regulator-name = "P1.8V_LDO_OUT10";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+				op_mode = <3>;
 			};
 
-			ldo12_reg: LDO12 {
+			s5m_ldo11_reg: LDO11 {
+				regulator-name = "P1.8V_LDO_OUT11";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				op_mode = <0>;
+			};
+
+			s5m_ldo12_reg: LDO12 {
 				regulator-name = "P3.0V_LDO_OUT12";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-always-on;
+				op_mode = <3>;
+			};
+
+			s5m_ldo13_reg: LDO13 {
+				regulator-name = "P1.8V_LDO_OUT13";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				op_mode = <0>;
 			};
 
-			ldo14_reg: LDO14 {
+			s5m_ldo14_reg: LDO14 {
 				regulator-name = "P1.8V_LDO_OUT14";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+				op_mode = <3>;
 			};
 
-			ldo15_reg: LDO15 {
+			s5m_ldo15_reg: LDO15 {
 				regulator-name = "P1.0V_LDO_OUT15";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+				op_mode = <3>;
 			};
 
-			ldo16_reg: LDO16 {
+			s5m_ldo16_reg: LDO16 {
 				regulator-name = "P1.8V_LDO_OUT16";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+				op_mode = <3>;
+			};
+
+			s5m_ldo17_reg: LDO17 {
+				regulator-name = "P2.8V_LDO_OUT17";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+				op_mode = <0>;
+			};
+
+			s5m_ldo25_reg: LDO25 {
+				regulator-name = "vdd_bridge";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				op_mode = <1>;
 			};
 
-			buck1_reg: BUCK1 {
+			BUCK1 {
 				regulator-name = "vdd_mif";
 				regulator-min-microvolt = <950000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+				op_mode = <3>;
 			};
 
-			buck2_reg: BUCK2 {
+			BUCK2 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+				op_mode = <3>;
 			};
 
-			buck3_reg: BUCK3 {
+			BUCK3 {
 				regulator-name = "vdd_int";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
+				op_mode = <3>;
 			};
 
-			buck4_reg: BUCK4 {
+			BUCK4 {
 				regulator-name = "vdd_g3d";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1300000>;
-				regulator-always-on;
 				regulator-boot-on;
+				op_mode = <3>;
 			};
 
-			buck5_reg: BUCK5 {
+			BUCK5 {
 				regulator-name = "P1.8V_BUCK_OUT5";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+				op_mode = <1>;
 			};
 
-			buck6_reg: BUCK6 {
-				regulator-name = "P1.35V_BUCK_OUT6";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-			};
-
-			buck7_reg: BUCK7 {
-				regulator-name = "P2.0V_BUCK_OUT7";
-				regulator-min-microvolt = <2000000>;
-				regulator-max-microvolt = <2000000>;
+			BUCK6 {
+				regulator-name = "P1.2V_BUCK_OUT6";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <0>;
 			};
 
-			buck8_reg: BUCK8 {
-				regulator-name = "P2.85V_BUCK_OUT8";
-				regulator-min-microvolt = <2850000>;
-				regulator-max-microvolt = <2850000>;
+			BUCK9 {
+				regulator-name = "vdd_ummc";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <3000000>;
 				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <3>;
 			};
 		};
 	};
@@ -415,14 +343,6 @@
 	status = "okay";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
-
-	trackpad {
-		reg = <0x67>;
-		compatible = "cypress,cyapa";
-		interrupts = <2 0>;
-		interrupt-parent = <&gpx1>;
-		wakeup-source;
-	};
 };
 
 /*
@@ -454,6 +374,16 @@
 	status = "okay";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
+
+	cros_ec: embedded-controller {
+		compatible = "google,cros-ec-i2c";
+		reg = <0x1e>;
+		interrupts = <6 0>;
+		interrupt-parent = <&gpx1>;
+		wakeup-source;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_irq>;
+	};
 };
 
 &i2c_5 {
@@ -466,13 +396,6 @@
 	status = "okay";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
-
-	max98095: codec@11 {
-		compatible = "maxim,max98095";
-		reg = <0x11>;
-		pinctrl-0 = <&max98095_en>;
-		pinctrl-names = "default";
-	};
 };
 
 &i2c_8 {
@@ -508,29 +431,7 @@
 	};
 };
 
-&mmc_2 {
-	status = "okay";
-	num-slots = <1>;
-	supports-highspeed;
-	card-detect-delay = <200>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <2 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-
-	slot@0 {
-		reg = <0>;
-		bus-width = <4>;
-		wp-gpios = <&gpc2 1 0>;
-	};
-};
-
-/*
- * On Snow we've got SIP WiFi and so can keep drive strengths low to
- * reduce EMI.
- */
-&mmc_3 {
+&mmc_1 {
 	status = "okay";
 	num-slots = <1>;
 	supports-highspeed;
@@ -540,7 +441,7 @@
 	samsung,dw-mshc-sdr-timing = <2 3>;
 	samsung,dw-mshc-ddr-timing = <1 2>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
+	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_cd &sd1_bus4>;
 
 	slot@0 {
 		reg = <0>;
@@ -549,8 +450,15 @@
 };
 
 &pinctrl_0 {
-	max77686_irq: max77686-irq {
-		samsung,pins = "gpx3-2";
+	s5m8767_dvs: s5m8767-dvs {
+		samsung,pins = "gpd1-0", "gpd1-1", "gpd1-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <1>;
+		samsung,pin-drv = <0>;
+	};
+
+	power_key_irq: power-key-irq {
+		samsung,pins = "gpx1-3";
 		samsung,pin-function = <0>;
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
@@ -563,23 +471,23 @@
 		samsung,pin-drv = <0>;
 	};
 
-	max98095_en: max98095-en {
-		samsung,pins = "gpx1-7";
+	s5m8767_ds: s5m8767-ds {
+		samsung,pins = "gpx2-3", "gpx2-4", "gpx2-5";
 		samsung,pin-function = <0>;
-		samsung,pin-pud = <3>;
+		samsung,pin-pud = <1>;
 		samsung,pin-drv = <0>;
 	};
 
-	tps65090_irq: tps65090-irq {
-		samsung,pins = "gpx2-6";
+	s5m8767_irq: s5m8767-irq {
+		samsung,pins = "gpx3-2";
 		samsung,pin-function = <0>;
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
 
-	usb3_vbus_en: usb3-vbus-en {
-		samsung,pins = "gpx2-7";
-		samsung,pin-function = <1>;
+	lid_irq: lid-irq {
+		samsung,pins = "gpx3-5";
+		samsung,pin-function = <0>;
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
@@ -593,31 +501,28 @@
 };
 
 &pinctrl_1 {
-	arb_their_claim: arb-their-claim {
-		samsung,pins = "gpe0-4";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <3>;
-		samsung,pin-drv = <0>;
-	};
-
-	arb_our_claim: arb-our-claim {
-		samsung,pins = "gpf0-3";
+	hsic_reset: hsic-reset {
+		samsung,pins = "gpe1-0";
 		samsung,pin-function = <1>;
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
 };
 
-&sd3_clk {
+&sd1_clk {
 	samsung,pin-drv = <0>;
 };
 
-&sd3_cmd {
+&sd1_cmd {
 	samsung,pin-pud = <3>;
 	samsung,pin-drv = <0>;
 };
 
-&sd3_bus4 {
+&sd1_cd {
+	samsung,pin-drv = <0>;
+};
+
+&sd1_bus4 {
 	samsung,pin-drv = <0>;
 };
 

--------------030601000900020207040104--

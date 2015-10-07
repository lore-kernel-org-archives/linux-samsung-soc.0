From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 3/5] ARM: dts: Use GPIO constants for flags cells in exynos4412 boards
Date: Wed,  7 Oct 2015 15:14:15 +0200
Message-ID: <1444223657-7248-4-git-send-email-javier@osg.samsung.com>
References: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The board DTS are using numeric values instead of the defined GPIO
constanst to express polarity, use them to make the DTS more clear.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 15 ++++++-----
 arch/arm/boot/dts/exynos4412-odroidu3.dts       |  2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  8 +++---
 arch/arm/boot/dts/exynos4412-origen.dts         | 15 ++++++-----
 arch/arm/boot/dts/exynos4412-tiny4412.dts       |  9 ++++---
 arch/arm/boot/dts/exynos4412-trats2.dts         | 34 ++++++++++++-------------
 6 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index c3e978d77367..edf0fc8db6ff 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/clock/maxim,max77686.h>
 #include "exynos4412.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	chosen {
@@ -30,7 +31,7 @@
 		power_key {
 			interrupt-parent = <&gpx1>;
 			interrupts = <3 0>;
-			gpios = <&gpx1 3 1>;
+			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
 			debounce-interval = <10>;
@@ -70,7 +71,7 @@
 		pinctrl-0 = <&sd1_cd>;
 		pinctrl-names = "default";
 		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpk1 2 1>;
+		reset-gpios = <&gpk1 2 GPIO_ACTIVE_LOW>;
 	};
 
 	camera {
@@ -181,7 +182,7 @@
 };
 
 &hdmi {
-	hpd-gpio = <&gpx3 7 0>;
+	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd>;
 	vdd-supply = <&ldo8_reg>;
@@ -207,9 +208,9 @@
 		compatible = "smsc,usb3503";
 		reg = <0x08>;
 
-		intn-gpios = <&gpx3 0 0>;
-		connect-gpios = <&gpx3 4 0>;
-		reset-gpios = <&gpx3 5 0>;
+		intn-gpios = <&gpx3 0 GPIO_ACTIVE_HIGH>;
+		connect-gpios = <&gpx3 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpx3 5 GPIO_ACTIVE_HIGH>;
 		initial-mode = <1>;
 	};
 
@@ -482,7 +483,7 @@
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
 	pinctrl-names = "default";
 	vmmc-supply = <&ldo4_reg &ldo21_reg>;
-	cd-gpios = <&gpk2 2 0>;
+	cd-gpios = <&gpk2 2 GPIO_ACTIVE_HIGH>;
 	cd-inverted;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 1e6ef99eef59..646ff0bd001a 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -27,7 +27,7 @@
 		compatible = "gpio-leds";
 		led1 {
 			label = "led1:heart";
-			gpios = <&gpc1 0 1>;
+			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "heartbeat";
 		};
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 679ac103ebf6..b44bb682e976 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -26,13 +26,13 @@
 		compatible = "gpio-leds";
 		led1 {
 			label = "led1:heart";
-			gpios = <&gpc1 0 1>;
+			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "heartbeat";
 		};
 		led2 {
 			label = "led2:mmc0";
-			gpios = <&gpc1 2 1>;
+			gpios = <&gpc1 2 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "mmc0";
 		};
@@ -44,7 +44,7 @@
 		home_key {
 			interrupt-parent = <&gpx2>;
 			interrupts = <2 0>;
-			gpios = <&gpx2 2 0>;
+			gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_HOME>;
 			label = "home key";
 			debounce-interval = <10>;
@@ -57,7 +57,7 @@
 		regulator-name = "p3v3_en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpa1 1 1>;
+		gpio = <&gpa1 1 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 9d528af68c1a..c8d86af2fb98 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include "exynos4412.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
 / {
@@ -45,7 +46,7 @@
 			regulator-name = "VMEM_VDD_2.8V";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpx1 1 0>;
+			gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 	};
@@ -107,13 +108,13 @@
 
 		s5m8767,pmic-buck-default-dvs-idx = <3>;
 
-		s5m8767,pmic-buck-dvs-gpios = <&gpx2 3 0>,
-						 <&gpx2 4 0>,
-						 <&gpx2 5 0>;
+		s5m8767,pmic-buck-dvs-gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>,
+						 <&gpx2 4 GPIO_ACTIVE_HIGH>,
+						 <&gpx2 5 GPIO_ACTIVE_HIGH>;
 
-		s5m8767,pmic-buck-ds-gpios = <&gpm3 5 0>,
-						<&gpm3 6 0>,
-						<&gpm3 7 0>;
+		s5m8767,pmic-buck-ds-gpios = <&gpm3 5 GPIO_ACTIVE_HIGH>,
+						<&gpm3 6 GPIO_ACTIVE_HIGH>,
+						<&gpm3 7 GPIO_ACTIVE_HIGH>;
 
 		s5m8767,pmic-buck2-dvs-voltage = <1250000>, <1200000>,
 						 <1200000>, <1200000>,
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 525684ca8dc0..4840bbdaa9ec 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -13,6 +13,7 @@
 
 /dts-v1/;
 #include "exynos4412.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "FriendlyARM TINY4412 board based on Exynos4412";
@@ -31,26 +32,26 @@
 
 		led1 {
 			label = "led1";
-			gpios = <&gpm4 0 1>;
+			gpios = <&gpm4 0 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 
 		led2 {
 			label = "led2";
-			gpios = <&gpm4 1 1>;
+			gpios = <&gpm4 1 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
 		led3 {
 			label = "led3";
-			gpios = <&gpm4 2 1>;
+			gpios = <&gpm4 2 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
 		led4 {
 			label = "led4";
-			gpios = <&gpm4 3 1>;
+			gpios = <&gpm4 3 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 93e3bbd4bd49..d8bf4afb8bd9 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -65,7 +65,7 @@
 			regulator-name = "CAM_SENSOR_A";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpm0 2 0>;
+			gpio = <&gpm0 2 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -74,7 +74,7 @@
 			regulator-name = "LCD_VDD_2.2V";
 			regulator-min-microvolt = <2200000>;
 			regulator-max-microvolt = <2200000>;
-			gpio = <&gpc0 1 0>;
+			gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -83,7 +83,7 @@
 			regulator-name = "CAM_AF";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpm0 4 0>;
+			gpio = <&gpm0 4 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -92,7 +92,7 @@
 			regulator-name = "LED_A_3.0V";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
-			gpio = <&gpj0 5 0>;
+			gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 	};
@@ -101,21 +101,21 @@
 		compatible = "gpio-keys";
 
 		key-down {
-			gpios = <&gpx3 3 1>;
+			gpios = <&gpx3 3 GPIO_ACTIVE_LOW>;
 			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <10>;
 		};
 
 		key-up {
-			gpios = <&gpx2 2 1>;
+			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
 			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <10>;
 		};
 
 		key-power {
-			gpios = <&gpx2 7 1>;
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <116>;
 			label = "power";
 			debounce-interval = <10>;
@@ -123,7 +123,7 @@
 		};
 
 		key-ok {
-			gpios = <&gpx0 1 1>;
+			gpios = <&gpx0 1 GPIO_ACTIVE_LOW>;
 			linux,code = <139>;
 			label = "ok";
 			debounce-inteval = <10>;
@@ -198,7 +198,7 @@
 
 	i2c_ak8975: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&gpy2 4 0>, <&gpy2 5 0>;
+		gpios = <&gpy2 4 GPIO_ACTIVE_HIGH>, <&gpy2 5 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -207,13 +207,13 @@
 		ak8975@0c {
 			compatible = "asahi-kasei,ak8975";
 			reg = <0x0c>;
-			gpios = <&gpj0 7 0>;
+			gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
 	i2c_cm36651: i2c-gpio-2 {
 		compatible = "i2c-gpio";
-		gpios = <&gpf0 0 1>, <&gpf0 1 1>;
+		gpios = <&gpf0 0 GPIO_ACTIVE_LOW>, <&gpf0 1 GPIO_ACTIVE_LOW>;
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -359,7 +359,7 @@
 		reg = <0>;
 		vdd3-supply = <&lcd_vdd3_reg>;
 		vci-supply = <&ldo25_reg>;
-		reset-gpios = <&gpy4 5 0>;
+		reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
 		power-on-delay= <50>;
 		reset-delay = <100>;
 		init-delay = <100>;
@@ -446,7 +446,7 @@
 			clocks = <&camera 1>;
 			clock-names = "extclk";
 			samsung,camclk-out = <1>;
-			gpios = <&gpm1 6 0>;
+			gpios = <&gpm1 6 GPIO_ACTIVE_HIGH>;
 
 			port {
 				is_s5k6a3_ep: endpoint {
@@ -488,8 +488,8 @@
 	s5c73m3@3c {
 		compatible = "samsung,s5c73m3";
 		reg = <0x3c>;
-		standby-gpios = <&gpm0 1 1>;   /* ISP_STANDBY */
-		xshutdown-gpios = <&gpf1 3 1>; /* ISP_RESET */
+		standby-gpios = <&gpm0 1 GPIO_ACTIVE_LOW>;   /* ISP_STANDBY */
+		xshutdown-gpios = <&gpf1 3 GPIO_ACTIVE_LOW>; /* ISP_RESET */
 		vdd-int-supply = <&buck9_reg>;
 		vddio-cis-supply = <&ldo9_reg>;
 		vdda-supply = <&ldo17_reg>;
@@ -1241,7 +1241,7 @@
 
 &sdhci_2 {
 	bus-width = <4>;
-	cd-gpios = <&gpx3 4 0>;
+	cd-gpios = <&gpx3 4 GPIO_ACTIVE_HIGH>;
 	cd-inverted;
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
 	pinctrl-names = "default";
@@ -1268,7 +1268,7 @@
 &spi_1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_bus>;
-	cs-gpios = <&gpb 5 0>;
+	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
 	s5c73m3_spi: s5c73m3 {
-- 
2.4.3

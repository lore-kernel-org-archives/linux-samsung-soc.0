From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/5] ARM: dts: Use GPIO constants for flags cells in exynos4120 boards
Date: Wed,  7 Oct 2015 15:14:14 +0200
Message-ID: <1444223657-7248-3-git-send-email-javier@osg.samsung.com>
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

 arch/arm/boot/dts/exynos4210-origen.dts         | 15 ++++-----
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |  3 +-
 arch/arm/boot/dts/exynos4210-trats.dts          | 29 ++++++++---------
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 42 +++++++++++++------------
 4 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index e050d85cdacd..b8f866991bdd 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -16,6 +16,7 @@
 
 /dts-v1/;
 #include "exynos4210.dtsi"
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
@@ -57,35 +58,35 @@
 
 		up {
 			label = "Up";
-			gpios = <&gpx2 0 1>;
+			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_UP>;
 			gpio-key,wakeup;
 		};
 
 		down {
 			label = "Down";
-			gpios = <&gpx2 1 1>;
+			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_DOWN>;
 			gpio-key,wakeup;
 		};
 
 		back {
 			label = "Back";
-			gpios = <&gpx1 7 1>;
+			gpios = <&gpx1 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
 			gpio-key,wakeup;
 		};
 
 		home {
 			label = "Home";
-			gpios = <&gpx1 6 1>;
+			gpios = <&gpx1 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
 			gpio-key,wakeup;
 		};
 
 		menu {
 			label = "Menu";
-			gpios = <&gpx1 5 1>;
+			gpios = <&gpx1 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
 			gpio-key,wakeup;
 		};
@@ -94,7 +95,7 @@
 	leds {
 		compatible = "gpio-leds";
 		status {
-			gpios = <&gpx1 3 1>;
+			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 043b03caff8f..bc1448ba95d3 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -16,6 +16,7 @@
 
 /dts-v1/;
 #include "exynos4210.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung smdkv310 evaluation board based on Exynos4210";
@@ -182,7 +183,7 @@
 };
 
 &spi_2 {
-	cs-gpios = <&gpc1 2 0>;
+	cs-gpios = <&gpc1 2 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
 	w25x80@0 {
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index ba34886f8b65..c69e468efd2e 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include "exynos4210.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung Trats based on Exynos4210";
@@ -39,7 +40,7 @@
 			regulator-name = "VMEM_VDD_2.8V";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpk0 2 0>;
+			gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -48,7 +49,7 @@
 			regulator-name = "TSP_FIXED_VOLTAGES";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpl0 3 0>;
+			gpio = <&gpl0 3 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -57,7 +58,7 @@
 			regulator-name = "8M_AF_2.8V_EN";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpk1 1 0>;
+			gpio = <&gpk1 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -66,7 +67,7 @@
 			regulator-name = "CAM_IO_EN";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
-			gpio = <&gpe2 1 0>;
+			gpio = <&gpe2 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -75,7 +76,7 @@
 			regulator-name = "8M_1.2V_EN";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
-			gpio = <&gpe2 5 0>;
+			gpio = <&gpe2 5 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -84,7 +85,7 @@
 			regulator-name = "VT_CORE_1.5V";
 			regulator-min-microvolt = <1500000>;
 			regulator-max-microvolt = <1500000>;
-			gpio = <&gpe2 2 0>;
+			gpio = <&gpe2 2 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 	};
@@ -93,21 +94,21 @@
 		compatible = "gpio-keys";
 
 		vol-down-key {
-			gpios = <&gpx2 1 1>;
+			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
 			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <10>;
 		};
 
 		vol-up-key {
-			gpios = <&gpx2 0 1>;
+			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
 			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <10>;
 		};
 
 		power-key {
-			gpios = <&gpx2 7 1>;
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <116>;
 			label = "power";
 			debounce-interval = <10>;
@@ -115,7 +116,7 @@
 		};
 
 		ok-key {
-			gpios = <&gpx3 5 1>;
+			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
 			linux,code = <352>;
 			label = "ok";
 			debounce-interval = <10>;
@@ -218,7 +219,7 @@
 		compatible = "samsung,s6e8aa0";
 		vdd3-supply = <&vcclcd_reg>;
 		vci-supply = <&vlcd_reg>;
-		reset-gpios = <&gpy4 5 0>;
+		reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
 		power-on-delay= <50>;
 		reset-delay = <100>;
 		init-delay = <100>;
@@ -304,9 +305,9 @@
 		max8997,pmic-ignore-gpiodvs-side-effect;
 		max8997,pmic-buck125-default-dvs-idx = <0>;
 
-		max8997,pmic-buck125-dvs-gpios = <&gpx0 5 0>,
-						 <&gpx0 6 0>,
-						 <&gpl0 0 0>;
+		max8997,pmic-buck125-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
+						 <&gpx0 6 GPIO_ACTIVE_HIGH>,
+						 <&gpl0 0 GPIO_ACTIVE_HIGH>;
 
 		max8997,pmic-buck1-dvs-voltage = <1350000>, <1300000>,
 						 <1250000>, <1200000>,
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index eb379526e234..896be8f2342d 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -14,6 +14,7 @@
 
 /dts-v1/;
 #include "exynos4210.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung Universal C210 based on Exynos4210 rev0";
@@ -65,7 +66,7 @@
 		regulator-name = "VMEM_VDD_2_8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpe1 3 0>;
+		gpio = <&gpe1 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -73,21 +74,21 @@
 		compatible = "gpio-keys";
 
 		vol-up-key {
-			gpios = <&gpx2 0 1>;
+			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
 			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <1>;
 		};
 
 		vol-down-key {
-			gpios = <&gpx2 1 1>;
+			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
 			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <1>;
 		};
 
 		config-key {
-			gpios = <&gpx2 2 1>;
+			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
 			linux,code = <171>;
 			label = "config";
 			debounce-interval = <1>;
@@ -95,14 +96,14 @@
 		};
 
 		camera-key {
-			gpios = <&gpx2 3 1>;
+			gpios = <&gpx2 3 GPIO_ACTIVE_LOW>;
 			linux,code = <212>;
 			label = "camera";
 			debounce-interval = <1>;
 		};
 
 		power-key {
-			gpios = <&gpx2 7 1>;
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <116>;
 			label = "power";
 			debounce-interval = <1>;
@@ -110,7 +111,7 @@
 		};
 
 		ok-key {
-			gpios = <&gpx3 5 1>;
+			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
 			linux,code = <352>;
 			label = "ok";
 			debounce-interval = <1>;
@@ -122,7 +123,7 @@
 		regulator-name = "TSP_2_8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpe2 3 0>;
+		gpio = <&gpe2 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -131,17 +132,17 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpy3 1 0>;
-		gpio-mosi = <&gpy3 3 0>;
+		gpio-sck = <&gpy3 1 GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpy3 3 GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
-		cs-gpios = <&gpy4 3 0>;
+		cs-gpios = <&gpy4 3 GPIO_ACTIVE_HIGH>;
 
 		lcd@0 {
 			compatible = "samsung,ld9040";
 			reg = <0>;
 			vdd3-supply = <&ldo7_reg>;
 			vci-supply = <&ldo17_reg>;
-			reset-gpios = <&gpy4 5 0>;
+			reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
 			spi-max-frequency = <1200000>;
 			spi-cpol;
 			spi-cpha;
@@ -218,13 +219,13 @@
 		regulator-name = "HDMI_5V";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpe0 1 0>;
+		gpio = <&gpe0 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
 	hdmi_ddc: i2c-ddc {
 		compatible = "i2c-gpio";
-		gpios = <&gpe4 2 0 &gpe4 3 0>;
+		gpios = <&gpe4 2 GPIO_ACTIVE_HIGH &gpe4 3 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,delay-us = <100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -267,7 +268,7 @@
 };
 
 &hdmi {
-	hpd-gpio = <&gpx3 7 0>;
+	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd>;
 	hdmi-en-supply = <&hdmi_en>;
@@ -311,7 +312,8 @@
 		compatible = "maxim,max8952";
 		reg = <0x60>;
 
-		max8952,vid-gpios = <&gpx0 3 0>, <&gpx0 4 0>;
+		max8952,vid-gpios = <&gpx0 3 GPIO_ACTIVE_HIGH>,
+				    <&gpx0 4 GPIO_ACTIVE_HIGH>;
 		max8952,default-mode = <0>;
 		max8952,dvs-mode-microvolt = <1250000>, <1200000>,
 						<1050000>, <950000>;
@@ -330,13 +332,13 @@
 		reg = <0x66>;
 
 		max8998,pmic-buck1-default-dvs-idx = <0>;
-		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 0>,
-						<&gpx0 6 0>;
+		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
+						<&gpx0 6 GPIO_ACTIVE_HIGH>;
 		max8998,pmic-buck1-dvs-voltage = <1100000>, <1000000>,
 						<1100000>, <1000000>;
 
 		max8998,pmic-buck2-default-dvs-idx = <0>;
-		max8998,pmic-buck2-dvs-gpio = <&gpe2 0 0>;
+		max8998,pmic-buck2-dvs-gpio = <&gpe2 0 GPIO_ACTIVE_HIGH>;
 		max8998,pmic-buck2-dvs-voltage = <1200000>, <1100000>;
 
 		regulators {
@@ -551,7 +553,7 @@
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
 	pinctrl-names = "default";
 	vmmc-supply = <&ldo5_reg>;
-	cd-gpios = <&gpx3 4 0>;
+	cd-gpios = <&gpx3 4 GPIO_ACTIVE_HIGH>;
 	cd-inverted;
 	status = "okay";
 };
-- 
2.4.3

From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 4/5] ARM: dts: Use GPIO constants for flags cells in exynos5420/5422/5800 boards
Date: Wed,  7 Oct 2015 15:14:16 +0200
Message-ID: <1444223657-7248-5-git-send-email-javier@osg.samsung.com>
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

 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 3 ++-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 8 ++++----
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 7 ++++---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 8 ++++----
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index eeb4ac22cfce..4ecef6981d5c 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "exynos5420.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/clock/samsung,s2mps11.h>
@@ -44,7 +45,7 @@
 
 		wakeup {
 			label = "SW-TACT1";
-			gpios = <&gpx2 7 1>;
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_WAKEUP>;
 			gpio-key,wakeup;
 		};
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 8f4d76c5e11c..c53fca8440a1 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -94,7 +94,7 @@
 		regulator-name = "P5.0V_USB3CON0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 0 0>;
+		gpio = <&gph0 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb300_vbus_en>;
 		enable-active-high;
@@ -105,7 +105,7 @@
 		regulator-name = "P5.0V_USB3CON1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 1 0>;
+		gpio = <&gph0 1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
@@ -153,7 +153,7 @@
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x06>;
 	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 0>;
+	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 
 	ports {
 		port@0 {
@@ -925,7 +925,7 @@
 	status = "okay";
 	num-cs = <1>;
 	samsung,spi-src-clk = <0>;
-	cs-gpios = <&gpb1 2 0>;
+	cs-gpios = <&gpb1 2 GPIO_ACTIVE_HIGH>;
 
 	cros_ec: cros-ec@0 {
 		compatible = "google,cros-ec-spi";
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 7520d52f4e22..ac35aefd320f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "exynos5420.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung SMDK5420 board based on EXYNOS5420";
@@ -69,7 +70,7 @@
 		regulator-name = "VBUS0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpg0 5 0>;
+		gpio = <&gpg0 5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb300_vbus_en>;
 		enable-active-high;
@@ -80,7 +81,7 @@
 		regulator-name = "VBUS1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpg1 4 0>;
+		gpio = <&gpg1 4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
@@ -121,7 +122,7 @@
 
 &hdmi {
 	status = "okay";
-	hpd-gpio = <&gpx3 7 0>;
+	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
 };
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index a83d569baea8..1af5bdc2bdb1 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -43,7 +43,7 @@
 		pinctrl-0 = <&emmc_nrst_pin>;
 		pinctrl-names = "default";
 		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpd1 0 1>;
+		reset-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>;
 	};
 
 	fan0: pwm-fan {
@@ -74,7 +74,7 @@
 
 &hdmi {
 	status = "okay";
-	hpd-gpio = <&gpx3 7 0>;
+	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
 
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 7d5b386b5ae6..39ecc38aa54f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -94,7 +94,7 @@
 		regulator-name = "P5.0V_USB3CON0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 0 0>;
+		gpio = <&gph0 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb300_vbus_en>;
 		enable-active-high;
@@ -105,7 +105,7 @@
 		regulator-name = "P5.0V_USB3CON1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 1 0>;
+		gpio = <&gph0 1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
@@ -147,7 +147,7 @@
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 0>;
+	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 	panel = <&panel>;
 };
 
@@ -888,7 +888,7 @@
 	status = "okay";
 	num-cs = <1>;
 	samsung,spi-src-clk = <0>;
-	cs-gpios = <&gpb1 2 0>;
+	cs-gpios = <&gpb1 2 GPIO_ACTIVE_HIGH>;
 
 	cros_ec: cros-ec@0 {
 		compatible = "google,cros-ec-spi";
-- 
2.4.3

From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v4 2/2] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2
 board
Date: Tue, 12 Sep 2017 09:34:08 +0200
Message-ID: <1505201648-9240-3-git-send-email-m.purski@samsung.com>
References: <1505201648-9240-1-git-send-email-m.purski@samsung.com>
        <CGME20170912073505eucas1p2e4fb706c97e406a0f46282af66e8f90c@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58484 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751036AbdILHfI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 03:35:08 -0400
In-reply-to: <1505201648-9240-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Maciej Purski <m.purski@samsung.com>

Add HDMI and Sil9234 MHL converter to Trats2 board.
Following in SoC devices have been enabled:
- HDMI (HDMI signal encoder),
- Mixer (video buffer scanout device),
- I2C_5 bus (used for HDMI DDC)
- I2C_8 bus (used for HDMI_PHY control).

Based on previous work by:
Tomasz Stanislawski <t.stanislaws@samsung.com>

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 112 ++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 35e9b94..742e02a 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -18,6 +18,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/maxim,max77686.h>
+#include <dt-bindings/pinctrl/samsung.h>
 
 / {
 	model = "Samsung Trats 2 based on Exynos4412";
@@ -97,6 +98,34 @@
 			gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
+
+		vsil12: voltage-regulator-6 {
+			compatible = "regulator-fixed";
+			regulator-name = "VSIL_1.2V";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&buck7_reg>;
+		};
+
+		vcc33mhl: voltage-regulator-7 {
+			compatible = "regulator-fixed";
+			regulator-name = "VCC_3.3_MHL";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		vcc18mhl: voltage-regulator-8 {
+			compatible = "regulator-fixed";
+			regulator-name = "VCC_1.8_MHL";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
 	};
 
 	gpio-keys {
@@ -229,6 +258,36 @@
 		};
 	};
 
+	i2c-mhl {
+		compatible = "i2c-gpio";
+		gpios = <&gpf0 4 GPIO_ACTIVE_HIGH &gpf0 6 GPIO_ACTIVE_HIGH>;
+		i2c-gpio,delay-us = <100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-0 = <&i2c_mhl_bus>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		sii9234: hdmi-bridge@39 {
+			compatible = "sil,sii9234";
+			avcc33-supply = <&vcc33mhl>;
+			iovcc18-supply = <&vcc18mhl>;
+			avcc12-supply = <&vsil12>;
+			cvcc12-supply = <&vsil12>;
+			reset-gpios = <&gpf3 4 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpf3>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x39>;
+
+			port {
+				mhl_to_hdmi: endpoint {
+					remote-endpoint = <&hdmi_to_mhl>;
+				};
+			};
+		};
+	};
+
 	camera: camera {
 		pinctrl-0 = <&cam_port_a_clk_active &cam_port_b_clk_active>;
 		pinctrl-names = "default";
@@ -522,6 +581,29 @@
 	status = "okay";
 };
 
+&hdmi {
+	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd>;
+	vdd-supply = <&ldo3_reg>;
+	vdd_osc-supply = <&ldo4_reg>;
+	vdd_pll-supply = <&ldo3_reg>;
+	ddc = <&i2c_5>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			hdmi_to_mhl: endpoint {
+				remote-endpoint = <&mhl_to_hdmi>;
+			};
+		};
+	};
+};
+
 &hsotg {
 	vusb_d-supply = <&ldo15_reg>;
 	vusb_a-supply = <&ldo12_reg>;
@@ -600,6 +682,11 @@
 	};
 };
 
+
+&i2c_5 {
+	status = "okay";
+};
+
 &i2c_7 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
@@ -894,12 +981,20 @@
 	};
 };
 
+&i2c_8 {
+	status = "okay";
+};
+
 &i2s0 {
 	pinctrl-0 = <&i2s0_bus>;
 	pinctrl-names = "default";
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 &mshc_0 {
 	num-slots = <1>;
 	broken-cd;
@@ -926,6 +1021,18 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sleep0>;
 
+	mhl_int: mhl-int {
+		samsung,pins = "gpf3-5";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	i2c_mhl_bus: i2c-mhl-bus {
+		samsung,pins = "gpf0-4", "gpf0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
 	sleep0: sleep-states {
 		PIN_SLP(gpa0-0, INPUT, NONE);
 		PIN_SLP(gpa0-1, OUT0, NONE);
@@ -1029,6 +1136,11 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sleep1>;
 
+	hdmi_hpd: hdmi-hpd {
+		samsung,pins = "gpx3-7";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
 	sleep1: sleep-states {
 		PIN_SLP(gpk0-0, PREV, NONE);
 		PIN_SLP(gpk0-1, PREV, NONE);
-- 
2.7.4

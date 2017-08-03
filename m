From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2 board
Date: Thu, 03 Aug 2017 09:45:23 +0200
Message-ID: <1501746323-5254-3-git-send-email-m.purski@samsung.com>
References: <1501746323-5254-1-git-send-email-m.purski@samsung.com>
 <CGME20170803074541eucas1p2b054d4853a98819fc42f19f7cae7f419@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23553 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751681AbdHCHpo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 03:45:44 -0400
In-reply-to: <1501746323-5254-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, krzk@kernel.org, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

This patch adds HDMI and Sil9234 MHL converter to Trats2 board.

Based on previous work by:
Tomasz Stanislawski <t.stanislaws@samsung.com>

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 93 +++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 35e9b94..39940f6 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -97,6 +97,16 @@
 			gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
+
+		vsil: voltage-regulator-vsil {
+			compatible = "regulator-fixed";
+			regulator-name = "HDMI_5V";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&buck7_reg>;
+		};
 	};
 
 	gpio-keys {
@@ -229,6 +239,34 @@
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
+		sii9234: sii9234@39 {
+			compatible = "sil,sii9234";
+			vcc-supply = <&vsil>;
+			reset-gpios = <&gpf3 4 GPIO_ACTIVE_HIGH>;
+			interrupt-parent = <&gpf3>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x39>;
+
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
@@ -522,6 +560,31 @@
 	status = "okay";
 };
 
+&hdmi {
+	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd>;
+	hdmi-en-supply = <&vsil>;
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
+
+};
+
 &hsotg {
 	vusb_d-supply = <&ldo15_reg>;
 	vusb_a-supply = <&ldo12_reg>;
@@ -600,6 +663,11 @@
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
@@ -894,12 +962,20 @@
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
@@ -926,6 +1002,18 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sleep0>;
 
+	mhl_int: mhl-int {
+		samsung,pins = "gpf3-5";
+		samsung,pin-pud = <0>;
+	};
+
+	i2c_mhl_bus: i2c-mhl-bus {
+		samsung,pins = "gpf0-4", "gpf0-6";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <1>;
+		samsung,pin-drv = <0>;
+	};
+
 	sleep0: sleep-states {
 		PIN_SLP(gpa0-0, INPUT, NONE);
 		PIN_SLP(gpa0-1, OUT0, NONE);
@@ -1029,6 +1117,11 @@
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

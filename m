From: Randy Li <ayaka@soulik.info>
Subject: [RFC PATCH v2 1/2] ARM: dts: samsung: add rga-lvds panel in itop elite
Date: Sun, 18 Sep 2016 22:27:38 +0800
Message-ID: <1474208859-10045-2-git-send-email-ayaka@soulik.info>
References: <1474208859-10045-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:56490 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758528AbcIRO2e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Sep 2016 10:28:34 -0400
In-Reply-To: <1474208859-10045-1-git-send-email-ayaka@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, a.hajda@samsung.com, devicetree@vger.kernel.org, Randy Li <ayaka@soulik.info>

It is actually a lvds panel connected through a rga-lvds bridge.
The touchscreen is communicated with i2c bus but the driver is not
support now.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 54 +++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index b08705e..9ef0505 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -138,6 +138,36 @@
 		assigned-clocks = <&clock CLK_MOUT_CAM0>;
 		assigned-clock-parents = <&clock CLK_XUSBXTI>;
 	};
+
+	vcc_sys_lcd: sys-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel: panel@0 {
+		compatible = "chunghwa,claa070wp03xg";
+
+		power-supply = <&vcc_sys_lcd>;
+		enable-gpios = <&gpl0 2 GPIO_ACTIVE_HIGH>;
+		backlight = <&bl>;
+
+		port {
+			lcd_ep: endpoint {
+				remote-endpoint = <&rga_lvds>;
+			};
+		};
+	};
+
+	bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 1 5000000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <0 5 12 16 32 64 128 255>;
+		default-brightness-level = <5>;
+		power-supply = <&vcc_sys_lcd>;
+	};
 };
 
 &adc {
@@ -215,9 +245,9 @@
 
 &pwm {
 	status = "okay";
-	pinctrl-0 = <&pwm0_out>;
+	pinctrl-0 = <&pwm0_out &pwm1_out>;
 	pinctrl-names = "default";
-	samsung,pwm-outputs = <0>;
+	samsung,pwm-outputs = <0>, <1>;
 };
 
 &sdhci_2 {
@@ -238,3 +268,23 @@
 &serial_2 {
 	status = "okay";
 };
+
+&i2c_3 {
+	status = "okay";
+};
+
+&fimd {
+	pinctrl-0 = <&lcd_clk &lcd_data24>;
+	pinctrl-names = "default";
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@3 {
+			reg = <3>;
+			rga_lvds: endpoint {
+				remote-endpoint = <&lcd_ep>;
+			};
+		};
+	};
+};
-- 
2.7.4

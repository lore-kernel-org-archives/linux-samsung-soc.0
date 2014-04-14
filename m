From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/4] ARM: dts: exynos5250-snow: add tps65090 power regulator
Date: Mon, 14 Apr 2014 18:46:06 +0530
Message-ID: <1397481367-12652-3-git-send-email-sachin.kamat@linaro.org>
References: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:63331 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754142AbaDNNRD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 09:17:03 -0400
Received: by mail-pb0-f44.google.com with SMTP id rp16so8217741pbb.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Apr 2014 06:17:03 -0700 (PDT)
In-Reply-To: <1397481367-12652-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sachin.kamat@linaro.org, joshi@samsung.com, ajaykumar.rs@samsung.com

From: Doug Anderson <dianders@chromium.org>

Added TPS65090 regulator related nodes to Snow board.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 469c85d..a38fd18 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -44,6 +44,13 @@
 		sd3_bus4: sd3-bus-width4 {
 			samsung,pin-drv = <0>;
 		};
+
+		tps65090_irq: tps65090-irq {
+			samsung,pins = "gpx2-6";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@13400000 {
@@ -75,6 +82,12 @@
 		};
 	};
 
+	vbat: vbat-fixed-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat-supply";
+		regulator-boot-on;
+	};
+
 	i2c-arbitrator {
 		compatible = "i2c-arb-gpio-challenge";
 		#address-cells = <1>;
@@ -201,6 +214,83 @@
 							0x070c0069>;	/* LEFT */
 				};
 			};
+
+			power-regulator {
+				compatible = "ti,tps65090";
+				reg = <0x48>;
+
+				/*
+				 * Config irq to disable internal pulls
+				 * even though we run in polling mode.
+				 */
+				pinctrl-names = "default";
+				pinctrl-0 = <&tps65090_irq>;
+
+				vsys1-supply = <&vbat>;
+				vsys2-supply = <&vbat>;
+				vsys3-supply = <&vbat>;
+				infet1-supply = <&vbat>;
+				infet2-supply = <&vbat>;
+				infet3-supply = <&vbat>;
+				infet4-supply = <&vbat>;
+				infet5-supply = <&vbat>;
+				infet6-supply = <&vbat>;
+				infet7-supply = <&vbat>;
+				vsys-l1-supply = <&vbat>;
+				vsys-l2-supply = <&vbat>;
+
+				regulators {
+					dcdc1 {
+						ti,enable-ext-control;
+					};
+					dcdc2 {
+						ti,enable-ext-control;
+					};
+					dcdc3 {
+						ti,enable-ext-control;
+					};
+					fet1 {
+						regulator-name = "vcd_led";
+						ti,overcurrent-wait = <3>;
+					};
+					tps65090_fet2: fet2 {
+						regulator-name = "video_mid";
+						regulator-always-on;
+						ti,overcurrent-wait = <3>;
+					};
+					fet3 {
+						regulator-name = "wwan_r";
+						regulator-always-on;
+						ti,overcurrent-wait = <3>;
+					};
+					fet4 {
+						regulator-name = "sdcard";
+						ti,overcurrent-wait = <3>;
+					};
+					fet5 {
+						regulator-name = "camout";
+						regulator-always-on;
+						ti,overcurrent-wait = <3>;
+					};
+					fet6 {
+						regulator-name = "lcd_vdd";
+						ti,overcurrent-wait = <3>;
+					};
+					tps65090_fet7: fet7 {
+						regulator-name = "video_mid_1a";
+						regulator-always-on;
+						ti,overcurrent-wait = <3>;
+					};
+					ldo1 {
+					};
+					ldo2 {
+					};
+				};
+
+				charger {
+					compatible = "ti,tps65090-charger";
+				};
+			};
 		};
 	};
 
-- 
1.7.9.5

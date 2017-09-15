From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/5] ARM: dts: exynos: Move HDMI PHY node to exynos5250.dtsi
Date: Fri, 15 Sep 2017 11:11:20 +0200
Message-ID: <1505466683-32148-3-git-send-email-m.szyprowski@samsung.com>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170915091139eucas1p2eb6d2d81ee77ee5a47f1c32f9ccce268@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33482 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751248AbdIOJLm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 05:11:42 -0400
In-reply-to: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

All Exynos 5250 SoCs have HDMI PHY connected via dedicated I2C bus (bus
number 8), so HDMI PHY should be defined in exynos5250.dtsi instead of
duplicating it in every board, which enable HDMI support.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts      | 8 +-------
 arch/arm/boot/dts/exynos5250-smdk5250.dts     | 6 +-----
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 7 +------
 arch/arm/boot/dts/exynos5250-spring.dts       | 7 +------
 arch/arm/boot/dts/exynos5250.dtsi             | 6 ++++++
 5 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 18a7f396ac5f..7ef257b75562 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -489,15 +489,9 @@
 
 &i2c_8 {
 	status = "okay";
-
+	/* used by HDMI PHY */
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
-	samsung,i2c-slave-addr = <0x38>;
-
-	hdmiphy@38 {
-		compatible = "samsung,exynos4212-hdmiphy";
-		reg = <0x38>;
-	};
 };
 
 &i2c_9 {
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 062cba4c2c31..24e5abc9fb9d 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -319,13 +319,9 @@
 
 &i2c_8 {
 	status = "okay";
+	/* used by HDMI PHY */
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
-
-	hdmiphy@38 {
-		compatible = "samsung,exynos4212-hdmiphy";
-		reg = <0x38>;
-	};
 };
 
 &i2c_9 {
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 8788880e459d..077be5355bf9 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -264,7 +264,6 @@
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
-	phy = <&hdmiphy>;
 	ddc = <&i2c_2>;
 	hdmi-en-supply = <&tps65090_fet7>;
 	vdd-supply = <&ldo8_reg>;
@@ -514,13 +513,9 @@
 
 &i2c_8 {
 	status = "okay";
+	/* used by HDMI PHY */
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
-
-	hdmiphy: hdmiphy@38 {
-		compatible = "samsung,exynos4212-hdmiphy";
-		reg = <0x38>;
-	};
 };
 
 &i2s0 {
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index d53bfcbeb39c..ebf0b2d5b363 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -94,7 +94,6 @@
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
-	phy = <&hdmiphy>;
 	ddc = <&i2c_2>;
 	hdmi-en-supply = <&ldo8_reg>;
 	vdd-supply = <&ldo8_reg>;
@@ -412,13 +411,9 @@
 
 &i2c_8 {
 	status = "okay";
+	/* used by HDMI PHY */
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
-
-	hdmiphy: hdmiphy@38 {
-		compatible = "samsung,exynos4212-hdmiphy";
-		reg = <0x38>;
-	};
 };
 
 &i2s0 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 8dbeb873e99c..995230685ac8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -367,6 +367,11 @@
 			clocks = <&clock CLK_I2C_HDMI>;
 			clock-names = "i2c";
 			status = "disabled";
+
+			hdmiphy: hdmiphy@38 {
+				compatible = "samsung,exynos4212-hdmiphy";
+				reg = <0x38>;
+			};
 		};
 
 		i2c_9: i2c@121D0000 {
@@ -687,6 +692,7 @@
 			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 					"sclk_hdmiphy", "mout_hdmi";
 			samsung,syscon-phandle = <&pmu_system_controller>;
+			phy = <&hdmiphy>;
 		};
 
 		hdmicec: cec@101B0000 {
-- 
1.9.1

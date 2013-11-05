From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add hs-i2c nodes to exynos5420
Date: Tue,  5 Nov 2013 17:09:20 +0530
Message-ID: <1383651560-322-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:34135 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753957Ab3KELkz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 06:40:55 -0500
Received: by mail-pa0-f47.google.com with SMTP id lf10so8567581pab.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Nov 2013 03:40:55 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Added high speed I2C nodes to Exynos5420 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9ce5f82..469769a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -34,6 +34,13 @@
 		i2c1 = &i2c_1;
 		i2c2 = &i2c_2;
 		i2c3 = &i2c_3;
+		i2c4 = &hsi2c_4;
+		i2c5 = &hsi2c_5;
+		i2c6 = &hsi2c_6;
+		i2c7 = &hsi2c_7;
+		i2c8 = &hsi2c_8;
+		i2c9 = &hsi2c_9;
+		i2c10 = &hsi2c_10;
 		gsc0 = &gsc_0;
 		gsc1 = &gsc_1;
 	};
@@ -339,6 +346,97 @@
 		status = "disabled";
 	};
 
+	hsi2c_4: hsi2c@12CA0000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12CA0000 0x1000>;
+		interrupts = <0 60 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c4_hs_bus>;
+		clocks = <&clock 265>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
+	hsi2c_5: hsi2c@12CB0000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12CB0000 0x1000>;
+		interrupts = <0 61 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c5_hs_bus>;
+		clocks = <&clock 266>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
+	hsi2c_6: hsi2c@12CC0000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12CC0000 0x1000>;
+		interrupts = <0 62 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c6_hs_bus>;
+		clocks = <&clock 267>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
+	hsi2c_7: hsi2c@12CD0000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12CD0000 0x1000>;
+		interrupts = <0 63 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c7_hs_bus>;
+		clocks = <&clock 268>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
+	hsi2c_8: hsi2c@12E00000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12E00000 0x1000>;
+		interrupts = <0 87 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c8_hs_bus>;
+		clocks = <&clock 281>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
+	hsi2c_9: hsi2c@12E10000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12E10000 0x1000>;
+		interrupts = <0 88 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c9_hs_bus>;
+		clocks = <&clock 282>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
+	hsi2c_10: hsi2c@12E20000 {
+		compatible = "samsung,exynos5-hsi2c";
+		reg = <0x12E20000 0x1000>;
+		interrupts = <0 203 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c10_hs_bus>;
+		clocks = <&clock 283>;
+		clock-names = "hsi2c";
+		status = "disabled";
+	};
+
 	hdmi@14530000 {
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
-- 
1.7.9.5

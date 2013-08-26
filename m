From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v5 3/6] ARM: dts: add i2c device nodes for Exynos5420
Date: Mon, 26 Aug 2013 15:08:18 +0530
Message-ID: <1377509901-9467-4-git-send-email-rahul.sharma@samsung.com>
References: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29869 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391Ab3HZJQi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 05:16:38 -0400
In-reply-to: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Andrew Bresticker <abrestic@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

From: Andrew Bresticker <abrestic@chromium.org>

This adds device-tree nodes for the i2c busses on Exynos
5420 platforms.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   56 +++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5353e32..05dee86 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -27,6 +27,10 @@
 		pinctrl2 = &pinctrl_2;
 		pinctrl3 = &pinctrl_3;
 		pinctrl4 = &pinctrl_4;
+		i2c0 = &i2c_0;
+		i2c1 = &i2c_1;
+		i2c2 = &i2c_2;
+		i2c3 = &i2c_3;
 	};
 
 	cpus {
@@ -218,4 +222,56 @@
 		clocks = <&clock 147>, <&clock 421>;
 		clock-names = "sclk_fimd", "fimd";
 	};
+
+	i2c_0: i2c@12C60000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C60000 0x100>;
+		interrupts = <0 56 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clock 261>;
+		clock-names = "i2c";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c0_bus>;
+		status = "disabled";
+	};
+
+	i2c_1: i2c@12C70000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C70000 0x100>;
+		interrupts = <0 57 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clock 262>;
+		clock-names = "i2c";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c1_bus>;
+		status = "disabled";
+	};
+
+       i2c_2: i2c@12C80000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C80000 0x100>;
+		interrupts = <0 58 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clock 263>;
+		clock-names = "i2c";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_bus>;
+		status = "disabled";
+       };
+
+	i2c_3: i2c@12C90000 {
+		compatible = "samsung,s3c2440-i2c";
+		reg = <0x12C90000 0x100>;
+		interrupts = <0 59 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clock 264>;
+		clock-names = "i2c";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c3_bus>;
+		status = "disabled";
+	};
 };
-- 
1.7.10.4

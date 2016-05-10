From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Replace deprecated hsi2c compatible on Exynos5420
Date: Tue, 10 May 2016 20:29:30 +0200
Message-ID: <1462904970-31526-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:35010 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751602AbcEJS3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 May 2016 14:29:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>

Since commit 218e1496135e ("i2c: exynos5: add support for HSI2C on
Exynos5260 SoC") the "samsung,exynos5-hsi2c" is deprecated in favor of
SoC version specific: "samsung,exynos5250-hsi2c".

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 4c8523471c65..549ebf23fee0 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -645,7 +645,7 @@
 	};
 
 	hsi2c_4: i2c@12CA0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CA0000 0x1000>;
 		interrupts = <0 60 0>;
 		#address-cells = <1>;
@@ -658,7 +658,7 @@
 	};
 
 	hsi2c_5: i2c@12CB0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CB0000 0x1000>;
 		interrupts = <0 61 0>;
 		#address-cells = <1>;
@@ -671,7 +671,7 @@
 	};
 
 	hsi2c_6: i2c@12CC0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CC0000 0x1000>;
 		interrupts = <0 62 0>;
 		#address-cells = <1>;
@@ -684,7 +684,7 @@
 	};
 
 	hsi2c_7: i2c@12CD0000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12CD0000 0x1000>;
 		interrupts = <0 63 0>;
 		#address-cells = <1>;
@@ -697,7 +697,7 @@
 	};
 
 	hsi2c_8: i2c@12E00000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12E00000 0x1000>;
 		interrupts = <0 87 0>;
 		#address-cells = <1>;
@@ -710,7 +710,7 @@
 	};
 
 	hsi2c_9: i2c@12E10000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12E10000 0x1000>;
 		interrupts = <0 88 0>;
 		#address-cells = <1>;
@@ -723,7 +723,7 @@
 	};
 
 	hsi2c_10: i2c@12E20000 {
-		compatible = "samsung,exynos5-hsi2c";
+		compatible = "samsung,exynos5250-hsi2c";
 		reg = <0x12E20000 0x1000>;
 		interrupts = <0 203 0>;
 		#address-cells = <1>;
-- 
2.5.0

From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Thu, 12 Sep 2013 11:40:25 +0100
Message-ID: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42043 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751744Ab3ILKkn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:40:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Rather than requiring each board to explicitly disable the I2S controllers
it is not using instead require boards to enable those that they are using.

This is required for audio operation on Arndale, one of the unused I2S
controllers is pinmuxed with the LDO enable GPIOs for the WM1811A.

Signed-off-by: Mark Brown <broonie@linaro.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts  | 4 ++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 8 --------
 arch/arm/boot/dts/exynos5250.dtsi         | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cee55fa..4687fa0 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -412,6 +412,10 @@
 		status = "disabled";
 	};
 
+	i2s0: i2s@03830000 {
+		status = "okay";
+	};
+
 	spi_0: spi@12d20000 {
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 2538b32..f86d567 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -231,14 +231,6 @@
 		status = "okay";
 	};
 
-	i2s1: i2s@12D60000 {
-		status = "disabled";
-	};
-
-	i2s2: i2s@12D70000 {
-		status = "disabled";
-	};
-
 	sound {
 		compatible = "samsung,smdk-wm8994";
 
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7d7cc77..c863113 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -417,6 +417,7 @@
 
 	i2s0: i2s@03830000 {
 		compatible = "samsung,s5pv210-i2s";
+		status = "disabled";
 		reg = <0x03830000 0x100>;
 		dmas = <&pdma0 10
 			&pdma0 9
@@ -433,6 +434,7 @@
 
 	i2s1: i2s@12D60000 {
 		compatible = "samsung,s3c6410-i2s";
+		status = "disabled";
 		reg = <0x12D60000 0x100>;
 		dmas = <&pdma1 12
 			&pdma1 11>;
@@ -445,6 +447,7 @@
 
 	i2s2: i2s@12D70000 {
 		compatible = "samsung,s3c6410-i2s";
+		status = "disabled";
 		reg = <0x12D70000 0x100>;
 		dmas = <&pdma0 12
 			&pdma0 11>;
-- 
1.8.4.rc3

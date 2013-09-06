From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Fri,  6 Sep 2013 19:17:15 +0100
Message-ID: <1378491435-15624-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:55722 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326Ab3IFSRs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Sep 2013 14:17:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Rather than requiring each board to explicitly disable the I2S controllers
it is not using instead require boards to enable those that they are using.

This is required for audio operation on Arndale, one of the unused I2S
controllers is pinmuxed with the LDO enable GPIOs for the WM1811A.

Signed-off-by: Mark Brown <broonie@linaro.org>
---

This seems like a more robust approach to handling the externally
visible IPs - if this is OK I can go through and do further updates for
other devices.

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

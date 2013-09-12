From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on Exynos5250
Date: Thu, 12 Sep 2013 11:40:27 +0100
Message-ID: <1378982427-5802-3-git-send-email-broonie@kernel.org>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42041 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685Ab3ILKkn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:40:43 -0400
In-Reply-To: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Ensure that unused I2C controllers are not activated, causing problems due
to inappropriate pinmuxing or similar, by marking the controllers as
disabled by default and requiring boards to explicitly enable those that
are in use.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts  | 31 ++-----------------------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 25 +++++--------------------
 arch/arm/boot/dts/exynos5250-snow.dts     |  4 ++++
 arch/arm/boot/dts/exynos5250.dtsi         | 10 ++++++++++
 4 files changed, 21 insertions(+), 49 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 4687fa0..4c10901 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -31,6 +31,7 @@
 	};
 
 	i2c@12C60000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 		samsung,i2c-slave-addr = <0x66>;
@@ -319,16 +320,8 @@
 		};
 	};
 
-	i2c@12C70000 {
-		status = "disabled";
-	};
-
-	i2c@12C80000 {
-		status = "disabled";
-	};
-
 	i2c@12C90000 {
-		wm1811a@1a {
+		status = "okay";
 			compatible = "wlf,wm1811";
 			reg = <0x1a>;
 
@@ -346,26 +339,6 @@
 		};
 	};
 
-	i2c@12CA0000 {
-		status = "disabled";
-	};
-
-	i2c@12CB0000 {
-		status = "disabled";
-	};
-
-	i2c@12CC0000 {
-		status = "disabled";
-	};
-
-	i2c@12CD0000 {
-		status = "disabled";
-	};
-
-	i2c@121D0000 {
-		status = "disabled";
-	};
-
 	dwmmc_0: dwmmc0@12200000 {
 		num-slots = <1>;
 		supports-highspeed;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 67d3c43..90127e3 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -28,6 +28,7 @@
 	};
 
 	i2c@12C60000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 
@@ -62,6 +63,7 @@
 	};
 
 	i2c@12C70000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 
@@ -86,6 +88,7 @@
 	};
 
 	i2c@121D0000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <40000>;
 		samsung,i2c-slave-addr = <0x38>;
@@ -101,6 +104,7 @@
 	};
 
 	i2c@12C80000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 
@@ -110,27 +114,8 @@
 		};
 	};
 
-	i2c@12C90000 {
-		status = "disabled";
-	};
-
-	i2c@12CA0000 {
-		status = "disabled";
-	};
-
-	i2c@12CB0000 {
-		status = "disabled";
-	};
-
-	i2c@12CC0000 {
-		status = "disabled";
-	};
-
-	i2c@12CD0000 {
-		status = "disabled";
-	};
-
 	i2c@12CE0000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fd711e2..b7674d5 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -48,6 +48,10 @@
 		};
 	};
 
+	i2c@12CA0000 {
+		status = "okay";
+	};
+
 	i2c-arbitrator {
 		compatible = "i2c-arb-gpio-challenge";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index a886ee4..4d6312e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -229,6 +229,7 @@
 
 	i2c_0: i2c@12C60000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12C60000 0x100>;
 		interrupts = <0 56 0>;
 		#address-cells = <1>;
@@ -241,6 +242,7 @@
 
 	i2c_1: i2c@12C70000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12C70000 0x100>;
 		interrupts = <0 57 0>;
 		#address-cells = <1>;
@@ -253,6 +255,7 @@
 
 	i2c_2: i2c@12C80000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12C80000 0x100>;
 		interrupts = <0 58 0>;
 		#address-cells = <1>;
@@ -265,6 +268,7 @@
 
 	i2c_3: i2c@12C90000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12C90000 0x100>;
 		interrupts = <0 59 0>;
 		#address-cells = <1>;
@@ -277,6 +281,7 @@
 
 	i2c_4: i2c@12CA0000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12CA0000 0x100>;
 		interrupts = <0 60 0>;
 		#address-cells = <1>;
@@ -289,6 +294,7 @@
 
 	i2c_5: i2c@12CB0000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12CB0000 0x100>;
 		interrupts = <0 61 0>;
 		#address-cells = <1>;
@@ -301,6 +307,7 @@
 
 	i2c_6: i2c@12CC0000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12CC0000 0x100>;
 		interrupts = <0 62 0>;
 		#address-cells = <1>;
@@ -313,6 +320,7 @@
 
 	i2c_7: i2c@12CD0000 {
 		compatible = "samsung,s3c2440-i2c";
+		status = "disabled";
 		reg = <0x12CD0000 0x100>;
 		interrupts = <0 63 0>;
 		#address-cells = <1>;
@@ -325,6 +333,7 @@
 
 	i2c_8: i2c@12CE0000 {
 		compatible = "samsung,s3c2440-hdmiphy-i2c";
+		status = "disabled";
 		reg = <0x12CE0000 0x1000>;
 		interrupts = <0 64 0>;
 		#address-cells = <1>;
@@ -335,6 +344,7 @@
 
 	i2c@121D0000 {
                 compatible = "samsung,exynos5-sata-phy-i2c";
+		status = "disabled";
                 reg = <0x121D0000 0x100>;
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
1.8.4.rc3

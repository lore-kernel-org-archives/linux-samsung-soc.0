From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] ARM: dts: Disable I2C controllers by default on Exynos5250
Date: Fri, 13 Sep 2013 13:09:55 +0100
Message-ID: <1379074196-9834-3-git-send-email-broonie@kernel.org>
References: <1379074196-9834-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49974 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754244Ab3IMMKO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Sep 2013 08:10:14 -0400
In-Reply-To: <1379074196-9834-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Ensure that unused I2C controllers are not activated, causing problems due
to inappropriate pinmuxing or similar, by marking the controllers as
disabled by default and requiring boards to explicitly enable those that
are in use.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/boot/dts/cros5250-common.dtsi    | 12 ++++++++----
 arch/arm/boot/dts/exynos5250-arndale.dts  | 31 +++----------------------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 25 +++++--------------------
 arch/arm/boot/dts/exynos5250.dtsi         | 10 ++++++++++
 4 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 0fcca29..7dbba08 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -30,6 +30,7 @@
 	};
 
 	i2c@12C60000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <378000>;
 
@@ -173,6 +174,7 @@
 	};
 
 	i2c@12C70000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <378000>;
 
@@ -186,6 +188,7 @@
 	};
 
 	i2c@12C80000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 
@@ -196,30 +199,31 @@
 	};
 
 	i2c@12C90000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 	};
 
 	i2c@12CA0000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 	};
 
 	i2c@12CB0000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 	};
 
-	i2c@12CC0000 {
-		status = "disabled";
-	};
-
 	i2c@12CD0000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 	};
 
 	i2c@12CE0000 {
+		status = "okay";
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <378000>;
 
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 1141939..4b5550c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -34,6 +34,7 @@
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
 		samsung,i2c-slave-addr = <0x66>;
+		status = "okay";
 
 		s5m8767_pmic@66 {
 			compatible = "samsung,s5m8767-pmic";
@@ -319,16 +320,10 @@
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
 		wm1811a@1a {
+			status = "okay";
+
 			compatible = "wlf,wm1811";
 			reg = <0x1a>;
 
@@ -346,26 +341,6 @@
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
index 67d3c43..f594dd7 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -30,6 +30,7 @@
 	i2c@12C60000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
+		status = "okay";
 
 		eeprom@50 {
 			compatible = "samsung,s524ad0xd1";
@@ -64,6 +65,7 @@
 	i2c@12C70000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <20000>;
+		status = "okay";
 
 		eeprom@51 {
 			compatible = "samsung,s524ad0xd1";
@@ -89,6 +91,7 @@
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <40000>;
 		samsung,i2c-slave-addr = <0x38>;
+		status = "okay";
 
 		sata-phy {
 			compatible = "samsung,sata-phy";
@@ -103,6 +106,7 @@
 	i2c@12C80000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
+		status = "okay";
 
 		hdmiddc@50 {
 			compatible = "samsung,exynos4210-hdmiddc";
@@ -110,29 +114,10 @@
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
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
+		status = "okay";
 
 		hdmiphy@38 {
 			compatible = "samsung,exynos4212-hdmiphy";
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index a886ee4..cbbc1bc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -237,6 +237,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c0_bus>;
+		status = "disabled";
 	};
 
 	i2c_1: i2c@12C70000 {
@@ -249,6 +250,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c1_bus>;
+		status = "disabled";
 	};
 
 	i2c_2: i2c@12C80000 {
@@ -261,6 +263,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c2_bus>;
+		status = "disabled";
 	};
 
 	i2c_3: i2c@12C90000 {
@@ -273,6 +276,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c3_bus>;
+		status = "disabled";
 	};
 
 	i2c_4: i2c@12CA0000 {
@@ -285,6 +289,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c4_bus>;
+		status = "disabled";
 	};
 
 	i2c_5: i2c@12CB0000 {
@@ -297,6 +302,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c5_bus>;
+		status = "disabled";
 	};
 
 	i2c_6: i2c@12CC0000 {
@@ -309,6 +315,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c6_bus>;
+		status = "disabled";
 	};
 
 	i2c_7: i2c@12CD0000 {
@@ -321,6 +328,7 @@
 		clock-names = "i2c";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c7_bus>;
+		status = "disabled";
 	};
 
 	i2c_8: i2c@12CE0000 {
@@ -331,6 +339,7 @@
 		#size-cells = <0>;
 		clocks = <&clock 302>;
 		clock-names = "i2c";
+		status = "disabled";
 	};
 
 	i2c@121D0000 {
@@ -340,6 +349,7 @@
                 #size-cells = <0>;
 		clocks = <&clock 288>;
 		clock-names = "i2c";
+		status = "disabled";
 	};
 
 	spi_0: spi@12d20000 {
-- 
1.8.4.rc3

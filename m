From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH V4 4/4] ARM: dts: rename mmc dts node for exynos5 series
Date: Tue,  3 Sep 2013 11:34:24 +0530
Message-ID: <1378188264-22382-5-git-send-email-yuvaraj.cd@samsung.com>
References: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:59129 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754976Ab3ICGEy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 02:04:54 -0400
In-Reply-To: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

This patch rename's the device tree mmc node's from "dwmmc" to "mmc".
According to ePAPR chapter 2.2.2 generic node name recommendation,
it has been opted change from dwmmc to mmc.Also this patch remove the
instance index from the node name.

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi    |    8 ++++----
 arch/arm/boot/dts/exynos5250-arndale.dts  |    4 ++--
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ++--
 arch/arm/boot/dts/exynos5250-snow.dts     |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi         |   16 ++++++++--------
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index dc259e8b..6470536 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -229,7 +229,7 @@
 		};
 	};
 
-	dwmmc0@12200000 {
+	mmc@12200000 {
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
@@ -247,11 +247,11 @@
 		};
 	};
 
-	dwmmc1@12210000 {
+	mmc@12210000 {
 		status = "disabled";
 	};
 
-	dwmmc2@12220000 {
+	mmc@12220000 {
 		num-slots = <1>;
 		supports-highspeed;
 		fifo-depth = <0x80>;
@@ -269,7 +269,7 @@
 		};
 	};
 
-	dwmmc3@12230000 {
+	mmc@12230000 {
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 176ef16..418f869 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -366,7 +366,7 @@
 		status = "disabled";
 	};
 
-	dwmmc_0: dwmmc0@12200000 {
+	mmc_0: mmc@12200000 {
 		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
@@ -385,7 +385,7 @@
 		};
 	};
 
-	dwmmc_2: dwmmc2@12220000 {
+	mmc_2: mmc@12220000 {
 		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 5a4831d..99784ec 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -140,7 +140,7 @@
 		};
 	};
 
-	dwmmc0@12200000 {
+	mmc@12200000 {
 		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
@@ -158,7 +158,7 @@
 		};
 	};
 
-	dwmmc2@12220000 {
+	mmc@12220000 {
 		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fd711e2..a9395c4 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -175,7 +175,7 @@
 	 * On Snow we've got SIP WiFi and so can keep drive strengths low to
 	 * reduce EMI.
 	 */
-	dwmmc3@12230000 {
+	mmc@12230000 {
 		slot@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index fb28d21..9922d1e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -33,10 +33,10 @@
 		gsc1 = &gsc_1;
 		gsc2 = &gsc_2;
 		gsc3 = &gsc_3;
-		mshc0 = &dwmmc_0;
-		mshc1 = &dwmmc_1;
-		mshc2 = &dwmmc_2;
-		mshc3 = &dwmmc_3;
+		mshc0 = &mmc_0;
+		mshc1 = &mmc_1;
+		mshc2 = &mmc_2;
+		mshc3 = &mmc_3;
 		i2c0 = &i2c_0;
 		i2c1 = &i2c_1;
 		i2c2 = &i2c_2;
@@ -387,7 +387,7 @@
 		pinctrl-0 = <&spi2_bus>;
 	};
 
-	dwmmc_0: dwmmc0@12200000 {
+	mmc_0: mmc@12200000 {
 		compatible = "samsung,exynos5250-dw-mshc";
 		interrupts = <0 75 0>;
 		#address-cells = <1>;
@@ -399,7 +399,7 @@
 		status = "disabled";
 	};
 
-	dwmmc_1: dwmmc1@12210000 {
+	mmc_1: mmc@12210000 {
 		compatible = "samsung,exynos5250-dw-mshc";
 		interrupts = <0 76 0>;
 		#address-cells = <1>;
@@ -411,7 +411,7 @@
 		status = "disabled";
 	};
 
-	dwmmc_2: dwmmc2@12220000 {
+	mmc_2: mmc@12220000 {
 		compatible = "samsung,exynos5250-dw-mshc";
 		interrupts = <0 77 0>;
 		#address-cells = <1>;
@@ -423,7 +423,7 @@
 		status = "disabled";
 	};
 
-	dwmmc_3: dwmmc3@12230000 {
+	mmc_3: mmc@12230000 {
 		compatible = "samsung,exynos5250-dw-mshc";
 		reg = <0x12230000 0x1000>;
 		interrupts = <0 78 0>;
-- 
1.7.9.5

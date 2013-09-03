From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH V4 2/4] ARM: dts: exynos: change status property of dwmmc nodes
Date: Tue,  3 Sep 2013 11:34:22 +0530
Message-ID: <1378188264-22382-3-git-send-email-yuvaraj.cd@samsung.com>
References: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:47959 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754976Ab3ICGEp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 02:04:45 -0400
In-Reply-To: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

According to ePAPR, chapter 2.3.4, the status property has
defined that it should be set to "disabled" when "the device
is not presently operational, but it might become operational
in the future".

So this patch disable dwmmc node by "status = disabled" in SOC
dts file and enable dwmmc node by "status = okay" in board specific
dts file.

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts  |   10 ++--------
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   10 ++--------
 arch/arm/boot/dts/exynos5250.dtsi         |    4 ++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cee55fa..a4dc784 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -367,6 +367,7 @@
 	};
 
 	dwmmc_0: dwmmc0@12200000 {
+		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
@@ -385,11 +386,8 @@
 		};
 	};
 
-	dwmmc_1: dwmmc1@12210000 {
-		status = "disabled";
-	};
-
 	dwmmc_2: dwmmc2@12220000 {
+		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
 		fifo-depth = <0x80>;
@@ -408,10 +406,6 @@
 		};
 	};
 
-	dwmmc_3: dwmmc3@12230000 {
-		status = "disabled";
-	};
-
 	spi_0: spi@12d20000 {
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 2538b32..bd19d55d 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -141,6 +141,7 @@
 	};
 
 	dwmmc0@12200000 {
+		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
@@ -158,11 +159,8 @@
 		};
 	};
 
-	dwmmc1@12210000 {
-		status = "disabled";
-	};
-
 	dwmmc2@12220000 {
+		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
 		fifo-depth = <0x80>;
@@ -180,10 +178,6 @@
 		};
 	};
 
-	dwmmc3@12230000 {
-		status = "disabled";
-	};
-
 	spi_0: spi@12d20000 {
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d42844b..300e4e6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -395,6 +395,7 @@
 		reg = <0x12200000 0x1000>;
 		clocks = <&clock 280>, <&clock 139>;
 		clock-names = "biu", "ciu";
+		status = "disabled";
 	};
 
 	dwmmc_1: dwmmc1@12210000 {
@@ -405,6 +406,7 @@
 		reg = <0x12210000 0x1000>;
 		clocks = <&clock 281>, <&clock 140>;
 		clock-names = "biu", "ciu";
+		status = "disabled";
 	};
 
 	dwmmc_2: dwmmc2@12220000 {
@@ -415,6 +417,7 @@
 		reg = <0x12220000 0x1000>;
 		clocks = <&clock 282>, <&clock 141>;
 		clock-names = "biu", "ciu";
+		status = "disabled";
 	};
 
 	dwmmc_3: dwmmc3@12230000 {
@@ -425,6 +428,7 @@
 		#size-cells = <0>;
 		clocks = <&clock 283>, <&clock 142>;
 		clock-names = "biu", "ciu";
+		status = "disabled";
 	};
 
 	i2s0: i2s@03830000 {
-- 
1.7.9.5

From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 5/7] ARM: dts: Update DP controller DT Node for Exynos5 based SoCs
Date: Tue, 30 Jul 2013 16:49:36 +0530
Message-ID: <1375183178-8201-6-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:65245 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753350Ab3G3LUT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:20:19 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb10so6461830pad.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:20:18 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Moves the properties of DP controller to exynos5.dtsi which are common
across exynos5 SoCs like Exynos5250 and Exynos5420.

The PHY DP Node is based on Jingoo Han's <jg1.han@samsung.com> patch at
https://patchwork.linuxtv.org/patch/19189/

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi            |   11 +++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts  |    3 ++-
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 ++-
 arch/arm/boot/dts/exynos5250.dtsi         |   21 +++++++++------------
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index d464b6c..213a2d8 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -118,4 +118,15 @@
 		status = "disabled";
 	};
 
+	dp-controller@145b0000 {
+		compatible = "samsung,exynos5-dp";
+		reg = <0x145b0000 0x1000>;
+		interrupts = <10 3>;
+		interrupt-parent = <&combiner>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+
 };
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 76825ef..ce74400 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -509,13 +509,14 @@
 		};
 	};
 
-	dp-controller {
+	dp-controller@145b0000 {
 		samsung,color-space = <0>;
 		samsung,dynamic-range = <0>;
 		samsung,ycbcr-coeff = <0>;
 		samsung,color-depth = <1>;
 		samsung,link-rate = <0x0a>;
 		samsung,lane-count = <4>;
+		status = "okay";
 	};
 
 	fimd: fimd@14400000 {
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index d176dbb..f9ab99c 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -250,7 +250,7 @@
 		samsung,vbus-gpio = <&gpx2 6 0>;
 	};
 
-	dp-controller {
+	dp-controller@145b0000 {
 		samsung,color-space = <0>;
 		samsung,dynamic-range = <0>;
 		samsung,ycbcr-coeff = <0>;
@@ -260,6 +260,7 @@
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&dp_hpd>;
+		status = "okay";
 	};
 
 	fimd@14400000 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 238bdb2..1c017dc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -614,20 +614,17 @@
 		interrupts = <0 94 0>;
 	};
 
-	dp-controller {
-		compatible = "samsung,exynos5-dp";
-		reg = <0x145b0000 0x1000>;
-		interrupts = <10 3>;
-		interrupt-parent = <&combiner>;
+	dp_phy: video-phy@10040720 {
+		compatible = "samsung,exynos5250-dp-video-phy";
+		reg = <0x10040720 4>;
+		#phy-cells = <0>;
+	};
+
+	dp-controller@145b0000 {
 		clocks = <&clock 342>;
 		clock-names = "dp";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dptx-phy {
-			reg = <0x10040720>;
-			samsung,enable-mask = <1>;
-		};
+		phys = <&dp_phy>;
+		phy-names = "dp";
 	};
 
 	fimd@14400000 {
-- 
1.7.9.5

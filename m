From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 5/7] ARM: dts: Update DP controller DT Node for Exynos5 based SoCs
Date: Mon, 29 Jul 2013 19:19:29 +0530
Message-ID: <1375105771-8106-6-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59497 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755095Ab3G2NuH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:50:07 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc8so4644782pbc.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:50:07 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Moves the properties of DP controller to exynos5.dtsi which are common
across exynos5 SoCs like Exynos5250 and Exynos5420.

The PHY DP Node is based on Jingoo Han's <jg1.han@samsung.com> patch at
https://patchwork.linuxtv.org/patch/19189/

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5.dtsi            |   29 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts  |    9 ---------
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    7 -------
 arch/arm/boot/dts/exynos5250.dtsi         |   12 +-----------
 4 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 80a4630..682ecf9 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -118,4 +118,33 @@
 		status = "disabled";
 	};
 
+	dp_phy: video-phy@10040720 {
+		compatible = "samsung,exynos5250-dp-video-phy";
+		reg = <0x10040720 4>;
+		#phy-cells = <0>;
+	};
+
+	dp-controller {
+		compatible = "samsung,exynos5-dp";
+		reg = <0x145b0000 0x1000>;
+		interrupts = <10 3>;
+		interrupt-parent = <&combiner>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <4>;
+
+		phys = <&dp_phy>;
+		phy-names = "dp";
+
+		status = "disabled";
+
+	};
+
+
 };
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 96d528d..01eef7d 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -509,15 +509,6 @@
 		};
 	};
 
-	dp-controller {
-		samsung,color-space = <0>;
-		samsung,dynamic-range = <0>;
-		samsung,ycbcr-coeff = <0>;
-		samsung,color-depth = <1>;
-		samsung,link-rate = <0x0a>;
-		samsung,lane-count = <4>;
-	};
-
 	fimd: fimd@14400000 {
 		display-timings {
 			native-mode = <&timing0>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 3b32c26..109f9f7 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -251,13 +251,6 @@
 	};
 
 	dp-controller {
-		samsung,color-space = <0>;
-		samsung,dynamic-range = <0>;
-		samsung,ycbcr-coeff = <0>;
-		samsung,color-depth = <1>;
-		samsung,link-rate = <0x0a>;
-		samsung,lane-count = <4>;
-
 		pinctrl-names = "default";
 		pinctrl-0 = <&dp_hpd>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 20c32fc..3b5bf13 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -615,19 +615,9 @@
 	};
 
 	dp-controller {
-		compatible = "samsung,exynos5-dp";
-		reg = <0x145b0000 0x1000>;
-		interrupts = <10 3>;
-		interrupt-parent = <&combiner>;
 		clocks = <&clock 342>;
 		clock-names = "dp";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dptx-phy {
-			reg = <0x10040720>;
-			samsung,enable-mask = <1>;
-		};
+		status = "okay";
 	};
 
 	fimd {
-- 
1.7.9.5

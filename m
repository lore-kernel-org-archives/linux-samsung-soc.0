From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/8] ARM: dts: exynos4x12: Move MCT node to exynos4x12.dtsi
Date: Tue, 20 Aug 2013 15:52:43 +0200
Message-ID: <1377006768-23174-4-git-send-email-t.figa@samsung.com>
References: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36543 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab3HTNxE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 09:53:04 -0400
In-reply-to: <1377006768-23174-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, pawel.moll@arm.com, mark.rutland@arm.com, rob.herring@calxeda.com, swarren@wwwdotorg.org, galak@codeaurora.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

For MCT block compatible with "samsung,exynos4412-mct", that uses PPI
interrupts for local timers, only one local interrupt needs to be
specified, since it is a per-processor interrupt.

This allows moving MCT node of Exynos4x12 SoCs back to common
exynos4x12.dtsi, since they have the same set of interrupts to be
specified, which was the only difference.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4212.dtsi | 20 --------------------
 arch/arm/boot/dts/exynos4412.dtsi | 24 ------------------------
 arch/arm/boot/dts/exynos4x12.dtsi | 20 ++++++++++++++++++++
 3 files changed, 20 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 028752e..443b8a2 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -34,24 +34,4 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
 			     <0 107 0>, <0 108 0>;
 	};
-
-	mct@10050000 {
-		compatible = "samsung,exynos4412-mct";
-		reg = <0x10050000 0x800>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
-			     <4 0>, <5 0>;
-
-		mct_map: mct-map {
-			#interrupt-cells = <2>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0x0 0 &gic 0 57 0>,
-					<0x1 0 &combiner 12 5>,
-					<0x2 0 &combiner 12 6>,
-					<0x3 0 &combiner 12 7>,
-					<0x4 0 &gic 1 12 0>,
-					<0x5 0 &gic 1 12 0>;
-		};
-	};
 };
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 85d2c26..1388ce0 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -35,30 +35,6 @@
 			     <0 107 0>, <0 108 0>, <0 48 0>, <0 42 0>;
 	};
 
-	mct@10050000 {
-		compatible = "samsung,exynos4412-mct";
-		reg = <0x10050000 0x800>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
-			     <4 0>, <5 0>, <6 0>, <7 0>;
-		clocks = <&clock 3>, <&clock 344>;
-		clock-names = "fin_pll", "mct";
-
-		mct_map: mct-map {
-			#interrupt-cells = <2>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0x0 0 &gic 0 57 0>,
-					<0x1 0 &combiner 12 5>,
-					<0x2 0 &combiner 12 6>,
-					<0x3 0 &combiner 12 7>,
-					<0x4 0 &gic 1 12 0>,
-					<0x5 0 &gic 1 12 0>,
-					<0x6 0 &gic 1 12 0>,
-					<0x7 0 &gic 1 12 0>;
-		};
-	};
-
 	mshc@12550000 {
 		compatible = "samsung,exynos4412-dw-mshc";
 		reg = <0x12550000 0x1000>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index ad531fe..5012bc8 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -41,6 +41,26 @@
 		#clock-cells = <1>;
 	};
 
+	mct@10050000 {
+		compatible = "samsung,exynos4412-mct";
+		reg = <0x10050000 0x800>;
+		interrupt-parent = <&mct_map>;
+		interrupts = <0 0>, <1 0>, <2 0>, <3 0>, <4 0>;
+		clocks = <&clock 3>, <&clock 344>;
+		clock-names = "fin_pll", "mct";
+
+		mct_map: mct-map {
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			interrupt-map = <0x0 0 &gic 0 57 0>,
+					<0x1 0 &combiner 12 5>,
+					<0x2 0 &combiner 12 6>,
+					<0x3 0 &combiner 12 7>,
+					<0x4 0 &gic 1 12 0>;
+		};
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x11400000 0x1000>;
-- 
1.8.3.2

From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 5/6] ARM: dts: exynos: Fix missing spaces after labels
Date: Thu, 12 Dec 2013 17:12:17 +0100
Message-ID: <1386864738-19829-6-git-send-email-t.figa@samsung.com>
References: <1386864738-19829-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52974 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711Ab3LLQMl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:12:41 -0500
In-reply-to: <1386864738-19829-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

For consistency with other device tree nodes, this patch adds missing
spaces after node labels.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi            | 4 ++--
 arch/arm/boot/dts/exynos4210.dtsi         | 4 ++--
 arch/arm/boot/dts/exynos4212.dtsi         | 2 +-
 arch/arm/boot/dts/exynos4412.dtsi         | 2 +-
 arch/arm/boot/dts/exynos5.dtsi            | 4 ++--
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 6 +++---
 arch/arm/boot/dts/exynos5440.dtsi         | 2 +-
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index a73eeb5..4fed2ad 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -85,14 +85,14 @@
 		reg = <0x10023CE0 0x20>;
 	};
 
-	gic:interrupt-controller@10490000 {
+	gic: interrupt-controller@10490000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
 	};
 
-	combiner:interrupt-controller@10440000 {
+	combiner: interrupt-controller@10440000 {
 		compatible = "samsung,exynos4210-combiner";
 		#interrupt-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index b0fee69..48ecd7a 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -36,11 +36,11 @@
 		reg = <0x10023CA0 0x20>;
 	};
 
-	gic:interrupt-controller@10490000 {
+	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
 
-	combiner:interrupt-controller@10440000 {
+	combiner: interrupt-controller@10440000 {
 		samsung,combiner-nr = <16>;
 		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
 			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 443b8a2..94a43f9 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -22,7 +22,7 @@
 / {
 	compatible = "samsung,exynos4212";
 
-	gic:interrupt-controller@10490000 {
+	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 1388ce0..ec1b166 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -22,7 +22,7 @@
 / {
 	compatible = "samsung,exynos4412";
 
-	gic:interrupt-controller@10490000 {
+	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index e52b038..258dca4 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -23,7 +23,7 @@
 		reg = <0x10000000 0x100>;
 	};
 
-	combiner:interrupt-controller@10440000 {
+	combiner: interrupt-controller@10440000 {
 		compatible = "samsung,exynos4210-combiner";
 		#interrupt-cells = <2>;
 		interrupt-controller;
@@ -39,7 +39,7 @@
 				<0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
 	};
 
-	gic:interrupt-controller@10481000 {
+	gic: interrupt-controller@10481000 {
 		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 13746df..3f80c23 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -37,7 +37,7 @@
 		};
 	};
 
-	vdd:fixed-regulator@0 {
+	vdd: fixed-regulator@0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-supply";
 		regulator-min-microvolt = <1800000>;
@@ -45,7 +45,7 @@
 		regulator-always-on;
 	};
 
-	dbvdd:fixed-regulator@1 {
+	dbvdd: fixed-regulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "dbvdd-supply";
 		regulator-min-microvolt = <3300000>;
@@ -53,7 +53,7 @@
 		regulator-always-on;
 	};
 
-	spkvdd:fixed-regulator@2 {
+	spkvdd: fixed-regulator@2 {
 		compatible = "regulator-fixed";
 		regulator-name = "spkvdd-supply";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 8da1070..02a0a12 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -29,7 +29,7 @@
 		#clock-cells = <1>;
 	};
 
-	gic:interrupt-controller@2E0000 {
+	gic: interrupt-controller@2E0000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-- 
1.8.4.3

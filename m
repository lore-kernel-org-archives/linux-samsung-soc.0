From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 5/5] ARM: dts: add mct device tree node for all supported Exynos SoC's
Date: Sun, 25 Nov 2012 02:14:53 +0530
Message-ID: <1353789893-2460-6-git-send-email-thomas.abraham@linaro.org>
References: <1353789893-2460-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:37569 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752308Ab2KXUpq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 15:45:46 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so4179500pad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Nov 2012 12:45:46 -0800 (PST)
In-Reply-To: <1353789893-2460-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, chaos.youn@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

Add MCT device tree node for Exynos4210, Exynos4212, Exynos4412 and Exynos5250.

Cc: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    8 ++++++++
 arch/arm/boot/dts/exynos4212.dtsi |   10 ++++++++++
 arch/arm/boot/dts/exynos4412.dtsi |    8 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi |   21 +++++++++++++++++++++
 4 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index e31bfc4..cca1546 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -47,6 +47,14 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
 	};
 
+	mct@10050000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
+			     <0 42 0>, <0 48 0>;
+		samsung,mct-nr-local-irqs = <4>;
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,pinctrl-exynos4210";
 		reg = <0x11400000 0x1000>;
diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index c6ae200..87c6da4 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -25,4 +25,14 @@
 	gic:interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
+
+	mct@10050000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
+			     <1 12 0>, <1 12 0>;
+		samsung,mct-nr-local-irqs = <2>;
+	};
+
+
 };
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index d7dfe31..ccf020a 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -25,4 +25,12 @@
 	gic:interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
+
+	mct@10050000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
+			     <1 12 0>, <1 12 0>, <1 12 0>, <1 12 0>;
+		samsung,mct-nr-local-irqs = <4>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 39fc4bd..959aa1a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -70,6 +70,27 @@
 			     <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
 	};
 
+	mct@101C0000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x101C0000 0x800>;
+		interrupt-controller;
+		#interrups-cells = <2>;
+		interrupt-parent = <&mct_map>;
+		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
+			     <4 0>, <5 0>;
+		samsung,mct-nr-local-irqs = <2>;
+
+		mct_map: mct-map {
+			compatible = "samsung,mct-map";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			interrupt-map = <0x0 0 &combiner 23 3>,
+					<0x4 0 &gic 0 120 0>,
+					<0x5 0 &gic 0 121 0>;
+		};
+	};
+
 	watchdog {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x101D0000 0x100>;
-- 
1.7.4.4

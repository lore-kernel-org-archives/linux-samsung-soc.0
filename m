From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 5/5] ARM: dts: add mct device tree node for all supported
 Exynos SoC's
Date: Sat, 03 Nov 2012 20:15:38 +0530
Message-ID: <1351953938-13487-6-git-send-email-thomas.abraham@linaro.org>
References: <1351953938-13487-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55475 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543Ab2KCOVI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Nov 2012 10:21:08 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCX00K4T16XUI20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:21:07 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCX00DCN163LTA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:21:07 +0900 (KST)
In-reply-to: <1351953938-13487-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, Changhwan Youn <chaos.youn@samsung.com>

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
index 214c557..129762c 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -42,6 +42,14 @@
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
index 49546bc..688acf2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -56,6 +56,27 @@
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
1.6.6.rc2

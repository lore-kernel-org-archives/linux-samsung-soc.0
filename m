From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 5/7] ARM: dts: add mct device tree node for all supported Exynos SoC's
Date: Mon, 21 Jan 2013 02:02:20 -0800
Message-ID: <1358762542-19008-6-git-send-email-thomas.abraham@linaro.org>
References: <1358762542-19008-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:55115 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581Ab3AUKDH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 05:03:07 -0500
Received: by mail-pb0-f53.google.com with SMTP id un1so2585590pbc.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jan 2013 02:03:06 -0800 (PST)
In-Reply-To: <1358762542-19008-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, chaos.youn@samsung.com, sylvester.nawrocki@gmail.com, olof@lixom.net, swarren@nvidia.com

Add MCT device tree node for Exynos4210, Exynos4212, Exynos4412 and Exynos5250.

Cc: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    7 +++++++
 arch/arm/boot/dts/exynos4212.dtsi |    9 +++++++++
 arch/arm/boot/dts/exynos4412.dtsi |    7 +++++++
 arch/arm/boot/dts/exynos5250.dtsi |   20 ++++++++++++++++++++
 4 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 89c7dd0..b1c76fa 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -47,6 +47,13 @@
 			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>;
 	};
 
+	mct@10050000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
+			     <0 42 0>, <0 48 0>;
+	};
+
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index c6ae200..113adcf 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -25,4 +25,13 @@
 	gic:interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
+
+	mct@10050000 {
+		compatible = "samsung,exynos4412-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
+			     <1 12 0>, <1 12 0>;
+	};
+
+
 };
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index d7dfe31..78ed377 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -25,4 +25,11 @@
 	gic:interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
+
+	mct@10050000 {
+		compatible = "samsung,exynos4412-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 57 0>, <0 0 0>, <0 0 0>, <0 0 0>,
+			     <1 12 0>, <1 12 0>, <1 12 0>, <1 12 0>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 30485de..7e8fcaf 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -69,6 +69,26 @@
 			     <0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
 	};
 
+	mct@101C0000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x101C0000 0x800>;
+		interrupt-controller;
+		#interrups-cells = <2>;
+		interrupt-parent = <&mct_map>;
+		interrupts = <0 0>, <0 0>, <0 0>, <0 0>,
+			     <4 0>, <5 0>;
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
 	pmu {
 		compatible = "arm,cortex-a15-pmu";
 		interrupt-parent = <&combiner>;
-- 
1.7.5.4

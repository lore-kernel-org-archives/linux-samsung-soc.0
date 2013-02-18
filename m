From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v6 12/16] ARM: dts: add Exynos4 and Exynos5 clock controller nodes
Date: Mon, 18 Feb 2013 13:51:22 +0530
Message-ID: <1361175686-19400-13-git-send-email-thomas.abraham@linaro.org>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:39762 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756663Ab3BRIWf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 03:22:35 -0500
Received: by mail-pa0-f44.google.com with SMTP id kp1so2692803pab.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Feb 2013 00:22:35 -0800 (PST)
In-Reply-To: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Add clock controller nodes for Exynos4210, Exynos4x12, Exynos5250 and
Exynos5440 SoC.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    6 ++++++
 arch/arm/boot/dts/exynos4x12.dtsi |    6 ++++++
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 arch/arm/boot/dts/exynos5440.dtsi |    6 ++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 0e16a34..6b25095 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -69,6 +69,12 @@
 		};
 	};
 
+	clock: clock-controller@0x10030000 {
+		compatible = "samsung,exynos4210-clock";
+		reg = <0x10030000 0x20000>;
+		#clock-cells = <1>;
+	};
+
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 022a839..75be8f5 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -36,6 +36,12 @@
 			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
 	};
 
+	clock: clock-controller@0x10030000 {
+		compatible = "samsung,exynos4412-clock";
+		reg = <0x10030000 0x20000>;
+		#clock-cells = <1>;
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x11400000 0x1000>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2bb558e..d3eae4e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -60,6 +60,12 @@
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044040 0x20>;
 	};
+
+	clock: clock-controller@0x10010000 {
+		compatible = "samsung,exynos5250-clock";
+		reg = <0x10010000 0x30000>;
+		#clock-cells = <1>;
+	};
 
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a9-gic";
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 5c5a699..f5834d0 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -16,6 +16,12 @@
 
 	interrupt-parent = <&gic>;
 
+	clock: clock-controller@0x160000 {
+		compatible = "samsung,exynos5440-clock";
+		reg = <0x160000 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic:interrupt-controller@2E0000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
-- 
1.7.5.4

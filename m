From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos: Add CPU perf counters to Exynos54xx
 boards
Date: Thu, 23 Nov 2017 15:34:30 +0100
Message-ID: <20171123143431.12434-3-m.szyprowski@samsung.com>
References: <20171123143431.12434-1-m.szyprowski@samsung.com>
        <CGME20171123143446eucas1p227bdf3a407f4cbbe9cd5bd95d3817972@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49749 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbdKWOev (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 09:34:51 -0500
In-reply-to: <20171123143431.12434-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>, Willy Wolff <willy.mh.wolff@gmail.com>

From: Marian Mihailescu <mihailescu2m@gmail.com>

Enable support for ARM Performance Monitoring Units available in Cortex-A7
and Cortex-A15 CPU cores for Exynos54xx SoCs (5410, 5420 and 5422/5800).

The PMUs interrupts are defined in the common exynos54xx.dtsi device tree,
but the PMUs are enabled and have their interrupt CPU affinity defined
next to each SoC's cpus node.

Tested with perf on Odroid XU4 (Exynos5422):
armv7_cortex_a7 PMU driver: 5 counters available
armv7_cortex_a15 PMU driver: 7 counters available

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
Signed-off-by: Willy Wolff <willy.mh.wolff@gmail.com>
[mszyprow: reordered nodes according to krzk request, fixed typos]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5410.dtsi      |  5 +++++
 arch/arm/boot/dts/exynos5420-cpus.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos5422-cpus.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos54xx.dtsi      | 20 ++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 06713ec86f0d..c4dbc689e5cb 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -264,6 +264,11 @@
 	};
 };
 
+&arm_a15_pmu {
+	interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	status = "okay";
+};
+
 &i2c_0 {
 	clocks = <&clock CLK_I2C0>;
 	clock-names = "i2c";
diff --git a/arch/arm/boot/dts/exynos5420-cpus.dtsi b/arch/arm/boot/dts/exynos5420-cpus.dtsi
index d7d703aa1699..4ee2f9718e8a 100644
--- a/arch/arm/boot/dts/exynos5420-cpus.dtsi
+++ b/arch/arm/boot/dts/exynos5420-cpus.dtsi
@@ -132,3 +132,13 @@
 		};
 	};
 };
+
+&arm_a7_pmu {
+	interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	status = "okay";
+};
+
+&arm_a15_pmu {
+	interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/exynos5422-cpus.dtsi b/arch/arm/boot/dts/exynos5422-cpus.dtsi
index ec01d8020c2d..73fb37d5042d 100644
--- a/arch/arm/boot/dts/exynos5422-cpus.dtsi
+++ b/arch/arm/boot/dts/exynos5422-cpus.dtsi
@@ -131,3 +131,13 @@
 		};
 	};
 };
+
+&arm_a7_pmu {
+	interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	status = "okay";
+};
+
+&arm_a15_pmu {
+	interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index a5007f182bc4..02a25efebfcf 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -29,6 +29,26 @@
 	};
 
 	soc: soc {
+		arm_a7_pmu: arm-a7-pmu {
+			compatible = "arm,cortex-a7-pmu";
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		arm_a15_pmu: arm-a15-pmu {
+			compatible = "arm,cortex-a15-pmu";
+			interrupt-parent = <&combiner>;
+			interrupts = <1 2>,
+				     <7 0>,
+				     <16 6>,
+				     <19 2>;
+			status = "disabled";
+		};
+
 		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x54000>;
-- 
2.14.2

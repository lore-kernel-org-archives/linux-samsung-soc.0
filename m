From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] arm64: dts: exynos: Move pmu and timer nodes out of soc
Date: Mon, 15 Apr 2019 20:34:39 +0200
Message-ID: <20190415183440.19697-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The ARM PMU and ARM architected timer nodes are part of ARM CPU design
therefore they should not be inside the soc node.  This also fixes DTC
W=1 warnings like:

    arch/arm64/boot/dts/exynos/exynos7.dtsi:472.11-480.5:
        Warning (simple_bus_reg): /soc/arm-pmu: missing or empty reg/ranges property
    arch/arm64/boot/dts/exynos/exynos7.dtsi:482.9-492.5:
        Warning (simple_bus_reg): /soc/timer: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 36 +++++++++---------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 44 +++++++++++-----------
 2 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 41ecbc49c61e..62cedf9855cf 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -23,6 +23,24 @@
 
 	interrupt-parent = <&gic>;
 
+	arm_a53_pmu {
+		compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	arm_a57_pmu {
+		compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -237,24 +255,6 @@
 		#size-cells = <1>;
 		ranges;
 
-		arm_a53_pmu {
-			compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
-		};
-
-		arm_a57_pmu {
-			compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
-			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
-		};
-
 		chipid@10000000 {
 			compatible = "samsung,exynos4210-chipid";
 			reg = <0x10000000 0x100>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 967558a93d82..f83ad4c491f2 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -28,6 +28,16 @@
 		tmuctrl0 = &tmuctrl_0;
 	};
 
+	arm-pmu {
+		compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu_atlas0>, <&cpu_atlas1>,
+				     <&cpu_atlas2>, <&cpu_atlas3>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -469,28 +479,6 @@
 			status = "disabled";
 		};
 
-		arm-pmu {
-			compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-affinity = <&cpu_atlas0>, <&cpu_atlas1>,
-					     <&cpu_atlas2>, <&cpu_atlas3>;
-		};
-
-		timer {
-			compatible = "arm,armv8-timer";
-			interrupts = <GIC_PPI 13
-					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 14
-					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 11
-					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 10
-					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
-		};
-
 		pmu_system_controller: system-controller@105c0000 {
 			compatible = "samsung,exynos7-pmu", "syscon";
 			reg = <0x105c0000 0x5000>;
@@ -635,6 +623,18 @@
 			};
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
 };
 
 #include "exynos7-pinctrl.dtsi"
-- 
2.17.1

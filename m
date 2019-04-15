From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] arm64: dts: exynos: Move fixed-clocks out of soc
Date: Mon, 15 Apr 2019 20:34:40 +0200
Message-ID: <20190415183440.19697-2-krzk@kernel.org>
References: <20190415183440.19697-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415183440.19697-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The XXTI fixed-clock is the input to the SoC therefore it should not be
inside the soc node.  This also fixes DTC W=1 warning:

    arch/arm64/boot/dts/exynos/exynos7.dtsi:90.17-94.5:
        Warning (simple_bus_reg): /soc/xxti: missing or empty reg/ranges property

While moving, change the name of the xxti node to match the generic type
of device (following DeviceTree specification).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 13 +++++++------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 13 +++++++------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 62cedf9855cf..d29d13f4694f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -41,6 +41,13 @@
 		interrupt-affinity = <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
 	};
 
+	xxti: clock {
+		/* XXTI */
+		compatible = "fixed-clock";
+		clock-output-names = "oscclk";
+		#clock-cells = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -260,12 +267,6 @@
 			reg = <0x10000000 0x100>;
 		};
 
-		xxti: xxti {
-			compatible = "fixed-clock";
-			clock-output-names = "oscclk";
-			#clock-cells = <0>;
-		};
-
 		cmu_top: clock-controller@10030000 {
 			compatible = "samsung,exynos5433-cmu-top";
 			reg = <0x10030000 0x1000>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index f83ad4c491f2..077d23478901 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -38,6 +38,13 @@
 				     <&cpu_atlas2>, <&cpu_atlas3>;
 	};
 
+	fin_pll: clock {
+		/* XXTI */
+		compatible = "fixed-clock";
+		clock-output-names = "fin_pll";
+		#clock-cells = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -87,12 +94,6 @@
 			reg = <0x10000000 0x100>;
 		};
 
-		fin_pll: xxti {
-			compatible = "fixed-clock";
-			clock-output-names = "fin_pll";
-			#clock-cells = <0>;
-		};
-
 		gic: interrupt-controller@11001000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.17.1

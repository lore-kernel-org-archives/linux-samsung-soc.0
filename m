From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/2] ARM: dts: exynos: Convert exynos5250.dtsi to opp-v2
 bindings
Date: Tue,  7 Aug 2018 12:48:48 +0200
Message-ID: <20180807104905eucas1p262885b5e1ee707bce83da40c50feb402~IlH7UbpE_1482814828eucas1p2p@eucas1p2.samsung.com>
References: <20180807104757eucas1p201bd787714f50a798ee7457bdaf2c2f9~IlG8LJVcj1319313193eucas1p2R@eucas1p2.samsung.com>
        <CGME20180807104905eucas1p262885b5e1ee707bce83da40c50feb402@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180807104757eucas1p201bd787714f50a798ee7457bdaf2c2f9~IlG8LJVcj1319313193eucas1p2R@eucas1p2.samsung.com>
Sender: stable-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Convert Exynos5250 to OPP-v2 bindings. This is a preparation to add proper
support for suspend operation point, which cannot be marked in opp-v1.

CC: <stable@vger.kernel.org> # 4.3.x: cd6f55457eb4  ARM: dts: exynos: Remove "cooling-{min|max}-level" for CPU nodes
CC: <stable@vger.kernel.org> # 4.3.x: 672f33198bee  arm: dts: exynos: Add missing cooling device properties for CPUs
CC: <stable@vger.kernel.org> # 4.3.x
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 130 ++++++++++++++++++++----------
 1 file changed, 88 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index da163a40af15..8746189990eb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -54,62 +54,108 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0>;
-			clock-frequency = <1700000000>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-names = "cpu";
-			clock-latency = <140000>;
-
-			operating-points = <
-				1700000 1300000
-				1600000 1250000
-				1500000 1225000
-				1400000 1200000
-				1300000 1150000
-				1200000 1125000
-				1100000 1100000
-				1000000 1075000
-				 900000 1050000
-				 800000 1025000
-				 700000 1012500
-				 600000 1000000
-				 500000  975000
-				 400000  950000
-				 300000  937500
-				 200000  925000
-			>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <1>;
-			clock-frequency = <1700000000>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-names = "cpu";
-			clock-latency = <140000>;
-
-			operating-points = <
-				1700000 1300000
-				1600000 1250000
-				1500000 1225000
-				1400000 1200000
-				1300000 1150000
-				1200000 1125000
-				1100000 1100000
-				1000000 1075000
-				 900000 1050000
-				 800000 1025000
-				 700000 1012500
-				 600000 1000000
-				 500000  975000
-				 400000  950000
-				 300000  937500
-				 200000  925000
-			>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 	};
 
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <925000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <937500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <950000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <1012500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1025000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <1050000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <1075000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <1100000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1125000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <1150000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <1200000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <1225000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1250000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <1300000>;
+			clock-latency-ns = <140000>;
+		};
+	};
+
 	soc: soc {
 		sysram@2020000 {
 			compatible = "mmio-sram";
-- 
2.17.1

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Move CPU OPP tables out of SoC node on Exynos5420
Date: Mon, 29 Apr 2019 19:35:24 +0200
Message-ID: <20190429173524.4870-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The cpus node is a top-level node, not inside the soc.  Therefore its
OPP tables should be there as well.

This also fixes the DTC warnings like:

    arch/arm/boot/dts/exynos5420.dtsi:46.37-109.5:
        Warning simple_bus_reg): /soc/opp_table0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420.dtsi | 216 +++++++++++++++---------------
 1 file changed, 109 insertions(+), 107 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5fb2326875dc..16088186a33a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -42,117 +42,119 @@
 	 * by exynos5420-cpus.dtsi or exynos5422-cpus.dtsi.
 	 */
 
-	soc: soc {
-		cluster_a15_opp_table: opp_table0 {
-			compatible = "operating-points-v2";
-			opp-shared;
-			opp-1800000000 {
-				opp-hz = /bits/ 64 <1800000000>;
-				opp-microvolt = <1250000>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1700000000 {
-				opp-hz = /bits/ 64 <1700000000>;
-				opp-microvolt = <1212500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1600000000 {
-				opp-hz = /bits/ 64 <1600000000>;
-				opp-microvolt = <1175000>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1500000000 {
-				opp-hz = /bits/ 64 <1500000000>;
-				opp-microvolt = <1137500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1400000000 {
-				opp-hz = /bits/ 64 <1400000000>;
-				opp-microvolt = <1112500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1300000000 {
-				opp-hz = /bits/ 64 <1300000000>;
-				opp-microvolt = <1062500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1200000000 {
-				opp-hz = /bits/ 64 <1200000000>;
-				opp-microvolt = <1037500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1100000000 {
-				opp-hz = /bits/ 64 <1100000000>;
-				opp-microvolt = <1012500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1000000000 {
-				opp-hz = /bits/ 64 <1000000000>;
-				opp-microvolt = < 987500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-900000000 {
-				opp-hz = /bits/ 64 <900000000>;
-				opp-microvolt = < 962500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-800000000 {
-				opp-hz = /bits/ 64 <800000000>;
-				opp-microvolt = < 937500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-700000000 {
-				opp-hz = /bits/ 64 <700000000>;
-				opp-microvolt = < 912500>;
-				clock-latency-ns = <140000>;
-			};
+	cluster_a15_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1250000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <1212500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1175000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <1137500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <1112500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <1062500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1037500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <1012500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = < 987500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = < 962500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = < 937500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = < 912500>;
+			clock-latency-ns = <140000>;
 		};
+	};
 
-		cluster_a7_opp_table: opp_table1 {
-			compatible = "operating-points-v2";
-			opp-shared;
-			opp-1300000000 {
-				opp-hz = /bits/ 64 <1300000000>;
-				opp-microvolt = <1275000>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1200000000 {
-				opp-hz = /bits/ 64 <1200000000>;
-				opp-microvolt = <1212500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1100000000 {
-				opp-hz = /bits/ 64 <1100000000>;
-				opp-microvolt = <1162500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-1000000000 {
-				opp-hz = /bits/ 64 <1000000000>;
-				opp-microvolt = <1112500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-900000000 {
-				opp-hz = /bits/ 64 <900000000>;
-				opp-microvolt = <1062500>;
-				clock-latency-ns = <140000>;
-			};
-			opp-800000000 {
-				opp-hz = /bits/ 64 <800000000>;
-				opp-microvolt = <1025000>;
-				clock-latency-ns = <140000>;
-			};
-			opp-700000000 {
-				opp-hz = /bits/ 64 <700000000>;
-				opp-microvolt = <975000>;
-				clock-latency-ns = <140000>;
-			};
-			opp-600000000 {
-				opp-hz = /bits/ 64 <600000000>;
-				opp-microvolt = <937500>;
-				clock-latency-ns = <140000>;
-			};
+	cluster_a7_opp_table: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <1275000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1212500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <1162500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <1112500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <1062500>;
+			clock-latency-ns = <140000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1025000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <140000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <937500>;
+			clock-latency-ns = <140000>;
 		};
+	};
 
+	soc: soc {
 		cci: cci@10d20000 {
 			compatible = "arm,cci-400";
 			#address-cells = <1>;
-- 
2.17.1

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 3/4] ARM: dts: exynos: Move fixed-clocks out of soc on Exynos3250
Date: Mon, 15 Apr 2019 20:05:09 +0200
Message-ID: <20190415180510.6044-3-krzk@kernel.org>
References: <20190415180510.6044-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415180510.6044-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The three fixed-clocks (xusbxti, xxti and xtcxo) are inputs to the
Exynos3250 therefore they should not be inside the soc node.  This also
fixes DTC W=1 warning:

    arch/arm/boot/dts/exynos3250.dtsi:112.21-139.5:
        Warning (simple_bus_reg): /soc/fixed-rate-clocks: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 58 +++++++++++++++----------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 6e74e6815b01..8ce3a7786b19 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -97,6 +97,35 @@
 		};
 	};
 
+	fixed-rate-clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		xusbxti: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			clock-frequency = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "xusbxti";
+		};
+
+		xxti: clock@1 {
+			compatible = "fixed-clock";
+			reg = <1>;
+			clock-frequency = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "xxti";
+		};
+
+		xtcxo: clock@2 {
+			compatible = "fixed-clock";
+			reg = <2>;
+			clock-frequency = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "xtcxo";
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
 		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -109,35 +138,6 @@
 		#size-cells = <1>;
 		ranges;
 
-		fixed-rate-clocks {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			xusbxti: clock@0 {
-				compatible = "fixed-clock";
-				reg = <0>;
-				clock-frequency = <0>;
-				#clock-cells = <0>;
-				clock-output-names = "xusbxti";
-			};
-
-			xxti: clock@1 {
-				compatible = "fixed-clock";
-				reg = <1>;
-				clock-frequency = <0>;
-				#clock-cells = <0>;
-				clock-output-names = "xxti";
-			};
-
-			xtcxo: clock@2 {
-				compatible = "fixed-clock";
-				reg = <2>;
-				clock-frequency = <0>;
-				#clock-cells = <0>;
-				clock-output-names = "xtcxo";
-			};
-		};
-
 		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
-- 
2.17.1

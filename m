From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/4] ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU
Date: Tue, 12 Feb 2019 18:50:52 +0100
Message-ID: <20190212175052.6310-5-krzk@kernel.org>
References: <20190212175052.6310-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212175052.6310-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Move the ADC from exynos5420.dtsi to a shared file between Exynos5410 and
Exynos542x: exynos54xx.dtsi.  Enable the ADC on Odroid XU board.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts |  5 +++++
 arch/arm/boot/dts/exynos5410.dtsi         |  6 ++++++
 arch/arm/boot/dts/exynos5420.dtsi         | 18 ++++++------------
 arch/arm/boot/dts/exynos54xx.dtsi         |  9 +++++++++
 4 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 434a7591ff63..282600a1e08d 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -87,6 +87,11 @@
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo10_reg>;
+	status = "okay";
+};
+
 &audi2s0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 57fc9c949e54..e6f78b1cee7c 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -260,6 +260,12 @@
 	};
 };
 
+&adc {
+	clocks = <&clock CLK_TSADC>;
+	clock-names = "adc";
+	samsung,syscon-phandle = <&pmu_system_controller>;
+};
+
 &arm_a15_pmu {
 	interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index aaff15880761..149badfca74d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -548,18 +548,6 @@
 			status = "disabled";
 		};
 
-		adc: adc@12d10000 {
-			compatible = "samsung,exynos-adc-v2";
-			reg = <0x12D10000 0x100>;
-			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clock CLK_TSADC>;
-			clock-names = "adc";
-			#io-channel-cells = <1>;
-			io-channel-ranges;
-			samsung,syscon-phandle = <&pmu_system_controller>;
-			status = "disabled";
-		};
-
 		hsi2c_8: i2c@12e00000 {
 			compatible = "samsung,exynos5250-hsi2c";
 			reg = <0x12E00000 0x1000>;
@@ -1363,6 +1351,12 @@
 	};
 };
 
+&adc {
+	clocks = <&clock CLK_TSADC>;
+	clock-names = "adc";
+	samsung,syscon-phandle = <&pmu_system_controller>;
+};
+
 &dp {
 	clocks = <&clock CLK_DP1>;
 	clock-names = "dp";
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index de26e5ee0d2d..e21ed6eb6c4c 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -96,6 +96,15 @@
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		adc: adc@12d10000 {
+			compatible = "samsung,exynos-adc-v2";
+			reg = <0x12d10000 0x100>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+			status = "disabled";
+		};
+
 		/* i2c_0-3 are defined in exynos5.dtsi */
 		hsi2c_4: i2c@12ca0000 {
 			compatible = "samsung,exynos5250-hsi2c";
-- 
2.17.1

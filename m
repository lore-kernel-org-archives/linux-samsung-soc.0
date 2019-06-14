From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Add PMU interrupt affinity to Exynos4 boards
Date: Fri, 14 Jun 2019 16:26:40 +0200
Message-ID: <1560522400-31086-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Move SoC-specific PMU properties from exynos4.dtsi to respective SoC
(4210 or 4412) so common DTSI would have only common properties.

Define there also interrupt affinity to remove the boot warning message:

    hw perfevents: no interrupt-affinity property for /pmu, guessing.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4.dtsi    | 2 +-
 arch/arm/boot/dts/exynos4210.dtsi | 6 ++++++
 arch/arm/boot/dts/exynos4412.dtsi | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 36ccf227434d..dde27451faa8 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -54,7 +54,7 @@
 	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
-		interrupts = <2 2>, <3 2>;
+		status = "disabled";
 	};
 
 	soc: soc {
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index b491c345b2e8..ce29e026e226 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -461,6 +461,12 @@
 		 <&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
 };
 
+&pmu {
+	interrupts = <2 2>, <3 2>;
+	interrupt-affinity = <&cpu0>, <&cpu1>;
+	status = "okay";
+};
+
 &pmu_system_controller {
 	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
 			"clkout4", "clkout8", "clkout9";
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e5c041ec0756..4a58b70df125 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -737,6 +737,8 @@
 
 &pmu {
 	interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
+	interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	status = "okay";
 };
 
 &pmu_system_controller {
-- 
2.7.4

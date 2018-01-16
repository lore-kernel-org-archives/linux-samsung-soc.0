From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/3] ARM: dts: exynos: Fix missing missing reg warning for syscon restart nodes
Date: Tue, 16 Jan 2018 22:31:28 +0100
Message-ID: <20180116213129.16209-2-krzk@kernel.org>
References: <20180116213129.16209-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116213129.16209-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix DTC warnings like:

    arch/arm/boot/dts/exynos4412-trats2.dtb: Warning (simple_bus_reg):
        Node /soc/syscon-poweroff missing or empty reg/ranges property
    arch/arm/boot/dts/exynos4412-trats2.dtb: Warning (simple_bus_reg):
        Node /soc/syscon-reboot missing or empty reg/ranges property

by moving the syscon poweroff and restart nodes into the PMU (Power
Management Unit) node.  The PMU node is the actual block responsible for
power management, including typical Exynos on/off/restart procedures.
Therefore the syscon poweroff and restart nodes logically belong to it.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Tested on Exynos5420 and Exynos4412. Other tests are welcomed.
---
 .../devicetree/bindings/arm/samsung/pmu.txt        |  4 +++-
 arch/arm/boot/dts/exynos-syscon-restart.dtsi       | 28 ++++++++++------------
 arch/arm/boot/dts/exynos3250.dtsi                  |  4 ++--
 arch/arm/boot/dts/exynos4.dtsi                     |  5 ++--
 arch/arm/boot/dts/exynos4412.dtsi                  |  2 +-
 arch/arm/boot/dts/exynos5.dtsi                     |  1 -
 arch/arm/boot/dts/exynos5250.dtsi                  |  3 ++-
 arch/arm/boot/dts/exynos5410.dtsi                  |  3 ++-
 arch/arm/boot/dts/exynos5420.dtsi                  |  3 ++-
 9 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 779f5614bcee..405646655ec7 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -12,6 +12,8 @@ Properties:
 		   - "samsung,exynos5433-pmu" - for Exynos5433 SoC.
 		   - "samsung,exynos7-pmu" - for Exynos7 SoC.
 		second value must be always "syscon".
+		If PMU contains optional syscon-poweroff or syscon-restart nodes,
+		then third value must be "simple-mfd".
 
  - reg : offset and length of the register set.
 
@@ -45,7 +47,7 @@ following properties:
 
 Example :
 pmu_system_controller: system-controller@10040000 {
-	compatible = "samsung,exynos5250-pmu", "syscon";
+	compatible = "samsung,exynos5250-pmu", "syscon", "simple-mfd";
 	reg = <0x10040000 0x5000>;
 	interrupt-controller;
 	#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/exynos-syscon-restart.dtsi b/arch/arm/boot/dts/exynos-syscon-restart.dtsi
index 09a2040054ed..279ea09f4fe2 100644
--- a/arch/arm/boot/dts/exynos-syscon-restart.dtsi
+++ b/arch/arm/boot/dts/exynos-syscon-restart.dtsi
@@ -6,22 +6,18 @@
  * published by the Free Software Foundation.
  */
 
-/ {
-	soc {
-		compatible = "simple-bus";
-
-		poweroff: syscon-poweroff {
-			compatible = "syscon-poweroff";
-			regmap = <&pmu_system_controller>;
-			offset = <0x330C>; /* PS_HOLD_CONTROL */
-			mask = <0x5200>; /* reset value */
-		};
+&pmu_system_controller {
+	poweroff: syscon-poweroff {
+		compatible = "syscon-poweroff";
+		regmap = <&pmu_system_controller>;
+		offset = <0x330C>; /* PS_HOLD_CONTROL */
+		mask = <0x5200>; /* reset value */
+	};
 
-		reboot: syscon-reboot {
-			compatible = "syscon-reboot";
-			regmap = <&pmu_system_controller>;
-			offset = <0x0400>; /* SWRESET */
-			mask = <0x1>;
-		};
+	reboot: syscon-reboot {
+		compatible = "syscon-reboot";
+		regmap = <&pmu_system_controller>;
+		offset = <0x0400>; /* SWRESET */
+		mask = <0x1>;
 	};
 };
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index b8fb94f5daa8..95297e682207 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -15,7 +15,6 @@
  */
 
 #include "exynos4-cpu-thermal.dtsi"
-#include "exynos-syscon-restart.dtsi"
 #include <dt-bindings/clock/exynos3250.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -148,7 +147,7 @@
 		};
 
 		pmu_system_controller: system-controller@10020000 {
-			compatible = "samsung,exynos3250-pmu", "syscon";
+			compatible = "samsung,exynos3250-pmu", "syscon", "simple-mfd";
 			reg = <0x10020000 0x4000>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -914,3 +913,4 @@
 };
 
 #include "exynos3250-pinctrl.dtsi"
+#include "exynos-syscon-restart.dtsi"
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6d59cc827649..e5c4befe66f9 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -20,7 +20,6 @@
 #include <dt-bindings/clock/exynos-audss-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
-#include "exynos-syscon-restart.dtsi"
 
 / {
 	interrupt-parent = <&gic>;
@@ -174,7 +173,7 @@
 	};
 
 	pmu_system_controller: system-controller@10020000 {
-		compatible = "samsung,exynos4210-pmu", "syscon";
+		compatible = "samsung,exynos4210-pmu", "syscon", "simple-mfd";
 		reg = <0x10020000 0x4000>;
 		interrupt-controller;
 		#interrupt-cells = <3>;
@@ -1010,3 +1009,5 @@
 		clock-names = "secss";
 	};
 };
+
+#include "exynos-syscon-restart.dtsi"
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e4ad2fc0329e..7872c89d22c3 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -725,7 +725,7 @@
 };
 
 &pmu_system_controller {
-	compatible = "samsung,exynos4412-pmu", "syscon";
+	compatible = "samsung,exynos4412-pmu", "syscon", "simple-mfd";
 	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
 			"clkout4", "clkout8", "clkout9";
 	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f8d7de1144f1..359f49bdd4e2 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -12,7 +12,6 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
-#include "exynos-syscon-restart.dtsi"
 
 / {
 	interrupt-parent = <&gic>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 56626d1a4235..24896413ed22 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -239,7 +239,7 @@
 		};
 
 		pmu_system_controller: system-controller@10040000 {
-			compatible = "samsung,exynos5250-pmu", "syscon";
+			compatible = "samsung,exynos5250-pmu", "syscon", "simple-mfd";
 			reg = <0x10040000 0x5000>;
 			clock-names = "clkout16";
 			clocks = <&clock CLK_FIN_PLL>;
@@ -1114,3 +1114,4 @@
 };
 
 #include "exynos5250-pinctrl.dtsi"
+#include "exynos-syscon-restart.dtsi"
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 1e6b57d013c4..3f7e006e46a0 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -66,7 +66,7 @@
 		ranges;
 
 		pmu_system_controller: system-controller@10040000 {
-			compatible = "samsung,exynos5410-pmu", "syscon";
+			compatible = "samsung,exynos5410-pmu", "syscon", "simple-mfd";
 			reg = <0x10040000 0x5000>;
 			clock-names = "clkout16";
 			clocks = <&fin_pll>;
@@ -439,3 +439,4 @@
 };
 
 #include "exynos5410-pinctrl.dtsi"
+#include "exynos-syscon-restart.dtsi"
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 2f3cb2a97f71..7cb13a01795e 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -706,7 +706,7 @@
 		};
 
 		pmu_system_controller: system-controller@10040000 {
-			compatible = "samsung,exynos5420-pmu", "syscon";
+			compatible = "samsung,exynos5420-pmu", "syscon", "simple-mfd";
 			reg = <0x10040000 0x5000>;
 			clock-names = "clkout16";
 			clocks = <&clock CLK_FIN_PLL>;
@@ -1531,3 +1531,4 @@
 };
 
 #include "exynos5420-pinctrl.dtsi"
+#include "exynos-syscon-restart.dtsi"
-- 
2.11.0

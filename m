From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Add watchdog amd Security SubSystem to
 Exynos5410
Date: Wed, 01 Jun 2016 11:45:51 +0200
Message-ID: <1464774351-23604-3-git-send-email-k.kozlowski@samsung.com>
References: <1464774351-23604-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1464774351-23604-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Move watchdog and Security SubSystem nodes from exynos5420.dtsi to file
shared with Exynos5410 and configure the clocks on the latter.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5410.dtsi | 11 +++++++++++
 arch/arm/boot/dts/exynos5420.dtsi | 28 +++++++++++-----------------
 arch/arm/boot/dts/exynos54xx.dtsi | 12 ++++++++++++
 3 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index f1effd3f03c4..b76f56c2fe8b 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -297,6 +297,11 @@
 	clock-names = "uart", "clk_uart_baud0";
 };
 
+&sss {
+	clocks = <&clock CLK_SSS>;
+	clock-names = "secss";
+};
+
 &sromc {
 	#address-cells = <2>;
 	#size-cells = <1>;
@@ -349,4 +354,10 @@
 	samsung,pmureg-phandle = <&pmu_system_controller>;
 };
 
+&watchdog {
+	clocks = <&clock CLK_WDT>;
+	clock-names = "watchdog";
+	samsung,syscon-phandle = <&pmu_system_controller>;
+};
+
 #include "exynos5410-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 265747bb19d1..beb6f453039e 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -694,23 +694,6 @@
 			#include "exynos4412-tmu-sensor-conf.dtsi"
 		};
 
-		watchdog: watchdog@101D0000 {
-			compatible = "samsung,exynos5420-wdt";
-			reg = <0x101D0000 0x100>;
-			interrupts = <0 42 0>;
-			clocks = <&clock CLK_WDT>;
-			clock-names = "watchdog";
-			samsung,syscon-phandle = <&pmu_system_controller>;
-		};
-
-		sss: sss@10830000 {
-			compatible = "samsung,exynos4210-secss";
-			reg = <0x10830000 0x300>;
-			interrupts = <0 112 0>;
-			clocks = <&clock CLK_SSS>;
-			clock-names = "secss";
-		};
-
 		sysmmu_g2dr: sysmmu@0x10A60000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A60000 0x1000>;
@@ -1030,6 +1013,11 @@
 	clock-names = "uart", "clk_uart_baud0";
 };
 
+&sss {
+	clocks = <&clock CLK_SSS>;
+	clock-names = "secss";
+};
+
 &usbdrd3_0 {
 	clocks = <&clock CLK_USBD300>;
 	clock-names = "usbdrd30";
@@ -1073,4 +1061,10 @@
 	samsung,pmureg-phandle = <&pmu_system_controller>;
 };
 
+&watchdog {
+	clocks = <&clock CLK_WDT>;
+	clock-names = "watchdog";
+	samsung,syscon-phandle = <&pmu_system_controller>;
+};
+
 #include "exynos5420-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 0eb8aa31b7d9..06a604911e87 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -74,6 +74,18 @@
 			};
 		};
 
+		watchdog: watchdog@101d0000 {
+			compatible = "samsung,exynos5420-wdt";
+			reg = <0x101d0000 0x100>;
+			interrupts = <0 42 0>;
+		};
+
+		sss: sss@10830000 {
+			compatible = "samsung,exynos4210-secss";
+			reg = <0x10830000 0x300>;
+			interrupts = <0 112 0>;
+		};
+
 		/* i2c_0-3 are defined in exynos5.dtsi */
 		hsi2c_4: i2c@12ca0000 {
 			compatible = "samsung,exynos5250-hsi2c";
-- 
1.9.1

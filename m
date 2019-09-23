From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 8/8] ARM: dts: exynos: Use defines for MCT interrupt GIC SPI/PPI specifier
Date: Mon, 23 Sep 2019 18:14:11 +0200
Message-ID: <20190923161411.9236-8-krzk@kernel.org>
References: <20190923161411.9236-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923161411.9236-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Replace hard-coded number with appropriate define for GIC SPI or PPI
specifier in interrupt.  This makes code easier to read.  No expected
functionality change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |  8 ++++----
 arch/arm/boot/dts/exynos4412.dtsi |  4 ++--
 arch/arm/boot/dts/exynos5250.dtsi |  4 ++--
 arch/arm/boot/dts/exynos54xx.dtsi | 16 ++++++++--------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 5fa33d43821e..aac3b7a20a37 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -111,12 +111,12 @@
 			reg = <0x10050000 0x800>;
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
 			clock-names = "fin_pll", "mct";
-			interrupts-extended = <&gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&gic GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 					      <&combiner 12 6>,
 					      <&combiner 12 7>,
-					      <&gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
+					      <&gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@10060000 {
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 9b5fb4e54d7c..96a5ef3a2864 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -248,11 +248,11 @@
 			reg = <0x10050000 0x800>;
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
 			clock-names = "fin_pll", "mct";
-			interrupts-extended = <&gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&gic GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
 					      <&combiner 12 5>,
 					      <&combiner 12 6>,
 					      <&combiner 12 7>,
-					      <&gic 1 12 IRQ_TYPE_LEVEL_HIGH>;
+					      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@10060000 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index a549eafd2c64..f01e3156191d 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -242,8 +242,8 @@
 					      <&combiner 23 4>,
 					      <&combiner 25 2>,
 					      <&combiner 25 3>,
-					      <&gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
+					      <&gic GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_0: pinctrl@11400000 {
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index aca1b4831e38..06ae40a2f1e9 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -71,14 +71,14 @@
 					      <&combiner 23 4>,
 					      <&combiner 25 2>,
 					      <&combiner 25 3>,
-					      <&gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 121 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 122 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 123 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 128 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 129 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 130 IRQ_TYPE_LEVEL_HIGH>,
-					      <&gic 0 131 IRQ_TYPE_LEVEL_HIGH>;
+					      <&gic GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@101d0000 {
-- 
2.17.1

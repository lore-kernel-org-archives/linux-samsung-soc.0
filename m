From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/4] ARM: dts: exynos: Update PMU node with CLKOUT related data
Date: Tue, 20 May 2014 18:43:31 +0200
Message-ID: <1400604211-9447-5-git-send-email-t.figa@samsung.com>
References: <1400604211-9447-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1400604211-9447-1-git-send-email-t.figa@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch extends nodes of PMU system controller on Exynos4210, 4x12,
5250 and 5420 SoCs with newly defined properties used by Exynos CLKOUT
driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 1 +
 arch/arm/boot/dts/exynos4210.dtsi | 9 +++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 6 ++++++
 arch/arm/boot/dts/exynos5250.dtsi | 3 +++
 arch/arm/boot/dts/exynos5420.dtsi | 3 +++
 5 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5a7176d..b4c6d93 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -113,6 +113,7 @@
 	pmu_system_controller: system-controller@10020000 {
 		compatible = "samsung,exynos4210-pmu", "syscon";
 		reg = <0x10020000 0x4000>;
+		#clock-cells = <1>;
 	};
 
 	dsi_0: dsi@11C80000 {
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index ee3001f..b7956cc 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -31,6 +31,15 @@
 		pinctrl2 = &pinctrl_2;
 	};
 
+	pmu_system_controller: system-controller@10020000 {
+		clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
+				"clkout4", "clkout8", "clkout9";
+		clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
+			<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
+			<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>,
+			<&clock CLK_XUSBXTI>;
+	};
+
 	sysram@02020000 {
 		compatible = "mmio-sram";
 		reg = <0x02020000 0x20000>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 264a28f..d9651fa 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -139,6 +139,12 @@
 
 	pmu_system_controller: system-controller@10020000 {
 		compatible = "samsung,exynos4212-pmu", "syscon";
+		clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
+				"clkout4", "clkout5", "clkout8", "clkout9";
+		clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
+			<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
+			<&clock CLK_OUT_CPU>, <&clock CLK_OUT_ISP>,
+			<&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
 	};
 
 	g2d@10800000 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 68a3e6f..cb939ef 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -191,6 +191,9 @@
 	pmu_system_controller: system-controller@10040000 {
 		compatible = "samsung,exynos5250-pmu", "syscon";
 		reg = <0x10040000 0x5000>;
+		#clock-cells = <0>;
+		clock-names = "clkout16";
+		clocks = <&clock CLK_FIN_PLL>;
 	};
 
 	watchdog@101D0000 {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8e7e35c..23d0ebb 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -723,6 +723,9 @@
 	pmu_system_controller: system-controller@10040000 {
 		compatible = "samsung,exynos5420-pmu", "syscon";
 		reg = <0x10040000 0x5000>;
+		#clock-cells = <0>;
+		clock-names = "clkout16";
+		clocks = <&clock CLK_FIN_PLL>;
 	};
 
 	tmu_cpu0: tmu@10060000 {
-- 
1.9.3

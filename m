From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv5 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Tue, 20 May 2014 11:06:27 +0900
Message-ID: <1400551590-7772-2-git-send-email-chanho61.park@samsung.com>
References: <1400551590-7772-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:26465 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752918AbaETCGh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 22:06:37 -0400
In-reply-to: <1400551590-7772-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>

This patch adds a PMU(Power Management Unit) syscon node. This
should be required for USB Phy syscon regmap I/F.

Cc: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt | 3 +++
 arch/arm/boot/dts/exynos4.dtsi                        | 5 +++++
 arch/arm/boot/dts/exynos4412.dtsi                     | 4 ++++
 arch/arm/boot/dts/exynos4x12.dtsi                     | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index f1f1552..b562634 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -2,6 +2,9 @@ SAMSUNG Exynos SoC series PMU Registers
 
 Properties:
  - compatible : should contain two values. First value must be one from following list:
+		   - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
+		   - "samsung,exynos4212-pmu" - for Exynos4212 SoC,
+		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
 		   - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
 		second value must be always "syscon".
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 58ff8e2..da29a2a 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -110,6 +110,11 @@
 		reg = <0x10010000 0x400>;
 	};
 
+	pmu_system_controller: system-controller@10020000 {
+		compatible = "samsung,exynos4210-pmu", "syscon";
+		reg = <0x10020000 0x4000>;
+	};
+
 	dsi_0: dsi@11C80000 {
 		compatible = "samsung,exynos4210-mipi-dsi";
 		reg = <0x11C80000 0x10000>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 15d3c0a..c42a3e1 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -29,4 +29,8 @@
 	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
+
+	pmu_system_controller: system-controller@10020000 {
+		compatible = "samsung,exynos4412-pmu", "syscon";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 70e3765..2f1e6c1 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -137,6 +137,10 @@
 		interrupts = <0 72 0>;
 	};
 
+	pmu_system_controller: system-controller@10020000 {
+		compatible = "samsung,exynos4212-pmu", "syscon";
+	};
+
 	g2d@10800000 {
 		compatible = "samsung,exynos4212-g2d";
 		reg = <0x10800000 0x1000>;
-- 
1.8.3.2

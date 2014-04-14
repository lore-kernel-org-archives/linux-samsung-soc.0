From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: clean up arm-pmu node
Date: Mon, 14 Apr 2014 22:03:04 +0900
Message-ID: <1397480584-16195-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37041 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754377AbaDNNDQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 09:03:16 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N40005KDUXFGMA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Apr 2014 22:03:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, Chanho Park <chanho61.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch cleans a arm-pmu node up for exynos4. Only exynos4412 series
boards have four pmu interrupts. Rest of exynos4 boards, except 4412, have only
two pmu interrupts. Thus, we can define two interrupts in the
exynos4.dtsi and extends the interrupts only exynos4412.dtsi.

Cc: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 6 ++++++
 arch/arm/boot/dts/exynos4210.dtsi | 6 ------
 arch/arm/boot/dts/exynos4412.dtsi | 6 ++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 6 ------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e541ecb..6de978c 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -105,6 +105,12 @@
 		reg = <0x10440000 0x1000>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <2 2>, <3 2>;
+	};
+
 	sys_reg: syscon@10010000 {
 		compatible = "samsung,exynos4-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index cacf614..4e7610f 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -75,12 +75,6 @@
 		#clock-cells = <1>;
 	};
 
-	pmu {
-		compatible = "arm,cortex-a9-pmu";
-		interrupt-parent = <&combiner>;
-		interrupts = <2 2>, <3 2>;
-	};
-
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x11400000 0x1000>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 15d3c0a..e6af870 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -26,6 +26,12 @@
 		samsung,combiner-nr = <20>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
+	};
+
 	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 3d77a40..318f3ac 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -31,12 +31,6 @@
 		mshc0 = &mshc_0;
 	};
 
-	pmu {
-		compatible = "arm,cortex-a9-pmu";
-		interrupt-parent = <&combiner>;
-		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
-	};
-
 	pd_isp: isp-power-domain@10023CA0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023CA0 0x20>;
-- 
1.8.3.2

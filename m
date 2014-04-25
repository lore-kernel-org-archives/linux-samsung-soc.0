From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2] ARM: dts: exynos4: clean up arm-pmu node
Date: Fri, 25 Apr 2014 11:05:53 +0900
Message-ID: <1398391553-4797-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21354 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125AbaDYCGL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 22:06:11 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4K001EADU9VS60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Apr 2014 11:06:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Chanho Park <chanho61.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch cleans a arm-pmu node up for exynos4. Only exynos4412 series
boards have four pmu interrupts. Rest of exynos4 boards, except 4412, have only
two pmu interrupts. Thus, we can define two interrupts in the
exynos4.dtsi and extends the interrupts only exynos4412.dtsi.

Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Changes from v1:
 - Remove duplicated properties in exynos4412.dtsi(Comment from Tomasz Figa)

 arch/arm/boot/dts/exynos4.dtsi    | 6 ++++++
 arch/arm/boot/dts/exynos4210.dtsi | 6 ------
 arch/arm/boot/dts/exynos4412.dtsi | 4 ++++
 arch/arm/boot/dts/exynos4x12.dtsi | 6 ------
 4 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 0401f4d..b43dc24 100644
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
index cb0e768d..e19c154 100644
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
index a40b6e2..7b75762 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -26,6 +26,10 @@
 		samsung,combiner-nr = <20>;
 	};
 
+	pmu {
+		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
+	};
+
 	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x4000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index c4a9306..b730a74 100644
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

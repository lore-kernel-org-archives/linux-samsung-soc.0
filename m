From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/4] ARM: dts: exynos4: Add CPU topology data
Date: Fri, 18 Apr 2014 16:43:01 +0200
Message-ID: <1397832181-5153-5-git-send-email-t.figa@samsung.com>
References: <1397832181-5153-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19765 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753350AbaDROnQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 10:43:16 -0400
In-reply-to: <1397832181-5153-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>

After fixing non-banked GIC support in GIC driver, CPU nodes can be
safely added to Exynos4 device tree sources, along with appropriate
gic-offset properties.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 19 +++++++++++++++++++
 arch/arm/boot/dts/exynos4212.dtsi | 19 +++++++++++++++++++
 arch/arm/boot/dts/exynos4412.dtsi | 37 +++++++++++++++++++++++++++++++++----
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index cacf614..e463361 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -25,6 +25,25 @@
 / {
 	compatible = "samsung,exynos4210", "samsung,exynos4";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@900 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0x900>;
+			gic-offset = <0x0000>;
+		};
+
+		cpu@901 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0x901>;
+			gic-offset = <0x8000>;
+		};
+	};
+
 	aliases {
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 3c00e6e..211e129 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -22,6 +22,25 @@
 / {
 	compatible = "samsung,exynos4212", "samsung,exynos4";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@a00 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0xa00>;
+			gic-offset = <0x0000>;
+		};
+
+		cpu@a01 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0xa01>;
+			gic-offset = <0x8000>;
+		};
+	};
+
 	combiner: interrupt-controller@10440000 {
 		samsung,combiner-nr = <18>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 15d3c0a..04530ef 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -22,11 +22,40 @@
 / {
 	compatible = "samsung,exynos4412", "samsung,exynos4";
 
-	combiner: interrupt-controller@10440000 {
-		samsung,combiner-nr = <20>;
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@a00 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0xa00>;
+			gic-offset = <0x0000>;
+		};
+
+		cpu@a01 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0xa01>;
+			gic-offset = <0x4000>;
+		};
+
+		cpu@a02 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0xa02>;
+			gic-offset = <0x8000>;
+		};
+
+		cpu@a03 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0xa03>;
+			gic-offset = <0xc000>;
+		};
 	};
 
-	gic: interrupt-controller@10490000 {
-		cpu-offset = <0x4000>;
+	combiner: interrupt-controller@10440000 {
+		samsung,combiner-nr = <20>;
 	};
 };
-- 
1.9.2

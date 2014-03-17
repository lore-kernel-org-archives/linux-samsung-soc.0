From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and SSDK-GH7 board
Date: Tue, 18 Mar 2014 07:14:35 +0900
Message-ID: <1395094477-8921-2-git-send-email-kgene.kim@samsung.com>
References: <1395094477-8921-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:60184 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752577AbaCQWPF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 18:15:05 -0400
In-Reply-To: <1395094477-8921-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/boot/dts/samsung-gh7.dtsi     | 134 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/samsung-ssdk-gh7.dts |  26 ++++++
 2 files changed, 160 insertions(+)
 create mode 100644 arch/arm64/boot/dts/samsung-gh7.dtsi
 create mode 100644 arch/arm64/boot/dts/samsung-ssdk-gh7.dts

diff --git a/arch/arm64/boot/dts/samsung-gh7.dtsi b/arch/arm64/boot/dts/samsung-gh7.dtsi
new file mode 100644
index 0000000..d3ab914
--- /dev/null
+++ b/arch/arm64/boot/dts/samsung-gh7.dtsi
@@ -0,0 +1,134 @@
+/*
+ * SAMSUNG GH7 SoC device tree source
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/memreserve/ 0xFEC00000 0x1400000;	/* EL3 monitor, secure intepreter */
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = "/amba/uart@12c00000";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu@000 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x000>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@001 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x001>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@002 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x002>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@003 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x003>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x100>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x101>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x102>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+		cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x103>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x8000fff8>;
+		};
+	};
+
+	gic: interrupt-controller@1C000000 {
+		compatible = "arm,cortex-a15-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x1C001000 0 0x1000>,	/* GIC Dist */
+		      <0x0 0x1C002000 0 0x1000>,	/* GIC CPU */
+		      <0x0 0x1C004000 0 0x2000>,	/* GIC VCPU Control */
+		      <0x0 0x1C006000 0 0x2000>;	/* GIC VCPU */
+		interrupts = <1 9 0xf04>;	/* GIC Maintenence IRQ */
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 0xff01>,	/* Secure Phys IRQ */
+			     <1 14 0xff01>,	/* Non-secure Phys IRQ */
+			     <1 11 0xff01>,	/* Virt IRQ */
+			     <1 10 0xff01>;	/* Hyp IRQ */
+	};
+
+	pmu {
+		compatible = "samsung,gh7-pmu", "armv8-pmuv3";
+		interrupts = <0 294 0>,
+			     <0 295 0>,
+			     <0 296 0>,
+			     <0 297 0>,
+			     <0 298 0>,
+			     <0 299 0>,
+			     <0 300 0>,
+			     <0 301 0>;
+	};
+
+	amba {
+		compatible = "arm,amba-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		serial@12c00000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x12c00000 0 0x10000>;
+			interrupts = <0 418 0>;
+		};
+
+		serial@12c20000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0 0x12c20000 0 0x10000>;
+			interrupts = <0 420 0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/samsung-ssdk-gh7.dts b/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
new file mode 100644
index 0000000..80bd93c
--- /dev/null
+++ b/arch/arm64/boot/dts/samsung-ssdk-gh7.dts
@@ -0,0 +1,26 @@
+/*
+ * SAMSUNG SSDK-GH7 board device tree source
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+#include "samsung-gh7.dtsi"
+
+/ {
+	model = "samsung,SSDK-GH7";
+	compatible = "samsung,ssdk-gh7", "samsung,gh7";
+
+	chosen {
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x80000000>;
+	};
+};
-- 
1.8.2.1.339.g52a3e01

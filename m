From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 5/8] arm64: dts: Add initial device tree support for EXYNOS7
Date: Fri, 12 Sep 2014 20:56:29 +0530
Message-ID: <1410535592-5782-7-git-send-email-ch.naveen@samsung.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1410535592-5782-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add initial device tree nodes for EXYNOS7 SoC and board dts file
to support Espresso board based on Exynos7 SoC.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/Makefile                    |    1 +
 arch/arm64/boot/dts/exynos/Makefile             |    5 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts |   39 ++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         |  160 +++++++++++++++++++++++
 4 files changed, 205 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-espresso.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 309c3dc..b13bf21 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dts-dirs += apm
 dts-dirs += arm
+dts-dirs += exynos
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
new file mode 100644
index 0000000..20310e5
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -0,0 +1,5 @@
+dtb-$(CONFIG_ARCH_EXYNOS7) += exynos7-espresso.dtb
+
+always		:= $(dtb-y)
+subdir-y	:= $(dts-dirs)
+clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
new file mode 100644
index 0000000..e2c8283
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -0,0 +1,39 @@
+/*
+ * SAMSUNG Exynos7 Espresso board device tree source
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
+#include "exynos7.dtsi"
+
+/ {
+	model = "Samsung Exynos7 Espresso board based on EXYNOS7";
+	compatible = "samsung,exynos7-espresso", "samsung,exynos7";
+
+	aliases {
+		serial0 = &serial_2;
+	};
+
+	chosen {
+		linux,stdout-path = &serial_2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x0 0xC0000000>;
+	};
+};
+
+&fin_pll {
+	clock-frequency = <24000000>;
+};
+
+&serial_2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
new file mode 100644
index 0000000..c5b1b86
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -0,0 +1,160 @@
+/*
+ * SAMSUNG EXYNOS7 SoC device tree source
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <dt-bindings/clock/exynos7-clk.h>
+
+/ {
+	compatible = "samsung,exynos7";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57", "arm,armv8";
+			enable-method = "psci";
+			reg = <0x0>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57", "arm,armv8";
+			enable-method = "psci";
+			reg = <0x1>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57", "arm,armv8";
+			enable-method = "psci";
+			reg = <0x2>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57", "arm,armv8";
+			enable-method = "psci";
+			reg = <0x3>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0x18000000>;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos4210-chipid";
+			reg = <0x10000000 0x100>;
+		};
+
+		fin_pll: xxti {
+			compatible = "fixed-clock";
+			clock-output-names = "fin_pll";
+			#clock-cells = <0>;
+		};
+
+		gic: interrupt-controller@11001000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg =	<0x11001000 0x1000>,
+				<0x11002000 0x1000>,
+				<0x11004000 0x2000>,
+				<0x11006000 0x2000>;
+		};
+
+		clock_topc: clock-controller@10570000 {
+			compatible = "samsung,exynos7-clock-topc";
+			reg = <0x10570000 0x10000>;
+			#clock-cells = <1>;
+		};
+
+		clock_top0: clock-controller@105d0000 {
+			compatible = "samsung,exynos7-clock-top0";
+			reg = <0x105d0000 0xb000>;
+			#clock-cells = <1>;
+		};
+
+		clock_peric0: clock-controller@13610000 {
+			compatible = "samsung,exynos7-clock-peric0";
+			reg = <0x13610000 0xd00>;
+			#clock-cells = <1>;
+		};
+
+		clock_peric1: clock-controller@14C80000 {
+			compatible = "samsung,exynos7-clock-peric1";
+			reg = <0x14c80000 0xd00>;
+			#clock-cells = <1>;
+		};
+
+		clock_peris: clock-controller@10040000 {
+			compatible = "samsung,exynos7-clock-peris";
+			reg = <0x10040000 0xd00>;
+			#clock-cells = <1>;
+		};
+
+		serial_0: serial@13630000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x13630000 0x100>;
+			interrupts = <0 440 0>;
+			clocks = <&clock_peric0 PCLK_UART0>, <&clock_peric0 SCLK_UART0>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		serial_1: serial@14c20000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x14c20000 0x100>;
+			interrupts = <0 456 0>;
+			clocks = <&clock_peric1 PCLK_UART1>, <&clock_peric1 SCLK_UART1>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		serial_2: serial@14c30000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x14c30000 0x100>;
+			interrupts = <0 457 0>;
+			clocks = <&clock_peric1 PCLK_UART2>, <&clock_peric1 SCLK_UART2>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		serial_3: serial@14c40000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x14c40000 0x100>;
+			interrupts = <0 458 0>;
+			clocks = <&clock_peric1 PCLK_UART3>, <&clock_peric1 SCLK_UART3>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		timer {
+			compatible = "arm,armv8-timer";
+			interrupts = <1 13 0xff01>,
+				     <1 14 0xff01>,
+				     <1 11 0xff01>,
+				     <1 10 0xff01>;
+		};
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

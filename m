From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dst: exynos: remove Exynos4212 support (dead code)
Date: Wed, 28 Dec 2016 12:12:47 +0100
Message-ID: <1482923567-19583-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161228111259epcas1p3c15a3155ef6f5c4bc831dddd175fc5a1@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43831 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751078AbcL1LNC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 06:13:02 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIW01OAH75OXV40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Dec 2016 20:13:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>

There are no Exynos4212 based boards in mainline, so there is no need to
keep additional files for SoCs, which are never used. This patch removes
support for Exynos4212 SoCs and moves previously shared Exynos4412
definitions to a single file to simplify future maintenance.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4212.dtsi         | 133 ----
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi | 993 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412.dtsi         | 578 ++++++++++++++++-
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 984 -----------------------------
 arch/arm/boot/dts/exynos4x12.dtsi         | 594 ------------------
 5 files changed, 1567 insertions(+), 1715 deletions(-)
 delete mode 100644 arch/arm/boot/dts/exynos4212.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/exynos4x12.dtsi

diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
deleted file mode 100644
index 538901123d37..000000000000
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ /dev/null
@@ -1,133 +0,0 @@
-/*
- * Samsung's Exynos4212 SoC device tree source
- *
- * Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * Samsung's Exynos4212 SoC device nodes are listed in this file. Exynos4212
- * based board files can include this file and provide values for board specfic
- * bindings.
- *
- * Note: This file does not include device nodes for all the controllers in
- * Exynos4212 SoC. As device tree coverage for Exynos4212 increases, additional
- * nodes can be added to this file.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include "exynos4x12.dtsi"
-
-/ {
-	compatible = "samsung,exynos4212", "samsung,exynos4";
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@A00 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a9";
-			reg = <0xA00>;
-			clocks = <&clock CLK_ARM_CLK>;
-			clock-names = "cpu";
-			operating-points-v2 = <&cpu0_opp_table>;
-			cooling-min-level = <13>;
-			cooling-max-level = <7>;
-			#cooling-cells = <2>; /* min followed by max */
-		};
-
-		cpu@A01 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a9";
-			reg = <0xA01>;
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp00 {
-			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <900000>;
-			clock-latency-ns = <200000>;
-		};
-		opp01 {
-			opp-hz = /bits/ 64 <300000000>;
-			opp-microvolt = <900000>;
-			clock-latency-ns = <200000>;
-		};
-		opp02 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <925000>;
-			clock-latency-ns = <200000>;
-		};
-		opp03 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <950000>;
-			clock-latency-ns = <200000>;
-		};
-		opp04 {
-			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <975000>;
-			clock-latency-ns = <200000>;
-		};
-		opp05 {
-			opp-hz = /bits/ 64 <700000000>;
-			opp-microvolt = <987500>;
-			clock-latency-ns = <200000>;
-		};
-		opp06 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <200000>;
-		};
-		opp07 {
-			opp-hz = /bits/ 64 <900000000>;
-			opp-microvolt = <1037500>;
-			clock-latency-ns = <200000>;
-		};
-		opp08 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <1087500>;
-			clock-latency-ns = <200000>;
-		};
-		opp09 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1137500>;
-			clock-latency-ns = <200000>;
-		};
-		opp10 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1187500>;
-			clock-latency-ns = <200000>;
-		};
-		opp11 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1250000>;
-			clock-latency-ns = <200000>;
-		};
-		opp12 {
-			opp-hz = /bits/ 64 <1400000000>;
-			opp-microvolt = <1287500>;
-			clock-latency-ns = <200000>;
-		};
-		opp13 {
-			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <1350000>;
-			clock-latency-ns = <200000>;
-			turbo-mode;
-		};
-	};
-};
-
-&combiner {
-	samsung,combiner-nr = <18>;
-};
-
-&gic {
-	cpu-offset = <0x8000>;
-};
diff --git a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
new file mode 100644
index 000000000000..e6b9ccfab20e
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
@@ -0,0 +1,993 @@
+/*
+ * Samsung's Exynos4x12 SoCs pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Samsung's Exynos4x12 SoCs pin-mux and pin-config optiosn are listed as device
+ * tree nodes are listed in this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <dt-bindings/pinctrl/samsung.h>
+
+#define PIN_SLP(_pin, _mode, _pull)					\
+	_pin {								\
+		samsung,pins = #_pin;					\
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_ ##_mode>;	\
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_ ##_pull>;	\
+	}
+
+/ {
+	pinctrl_0: pinctrl@11400000 {
+		gpa0: gpa0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpa1: gpa1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpb: gpb {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpc0: gpc0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpc1: gpc1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpd0: gpd0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpd1: gpd1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpf0: gpf0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpf1: gpf1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpf2: gpf2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpf3: gpf3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpj0: gpj0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpj1: gpj1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		uart0_data: uart0-data {
+			samsung,pins = "gpa0-0", "gpa0-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart0_fctl: uart0-fctl {
+			samsung,pins = "gpa0-2", "gpa0-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart1_data: uart1-data {
+			samsung,pins = "gpa0-4", "gpa0-5";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart1_fctl: uart1-fctl {
+			samsung,pins = "gpa0-6", "gpa0-7";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c2_bus: i2c2-bus {
+			samsung,pins = "gpa0-6", "gpa0-7";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart2_data: uart2-data {
+			samsung,pins = "gpa1-0", "gpa1-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart2_fctl: uart2-fctl {
+			samsung,pins = "gpa1-2", "gpa1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart_audio_a: uart-audio-a {
+			samsung,pins = "gpa1-0", "gpa1-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c3_bus: i2c3-bus {
+			samsung,pins = "gpa1-2", "gpa1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart3_data: uart3-data {
+			samsung,pins = "gpa1-4", "gpa1-5";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		uart_audio_b: uart-audio-b {
+			samsung,pins = "gpa1-4", "gpa1-5";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		spi0_bus: spi0-bus {
+			samsung,pins = "gpb-0", "gpb-2", "gpb-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c4_bus: i2c4-bus {
+			samsung,pins = "gpb-0", "gpb-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		spi1_bus: spi1-bus {
+			samsung,pins = "gpb-4", "gpb-6", "gpb-7";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c5_bus: i2c5-bus {
+			samsung,pins = "gpb-2", "gpb-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2s1_bus: i2s1-bus {
+			samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
+					"gpc0-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		pcm1_bus: pcm1-bus {
+			samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
+					"gpc0-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		ac97_bus: ac97-bus {
+			samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
+					"gpc0-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2s2_bus: i2s2-bus {
+			samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
+					"gpc1-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		pcm2_bus: pcm2-bus {
+			samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
+					"gpc1-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		spdif_bus: spdif-bus {
+			samsung,pins = "gpc1-0", "gpc1-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c6_bus: i2c6-bus {
+			samsung,pins = "gpc1-3", "gpc1-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		spi2_bus: spi2-bus {
+			samsung,pins = "gpc1-1", "gpc1-3", "gpc1-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_5>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		pwm0_out: pwm0-out {
+			samsung,pins = "gpd0-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		pwm1_out: pwm1-out {
+			samsung,pins = "gpd0-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		lcd_ctrl: lcd-ctrl {
+			samsung,pins = "gpd0-0", "gpd0-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c7_bus: i2c7-bus {
+			samsung,pins = "gpd0-2", "gpd0-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		pwm2_out: pwm2-out {
+			samsung,pins = "gpd0-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		pwm3_out: pwm3-out {
+			samsung,pins = "gpd0-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c0_bus: i2c0-bus {
+			samsung,pins = "gpd1-0", "gpd1-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		mipi0_clk: mipi0-clk {
+			samsung,pins = "gpd1-0", "gpd1-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2c1_bus: i2c1-bus {
+			samsung,pins = "gpd1-2", "gpd1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		mipi1_clk: mipi1-clk {
+			samsung,pins = "gpd1-2", "gpd1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		lcd_clk: lcd-clk {
+			samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		lcd_data16: lcd-data-width16 {
+			samsung,pins = "gpf0-7", "gpf1-0", "gpf1-1", "gpf1-2",
+					"gpf1-3", "gpf1-6", "gpf1-7", "gpf2-0",
+					"gpf2-1", "gpf2-2", "gpf2-3", "gpf2-7",
+					"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		lcd_data18: lcd-data-width18 {
+			samsung,pins = "gpf0-6", "gpf0-7", "gpf1-0", "gpf1-1",
+					"gpf1-2", "gpf1-3", "gpf1-6", "gpf1-7",
+					"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+					"gpf2-6", "gpf2-7", "gpf3-0", "gpf3-1",
+					"gpf3-2", "gpf3-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		lcd_data24: lcd-data-width24 {
+			samsung,pins = "gpf0-4", "gpf0-5", "gpf0-6", "gpf0-7",
+					"gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
+					"gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
+					"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+					"gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
+					"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		lcd_ldi: lcd-ldi {
+			samsung,pins = "gpf3-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		cam_port_a_io: cam-port-a-io {
+			samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", "gpj0-3",
+					"gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
+					"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		cam_port_a_clk_active: cam-port-a-clk-active {
+			samsung,pins = "gpj1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		cam_port_a_clk_idle: cam-port-a-clk-idle {
+			samsung,pins = "gpj1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+	};
+
+	pinctrl_1: pinctrl@11000000 {
+		gpk0: gpk0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpk1: gpk1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpk2: gpk2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpk3: gpk3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpl0: gpl0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpl1: gpl1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpl2: gpl2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpm0: gpm0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpm1: gpm1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpm2: gpm2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpm3: gpm3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpm4: gpm4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpy0: gpy0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpy1: gpy1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpy2: gpy2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpy3: gpy3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpy4: gpy4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpy5: gpy5 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpy6: gpy6 {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpx0: gpx0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+		};
+
+		gpx1: gpx1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+		};
+
+		gpx2: gpx2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpx3: gpx3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		sd0_clk: sd0-clk {
+			samsung,pins = "gpk0-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd0_cmd: sd0-cmd {
+			samsung,pins = "gpk0-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd0_cd: sd0-cd {
+			samsung,pins = "gpk0-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd0_bus1: sd0-bus-width1 {
+			samsung,pins = "gpk0-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd0_bus4: sd0-bus-width4 {
+			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd0_bus8: sd0-bus-width8 {
+			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd4_clk: sd4-clk {
+			samsung,pins = "gpk0-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd4_cmd: sd4-cmd {
+			samsung,pins = "gpk0-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd4_cd: sd4-cd {
+			samsung,pins = "gpk0-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd4_bus1: sd4-bus-width1 {
+			samsung,pins = "gpk0-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd4_bus4: sd4-bus-width4 {
+			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd4_bus8: sd4-bus-width8 {
+			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd1_clk: sd1-clk {
+			samsung,pins = "gpk1-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd1_cmd: sd1-cmd {
+			samsung,pins = "gpk1-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd1_cd: sd1-cd {
+			samsung,pins = "gpk1-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd1_bus1: sd1-bus-width1 {
+			samsung,pins = "gpk1-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd1_bus4: sd1-bus-width4 {
+			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd2_clk: sd2-clk {
+			samsung,pins = "gpk2-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd2_cmd: sd2-cmd {
+			samsung,pins = "gpk2-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd2_cd: sd2-cd {
+			samsung,pins = "gpk2-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd2_bus1: sd2-bus-width1 {
+			samsung,pins = "gpk2-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd2_bus4: sd2-bus-width4 {
+			samsung,pins = "gpk2-3", "gpk2-4", "gpk2-5", "gpk2-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd2_bus8: sd2-bus-width8 {
+			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd3_clk: sd3-clk {
+			samsung,pins = "gpk3-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd3_cmd: sd3-cmd {
+			samsung,pins = "gpk3-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd3_cd: sd3-cd {
+			samsung,pins = "gpk3-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd3_bus1: sd3-bus-width1 {
+			samsung,pins = "gpk3-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		sd3_bus4: sd3-bus-width4 {
+			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		cam_port_b_io: cam-port-b-io {
+			samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2", "gpm0-3",
+					"gpm0-4", "gpm0-5", "gpm0-6", "gpm0-7",
+					"gpm1-0", "gpm1-1", "gpm2-0", "gpm2-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		cam_port_b_clk_active: cam-port-b-clk-active {
+			samsung,pins = "gpm2-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		};
+
+		cam_port_b_clk_idle: cam-port-b-clk-idle {
+			samsung,pins = "gpm2-2";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		eint0: ext-int0 {
+			samsung,pins = "gpx0-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		eint8: ext-int8 {
+			samsung,pins = "gpx1-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		eint15: ext-int15 {
+			samsung,pins = "gpx1-7";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		eint16: ext-int16 {
+			samsung,pins = "gpx2-0";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		eint31: ext-int31 {
+			samsung,pins = "gpx3-7";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		fimc_is_i2c0: fimc-is-i2c0 {
+			samsung,pins = "gpm4-0", "gpm4-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		fimc_is_i2c1: fimc-is-i2c1 {
+			samsung,pins = "gpm4-2", "gpm4-3";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		fimc_is_uart: fimc-is-uart {
+			samsung,pins = "gpm3-5", "gpm3-7";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		hdmi_cec: hdmi-cec {
+			samsung,pins = "gpx3-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+	};
+
+	pinctrl_2: pinctrl@03860000 {
+		gpz: gpz {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		i2s0_bus: i2s0-bus {
+			samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
+					"gpz-4", "gpz-5", "gpz-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+
+		i2s0_bus_slp: i2s0-bus-slp {
+			samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
+					"gpz-4", "gpz-5", "gpz-6";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+			samsung,off-state;
+		};
+
+		pcm0_bus: pcm0-bus {
+			samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
+					"gpz-4";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+	};
+
+	pinctrl_3: pinctrl@106E0000 {
+		gpv0: gpv0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpv1: gpv1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpv2: gpv2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpv3: gpv3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpv4: gpv4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		c2c_bus: c2c-bus {
+			samsung,pins = "gpv0-0", "gpv0-1", "gpv0-2", "gpv0-3",
+					"gpv0-4", "gpv0-5", "gpv0-6", "gpv0-7",
+					"gpv1-0", "gpv1-1", "gpv1-2", "gpv1-3",
+					"gpv1-4", "gpv1-5", "gpv1-6", "gpv1-7",
+					"gpv2-0", "gpv2-1", "gpv2-2", "gpv2-3",
+					"gpv2-4", "gpv2-5", "gpv2-6", "gpv2-7",
+					"gpv3-0", "gpv3-1", "gpv3-2", "gpv3-3",
+					"gpv3-4", "gpv3-5", "gpv3-6", "gpv3-7",
+					"gpv4-0", "gpv4-1";
+			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 40beede46e55..a42d7c8dde9e 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -17,11 +17,23 @@
  * published by the Free Software Foundation.
 */
 
-#include "exynos4x12.dtsi"
+#include "exynos4.dtsi"
+#include "exynos4412-pinctrl.dtsi"
+#include "exynos4-cpu-thermal.dtsi"
 
 / {
 	compatible = "samsung,exynos4412", "samsung,exynos4";
 
+	aliases {
+		pinctrl0 = &pinctrl_0;
+		pinctrl1 = &pinctrl_1;
+		pinctrl2 = &pinctrl_2;
+		pinctrl3 = &pinctrl_3;
+		fimc-lite0 = &fimc_lite_0;
+		fimc-lite1 = &fimc_lite_1;
+		mshc0 = &mshc_0;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -141,16 +153,574 @@
 	pmu {
 		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
 	};
-};
 
-&pmu_system_controller {
-	compatible = "samsung,exynos4412-pmu", "syscon";
+	sysram@02020000 {
+		compatible = "mmio-sram";
+		reg = <0x02020000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x02020000 0x40000>;
+
+		smp-sysram@0 {
+			compatible = "samsung,exynos4210-sysram";
+			reg = <0x0 0x1000>;
+		};
+
+		smp-sysram@2f000 {
+			compatible = "samsung,exynos4210-sysram-ns";
+			reg = <0x2f000 0x1000>;
+		};
+	};
+
+	pd_isp: isp-power-domain@10023CA0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023CA0 0x20>;
+		#power-domain-cells = <0>;
+	};
+
+	l2c: l2-cache-controller@10502000 {
+		compatible = "arm,pl310-cache";
+		reg = <0x10502000 0x1000>;
+		cache-unified;
+		cache-level = <2>;
+		arm,tag-latency = <2 2 1>;
+		arm,data-latency = <3 2 1>;
+		arm,double-linefill = <1>;
+		arm,double-linefill-incr = <0>;
+		arm,double-linefill-wrap = <1>;
+		arm,prefetch-drop = <1>;
+		arm,prefetch-offset = <7>;
+	};
+
+	clock: clock-controller@10030000 {
+		compatible = "samsung,exynos4412-clock";
+		reg = <0x10030000 0x20000>;
+		#clock-cells = <1>;
+
+		isp-clock-controller {
+			compatible = "samsung,exynos4412-isp-clock";
+			power-domains = <&pd_isp>;
+		};
+	};
+
+	mct@10050000 {
+		compatible = "samsung,exynos4412-mct";
+		reg = <0x10050000 0x800>;
+		interrupt-parent = <&mct_map>;
+		interrupts = <0>, <1>, <2>, <3>, <4>;
+		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
+		clock-names = "fin_pll", "mct";
+
+		mct_map: mct-map {
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+					<1 &combiner 12 5>,
+					<2 &combiner 12 6>,
+					<3 &combiner 12 7>,
+					<4 &gic 1 12 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	adc: adc@126C0000 {
+		compatible = "samsung,exynos-adc-v1";
+		reg = <0x126C0000 0x100>;
+		interrupt-parent = <&combiner>;
+		interrupts = <10 3>;
+		clocks = <&clock CLK_TSADC>;
+		clock-names = "adc";
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		samsung,syscon-phandle = <&pmu_system_controller>;
+		status = "disabled";
+	};
+
+	g2d: g2d@10800000 {
+		compatible = "samsung,exynos4212-g2d";
+		reg = <0x10800000 0x1000>;
+		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
+		clock-names = "sclk_fimg2d", "fimg2d";
+		iommus = <&sysmmu_g2d>;
+	};
+
+	camera {
+		clocks = <&clock CLK_SCLK_CAM0>, <&clock CLK_SCLK_CAM1>,
+			 <&clock CLK_PIXELASYNCM0>, <&clock CLK_PIXELASYNCM1>;
+		clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
+
+		/* fimc_[0-3] are configured outside, under phandles */
+		fimc_lite_0: fimc-lite@12390000 {
+			compatible = "samsung,exynos4212-fimc-lite";
+			reg = <0x12390000 0x1000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd_isp>;
+			clocks = <&clock CLK_FIMC_LITE0>;
+			clock-names = "flite";
+			iommus = <&sysmmu_fimc_lite0>;
+			status = "disabled";
+		};
+
+		fimc_lite_1: fimc-lite@123A0000 {
+			compatible = "samsung,exynos4212-fimc-lite";
+			reg = <0x123A0000 0x1000>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd_isp>;
+			clocks = <&clock CLK_FIMC_LITE1>;
+			clock-names = "flite";
+			iommus = <&sysmmu_fimc_lite1>;
+			status = "disabled";
+		};
+
+		fimc_is: fimc-is@12000000 {
+			compatible = "samsung,exynos4212-fimc-is";
+			reg = <0x12000000 0x260000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd_isp>;
+			clocks = <&clock CLK_FIMC_LITE0>,
+				 <&clock CLK_FIMC_LITE1>, <&clock CLK_PPMUISPX>,
+				 <&clock CLK_PPMUISPMX>,
+				 <&clock CLK_MOUT_MPLL_USER_T>,
+				 <&clock CLK_FIMC_ISP>, <&clock CLK_FIMC_DRC>,
+				 <&clock CLK_FIMC_FD>, <&clock CLK_MCUISP>,
+				 <&clock CLK_GICISP>, <&clock CLK_MCUCTL_ISP>,
+				 <&clock CLK_PWM_ISP>,
+				 <&clock CLK_DIV_ISP0>, <&clock CLK_DIV_ISP1>,
+				 <&clock CLK_DIV_MCUISP0>,
+				 <&clock CLK_DIV_MCUISP1>,
+				 <&clock CLK_UART_ISP_SCLK>,
+				 <&clock CLK_ACLK200>, <&clock CLK_DIV_ACLK200>,
+				 <&clock CLK_ACLK400_MCUISP>,
+				 <&clock CLK_DIV_ACLK400_MCUISP>;
+			clock-names = "lite0", "lite1", "ppmuispx",
+				      "ppmuispmx", "mpll", "isp",
+				      "drc", "fd", "mcuisp",
+				      "gicisp", "mcuctl_isp", "pwm_isp",
+				      "ispdiv0", "ispdiv1", "mcuispdiv0",
+				      "mcuispdiv1", "uart", "aclk200",
+				      "div_aclk200", "aclk400mcuisp",
+				      "div_aclk400mcuisp";
+			iommus = <&sysmmu_fimc_isp>, <&sysmmu_fimc_drc>,
+				 <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
+			iommu-names = "isp", "drc", "fd", "mcuctl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			pmu@10020000 {
+				reg = <0x10020000 0x3000>;
+			};
+
+			i2c1_isp: i2c-isp@12140000 {
+				compatible = "samsung,exynos4212-i2c-isp";
+				reg = <0x12140000 0x100>;
+				clocks = <&clock CLK_I2C1_ISP>;
+				clock-names = "i2c_isp";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
+	mshc_0: mmc@12550000 {
+		compatible = "samsung,exynos4412-dw-mshc";
+		reg = <0x12550000 0x1000>;
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		fifo-depth = <0x80>;
+		clocks = <&clock CLK_SDMMC4>, <&clock CLK_SCLK_MMC4>;
+		clock-names = "biu", "ciu";
+		status = "disabled";
+	};
+
+	sysmmu_g2d: sysmmu@10A40000{
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x10A40000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <4 7>;
+		clock-names = "sysmmu", "master";
+		clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+		#iommu-cells = <0>;
+	};
+
+	sysmmu_fimc_isp: sysmmu@12260000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x12260000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 2>;
+		power-domains = <&pd_isp>;
+		clock-names = "sysmmu";
+		clocks = <&clock CLK_SMMU_ISP>;
+		#iommu-cells = <0>;
+	};
+
+	sysmmu_fimc_drc: sysmmu@12270000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x12270000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 3>;
+		power-domains = <&pd_isp>;
+		clock-names = "sysmmu";
+		clocks = <&clock CLK_SMMU_DRC>;
+		#iommu-cells = <0>;
+	};
+
+	sysmmu_fimc_fd: sysmmu@122A0000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x122A0000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 4>;
+		power-domains = <&pd_isp>;
+		clock-names = "sysmmu";
+		clocks = <&clock CLK_SMMU_FD>;
+		#iommu-cells = <0>;
+	};
+
+	sysmmu_fimc_mcuctl: sysmmu@122B0000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x122B0000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 5>;
+		power-domains = <&pd_isp>;
+		clock-names = "sysmmu";
+		clocks = <&clock CLK_SMMU_ISPCX>;
+		#iommu-cells = <0>;
+	};
+
+	sysmmu_fimc_lite0: sysmmu@123B0000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x123B0000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 0>;
+		power-domains = <&pd_isp>;
+		clock-names = "sysmmu", "master";
+		clocks = <&clock CLK_SMMU_LITE0>, <&clock CLK_FIMC_LITE0>;
+		#iommu-cells = <0>;
+	};
+
+	sysmmu_fimc_lite1: sysmmu@123C0000 {
+		compatible = "samsung,exynos-sysmmu";
+		reg = <0x123C0000 0x1000>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 1>;
+		power-domains = <&pd_isp>;
+		clock-names = "sysmmu", "master";
+		clocks = <&clock CLK_SMMU_LITE1>, <&clock CLK_FIMC_LITE1>;
+		#iommu-cells = <0>;
+	};
+
+	bus_dmc: bus_dmc {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_DMC>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_dmc_opp_table>;
+		status = "disabled";
+	};
+
+	bus_acp: bus_acp {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_ACP>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_acp_opp_table>;
+		status = "disabled";
+	};
+
+	bus_c2c: bus_c2c {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_C2C>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_dmc_opp_table>;
+		status = "disabled";
+	};
+
+	bus_dmc_opp_table: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <900000>;
+		};
+		opp@134000000 {
+			opp-hz = /bits/ 64 <134000000>;
+			opp-microvolt = <900000>;
+		};
+		opp@160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-microvolt = <900000>;
+		};
+		opp@267000000 {
+			opp-hz = /bits/ 64 <267000000>;
+			opp-microvolt = <950000>;
+		};
+		opp@400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+
+	bus_acp_opp_table: opp_table2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+		opp@134000000 {
+			opp-hz = /bits/ 64 <134000000>;
+		};
+		opp@160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+		};
+		opp@267000000 {
+			opp-hz = /bits/ 64 <267000000>;
+		};
+	};
+
+	bus_leftbus: bus_leftbus {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_GDL>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_leftbus_opp_table>;
+		status = "disabled";
+	};
+
+	bus_rightbus: bus_rightbus {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_GDR>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_leftbus_opp_table>;
+		status = "disabled";
+	};
+
+	bus_display: bus_display {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_ACLK160>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_display_opp_table>;
+		status = "disabled";
+	};
+
+	bus_fsys: bus_fsys {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_ACLK133>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_fsys_opp_table>;
+		status = "disabled";
+	};
+
+	bus_peri: bus_peri {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_ACLK100>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_peri_opp_table>;
+		status = "disabled";
+	};
+
+	bus_mfc: bus_mfc {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_SCLK_MFC>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_leftbus_opp_table>;
+		status = "disabled";
+	};
+
+	bus_leftbus_opp_table: opp_table3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <900000>;
+		};
+		opp@134000000 {
+			opp-hz = /bits/ 64 <134000000>;
+			opp-microvolt = <925000>;
+		};
+		opp@160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-microvolt = <950000>;
+		};
+		opp@200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1000000>;
+		};
+	};
+
+	bus_display_opp_table: opp_table4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+		};
+		opp@200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+		};
+	};
+
+	bus_fsys_opp_table: opp_table5 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+		opp@134000000 {
+			opp-hz = /bits/ 64 <134000000>;
+		};
+	};
+
+	bus_peri_opp_table: opp_table6 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+		};
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+	};
 };
 
 &combiner {
 	samsung,combiner-nr = <20>;
+	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&exynos_usbphy {
+	compatible = "samsung,exynos4x12-usb2-phy";
+	samsung,sysreg-phandle = <&sys_reg>;
+};
+
+&fimc_0 {
+	compatible = "samsung,exynos4212-fimc";
+	samsung,pix-limits = <4224 8192 1920 4224>;
+	samsung,mainscaler-ext;
+	samsung,isp-wb;
+	samsung,cam-if;
+};
+
+&fimc_1 {
+	compatible = "samsung,exynos4212-fimc";
+	samsung,pix-limits = <4224 8192 1920 4224>;
+	samsung,mainscaler-ext;
+	samsung,isp-wb;
+	samsung,cam-if;
+};
+
+&fimc_2 {
+	compatible = "samsung,exynos4212-fimc";
+	samsung,pix-limits = <4224 8192 1920 4224>;
+	samsung,mainscaler-ext;
+	samsung,isp-wb;
+	samsung,lcd-wb;
+	samsung,cam-if;
+};
+
+&fimc_3 {
+	compatible = "samsung,exynos4212-fimc";
+	samsung,pix-limits = <1920 8192 1366 1920>;
+	samsung,rotators = <0>;
+	samsung,mainscaler-ext;
+	samsung,isp-wb;
+	samsung,lcd-wb;
 };
 
 &gic {
 	cpu-offset = <0x4000>;
 };
+
+&hdmi {
+	compatible = "samsung,exynos4212-hdmi";
+};
+
+&jpeg_codec {
+	compatible = "samsung,exynos4212-jpeg";
+};
+
+&rotator {
+	compatible = "samsung,exynos4212-rotator";
+};
+
+&mixer {
+	compatible = "samsung,exynos4212-mixer";
+	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp";
+	clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+		 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>;
+};
+
+&pinctrl_0 {
+	compatible = "samsung,exynos4x12-pinctrl";
+	reg = <0x11400000 0x1000>;
+	interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&pinctrl_1 {
+	compatible = "samsung,exynos4x12-pinctrl";
+	reg = <0x11000000 0x1000>;
+	interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+
+	wakup_eint: wakeup-interrupt-controller {
+		compatible = "samsung,exynos4210-wakeup-eint";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&pinctrl_2 {
+	compatible = "samsung,exynos4x12-pinctrl";
+	reg = <0x03860000 0x1000>;
+	interrupt-parent = <&combiner>;
+	interrupts = <10 0>;
+};
+
+&pinctrl_3 {
+	compatible = "samsung,exynos4x12-pinctrl";
+	reg = <0x106E0000 0x1000>;
+	interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&pmu_system_controller {
+	compatible = "samsung,exynos4412-pmu", "syscon";
+	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
+			"clkout4", "clkout8", "clkout9";
+	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
+		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
+		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
+	#clock-cells = <1>;
+};
+
+&tmu {
+	compatible = "samsung,exynos4412-tmu";
+	interrupt-parent = <&combiner>;
+	interrupts = <2 4>;
+	reg = <0x100C0000 0x100>;
+	clocks = <&clock 383>;
+	clock-names = "tmu_apbif";
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
deleted file mode 100644
index 2f866f6e5838..000000000000
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ /dev/null
@@ -1,984 +0,0 @@
-/*
- * Samsung's Exynos4x12 SoCs pin-mux and pin-config device tree source
- *
- * Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * Samsung's Exynos4x12 SoCs pin-mux and pin-config optiosn are listed as device
- * tree nodes are listed in this file.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <dt-bindings/pinctrl/samsung.h>
-
-#define PIN_SLP(_pin, _mode, _pull)					\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_ ##_mode>;	\
-		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_ ##_pull>;	\
-	}
-
-/ {
-	pinctrl_0: pinctrl@11400000 {
-		gpa0: gpa0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpa1: gpa1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpb: gpb {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpc0: gpc0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpc1: gpc1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpd0: gpd0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpd1: gpd1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpf0: gpf0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpf1: gpf1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpf2: gpf2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpf3: gpf3 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpj0: gpj0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpj1: gpj1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		uart0_data: uart0-data {
-			samsung,pins = "gpa0-0", "gpa0-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart0_fctl: uart0-fctl {
-			samsung,pins = "gpa0-2", "gpa0-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart1_data: uart1-data {
-			samsung,pins = "gpa0-4", "gpa0-5";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart1_fctl: uart1-fctl {
-			samsung,pins = "gpa0-6", "gpa0-7";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c2_bus: i2c2-bus {
-			samsung,pins = "gpa0-6", "gpa0-7";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart2_data: uart2-data {
-			samsung,pins = "gpa1-0", "gpa1-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart2_fctl: uart2-fctl {
-			samsung,pins = "gpa1-2", "gpa1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart_audio_a: uart-audio-a {
-			samsung,pins = "gpa1-0", "gpa1-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c3_bus: i2c3-bus {
-			samsung,pins = "gpa1-2", "gpa1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart3_data: uart3-data {
-			samsung,pins = "gpa1-4", "gpa1-5";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		uart_audio_b: uart-audio-b {
-			samsung,pins = "gpa1-4", "gpa1-5";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		spi0_bus: spi0-bus {
-			samsung,pins = "gpb-0", "gpb-2", "gpb-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c4_bus: i2c4-bus {
-			samsung,pins = "gpb-0", "gpb-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		spi1_bus: spi1-bus {
-			samsung,pins = "gpb-4", "gpb-6", "gpb-7";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c5_bus: i2c5-bus {
-			samsung,pins = "gpb-2", "gpb-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2s1_bus: i2s1-bus {
-			samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-					"gpc0-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pcm1_bus: pcm1-bus {
-			samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-					"gpc0-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		ac97_bus: ac97-bus {
-			samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-					"gpc0-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2s2_bus: i2s2-bus {
-			samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
-					"gpc1-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pcm2_bus: pcm2-bus {
-			samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
-					"gpc1-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		spdif_bus: spdif-bus {
-			samsung,pins = "gpc1-0", "gpc1-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c6_bus: i2c6-bus {
-			samsung,pins = "gpc1-3", "gpc1-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		spi2_bus: spi2-bus {
-			samsung,pins = "gpc1-1", "gpc1-3", "gpc1-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_5>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pwm0_out: pwm0-out {
-			samsung,pins = "gpd0-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pwm1_out: pwm1-out {
-			samsung,pins = "gpd0-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		lcd_ctrl: lcd-ctrl {
-			samsung,pins = "gpd0-0", "gpd0-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c7_bus: i2c7-bus {
-			samsung,pins = "gpd0-2", "gpd0-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pwm2_out: pwm2-out {
-			samsung,pins = "gpd0-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pwm3_out: pwm3-out {
-			samsung,pins = "gpd0-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c0_bus: i2c0-bus {
-			samsung,pins = "gpd1-0", "gpd1-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		mipi0_clk: mipi0-clk {
-			samsung,pins = "gpd1-0", "gpd1-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		i2c1_bus: i2c1-bus {
-			samsung,pins = "gpd1-2", "gpd1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		mipi1_clk: mipi1-clk {
-			samsung,pins = "gpd1-2", "gpd1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		lcd_clk: lcd-clk {
-			samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		lcd_data16: lcd-data-width16 {
-			samsung,pins = "gpf0-7", "gpf1-0", "gpf1-1", "gpf1-2",
-					"gpf1-3", "gpf1-6", "gpf1-7", "gpf2-0",
-					"gpf2-1", "gpf2-2", "gpf2-3", "gpf2-7",
-					"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		lcd_data18: lcd-data-width18 {
-			samsung,pins = "gpf0-6", "gpf0-7", "gpf1-0", "gpf1-1",
-					"gpf1-2", "gpf1-3", "gpf1-6", "gpf1-7",
-					"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
-					"gpf2-6", "gpf2-7", "gpf3-0", "gpf3-1",
-					"gpf3-2", "gpf3-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		lcd_data24: lcd-data-width24 {
-			samsung,pins = "gpf0-4", "gpf0-5", "gpf0-6", "gpf0-7",
-					"gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
-					"gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
-					"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
-					"gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
-					"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		lcd_ldi: lcd-ldi {
-			samsung,pins = "gpf3-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		cam_port_a_io: cam-port-a-io {
-			samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", "gpj0-3",
-					"gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
-					"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		cam_port_a_clk_active: cam-port-a-clk-active {
-			samsung,pins = "gpj1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		cam_port_a_clk_idle: cam-port-a-clk-idle {
-			samsung,pins = "gpj1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-	};
-
-	pinctrl_1: pinctrl@11000000 {
-		gpk0: gpk0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpk1: gpk1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpk2: gpk2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpk3: gpk3 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpl0: gpl0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpl1: gpl1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpl2: gpl2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpm0: gpm0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpm1: gpm1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpm2: gpm2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpm3: gpm3 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpm4: gpm4 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpy0: gpy0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpy1: gpy1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpy2: gpy2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpy3: gpy3 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpy4: gpy4 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpy5: gpy5 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpy6: gpy6 {
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpx0: gpx0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-			#interrupt-cells = <2>;
-		};
-
-		gpx1: gpx1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-			#interrupt-cells = <2>;
-		};
-
-		gpx2: gpx2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpx3: gpx3 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		sd0_clk: sd0-clk {
-			samsung,pins = "gpk0-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd0_cmd: sd0-cmd {
-			samsung,pins = "gpk0-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd0_cd: sd0-cd {
-			samsung,pins = "gpk0-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd0_bus1: sd0-bus-width1 {
-			samsung,pins = "gpk0-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd0_bus4: sd0-bus-width4 {
-			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd0_bus8: sd0-bus-width8 {
-			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd4_clk: sd4-clk {
-			samsung,pins = "gpk0-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd4_cmd: sd4-cmd {
-			samsung,pins = "gpk0-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd4_cd: sd4-cd {
-			samsung,pins = "gpk0-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd4_bus1: sd4-bus-width1 {
-			samsung,pins = "gpk0-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd4_bus4: sd4-bus-width4 {
-			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd4_bus8: sd4-bus-width8 {
-			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd1_clk: sd1-clk {
-			samsung,pins = "gpk1-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd1_cmd: sd1-cmd {
-			samsung,pins = "gpk1-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd1_cd: sd1-cd {
-			samsung,pins = "gpk1-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd1_bus1: sd1-bus-width1 {
-			samsung,pins = "gpk1-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd1_bus4: sd1-bus-width4 {
-			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd2_clk: sd2-clk {
-			samsung,pins = "gpk2-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd2_cmd: sd2-cmd {
-			samsung,pins = "gpk2-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd2_cd: sd2-cd {
-			samsung,pins = "gpk2-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd2_bus1: sd2-bus-width1 {
-			samsung,pins = "gpk2-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd2_bus4: sd2-bus-width4 {
-			samsung,pins = "gpk2-3", "gpk2-4", "gpk2-5", "gpk2-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd2_bus8: sd2-bus-width8 {
-			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd3_clk: sd3-clk {
-			samsung,pins = "gpk3-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd3_cmd: sd3-cmd {
-			samsung,pins = "gpk3-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd3_cd: sd3-cd {
-			samsung,pins = "gpk3-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd3_bus1: sd3-bus-width1 {
-			samsung,pins = "gpk3-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		sd3_bus4: sd3-bus-width4 {
-			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		cam_port_b_io: cam-port-b-io {
-			samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2", "gpm0-3",
-					"gpm0-4", "gpm0-5", "gpm0-6", "gpm0-7",
-					"gpm1-0", "gpm1-1", "gpm2-0", "gpm2-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		cam_port_b_clk_active: cam-port-b-clk-active {
-			samsung,pins = "gpm2-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
-		};
-
-		cam_port_b_clk_idle: cam-port-b-clk-idle {
-			samsung,pins = "gpm2-2";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		eint0: ext-int0 {
-			samsung,pins = "gpx0-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		eint8: ext-int8 {
-			samsung,pins = "gpx1-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		eint15: ext-int15 {
-			samsung,pins = "gpx1-7";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		eint16: ext-int16 {
-			samsung,pins = "gpx2-0";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		eint31: ext-int31 {
-			samsung,pins = "gpx3-7";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		fimc_is_i2c0: fimc-is-i2c0 {
-			samsung,pins = "gpm4-0", "gpm4-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		fimc_is_i2c1: fimc-is-i2c1 {
-			samsung,pins = "gpm4-2", "gpm4-3";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		fimc_is_uart: fimc-is-uart {
-			samsung,pins = "gpm3-5", "gpm3-7";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		hdmi_cec: hdmi-cec {
-			samsung,pins = "gpx3-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-	};
-
-	pinctrl_2: pinctrl@03860000 {
-		gpz: gpz {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		i2s0_bus: i2s0-bus {
-			samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
-					"gpz-4", "gpz-5", "gpz-6";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-
-		pcm0_bus: pcm0-bus {
-			samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
-					"gpz-4";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-	};
-
-	pinctrl_3: pinctrl@106E0000 {
-		gpv0: gpv0 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpv1: gpv1 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpv2: gpv2 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpv3: gpv3 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpv4: gpv4 {
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		c2c_bus: c2c-bus {
-			samsung,pins = "gpv0-0", "gpv0-1", "gpv0-2", "gpv0-3",
-					"gpv0-4", "gpv0-5", "gpv0-6", "gpv0-7",
-					"gpv1-0", "gpv1-1", "gpv1-2", "gpv1-3",
-					"gpv1-4", "gpv1-5", "gpv1-6", "gpv1-7",
-					"gpv2-0", "gpv2-1", "gpv2-2", "gpv2-3",
-					"gpv2-4", "gpv2-5", "gpv2-6", "gpv2-7",
-					"gpv3-0", "gpv3-1", "gpv3-2", "gpv3-3",
-					"gpv3-4", "gpv3-5", "gpv3-6", "gpv3-7",
-					"gpv4-0", "gpv4-1";
-			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
-			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
deleted file mode 100644
index 85a7122658f1..000000000000
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ /dev/null
@@ -1,594 +0,0 @@
-/*
- * Samsung's Exynos4x12 SoCs device tree source
- *
- * Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * Samsung's Exynos4x12 SoCs device nodes are listed in this file. Exynos4x12
- * based board files can include this file and provide values for board specfic
- * bindings.
- *
- * Note: This file does not include device nodes for all the controllers in
- * Exynos4x12 SoC. As device tree coverage for Exynos4x12 increases, additional
- * nodes can be added to this file.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include "exynos4.dtsi"
-#include "exynos4x12-pinctrl.dtsi"
-#include "exynos4-cpu-thermal.dtsi"
-
-/ {
-	aliases {
-		pinctrl0 = &pinctrl_0;
-		pinctrl1 = &pinctrl_1;
-		pinctrl2 = &pinctrl_2;
-		pinctrl3 = &pinctrl_3;
-		fimc-lite0 = &fimc_lite_0;
-		fimc-lite1 = &fimc_lite_1;
-		mshc0 = &mshc_0;
-	};
-
-	sysram@02020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x40000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x40000>;
-
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
-		};
-
-		smp-sysram@2f000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x2f000 0x1000>;
-		};
-	};
-
-	pd_isp: isp-power-domain@10023CA0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10023CA0 0x20>;
-		#power-domain-cells = <0>;
-	};
-
-	l2c: l2-cache-controller@10502000 {
-		compatible = "arm,pl310-cache";
-		reg = <0x10502000 0x1000>;
-		cache-unified;
-		cache-level = <2>;
-		arm,tag-latency = <2 2 1>;
-		arm,data-latency = <3 2 1>;
-		arm,double-linefill = <1>;
-		arm,double-linefill-incr = <0>;
-		arm,double-linefill-wrap = <1>;
-		arm,prefetch-drop = <1>;
-		arm,prefetch-offset = <7>;
-	};
-
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4412-clock";
-		reg = <0x10030000 0x20000>;
-		#clock-cells = <1>;
-	};
-
-	mct@10050000 {
-		compatible = "samsung,exynos4412-mct";
-		reg = <0x10050000 0x800>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0>, <1>, <2>, <3>, <4>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
-		clock-names = "fin_pll", "mct";
-
-		mct_map: mct-map {
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
-					<1 &combiner 12 5>,
-					<2 &combiner 12 6>,
-					<3 &combiner 12 7>,
-					<4 &gic 1 12 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-
-	adc: adc@126C0000 {
-		compatible = "samsung,exynos-adc-v1";
-		reg = <0x126C0000 0x100>;
-		interrupt-parent = <&combiner>;
-		interrupts = <10 3>;
-		clocks = <&clock CLK_TSADC>;
-		clock-names = "adc";
-		#io-channel-cells = <1>;
-		io-channel-ranges;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-		status = "disabled";
-	};
-
-	g2d: g2d@10800000 {
-		compatible = "samsung,exynos4212-g2d";
-		reg = <0x10800000 0x1000>;
-		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
-		clock-names = "sclk_fimg2d", "fimg2d";
-		iommus = <&sysmmu_g2d>;
-	};
-
-	camera {
-		clocks = <&clock CLK_SCLK_CAM0>, <&clock CLK_SCLK_CAM1>,
-			 <&clock CLK_PIXELASYNCM0>, <&clock CLK_PIXELASYNCM1>;
-		clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
-
-		/* fimc_[0-3] are configured outside, under phandles */
-		fimc_lite_0: fimc-lite@12390000 {
-			compatible = "samsung,exynos4212-fimc-lite";
-			reg = <0x12390000 0x1000>;
-			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&pd_isp>;
-			clocks = <&clock CLK_FIMC_LITE0>;
-			clock-names = "flite";
-			iommus = <&sysmmu_fimc_lite0>;
-			status = "disabled";
-		};
-
-		fimc_lite_1: fimc-lite@123A0000 {
-			compatible = "samsung,exynos4212-fimc-lite";
-			reg = <0x123A0000 0x1000>;
-			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&pd_isp>;
-			clocks = <&clock CLK_FIMC_LITE1>;
-			clock-names = "flite";
-			iommus = <&sysmmu_fimc_lite1>;
-			status = "disabled";
-		};
-
-		fimc_is: fimc-is@12000000 {
-			compatible = "samsung,exynos4212-fimc-is";
-			reg = <0x12000000 0x260000>;
-			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&pd_isp>;
-			clocks = <&clock CLK_FIMC_LITE0>,
-				 <&clock CLK_FIMC_LITE1>, <&clock CLK_PPMUISPX>,
-				 <&clock CLK_PPMUISPMX>,
-				 <&clock CLK_MOUT_MPLL_USER_T>,
-				 <&clock CLK_FIMC_ISP>, <&clock CLK_FIMC_DRC>,
-				 <&clock CLK_FIMC_FD>, <&clock CLK_MCUISP>,
-				 <&clock CLK_GICISP>, <&clock CLK_MCUCTL_ISP>,
-				 <&clock CLK_PWM_ISP>,
-				 <&clock CLK_DIV_ISP0>, <&clock CLK_DIV_ISP1>,
-				 <&clock CLK_DIV_MCUISP0>,
-				 <&clock CLK_DIV_MCUISP1>,
-				 <&clock CLK_UART_ISP_SCLK>,
-				 <&clock CLK_ACLK200>, <&clock CLK_DIV_ACLK200>,
-				 <&clock CLK_ACLK400_MCUISP>,
-				 <&clock CLK_DIV_ACLK400_MCUISP>;
-			clock-names = "lite0", "lite1", "ppmuispx",
-				      "ppmuispmx", "mpll", "isp",
-				      "drc", "fd", "mcuisp",
-				      "gicisp", "mcuctl_isp", "pwm_isp",
-				      "ispdiv0", "ispdiv1", "mcuispdiv0",
-				      "mcuispdiv1", "uart", "aclk200",
-				      "div_aclk200", "aclk400mcuisp",
-				      "div_aclk400mcuisp";
-			iommus = <&sysmmu_fimc_isp>, <&sysmmu_fimc_drc>,
-				 <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
-			iommu-names = "isp", "drc", "fd", "mcuctl";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			status = "disabled";
-
-			pmu@10020000 {
-				reg = <0x10020000 0x3000>;
-			};
-
-			i2c1_isp: i2c-isp@12140000 {
-				compatible = "samsung,exynos4212-i2c-isp";
-				reg = <0x12140000 0x100>;
-				clocks = <&clock CLK_I2C1_ISP>;
-				clock-names = "i2c_isp";
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
-	};
-
-	mshc_0: mmc@12550000 {
-		compatible = "samsung,exynos4412-dw-mshc";
-		reg = <0x12550000 0x1000>;
-		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		fifo-depth = <0x80>;
-		clocks = <&clock CLK_SDMMC4>, <&clock CLK_SCLK_MMC4>;
-		clock-names = "biu", "ciu";
-		status = "disabled";
-	};
-
-	sysmmu_g2d: sysmmu@10A40000{
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x10A40000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 7>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_isp: sysmmu@12260000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12260000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 2>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_ISP>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_drc: sysmmu@12270000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12270000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 3>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_DRC>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_fd: sysmmu@122A0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x122A0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 4>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FD>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_mcuctl: sysmmu@122B0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x122B0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 5>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_ISPCX>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_lite0: sysmmu@123B0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x123B0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 0>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_LITE0>, <&clock CLK_FIMC_LITE0>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_lite1: sysmmu@123C0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x123C0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 1>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_LITE1>, <&clock CLK_FIMC_LITE1>;
-		#iommu-cells = <0>;
-	};
-
-	bus_dmc: bus_dmc {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_DMC>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_dmc_opp_table>;
-		status = "disabled";
-	};
-
-	bus_acp: bus_acp {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_ACP>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_acp_opp_table>;
-		status = "disabled";
-	};
-
-	bus_c2c: bus_c2c {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_C2C>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_dmc_opp_table>;
-		status = "disabled";
-	};
-
-	bus_dmc_opp_table: opp_table1 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp@100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <900000>;
-		};
-		opp@134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-			opp-microvolt = <900000>;
-		};
-		opp@160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-			opp-microvolt = <900000>;
-		};
-		opp@267000000 {
-			opp-hz = /bits/ 64 <267000000>;
-			opp-microvolt = <950000>;
-		};
-		opp@400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <1050000>;
-		};
-	};
-
-	bus_acp_opp_table: opp_table2 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp@100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-		opp@134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-		};
-		opp@160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-		};
-		opp@267000000 {
-			opp-hz = /bits/ 64 <267000000>;
-		};
-	};
-
-	bus_leftbus: bus_leftbus {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_GDL>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
-
-	bus_rightbus: bus_rightbus {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_GDR>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
-
-	bus_display: bus_display {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK160>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_display_opp_table>;
-		status = "disabled";
-	};
-
-	bus_fsys: bus_fsys {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK133>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_fsys_opp_table>;
-		status = "disabled";
-	};
-
-	bus_peri: bus_peri {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK100>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_peri_opp_table>;
-		status = "disabled";
-	};
-
-	bus_mfc: bus_mfc {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_SCLK_MFC>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
-
-	bus_leftbus_opp_table: opp_table3 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp@100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <900000>;
-		};
-		opp@134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-			opp-microvolt = <925000>;
-		};
-		opp@160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-			opp-microvolt = <950000>;
-		};
-		opp@200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <1000000>;
-		};
-	};
-
-	bus_display_opp_table: opp_table4 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp@160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-		};
-		opp@200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-		};
-	};
-
-	bus_fsys_opp_table: opp_table5 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp@100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-		opp@134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-		};
-	};
-
-	bus_peri_opp_table: opp_table6 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp@50000000 {
-			opp-hz = /bits/ 64 <50000000>;
-		};
-		opp@100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-	};
-};
-
-&combiner {
-	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-};
-
-&exynos_usbphy {
-	compatible = "samsung,exynos4x12-usb2-phy";
-	samsung,sysreg-phandle = <&sys_reg>;
-};
-
-&fimc_0 {
-	compatible = "samsung,exynos4212-fimc";
-	samsung,pix-limits = <4224 8192 1920 4224>;
-	samsung,mainscaler-ext;
-	samsung,isp-wb;
-	samsung,cam-if;
-};
-
-&fimc_1 {
-	compatible = "samsung,exynos4212-fimc";
-	samsung,pix-limits = <4224 8192 1920 4224>;
-	samsung,mainscaler-ext;
-	samsung,isp-wb;
-	samsung,cam-if;
-};
-
-&fimc_2 {
-	compatible = "samsung,exynos4212-fimc";
-	samsung,pix-limits = <4224 8192 1920 4224>;
-	samsung,mainscaler-ext;
-	samsung,isp-wb;
-	samsung,lcd-wb;
-	samsung,cam-if;
-};
-
-&fimc_3 {
-	compatible = "samsung,exynos4212-fimc";
-	samsung,pix-limits = <1920 8192 1366 1920>;
-	samsung,rotators = <0>;
-	samsung,mainscaler-ext;
-	samsung,isp-wb;
-	samsung,lcd-wb;
-};
-
-&hdmi {
-	compatible = "samsung,exynos4212-hdmi";
-};
-
-&jpeg_codec {
-	compatible = "samsung,exynos4212-jpeg";
-};
-
-&rotator {
-	compatible = "samsung,exynos4212-rotator";
-};
-
-&mixer {
-	compatible = "samsung,exynos4212-mixer";
-	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp";
-	clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
-		 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>;
-};
-
-&pinctrl_0 {
-	compatible = "samsung,exynos4x12-pinctrl";
-	reg = <0x11400000 0x1000>;
-	interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-};
-
-&pinctrl_1 {
-	compatible = "samsung,exynos4x12-pinctrl";
-	reg = <0x11000000 0x1000>;
-	interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-
-	wakup_eint: wakeup-interrupt-controller {
-		compatible = "samsung,exynos4210-wakeup-eint";
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-	};
-};
-
-&pinctrl_2 {
-	compatible = "samsung,exynos4x12-pinctrl";
-	reg = <0x03860000 0x1000>;
-	interrupt-parent = <&combiner>;
-	interrupts = <10 0>;
-};
-
-&pinctrl_3 {
-	compatible = "samsung,exynos4x12-pinctrl";
-	reg = <0x106E0000 0x1000>;
-	interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-};
-
-&pmu_system_controller {
-	compatible = "samsung,exynos4212-pmu", "syscon";
-	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
-			"clkout4", "clkout8", "clkout9";
-	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
-		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
-		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
-	#clock-cells = <1>;
-};
-
-&tmu {
-	compatible = "samsung,exynos4412-tmu";
-	interrupt-parent = <&combiner>;
-	interrupts = <2 4>;
-	reg = <0x100C0000 0x100>;
-	clocks = <&clock 383>;
-	clock-names = "tmu_apbif";
-	status = "disabled";
-};
-- 
1.9.1

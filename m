From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/2] ARM: dts: exynos: Add support for Hardkernel's
 Odroid HC1 board
Date: Mon, 02 Oct 2017 08:39:34 +0200
Message-ID: <1506926375-5782-2-git-send-email-m.szyprowski@samsung.com>
References: <1506926375-5782-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20171002063945eucas1p203986b488120315e0e1a82c8c5d916cf@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54848 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdJBGjt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:39:49 -0400
In-reply-to: <1506926375-5782-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Odroid HC1 board is based on Odroid XU4 board, but it has no HDMI,
no eMMC, no build-in USB3.0 hub, no extension port pins, and no GPIO
button. USB3.0 ports are used for build-in JMicron USB to SATA bridge
and Gigabit R8152 ethernet chips. HC1 uses only passive cooling.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443 +++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 213 ++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 428 +-------------------
 4 files changed, 658 insertions(+), 427 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-odroid-core.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5422-odroidhc1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9cf688d404b8..54b06a576551 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -176,6 +176,7 @@ dtb-$(CONFIG_ARCH_EXYNOS5) += \
 	exynos5420-arndale-octa.dtb \
 	exynos5420-peach-pit.dtb \
 	exynos5420-smdk5420.dtb \
+	exynos5422-odroidhc1.dtb \
 	exynos5422-odroidxu3.dtb \
 	exynos5422-odroidxu3-lite.dtb \
 	exynos5422-odroidxu4.dtb \
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
new file mode 100644
index 000000000000..a5b8d0f0877e
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -0,0 +1,443 @@
+/*
+ * Hardkernel Odroid XU3/XU4/HC1 boards core device tree source
+ *
+ * Copyright (c) 2017 Marek Szyprowski
+ * Copyright (c) 2013-2017 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "exynos5800.dtsi"
+#include "exynos5422-cpus.dtsi"
+
+/ {
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x7EA00000>;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	firmware@02073000 {
+		compatible = "samsung,secure-firmware";
+		reg = <0x02073000 0x1000>;
+	};
+
+	fixed-rate-clocks {
+		oscclk {
+			compatible = "samsung,exynos5420-oscclk";
+			clock-frequency = <24000000>;
+		};
+	};
+};
+
+&bus_wcore {
+	devfreq-events = <&nocp_mem0_0>, <&nocp_mem0_1>,
+			<&nocp_mem1_0>, <&nocp_mem1_1>;
+	vdd-supply = <&buck3_reg>;
+	exynos,saturation-ratio = <100>;
+	status = "okay";
+};
+
+&bus_noc {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_fsys_apb {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_fsys {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_fsys2 {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_mfc {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_gen {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_peri {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_g2d {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_g2d_acp {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_jpeg {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_jpeg_apb {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_disp1_fimd {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_disp1 {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_gscl_scaler {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&bus_mscl {
+	devfreq = <&bus_wcore>;
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&buck6_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&hsi2c_4 {
+	status = "okay";
+
+	s2mps11_pmic@66 {
+		compatible = "samsung,s2mps11-pmic";
+		reg = <0x66>;
+		samsung,s2mps11-acokb-ground;
+
+		interrupt-parent = <&gpx0>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&s2mps11_irq>;
+
+		s2mps11_osc: clocks {
+			#clock-cells = <1>;
+			clock-output-names = "s2mps11_ap",
+					"s2mps11_cp", "s2mps11_bt";
+		};
+
+		regulators {
+			ldo1_reg: LDO1 {
+				regulator-name = "vdd_ldo1";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "vddq_mmc0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "vdd_adc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "vdd_ldo5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "vdd_ldo6";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			ldo7_reg: LDO7 {
+				regulator-name = "vdd_ldo7";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo8_reg: LDO8 {
+				regulator-name = "vdd_ldo8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo9_reg: LDO9 {
+				regulator-name = "vdd_ldo9";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-always-on;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name = "vdd_ldo10";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo11_reg: LDO11 {
+				regulator-name = "vdd_ldo11";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			ldo12_reg: LDO12 {
+				regulator-name = "vdd_ldo12";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo13_reg: LDO13 {
+				regulator-name = "vddq_mmc2";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo15_reg: LDO15 {
+				regulator-name = "vdd_ldo15";
+				regulator-min-microvolt = <3100000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-always-on;
+			};
+
+			ldo16_reg: LDO16 {
+				regulator-name = "vdd_ldo16";
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-always-on;
+			};
+
+			ldo17_reg: LDO17 {
+				regulator-name = "tsp_avdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			ldo18_reg: LDO18 {
+				regulator-name = "vdd_emmc_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo19_reg: LDO19 {
+				regulator-name = "vdd_sd";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo24_reg: LDO24 {
+				regulator-name = "tsp_io";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+
+			ldo26_reg: LDO26 {
+				regulator-name = "vdd_ldo26";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-always-on;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name = "vdd_mif";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "vdd_arm";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name = "vdd_int";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name = "vdd_g3d";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck5_reg: BUCK5 {
+				regulator-name = "vdd_mem";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck6_reg: BUCK6 {
+				regulator-name = "vdd_kfc";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck7_reg: BUCK7 {
+				regulator-name = "vdd_1.0v_ldo";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck8_reg: BUCK8 {
+				regulator-name = "vdd_1.8v_ldo";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck9_reg: BUCK9 {
+				regulator-name = "vdd_2.8v_ldo";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3750000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck10_reg: BUCK10 {
+				regulator-name = "vdd_vmem";
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <2850000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&mmc_2 {
+	status = "okay";
+	card-detect-delay = <200>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	vmmc-supply = <&ldo19_reg>;
+	vqmmc-supply = <&ldo13_reg>;
+};
+
+&nocp_mem0_0 {
+	status = "okay";
+};
+
+&nocp_mem0_1 {
+	status = "okay";
+};
+
+&nocp_mem1_0 {
+	status = "okay";
+};
+
+&nocp_mem1_1 {
+	status = "okay";
+};
+
+&pinctrl_0 {
+	s2mps11_irq: s2mps11-irq {
+		samsung,pins = "gpx0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
+
+&tmu_cpu0 {
+	vtmu-supply = <&ldo7_reg>;
+};
+
+&tmu_cpu1 {
+	vtmu-supply = <&ldo7_reg>;
+};
+
+&tmu_cpu2 {
+	vtmu-supply = <&ldo7_reg>;
+};
+
+&tmu_cpu3 {
+	vtmu-supply = <&ldo7_reg>;
+};
+
+&tmu_gpu {
+	vtmu-supply = <&ldo7_reg>;
+};
+
+&rtc {
+	status = "okay";
+	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+};
+
+&usbdrd_dwc3_0 {
+	dr_mode = "host";
+};
+
+/* usbdrd_dwc3_1 mode customized in each board */
+
+&usbdrd3_0 {
+	vdd33-supply = <&ldo9_reg>;
+	vdd10-supply = <&ldo11_reg>;
+};
+
+&usbdrd3_1 {
+	vdd33-supply = <&ldo9_reg>;
+	vdd10-supply = <&ldo11_reg>;
+};
diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
new file mode 100644
index 000000000000..fb8e8ae776e9
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
@@ -0,0 +1,213 @@
+/*
+ * Hardkernel Odroid HC1 board device tree source
+ *
+ * Copyright (c) 2017 Marek Szyprowski
+ * Copyright (c) 2017 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+#include "exynos5422-odroid-core.dtsi"
+
+/ {
+	model = "Hardkernel Odroid HC1";
+	compatible = "hardkernel,odroid-hc1", "samsung,exynos5800", \
+		     "samsung,exynos5";
+
+	pwmleds {
+		compatible = "pwm-leds";
+
+		blueled {
+			label = "blue:heartbeat";
+			pwms = <&pwm 2 2000000 0>;
+			pwm-names = "pwm2";
+			max_brightness = <255>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			thermal-sensors = <&tmu_cpu0 0>;
+			trips {
+				cpu0_alert0: cpu-alert-0 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+				cpu0_alert1: cpu-alert-1 {
+					temperature = <85000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+				cpu0_crit0: cpu-crit-0 {
+					temperature = <120000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				/*
+				 * When reaching cpu0_alert0, reduce CPU
+				 * by 2 steps. On Exynos5422/5800 that would
+				 * be: 1600 MHz and 1100 MHz.
+				 */
+				map0 {
+					trip = <&cpu0_alert0>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map1 {
+					trip = <&cpu0_alert0>;
+					cooling-device = <&cpu4 0 2>;
+				};
+				/*
+				 * When reaching cpu0_alert1, reduce CPU
+				 * further, down to 600 MHz (12 steps for big,
+				 * 7 steps for LITTLE).
+				 */
+				map2 {
+					trip = <&cpu0_alert1>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map3 {
+					trip = <&cpu0_alert1>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+		cpu1_thermal: cpu1-thermal {
+			thermal-sensors = <&tmu_cpu1 0>;
+			trips {
+				cpu1_alert0: cpu-alert-0 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu1_alert1: cpu-alert-1 {
+					temperature = <85000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu1_crit0: cpu-crit-0 {
+					temperature = <120000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert0>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map1 {
+					trip = <&cpu1_alert0>;
+					cooling-device = <&cpu4 0 2>;
+				};
+				map2 {
+					trip = <&cpu1_alert1>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map3 {
+					trip = <&cpu1_alert1>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+		cpu2_thermal: cpu2-thermal {
+			thermal-sensors = <&tmu_cpu2 0>;
+			trips {
+				cpu2_alert0: cpu-alert-0 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu2_alert1: cpu-alert-1 {
+					temperature = <85000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu2_crit0: cpu-crit-0 {
+					temperature = <120000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert0>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map1 {
+					trip = <&cpu2_alert0>;
+					cooling-device = <&cpu4 0 2>;
+				};
+				map2 {
+					trip = <&cpu2_alert1>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map3 {
+					trip = <&cpu2_alert1>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+		cpu3_thermal: cpu3-thermal {
+			thermal-sensors = <&tmu_cpu3 0>;
+			trips {
+				cpu3_alert0: cpu-alert-0 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu3_alert1: cpu-alert-1 {
+					temperature = <85000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+				cpu3_crit0: cpu-crit-0 {
+					temperature = <120000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert0>;
+					cooling-device = <&cpu0 0 2>;
+				};
+				map1 {
+					trip = <&cpu3_alert0>;
+					cooling-device = <&cpu4 0 2>;
+				};
+				map2 {
+					trip = <&cpu3_alert1>;
+					cooling-device = <&cpu0 3 7>;
+				};
+				map3 {
+					trip = <&cpu3_alert1>;
+					cooling-device = <&cpu4 3 12>;
+				};
+			};
+		};
+	};
+
+};
+
+&pwm {
+	/*
+	 * PWM 2 -- Blue LED
+	 */
+	pinctrl-0 = <&pwm2_out>;
+	pinctrl-names = "default";
+	samsung,pwm-outputs = <2>;
+	status = "okay";
+};
+
+&usbdrd_dwc3_1 {
+	dr_mode = "host";
+};
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 4478a089353a..445c6c5a1300 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -12,35 +12,10 @@
  * published by the Free Software Foundation.
 */
 
-#include <dt-bindings/clock/samsung,s2mps11.h>
 #include <dt-bindings/input/input.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/gpio/gpio.h>
-#include "exynos5800.dtsi"
-#include "exynos5422-cpus.dtsi"
+#include "exynos5422-odroid-core.dtsi"
 
 / {
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x7EA00000>;
-	};
-
-	chosen {
-		stdout-path = "serial2:115200n8";
-	};
-
-	firmware@02073000 {
-		compatible = "samsung,secure-firmware";
-		reg = <0x02073000 0x1000>;
-	};
-
-	fixed-rate-clocks {
-		oscclk {
-			compatible = "samsung,exynos5420-oscclk";
-			clock-frequency = <24000000>;
-		};
-	};
-
 	gpio_keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -371,97 +346,6 @@
 	status = "okay";
 };
 
-&bus_wcore {
-	devfreq-events = <&nocp_mem0_0>, <&nocp_mem0_1>,
-			<&nocp_mem1_0>, <&nocp_mem1_1>;
-	vdd-supply = <&buck3_reg>;
-	exynos,saturation-ratio = <100>;
-	status = "okay";
-};
-
-&bus_noc {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_fsys_apb {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_fsys {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_fsys2 {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_mfc {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_gen {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_peri {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_g2d {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_g2d_acp {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_jpeg {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_jpeg_apb {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_disp1_fimd {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_disp1 {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_gscl_scaler {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&bus_mscl {
-	devfreq = <&bus_wcore>;
-	status = "okay";
-};
-
-&cpu0 {
-	cpu-supply = <&buck6_reg>;
-};
-
-&cpu4 {
-	cpu-supply = <&buck2_reg>;
-};
-
 &hdmi {
 	status = "okay";
 	ddc = <&i2c_2>;
@@ -479,237 +363,6 @@
 	needs-hpd;
 };
 
-&hsi2c_4 {
-	status = "okay";
-
-	s2mps11_pmic@66 {
-		compatible = "samsung,s2mps11-pmic";
-		reg = <0x66>;
-		samsung,s2mps11-acokb-ground;
-
-		interrupt-parent = <&gpx0>;
-		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&s2mps11_irq>;
-
-		s2mps11_osc: clocks {
-			#clock-cells = <1>;
-			clock-output-names = "s2mps11_ap",
-					"s2mps11_cp", "s2mps11_bt";
-		};
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "vdd_ldo1";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-				regulator-always-on;
-			};
-
-			ldo3_reg: LDO3 {
-				regulator-name = "vddq_mmc0";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-			};
-
-			ldo4_reg: LDO4 {
-				regulator-name = "vdd_adc";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-			};
-
-			ldo5_reg: LDO5 {
-				regulator-name = "vdd_ldo5";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-
-			ldo6_reg: LDO6 {
-				regulator-name = "vdd_ldo6";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-				regulator-always-on;
-			};
-
-			ldo7_reg: LDO7 {
-				regulator-name = "vdd_ldo7";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-
-			ldo8_reg: LDO8 {
-				regulator-name = "vdd_ldo8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-
-			ldo9_reg: LDO9 {
-				regulator-name = "vdd_ldo9";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3000000>;
-				regulator-always-on;
-			};
-
-			ldo10_reg: LDO10 {
-				regulator-name = "vdd_ldo10";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-
-			ldo11_reg: LDO11 {
-				regulator-name = "vdd_ldo11";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-				regulator-always-on;
-			};
-
-			ldo12_reg: LDO12 {
-				regulator-name = "vdd_ldo12";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-
-			ldo13_reg: LDO13 {
-				regulator-name = "vddq_mmc2";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-			};
-
-			ldo15_reg: LDO15 {
-				regulator-name = "vdd_ldo15";
-				regulator-min-microvolt = <3100000>;
-				regulator-max-microvolt = <3100000>;
-				regulator-always-on;
-			};
-
-			ldo16_reg: LDO16 {
-				regulator-name = "vdd_ldo16";
-				regulator-min-microvolt = <2200000>;
-				regulator-max-microvolt = <2200000>;
-				regulator-always-on;
-			};
-
-			ldo17_reg: LDO17 {
-				regulator-name = "tsp_avdd";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-			};
-
-			ldo18_reg: LDO18 {
-				regulator-name = "vdd_emmc_1V8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-			};
-
-			ldo19_reg: LDO19 {
-				regulator-name = "vdd_sd";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-			};
-
-			ldo24_reg: LDO24 {
-				regulator-name = "tsp_io";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-always-on;
-			};
-
-			ldo26_reg: LDO26 {
-				regulator-name = "vdd_ldo26";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3000000>;
-				regulator-always-on;
-			};
-
-			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1300000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck3_reg: BUCK3 {
-				regulator-name = "vdd_int";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck4_reg: BUCK4 {
-				regulator-name = "vdd_g3d";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck5_reg: BUCK5 {
-				regulator-name = "vdd_mem";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck6_reg: BUCK6 {
-				regulator-name = "vdd_kfc";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck7_reg: BUCK7 {
-				regulator-name = "vdd_1.0v_ldo";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck8_reg: BUCK8 {
-				regulator-name = "vdd_1.8v_ldo";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck9_reg: BUCK9 {
-				regulator-name = "vdd_2.8v_ldo";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3750000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck10_reg: BUCK10 {
-				regulator-name = "vdd_vmem";
-				regulator-min-microvolt = <2850000>;
-				regulator-max-microvolt = <2850000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-		};
-	};
-};
-
 &i2c_2 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
@@ -740,36 +393,6 @@
 	vqmmc-supply = <&ldo3_reg>;
 };
 
-&mmc_2 {
-	status = "okay";
-	card-detect-delay = <200>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 4>;
-	samsung,dw-mshc-ddr-timing = <0 2>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
-	bus-width = <4>;
-	cap-sd-highspeed;
-	vmmc-supply = <&ldo19_reg>;
-	vqmmc-supply = <&ldo13_reg>;
-};
-
-&nocp_mem0_0 {
-	status = "okay";
-};
-
-&nocp_mem0_1 {
-	status = "okay";
-};
-
-&nocp_mem1_0 {
-	status = "okay";
-};
-
-&nocp_mem1_1 {
-	status = "okay";
-};
-
 &pinctrl_0 {
 	power_key: power-key {
 		samsung,pins = "gpx0-3";
@@ -784,13 +407,6 @@
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
-
-	s2mps11_irq: s2mps11-irq {
-		samsung,pins = "gpx0-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
 };
 
 &pinctrl_1 {
@@ -801,45 +417,3 @@
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
-
-&tmu_cpu0 {
-	vtmu-supply = <&ldo7_reg>;
-};
-
-&tmu_cpu1 {
-	vtmu-supply = <&ldo7_reg>;
-};
-
-&tmu_cpu2 {
-	vtmu-supply = <&ldo7_reg>;
-};
-
-&tmu_cpu3 {
-	vtmu-supply = <&ldo7_reg>;
-};
-
-&tmu_gpu {
-	vtmu-supply = <&ldo7_reg>;
-};
-
-&rtc {
-	status = "okay";
-	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
-	clock-names = "rtc", "rtc_src";
-};
-
-&usbdrd_dwc3_0 {
-	dr_mode = "host";
-};
-
-/* usbdrd_dwc3_1 mode customized in each board */
-
-&usbdrd3_0 {
-	vdd33-supply = <&ldo9_reg>;
-	vdd10-supply = <&ldo11_reg>;
-};
-
-&usbdrd3_1 {
-	vdd33-supply = <&ldo9_reg>;
-	vdd10-supply = <&ldo11_reg>;
-};
-- 
1.9.1

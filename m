From: Chanho Park <parkch98@gmail.com>
Subject: [PATCHv4] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Sun,  5 Jul 2015 23:29:16 +0900
Message-ID: <1436106556-19134-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:32769 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbbGEO3Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Jul 2015 10:29:24 -0400
Received: by pacws9 with SMTP id ws9so82793017pac.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jul 2015 07:29:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chanho Park <chanho61.park@samsung.com>

The odroid-xu3 board which is based on exynos5422 not exynos5800 is
booted from cortex-a7 core unlike exynos5800. The odroid-xu3's cpu order
is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4 are
cortex-a15 cores. To correct this mis-odering, I added exynos5422.dtsi
and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex-a7 and
cpu4-7 are cortex-a15.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Changes from v3:
 - include this exynos5422-cpus.dtsi in the exynos5422-odroidxu3-common.dtsi

Changes from v2:
 - drop inclusion of exynos5420.dtsi from exynos5422-cpus.dtsi
 - drop compatibles from exynos5422-cpus.dtsi

Changes from v1:
 - rename exynos5422.dtsi to exynos5422-cpus.dtsi
 - include the dtsi file top of the exynos5422-odroidxu3.dts

Secondary cpu booting problem[1] is not resolved yet. Below temporal patch is
required to see 8 cores booting.

--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -124,6 +124,7 @@ void exynos_cpu_power_up(int cpu)
        if (soc_is_exynos3250())
                core_conf |= S5P_CORE_AUTOWAKEUP_EN;

+       pmu_raw_writel(1, S5P_PMU_SPARE2);
        pmu_raw_writel(core_conf,
                        EXYNOS_ARM_CORE_CONFIGURATION(cpu));
 }

[1]: http://www.spinics.net/lists/linux-samsung-soc/msg45525.html

 arch/arm/boot/dts/exynos5422-cpus.dtsi             | 81 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi

diff --git a/arch/arm/boot/dts/exynos5422-cpus.dtsi b/arch/arm/boot/dts/exynos5422-cpus.dtsi
new file mode 100644
index 0000000..b7f60c8
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5422-cpus.dtsi
@@ -0,0 +1,81 @@
+/*
+ * SAMSUNG EXYNOS5422 SoC cpu device tree source
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * The only difference between EXYNOS5422 and EXYNOS5800 is cpu ordering. The
+ * EXYNOS5422 is booting from Cortex-A7 core while the EXYNOS5800 is booting
+ * from Cortex-A15 core.
+ *
+ * EXYNOS5422 based board files can include this file to provide cpu ordering
+ * which could boot a cortex-a7 from cpu0.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+&cpu0 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x100>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu1 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x101>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu2 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x102>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu3 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a7";
+	reg = <0x103>;
+	clock-frequency = <1000000000>;
+	cci-control-port = <&cci_control0>;
+};
+
+&cpu4 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x0>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
+
+&cpu5 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x1>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
+
+&cpu6 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x2>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
+
+&cpu7 {
+	device_type = "cpu";
+	compatible = "arm,cortex-a15";
+	reg = <0x3>;
+	clock-frequency = <1800000000>;
+	cci-control-port = <&cci_control1>;
+};
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 8adf455..f603133 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5800.dtsi"
+#include "exynos5422-cpus.dtsi"
 
 / {
 	memory {
-- 
2.1.0

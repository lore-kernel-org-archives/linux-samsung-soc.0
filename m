From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: Add peach-pi board support
Date: Fri,  9 May 2014 17:55:03 +0530
Message-ID: <1399638303-32600-4-git-send-email-arun.kk@samsung.com>
References: <1399638303-32600-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:35760 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076AbaEIMZY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 08:25:24 -0400
In-Reply-To: <1399638303-32600-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olof@lixom.net, arunkk.samsung@gmail.com

Adds support for google peach-pi board having the
Exynos5800 SoC.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
Changes from v1
- Updated memory node with a safe size of 2GB
---
 arch/arm/boot/dts/Makefile                |    3 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts |  144 +++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a934648..cd399a2 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -77,7 +77,8 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos5420-peach-pit.dtb \
 	exynos5420-smdk5420.dtb \
 	exynos5440-sd5v1.dtb \
-	exynos5440-ssdk5440.dtb
+	exynos5440-ssdk5440.dtb \
+	exynos5800-peach-pi.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += hi3620-hi4511.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
 	ecx-2000.dtb
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
new file mode 100644
index 0000000..4ed9ccc
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -0,0 +1,144 @@
+/*
+ * Google Peach Pi Rev 10+ board device tree source
+ *
+ * Copyright (c) 2014 Google, Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "exynos5800.dtsi"
+
+/ {
+	model = "Google Peach Pi Rev 10+";
+
+	compatible = "google,pi-rev16",
+		"google,pi-rev15", "google,pi-rev14",
+		"google,pi-rev13", "google,pi-rev12",
+		"google,pi-rev11", "google,pi-rev10",
+		"google,pi", "google,peach", "samsung,exynos5800",
+		"samsung,exynos5";
+
+	memory {
+		reg = <0x20000000 0x80000000>;
+	};
+
+	fixed-rate-clocks {
+		oscclk {
+			compatible = "samsung,exynos5420-oscclk";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&power_key_irq>;
+
+		power {
+			label = "Power";
+			gpios = <&gpx1 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			gpio-key,wakeup;
+		};
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
+		default-brightness-level = <7>;
+		pinctrl-0 = <&pwm0_out>;
+		pinctrl-names = "default";
+	};
+};
+
+&pinctrl_0 {
+	tpm_irq: tpm-irq {
+		samsung,pins = "gpx1-0";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
+	power_key_irq: power-key-irq {
+		samsung,pins = "gpx1-2";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&uart_3 {
+	status = "okay";
+};
+
+&mmc_0 {
+	status = "okay";
+	num-slots = <1>;
+	broken-cd;
+	caps2-mmc-hs200-1_8v;
+	supports-highspeed;
+	non-removable;
+	card-detect-delay = <200>;
+	clock-frequency = <400000000>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+	slot@0 {
+		reg = <0>;
+		bus-width = <8>;
+	};
+};
+
+&mmc_2 {
+	status = "okay";
+	num-slots = <1>;
+	supports-highspeed;
+	card-detect-delay = <200>;
+	clock-frequency = <400000000>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <2 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+	slot@0 {
+		reg = <0>;
+		bus-width = <4>;
+	};
+};
+
+&hsi2c_9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tpm@20 {
+		compatible = "infineon,slb9645tt";
+		reg = <0x20>;
+		/* Unused irq; but still need to configure the pins */
+		pinctrl-names = "default";
+		pinctrl-0 = <&tpm_irq>;
+	};
+};
+
+/*
+ * Use longest HW watchdog in SoC (32 seconds) since the hardware
+ * watchdog provides no debugging information (compared to soft/hard
+ * lockup detectors) and so should be last resort.
+ */
+&watchdog {
+	timeout-sec = <32>;
+};
-- 
1.7.9.5

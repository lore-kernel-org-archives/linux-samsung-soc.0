From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 4/4] ARM: dts: Add peach-pi board support
Date: Mon, 21 Apr 2014 12:15:12 +0530
Message-ID: <1398062712-28602-5-git-send-email-arun.kk@samsung.com>
References: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:36520 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269AbaDUGpd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 02:45:33 -0400
In-Reply-To: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olofj@google.com, arunkk.samsung@gmail.com

Adds support for google peach-pi board having the
Exynos5800 SoC.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/Makefile                |    3 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts |  225 +++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c17cf4b..6ed6467 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -77,7 +77,8 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos5420-smdk5420.dtb \
 	exynos5420-peach-pit.dtb \
 	exynos5440-sd5v1.dtb \
-	exynos5440-ssdk5440.dtb
+	exynos5440-ssdk5440.dtb \
+	exynos5800-peach-pi.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += hi3620-hi4511.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
 	ecx-2000.dtb
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
new file mode 100644
index 0000000..3ea6c8a
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -0,0 +1,225 @@
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
+#include <include/dt-bindings/input/input.h>
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
+		reg = <0x20000000 0xE0000000>;
+	};
+
+	fixed-rate-clocks {
+		oscclk {
+			compatible = "samsung,exynos5420-oscclk";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	pinctrl@13400000 {
+		lid_irq: lid-irq {
+			samsung,pins = "gpx3-4";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		power_key_irq: power-key-irq {
+			samsung,pins = "gpx1-2";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		tpm_irq: tpm-irq {
+			samsung,pins = "gpx1-0";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
+	pinctrl@14010000 {
+		spi_flash_cs: spi-flash-cs {
+			samsung,pins = "gpa2-5";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		backlight_pwm: backlight-pwm {
+			samsung,pins = "gpb2-0";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&power_key_irq &lid_irq>;
+
+		power {
+			label = "Power";
+			gpios = <&gpx1 2 1>;
+			linux,code = <KEY_POWER>;
+			gpio-key,wakeup;
+		};
+
+		lid-switch {
+			label = "Lid";
+			gpios = <&gpx3 4 1>;
+			linux,input-type = <5>; /* EV_SW */
+			linux,code = <0>; /* SW_LID */
+			debounce-interval = <1>;
+			gpio-key,wakeup;
+		};
+	};
+
+	rtc@101E0000 {
+		status = "okay";
+	};
+
+	serial@12C30000 {
+		status = "okay";
+	};
+
+	mmc@12200000 {
+		status = "okay";
+		num-slots = <1>;
+		broken-cd;
+		caps2-mmc-hs200-1_8v;
+		supports-highspeed;
+		non-removable;
+		card-detect-delay = <200>;
+		clock-frequency = <400000000>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <0 4>;
+		samsung,dw-mshc-ddr-timing = <0 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
+	mmc@12220000 {
+		status = "okay";
+		num-slots = <1>;
+		supports-highspeed;
+		card-detect-delay = <200>;
+		clock-frequency = <400000000>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <4>;
+		};
+	};
+
+	i2c@12E10000 {
+		status = "okay";
+		clock-frequency = <400000>;
+
+		tpm@20 {
+			/* Unused irq; but still need to configure the pins */
+			pinctrl-names = "default";
+			pinctrl-0 = <&tpm_irq>;
+
+			compatible = "infineon,slb9645tt";
+			reg = <0x20>;
+		};
+	};
+
+	spi@12d30000 {
+		status = "okay";
+		samsung,spi-src-clk = <0>;
+		num-cs = <1>;
+
+		spidev@0 {
+			compatible = "spidev";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi_flash_cs>;
+
+			controller-data {
+				cs-gpio = <&gpa2 5 0>;
+				samsung,spi-feedback-delay = <2>;
+			};
+		};
+	};
+
+	adc@12D10000 {
+		ncp15wb473@3 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 3>;
+		};
+		ncp15wb473@4 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 4>;
+		};
+		ncp15wb473@5 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 5>;
+		};
+		ncp15wb473@6 {
+			compatible = "ntc,ncp15wb473";
+			pullup-uv = <1800000>;
+			pullup-ohm = <47000>;
+			pulldown-ohm = <0>;
+			io-channels = <&adc 6>;
+		};
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+		default-brightness-level = <2800>;
+		pinctrl-0 = <&backlight_pwm>;
+		pinctrl-names = "default";
+	};
+
+	/*
+	 * Use longest HW watchdog in SoC (32 seconds) since the hardware
+	 * watchdog provides no debugging information (compared to soft/hard
+	 * lockup detectors) and so should be last resort.
+	 */
+	watchdog@101D0000 {
+		timeout-sec = <32>;
+	};
+};
-- 
1.7.9.5

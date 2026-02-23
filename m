Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B369C2F617C;
	Mon, 23 Feb 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861248; cv=none; b=atbGZNy4eBhDFOXWjn+yz8Ieh2AEfIaUkKhr63Cv+vmK33VNA5hoTi+HJ79RG0EiKzBR3eRU9pBZelt3xFf2GEIYiNvJXuuQNO6tAbzinXGWFUMNn2pxcmpUA0nv/+SQAN1a/URLm9XY/P1a3M5Y+kb/3pTmW7sMD5nti/2Jy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861248; c=relaxed/simple;
	bh=iNRSrckWXZQntDsxVmI76iJqZ1n4vKEHZP/MRd5zvJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2IxlYnwLYvv/cKesWHxzz/1A7UDu/ZhXbB3OAH0TccUfki9jBnfPmpz4uYcraSi0OBW9pexpiDwVFz1M42+K8yL9frnfVQmi97VEpBLjsSHHg8/7vgcXonQgPHrFQBSbOCViCa35SSgVU+8OE+kV7+qPuEl5r4bUzesQrLxuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fKQ6d4Yv8z9trP;
	Mon, 23 Feb 2026 16:40:41 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Mon, 23 Feb 2026 16:40:27 +0100
Subject: [PATCH RESEND v4 2/3] ARM: dts: exynos: Add Google Manta (Nexus
 10)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-lat3st-staging-v4-2-219638defb01@timmermann.space>
References: <20260223-lat3st-staging-v4-0-219638defb01@timmermann.space>
In-Reply-To: <20260223-lat3st-staging-v4-0-219638defb01@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4fKQ6d4Yv8z9trP

From: Alexandre Marquet <tb@a-marquet.fr>

Manta is the code name for Google Nexus 10, and was manufactured by
Samsung with their Exynos5250 SoC.
Add an initial device-tree file for this board.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Co-developed-by: Lukas Timmermann <linux@timmermann.space>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 arch/arm/boot/dts/samsung/Makefile             |   1 +
 arch/arm/boot/dts/samsung/exynos5250-manta.dts | 564 +++++++++++++++++++++++++
 2 files changed, 565 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index 7becf36656b1..e0143ee8c82d 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-trats2.dtb
 dtb-$(CONFIG_ARCH_EXYNOS5) += \
 	exynos5250-arndale.dtb \
+	exynos5250-manta.dtb \
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
 	exynos5250-snow-rev5.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
new file mode 100644
index 000000000000..24a27b342227
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Google Manta (Nexus 10) board device tree source
+ *
+ * Copyright (c) 2023-2026 Alexandre Marquet
+ * Copyright (c) 2025-2026 Lukas Timmermann
+ */
+
+/dts-v1/;
+#include "exynos5250.dtsi"
+#include "exynos-pinctrl.h"
+#include "exynos-mfc-reserved-memory.dtsi"
+
+#include <dt-bindings/clock/maxim,max77686.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Google Nexus 10";
+	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
+
+	aliases {
+		mmc0 = &mmc_0; /* eMMC */
+		mmc1 = &mmc_1; /* WiFi */
+	};
+
+	/* Voltage source unknown */
+	bmp180_vdda_reg: regulator-bmp180-vdda {
+		compatible = "regulator-fixed";
+		regulator-name = "BMP180_VDDA";
+	};
+
+	/* Voltage source unknown */
+	bmp180_vddd_reg: regulator-bmp180-vddd {
+		compatible = "regulator-fixed";
+		regulator-name = "BMP180_VDDD";
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	flash-controller {
+		compatible = "gpio-leds";
+
+		led-flash {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			linux,default-trigger = "flash";
+			gpios = <&gpe0 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible = "samsung,clock-xxti";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys>;
+		pinctrl-names = "default";
+
+		button-volume-down {
+			label = "Volume Down";
+			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <5>;
+		};
+
+		button-volume-up {
+			label = "Volume Up";
+			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <5>;
+		};
+
+		button-power {
+			label = "Power";
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <5>;
+			wakeup-source;
+		};
+
+		lid-switch {
+			label = "Hall Effect Sensor";
+			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+	};
+
+	multi-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
+	};
+
+	pwrseq: mmc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		reset-gpios = <&gpv1 0 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&wlan_pmena>;
+		pinctrl-names = "default";
+
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "ext_clock";
+
+		post-power-on-delay-ms = <300>;
+		power-off-delay-us = <50>;
+	};
+
+	firmware@204efff {
+		compatible = "samsung,secure-firmware";
+		reg = <0x0204efff 0x1000>;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x20000000>,
+		      <0x60000000 0x20000000>,
+		      <0x80000000 0x20000000>,
+		      <0xa0000000 0x1ff00000>;
+	};
+};
+
+&clock {
+	assigned-clocks = <&clock CLK_FOUT_APLL>;
+	assigned-clock-rates = <1000000000>;
+};
+
+&cpu0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&ehci {
+	status = "disabled";
+};
+
+&i2c_1 {
+	status = "okay";
+
+	pressure-sensor@77 {
+		compatible = "bosch,bmp180";
+		reg = <0x77>;
+		vddd-supply = <&bmp180_vddd_reg>;
+		vdda-supply = <&bmp180_vdda_reg>;
+	};
+
+	accelerometer@68 {
+		compatible = "invensense,mpu6050";
+		reg = <0x68>;
+
+		pinctrl-0 = <&acc_int>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&gpx1>;
+		interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+
+		mount-matrix = "0", "-1",  "0",
+			      "-1",  "0",  "0",
+			       "0",  "0", "-1";
+
+		i2c-gate {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			magnetometer@c {
+				compatible = "asahi-kasei,ak8963";
+				reg = <0x0c>;
+
+				pinctrl-0 = <&msense_reset>;
+				pinctrl-names = "default";
+
+				mount-matrix = "-1", "0",  "0",
+					       "0",  "1",  "0",
+					       "0",  "0", "-1";
+			};
+		};
+	};
+
+	led-controller@42 {
+		compatible = "ams,as3668";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x42>;
+
+		status_red: led@0 {
+			reg = <0>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		status_green: led@1 {
+			reg = <1>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		status_blue: led@2 {
+			reg = <2>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		status_white: led@3 {
+			reg = <3>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
+&i2c_2 {
+	status = "okay";
+
+	light-sensor@23 {
+		compatible = "rohm,bh1721";
+		reg = <0x23>;
+
+		pinctrl-0 = <&bh1721fvc_reset>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&gph1 2 GPIO_ACTIVE_LOW>;
+	};
+
+	onewire@18 {
+		compatible = "maxim,ds2484";
+		reg = <0x18>;
+
+		pinctrl-0 = <&onewire_sleep>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c_5 {
+	samsung,i2c-sda-delay = <100>;
+	status = "okay";
+
+	max77686: pmic@9 {
+		compatible = "maxim,max77686";
+		reg = <0x09>;
+
+		interrupt-parent = <&gpx0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&max77686_irq>;
+		pinctrl-names = "default";
+
+		#clock-cells = <1>;
+		wakeup-source;
+
+		voltage-regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "vdd_mif";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "vdd_arm";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name = "vdd_int";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name = "vdd_g3d";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "VCC_1.8V_AP";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo8_reg: LDO8 {
+				regulator-name = "VMIPI_1.0V";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo9_reg: LDO9 {
+				regulator-name = "TOUCH_VDD_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name = "VMIPI_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo12_reg: LDO12 {
+				regulator-name = "VUOTG_3.0V";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo15_reg: LDO15 {
+				regulator-name = "VHSIC_1.0V";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo16_reg: LDO16 {
+				regulator-name = "VHSIC_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo17_reg: LDO17 {
+				regulator-name = "5M_CORE_1.5V";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+			};
+
+			ldo18_reg: LDO18 {
+				regulator-name = "CAM_IO_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo19_reg: LDO19 {
+				regulator-name = "VT_CAM_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo20_reg: LDO20 {
+				regulator-name = "TA_CHECK_1.35V";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+			};
+
+			ldo23_reg: LDO23 {
+				regulator-name = "TSP_AVDD_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo24_reg: LDO24 {
+				regulator-name = "CAM_AF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			ldo25_reg: LDO25 {
+				regulator-name = "VADC_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&mixer {
+	status = "okay";
+};
+
+/* eMMC */
+&mmc_0 {
+	non-removable;
+	max-frequency = <200000000>;
+	sd-uhs-ddr50;
+	mmc-ddr-1_8v;
+	cap-mmc-hw-reset;
+	mmc-hs200-1_8v;
+	bus-width = <8>;
+	card-detect-delay = <200>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <1 2>;
+	samsung,dw-mshc-ddr-timing = <2 3>;
+
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+/* WiFi */
+&mmc_1 {
+	non-removable;
+	max-frequency = <100000000>;
+	sd-uhs-sdr50;
+	cap-sd-highspeed;
+	keep-power-in-suspend;
+	bus-width = <4>;
+	card-detect-delay = <0>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <2 4>;
+	samsung,dw-mshc-ddr-timing = <2 3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus4>;
+	mmc-pwrseq = <&pwrseq>;
+
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-0 = <&wlan_irq>;
+		pinctrl-names = "default";
+	};
+};
+
+&ohci {
+	status = "disabled";
+};
+
+&pinctrl_0 {
+	acc_int: acc-int-pins {
+		samsung,pins = "gpx1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	max77686_irq: max77686-irq-pins {
+		samsung,pins = "gpx0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	gpio_keys: gpio-keys-pins {
+		samsung,pins = "gpx2-0", "gpx2-1", "gpx2-7", "gpx1-3";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	wlan_irq: wlan-irq-pins {
+		samsung,pins = "gpx2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
+	};
+};
+
+&pinctrl_1 {
+	bh1721fvc_reset: bh1721fvc-reset-pins {
+		samsung,pins = "gph1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	msense_reset: msense-reset-pins {
+		samsung,pins = "gpg2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+	};
+
+	onewire_sleep: onewire-sleep-pins {
+		samsung,pins = "gpg0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_2 {
+	wlan_pmena: wlan-pmena-pins {
+		samsung,pins = "gpv1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-val = <0>;
+	};
+};
+
+&pmu_system_controller {
+	assigned-clocks = <&pmu_system_controller 0>;
+	assigned-clock-parents = <&clock CLK_FIN_PLL>;
+};
+
+&rtc {
+	clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+	status = "okay";
+};
+
+&sd1_bus4 {
+	samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+};
+
+&sd1_cmd {
+	samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+	samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+};
+
+/* Bluetooth */
+&serial_0 {
+	status = "disabled";
+};
+
+/* GPS */
+&serial_1 {
+	status = "disabled";
+};
+
+&serial_2 {
+	pinctrl-0 = <&uart2_data>;
+	pinctrl-1 = <&uart2_data>, <&uart2_fctl>;
+	pinctrl-names = "default", "flow-control";
+	status = "okay";
+};
+
+&usbdrd {
+	status = "disabled";
+};
+
+&usbdrd_dwc3 {
+	status = "disabled";
+};
+
+&usbdrd_phy {
+	status = "disabled";
+};

-- 
2.53.0


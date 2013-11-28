From: randy <lxr1234@hotmail.com>
Subject: How to enable usb in exynos4412
Date: Thu, 28 Nov 2013 22:00:41 +0800
Message-ID: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [65.55.111.86] ([65.55.111.86]:8257 "EHLO
	blu0-omc2-s11.blu0.hotmail.com" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751271Ab3K1OBI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 09:01:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, stern@rowland.harvard.edu, devicetree@vger.kernel.org, balbi@ti.com

I have development board whose SoC is exynos4412, I try to enable the
usb in it but I failed. I saw the document
Documentation/devicetree/bindings/usb/samsung-usbphy.txt, does it mean
that the usb driver is not done?
And about that document, in samsung datasheet(32.8.2), the address reg
0x125B_0000 + 32bits contains hsic1, hsic0, phy1 and phy0's power
control. And in 0x1002_0704 + 3 * 32 bits, it contains usb_phy,
hsic1_phy and hsic2_phy control(8.8.1.27). So I doubt the documents.

Here is the log and dts
===========================log================================
[    1.000000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.010000] ehci-exynos: EHCI EXYNOS driver
[    1.015000] unable to find transceiver of type USB2 PHY
[    1.020000] exynos-ehci 12580000.ehci: no platform data or
transceiver defined
[    1.025000] platform 12580000.ehci: Driver exynos-ehci requests probe
deferral

================================dts==================================
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts
b/arch/arm/boot/dts/exynos4412-tiny4412.dts
new file mode 100644
index 0000000..c8d4cfa
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -0,0 +1,176 @@
+/*
+ * Hardkernel's Exynos4412 based tiny4412 1306 board device tree source
+ *
+ * Copyright (c) 2013 Tomoya Gitsufuki <ayaka@mail.soulik.info>
+ *
+ * Device tree source file for Friendyarm tiny4412 1306 board which is
based on
+ * Samsung's Exynos4412 SoC.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+#include "exynos4412.dtsi"
+
+/ {
+	model = "Friendly Arm Tiny4412 1306 board based on Exynos4412";
+	compatible = "friendlyarm,tiny4412-1306", "samsung,exynos4412";
+
+	memory {
+		reg = <0x40000000 0x40000000>;
+	};
+
+	chosen {
+		bootargs ="root=/dev/mmcblk0p1 rootfstype=ext4 rw
console=ttySAC0,115200 init=/sbin/init";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			label = "led1:heart";
+			gpios = <&gpm4 0 1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+		led2 {
+			label = "led2:mmc0";
+			gpios = <&gpm4 1 1>;
+			default-state = "on";
+			linux,default-trigger = "mmc0";
+		};
+
+	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+
+		vemmc_reg: regulator-0 {
+			compatible = "regulator-fixed";
+			regulator-name = "VMEM_VDD_2.8V";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpk0 2 0>;
+			enable-active-high;
+		};
+
+	};
+
+	/*
+	mshc@12550000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		vmmc-supply = <&vemmc_reg>;
+		clocks = <&clock 301>, <&clock 149>;
+		clocks-name = "dwmci", "sclk_dwmci";
+		clock-frequency = <400000000>;
+
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
+		fifo-depth = <0x80>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+				
+		};
+	};
+	*/
+
+	rtc@10070000 {
+		status = "okay";
+	};
+
+	sdhci@12530000 {
+		bus-width = <4>;
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+	sdhci@1254000 {
+		bus-width = <4>;
+		pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4 &sd3_cd>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	usb_phy: usbphy@125B0000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "samsung,exynos4210-usbphy";
+		reg = <0x12B0000 0x100>;
+		ranges;
+
+		clocks = <&clock 2>, <&clock 305>;
+		clock-names = "xusbxti", "otg";
+		usbphy-sys {
+			/* USB device and host PHY_CONTROL registers */
+			reg = <0x10020704 0x8>;
+		};
+	};
+
+	ehci@12580000 {
+		usb-phy = <&usb_phy>;
+		status = "okay";
+	};
+	
+	ohci@12590000 {
+		status = "okay";
+	};
+
+
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+		status = "okay";
+	};
+
+	serial@13800000 {
+		status = "okay";
+	};
+
+	serial@13810000 {
+		status = "okay";
+	};
+
+	serial@13820000 {
+		status = "okay";
+	};
+
+	serial@13830000 {
+		status = "okay";
+	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible = "samsung,clock-xxti";
+			clock-frequency = <0>;
+		};
+
+		xusbxti {
+			compatible = "samsung,clock-xusbxti";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	i2c@13860000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <200000>;
+
+		wm8960@10 {
+			compatible = "wlf,wm8960";
+			reg = <0x10>;
+		};
+	};
+};
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index f156010..f640ddf 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1084,6 +1084,12 @@ static const struct i2c_device_id wm8960_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wm8960_i2c_id);

+static const struct of_device_id wm8960_of_match[] = {
+	{ .compatible = "wlf,wm8960", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8960_of_match);
+
 static struct i2c_driver wm8960_i2c_driver = {
 	.driver = {
 		.name = "wm8960",

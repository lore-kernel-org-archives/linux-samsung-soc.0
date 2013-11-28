From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: How to enable usb in exynos4412
Date: Thu, 28 Nov 2013 15:37:07 +0100
Message-ID: <2200229.bjG2XWDipV@amdc1227>
References: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45810 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712Ab3K1OhO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 09:37:14 -0500
In-reply-to: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: randy <lxr1234@hotmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, stern@rowland.harvard.edu, devicetree@vger.kernel.org, balbi@ti.com

Hi Randy,

On Thursday 28 of November 2013 22:00:41 randy wrote:
> I have development board whose SoC is exynos4412, I try to enable the
> usb in it but I failed. I saw the document
> Documentation/devicetree/bindings/usb/samsung-usbphy.txt, does it mean
> that the usb driver is not done?
> And about that document, in samsung datasheet(32.8.2), the address reg
> 0x125B_0000 + 32bits contains hsic1, hsic0, phy1 and phy0's power
> control. And in 0x1002_0704 + 3 * 32 bits, it contains usb_phy,
> hsic1_phy and hsic2_phy control(8.8.1.27). So I doubt the documents.
> 
> Here is the log and dts
> ===========================log================================
> [    1.000000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    1.010000] ehci-exynos: EHCI EXYNOS driver
> [    1.015000] unable to find transceiver of type USB2 PHY
> [    1.020000] exynos-ehci 12580000.ehci: no platform data or
> transceiver defined
> [    1.025000] platform 12580000.ehci: Driver exynos-ehci requests probe
> deferral

First of all, do you have CONFIG_SAMSUNG_USB2PHY enabled in your kernel
config? Also, see below.

> 
> ================================dts==================================
> diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts
> b/arch/arm/boot/dts/exynos4412-tiny4412.dts
> new file mode 100644
> index 0000000..c8d4cfa
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
> @@ -0,0 +1,176 @@
> +/*
> + * Hardkernel's Exynos4412 based tiny4412 1306 board device tree source
> + *
> + * Copyright (c) 2013 Tomoya Gitsufuki <ayaka@mail.soulik.info>
> + *
> + * Device tree source file for Friendyarm tiny4412 1306 board which is
> based on
> + * Samsung's Exynos4412 SoC.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +#include "exynos4412.dtsi"
> +
> +/ {
> +	model = "Friendly Arm Tiny4412 1306 board based on Exynos4412";
> +	compatible = "friendlyarm,tiny4412-1306", "samsung,exynos4412";
> +
> +	memory {
> +		reg = <0x40000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		bootargs ="root=/dev/mmcblk0p1 rootfstype=ext4 rw
> console=ttySAC0,115200 init=/sbin/init";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led1 {
> +			label = "led1:heart";
> +			gpios = <&gpm4 0 1>;
> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +		led2 {
> +			label = "led2:mmc0";
> +			gpios = <&gpm4 1 1>;
> +			default-state = "on";
> +			linux,default-trigger = "mmc0";
> +		};
> +
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +
> +		vemmc_reg: regulator-0 {
> +			compatible = "regulator-fixed";
> +			regulator-name = "VMEM_VDD_2.8V";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			gpio = <&gpk0 2 0>;
> +			enable-active-high;
> +		};
> +
> +	};
> +
> +	/*
> +	mshc@12550000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +
> +		vmmc-supply = <&vemmc_reg>;
> +		clocks = <&clock 301>, <&clock 149>;
> +		clocks-name = "dwmci", "sclk_dwmci";
> +		clock-frequency = <400000000>;
> +
> +		num-slots = <1>;
> +		supports-highspeed;
> +		broken-cd;
> +		fifo-depth = <0x80>;
> +		card-detect-delay = <200>;
> +		samsung,dw-mshc-sdr-timing = <2 3>;
> +		samsung,dw-mshc-ddr-timing = <1 2>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <8>;
> +				
> +		};
> +	};
> +	*/
> +
> +	rtc@10070000 {
> +		status = "okay";
> +	};
> +
> +	sdhci@12530000 {
> +		bus-width = <4>;
> +		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +	sdhci@1254000 {
> +		bus-width = <4>;
> +		pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4 &sd3_cd>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +
> +	usb_phy: usbphy@125B0000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "samsung,exynos4210-usbphy";

This is not the compatible listed in [1]. Moreover, it looks like the
compatible string for Exynos4x12 is not documented. According to driver
code, it should be "samsung,exynos4x12-usb2phy".

[1] Documentation/devicetree/bindings/usb/samsung-usbphy.txt

> +		reg = <0x12B0000 0x100>;

The address should be 0x125B0000.

> +		ranges;
> +
> +		clocks = <&clock 2>, <&clock 305>;
> +		clock-names = "xusbxti", "otg";
> +		usbphy-sys {
> +			/* USB device and host PHY_CONTROL registers */
> +			reg = <0x10020704 0x8>;

reg should be <0x10020704 0xc 0x1001021c 0x4> on Exynos4x12.

In general, this PHY driver is only preliminary and there is already
work going on a completely new PHY driver that will cover full USB
functionality present on Exynos 4 and should be much more reliable.

The currently available one might or might not work for you, even after
correcting the things I pointed above.

Best regards,
Tomasz

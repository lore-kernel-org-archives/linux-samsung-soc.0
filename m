From: randy <lxr1234@hotmail.com>
Subject: Can't use the usbphy in exynos4412
Date: Wed, 15 Jan 2014 18:44:33 +0800
Message-ID: <BLU0-SMTP134652419A269488A455784ADBE0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from blu0-omc2-s3.blu0.hotmail.com ([65.55.111.78]:24346 "EHLO
	blu0-omc2-s3.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751424AbaAOKtt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 05:49:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: balbi@ti.com, kgene.kim@samsung.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I meet the usb problem in Linux 3.13-rc8, in my board, the HSIC in SoC
is connect to usb4640, I have using a litter driver to reset usb4640
after boot.
In the old time, when it doesn't use common phy framework, it was work.
In board, the otg is brike(maybe by franklinism) but HSIC of host is
normal, I have tested.
the dmesg show that
[    1.260000] samsung-usb2phy 125b0000.usbphy: Can't get usb-phy
sysreg cfg register
[    1.300000] usbcore: registered new interface driver uvcvideo
[    1.440000] usbcore: registered new interface driver usbhid
[    1.440000] usbhid: USB HID core driver
[    1.475000] samsung-usb2phy 125b0000.usbphy: Can't configure
specified phy mode
specified phy mode

root@kagami:~# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
==================dts========================
/*
 * Hardkernel's Exynos4412 based tiny4412 1306 board device tree source
 *
 * Copyright (c) 2013 Tomoya Gitsufuki <ayaka@mail.soulik.info>
 *
 * Device tree source file for Friendyarm tiny4412 1306 board which is
based on
 * Samsung's Exynos4412 SoC.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

/dts-v1/;
#include "exynos4412.dtsi"

/ {
	model = "Friendly Arm Tiny4412 1306 board based on Exynos4412";
	compatible = "friendlyarm,tiny4412-1306", "samsung,exynos4412";

	memory {
		reg = <0x40000000 0x40000000>;
	};

	chosen {
		bootargs ="root=/dev/mmcblk0p1 rootfstype=ext4 rw
console=ttySAC0,115200 init=/sbin/init";
	};

	leds {
		compatible = "gpio-leds";
		led1 {
			label = "led1:heart";
			gpios = <&gpm4 0 1>;
			default-state = "on";
			linux,default-trigger = "heartbeat";
		};
		led2 {
			label = "led2:mmc0";
			gpios = <&gpm4 1 1>;
			default-state = "on";
			linux,default-trigger = "mmc0";
		};

	};

	regulators {
		compatible = "simple-bus";
		#address-cells = <1>;

		vemmc_reg: regulator-0 {
			compatible = "regulator-fixed";
			regulator-name = "VMEM_VDD_2.8V";
			regulator-min-microvolt = <2800000>;
			regulator-max-microvolt = <2800000>;
			gpio = <&gpk0 2 0>;
			enable-active-high;
		};

	};

	mshc@12550000 {
		num-slots = <1>;
		supports-highspeed;
		/*vmmc-supply = <&vemmc_reg>;*/

		broken-cd;
		non-removable;
		card-detect-delay = <200>;
		samsung,dw-mshc-ciu-div = <3>;
		samsung,dw-mshc-sdr-timing = <2 3>;
		samsung,dw-mshc-ddr-timing = <1 2>;
		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
		pinctrl-names = "default";
		status = "okay";

		slot@0 {
			reg = <0>;
			bus-width = <8>;
		};
	};

	rtc@10070000 {
		status = "okay";
	};

	sdhci@12530000 {
		bus-width = <4>;
		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
		pinctrl-names = "default";
		status = "okay";
	};
	sdhci@1254000 {
		bus-width = <4>;
		pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4 &sd3_cd>;
		pinctrl-names = "default";
		status = "okay";
	};

	usb4640 {
		compatible = "smsc,usb4640";
		reset-gpios = <&gpm2 4 1>;
	};

	usb_phy: usbphy@125B0000 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "samsung,exynos4210-usb2phy";
		reg = <0x125B0000 0x100>;
		ranges;
		status = "okay";

		clocks = <&clock 2>, <&clock 305>;
		clock-names = "xusbxti", "otg";

		usbphy-sys {
			/* USB device and host PHY_CONTROL registers */
			reg = <0x10020704 0x8>;
		};
	};

	ehci@12580000 {
		usb-phy = <&usb_phy>;
		status = "okay";
	};

	codec@13400000 {
		samsung,mfc-r = <0x43000000 0x800000>;
		samsung,mfc-l = <0x51000000 0x800000>;
		status = "okay";
	};

	serial@13800000 {
		status = "okay";
	};

	serial@13810000 {
		status = "okay";
	};

	serial@13820000 {
		status = "okay";
	};

	serial@13830000 {
		status = "okay";
	};

	fixed-rate-clocks {
		xxti {
			compatible = "samsung,clock-xxti";
			clock-frequency = <0>;
		};

		xusbxti {
			compatible = "samsung,clock-xusbxti";
			clock-frequency = <24000000>;
		};
	};

	i2c@13860000 {
		status = "okay";
		samsung,i2c-sda-delay = <100>;
		samsung,i2c-max-bus-freq = <200000>;

		wm8960@10 {
			compatible = "wlf,wm8960";
			reg = <0x10>;
		};
	};
};
=================end dts======================
Thank you
ayaka
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJS1maOAAoJEPb4VsMIzTzil+sH/0vyYQLE1UVkchPkGPf5z0Xj
zSjry3FqsJOdoEV2551V+MlXwUc+KzfmZ/T6oZShq2Uywa+C3zuw+fMAurf1JKxm
ogFAv816ncFeMRud+2mmSuN9J4oAZ99sYMQ57W0t0o4+lRJm7ASfM6S00IxLNxjb
Kyv+5yhGn9HH08FcTM+3kMSMkcBgka6/ojtS0249tva5IcweR0TSSJqmYPDGePjE
x256eHyi39357VcaI9pUhuGl1ZkA2arRbRGgkE1bjG8SAqAMpcy7t/cLs4LVjiU/
qsz0po0LMvtXZJ0gC4ktmPN0Z4BjPuxMqXHqnvlYT3q8e+BhrvZkTphS57DsNIk=
=0Iaw
-----END PGP SIGNATURE-----

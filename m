From: randy <lxr1234@hotmail.com>
Subject: Re: How to enable usb in exynos4412
Date: Thu, 28 Nov 2013 23:29:26 +0800
Message-ID: <BLU0-SMTP92C7727197877F7B4E95D9ADEE0@phx.gbl>
References: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl> <2200229.bjG2XWDipV@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from blu0-omc2-s16.blu0.hotmail.com ([65.55.111.91]:23799 "EHLO
	blu0-omc2-s16.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752042Ab3K1P3a convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Nov 2013 10:29:30 -0500
In-Reply-To: <2200229.bjG2XWDipV@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, stern@rowland.harvard.edu, devicetree@vger.kernel.org, balbi@ti.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello Tomasz Figa
=E4=BA=8E 2013=E5=B9=B411=E6=9C=8828=E6=97=A5 22:37, Tomasz Figa =E5=86=
=99=E9=81=93:
> Hi Randy,
>=20
> On Thursday 28 of November 2013 22:00:41 randy wrote:
>> I have development board whose SoC is exynos4412, I try to enable
>> the usb in it but I failed. I saw the document=20
>> Documentation/devicetree/bindings/usb/samsung-usbphy.txt, does it
>> mean that the usb driver is not done? And about that document, in
>> samsung datasheet(32.8.2), the address reg 0x125B_0000 + 32bits
>> contains hsic1, hsic0, phy1 and phy0's power control. And in
>> 0x1002_0704 + 3 * 32 bits, it contains usb_phy, hsic1_phy and
>> hsic2_phy control(8.8.1.27). So I doubt the documents.
>>=20
>> Here is the log and dts=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3Dlog=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [
>> 1.000000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI)
>> Driver [    1.010000] ehci-exynos: EHCI EXYNOS driver [
>> 1.015000] unable to find transceiver of type USB2 PHY [
>> 1.020000] exynos-ehci 12580000.ehci: no platform data or=20
>> transceiver defined [    1.025000] platform 12580000.ehci: Driver
>> exynos-ehci requests probe deferral
>=20
> First of all, do you have CONFIG_SAMSUNG_USB2PHY enabled in your
> kernel config? Also, see below.
>=20
>>=20
Yes, I have

ayaka@kotomi:~/workplace/exynos4412/kernel/linux-mainline$ cat
=2E./build-linux-mainline/.config|grep CONFIG_SAMSUNG_USB2PHY
CONFIG_SAMSUNG_USB2PHY=3Dy
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3Ddts=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>=20
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts
>> b/arch/arm/boot/dts/exynos4412-tiny4412.dts new file mode 100644=20
>> index 0000000..c8d4cfa --- /dev/null +++
>> b/arch/arm/boot/dts/exynos4412-tiny4412.dts @@ -0,0 +1,176 @@=20
>> +/* + * Hardkernel's Exynos4412 based tiny4412 1306 board device
>> tree source + * + * Copyright (c) 2013 Tomoya Gitsufuki
>> <ayaka@mail.soulik.info> + * + * Device tree source file for
>> Friendyarm tiny4412 1306 board which is based on + * Samsung's
>> Exynos4412 SoC. + * + * This program is free software; you can
>> redistribute it and/or modify + * it under the terms of the GNU
>> General Public License version 2 as + * published by the Free
>> Software Foundation. +*/ + +/dts-v1/; +#include
>> "exynos4412.dtsi" + +/ { +	model =3D "Friendly Arm Tiny4412 1306
>> board based on Exynos4412"; +	compatible =3D
>> "friendlyarm,tiny4412-1306", "samsung,exynos4412"; + +	memory { +
>> reg =3D <0x40000000 0x40000000>; +	}; + +	chosen { +		bootargs
>> =3D"root=3D/dev/mmcblk0p1 rootfstype=3Dext4 rw console=3DttySAC0,115=
200
>> init=3D/sbin/init"; +	}; + +	leds { +		compatible =3D "gpio-leds"; +
>> led1 { +			label =3D "led1:heart"; +			gpios =3D <&gpm4 0 1>; +
>> default-state =3D "on"; +			linux,default-trigger =3D "heartbeat"; +
>> }; +		led2 { +			label =3D "led2:mmc0"; +			gpios =3D <&gpm4 1 1>; +
>> default-state =3D "on"; +			linux,default-trigger =3D "mmc0"; +		};=20
>> + +	}; + +	regulators { +		compatible =3D "simple-bus"; +
>> #address-cells =3D <1>; + +		vemmc_reg: regulator-0 { +
>> compatible =3D "regulator-fixed"; +			regulator-name =3D
>> "VMEM_VDD_2.8V"; +			regulator-min-microvolt =3D <2800000>; +
>> regulator-max-microvolt =3D <2800000>; +			gpio =3D <&gpk0 2 0>; +
>> enable-active-high; +		}; + +	}; + +	/* +	mshc@12550000 { +
>> #address-cells =3D <1>; +		#size-cells =3D <0>; +		pinctrl-0 =3D
>> <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>; +		pinctrl-names =3D
>> "default"; +		status =3D "okay"; + +		vmmc-supply =3D <&vemmc_reg>; =
+
>> clocks =3D <&clock 301>, <&clock 149>; +		clocks-name =3D "dwmci",
>> "sclk_dwmci"; +		clock-frequency =3D <400000000>; + +		num-slots =3D
>> <1>; +		supports-highspeed; +		broken-cd; +		fifo-depth =3D
>> <0x80>; +		card-detect-delay =3D <200>; +
>> samsung,dw-mshc-sdr-timing =3D <2 3>; +		samsung,dw-mshc-ddr-timing
>> =3D <1 2>; + +		slot@0 { +			reg =3D <0>; +			bus-width =3D <8>; + +
>> }; +	}; +	*/ + +	rtc@10070000 { +		status =3D "okay"; +	}; + +
>> sdhci@12530000 { +		bus-width =3D <4>; +		pinctrl-0 =3D <&sd2_clk
>> &sd2_cmd &sd2_bus4 &sd2_cd>; +		pinctrl-names =3D "default"; +
>> status =3D "okay"; +	}; +	sdhci@1254000 { +		bus-width =3D <4>; +
>> pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4 &sd3_cd>; +
>> pinctrl-names =3D "default"; +		status =3D "okay"; +	}; + +	usb_phy:
>> usbphy@125B0000 { +		#address-cells =3D <1>; +		#size-cells =3D <1>;=
=20
>> +		compatible =3D "samsung,exynos4210-usbphy";
>=20
> This is not the compatible listed in [1]. Moreover, it looks like
> the compatible string for Exynos4x12 is not documented. According
> to driver code, it should be "samsung,exynos4x12-usb2phy".
>=20
> [1] Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>=20
>> +		reg =3D <0x12B0000 0x100>;
>=20
> The address should be 0x125B0000.
>=20
>> +		ranges; + +		clocks =3D <&clock 2>, <&clock 305>; +		clock-names
>> =3D "xusbxti", "otg"; +		usbphy-sys { +			/* USB device and host
>> PHY_CONTROL registers */ +			reg =3D <0x10020704 0x8>;
>=20
> reg should be <0x10020704 0xc 0x1001021c 0x4> on Exynos4x12.
>=20
> In general, this PHY driver is only preliminary and there is
> already work going on a completely new PHY driver that will cover
> full USB functionality present on Exynos 4 and should be much more
> reliable.
>=20
> The currently available one might or might not work for you, even
> after correcting the things I pointed above.
>=20
> Best regards, Tomasz
>=20
>=20
>=20
I have follow you, yes it doesn't work. I have tested it many times
before, the first address problem may is modified in one test.
So I shall wait the driver to be ready?
Thank you.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSl2FPAAoJEPb4VsMIzTzi4fEH/1oSAOP3Ei3lNC8aIQM5Kzl0
TY19PlixKp33sJiSY9ojRxObilMX3MI2elNxNpKl8X+HbqJhlWlrifa+u202A4UW
Cen0RJcFfYBKSQvY2rf/aeJxTbcBFrrHc5p6P/fQh3hJn4SgfS4qYeQKyYUv494p
yhqJvHOGNDP3h2SR6DTwb/2sTiLFCvuM5Ea8IkjfLv+dsYOlaXl1/b6az0g0IHXc
wiGChsm9lQlHc5RCYpoJYFnUueRWjBoJcBPNJH54gJ3HQx48D7g5TGOAwubTPYQt
7BGuFYPqPwbEMon81bv72k/XJ6BoTH1NfWP8scMxNHrSJNLc9QUL3qlIMmA2b7c=3D
=3DLK75
-----END PGP SIGNATURE-----

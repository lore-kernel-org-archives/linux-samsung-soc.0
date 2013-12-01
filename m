From: randy <lxr1234@hotmail.com>
Subject: Re: How to enable usb in exynos4412
Date: Sun, 1 Dec 2013 23:29:33 +0800
Message-ID: <BLU0-SMTP406A2975E09864F69AB309BADEB0@phx.gbl>
References: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl> <2200229.bjG2XWDipV@amdc1227> <BLU0-SMTP92C7727197877F7B4E95D9ADEE0@phx.gbl> <CAHaF_kiiRNeEiLmo+m9Lqv0+8csBJy_ub7hiRHf_aip5LEc_=Q@mail.gmail.com> <BLU0-SMTP207EE7485EB8ADF27C9FFD0ADEB0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from blu0-omc4-s5.blu0.hotmail.com ([65.55.111.144]:1635 "EHLO
	blu0-omc4-s5.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751627Ab3LAP3i convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Dec 2013 10:29:38 -0500
In-Reply-To: <BLU0-SMTP207EE7485EB8ADF27C9FFD0ADEB0@phx.gbl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kasim ling <kasimling@gmail.com>, Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yes, the usb is workable.
The 0x1001021c is the USB control register from samsung datasheet(12.2)
Thank you. I will check my code to know why it doesn't work.
I didn't notice your work in mail list before.
But I think we shall separate hw:1306 and hw:1308 of tiny4412.
As those external devices have some different.
Thank you again
=D3=DA 2013=C4=EA12=D4=C201=C8=D5 21:42, randy =D0=B4=B5=C0:
> But do you notice the mail Tomasz sent to me before? I don't know
> whether the power control reg address of your code is correct. As
> the status is disable in your code, so shall I change it to okay=20
> When I test it? I will do a test later. Thank you=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +		ranges; + +		clocks =3D <&clock 2>, <&clock 305>; +		clock-names
>> =3D "xusbxti", "otg"; +		usbphy-sys { +			/* USB device and host=20
>> PHY_CONTROL registers */ +			reg =3D <0x10020704 0x8>;
> reg should be <0x10020704 0xc 0x1001021c 0x4> on Exynos4x12.
>=20
> =D3=DA 2013=C4=EA12=D4=C201=C8=D5 20:49, kasim ling =D0=B4=B5=C0:
>> Hi, Randy, I'm also working with FriendlyARM Tiny4412 board and=20
>> I've had a working 3.13-rc2-based kernel tree with USB host=20
>> function working. You can refer to my commit at=20
>> https://github.com/kasimling/linux/commit/a452fb006c657de5c038f04d8f=
610567580ea99c.
>
>>=20
>=20
> You can also check out branch "tiny4412_3.13-dev" of repository
>> "https://github.com/kasimling/linux.git".
>=20
>=20
>> BR, Alex
>=20
>=20
>> On Thu, Nov 28, 2013 at 11:29 PM, randy <lxr1234@hotmail.com=20
>> <mailto:lxr1234@hotmail.com>> wrote:
>=20
>> Hello Tomasz Figa =D3=DA 2013=C4=EA11=D4=C228=C8=D5 22:37, Tomasz Fi=
ga =D0=B4=B5=C0:
>>> Hi Randy,
>=20
>>> On Thursday 28 of November 2013 22:00:41 randy wrote:
>>>> I have development board whose SoC is exynos4412, I try to=20
>>>> enable the usb in it but I failed. I saw the document=20
>>>> Documentation/devicetree/bindings/usb/samsung-usbphy.txt,
>>>> does it mean that the usb driver is not done? And about that=20
>>>> document, in samsung datasheet(32.8.2), the address reg=20
>>>> 0x125B_0000 + 32bits contains hsic1, hsic0, phy1 and phy0's=20
>>>> power control. And in 0x1002_0704 + 3 * 32 bits, it contains=20
>>>> usb_phy, hsic1_phy and hsic2_phy control(8.8.1.27). So I
>>>> doubt the documents.
>>>>=20
>>>> Here is the log and dts=20
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3Dlog=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>>=20
[ 1.000000] ehci_hcd: USB 2.0 'Enhanced' Host Controller
>>>> (EHCI) Driver [    1.010000] ehci-exynos: EHCI EXYNOS driver
>>>> [ 1.015000] unable to find transceiver of type USB2 PHY [=20
>>>> 1.020000] exynos-ehci 12580000.ehci: no platform data or=20
>>>> transceiver defined [    1.025000] platform 12580000.ehci:=20
>>>> Driver exynos-ehci requests probe deferral
>=20
>>> First of all, do you have CONFIG_SAMSUNG_USB2PHY enabled in
>>> your kernel config? Also, see below.
>=20
>>>>=20
>> Yes, I have
>=20
>> ayaka@kotomi:~/workplace/exynos4412/kernel/linux-mainline$ cat=20
>> ../build-linux-mainline/.config|grep CONFIG_SAMSUNG_USB2PHY=20
>> CONFIG_SAMSUNG_USB2PHY=3Dy
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3Ddts=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>>
>
>>>>=20
>>>>=20
> diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts
>>>> b/arch/arm/boot/dts/exynos4412-tiny4412.dts new file mode=20
>>>> 100644 index 0000000..c8d4cfa --- /dev/null +++=20
>>>> b/arch/arm/boot/dts/exynos4412-tiny4412.dts @@ -0,0 +1,176 @@
>>>>  +/* + * Hardkernel's Exynos4412 based tiny4412 1306 board=20
>>>> device tree source + * + * Copyright (c) 2013 Tomoya
>>>> Gitsufuki <ayaka@mail.soulik.info
>>>> <mailto:ayaka@mail.soulik.info>> + * + *
>> Device tree source file for
>>>> Friendyarm tiny4412 1306 board which is based on + *
>>>> Samsung's Exynos4412 SoC. + * + * This program is free
>>>> software; you can redistribute it and/or modify + * it under
>>>> the terms of the GNU General Public License version 2 as + *
>>>> published by the Free Software Foundation. +*/ + +/dts-v1/;
>>>> +#include "exynos4412.dtsi" + +/ { +   model =3D "Friendly Arm
>>>> Tiny4412 1306 board based on Exynos4412"; +        compatible
>>>> =3D "friendlyarm,tiny4412-1306", "samsung,exynos4412"; + +
>> memory { +
>>>> reg =3D <0x40000000 0x40000000>; +     }; + +  chosen { +
>>>>=20
>> bootargs
>>>> =3D"root=3D/dev/mmcblk0p1 rootfstype=3Dext4 rw=20
>>>> console=3DttySAC0,115200 init=3D/sbin/init"; +  }; + +  leds { +=20
>>>> compatible =3D
>> "gpio-leds"; +
>>>> led1 { +                     label =3D "led1:heart"; +
>>>>=20
>> gpios =3D <&gpm4 0 1>; +
>>>> default-state =3D "on"; +
>> linux,default-trigger =3D "heartbeat"; +
>>>> }; +         led2 { +                        label =3D=20
>>>> "led2:mmc0";
>> +                  gpios =3D <&gpm4 1 1>; +
>>>> default-state =3D "on"; +
>> linux,default-trigger =3D "mmc0"; +               };
>>>> + +  }; + +  regulators { +          compatible =3D
>>>> "simple-bus"; + #address-cells =3D <1>; + +
>>>> vemmc_reg: regulator-0 { + compatible =3D "regulator-fixed"; +=20
>>>> regulator-name =3D "VMEM_VDD_2.8V"; + regulator-min-microvolt
>>>> =3D
>> <2800000>; +
>>>> regulator-max-microvolt =3D <2800000>; + gpio
>> =3D <&gpk0 2 0>; +
>>>> enable-active-high; +                }; + +  }; + +  /* +
>> mshc@12550000 { +
>>>> #address-cells =3D <1>; +              #size-cells =3D <0>; +
>>>>=20
>> pinctrl-0 =3D
>>>> <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>; + pinctrl-names =3D
>>>> "default"; +         status =3D "okay"; + + vmmc-supply
>> =3D <&vemmc_reg>; +
>>>> clocks =3D <&clock 301>, <&clock 149>; + clocks-name
>> =3D "dwmci",
>>>> "sclk_dwmci"; +              clock-frequency =3D <400000000>; +
>>>> +
>>>>=20
>> num-slots =3D
>>>> <1>; +               supports-highspeed; +
>>>> broken-cd; +
>> fifo-depth =3D
>>>> <0x80>; +            card-detect-delay =3D <200>; +=20
>>>> samsung,dw-mshc-sdr-timing =3D <2 3>; +
>> samsung,dw-mshc-ddr-timing
>>>> =3D <1 2>; + +         slot@0 { +                      reg =3D
>>>> <0>; +
>> bus-width =3D <8>; + +
>>>> }; + }; +    */ + +  rtc@10070000 { +                status
>>>> =3D
>> "okay"; +      }; + +
>>>> sdhci@12530000 { +           bus-width =3D <4>; +
>> pinctrl-0 =3D <&sd2_clk
>>>> &sd2_cmd &sd2_bus4 &sd2_cd>; +               pinctrl-names =3D
>> "default"; +
>>>> status =3D "okay"; +   }; +    sdhci@1254000 { +
>> bus-width =3D <4>; +
>>>> pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4 &sd3_cd>; +=20
>>>> pinctrl-names =3D "default"; +         status =3D "okay"; +
>>>> }; +
>> +  usb_phy:
>>>> usbphy@125B0000 { +          #address-cells =3D <1>; +
>> #size-cells =3D <1>;
>>>> +            compatible =3D "samsung,exynos4210-usbphy";
>=20
>>> This is not the compatible listed in [1]. Moreover, it looks=20
>>> like the compatible string for Exynos4x12 is not documented.=20
>>> According to driver code, it should be=20
>>> "samsung,exynos4x12-usb2phy".
>=20
>>> [1] Documentation/devicetree/bindings/usb/samsung-usbphy.txt
>=20
>>>> +            reg =3D <0x12B0000 0x100>;
>=20
>>> The address should be 0x125B0000.
>=20
>>>> +            ranges; + +             clocks =3D <&clock 2>,=20
>>>> <&clock
>> 305>; +            clock-names
>>>> =3D "xusbxti", "otg"; +                usbphy-sys { +
>>>>=20
>> /* USB device and host
>>>> PHY_CONTROL registers */ +                   reg =3D
>>>> <0x10020704 0x8>;
>=20
>>> reg should be <0x10020704 0xc 0x1001021c 0x4> on Exynos4x12.
>=20
>>> In general, this PHY driver is only preliminary and there is=20
>>> already work going on a completely new PHY driver that will=20
>>> cover full USB functionality present on Exynos 4 and should be=20
>>> much more reliable.
>=20
>>> The currently available one might or might not work for you,=20
>>> even after correcting the things I pointed above.
>=20
>>> Best regards, Tomasz
>=20
>=20
>=20
>> I have follow you, yes it doesn't work. I have tested it many=20
>> times before, the first address problem may is modified in one=20
>> test. So I shall wait the driver to be ready? Thank you. -- To=20
>> unsubscribe from this list: send the line "unsubscribe=20
>> linux-samsung-soc" in the body of a message to=20
>> majordomo@vger.kernel.org <mailto:majordomo@vger.kernel.org>
>> More majordomo info at
>> http://vger.kernel.org/majordomo-info.html
>=20
>=20
>=20
> -- To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>=20
>=20

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSm1XdAAoJEPb4VsMIzTzi48wH/ieQyX44A9ScQXdC4jaSYyxm
XdnaoY35PA5Sl0sTi5WnoHm4+Harcr5yPebOVAVZAua49f9xIodH/LBYLVZV5KJW
22Zy0Lk2+I2DrCKV09SVHRF91Nw5PCZJYcPs9AlQpTBDr+QB3c3L47i8ek/cZw5B
dVWLRurM5u6DADysUqyudmk1hbHbFVun/3pUeQw1lwFmHdYepp+5RYnoDzECbmYS
rkVIX8rnxbg/d3Ow2XO2gdKXHFiY5ST7QAACIzIriq9ZSfsqrYWdiEG1k5CrzK8o
Z/nKEfBuQw5JidyQDwCbOFrhRpeW9KLJ5UQfW619sNwPy9M6a+HDqYaevdWSodA=3D
=3DJSWH
-----END PGP SIGNATURE-----

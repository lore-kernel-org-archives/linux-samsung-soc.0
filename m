From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: How to enable usb in exynos4412
Date: Sun, 01 Dec 2013 16:48:30 +0100
Message-ID: <13200823.YkXVXGUJAP@flatron>
References: <BLU0-SMTP72A83BF7783889A9C59A03ADEE0@phx.gbl> <BLU0-SMTP207EE7485EB8ADF27C9FFD0ADEB0@phx.gbl> <BLU0-SMTP406A2975E09864F69AB309BADEB0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:62545 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab3LAPsf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Dec 2013 10:48:35 -0500
Received: by mail-bk0-f54.google.com with SMTP id v16so4928060bkz.41
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Dec 2013 07:48:33 -0800 (PST)
In-Reply-To: <BLU0-SMTP406A2975E09864F69AB309BADEB0@phx.gbl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: randy <lxr1234@hotmail.com>, kasim ling <kasimling@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com

Hi,

Since it seems like you are not quite accustomed to posting on mailing
lists yet, I'd like to recommend you to read following great article:

http://linux.sgms-centre.com/misc/netiquette.php

Applying the simple rules pointed there will save you from potential
unpleasant reception of your messages by other list subscribers and
probably also greatly increase chances of your questions getting answer=
ed.

I'd like especially point that HTML messages are not allowed on many
mailing lists and they are simply dropped, without any chance of being
read by other people.

Best regards,
Tomasz

On Sunday 01 of December 2013 23:29:33 randy wrote:
> Yes, the usb is workable.
> The 0x1001021c is the USB control register from samsung datasheet(12.=
2)
> Thank you. I will check my code to know why it doesn't work.
> I didn't notice your work in mail list before.
> But I think we shall separate hw:1306 and hw:1308 of tiny4412.
> As those external devices have some different.
> Thank you again
> =E4=BA=8E 2013=E5=B9=B412=E6=9C=8801=E6=97=A5 21:42, randy =E5=86=99=E9=
=81=93:
> > But do you notice the mail Tomasz sent to me before? I don't know
> > whether the power control reg address of your code is correct. As
> > the status is disable in your code, so shall I change it to okay
> > When I test it? I will do a test later. Thank you
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +		ranges; + +		clocks =3D <&clock 2>, <&clock 305>; +		clock-name=
s
> >> =3D "xusbxti", "otg"; +		usbphy-sys { +			/* USB device and host
> >> PHY_CONTROL registers */ +			reg =3D <0x10020704 0x8>;
> > reg should be <0x10020704 0xc 0x1001021c 0x4> on Exynos4x12.
> >
> > =E4=BA=8E 2013=E5=B9=B412=E6=9C=8801=E6=97=A5 20:49, kasim ling =E5=
=86=99=E9=81=93:
> >> Hi, Randy, I'm also working with FriendlyARM Tiny4412 board and
> >> I've had a working 3.13-rc2-based kernel tree with USB host
> >> function working. You can refer to my commit at
> >> https://github.com/kasimling/linux/commit/a452fb006c657de5c038f04d=
8f610567580ea99c.
> >
> >>
> >
> > You can also check out branch "tiny4412_3.13-dev" of repository
> >> "https://github.com/kasimling/linux.git".
> >
> >
> >> BR, Alex
> >
> >
> >> On Thu, Nov 28, 2013 at 11:29 PM, randy <lxr1234@hotmail.com
> >> <mailto:lxr1234@hotmail.com>> wrote:
> >
> >> Hello Tomasz Figa =E4=BA=8E 2013=E5=B9=B411=E6=9C=8828=E6=97=A5 22=
:37, Tomasz Figa =E5=86=99=E9=81=93:
> >>> Hi Randy,
> >
> >>> On Thursday 28 of November 2013 22:00:41 randy wrote:
> >>>> I have development board whose SoC is exynos4412, I try to
> >>>> enable the usb in it but I failed. I saw the document
> >>>> Documentation/devicetree/bindings/usb/samsung-usbphy.txt,
> >>>> does it mean that the usb driver is not done? And about that
> >>>> document, in samsung datasheet(32.8.2), the address reg
> >>>> 0x125B_0000 + 32bits contains hsic1, hsic0, phy1 and phy0's
> >>>> power control. And in 0x1002_0704 + 3 * 32 bits, it contains
> >>>> usb_phy, hsic1_phy and hsic2_phy control(8.8.1.27). So I
> >>>> doubt the documents.
> >>>>
> >>>> Here is the log and dts
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3Dlog=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>
> >>>>
> [ 1.000000] ehci_hcd: USB 2.0 'Enhanced' Host Controller
> >>>> (EHCI) Driver [    1.010000] ehci-exynos: EHCI EXYNOS driver
> >>>> [ 1.015000] unable to find transceiver of type USB2 PHY [
> >>>> 1.020000] exynos-ehci 12580000.ehci: no platform data or
> >>>> transceiver defined [    1.025000] platform 12580000.ehci:
> >>>> Driver exynos-ehci requests probe deferral
> >
> >>> First of all, do you have CONFIG_SAMSUNG_USB2PHY enabled in
> >>> your kernel config? Also, see below.
> >
> >>>>
> >> Yes, I have
> >
> >> ayaka@kotomi:~/workplace/exynos4412/kernel/linux-mainline$ cat
> >> ../build-linux-mainline/.config|grep CONFIG_SAMSUNG_USB2PHY
> >> CONFIG_SAMSUNG_USB2PHY=3Dy
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3Ddts=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>
> >>>>
> >
> >>>>
> >>>>
> > diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts
> >>>> b/arch/arm/boot/dts/exynos4412-tiny4412.dts new file mode
> >>>> 100644 index 0000000..c8d4cfa --- /dev/null +++
> >>>> b/arch/arm/boot/dts/exynos4412-tiny4412.dts @@ -0,0 +1,176 @@
> >>>>  +/* + * Hardkernel's Exynos4412 based tiny4412 1306 board
> >>>> device tree source + * + * Copyright (c) 2013 Tomoya
> >>>> Gitsufuki <ayaka@mail.soulik.info
> >>>> <mailto:ayaka@mail.soulik.info>> + * + *
> >> Device tree source file for
> >>>> Friendyarm tiny4412 1306 board which is based on + *
> >>>> Samsung's Exynos4412 SoC. + * + * This program is free
> >>>> software; you can redistribute it and/or modify + * it under
> >>>> the terms of the GNU General Public License version 2 as + *
> >>>> published by the Free Software Foundation. +*/ + +/dts-v1/;
> >>>> +#include "exynos4412.dtsi" + +/ { +   model =3D "Friendly Arm
> >>>> Tiny4412 1306 board based on Exynos4412"; +        compatible
> >>>> =3D "friendlyarm,tiny4412-1306", "samsung,exynos4412"; + +
> >> memory { +
> >>>> reg =3D <0x40000000 0x40000000>; +     }; + +  chosen { +
> >>>>
> >> bootargs
> >>>> =3D"root=3D/dev/mmcblk0p1 rootfstype=3Dext4 rw
> >>>> console=3DttySAC0,115200 init=3D/sbin/init"; +  }; + +  leds { +
> >>>> compatible =3D
> >> "gpio-leds"; +
> >>>> led1 { +                     label =3D "led1:heart"; +
> >>>>
> >> gpios =3D <&gpm4 0 1>; +
> >>>> default-state =3D "on"; +
> >> linux,default-trigger =3D "heartbeat"; +
> >>>> }; +         led2 { +                        label =3D
> >>>> "led2:mmc0";
> >> +                  gpios =3D <&gpm4 1 1>; +
> >>>> default-state =3D "on"; +
> >> linux,default-trigger =3D "mmc0"; +               };
> >>>> + +  }; + +  regulators { +          compatible =3D
> >>>> "simple-bus"; + #address-cells =3D <1>; + +
> >>>> vemmc_reg: regulator-0 { + compatible =3D "regulator-fixed"; +
> >>>> regulator-name =3D "VMEM_VDD_2.8V"; + regulator-min-microvolt
> >>>> =3D
> >> <2800000>; +
> >>>> regulator-max-microvolt =3D <2800000>; + gpio
> >> =3D <&gpk0 2 0>; +
> >>>> enable-active-high; +                }; + +  }; + +  /* +
> >> mshc@12550000 { +
> >>>> #address-cells =3D <1>; +              #size-cells =3D <0>; +
> >>>>
> >> pinctrl-0 =3D
> >>>> <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>; + pinctrl-names =3D
> >>>> "default"; +         status =3D "okay"; + + vmmc-supply
> >> =3D <&vemmc_reg>; +
> >>>> clocks =3D <&clock 301>, <&clock 149>; + clocks-name
> >> =3D "dwmci",
> >>>> "sclk_dwmci"; +              clock-frequency =3D <400000000>; +
> >>>> +
> >>>>
> >> num-slots =3D
> >>>> <1>; +               supports-highspeed; +
> >>>> broken-cd; +
> >> fifo-depth =3D
> >>>> <0x80>; +            card-detect-delay =3D <200>; +
> >>>> samsung,dw-mshc-sdr-timing =3D <2 3>; +
> >> samsung,dw-mshc-ddr-timing
> >>>> =3D <1 2>; + +         slot@0 { +                      reg =3D
> >>>> <0>; +
> >> bus-width =3D <8>; + +
> >>>> }; + }; +    */ + +  rtc@10070000 { +                status
> >>>> =3D
> >> "okay"; +      }; + +
> >>>> sdhci@12530000 { +           bus-width =3D <4>; +
> >> pinctrl-0 =3D <&sd2_clk
> >>>> &sd2_cmd &sd2_bus4 &sd2_cd>; +               pinctrl-names =3D
> >> "default"; +
> >>>> status =3D "okay"; +   }; +    sdhci@1254000 { +
> >> bus-width =3D <4>; +
> >>>> pinctrl-0 =3D <&sd3_clk &sd3_cmd &sd3_bus4 &sd3_cd>; +
> >>>> pinctrl-names =3D "default"; +         status =3D "okay"; +
> >>>> }; +
> >> +  usb_phy:
> >>>> usbphy@125B0000 { +          #address-cells =3D <1>; +
> >> #size-cells =3D <1>;
> >>>> +            compatible =3D "samsung,exynos4210-usbphy";
> >
> >>> This is not the compatible listed in [1]. Moreover, it looks
> >>> like the compatible string for Exynos4x12 is not documented.
> >>> According to driver code, it should be
> >>> "samsung,exynos4x12-usb2phy".
> >
> >>> [1] Documentation/devicetree/bindings/usb/samsung-usbphy.txt
> >
> >>>> +            reg =3D <0x12B0000 0x100>;
> >
> >>> The address should be 0x125B0000.
> >
> >>>> +            ranges; + +             clocks =3D <&clock 2>,
> >>>> <&clock
> >> 305>; +            clock-names
> >>>> =3D "xusbxti", "otg"; +                usbphy-sys { +
> >>>>
> >> /* USB device and host
> >>>> PHY_CONTROL registers */ +                   reg =3D
> >>>> <0x10020704 0x8>;
> >
> >>> reg should be <0x10020704 0xc 0x1001021c 0x4> on Exynos4x12.
> >
> >>> In general, this PHY driver is only preliminary and there is
> >>> already work going on a completely new PHY driver that will
> >>> cover full USB functionality present on Exynos 4 and should be
> >>> much more reliable.
> >
> >>> The currently available one might or might not work for you,
> >>> even after correcting the things I pointed above.
> >
> >>> Best regards, Tomasz
> >
> >
> >
> >> I have follow you, yes it doesn't work. I have tested it many
> >> times before, the first address problem may is modified in one
> >> test. So I shall wait the driver to be ready? Thank you. -- To
> >> unsubscribe from this list: send the line "unsubscribe
> >> linux-samsung-soc" in the body of a message to
> >> majordomo@vger.kernel.org <mailto:majordomo@vger.kernel.org>
> >> More majordomo info at
> >> http://vger.kernel.org/majordomo-info.html
> >
> >
> >
> > -- To unsubscribe from this list: send the line "unsubscribe
> > linux-samsung-soc" in the body of a message to
> > majordomo@vger.kernel.org More majordomo info at
> > http://vger.kernel.org/majordomo-info.html
> >
> >
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

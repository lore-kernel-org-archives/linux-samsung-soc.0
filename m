From: randy <lxr1234@hotmail.com>
Subject: Re: linux 3.13-rc1 make dw_mmc-exynos more worse
Date: Tue, 26 Nov 2013 14:00:20 +0800
Message-ID: <BLU0-SMTP572E6FBC0A6572AEB71304ADEC0@phx.gbl>
References: <BLU0-SMTP154F63148320A2FFA456BFADE20@phx.gbl> <CAOesGMim3niC75g3VK1Ue=98NySmUVHyRAOvd-+RWwZ3gHVx2w@mail.gmail.com> <1468386.irfukHHsPa@flatron> <BLU0-SMTP146D04141F53FD0FFC1D78DADEC0@phx.gbl> <52942461.5060406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from blu0-omc4-s21.blu0.hotmail.com ([65.55.111.160]:10500 "EHLO
	blu0-omc4-s21.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754280Ab3KZGAS convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Nov 2013 01:00:18 -0500
In-Reply-To: <52942461.5060406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Seungwon Jeon <tgih.jun@samsung.com>, t.figa@samsung.com, olof@lixom.net, kgene.kim@samsung.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks Jaehoon,
I have noticed that before it, but in dw_mmc driver, I won't meet this
problem.
As you can seen in dts, I have defined a clock source.
Or the clock source what I choose is not correct?
I don't know how to debug this, I don't know much about it.
Actually, I don't really understand the contain in chapter 7 of datashe=
et.
I am sorry for that.
Would you like to tell me some more about it?

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8826=E6=97=A5 12:32, Jaehoon Chung =E5=86=
=99=E9=81=93:
> Hi, Randy,
>=20
> It seems a problem that controller didn't find the clock source.=20
> Also you can see the below message. Did you check the clock=20
> source?
>=20
>> [    1.125000] s3c-sdhci 12550000.sdhci: failed to get io clock
>=20
> Actually, need to prevent the "null pointer dereference" for clock=20
> in dw-mmc.c
>=20
> And If dw-mmc controller can be used, recommend to use it. dw-mmc=20
> can use DDR mode, but sdhci can't.
>=20
> Best Regards, Jaehoon Chung
>=20
> On 11/26/2013 10:47 AM, randy wrote: =E4=BA=8E 2013=E5=B9=B411=E6=9C=88=
26=E6=97=A5 08:41, Tomasz=20
> Figa =E5=86=99=E9=81=93:
>>>> On Sunday 24 of November 2013 22:18:46 Olof Johansson wrote:
>>>>> Hi,
>>>>>=20
>>>>> On Sun, Nov 24, 2013 at 4:07 AM, randy=20
>>>>> <lxr1234@hotmail.com> wrote:
>>>>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>>>>=20
>>>>>> After pull the merge of 3.13-rc1, the dw_mmc-exynos will=20
>>>>>> make the boot stock.In 3.13, it is just stocked udev in=20
>>>>>> 3.13 and makse udev timeout but kernel report the emmc=20
>>>>>> device is found.
>>>>>>=20
>>>>>> And in the=20
>>>>>> Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt=20
>>>>>> I saw that it is need to define which gpio ports that a=20
>>>>>> emmc slot use, but when I watched others dts, they use=20
>>>>>> pinctrl, which is correct? Here is the log and dts
>>>>>=20
>>>>> [..]
>>>>>=20
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3Dlog begin=20
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>>>> [..]
>>>>>> [    0.000000] CPU EXYNOS4412 (id 0xe4412011)
>>>>>=20
>>>>> [..]
>>>>>=20
>>>>>> [    1.095000] mmc0: no vmmc regulator found [ 1.130000]
>>>>>> mmc0: SDHCI controller on samsung-hsmmc [12530000.sdhci]
>>>>>> using ADMA [    1.130000] Synopsys Designware Multimedia
>>>>>> Card Interface Driver [ 1.130000] Unable to handle kernel
>>>>>> NULL pointer dereference at virtual address 0000002a [
>>>>>> 1.130000] pgd =3D c0004000 [    1.130000] [0000002a]
>>>>>> *pgd=3D00000000 [ 1.135000] Internal error: Oops: 5 [#1]
>>>>>> PREEMPT SMP ARM [ 1.140000] Modules linked in: [
>>>>>> 1.140000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=20
>>>>>> 3.13.0-rc1-00008-g584fa45-dirty #3 [ 1.150000] task:=20
>>>>>> ef0a4000 ti: ef0a8000 task.ti: ef0a8000 [ 1.155000] PC
>>>>>> is at clk_get_rate+0x18/0x5c [    1.160000] LR is at=20
>>>>>> clk_prepare_lock+0xc/0xd8 [    1.165000] pc :=20
>>>>>> [<c0319400>] lr : [<c0318864>]    psr: a0000113 [=20
>>>>>> 1.165000] sp : ef0a9e20 ip : ee94eb40  fp : 00000000 [=20
>>>>>> 1.175000] r10: c0571510  r9 : ef0a8000  r8 : ef227a10 [=20
>>>>>> 1.180000] r7 : c043544c  r6 : fffffffe  r5 : ee94ead0
>>>>>> r4 : fffffffe [    1.185000] r3 : ef0a4000  r2 :
>>>>>> 00000001 r1 : 000002b9  r0 : 00000001 [ 1.195000] Flags:
>>>>>> NzCv IRQs on  FIQs on  Mode SVC_32  ISA ARM Segment
>>>>>> kernel [ 1.200000] Control: 10c5387d  Table: 4000404a
>>>>>> DAC: 00000015 [    1.205000] Process swapper/0 (pid: 1,
>>>>>> stack limit =3D 0xef0a8240) [    1.210000] Stack:
>>>>>> (0xef0a9e20 to 0xef0aa000) [    1.215000] 9e20: c0308474
>>>>>> ee9ea610 ee94ead0 c0308488 c0308474 ee9ea610 00000000
>>>>>> c030592c [ 1.225000] 9e40: ef227a10 00001000 c043544c
>>>>>> c020a920 c0838b04 17d78400 ee9ea610 ef227a00 [
>>>>>> 1.235000] 9e60: ef227a10 c05d6b1c 00000000 c05d6b1c
>>>>>> c05890b0 ef0a8000 c0571510 c0269448 [ 1.240000] 9e80:
>>>>>> c0269430 ef227a10 c061291c c0268088 00000000 ef227a10
>>>>>> c05d6b1c ef227a44 [ 1.250000] 9ea0: 00000000 c026822c
>>>>>> 00000000 c05d6b1c c02681a0 c02668a8 ef005478 ef212740 [
>>>>>> 1.255000] 9ec0: c05d6b1c ef2c7900 c05cf438 c0267864
>>>>>> c0511e38 c05d6b1c 00000006 c05d6b1c [    1.265000] 9ee0:
>>>>>> 00000006 c059575c c05df580 c026884c 00000000 c05a2e14
>>>>>> 00000006 c00088dc [ 1.275000] 9f00: c0603f70 ef163e00
>>>>>> c040e334 60000113 c05b5000 a0000113 c05b5054 c05b5050 [
>>>>>> 1.280000] 9f20: c05df580 c054ad68 c0839c96 c04247b4
>>>>>> 00000093 c0035158 c05b5054 c05a2a20 [    1.290000] 9f40:
>>>>>> c050ae2c c054a438 00000006 00000006 00000000 c05a2e14
>>>>>> 00000006 c059575c [ 1.300000] 9f60: c05df580 00000093
>>>>>> c0595768 c0571510 00000000 c0571c48 00000006 00000006 [
>>>>>> 1.305000] 9f80: c0571510 c003df68 00000000 c0403544
>>>>>> 00000000 00000000 00000000 00000000 [    1.315000] 9fa0:
>>>>>> 00000000 c040354c 00000000 c000e738 00000000 00000000
>>>>>> 00000000 00000000 [ 1.320000] 9fc0: 00000000 00000000
>>>>>> 00000000 00000000 00000000 00000000 00000000 00000000 [
>>>>>> 1.330000] 9fe0: 00000000 00000000 00000000 00000000
>>>>>> 00000013 00000000 be73efa4 ffffbffd [    1.340000]
>>>>>> [<c0319400>] (clk_get_rate+0x18/0x5c) from [<c0308488>]=20
>>>>>> (dw_mci_exynos_setup_clock+0x14/0x2c) [    1.350000]=20
>>>>>> [<c0308488>] (dw_mci_exynos_setup_clock+0x14/0x2c) from=20
>>>>>> [<c030592c>] (dw_mci_probe+0x15c/0xca4) [    1.360000]=20
>>>>>> [<c030592c>] (dw_mci_probe+0x15c/0xca4) from [<c0269448>]
>>>>>> (platform_drv_probe+0x18/0x48) [ 1.365000] [<c0269448>]
>>>>>> (platform_drv_probe+0x18/0x48) from [<c0268088>]
>>>>>> (driver_probe_device+0x100/0x218) [ 1.375000]
>>>>>> [<c0268088>] (driver_probe_device+0x100/0x218) from
>>>>>> [<c026822c>] (__driver_attach+0x8c/0x90) [ 1.385000]
>>>>>> [<c026822c>] (__driver_attach+0x8c/0x90) from=20
>>>>>> [<c02668a8>] (bus_for_each_dev+0x54/0x88) [    1.395000]=20
>>>>>> [<c02668a8>] (bus_for_each_dev+0x54/0x88) from=20
>>>>>> [<c0267864>] (bus_add_driver+0xd4/0x1d0) [    1.405000]=20
>>>>>> [<c0267864>] (bus_add_driver+0xd4/0x1d0) from=20
>>>>>> [<c026884c>] (driver_register+0x78/0xf4) [    1.415000]=20
>>>>>> [<c026884c>] (driver_register+0x78/0xf4) from=20
>>>>>> [<c00088dc>] (do_one_initcall+0xec/0x148) [    1.420000]=20
>>>>>> [<c00088dc>] (do_one_initcall+0xec/0x148) from=20
>>>>>> [<c0571c48>] (kernel_init_freeable+0xfc/0x1c8) [=20
>>>>>> 1.430000] [<c0571c48>] (kernel_init_freeable+0xfc/0x1c8)=20
>>>>>> from [<c040354c>] (kernel_init+0x8/0x110) [    1.440000]=20
>>>>>> [<c040354c>] (kernel_init+0x8/0x110) from [<c000e738>]=20
>>>>>> (ret_from_fork+0x14/0x3c) [    1.450000] Code: ebfffd18=20
>>>>>> e3540000 01a05004 0a000008 (e594302c)
>>>>>=20
>>>>>=20
>>>>> Looks like a clock issue on 4412? I only have 5250 that I=20
>>>>> boot test on, no EXYNOS4 coverage at all (I had an
>>>>> Odroid-X but it wasn't useful due to the very old u-boot it
>>>>> came with so I gave it away).
>>>>>=20
>>>>> Tomasz, is this something you can reproduce on 4210/4412?
>>>>=20
>>>> Nope. All of our boards (exynos4210-trats,
>>>> exynos4412-trats2) are configured to use sdhci-s3c for all
>>>> MMC slots[1], as at the time they got submitted to mainline,
>>>> this driver was considered more reliable than dw-mmc. Not
>>>> sure about today, though.
>>>>=20
>>>> [1] On Exynos4 there is one dw-mmc block and four sdhci-s3c=20
>>>> blocks, while there are just four physical busses. Using pin
>>>>  control you can configure any of the four sets of pins to=20
>>>> work either using its dedicated sdhci-s3c or the only one=20
>>>> dw-mmc.
>>>>=20
>>>> Best regards, Tomasz
>>>>=20
>>>> -- To unsubscribe from this list: send the line "unsubscribe
>>>>  linux-samsung-soc" in the body of a message to=20
>>>> majordomo@vger.kernel.org More majordomo info at=20
>>>> http://vger.kernel.org/majordomo-info.html
>>>>=20
>>>>=20
> Well I don't think it can work this time, maybe my dts is wrong.
> At this time neither emmc nor usb can work.=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3Dlog begin=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  [    1.035000] s3c-rtc 10070000.rtc: rtc disabled, re-enabling [=20
> 1.040000] s3c-rtc 10070000.rtc: rtc core: registered s3c as rtc0 [=20
> 1.050000] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30)=20
> initialised: dm-devel@redhat.com [    1.055000] sdhci: Secure=20
> Digital Host Controller Interface driver [    1.060000] sdhci:=20
> Copyright(c) Pierre Ossman [    1.065000] s3c-sdhci
> 12530000.sdhci: clock source 2: mmc_busclk.2 (100000000 Hz) [
> 1.075000] s3c-sdhci 12530000.sdhci: dummy supplies not allowed [
> 1.080000] mmc0: no vqmmc regulator found [    1.085000] s3c-sdhci=20
> 12530000.sdhci: dummy supplies not allowed [    1.090000] mmc0: no=20
> vmmc regulator found [    1.125000] mmc0: SDHCI controller on=20
> samsung-hsmmc [12530000.sdhci] using ADMA [    1.125000] s3c-sdhci=20
> 12550000.sdhci: failed to get io clock [    1.125000] s3c-sdhci:=20
> probe of 12550000.sdhci failed with error -2 [    1.125000]=20
> Synopsys Designware Multimedia Card Interface Driver [
> 1.130000] usbcore: registered new interface driver usbhid [
> 1.130000] usbhid: USB HID core driver [    1.135000] TCP: cubic
> registered [ 1.145000] NET: Registered protocol family 10 [
> 1.145000] NET: Registered protocol family 17 [    1.145000] NET:
> Registered protocol family 15 [    1.150000] Key type dns_resolver
> registered [    1.155000] Registering SWP/SWPB emulation handler [=20
> 1.160000] unable to find transceiver of type USB2 PHY [ 1.165000]
> exynos-ehci 12580000.ehci: no platform data or transceiver defined
> [    1.175000] platform 12580000.ehci: Driver exynos-ehci requests
> probe deferral [    1.175000] mmc0: new high speed SDHC card at
> address aaaa [    1.185000] isa bounce pool size: 16 pages [
> 1.190000] mmcblk0: mmc0:aaaa SU08G 7.40 GiB [ 1.195000] s3c-rtc
> 10070000.rtc: setting system clock to 2013-01-01 12:06:09 UTC
> (1357041969) [    1.205000] exynos_cpufreq_init: failed to get
> resource vdd_arm [    1.205000]  mmcblk0: p1 p2 p3 p4 [
> 1.215000] unable to find transceiver of type USB2 PHY [ 1.215000]
> exynos-ehci 12580000.ehci: no platform data or transceiver defined
> [    1.225000] platform 12580000.ehci: Driver exynos-ehci requests
> probe deferral
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3Dlog end=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
dts=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>=20
/*
> * Hardkernel's Exynos4412 based tiny4412 1306 board device tree=20
> source * * Copyright (c) 2013 Tomoya Gitsufuki=20
> <ayaka@mail.soulik.info> * * Device tree source file for
> Friendyarm tiny4412 1306 board which is based on * Samsung's
> Exynos4412 SoC. * * This program is free software; you can
> redistribute it and/or modify * it under the terms of the GNU
> General Public License version 2 as * published by the Free
> Software Foundation. */
>=20
> /dts-v1/; #include "exynos4412.dtsi"
>=20
> / { model =3D "Friendly Arm Tiny4412 1306 board based on Exynos4412";
> compatible =3D "friendlyarm,tiny4412-1306", "samsung,exynos4412";
>=20
> memory { reg =3D <0x40000000 0x40000000>; };
>=20
> chosen { bootargs =3D"root=3D/dev/mmcblk0p1 rootfstype=3Dext4 rw=20
> console=3DttySAC0,115200 init=3D/sbin/init"; };
>=20
> leds { compatible =3D "gpio-leds"; led1 { label =3D "led1:heart";
> gpios =3D <&gpm4 0 1>; default-state =3D "on"; linux,default-trigger =
=3D=20
> "heartbeat"; }; led2 { label =3D "led2:mmc0"; gpios =3D <&gpm4 1 1>;=20
> default-state =3D "on"; linux,default-trigger =3D "mmc0"; };
>=20
> };
>=20
> regulators { compatible =3D "simple-bus"; #address-cells =3D <1>;
>=20
> vemmc_reg: regulator-0 { compatible =3D "regulator-fixed";=20
> regulator-name =3D "VMEM_VDD_2.8V"; regulator-min-microvolt =3D=20
> <2800000>; regulator-max-microvolt =3D <2800000>; gpio =3D <&gpk0 2 0=
>;
> enable-active-high; };
>=20
> };
>=20
> /* mshc@12550000 { #address-cells =3D <1>; #size-cells =3D <0>;=20
> pinctrl-0 =3D <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>; pinctrl-names=20
> =3D "default"; status =3D "okay";
>=20
> vmmc-supply =3D <&vemmc_reg>; clocks =3D <&clock 301>, <&clock 149>;=20
> clocks-name =3D "dwmci", "sclk_dwmci"; clock-frequency =3D=20
> <400000000>;
>=20
> num-slots =3D <1>; supports-highspeed; broken-cd; fifo-depth =3D=20
> <0x80>; card-detect-delay =3D <200>; samsung,dw-mshc-sdr-timing =3D <=
2=20
> 3>; samsung,dw-mshc-ddr-timing =3D <1 2>;
>=20
> slot@0 { reg =3D <0>; bus-width =3D <8>;  }; }; */
>=20
> rtc@10070000 { status =3D "okay"; };
>=20
> sdhci@12530000 { bus-width =3D <4>; pinctrl-0 =3D <&sd2_clk &sd2_cmd=20
> &sd2_bus4 &sd2_cd>; pinctrl-names =3D "default"; status =3D "okay"; }=
;
>=20
> sdhci@1254000 { bus-width =3D <4>; pinctrl-0 =3D <&sd3_clk &sd3_cmd=20
> &sd3_bus4 &sd3_cd>; pinctrl-names =3D "default"; status =3D "okay"; }=
;
>=20
> sdhci@12550000 { compatible =3D "samsung,exynos4210-sdhci";=20
> #address-cells =3D <1>; #size-cells =3D <0>; reg =3D <0x12550000 0x10=
00>;
> interrupts =3D <0 77 0>; non-removable; pinctrl-0 =3D <&sd4_clk
> &sd4_cmd &sd4_bus4 &sd4_bus8>; pinctrl-names =3D "default"; status =3D
> "okay";
>=20
> bus-width =3D <8>; vmmc-supply =3D <&vemmc_reg>; clocks =3D <&clock
> 301>, <&clock 149>; clocks-name =3D "dwmci", "sclk_dwmci";
> clock-frequency =3D <400000000>;
>=20
> };
>=20
> /* the usb phy of hsic0, hsic1 and otg are in the same place */=20
> usb_phy: otg@125B0000 { #address-cells =3D <1>; #size-cells =3D <1>;=20
> compatible =3D "samsung,exynos4210-usbphy"; reg =3D <0x125B0000 0x100=
>;
> ranges;
>=20
> clocks =3D <&clock 2>, <&clock 305>; clock-names =3D "xusbxti", "otg"=
;
>  usbphy-sys { /* USB device and host PHY_CONTROL registers */ reg
> =3D <0x10020704 0x8>; }; };
>=20
> ehci@12580000 { usb-phy =3D <&usb_phy>; status =3D "okay"; };=20
> ohci@12590000 { status =3D "okay"; };
>=20
>=20
> codec@13400000 { samsung,mfc-r =3D <0x43000000 0x800000>;=20
> samsung,mfc-l =3D <0x51000000 0x800000>; status =3D "okay"; };
>=20
> serial@13800000 { status =3D "okay"; };
>=20
> serial@13810000 { status =3D "okay"; };
>=20
> serial@13820000 { status =3D "okay"; };
>=20
> serial@13830000 { status =3D "okay"; };
>=20
> fixed-rate-clocks { xxti { compatible =3D "samsung,clock-xxti";=20
> clock-frequency =3D <0>; };
>=20
> xusbxti { compatible =3D "samsung,clock-xusbxti"; clock-frequency =3D=
=20
> <24000000>; }; };
>=20
> i2c@13860000 { status =3D "okay"; samsung,i2c-sda-delay =3D <100>;=20
> samsung,i2c-max-bus-freq =3D <200000>;
>=20
> wm8960@10 { compatible =3D "wlf,wm8960"; reg =3D <0x10>; }; }; };
>>=20
>=20
> -- To unsubscribe from this list: send the line "unsubscribe=20
> linux-samsung-soc" in the body of a message to=20
> majordomo@vger.kernel.org More majordomo info at=20
> http://vger.kernel.org/majordomo-info.html
>=20
>=20

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSlDj0AAoJEPb4VsMIzTziji8H/jgZfK7ZArb6kK74jb/P8vOv
OIsOw301smAp83LafMd1BWzInkhZnMp+4g/uTawjWDGPw3rJOiu8Qcyr4VmI1r4h
oXfcVS+p27qAVsMN+11e9fFKu2DsDwxb/aidau6OAAi5+U3h0rHTptRzIzbqbnxp
5lOV1eldrnXSRIsUTYmaPVLUcVRAD0p8zcPmOH79XghrcHdTisYA/yjFgu2mQJgE
QgaDaEgwoFwXrTkg/w+fHHZFdOUHhursSzIGR8HUKirK2Sg2KaPRU+MXPf8nVY8B
1MEX7pnI+7feOK20eNEc9H8GmCph8MnjCsY+9DxwxqDeBkP31BhTVGIxK+ajmzw=3D
=3DaRRx
-----END PGP SIGNATURE-----

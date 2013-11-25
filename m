From: randy <lxr1234@hotmail.com>
Subject: Re: linux 3.13-rc1 make dw_mmc-exynos more worse
Date: Mon, 25 Nov 2013 20:42:57 +0800
Message-ID: <BLU0-SMTP3967D2CDF273E808F5785EEADED0@phx.gbl>
References: <BLU0-SMTP154F63148320A2FFA456BFADE20@phx.gbl> <CAOesGMim3niC75g3VK1Ue=98NySmUVHyRAOvd-+RWwZ3gHVx2w@mail.gmail.com> <002101cee9b9$01de23c0$059a6b40$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [65.55.111.143] ([65.55.111.143]:13824 "EHLO
	blu0-omc4-s4.blu0.hotmail.com" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753660Ab3KYMnN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 07:43:13 -0500
In-Reply-To: <002101cee9b9$01de23c0$059a6b40$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Seungwon Jeon <tgih.jun@samsung.com>, olof@lixom.net, devicetree@vger.kernel.org, jh80.chung@samsung.com, kgene.kim@samsung.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8825=E6=97=A5 16:33, Seungwon Jeon =E5=86=
=99=E9=81=93:
> On Mon, November 25, 2013, Olof Johansson wrote:
>> Hi,
>>=20
>> On Sun, Nov 24, 2013 at 4:07 AM, randy <lxr1234@hotmail.com>=20
>> wrote:
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>=20
>>> After pull the merge of 3.13-rc1, the dw_mmc-exynos will make=20
>>> the boot stock.In 3.13, it is just stocked udev in 3.13 and=20
>>> makse udev timeout but kernel report the emmc device is found.
>>>=20
>>> And in the=20
>>> Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt I saw=20
>>> that it is need to define which gpio ports that a emmc slot=20
>>> use, but when I watched others dts, they use pinctrl, which is=20
>>> correct? Here is the log and dts
>>=20
>> [..]
>>=20
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
log begin =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> [..]
>>> [    0.000000] CPU EXYNOS4412 (id 0xe4412011)
>>=20
>> [..]
>>=20
>>> [    1.095000] mmc0: no vmmc regulator found [    1.130000]=20
>>> mmc0: SDHCI controller on samsung-hsmmc [12530000.sdhci] using=20
>>> ADMA [    1.130000] Synopsys Designware Multimedia Card=20
>>> Interface Driver [    1.130000] Unable to handle kernel NULL=20
>>> pointer dereference at virtual address 0000002a [    1.130000]=20
>>> pgd =3D c0004000 [    1.130000] [0000002a] *pgd=3D00000000 [=20
>>> 1.135000] Internal error: Oops: 5 [#1] PREEMPT SMP ARM [=20
>>> 1.140000] Modules linked in: [    1.140000] CPU: 0 PID: 1
>>> Comm: swapper/0 Not tainted 3.13.0-rc1-00008-g584fa45-dirty #3
>>> [ 1.150000] task: ef0a4000 ti: ef0a8000 task.ti: ef0a8000 [=20
>>> 1.155000] PC is at clk_get_rate+0x18/0x5c [    1.160000] LR is=20
>>> at clk_prepare_lock+0xc/0xd8 [    1.165000] pc : [<c0319400>]=20
>>> lr : [<c0318864>]    psr: a0000113 [    1.165000] sp :
>>> ef0a9e20 ip : ee94eb40  fp : 00000000 [    1.175000] r10:
>>> c0571510  r9 : ef0a8000  r8 : ef227a10 [    1.180000] r7 :
>>> c043544c  r6 : fffffffe  r5 : ee94ead0  r4 : fffffffe [
>>> 1.185000] r3 : ef0a4000  r2 : 00000001  r1 : 000002b9  r0 :
>>> 00000001 [ 1.195000] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32
>>> ISA ARM Segment kernel [    1.200000] Control: 10c5387d
>>> Table: 4000404a  DAC: 00000015 [    1.205000] Process swapper/0
>>> (pid: 1, stack limit =3D 0xef0a8240) [    1.210000] Stack:
>>> (0xef0a9e20 to 0xef0aa000) [    1.215000] 9e20: c0308474
>>> ee9ea610 ee94ead0 c0308488 c0308474 ee9ea610 00000000 c030592c
>>> [    1.225000] 9e40: ef227a10 00001000 c043544c c020a920
>>> c0838b04 17d78400 ee9ea610 ef227a00 [    1.235000] 9e60:
>>> ef227a10 c05d6b1c 00000000 c05d6b1c c05890b0 ef0a8000 c0571510
>>> c0269448 [ 1.240000] 9e80: c0269430 ef227a10 c061291c c0268088
>>> 00000000 ef227a10 c05d6b1c ef227a44 [    1.250000] 9ea0:
>>> 00000000 c026822c 00000000 c05d6b1c c02681a0 c02668a8 ef005478
>>> ef212740 [    1.255000] 9ec0: c05d6b1c ef2c7900 c05cf438
>>> c0267864 c0511e38 c05d6b1c 00000006 c05d6b1c [    1.265000]
>>> 9ee0: 00000006 c059575c c05df580 c026884c 00000000 c05a2e14
>>> 00000006 c00088dc [    1.275000] 9f00: c0603f70 ef163e00
>>> c040e334 60000113 c05b5000 a0000113 c05b5054 c05b5050 [
>>> 1.280000] 9f20: c05df580 c054ad68 c0839c96 c04247b4 00000093
>>> c0035158 c05b5054 c05a2a20 [    1.290000] 9f40: c050ae2c
>>> c054a438 00000006 00000006 00000000 c05a2e14 00000006 c059575c
>>> [ 1.300000] 9f60: c05df580 00000093 c0595768 c0571510 00000000
>>>  c0571c48 00000006 00000006 [    1.305000] 9f80: c0571510=20
>>> c003df68 00000000 c0403544 00000000 00000000 00000000 00000000
>>>  [    1.315000] 9fa0: 00000000 c040354c 00000000 c000e738=20
>>> 00000000 00000000 00000000 00000000 [    1.320000] 9fc0:=20
>>> 00000000 00000000 00000000 00000000 00000000 00000000 00000000=20
>>> 00000000 [    1.330000] 9fe0: 00000000 00000000 00000000=20
>>> 00000000 00000013 00000000 be73efa4 ffffbffd [    1.340000]=20
>>> [<c0319400>] (clk_get_rate+0x18/0x5c) from [<c0308488>]=20
>>> (dw_mci_exynos_setup_clock+0x14/0x2c) [    1.350000]=20
>>> [<c0308488>] (dw_mci_exynos_setup_clock+0x14/0x2c) from=20
>>> [<c030592c>] (dw_mci_probe+0x15c/0xca4) [    1.360000]=20
>>> [<c030592c>] (dw_mci_probe+0x15c/0xca4) from [<c0269448>]=20
>>> (platform_drv_probe+0x18/0x48) [    1.365000] [<c0269448>]=20
>>> (platform_drv_probe+0x18/0x48) from [<c0268088>]=20
>>> (driver_probe_device+0x100/0x218) [    1.375000] [<c0268088>]=20
>>> (driver_probe_device+0x100/0x218) from [<c026822c>]=20
>>> (__driver_attach+0x8c/0x90) [    1.385000] [<c026822c>]=20
>>> (__driver_attach+0x8c/0x90) from [<c02668a8>]=20
>>> (bus_for_each_dev+0x54/0x88) [    1.395000] [<c02668a8>]=20
>>> (bus_for_each_dev+0x54/0x88) from [<c0267864>]=20
>>> (bus_add_driver+0xd4/0x1d0) [    1.405000] [<c0267864>]=20
>>> (bus_add_driver+0xd4/0x1d0) from [<c026884c>]=20
>>> (driver_register+0x78/0xf4) [    1.415000] [<c026884c>]=20
>>> (driver_register+0x78/0xf4) from [<c00088dc>]=20
>>> (do_one_initcall+0xec/0x148) [    1.420000] [<c00088dc>]=20
>>> (do_one_initcall+0xec/0x148) from [<c0571c48>]=20
>>> (kernel_init_freeable+0xfc/0x1c8) [    1.430000] [<c0571c48>]=20
>>> (kernel_init_freeable+0xfc/0x1c8) from [<c040354c>]=20
>>> (kernel_init+0x8/0x110) [    1.440000] [<c040354c>]=20
>>> (kernel_init+0x8/0x110) from [<c000e738>]=20
>>> (ret_from_fork+0x14/0x3c) [    1.450000] Code: ebfffd18=20
>>> e3540000 01a05004 0a000008 (e594302c)
>>=20
>>=20
>> Looks like a clock issue on 4412? I only have 5250 that I boot=20
>> test on, no EXYNOS4 coverage at all (I had an Odroid-X but it=20
>> wasn't useful due to the very old u-boot it came with so I gave=20
>> it away).
>>=20
>> Tomasz, is this something you can reproduce on 4210/4412?
>=20
> Thank you for detect. Clock adaptation has been added for upper=20
> host including EXYNOS 5250 since c6d9d(mmc: dw_mmc: exynos: adjust=20
> the clock rate with speed mode) It should have been considered for=20
> all EXYNOS. I could send a fix.
>=20
> Thanks, Seungwon
>=20
> -- To unsubscribe from this list: send the line "unsubscribe=20
> linux-samsung-soc" in the body of a message to=20
> majordomo@vger.kernel.org More majordomo info at=20
> http://vger.kernel.org/majordomo-info.html
>=20
>=20
yes, may c6d9deda64d426a25aafeb179962c9cf3c834e2f cause problem.
Actually, my u-boot is old too(modified from samsung BSP, it is
2010.12), I use CONFIG_ARM_APPENDED_DTB to use dts.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSk0XRAAoJEPb4VsMIzTzitvAH/0t0JuVTWOOMkRCD3Zph9wMP
HryLvSDgsOUW0nPVsIwyrIAtjiSoAtQgKN9wiMTvrHM2yj3E6Rk0SNT04zdr1kRm
cuVh+MWrWYXWNDVKpnHl/SnzSi/RfFfXrlT69VcVocKH4boZOqqwwHtHiof8kPag
JFwFSLIOoeTRKluGEyAIBsNkz/Zgmbng5boScIe95y58iYw+hBZ4NQQLAo+nyPfa
JPaicc2umjlI1r7Gbu6vabjVjaqyNEd/EibyxqWeZgCGXnFRY230BV09ULn5uIko
n7xiQk6s5wXBWxY4tcFJF8jj8gdbXd1Aad++0v1Jv2cnZp3xGtUJmgz+dNLv4ng=3D
=3D0pZ1
-----END PGP SIGNATURE-----

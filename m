From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: kgene's for-next branch broken, and boot regressions
Date: Mon, 28 Jul 2014 09:30:03 +0900
Message-ID: <009b01cfa9fb$157617a0$406246e0$@samsung.com>
References: <53D46D2F.3000202@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15171 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795AbaG1AaK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 20:30:10 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9E00EOVC286540@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 09:30:08 +0900 (KST)
In-reply-to: <53D46D2F.3000202@suse.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Andreas_F=E4rber'?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Kevin Hilman' <khilman@linaro.org>

Andreas F=E4rber wrote:
>=20
> Hi Kukjin,
>=20
Hi,

> Are you aware that `make dtbs` fails on your for-next branch (4533046=
)?
>=20
>   DTC     arch/arm/boot/dts/exynos5420-peach-pit.dtb
> arch/arm/boot/dts/exynos5420-peach-pit.dts:447:33: fatal error:
> cros-ec-keyboard.dtsi: No such file or directory
>  #include "cros-ec-keyboard.dtsi"
>                                  ^
> compilation terminated.
> scripts/Makefile.lib:273: recipe for target
> 'arch/arm/boot/dts/exynos5420-peach-pit.dtb' failed
> make[1]: *** [arch/arm/boot/dts/exynos5420-peach-pit.dtb] Error 1
> arch/arm/Makefile:314: recipe for target 'dtbs' failed
> make: *** [dtbs] Error 2
>=20
Oops, I always use my script to check kernel build like follow...

$ mt
building exynos_defconfig done
building s3c2410_defconfig done
building s3c6400_defconfig done
building s5pv210_defconfig done

but seems it couldn't detect the breakage from dtb :(

> On https://patchwork.kernel.org/patch/4297431/ Doug had pointed out t=
hat
> a topic branch merge would be needed for cros-ec-keyboard.dtsi (which=
 I
> also pointed out for my spring series). Can you please fix this throu=
gh
> some merge? Your affected branch is v3.17-next/dt-samsung with "ARM:
> dts: Add cros_ec to exynos5420-peach-pit and exynos5800-peach-pi".
> There's a topic branch in the Tegra tree:
> http://git.kernel.org/cgit/linux/kernel/git/tegra/linux.git/log/?h=3D=
for-3.17/dt-cros-ec-kbd
> and it's been merged into arm-soc recently.
> https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/tree/arc=
h/arm/boot/dts?h=3Dfor-next
>=20
Sure I'll fix it soon. Thanks for your report.

- Kukjin

>=20
> Also, I've run into some boot regressions:
>=20
> On the Arndale Octa (5420) I see an asynchronous external abort on
> serial console when systemd gets started.
>=20
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg3468=
0.html
>=20
> On the Spring Chromebook (5250) the screen goes dark after a few line=
s,
> and USB is not initialized. Thus unclear to me why.
>=20
> On the ODROID-XU (with local patches based on smdk5410) I get the
> following with earlyprintk:
>=20
> Uncompressing Linux... done, booting the kernel.
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 3.16.0-rc6+ (andreas@droide) (gcc versio=
n
> 4.8.2 20140404 [gcc-4_8-branch revision 209122] (SUSE Linux) ) #2 SMP
> PREEMPT Sun Jul 27 02:31:31 CEST 2014
> [    0.000000] CPU: ARMv7 Processor [412fc0f3] revision 3 (ARMv7),
> cr=3D30c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruct=
ion
> cache
> [    0.000000] Machine model: ODROID-XU based on EXYNOS5410
> [    0.000000] bootconsole [earlycon0] enabled
> [    0.000000] Forcing write-allocate cache policy for SMP
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] Running under secure firmware.
> [    0.000000] PERCPU: Embedded 7 pages/cpu @ee7b3000 s7872 r8192 d12=
608
> u32768
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
> Total pages: 522256
> [    0.000000] Kernel command line: console=3DttySAC2,115200n8 earlyp=
rintk
> root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rw rootwait
> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524=
288
> bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 26214=
4
> bytes)
> [    0.000000] Memory: 2070984K/2095104K available (4364K kernel code=
,
> 271K rwdata, 1420K rodata, 271K init, 283K bss, 24120K reserved,
> 1316864K highmem)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
> [    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
> [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> [    0.000000]       .text : 0xc0008000 - 0xc05ae384   (5785 kB)
> [    0.000000]       .init : 0xc05af000 - 0xc05f2ec0   ( 272 kB)
> [    0.000000]       .data : 0xc05f4000 - 0xc0637d80   ( 272 kB)
> [    0.000000]        .bss : 0xc0637d8c - 0xc067eb00   ( 284 kB)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
4, Nodes=3D1
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000]  RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D=
4.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_c=
pu_ids=3D4
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] GIC physical location is 0x10481000
> [    0.000000] Kernel panic - not syncing: failed to find exynos pmu
> register
> [    0.000000]
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.16.0-rc6+ =
#2
> [    0.000000] [<c0022214>] (unwind_backtrace) from [<c001f3b4>]
> (show_stack+0x10/0x14)
> [    0.000000] [<c001f3b4>] (show_stack) from [<c04204d4>]
> (dump_stack+0x80/0xc0)
> [    0.000000] [<c04204d4>] (dump_stack) from [<c041d9a4>]
> (panic+0xa4/0x200)
> [    0.000000] [<c041d9a4>] (panic) from [<c05b745c>]
> (exynos_reserve+0x0/0x4c)
> [    0.000000] [<c05b745c>] (exynos_reserve) from [<00000000>] (  (nu=
ll))
> [    0.000000] ---[ end Kernel panic - not syncing: failed to find
> exynos pmu register
> [    0.000000]
>=20
> Reverting "ARM: EXYNOS: Refactored code for using PMU address via DT"
> and "ARM: EXYNOS: Add support for mapping PMU base address via DT" fi=
xed
> the latter.
>=20
> Anyone know what might cause the others and how to fix?
>=20
Hmm...I didn't look at that yet sorry...

- Kukjin

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: kgene's for-next branch broken, and boot regressions
Date: Mon, 28 Jul 2014 09:40:00 +0900
Message-ID: <00ca01cfa9fc$7692d220$63b87660$@samsung.com>
References: <53D46D2F.3000202@suse.de> <53D494DB.8030600@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47369 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751250AbaG1AkD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 20:40:03 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9E00GECCIO1D60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jul 2014 09:40:00 +0900 (KST)
In-reply-to: <53D494DB.8030600@suse.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Andreas_F=E4rber'?= <afaerber@suse.de>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Kevin Hilman' <khilman@linaro.org>

Andreas F=E4rber wrote:
>=20
> Am 27.07.2014 05:08, schrieb Andreas F=E4rber:
> > On the ODROID-XU (with local patches based on smdk5410) I get the
> > following with earlyprintk:
> >
> > Uncompressing Linux... done, booting the kernel.
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] Linux version 3.16.0-rc6+ (andreas@droide) (gcc vers=
ion
> > 4.8.2 20140404 [gcc-4_8-branch revision 209122] (SUSE Linux) ) #2 S=
MP
> > PREEMPT Sun Jul 27 02:31:31 CEST 2014
> > [    0.000000] CPU: ARMv7 Processor [412fc0f3] revision 3 (ARMv7),
> > cr=3D30c5387d
> > [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instru=
ction
> > cache
> > [    0.000000] Machine model: ODROID-XU based on EXYNOS5410
> > [    0.000000] bootconsole [earlycon0] enabled
> > [    0.000000] Forcing write-allocate cache policy for SMP
> > [    0.000000] Memory policy: Data cache writealloc
> > [    0.000000] Running under secure firmware.
> > [    0.000000] PERCPU: Embedded 7 pages/cpu @ee7b3000 s7872 r8192 d=
12608
> > u32768
> > [    0.000000] Built 1 zonelists in Zone order, mobility grouping o=
n.
> > Total pages: 522256
> > [    0.000000] Kernel command line: console=3DttySAC2,115200n8 earl=
yprintk
> > root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rw rootwait
> > [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> > [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 5=
24288
> > bytes)
> > [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262=
144
> > bytes)
> > [    0.000000] Memory: 2070984K/2095104K available (4364K kernel co=
de,
> > 271K rwdata, 1420K rodata, 271K init, 283K bss, 24120K reserved,
> > 1316864K highmem)
> > [    0.000000] Virtual kernel memory layout:
> > [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> > [    0.000000]     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
> > [    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
> > [    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
> > [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> > [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> > [    0.000000]       .text : 0xc0008000 - 0xc05ae384   (5785 kB)
> > [    0.000000]       .init : 0xc05af000 - 0xc05f2ec0   ( 272 kB)
> > [    0.000000]       .data : 0xc05f4000 - 0xc0637d80   ( 272 kB)
> > [    0.000000]        .bss : 0xc0637d8c - 0xc067eb00   ( 284 kB)
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D4, Nodes=3D1
> > [    0.000000] Preemptible hierarchical RCU implementation.
> > [    0.000000]  RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=
=3D4.
> > [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D4
> > [    0.000000] NR_IRQS:16 nr_irqs:16 16
> > [    0.000000] GIC physical location is 0x10481000
> > [    0.000000] Kernel panic - not syncing: failed to find exynos pm=
u
> > register
> > [    0.000000]
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.16.0-rc6=
+ #2
> > [    0.000000] [<c0022214>] (unwind_backtrace) from [<c001f3b4>]
> > (show_stack+0x10/0x14)
> > [    0.000000] [<c001f3b4>] (show_stack) from [<c04204d4>]
> > (dump_stack+0x80/0xc0)
> > [    0.000000] [<c04204d4>] (dump_stack) from [<c041d9a4>]
> > (panic+0xa4/0x200)
> > [    0.000000] [<c041d9a4>] (panic) from [<c05b745c>]
> > (exynos_reserve+0x0/0x4c)
> > [    0.000000] [<c05b745c>] (exynos_reserve) from [<00000000>] (  (=
null))
> > [    0.000000] ---[ end Kernel panic - not syncing: failed to find
> > exynos pmu register
> > [    0.000000]
> >
> > Reverting "ARM: EXYNOS: Refactored code for using PMU address via D=
T"
> > and "ARM: EXYNOS: Add support for mapping PMU base address via DT" =
fixed
> > the latter.
>=20
> Adding a "samsung,exynos5410-pmu" system-controller node like on 5420
> fixes this as well. Patchset being prepared.
>=20
Thanks again ;)

- Kukjin

From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: kgene's for-next branch broken, and boot regressions
Date: Sun, 27 Jul 2014 07:57:47 +0200
Message-ID: <53D494DB.8030600@suse.de>
References: <53D46D2F.3000202@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33718 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750856AbaG0F5w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 01:57:52 -0400
In-Reply-To: <53D46D2F.3000202@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>

Am 27.07.2014 05:08, schrieb Andreas F=E4rber:
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

Adding a "samsung,exynos5410-pmu" system-controller node like on 5420
fixes this as well. Patchset being prepared.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg

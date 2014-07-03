From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip
 support
Date: Thu, 03 Jul 2014 07:19:18 +0200
Message-ID: <53B4E7D6.6000204@suse.de>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54535 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750817AbaGCFTY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 01:19:24 -0400
In-Reply-To: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Rahul Sharma <rahul.sharma@samsung.com>, Doug Anderson <dianders@chromium.org>

Hi Ajay,

Thanks a lot for your work on this.

Am 11.06.2014 20:26, schrieb Ajay Kumar:
> This series is based on exynos-drm-next branch of Inki Dae's tree at:
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>=20
> I have tested this after adding few DT changes for exynos5250-snow,
> exynos5420-peach-pit and exynos5800-peach-pi boards.

Unfortunately this series per se does not yet fix my display issues on
the Spring Chromebook. Can you share what dt changes you made for Snow?

Before, if the dp-controller dt node was present, I would get a dark
screen immediately and I could ssh into the system shortly after.
I worked around that by commenting the node out, which would allow me t=
o
graphically boot pretty much instantly.

With these 10 patches applied on top of my dt on top of kgene's tree,
the last U-Boot screen stays visible for ~50 seconds, then the screen
goes blank, and I can ssh in some time later.
If I comment out the dp-controller node again, it takes long for the
kernel boot to graphically proceed but works okay then.
In both cases there's a gap of ~2900 seconds visible in dmesg.

Is presence of a framebuffer dt node or U-Boot not disabling FIMD
interfering here, i.e. do I need to replace nv U-Boot? Or do I need to
cherry-pick any preparatory patches from exynos-drm-next?

I'm building with LPAE, but the only two warnings in drm code I see are
about a NULL cast to dma_addr_t and a %x in debug code, which I conside=
r
non-critical (but would be nice if Inki could silence them).

Regards,
Andreas

https://github.com/afaerber/linux/commits/spring-next
https://github.com/afaerber/u-boot/commits/spring

w/ dp-controller:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.16.0-rc2+ (andreas@chrome11.site) (gcc
version 4.
8.2 20140404 [gcc-4_8-branch revision 209122] (SUSE Linux) ) #8 SMP
PREEMPT Thu
Jul 3 05:56:13 CEST 2014
[    0.000000] CPU: ARMv7 Processor [410fc0f4] revision 4 (ARMv7),
cr=3D30c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instructio=
n
cache
[    0.000000] Machine model: Google Spring
[    0.000000] Forcing write-allocate cache policy for SMP
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] On node 0 totalpages: 523264
[    0.000000] free_area_init_node: node 0, pgdat c0659dc0, node_mem_ma=
p
ee7fc00
0
[    0.000000]   Normal zone: 1520 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 194560 pages, LIFO batch:31
[    0.000000]   HighMem zone: 2568 pages used for memmap
[    0.000000]   HighMem zone: 328704 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 7 pages/cpu @ee7bb000 s7104 r8192 d1337=
6
u32768
[    0.000000] pcpu-alloc: s7104 r8192 d13376 u32768 alloc=3D8*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pag
es: 521744
[    0.000000] Kernel command line: console=3Dtty1 root=3D/dev/sda3
rootfstype=3Dext4
rw rootwait clk_ignore_unused
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes)
[    0.000000] Memory: 2068780K/2093056K available (4454K kernel code,
258K rwdata, 1480K rodata, 278K init, 281K bss, 24276K reserved,
1314816K highmem)
[    0.000000] Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
    vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
    lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
    pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
    modules : 0xbf000000 - 0xbfe00000   (  14 MB)
      .text : 0xc0008000 - 0xc05d3dd4   (5936 kB)
      .init : 0xc05d4000 - 0xc0619bc0   ( 279 kB)
      .data : 0xc061a000 - 0xc065a9e0   ( 259 kB)
       .bss : 0xc065a9ec - 0xc06a1080   ( 282 kB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
2, Nodes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2=
=2E
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu=
_ids=3D2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] L2C: failed to init: -19
[    0.000000] Exynos5250: clock setup completed, armclk=3D1700000000
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (virt).
[    0.000002] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps
every 2863311519744ns
[    0.000007] Switching to timer-based delay loop
[ 2869.295699] sched_clock: 64 bits at 24MHz, resolution 41ns, wraps
every 2863311519744ns
[ 2869.295841] Console: colour dummy device 80x30
[ 2869.296042] console [tty1] enabled
[ 2869.296056] Calibrating delay loop (skipped), value calculated using
timer frequency.. 48.00 BogoMIPS (lpj=3D120000)
[ 2869.296073] pid_max: default: 32768 minimum: 301
[ 2869.296160] Mount-cache hash table entries: 2048 (order: 1, 8192 byt=
es)
[ 2869.296171] Mountpoint-cache hash table entries: 2048 (order: 1, 819=
2
bytes)
[ 2869.296520] CPU: Testing write buffer coherency: ok
[ 2869.296649] CPU0: update cpu_capacity 1024
[ 2869.296660] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[ 2869.296757] Setting up static identity map for 0x4043c0d8 - 0x4043c1=
30
[ 2920.607940] CPU1: Booted secondary processor
[ 2920.607972] CPU1: update cpu_capacity 1024
[ 2920.607976] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[ 2920.608020] Brought up 2 CPUs
[...]

w/o dp-controller:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.16.0-rc2+ (andreas@chrome11.site) (gcc
version 4.8.2 20140404 [gcc-4_8-branch revision 209122] (SUSE Linux) )
#8 SMP PREEMPT Thu Jul 3 05:56:13 CEST 2014
[    0.000000] CPU: ARMv7 Processor [410fc0f4] revision 4 (ARMv7),
cr=3D30c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instructio=
n
cache
[    0.000000] Machine model: Google Spring
[    0.000000] Forcing write-allocate cache policy for SMP
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] On node 0 totalpages: 523264
[    0.000000] free_area_init_node: node 0, pgdat c0659dc0, node_mem_ma=
p
ee7fc000
[    0.000000]   Normal zone: 1520 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 194560 pages, LIFO batch:31
[    0.000000]   HighMem zone: 2568 pages used for memmap
[    0.000000]   HighMem zone: 328704 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 7 pages/cpu @ee7bc000 s7104 r8192 d1337=
6
u32768
[    0.000000] pcpu-alloc: s7104 r8192 d13376 u32768 alloc=3D8*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 521744
[    0.000000] Kernel command line: console=3Dtty1 root=3D/dev/sda3
rootfstype=3Dext4 rw rootwait clk_ignore_unused
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes)
[    0.000000] Memory: 2068784K/2093056K available (4454K kernel code,
258K rwdata, 1480K rodata, 278K init, 281K bss, 24272K reserved,
1314816K highmem)
[    0.000000] Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
    vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
    lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
    pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
    modules : 0xbf000000 - 0xbfe00000   (  14 MB)
      .text : 0xc0008000 - 0xc05d3dd4   (5936 kB)
      .init : 0xc05d4000 - 0xc0619bc0   ( 279 kB)
      .data : 0xc061a000 - 0xc065a9e0   ( 259 kB)
       .bss : 0xc065a9ec - 0xc06a1080   ( 282 kB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
2, Nodes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2=
=2E
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu=
_ids=3D2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] L2C: failed to init: -19
[    0.000000] Exynos5250: clock setup completed, armclk=3D1700000000
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (virt).
[    0.000003] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps
every 2863311519744ns
[    0.000007] Switching to timer-based delay loop
[ 2870.975122] sched_clock: 64 bits at 24MHz, resolution 41ns, wraps
every 2863311519744ns
[ 2870.975267] Console: colour dummy device 80x30
[ 2870.975468] console [tty1] enabled
[ 2870.975482] Calibrating delay loop (skipped), value calculated using
timer frequency.. 48.00 BogoMIPS (lpj=3D120000)
[ 2870.975499] pid_max: default: 32768 minimum: 301
[ 2870.975587] Mount-cache hash table entries: 2048 (order: 1, 8192 byt=
es)
[ 2870.975598] Mountpoint-cache hash table entries: 2048 (order: 1, 819=
2
bytes)
[ 2870.975950] CPU: Testing write buffer coherency: ok
[ 2870.976081] CPU0: update cpu_capacity 1024
[ 2870.976092] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[ 2870.976188] Setting up static identity map for 0x4043c0d8 - 0x4043c1=
30
[ 2920.607946] CPU1: Booted secondary processor
[ 2920.607979] CPU1: update cpu_capacity 1024
[ 2920.607983] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[ 2920.608027] Brought up 2 CPUs
[...]

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg

From: randy <lxr1234@hotmail.com>
Subject: linux 3.13-rc1 make dw_mmc-exynos more worse
Date: Sun, 24 Nov 2013 20:07:19 +0800
Message-ID: <BLU0-SMTP154F63148320A2FFA456BFADE20@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------050804000302080806020404"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from blu0-omc4-s33.blu0.hotmail.com ([65.55.111.172]:15977 "EHLO
	blu0-omc4-s33.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752005Ab3KXMHp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Nov 2013 07:07:45 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tgih.jun@samsung.com, jh80.chung@samsung.com, kgene.kim@samsung.com, devicetree@vger.kernel.org

--------------050804000302080806020404
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

After pull the merge of 3.13-rc1, the dw_mmc-exynos will make the boot
stock.In 3.13, it is just stocked udev in 3.13 and makse udev timeout
but kernel report the emmc device is found.

And in the Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt I
saw that it is need to define which gpio ports that a emmc slot use,
but when I watched others dts, they use pinctrl, which is correct?
Here is the log and dts
=======================log begin =============================
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0xa00
[    0.000000] Linux version 3.13.0-rc1-00008-g584fa45-dirty
(ayaka@kotomi) (gcc version 4.7.3 (crosstool-NG 1.19.0) ) #3 SMP
PREEMPT Sun Nov 24 19
:30:28 CST 2013
[    0.000000] CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7),
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] Machine model: Friendly Arm Tiny4412 1306 board based
on Exynos4412
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] CPU EXYNOS4412 (id 0xe4412011)
[    0.000000] PERCPU: Embedded 8 pages/cpu @c083c000 s8448 r8192
d16128 u32768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
 Total pages: 256272
[    0.000000] Kernel command line: earlyprintk=ttySAC0,115200
console=ttySAC0,115200 root=/dev/mmcblk0p1 rootfstype=ext4 rw
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7,
524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes)
[    0.000000] Memory: 1015592K/1031168K available (4266K kernel code,
229K rwdata, 1272K rodata, 208K init, 270K bss, 15576K reserved,
269312K hig
hmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0570cf4   (5540 kB)
[    0.000000]       .init : 0xc0571000 - 0xc05a5100   ( 209 kB)
[    0.000000]       .data : 0xc05a6000 - 0xc05df540   ( 230 kB)
[    0.000000]        .bss : 0xc05df54c - 0xc06230c0   ( 271 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] Exynos4x12 clocks: sclk_apll = 466666666, sclk_mpll =
800000000
[    0.000000]  sclk_epll = 96000000, sclk_vpll = 108000000, arm_clk =
1400000000
[    0.000000] sched_clock: 32 bits at 200 Hz, resolution 5000000ns,
wraps every 10737418240000000ns
[    0.000000] Console: colour dummy device 80x30
[    0.010000] Calibrating delay loop... 2795.11 BogoMIPS (lpj=6987776)
[    0.060000] pid_max: default: 32768 minimum: 301
[    0.065000] Mount-cache hash table entries: 512
[    0.075000] CPU: Testing write buffer coherency: ok
[    0.080000] missing device node for CPU 0
[    0.085000] missing device node for CPU 1
[    0.085000] missing device node for CPU 2
[    0.090000] missing device node for CPU 3
[    0.095000] CPU0: thread -1, cpu 0, socket 10, mpidr 80000a00
[    0.100000] Setting up static identity map for 0x4040bfc0 - 0x4040c018
[    0.135000] CPU1: Booted secondary processor
[    0.180000] CPU1: thread -1, cpu 1, socket 10, mpidr 80000a01
[    0.190000] CPU2: Booted secondary processor
[    0.235000] CPU2: thread -1, cpu 2, socket 10, mpidr 80000a02
[    0.245000] CPU3: Booted secondary processor
[    0.290000] CPU3: thread -1, cpu 3, socket 10, mpidr 80000a03
[    0.290000] Brought up 4 CPUs
[    0.295000] SMP: Total of 4 processors activated.
[    0.300000] CPU: All CPU(s) started in SVC mode.
[    0.305000] devtmpfs: initialized
[    0.315000] VFP support v0.3: implementor 41 architecture 3 part 30
variant 9 rev 4
[    0.325000] pinctrl core: initialized pinctrl subsystem
[    0.330000] regulator-dummy: no parameters
[    0.335000] NET: Registered protocol family 16
[    0.340000] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.350000] cpuidle: using governor ladder
[    0.350000] cpuidle: using governor menu
[    0.370000] S3C Power Management, Copyright 2004 Simtec Electronics
[    0.375000] EXYNOS4x12 PMU Initialize
[    0.380000] EXYNOS: Initializing architecture
[    0.410000] bio: create slab <bio-0> at 0
[    0.415000] VMEM_VDD_2.8V: 2800 mV
[    0.420000] SCSI subsystem initialized
[    0.425000] usbcore: registered new interface driver usbfs
[    0.435000] usbcore: registered new interface driver hub
[    0.440000] usbcore: registered new device driver usb
[    0.445000] s3c-i2c 13860000.i2c: slave address 0x00
[    0.450000] s3c-i2c 13860000.i2c: bus frequency set to 195 KHz
[    0.455000] s3c-i2c 13860000.i2c: i2c-0: S3C I2C adapter
[    0.465000] Switched to clocksource mct-frc
[    0.495000] NET: Registered protocol family 2
[    0.500000] TCP established hash table entries: 8192 (order: 3,
32768 bytes)
[    0.505000] TCP bind hash table entries: 8192 (order: 5, 163840 bytes)
[    0.510000] TCP: Hash tables configured (established 8192 bind 8192)
[    0.520000] TCP: reno registered
[    0.520000] UDP hash table entries: 512 (order: 2, 24576 bytes)
[    0.530000] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes)
[    0.535000] NET: Registered protocol family 1
[    0.540000] RPC: Registered named UNIX socket transport module.
[    0.545000] RPC: Registered udp transport module.
[    0.550000] RPC: Registered tcp transport module.
[    0.555000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.565000] bounce pool size: 64 pages
[    0.585000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.595000] NFS: Registering the id_resolver key type
[    0.600000] Key type id_resolver registered
[    0.605000] Key type id_legacy registered
[    0.610000] fuse init (API version 7.22)
[    0.615000] msgmni has been set to 1457
[    0.615000] io scheduler noop registered
[    0.620000] io scheduler deadline registered
[    0.625000] io scheduler cfq registered (default)
[    0.645000] dma-pl330 12680000.pdma: unable to set the seg size
[    0.650000] dma-pl330 12680000.pdma: Loaded driver for PL330
DMAC-1315632
[    0.660000] dma-pl330 12680000.pdma:         DBUFF-32x4bytes
Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.675000] dma-pl330 12690000.pdma: unable to set the seg size
[    0.680000] dma-pl330 12690000.pdma: Loaded driver for PL330
DMAC-1315632
[    0.685000] dma-pl330 12690000.pdma:         DBUFF-32x4bytes
Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.700000] dma-pl330 12850000.mdma: unable to set the seg size
[    0.705000] dma-pl330 12850000.mdma: Loaded driver for PL330
DMAC-1315632
[    0.710000] dma-pl330 12850000.mdma:         DBUFF-64x8bytes
Num_Chans-8 Num_Peri-1 Num_Events-32
[    0.890000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.900000] console [ttySAC0] enabled
[    0.900000] console [ttySAC0] enabled
[    0.905000] bootconsole [earlycon0] disabled
[    0.905000] bootconsole [earlycon0] disabled
[    0.915000] 13810000.serial: ttySAC1 at MMIO 0x13810000 (irq = 85,
base_baud = 0) is a S3C6400/10
[    0.915000] 13820000.serial: ttySAC2 at MMIO 0x13820000 (irq = 86,
base_baud = 0) is a S3C6400/10
[    0.920000] 13830000.serial: ttySAC3 at MMIO 0x13830000 (irq = 87,
base_baud = 0) is a S3C6400/10
[    0.935000] brd: module loaded
[    0.940000] loop: module loaded
[    0.940000] usbcore: registered new interface driver asix
[    0.940000] usbcore: registered new interface driver ax88179_178a
[    0.940000] usbcore: registered new interface driver cdc_ether
[    0.945000] usbcore: registered new interface driver r815x
[    0.950000] usbcore: registered new interface driver smsc75xx
[    0.955000] usbcore: registered new interface driver smsc95xx
[    0.960000] usbcore: registered new interface driver net1080
[    0.965000] usbcore: registered new interface driver cdc_subset
[    0.975000] usbcore: registered new interface driver zaurus
[    0.980000] usbcore: registered new interface driver cdc_ncm
[    0.985000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.990000] ehci-exynos: EHCI EXYNOS driver
[    0.995000] unable to find transceiver of type USB2 PHY
[    1.000000] exynos-ehci 12580000.ehci: no platform data or
transceiver defined
[    1.005000] platform 12580000.ehci: Driver exynos-ehci requests
probe deferral
[    1.015000] usbcore: registered new interface driver usb-storage
[    1.020000] usbcore: registered new interface driver usbserial
[    1.025000] usbcore: registered new interface driver ch341
[    1.030000] usbserial: USB Serial support registered for ch341-uart
[    1.040000] mousedev: PS/2 mouse device common for all mice
[    1.045000] s3c-rtc 10070000.rtc: rtc disabled, re-enabling
[    1.050000] s3c-rtc 10070000.rtc: rtc core: registered s3c as rtc0
[    1.055000] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30)
initialised: dm-devel@redhat.com
[    1.065000] sdhci: Secure Digital Host Controller Interface driver
[    1.070000] sdhci: Copyright(c) Pierre Ossman
[    1.075000] s3c-sdhci 12530000.sdhci: clock source 2: mmc_busclk.2
(100000000 Hz)
[    1.080000] s3c-sdhci 12530000.sdhci: dummy supplies not allowed
[    1.085000] mmc0: no vqmmc regulator found
[    1.090000] s3c-sdhci 12530000.sdhci: dummy supplies not allowed
[    1.095000] mmc0: no vmmc regulator found
[    1.130000] mmc0: SDHCI controller on samsung-hsmmc
[12530000.sdhci] using ADMA
[    1.130000] Synopsys Designware Multimedia Card Interface Driver
[    1.130000] Unable to handle kernel NULL pointer dereference at
virtual address 0000002a
[    1.130000] pgd = c0004000
[    1.130000] [0000002a] *pgd=00000000
[    1.135000] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    1.140000] Modules linked in:
[    1.140000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
3.13.0-rc1-00008-g584fa45-dirty #3
[    1.150000] task: ef0a4000 ti: ef0a8000 task.ti: ef0a8000
[    1.155000] PC is at clk_get_rate+0x18/0x5c
[    1.160000] LR is at clk_prepare_lock+0xc/0xd8
[    1.165000] pc : [<c0319400>]    lr : [<c0318864>]    psr: a0000113
[    1.165000] sp : ef0a9e20  ip : ee94eb40  fp : 00000000
[    1.175000] r10: c0571510  r9 : ef0a8000  r8 : ef227a10
[    1.180000] r7 : c043544c  r6 : fffffffe  r5 : ee94ead0  r4 : fffffffe
[    1.185000] r3 : ef0a4000  r2 : 00000001  r1 : 000002b9  r0 : 00000001
[    1.195000] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[    1.200000] Control: 10c5387d  Table: 4000404a  DAC: 00000015
[    1.205000] Process swapper/0 (pid: 1, stack limit = 0xef0a8240)
[    1.210000] Stack: (0xef0a9e20 to 0xef0aa000)
[    1.215000] 9e20: c0308474 ee9ea610 ee94ead0 c0308488 c0308474
ee9ea610 00000000 c030592c
[    1.225000] 9e40: ef227a10 00001000 c043544c c020a920 c0838b04
17d78400 ee9ea610 ef227a00
[    1.235000] 9e60: ef227a10 c05d6b1c 00000000 c05d6b1c c05890b0
ef0a8000 c0571510 c0269448
[    1.240000] 9e80: c0269430 ef227a10 c061291c c0268088 00000000
ef227a10 c05d6b1c ef227a44
[    1.250000] 9ea0: 00000000 c026822c 00000000 c05d6b1c c02681a0
c02668a8 ef005478 ef212740
[    1.255000] 9ec0: c05d6b1c ef2c7900 c05cf438 c0267864 c0511e38
c05d6b1c 00000006 c05d6b1c
[    1.265000] 9ee0: 00000006 c059575c c05df580 c026884c 00000000
c05a2e14 00000006 c00088dc
[    1.275000] 9f00: c0603f70 ef163e00 c040e334 60000113 c05b5000
a0000113 c05b5054 c05b5050
[    1.280000] 9f20: c05df580 c054ad68 c0839c96 c04247b4 00000093
c0035158 c05b5054 c05a2a20
[    1.290000] 9f40: c050ae2c c054a438 00000006 00000006 00000000
c05a2e14 00000006 c059575c
[    1.300000] 9f60: c05df580 00000093 c0595768 c0571510 00000000
c0571c48 00000006 00000006
[    1.305000] 9f80: c0571510 c003df68 00000000 c0403544 00000000
00000000 00000000 00000000
[    1.315000] 9fa0: 00000000 c040354c 00000000 c000e738 00000000
00000000 00000000 00000000
[    1.320000] 9fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    1.330000] 9fe0: 00000000 00000000 00000000 00000000 00000013
00000000 be73efa4 ffffbffd
[    1.340000] [<c0319400>] (clk_get_rate+0x18/0x5c) from [<c0308488>]
(dw_mci_exynos_setup_clock+0x14/0x2c)
[    1.350000] [<c0308488>] (dw_mci_exynos_setup_clock+0x14/0x2c) from
[<c030592c>] (dw_mci_probe+0x15c/0xca4)
[    1.360000] [<c030592c>] (dw_mci_probe+0x15c/0xca4) from
[<c0269448>] (platform_drv_probe+0x18/0x48)
[    1.365000] [<c0269448>] (platform_drv_probe+0x18/0x48) from
[<c0268088>] (driver_probe_device+0x100/0x218)
[    1.375000] [<c0268088>] (driver_probe_device+0x100/0x218) from
[<c026822c>] (__driver_attach+0x8c/0x90)
[    1.385000] [<c026822c>] (__driver_attach+0x8c/0x90) from
[<c02668a8>] (bus_for_each_dev+0x54/0x88)
[    1.395000] [<c02668a8>] (bus_for_each_dev+0x54/0x88) from
[<c0267864>] (bus_add_driver+0xd4/0x1d0)
[    1.405000] [<c0267864>] (bus_add_driver+0xd4/0x1d0) from
[<c026884c>] (driver_register+0x78/0xf4)
[    1.415000] [<c026884c>] (driver_register+0x78/0xf4) from
[<c00088dc>] (do_one_initcall+0xec/0x148)
[    1.420000] [<c00088dc>] (do_one_initcall+0xec/0x148) from
[<c0571c48>] (kernel_init_freeable+0xfc/0x1c8)
[    1.430000] [<c0571c48>] (kernel_init_freeable+0xfc/0x1c8) from
[<c040354c>] (kernel_init+0x8/0x110)
[    1.440000] [<c040354c>] (kernel_init+0x8/0x110) from [<c000e738>]
(ret_from_fork+0x14/0x3c)
[    1.450000] Code: ebfffd18 e3540000 01a05004 0a000008 (e594302c)
[    1.455000] ---[ end trace ce9389a41a758ebf ]---
[    1.460000] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    1.460000]
[    1.470000] CPU3: stopping
[    1.470000] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D
3.13.0-rc1-00008-g584fa45-dirty #3
[    1.470000] [<c001410c>] (unwind_backtrace+0x0/0xf8) from
[<c0011474>] (show_stack+0x10/0x14)
[    1.470000] [<c0011474>] (show_stack+0x10/0x14) from [<c0406d74>]
(dump_stack+0x6c/0xac)
[    1.470000] [<c0406d74>] (dump_stack+0x6c/0xac) from [<c00134a0>]
(handle_IPI+0x130/0x15c)
[    1.470000] [<c00134a0>] (handle_IPI+0x130/0x15c) from [<c000859c>]
(gic_handle_irq+0x60/0x68)
[    1.470000] [<c000859c>] (gic_handle_irq+0x60/0x68) from
[<c0011f40>] (__irq_svc+0x40/0x70)
[    1.470000] Exception stack(0xef0d1f58 to 0xef0d1fa0)
[    1.470000] 1f40:
     ef0d1fa0 3b9aca00
[    1.470000] 1f60: 57b79083 00000000 3b4f2edb 00000000 c0854160
00000000 00000000 00000001
[    1.470000] 1f80: c05df428 ef0d0000 00000018 ef0d1fa0 c006138c
c02ed564 60000113 ffffffff
[    1.470000] [<c0011f40>] (__irq_svc+0x40/0x70) from [<c02ed564>]
(cpuidle_enter_state+0x50/0xf0)
[    1.470000] [<c02ed564>] (cpuidle_enter_state+0x50/0xf0) from
[<c02ed6ac>] (cpuidle_idle_call+0xa8/0x15c)
[    1.470000] [<c02ed6ac>] (cpuidle_idle_call+0xa8/0x15c) from
[<c000f23c>] (arch_cpu_idle+0x8/0x38)
[    1.470000] [<c000f23c>] (arch_cpu_idle+0x8/0x38) from [<c0055e0c>]
(cpu_startup_entry+0x58/0x154)
[    1.470000] [<c0055e0c>] (cpu_startup_entry+0x58/0x154) from
[<40008644>] (0x40008644)
[    1.470000] CPU2: stopping
[    1.470000] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D
3.13.0-rc1-00008-g584fa45-dirty #3
[    1.470000] [<c001410c>] (unwind_backtrace+0x0/0xf8) from
[<c0011474>] (show_stack+0x10/0x14)
[    1.470000] [<c0011474>] (show_stack+0x10/0x14) from [<c0406d74>]
(dump_stack+0x6c/0xac)
[    1.470000] [<c0406d74>] (dump_stack+0x6c/0xac) from [<c00134a0>]
(handle_IPI+0x130/0x15c)
[    1.470000] [<c00134a0>] (handle_IPI+0x130/0x15c) from [<c000859c>]
(gic_handle_irq+0x60/0x68)
[    1.470000] [<c000859c>] (gic_handle_irq+0x60/0x68) from
[<c0011f40>] (__irq_svc+0x40/0x70)
[    1.470000] Exception stack(0xef0cff58 to 0xef0cffa0)
[    1.470000] ff40:
     ef0cffa0 3b9aca00
[    1.470000] ff60: 57b78fb3 00000000 579f7861 00000000 c084c160
00000000 00000000 00000001
[    1.470000] ff80: c05df428 ef0ce000 00000018 ef0cffa0 c006138c
c02ed564 60000113 ffffffff
[    1.470000] [<c0011f40>] (__irq_svc+0x40/0x70) from [<c02ed564>]
(cpuidle_enter_state+0x50/0xf0)
[    1.470000] [<c02ed564>] (cpuidle_enter_state+0x50/0xf0) from
[<c02ed6ac>] (cpuidle_idle_call+0xa8/0x15c)
[    1.470000] [<c02ed6ac>] (cpuidle_idle_call+0xa8/0x15c) from
[<c000f23c>] (arch_cpu_idle+0x8/0x38)
[    1.470000] [<c000f23c>] (arch_cpu_idle+0x8/0x38) from [<c0055e0c>]
(cpu_startup_entry+0x58/0x154)
[    1.470000] [<c0055e0c>] (cpu_startup_entry+0x58/0x154) from
[<40008644>] (0x40008644)
[    1.470000] CPU1: stopping
[    1.470000] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D
3.13.0-rc1-00008-g584fa45-dirty #3
[    1.470000] [<c001410c>] (unwind_backtrace+0x0/0xf8) from
[<c0011474>] (show_stack+0x10/0x14)
[    1.470000] [<c0011474>] (show_stack+0x10/0x14) from [<c0406d74>]
(dump_stack+0x6c/0xac)
[    1.470000] [<c0406d74>] (dump_stack+0x6c/0xac) from [<c00134a0>]
(handle_IPI+0x130/0x15c)
[    1.470000] [<c00134a0>] (handle_IPI+0x130/0x15c) from [<c000859c>]
(gic_handle_irq+0x60/0x68)
[    1.470000] [<c000859c>] (gic_handle_irq+0x60/0x68) from
[<c0011f40>] (__irq_svc+0x40/0x70)
[    1.470000] Exception stack(0xef0cdf58 to 0xef0cdfa0)
[    1.470000] df40:
     ef0cdfa0 3b9aca00
[    1.470000] df60: 57b7912a 00000000 437b4f54 00000000 c0844160
00000000 00000000 00000001
[    1.470000] df80: c05df428 ef0cc000 00000018 ef0cdfa0 c006138c
c02ed564 60000113 ffffffff
[    1.470000] [<c0011f40>] (__irq_svc+0x40/0x70) from [<c02ed564>]
(cpuidle_enter_state+0x50/0xf0)
[    1.470000] [<c02ed564>] (cpuidle_enter_state+0x50/0xf0) from
[<c02ed6ac>] (cpuidle_idle_call+0xa8/0x15c)
[    1.470000] [<c02ed6ac>] (cpuidle_idle_call+0xa8/0x15c) from
[<c000f23c>] (arch_cpu_idle+0x8/0x38)
[    1.470000] [<c000f23c>] (arch_cpu_idle+0x8/0x38) from [<c0055e0c>]
(cpu_startup_entry+0x58/0x154)
[    1.470000] [<c0055e0c>] (cpu_startup_entry+0x58/0x154) from
[<40008644>] (0x40008644)
===============================log end =================================
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJSkev2AAoJEPb4VsMIzTziQMIH/RlnT/P/mjz/15F3BgZPD0jb
gW8ULDNacgjuM+7gAM+4XbfLb3V6PAeu/nI3N8JRV6JwewOhM0d2PE2Olg7BFydI
hutGPD3PG7lwJEFz7HuOFN4yPrk7nIdpZEIfLqCNpLnxUJ+WlCqIt6ZmHuWr1vcU
A77ZDKz9OVC3beGIVqTm2zhudc6PdQY9tQ2M8lUQ/2JlZGy1N6gJxEuysGDseXTU
iVn5T+zJDLaFG0sthimXvU9fgoa3WxmwvNPlMUQuBvMrRY/dTOYBuV4CkJD7aSyC
KvD2v+lHawqWStylSJaFVrGrNv9V4b/O7hR0MqRk69/6a9chAnyJr/38zuabopY=
=bob6
-----END PGP SIGNATURE-----

--------------050804000302080806020404
Content-Type: text/plain; name="exynos4412-tiny4412.dts"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="exynos4412-tiny4412.dts"

LyoKICogSGFyZGtlcm5lbCdzIEV4eW5vczQ0MTIgYmFzZWQgdGlueTQ0MTIgMTMwNiBib2Fy
ZCBkZXZpY2UgdHJlZSBzb3VyY2UKICoKICogQ29weXJpZ2h0IChjKSAyMDEzIFRvbW95YSBH
aXRzdWZ1a2kgPGF5YWthQG1haWwuc291bGlrLmluZm8+CiAqCiAqIERldmljZSB0cmVlIHNv
dXJjZSBmaWxlIGZvciBGcmllbmR5YXJtIHRpbnk0NDEyIDEzMDYgYm9hcmQgd2hpY2ggaXMg
YmFzZWQgb24KICogU2Ftc3VuZydzIEV4eW5vczQ0MTIgU29DLgogKgogKiBUaGlzIHByb2dy
YW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQogKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIHZlcnNpb24gMiBhcwogKiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbi4KKi8KCi9kdHMtdjEvOwojaW5jbHVkZSAiZXh5bm9zNDQxMi5kdHNpIgoK
LyB7Cgltb2RlbCA9ICJGcmllbmRseSBBcm0gVGlueTQ0MTIgMTMwNiBib2FyZCBiYXNlZCBv
biBFeHlub3M0NDEyIjsKCWNvbXBhdGlibGUgPSAiZnJpZW5kbHlhcm0sdGlueTQ0MTItMTMw
NiIsICJzYW1zdW5nLGV4eW5vczQ0MTIiOwoKCW1lbW9yeSB7CgkJcmVnID0gPDB4NDAwMDAw
MDAgMHg0MDAwMDAwMD47Cgl9OwoKCWNob3NlbiB7CgkJYm9vdGFyZ3MgPSJyb290PS9kZXYv
bW1jYmxrMHAxIHJvb3Rmc3R5cGU9ZXh0NCBydyBjb25zb2xlPXR0eVNBQzAsMTE1MjAwIGlu
aXQ9L3NiaW4vaW5pdCI7Cgl9OwoKCWxlZHMgewoJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRz
IjsKCQlsZWQxIHsKCQkJbGFiZWwgPSAibGVkMTpoZWFydCI7CgkJCWdwaW9zID0gPCZncG00
IDAgMT47CgkJCWRlZmF1bHQtc3RhdGUgPSAib24iOwoJCQlsaW51eCxkZWZhdWx0LXRyaWdn
ZXIgPSAiaGVhcnRiZWF0IjsKCQl9OwoJCWxlZDIgewoJCQlsYWJlbCA9ICJsZWQyOm1tYzAi
OwoJCQlncGlvcyA9IDwmZ3BtNCAxIDE+OwoJCQlkZWZhdWx0LXN0YXRlID0gIm9uIjsKCQkJ
bGludXgsZGVmYXVsdC10cmlnZ2VyID0gIm1tYzAiOwoJCX07CgoJfTsKCglyZWd1bGF0b3Jz
IHsKCQljb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+
OwoKCQl2ZW1tY19yZWc6IHJlZ3VsYXRvci0wIHsKCQkJY29tcGF0aWJsZSA9ICJyZWd1bGF0
b3ItZml4ZWQiOwoJCQlyZWd1bGF0b3ItbmFtZSA9ICJWTUVNX1ZERF8yLjhWIjsKCQkJcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MjgwMDAwMD47CgkJCXJlZ3VsYXRvci1tYXgtbWlj
cm92b2x0ID0gPDI4MDAwMDA+OwoJCQlncGlvID0gPCZncGswIDIgMD47CgkJCWVuYWJsZS1h
Y3RpdmUtaGlnaDsKCQl9OwoKCX07CgoJbXNoY0AxMjU1MDAwMCB7CgkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJcGluY3RybC0wID0gPCZzZDRfY2xr
ICZzZDRfY21kICZzZDRfYnVzNCAmc2Q0X2J1czg+OwoJCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7CgkJc3RhdHVzID0gIm9rYXkiOwoKCQl2bW1jLXN1cHBseSA9IDwmdmVtbWNfcmVn
PjsKCQljbG9ja3MgPSA8JmNsb2NrIDMwMT4sIDwmY2xvY2sgMTQ5PjsKCQljbG9ja3MtbmFt
ZSA9ICJkd21jaSIsICJzY2xrX2R3bWNpIjsKCQljbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAw
MDAwPjsKCgkJbnVtLXNsb3RzID0gPDE+OwoJCXN1cHBvcnRzLWhpZ2hzcGVlZDsKCQlicm9r
ZW4tY2Q7CgkJZmlmby1kZXB0aCA9IDwweDgwPjsKCQljYXJkLWRldGVjdC1kZWxheSA9IDwy
MDA+OwoJCXNhbXN1bmcsZHctbXNoYy1zZHItdGltaW5nID0gPDIgMz47CgkJc2Ftc3VuZyxk
dy1tc2hjLWRkci10aW1pbmcgPSA8MSAyPjsKCgkJc2xvdEAwIHsKCQkJcmVnID0gPDA+OwoJ
CQlidXMtd2lkdGggPSA8OD47CgkJCQkKCQl9OwoJfTsKCglydGNAMTAwNzAwMDAgewoJCXN0
YXR1cyA9ICJva2F5IjsKCX07CgoJc2RoY2lAMTI1MzAwMDAgewoJCWJ1cy13aWR0aCA9IDw0
PjsKCQlwaW5jdHJsLTAgPSA8JnNkMl9jbGsgJnNkMl9jbWQgJnNkMl9idXM0ICZzZDJfY2Q+
OwoJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJc3RhdHVzID0gIm9rYXkiOwoJfTsK
CXNkaGNpQDEyNTQwMDAgewoJCWJ1cy13aWR0aCA9IDw0PjsKCQlwaW5jdHJsLTAgPSA8JnNk
M19jbGsgJnNkM19jbWQgJnNkM19idXM0ICZzZDNfY2Q+OwoJCXBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7CgkJc3RhdHVzID0gIm9rYXkiOwoJfTsKCgl1c2JfaG9zdDA6IHVzYnBoeTFA
MTI1ODAwMDAgewoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDE+
OwoJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEwLXVzYnBoeSI7CgkJcmVnID0g
PDB4MTI1ODAwMDAgMHgxMDA+OwoJCXJhbmdlczsKCgkJY2xvY2tzID0gPCZjbG9jayAyPiwg
PCZjbG9jayAzMDQ+OwoJCWNsb2NrLW5hbWVzID0gInh1c2J4dGkiLCAidXNiaG9zdCI7CgkJ
dXNicGh5LXN5cyB7CgkJCS8qIFVTQiBkZXZpY2UgYW5kIGhvc3QgUEhZX0NPTlRST0wgcmVn
aXN0ZXJzICovCgkJCXJlZyA9IDwweDEwMDIwNzA4IDB4ND47CgkJfTsKCX07CgoJdXNiX2hv
c3QxOiB1c2JwaHkyQDEyNTgwMDAwIHsKCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkjc2l6
ZS1jZWxscyA9IDwxPjsKCQljb21wYXRpYmxlID0gInNhbXN1bmcsZXh5bm9zNDIxMC11c2Jw
aHkiOwoJCXJlZyA9IDwweDEyNTgwMDAwIDB4MTAwPjsKCQlyYW5nZXM7CgoJCWNsb2NrcyA9
IDwmY2xvY2sgMj4sIDwmY2xvY2sgMzA0PjsKCQljbG9jay1uYW1lcyA9ICJ4dXNieHRpIiwg
InVzYmhvc3QiOwoJCXVzYnBoeS1zeXMgewoJCQkvKiBVU0IgZGV2aWNlIGFuZCBob3N0IFBI
WV9DT05UUk9MIHJlZ2lzdGVycyAqLwoJCQlyZWcgPSA8MHgxMDAyMDcwYyAweDQ+OwoJCX07
Cgl9OwoKCglvdGdAMTI1QjAwMDAgewoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXpl
LWNlbGxzID0gPDE+OwoJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEwLXVzYnBo
eSI7CgkJcmVnID0gPDB4MTJCMDAwMCAweDEwMD47CgkJcmFuZ2VzOwoKCQljbG9ja3MgPSA8
JmNsb2NrIDI+LCA8JmNsb2NrIDMwNT47CgkJY2xvY2stbmFtZXMgPSAieHVzYnh0aSIsICJv
dGciOwoJCXVzYnBoeS1zeXMgewoJCQkvKiBVU0IgZGV2aWNlIGFuZCBob3N0IFBIWV9DT05U
Uk9MIHJlZ2lzdGVycyAqLwoJCQlyZWcgPSA8MHgxMDAyMDcwNCAweDQ+OwoJCX07Cgl9OwoK
CWVoY2lAMTI1ODAwMDAgewoJCXVzYi1waHkgPSA8JnVzYl9ob3N0MD47CgkJc3RhdHVzID0g
Im9rYXkiOwoJfTsKCQoJb2hjaUAxMjU5MDAwMCB7CgkJc3RhdHVzID0gIm9rYXkiOwoJfTsK
CgoJY29kZWNAMTM0MDAwMDAgewoJCXNhbXN1bmcsbWZjLXIgPSA8MHg0MzAwMDAwMCAweDgw
MDAwMD47CgkJc2Ftc3VuZyxtZmMtbCA9IDwweDUxMDAwMDAwIDB4ODAwMDAwPjsKCQlzdGF0
dXMgPSAib2theSI7Cgl9OwoKCXNlcmlhbEAxMzgwMDAwMCB7CgkJc3RhdHVzID0gIm9rYXki
OwoJfTsKCglzZXJpYWxAMTM4MTAwMDAgewoJCXN0YXR1cyA9ICJva2F5IjsKCX07CgoJc2Vy
aWFsQDEzODIwMDAwIHsKCQlzdGF0dXMgPSAib2theSI7Cgl9OwoKCXNlcmlhbEAxMzgzMDAw
MCB7CgkJc3RhdHVzID0gIm9rYXkiOwoJfTsKCglmaXhlZC1yYXRlLWNsb2NrcyB7CgkJeHh0
aSB7CgkJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxjbG9jay14eHRpIjsKCQkJY2xvY2stZnJl
cXVlbmN5ID0gPDA+OwoJCX07CgoJCXh1c2J4dGkgewoJCQljb21wYXRpYmxlID0gInNhbXN1
bmcsY2xvY2steHVzYnh0aSI7CgkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CgkJ
fTsKCX07CgoJaTJjQDEzODYwMDAwIHsKCQlzdGF0dXMgPSAib2theSI7CgkJc2Ftc3VuZyxp
MmMtc2RhLWRlbGF5ID0gPDEwMD47CgkJc2Ftc3VuZyxpMmMtbWF4LWJ1cy1mcmVxID0gPDIw
MDAwMD47CgoJCXdtODk2MEAxMCB7CgkJCWNvbXBhdGlibGUgPSAid2xmLHdtODk2MCI7CgkJ
CXJlZyA9IDwweDEwPjsKCQl9OwoJfTsKfTsK
--------------050804000302080806020404
Content-Type: application/pgp-signature; name="exynos4412-tiny4412.dts.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="exynos4412-tiny4412.dts.sig"

iQEcBAABAgAGBQJSkev3AAoJEPb4VsMIzTzijfoIANAVbq7xtQbd33Zt78RgSttc7A7+bWrN
MMQoOXi2A9ojWllmidCBEoceIvhDyydMEunUlcNIXD5ovkZX4b8mwdCn3CNs9q+5xMoufHt9
vU7psqyK6OI/oJp7zsNsDtaXW3jJNYQrLHzHuVC/ZrkPXdpsTS/nt9ZiebxJHO/cEbhmnThK
733fXHUpBUdKcQdUxVftXDuTyTpxStZ6DoRX4V5fT9u/8EQhTRItr2110kNfHnjULLuKqqII
/6FQy1gCWDS3hj/QrhsVUBFaehhMoSBvK5Zmlh/82iRnIKu5Ca1KZ/F6eoVOlQbSxBb69jgR
1+NXVs3YcGE5grUB6SAdauQ=
--------------050804000302080806020404--

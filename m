From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: gta02 machine stuck during boot
Date: Sat, 25 Feb 2012 17:33:07 +0100
Message-ID: <1330187588-2636-1-git-send-email-GNUtoo@no-log.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp202.alice.it ([82.57.200.98]:51882 "EHLO smtp202.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757045Ab2BYQdQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Feb 2012 11:33:16 -0500
Received: from trisquel.workgroup (82.48.81.29) by smtp202.alice.it (8.6.023.02) (authenticated as editempo@alice.it)
        id 4ECA5CC20318D13C for linux-samsung-soc@vger.kernel.org; Sat, 25 Feb 2012 17:33:14 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,
Without the patch(the patch was not made by me) that will follow,
  my gta02 machine is stuck at the end of this log, without any reactio=
n:

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.3.0-rc4-next-20120224+ (gnutoo@trisquel)=
 (gcc version 4.6.3 20111117 (prerelease) (GCC) ) #105 Sat Feb 25 17:29=
:52 CET 2012
[    0.000000] CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc00071=
77
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: GTA02
[    0.000000] Ignoring tag cmdline (using the default kernel command l=
ine)
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] CPU S3C2442B (id 0x32440aab)
[    0.000000] S3C24XX Clocks, Copyright 2004 Simtec Electronics
[    0.000000] S3C244X: core 400.000 MHz, memory 100.000 MHz, periphera=
l 50.000 MHz
[    0.000000] CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat c040ee10, node_mem_ma=
p c0462000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32512 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.000000] pcpu-alloc: [0] 0=20
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total pages: 32512
[    0.000000] Kernel command line: loglevel=3D4 console=3Dtty0 console=
=3DttySAC2,115200 init=3D/sbin/init ro glamo_mci.sd_max_clk=3D2000000  =
mtdparts=3Dphysmap-flash:-(nor);neo1973-nand:0x00040000(qi),0x00040000(=
depr-ub-env),0x00800000(kernel),0x000a0000(depr),0x00040000(identity-ex=
t2),0x0f6a0000(rootfs)  rootfstype=3Dubifs  ubi.mtd=3D6,2048  root=3Dub=
i0:om-gta02-rootfs ignore_loglevel rootwait=3D10 panic=3D5
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 =
bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 by=
tes)
[    0.000000] Memory: 128MB =3D 128MB total
[    0.000000] Memory: 125420k/125420k available, 5652k reserved, 0K hi=
ghmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc03c4808   (3827 kB)
[    0.000000]       .init : 0xc03c5000 - 0xc03e6000   ( 132 kB)
[    0.000000]       .data : 0xc03e6000 - 0xc040f4a0   ( 166 kB)
[    0.000000]        .bss : 0xc040f4c4 - 0xc04619f0   ( 330 kB)
[    0.000000] NR_IRQS:85
[    0.000000] irq: clearing pending ext status 000b02f0
[    0.000000] irq: clearing pending ext status 000902d0
[    0.000000] irq: clearing subpending status 000001c0
[    0.000000] irq: clearing subpending status 00000080
[    0.000000] timer tcon=3D00000000, tcnt a2c1, tcfg 00000200,00000000=
, usec 00001eb8
[    0.000000] sched_clock: 32 bits at 200 Hz, resolution 5000000ns, wr=
aps every 4294967291ms
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [tty0] enabled
[    0.000000] Calibrating delay loop... 199.47 BogoMIPS (lpj=3D498688)
[    0.040000] pid_max: default: 32768 minimum: 301
[    0.040000] Mount-cache hash table entries: 512
[    0.040000] Initializing cgroup subsys cpuacct
[    0.040000] Initializing cgroup subsys devices
[    0.040000] Initializing cgroup subsys freezer
[    0.040000] CPU: Testing write buffer coherency: ok
[    0.040000] Setting up static identity map for 0x302d7208 - 0x302d72=
60
[    0.045000] devtmpfs: initialized
[    0.050000] gpiochip_add: registered GPIOs 0 to 23 on device: GPIOA
[    0.050000] gpiochip_add: registered GPIOs 32 to 47 on device: GPIOB
[    0.050000] gpiochip_add: registered GPIOs 64 to 79 on device: GPIOC
[    0.050000] gpiochip_add: registered GPIOs 96 to 111 on device: GPIO=
D
[    0.050000] gpiochip_add: registered GPIOs 128 to 143 on device: GPI=
OE
[    0.050000] gpiochip_add: registered GPIOs 160 to 167 on device: GPI=
OF
[    0.050000] gpiochip_add: registered GPIOs 192 to 207 on device: GPI=
OG
[    0.050000] gpiochip_add: registered GPIOs 224 to 234 on device: GPI=
OH
[    0.050000] gpiochip_add: registered GPIOs 256 to 271 on device: GPI=
OJ
[    0.050000] dummy:=20
[    0.050000] NET: Registered protocol family 16
[    0.055000] S3C Power Management, Copyright 2004 Simtec Electronics
[    0.055000] S3C2442: Initialising architecture
[    0.060000] S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electroni=
cs
[    0.060000] DMA channel 0 at c8804000, irq 33
[    0.060000] DMA channel 1 at c8804040, irq 34
[    0.060000] DMA channel 2 at c8804080, irq 35
[    0.060000] DMA channel 3 at c88040c0, irq 36
[    0.060000] S3C244X: Clock Support, DVS off
[    0.060000] S3C24XX CPU Frequency driver, s3c244x cpu support
[    0.065000] bio: create slab <bio-0> at 0
[    0.070000] s3c-i2c s3c2440-i2c: slave address 0x10
[    0.070000] s3c-i2c s3c2440-i2c: bus frequency set to 97 KHz
[    0.070000] pcf50633 0-0073: Probed device version 19 variant 132
[    0.090000] wake enabled for irq 53
[    0.090000] auto: 3300 mV normal=20
[    0.105000] down1: 1300 <--> 1600 mV at 1300 mV normal=20
[    0.105000] down1: Voltage range but no REGULATOR_CHANGE_VOLTAGE
[    0.105000] down2: 1800 mV normal=20
[    0.105000] ldo1: 3300 mV normal=20
[    0.110000] ldo2: 3300 mV normal=20
[    0.110000] ldo3: 3000 mV normal=20
[    0.115000] ldo4: 3200 mV normal=20
[    0.115000] ldo5: 3000 mV normal=20
[    0.115000] ldo6: 3000 mV normal=20
[    0.120000] hcldo: 2000 <--> 3300 mV at 3000 mV normal=20
[    0.120000] memldo: 1800 mV normal=20
[    0.120000] s3c-i2c s3c2440-i2c: i2c-0: S3C I2C adapter
[    0.125000] Advanced Linux Sound Architecture Driver Version 1.0.25.
[    0.170000] NET: Registered protocol family 2
[    0.170000] IP route cache hash table entries: 1024 (order: 0, 4096 =
bytes)
[    0.170000] TCP established hash table entries: 4096 (order: 3, 3276=
8 bytes)
[    0.170000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes=
)
[    0.170000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.170000] TCP reno registered
[    0.170000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.170000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.175000] NET: Registered protocol family 1
[    0.175000] s3c-adc s3c24xx-adc: operating without regulator "vdd" .
[    0.180000] JFFS2 version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Re=
d Hat, Inc.
[    0.180000] msgmni has been set to 244
[    0.185000] Block layer SCSI generic (bsg) driver version 0.4 loaded=
 (major 253)
[    0.185000] io scheduler noop registered
[    0.185000] io scheduler deadline registered (default)
[    0.190000] s3c2440-uart.0: ttySAC0 at MMIO 0x50000000 (irq =3D 70) =
is a S3C2440
[    0.190000] s3c2440-uart.1: ttySAC1 at MMIO 0x50004000 (irq =3D 73) =
is a S3C2440
[    0.190000] s3c2440-uart.2: ttySAC2 at MMIO 0x50008000 (irq =3D 76) =
is a S3C2440

Denis.

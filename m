From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
Subject: Re: [PATCH] ARM: S3C24XX: Fix restart on S3C2442
Date: Mon, 13 Feb 2012 13:29:37 +0100
Message-ID: <201202131329.37465.GNUtoo@no-log.org>
References: <1329051929-8303-1-git-send-email-GNUtoo@no-log.org> <201202121459.54568.heiko@sntech.de> <201202121957.10472.GNUtoo@no-log.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp201.alice.it ([82.57.200.97]:48749 "EHLO smtp201.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752501Ab2BMMaE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 07:30:04 -0500
In-Reply-To: <201202121957.10472.GNUtoo@no-log.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

>Thanks a lot for the patch.
>It compiles fine.
>Now time for me to look at runtime boot issues for my gta02.
I've now tested at runtime, here's the boot log:

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.3.0-rc3-next-20120213+ (gnutoo@trisquel)=
 (gcc=20
version 4.6.3 20111117 (prerelease) (GCC) ) #74 Mon Feb 13 13:12:05 CET=
 2012
[    0.000000] CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc00071=
77
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: GTA02
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] CPU S3C2442B (id 0x32440aab)
[    0.000000] S3C24XX Clocks, Copyright 2004 Simtec Electronics
[    0.000000] S3C244X: core 400.000 MHz, memory 100.000 MHz, periphera=
l=20
50.000 MHz
[    0.000000] CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat c0398220, node_mem_ma=
p=20
c03e9000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32512 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.000000] pcpu-alloc: [0] 0=20
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total=20
pages: 32512
[    0.000000] Kernel command line: loglevel=3D4 console=3Dtty0=20
console=3DttySAC2,115200 init=3D/sbin/init ro  mtdparts=3Dphysmap-
flash:-(nor);neo1973-nand:0x00040000(qi),0x00040000(depr-ub-
env),0x00800000(kernel),0x000a0000(depr),0x00040000(identity-
ext2),0x0f6a0000(rootfs)  root=3D/dev/mmcblk0p1 rootwait ignore_logleve=
l=20
earlyprintk
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 =
bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 by=
tes)
[    0.000000] Memory: 128MB =3D 128MB total
[    0.000000] Memory: 125904k/125904k available, 5168k reserved, 0K hi=
ghmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0355470   (3382 kB)
[    0.000000]       .init : 0xc0356000 - 0xc0374000   ( 120 kB)
[    0.000000]       .data : 0xc0374000 - 0xc03988c0   ( 147 kB)
[    0.000000]        .bss : 0xc03988e4 - 0xc03e8ab0   ( 321 kB)
[    0.000000] NR_IRQS:85 nr_irqs:85 85
[    0.000000] irq: clearing pending ext status 000b12f0
[    0.000000] irq: clearing pending ext status 000902d0
[    0.000000] irq: clearing subpending status 00000180
[    0.000000] timer tcon=3D00000000, tcnt a2c1, tcfg 00000200,00000000=
, usec=20
00001eb8
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [tty0] enabled
[    0.005000] Calibrating delay loop... 199.47 BogoMIPS (lpj=3D498688)
[    0.050000] pid_max: default: 32768 minimum: 301
[    0.055000] Mount-cache hash table entries: 512
[    0.060000] Initializing cgroup subsys cpuacct
[    0.065000] Initializing cgroup subsys devices
[    0.070000] Initializing cgroup subsys freezer
[    0.075000] CPU: Testing write buffer coherency: ok
[    0.080000] Setting up static identity map for 0x30281fe8 - 0x302820=
40
[    0.090000] devtmpfs: initialized
[    0.095000] gpiochip_add: registered GPIOs 0 to 23 on device: GPIOA
[    0.100000] gpiochip_add: registered GPIOs 32 to 47 on device: GPIOB
[    0.105000] gpiochip_add: registered GPIOs 64 to 79 on device: GPIOC
[    0.110000] gpiochip_add: registered GPIOs 96 to 111 on device: GPIO=
D
[    0.115000] gpiochip_add: registered GPIOs 128 to 143 on device: GPI=
OE
[    0.120000] gpiochip_add: registered GPIOs 160 to 167 on device: GPI=
OF
[    0.125000] gpiochip_add: registered GPIOs 192 to 207 on device: GPI=
OG
[    0.130000] gpiochip_add: registered GPIOs 224 to 234 on device: GPI=
OH
[    0.135000] gpiochip_add: registered GPIOs 256 to 271 on device: GPI=
OJ
[    0.140000] dummy:=20
[    0.145000] NET: Registered protocol family 16
[    0.150000] S3C Power Management, Copyright 2004 Simtec Electronics
[    0.155000] S3C2442: Initialising architecture
[    0.160000] S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electroni=
cs
[    0.165000] DMA channel 0 at c8804000, irq 33
[    0.170000] DMA channel 1 at c8804040, irq 34
[    0.170000] DMA channel 2 at c8804080, irq 35
[    0.175000] DMA channel 3 at c88040c0, irq 36
[    0.180000] S3C244X: Clock Support, DVS off
[    0.185000] S3C24XX CPU Frequency driver, s3c244x cpu support
[    0.190000] bio: create slab <bio-0> at 0
[    0.200000] s3c-i2c s3c2440-i2c: slave address 0x10
[    0.205000] s3c-i2c s3c2440-i2c: bus frequency set to 97 KHz
[    0.220000] pcf50633 0-0073: Probed device version 19 variant 132
[    0.245000] wake enabled for irq 53
[    0.250000] auto: 3300 mV normal=20
[    0.265000] down1: 1300 <--> 1600 mV at 1300 mV normal=20
[    0.270000] down1: Voltage range but no REGULATOR_CHANGE_VOLTAGE
[    0.275000] down2: 1800 mV normal=20
[    0.280000] ldo1: 3300 mV normal=20
[    0.285000] ldo2: 3300 mV normal=20
[    0.290000] ldo3: 3000 mV normal=20
[    0.295000] ldo4: 3200 mV normal=20
[    0.305000] ldo5: 3000 mV normal=20
[    0.305000] ldo6: 3000 mV normal=20
[    0.315000] hcldo: 2000 <--> 3300 mV at 3000 mV normal=20
[    0.320000] memldo: 1800 mV normal=20
[    0.325000] s3c-i2c s3c2440-i2c: i2c-0: S3C I2C adapter
[    0.380000] NET: Registered protocol family 2
[    0.385000] IP route cache hash table entries: 1024 (order: 0, 4096 =
bytes)
[    0.390000] TCP established hash table entries: 4096 (order: 3, 3276=
8=20
bytes)
[    0.395000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes=
)
[    0.400000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.405000] TCP reno registered
[    0.410000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.415000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.420000] NET: Registered protocol family 1
[    0.425000] s3c-adc s3c24xx-adc: operating without regulator "vdd" .
[    0.435000] JFFS2 version 2.2. (NAND) (SUMMARY)  =A9 2001-2006 Red H=
at, Inc.
[    0.445000] msgmni has been set to 245
[    0.450000] Block layer SCSI generic (bsg) driver version 0.4 loaded=
 (major=20
253)
[    0.455000] io scheduler noop registered
[    0.460000] io scheduler deadline registered (default)
[    0.465000] samsung-uart s3c2440-uart.0: could not find driver data
[    0.470000] samsung-uart s3c2440-uart.1: could not find driver data
[    0.475000] samsung-uart s3c2440-uart.2: could not find driver data
[    0.505000] brd: module loaded
[    0.510000] physmap platform flash device: 00200000 at 18000000
[    0.515000] physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit ba=
nk.=20
Manufacturer ID 0x000020 Chip ID 0x008813
[    0.520000] Intel/Sharp Extended Query Table at 0x0039
[    0.525000] Intel/Sharp Extended Query Table at 0x0039
[    0.530000] Intel/Sharp Extended Query Table at 0x0039
[    0.535000] Intel/Sharp Extended Query Table at 0x0039
[    0.540000] Intel/Sharp Extended Query Table at 0x0039
[    0.545000] cfi_cmdset_0001: Erase suspend on write enabled
[    0.550000] erase region 0: offset=3D0x0,size=3D0x2000,blocks=3D8
[    0.555000] erase region 1: offset=3D0x10000,size=3D0x10000,blocks=3D=
31
[    0.560000] physmap-flash.0: 1 set(s) of 1 interleaved chips --> 4=20
partitions of 512 KiB
[    0.575000] S3C24XX NAND Driver, (c) 2004 Simtec Electronics
[    0.580000] s3c24xx-nand s3c2440-nand: Tacls=3D1, 10ns Twrph0=3D3 30=
ns,=20
Twrph1=3D2 20ns
[    0.590000] s3c24xx-nand s3c2440-nand: NAND hardware ECC
[    0.595000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xaa (Samsu=
ng NAND=20
256MiB 1,8V 8-bit)
[    0.610000] mousedev: PS/2 mouse device common for all mice
[    0.615000] samsung-ts s3c2440-ts: driver attached, registering inpu=
t=20
device
[    0.620000] input: S3C24XX TouchScreen as /devices/virtual/input/inp=
ut0
[    0.625000] input: PCF50633 PMU events as /devices/virtual/input/inp=
ut1
[    0.635000] pcf50633-rtc pcf50633-rtc: rtc core: registered pcf50633=
-rtc as=20
rtc0
[    0.640000] i2c /dev entries driver
[    0.650000] S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics
[    0.655000] s3c2410-wdt s3c2410-wdt: watchdog inactive, reset disabl=
ed, irq=20
disabled
[    0.660000] cpuidle: using governor ladder
[    0.665000] s3c-sdi s3c2440-sdi: powered down.
[    0.670000] s3c-sdi s3c2440-sdi: mmc0 - using pio, sw SDIO IRQ
[    0.680000] TCP westwood registered
[    0.685000] NET: Registered protocol family 17
[    0.685000] Registering the dns_resolver key type
[    0.695000] turn off boot console earlycon0

It is now waiting for the rootfs that isn't there(since /dev/mmcblk0p1 =
depend=20
on a driver that is not mainline and that I only applied the patch to t=
est on=20
top of the master branch of linux-next).

Tested-by: Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>

Denis.

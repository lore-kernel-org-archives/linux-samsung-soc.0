From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to module init
Date: Thu, 20 Nov 2014 08:41:50 -0800
Message-ID: <7hppchsu29.fsf@deeprootsystems.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36454 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076AbaKTQlz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 11:41:55 -0500
Received: by mail-pd0-f170.google.com with SMTP id fp1so3396289pdb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 08:41:54 -0800 (PST)
In-Reply-To: <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
	(Vivek Gautam's message of "Thu, 20 Nov 2014 12:36:02 +0530")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hi Vivek,

Vivek Gautam <gautamvivek1987@gmail.com> writes:

[...]

> I tested linux-next on Exynos5800 peach-pi board with linux-next and and the two
> patches $Subject and [0].
>
> Below is my git hash:
> 4d9e6ee drm/exynos: Move platform drivers registration to module init
> 4545ed4 POSTED: arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> 36391a5 Add linux-next specific files for 20141119
> 9b1ced1 Merge branch 'akpm/master'
> 282497e mm: add strictlimit knob
>
> With this display works for me.
> Without $Subject patch i get lookup in drm.

The current linux-next (next-20141120) is still not fully booting for
me.  I do see the penguins come up on the display, but it doesn't finish
booting.   Full boot log below.

I'm building using exynos_defconfig with CONFIG_SND_SOC_SNOW=n due to
other errors previously reported.  (Vivek, BTW, I'm curious how your peach-pi
is booting with the audio support enabled.)

Here's how I'm creating the tree, which appears to be the same as what
you guys are doing, but just to be thorough:

$ git reset --hard next/master
HEAD is now at 5b83d7ad9106 Add linux-next specific files for 20141120

$ pwclient git-am 5197701
Applying patch #5197701 using 'git am'
Description: [v2,2/2] arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
Applying: arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy

$ pwclient git-am 5328881
Applying patch #5328881 using 'git am'
Description: [RFC,1/1] drm/exynos: Move platform drivers registration to module init
Applying: drm/exynos: Move platform drivers registration to module init

$ git log --oneline -n5
b16800da58a3 drm/exynos: Move platform drivers registration to module init
87541edf8a17 arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
5b83d7ad9106 Add linux-next specific files for 20141120
fd7e97b09f45 Merge branch 'akpm/master'
11729160b2d7 mm: add strictlimit knob

Kevin


[1] 
Connected to chromebook2 console [channel connected] (~$quit to exit)
(user:khilman) is already connected


# PYBOOT: console: connected.
~$hardreset

Command(chromebook2 console)> hardreset
(user:khilman) Reboot chromebook2
Reboot: chromebook2 ; phidget 4 2 :  ('off', 1, 'on')


U-Boot 2013.04-gb98ed09 (Apr 30 2014 - 16:57:31) for Peach

CPU:Exynos5422@1800MHz

Board: Google Peach Pi, rev 13.6
I2C:   ready
DRAM:  3.5 GiB
PMIC max77802-pmic initialized
CPU:Exynos5422@1800MHz
TPS65090 PMIC EC init
MMC:   EXYNOS DWMMC: 0, EXYNOS DWMMC: 1
SF: Detected W25Q32DW with page size 4 KiB, total 32 MiB
In:    cros-ec-keyb
Out:   serial
Err:   lcd
SF: Detected W25Q32DW with page size 4 KiB, total 32 MiB
ELOG: Event(17) added with size 13
Net:   No ethernet found.
Hit any key to stop autoboot:  2 

# PYBOOT: u-boot: taking control.
 0 
Exynos DP init done
Peach # 
Peach setenv stdout serial
# setenv stdout serialversion

Peach # versionsetenv preboot "usb start; sleep 1"


U-Boot 2013.04-gb98ed09 (Apr 30 2014 - 16:57:31) for Peach
armv7a-cros-linux-gnueabi-gcc.real (4.7.2_cos_gg_c8f69e0) 4.7.x-google 20130114 (prerelease)
GNU ld (binutils-2.22_cos_gg_2) 2.22
Peach # setenv preboot "usb start; sleep 1"setenv bootargs console=tty1 console=ttySAC3,115200 debug earlyprintk rw root=/dev/mmcblk1p3 rootwait rootfstype=ext3

Peach # setenv bootargs console=tty1 console=ttySAC3,115200 debug earlyprintk rw root=/dev/mmcblk1p3 rootwait rootfstype=ext3if test -n ${initenv}; then run initenv; fi

Peach # if test -n ${initenv}; then run initenv; fiif test -n ${preboot}; then run preboot; fi

Peach # if test -n ${preboot}; then run preboot; fisetenv autoload no; setenv autoboot no

(Re)start USB...
USB0:   Register 2000140 NbrPorts 2
Starting the controller
USB XHCI 1.00
scanning bus 0 for devices... 2 USB Device(s) found
USB1:   Register 2000140 NbrPorts 2
Starting the controller
USB XHCI 1.00
scanning bus 1 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
       scanning usb for ethernet devices... 1 Ethernet Device(s) found
Peach # dhcp
dhcp
Waiting for Ethernet connection... done.
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 192.168.1.110
Peach # setenv serverip 192.168.1.2
setenv serverip 192.168.1.2
Peach # if test -n ${netargs}; then run netargs; fi
if test -n ${netargs}; then run netargs; fi
Peach # tftp 0x41000000 192.168.1.2:tmp/chromebook2-3T8ptb/uImage-48m8WK
tftp 0x41000000 192.168.1.2:tmp/chromebook2-3T8ptb/uImage-48m8WK
Using asx0 device
TFTP from server 192.168.1.2; our IP address is 192.168.1.110
Filename 'tmp/chromebook2-3T8ptb/uImage-48m8WK'.
Load address: 0x41000000
Loading: *#################################################################
 #################################################################
 #################################################################
 ##########################################
 1.2 MiB/s
done
Bytes transferred = 3473930 (35020a hex)
Peach # printenv bootargs
printenv bootargs
bootargs=console=tty1 console=ttySAC3,115200 debug earlyprintk rw root=/dev/mmcblk1p3 rootwait rootfstype=ext3
Peach # bootm 0x41000000  

# PYBOOT: u-boot: jumping to kernel image
bootm 0x41000000  
## Booting kernel from Legacy Image at 41000000 ...
   Image Name:   Linux
   Created:      2014-11-20  16:21:32 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3473866 Bytes = 3.3 MiB
   Load Address: 41000000
   Entry Point:  41000040
   Verifying Checksum ... OK
   XIP Kernel Image ... OK

Starting kernel ...

Timer summary in microseconds:
       Mark    Elapsed  Stage
          0          0  reset
  4,305,689  4,305,689  board_init_f
  4,398,948     93,259  board_init_r
  4,550,725    151,777  id=64
  4,552,531      1,806  main_loop
  6,386,676  1,834,145  usb_start
 10,173,649  3,786,973  id=80
 10,173,649          0  eth_start
 10,728,307    554,658  bootp_start
 14,324,489  3,596,182  bootp_stop
 14,324,495          6  id=81
 14,324,622        127  id=82
 14,658,846    334,224  tftp_start
 17,453,672  2,794,826  tftp_done
 17,453,672          0  id=84
 17,679,605    225,933  bootm_start
 17,679,607          2  id=1
 17,684,369      4,762  id=2
 17,684,371          2  id=3
 17,731,321     46,950  id=5
 17,731,321          0  id=4
 17,731,322          1  id=6
 17,731,324          2  id=14
 17,736,845      5,521  id=7
 17,737,009        164  id=15
 17,739,102      2,093  start_kernel

Accumulated time:
                 7,015  SPI read
cleanup_before_linux_select: Console recording failed (1)
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.18.0-rc5-next-20141120-07674-gb16800da58a3 (khilman@paris) (gcc version 4.7.3 (Ubuntu/Linaro 4.7.3-12ubuntu1) ) #7 SMP PREEMPT Thu Nov 20 08:21:03 PST 2014
[    0.000000] CPU: ARMv7 Processor [412fc0f3] revision 3 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] Machine model: Google Peach Pi Rev 10+
[    0.000000] Ignoring memory range 0x20000000 - 0x40000000
[    0.000000] cma: Reserved 64 MiB at 0xfbc00000
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] On node 0 totalpages: 786431
[    0.000000] free_area_init_node: node 0, pgdat c06b4380, node_mem_map edff6000
[    0.000000]   Normal zone: 1520 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 194560 pages, LIFO batch:31
[    0.000000]   HighMem zone: 4624 pages used for memmap
[    0.000000]   HighMem zone: 591871 pages, LIFO batch:31
[    0.000000] PERCPU: Embedded 9 pages/cpu @edf6c000 s7616 r8192 d21056 u36864
[    0.000000] pcpu-alloc: s7616 r8192 d21056 u36864 alloc=9*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 784911
[    0.000000] Kernel command line: console=tty1 console=ttySAC3,115200 debug earlyprintk rw root=/dev/mmcblk1p3 rootwait rootfstype=ext3
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 3047236K/3145724K available (4561K kernel code, 211K rwdata, 1584K rodata, 300K init, 284K bss, 32952K reserved, 65536K cma-reserved, 2301948K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc06086d0   (6146 kB)
[    0.000000]       .init : 0xc0609000 - 0xc0654000   ( 300 kB)
[    0.000000]       .data : 0xc0654000 - 0xc0688cc0   ( 212 kB)
[    0.000000]        .bss : 0xc0688cc0 - 0xc06cff04   ( 285 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] GIC physical location is 0x10481000
[    0.000000] L2C: failed to init: -19
[    0.000000] Switching to timer-based delay loop, resolution 41ns
[    0.000003] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns
[    0.000207] Console: colour dummy device 80x30
[    0.000422] console [tty1] enabled
[    0.000440] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=120000)
[    0.000457] pid_max: default: 32768 minimum: 301
[    0.000566] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000578] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000955] CPU: Testing write buffer coherency: ok
[    0.001166] CPU0: update cpu_capacity 1535
[    0.001177] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.001277] Setting up static identity map for 0x404528b8 - 0x40452910
[    0.001435] ARM CCI driver probed
[    0.001851] Exynos MCPM support installed
[    0.030221] CPU1: Booted secondary processor
[    0.030256] CPU1: update cpu_capacity 1535
[    0.030259] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.040216] CPU2: Booted secondary processor
[    0.040241] CPU2: update cpu_capacity 1535
[    0.040245] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.050210] CPU3: Booted secondary processor
[    0.050236] CPU3: update cpu_capacity 1535
[    0.050240] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.060246] CPU4: Booted secondary processor
[    0.060345] CPU4: update cpu_capacity 448
[    0.060355] CPU4: thread -1, cpu 0, socket 1, mpidr 80000100
[    0.070236] CPU5: Booted secondary processor
[    0.070299] CPU5: update cpu_capacity 448
[    0.070309] CPU5: thread -1, cpu 1, socket 1, mpidr 80000101
[    0.080241] CPU6: Booted secondary processor
[    0.080303] CPU6: update cpu_capacity 448
[    0.080312] CPU6: thread -1, cpu 2, socket 1, mpidr 80000102
[    0.090238] CPU7: Booted secondary processor
[    0.090301] CPU7: update cpu_capacity 448
[    0.090310] CPU7: thread -1, cpu 3, socket 1, mpidr 80000103
[    0.090381] Brought up 8 CPUs
[    0.090489] SMP: Total of 8 processors activated.
[    0.090498] CPU: All CPU(s) started in SVC mode.
[    0.090976] devtmpfs: initialized
[    0.096059] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.097372] pinctrl core: initialized pinctrl subsystem
[    0.111449] NET: Registered protocol family 16
[    0.112426] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.116449] gpiochip_add: registered GPIOs 0 to 7 on device: gpy7
[    0.116465] gpiochip_add: registered GPIOs 8 to 15 on device: gpx0
[    0.116477] gpiochip_add: registered GPIOs 16 to 23 on device: gpx1
[    0.116490] gpiochip_add: registered GPIOs 24 to 31 on device: gpx2
[    0.116502] gpiochip_add: registered GPIOs 32 to 39 on device: gpx3
[    0.117286] gpiochip_add: registered GPIOs 40 to 47 on device: gpc0
[    0.117300] gpiochip_add: registered GPIOs 48 to 55 on device: gpc1
[    0.117312] gpiochip_add: registered GPIOs 56 to 62 on device: gpc2
[    0.117324] gpiochip_add: registered GPIOs 63 to 66 on device: gpc3
[    0.117336] gpiochip_add: registered GPIOs 67 to 68 on device: gpc4
[    0.117347] gpiochip_add: registered GPIOs 69 to 76 on device: gpd1
[    0.117359] gpiochip_add: registered GPIOs 77 to 82 on device: gpy0
[    0.117371] gpiochip_add: registered GPIOs 83 to 86 on device: gpy1
[    0.117382] gpiochip_add: registered GPIOs 87 to 92 on device: gpy2
[    0.117394] gpiochip_add: registered GPIOs 93 to 100 on device: gpy3
[    0.117406] gpiochip_add: registered GPIOs 101 to 108 on device: gpy4
[    0.117418] gpiochip_add: registered GPIOs 109 to 116 on device: gpy5
[    0.117430] gpiochip_add: registered GPIOs 117 to 124 on device: gpy6
[    0.117953] gpiochip_add: registered GPIOs 125 to 132 on device: gpe0
[    0.117967] gpiochip_add: registered GPIOs 133 to 134 on device: gpe1
[    0.117979] gpiochip_add: registered GPIOs 135 to 140 on device: gpf0
[    0.117991] gpiochip_add: registered GPIOs 141 to 148 on device: gpf1
[    0.118003] gpiochip_add: registered GPIOs 149 to 156 on device: gpg0
[    0.118015] gpiochip_add: registered GPIOs 157 to 164 on device: gpg1
[    0.118027] gpiochip_add: registered GPIOs 165 to 166 on device: gpg2
[    0.118039] gpiochip_add: registered GPIOs 167 to 170 on device: gpj4
[    0.118540] gpiochip_add: registered GPIOs 171 to 178 on device: gpa0
[    0.118554] gpiochip_add: registered GPIOs 179 to 184 on device: gpa1
[    0.118567] gpiochip_add: registered GPIOs 185 to 192 on device: gpa2
[    0.118579] gpiochip_add: registered GPIOs 193 to 197 on device: gpb0
[    0.118591] gpiochip_add: registered GPIOs 198 to 202 on device: gpb1
[    0.118603] gpiochip_add: registered GPIOs 203 to 206 on device: gpb2
[    0.118615] gpiochip_add: registered GPIOs 207 to 214 on device: gpb3
[    0.118627] gpiochip_add: registered GPIOs 215 to 216 on device: gpb4
[    0.118639] gpiochip_add: registered GPIOs 217 to 224 on device: gph0
[    0.119217] gpiochip_add: registered GPIOs 225 to 231 on device: gpz
[    0.120479] exynos-audss-clk 3810000.audss-clock-controller: setup completed
[    0.126118] EXYNOS5420 PMU initialized
[    0.156206] of_get_named_gpiod_flags: parsed 'gpio' property of node '/regulator-usb300[0]' - status (0)
[    0.156512] of_get_named_gpiod_flags: parsed 'gpio' property of node '/regulator-usb301[0]' - status (0)
[    0.156776] of_get_named_gpiod_flags: can't parse 'gpio' property of node '/fixed-regulator[0]'
[    0.158438] SCSI subsystem initialized
[    0.158872] usbcore: registered new interface driver usbfs
[    0.158975] usbcore: registered new interface driver hub
[    0.159130] usbcore: registered new device driver usb
[    0.159709] s3c-i2c 12c80000.i2c: slave address 0x50
[    0.159725] s3c-i2c 12c80000.i2c: bus frequency set to 65 KHz
[    0.159914] s3c-i2c 12c80000.i2c: i2c-2: S3C I2C adapter
[    0.162839] Advanced Linux Sound Architecture Driver Initialized.
[    0.163593] Switched to clocksource mct-frc
[    0.176435] NET: Registered protocol family 2
[    0.176856] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.176918] TCP bind hash table entries: 8192 (order: 5, 163840 bytes)
[    0.177018] TCP: Hash tables configured (established 8192 bind 8192)
[    0.177062] TCP: reno registered
[    0.177076] UDP hash table entries: 512 (order: 2, 24576 bytes)
[    0.177104] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes)
[    0.177273] NET: Registered protocol family 1
[    0.179435] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.192091] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    0.192701] bounce: pool size: 64 pages
[    0.192714] io scheduler noop registered
[    0.192726] io scheduler deadline registered
[    0.193141] io scheduler cfq registered (default)
[    0.193770] exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]
[    0.193797] exynos-mipi-video-phy: probe of 10040714.video-phy failed with error -16
[    0.196533] pwm-backlight backlight: GPIO lookup for consumer enable
[    0.196547] pwm-backlight backlight: using device tree for GPIO lookup
[    0.196563] of_get_named_gpiod_flags: parsed 'enable-gpios' property of node '/backlight[0]' - status (0)
[    0.196615] platform backlight: Driver pwm-backlight requests probe deferral
[    0.199040] dma-pl330 3880000.adma: Loaded driver for PL330 DMAC-241330
[    0.199056] dma-pl330 3880000.adma: DBUFF-4x8bytes Num_Chans-6 Num_Peri-16 Num_Events-6
[    0.203061] dma-pl330 121a0000.pdma: Loaded driver for PL330 DMAC-241330
[    0.203077] dma-pl330 121a0000.pdma: DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.207134] dma-pl330 121b0000.pdma: Loaded driver for PL330 DMAC-241330
[    0.207149] dma-pl330 121b0000.pdma: DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.208279] dma-pl330 10800000.mdma: Loaded driver for PL330 DMAC-241330
[    0.208293] dma-pl330 10800000.mdma: DBUFF-64x8bytes Num_Chans-8 Num_Peri-1 Num_Events-32
[    0.286988] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.288461] samsung-uart 12c00000.serial: ttySAC0 at MMIO 0x12c00000 (irq = 83, base_baud = 0) is a S3C6400/10
[    0.288863] samsung-uart 12c10000.serial: ttySAC1 at MMIO 0x12c10000 (irq = 84, base_baud = 0) is a S3C6400/10
[    0.289379] samsung-uart 12c20000.serial: ttySAC2 at MMIO 0x12c20000 (irq = 85, base_baud = 0) is a S3C6400/10
[    0.289742] samsung-uart 12c30000.serial: ttySAC3 at MMIO 0x12c30000 (irq = 86, base_baud = 0) is a S3C6400/10
[    1.290234] console [ttySAC3] enabled
[    1.294923] [drm] Initialized drm 1.1.0 20060810
[    1.299061] platform 145b0000.dp-controller: Driver exynos-dp requests probe deferral
[    1.306789] platform panel: Driver panel-simple requests probe deferral
[    1.313174] error detecting cacheinfo..cpu0
[    1.324075] brd: module loaded
[    1.329303] loop: module loaded
[    1.331533] of_get_named_gpiod_flags: parsed 'cs-gpios' property of node '/spi@12d40000[0]' - status (0)
[    1.341346] cros-ec-spi spi2.0: Chrome EC device registered
[    1.346397] usbcore: registered new interface driver asix
[    1.351422] usbcore: registered new interface driver ax88179_178a
[    1.357544] usbcore: registered new interface driver cdc_ether
[    1.363317] usbcore: registered new interface driver smsc75xx
[    1.369045] usbcore: registered new interface driver smsc95xx
[    1.374756] usbcore: registered new interface driver net1080
[    1.380386] usbcore: registered new interface driver cdc_subset
[    1.386286] usbcore: registered new interface driver zaurus
[    1.391878] usbcore: registered new interface driver cdc_ncm
[    1.398031] usb@12000000 supply vdd33 not found, using dummy regulator
[    1.403982] usb@12000000 supply vdd10 not found, using dummy regulator
[    1.811857] usb@12400000 supply vdd33 not found, using dummy regulator
[    1.816963] usb@12400000 supply vdd10 not found, using dummy regulator
[    2.224710] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    2.228756] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 1
[    2.236621] xhci-hcd xhci-hcd.2.auto: irq 104, io mem 0x12000000
[    2.242490] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    2.249121] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.256319] usb usb1: Product: xHCI Host Controller
[    2.261175] usb usb1: Manufacturer: Linux 3.18.0-rc5-next-20141120-07674-gb16800da58a3 xhci-hcd
[    2.269853] usb usb1: SerialNumber: xhci-hcd.2.auto
[    2.275268] hub 1-0:1.0: USB hub found
[    2.278441] hub 1-0:1.0: 1 port detected
[    2.282685] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    2.287821] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 2
[    2.295593] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    2.302211] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.309412] usb usb2: Product: xHCI Host Controller
[    2.314266] usb usb2: Manufacturer: Linux 3.18.0-rc5-next-20141120-07674-gb16800da58a3 xhci-hcd
[    2.322944] usb usb2: SerialNumber: xhci-hcd.2.auto
[    2.328340] hub 2-0:1.0: USB hub found
[    2.331548] hub 2-0:1.0: 1 port detected
[    2.335826] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    2.340919] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
[    2.348798] xhci-hcd xhci-hcd.5.auto: irq 105, io mem 0x12400000
[    2.354637] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002
[    2.361287] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.368487] usb usb3: Product: xHCI Host Controller
[    2.373343] usb usb3: Manufacturer: Linux 3.18.0-rc5-next-20141120-07674-gb16800da58a3 xhci-hcd
[    2.382073] usb usb3: SerialNumber: xhci-hcd.5.auto
[    2.387408] hub 3-0:1.0: USB hub found
[    2.390625] hub 3-0:1.0: 1 port detected
[    2.394842] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    2.399989] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
[    2.407752] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003
[    2.414379] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.421578] usb usb4: Product: xHCI Host Controller
[    2.426433] usb usb4: Manufacturer: Linux 3.18.0-rc5-next-20141120-07674-gb16800da58a3 xhci-hcd
[    2.435208] usb usb4: SerialNumber: xhci-hcd.5.auto
[    2.440516] hub 4-0:1.0: USB hub found
[    2.443716] hub 4-0:1.0: 1 port detected
[    2.447956] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.454113] ehci-exynos: EHCI EXYNOS driver
[    2.458394] of_get_named_gpiod_flags: can't parse 'samsung,vbus-gpio' property of node '/usb@12110000[0]'
[    2.468000] exynos-ehci 12110000.usb: EHCI Host Controller
[    2.473299] exynos-ehci 12110000.usb: new USB bus registered, assigned bus number 5
[    2.481187] exynos-ehci 12110000.usb: irq 103, io mem 0x12110000
[    2.588636] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[    2.603619] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    2.608276] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002
[    2.614936] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.622134] usb usb5: Product: EHCI Host Controller
[    2.626990] usb usb5: Manufacturer: Linux 3.18.0-rc5-next-20141120-07674-gb16800da58a3 ehci_hcd
[    2.635668] usb usb5: SerialNumber: 12110000.usb
[    2.640818] hub 5-0:1.0: USB hub found
[    2.644012] hub 5-0:1.0: 3 ports detected
[    2.648547] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.654158] ohci-exynos: OHCI EXYNOS driver
[    2.658475] exynos-ohci 12120000.usb: USB Host Controller
[    2.663736] exynos-ohci 12120000.usb: new USB bus registered, assigned bus number 6
[    2.671405] exynos-ohci 12120000.usb: irq 103, io mem 0x12120000
[    2.732742] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
[    2.738084] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.745923] usb usb6: Product: USB Host Controller
[    2.750054] usb usb6: Manufacturer: Linux 3.18.0-rc5-next-20141120-07674-gb16800da58a3 ohci_hcd
[    2.758732] usb usb6: SerialNumber: 12120000.usb
[    2.763856] hub 6-0:1.0: USB hub found
[    2.767059] hub 6-0:1.0: 3 ports detected
[    2.771678] usbcore: registered new interface driver usb-storage
[    2.777028] usb 1-1: New USB device found, idVendor=0b95, idProduct=7720
[    2.783700] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    2.790857] usb 1-1: Product: AX88x72A
[    2.794567] usb 1-1: Manufacturer: ASIX Elec. Corp.
[    2.794605] mousedev: PS/2 mouse device common for all mice
[    2.796075] input: cros-ec-spi as /devices/platform/12d40000.spi/spi_master/spi2/spi2.0/cros-ec-keyb.1/input/input0
[    2.811973] s3c-rtc 101e0000.rtc: rtc core: registered s3c as rtc0
[    2.812999] i2c /dev entries driver
[    2.824990] usb 1-1: SerialNumber: 000001
[    2.829605] max77686 4-0009: Failed to find supply inb1
[    2.834312] max77802-pmic max77802-pmic: regulator init failed for 0
[    2.840650] platform max77802-pmic: Driver max77802-pmic requests probe deferral
[    2.850725] rtc (null): read_time: fail to read
[    2.853968] max77802-rtc max77802-rtc: rtc core: registered max77802-rtc as rtc1
[    2.883960] atmel_mxt_ts 8-004b: Direct firmware load for maxtouch.cfg failed with error -2
[    2.891137] atmel_mxt_ts 8-004b: Invalid object type T9
[    2.896087] atmel_mxt_ts 8-004b: Failed to initialize T9 resolution
[    2.902579] input: Atmel maXTouch Touchpad as /devices/platform/12e00000.i2c/i2c-8/8-004b/input/input1
[    2.911682] tpm_i2c_infineon 9-0020: 1.2 TPM (device-id 0x1A)
[    2.912243] atmel_mxt_ts 8-004b: Family: 130 Variant: 44 Firmware V3.0.AA Objects: 34
[    3.025430] tps65090 20-0048: No cache defaults, reading back from HW
[    3.035231] of_get_named_gpiod_flags: can't parse 'dcdc-ext-control-gpios' property of node '/spi@12d40000/cros-ec@0/i2c-tunnel/power-regulator@48[0]'
[    3.047242] of_get_named_gpiod_flags: can't parse 'dcdc-ext-control-gpios' property of node '/spi@12d40000/cros-ec@0/i2c-tunnel/power-regulator@48[0]'
[    3.060701] of_get_named_gpiod_flags: can't parse 'dcdc-ext-control-gpios' property of node '/spi@12d40000/cros-ec@0/i2c-tunnel/power-regulator@48[0]'
[    3.074284] TPS65090_RAILSDCDC1: supplied by vbat-supply
[    3.081034] TPS65090_RAILSDCDC2: supplied by vbat-supply
[    3.086488] TPS65090_RAILSDCDC3: supplied by vbat-supply
[    3.091938] vcd_led: supplied by vbat-supply
[    3.099456] video_mid: supplied by TPS65090_RAILSDCDC1
[    3.107815] wwan_r: supplied by TPS65090_RAILSDCDC2
[    3.115909] sdcard: supplied by TPS65090_RAILSDCDC2
[    3.120934] camout: supplied by TPS65090_RAILSDCDC2
[    3.125944] lcd_vdd: supplied by TPS65090_RAILSDCDC2
[    3.134130] video_mid_1a: supplied by TPS65090_RAILSDCDC1
[    3.139677] TPS65090_RAILSLDO1: supplied by vbat-supply
[    3.143639] TPS65090_RAILSLDO2: supplied by vbat-supply
[    3.251129] sbs-battery 20-000b: sbs-battery: battery gas gauge device registered
[    3.266644] 10060000.tmu supply vtmu not found, using dummy regulator
[    3.271971] exynos-tmu 10060000.tmu: Exynos: Thermal zone(therm_zone0) registered
[    3.279157] 10064000.tmu supply vtmu not found, using dummy regulator
[    3.285818] exynos-tmu 10064000.tmu: Exynos: Thermal zone(therm_zone0) registered
[    3.293033] 10068000.tmu supply vtmu not found, using dummy regulator
[    3.299860] exynos-tmu 10068000.tmu: Exynos: Thermal zone(therm_zone0) registered
[    3.307074] 1006c000.tmu supply vtmu not found, using dummy regulator
[    3.313640] exynos-tmu 1006c000.tmu: Exynos: Thermal zone(therm_zone0) registered
[    3.320779] 100a0000.tmu supply vtmu not found, using dummy regulator
[    3.327474] exynos-tmu 100a0000.tmu: Exynos: Thermal zone(therm_zone0) registered
[    3.335310] s3c2410-wdt 101d0000.watchdog: watchdog inactive, reset disabled, irq disabled
[    3.343888] device-mapper: ioctl: 4.29.0-ioctl (2014-10-28) initialised: dm-devel@redhat.com
[    3.351289] Driver 'mmcblk' needs updating - please use bus_type methods
[    3.358002] sdhci: Secure Digital Host Controller Interface driver
[    3.364111] sdhci: Copyright(c) Pierre Ossman
[    3.368671] Synopsys Designware Multimedia Card Interface Driver
[    3.375015] dwmmc_exynos 12200000.mmc: IDMAC supports 32-bit address mode.
[    3.381339] dwmmc_exynos 12200000.mmc: Using internal DMA controller.
[    3.387718] dwmmc_exynos 12200000.mmc: Version ID is 250a
[    3.393098] dwmmc_exynos 12200000.mmc: DW MMC controller at irq 107, 64 bit host data width, 64 deep fifo
[    3.402657] dwmmc_exynos 12200000.mmc: No vmmc regulator found
[    3.408443] dwmmc_exynos 12200000.mmc: No vqmmc regulator found
[    3.414354] dwmmc_exynos 12200000.mmc: GPIO lookup for consumer wp
[    3.420498] dwmmc_exynos 12200000.mmc: using device tree for GPIO lookup
[    3.427188] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of node '/mmc@12200000[0]'
[    3.435950] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of node '/mmc@12200000[0]'
[    3.444624] dwmmc_exynos 12200000.mmc: using lookup tables for GPIO lookup
[    3.451470] dwmmc_exynos 12200000.mmc: lookup for GPIO wp failed
[    3.483680] dwmmc_exynos 12200000.mmc: 1 slots initialized
[    3.488103] dwmmc_exynos 12220000.mmc: IDMAC supports 32-bit address mode.
[    3.494612] dwmmc_exynos 12220000.mmc: Using internal DMA controller.
[    3.500992] dwmmc_exynos 12220000.mmc: Version ID is 250a
[    3.506375] dwmmc_exynos 12220000.mmc: DW MMC controller at irq 109, 64 bit host data width, 64 deep fifo
[    3.515910] dwmmc_exynos 12220000.mmc: No vmmc regulator found
[    3.521703] dwmmc_exynos 12220000.mmc: No vqmmc regulator found
[    3.527609] dwmmc_exynos 12220000.mmc: GPIO lookup for consumer cd
[    3.531539] mmc0: BKOPS_EN bit is not set
[    3.535286] mmc_host mmc0: Bus speed (slot 0) = 200000000Hz (slot req 200000000Hz, actual 200000000HZ div = 0)
[    3.536232] mmc0: new HS200 MMC card at address 0001
[    3.537231] mmcblk0: mmc0:0001 MAG2GC 14.5 GiB 
[    3.537441] mmcblk0boot0: mmc0:0001 MAG2GC partition 1 4.00 MiB
[    3.537655] mmcblk0boot1: mmc0:0001 MAG2GC partition 2 4.00 MiB
[    3.537854] mmcblk0rpmb: mmc0:0001 MAG2GC partition 3 4.00 MiB
[    3.551363] GPT:partition_entry_array_crc32 values don't match: 0xf4d0e732 != 0x86775d22
[    3.551370] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    3.551376] GPT:29999999 != 30535679
[    3.551382] GPT:Alternate GPT header not at the end of the disk.
[    3.551389] GPT:29999999 != 30535679
[    3.551395] GPT: Use GNU Parted to correct GPT errors.
[    3.551422]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    3.614094] dwmmc_exynos 12220000.mmc: using device tree for GPIO lookup
[    3.620773] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of node '/mmc@12220000[0]'
[    3.629539] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of node '/mmc@12220000[0]'
[    3.638211] dwmmc_exynos 12220000.mmc: using lookup tables for GPIO lookup
[    3.645065] dwmmc_exynos 12220000.mmc: lookup for GPIO cd failed
[    3.651050] dwmmc_exynos 12220000.mmc: GPIO lookup for consumer wp
[    3.657205] dwmmc_exynos 12220000.mmc: using device tree for GPIO lookup
[    3.658085] asix 1-1:1.0 eth0: register 'asix' at usb-xhci-hcd.2.auto-1, ASIX AX88772 USB 2.0 Ethernet, c8:b3:73:43:e9:b9
[    3.674823] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of node '/mmc@12220000[0]'
[    3.683617] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of node '/mmc@12220000[0]'
[    3.692257] dwmmc_exynos 12220000.mmc: using lookup tables for GPIO lookup
[    3.699111] dwmmc_exynos 12220000.mmc: lookup for GPIO wp failed
[    3.733664] dwmmc_exynos 12220000.mmc: 1 slots initialized
[    3.739415] usbcore: registered new interface driver usbhid
[    3.743517] usbhid: USB HID core driver
[    3.748081] exynos-adc 12d10000.adc: failed getting regulator, err = -517
[    3.754135] platform 12d10000.adc: Driver exynos-adc requests probe deferral
[    3.762066] TCP: cubic registered
[    3.764438] NET: Registered protocol family 17
[    3.768886] NET: Registered protocol family 15
[    3.773550] Registering SWP/SWPB emulation handler
[    3.778072] big.LITTLE switcher initializing
[    3.782310] CPU0 paired with CPU7
[    3.785595] CPU1 paired with CPU6
[    3.788890] CPU2 paired with CPU5
[    3.792172] CPU3 paired with CPU4
[    3.795494] GIC ID for CPU 0 cluster 0 is 0
[    3.799658] GIC ID for CPU 1 cluster 0 is 1
[    3.803826] GIC ID for CPU 2 cluster 0 is 2
[    3.807972] GIC ID for CPU 3 cluster 0 is 3
[    3.812151] GIC ID for CPU 0 cluster 1 is 4
[    3.827347] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
[    3.835688] mmc1: new high speed SDHC card at address e624
[    3.841376] mmcblk1: mmc1:e624 SU08G 7.40 GiB 
[    3.857069] GPT:partition_entry_array_crc32 values don't match: 0x979ea85d != 0x1ccb76fa
[    3.863709] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    3.871073] GPT:5058495 != 15523839
[    3.874839] IRQ160 no longer affine to CPU4
[    3.875257] GPT:Alternate GPT header not at the end of the disk.
[    3.875303] CPU4: shutdown
[    3.884607] GIC ID for CPU 1 cluster 1 is 5
[    3.891535] GPT:5058495 != 15523839
[    3.895003] GPT: Use GNU Parted to correct GPT errors.
[    3.900139]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    3.933996] IRQ161 no longer affine to CPU5
[    3.934391] CPU5: shutdown
[    3.940131] GIC ID for CPU 2 cluster 1 is 6
[    3.988990] IRQ162 no longer affine to CPU6
[    3.989370] CPU6: shutdown
[    3.995155] GIC ID for CPU 3 cluster 1 is 7
[    4.028971] IRQ163 no longer affine to CPU7
[    4.029350] CPU7: shutdown
[    4.035302] big.LITTLE switcher initialized
[    4.039809] pwm-backlight backlight: GPIO lookup for consumer enable
[    4.045278] pwm-backlight backlight: using device tree for GPIO lookup
[    4.051796] of_get_named_gpiod_flags: parsed 'enable-gpios' property of node '/backlight[0]' - status (0)
[    4.063753] platform 145b0000.dp-controller: Driver exynos-dp requests probe deferral
[    4.070327] panel-simple panel: GPIO lookup for consumer enable
[    4.076034] panel-simple panel: using device tree for GPIO lookup
[    4.082108] of_get_named_gpiod_flags: can't parse 'enable-gpios' property of node '/panel[0]'
[    4.090597] of_get_named_gpiod_flags: can't parse 'enable-gpio' property of node '/panel[0]'
[    4.099010] panel-simple panel: using lookup tables for GPIO lookup
[    4.105255] panel-simple panel: lookup for GPIO enable failed
[    4.113333] vdd_mif: supplied by TPS65090_RAILSDCDC2
[    4.117352] vdd_arm: supplied by TPS65090_RAILSDCDC1
[    4.122279] vdd_int: supplied by TPS65090_RAILSDCDC2
[    4.127232] vdd_g3d: supplied by TPS65090_RAILSDCDC2
[    4.132154] vdd_1v2: supplied by TPS65090_RAILSDCDC1
[    4.137105] vdd_kfc: supplied by TPS65090_RAILSDCDC2
[    4.142049] vdd_1v35: supplied by TPS65090_RAILSDCDC1
[    4.147072] vdd_emmc: supplied by TPS65090_RAILSDCDC1
[    4.152109] vdd_2v: supplied by TPS65090_RAILSDCDC1
[    4.156963] vdd_1v8: supplied by TPS65090_RAILSDCDC1
[    4.161788] vdd_1v0: supplied by vdd_1v35
[    4.165779] vdd_1v2_2: supplied by vdd_1v35
[    4.169941] vdd_1v8_3: supplied by vdd_2v
[    4.173942] vdd_sd: supplied by TPS65090_RAILSDCDC2
[    4.178770] vdd_1v8_5: supplied by vdd_2v
[    4.182762] vdd_1v8_6: supplied by vdd_2v
[    4.186769] vdd_1v8_7: supplied by vdd_2v
[    4.190761] vdd_ldo8: supplied by vdd_1v2
[    4.194755] vdd_ldo9: supplied by vdd_2v
[    4.198670] vdd_ldo10: supplied by vdd_2v
[    4.202625] vdd_ldo11: supplied by vdd_2v
[    4.206635] vdd_ldo12: supplied by TPS65090_RAILSDCDC2
[    4.211751] vdd_ldo13: supplied by vdd_2v
[    4.215748] vdd_ldo14: supplied by vdd_2v
[    4.219733] vdd_ldo15: supplied by vdd_1v2
[    4.223794] vdd_g3ds: supplied by vdd_1v35
[    4.227880] ldo_18: supplied by vdd_2v
[    4.231613] ldo_19: supplied by vdd_2v
[    4.235361] ldo_20: supplied by vdd_2v
[    4.239079] ldo_21: supplied by TPS65090_RAILSDCDC2
[    4.243946] ldo_23: supplied by TPS65090_RAILSDCDC2
[    4.248783] ldo_24: supplied by TPS65090_RAILSDCDC2
[    4.253664] ldo_25: supplied by TPS65090_RAILSDCDC2
[    4.258499] ldo_26: supplied by TPS65090_RAILSDCDC2
[    4.263366] ldo_27: supplied by vdd_1v35
[    4.267267] ldo_28: supplied by vdd_2v
[    4.271011] ldo_29: supplied by vdd_2v
[    4.274730] vdd_mifs: supplied by vdd_1v35
[    4.278805] ldo_32: supplied by TPS65090_RAILSDCDC2
[    4.283678] ldo_33: supplied by TPS65090_RAILSDCDC2
[    4.288508] ldo_34: supplied by TPS65090_RAILSDCDC2
[    4.293386] ldo_35: supplied by vdd_1v35
[    4.299000] exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
[    4.304899] of_get_named_gpiod_flags: parsed 'samsung,hpd-gpio' property of node '/dp-controller@145B0000[0]' - status (0)
[    4.316443] exynos-drm exynos-drm: bound 145b0000.dp-controller (ops exynos_dp_ops)
[    4.323493] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.330082] [drm] No driver support for vblank timestamp query.
[    4.454614] exynos-dp 145b0000.dp-controller: EDID data does not include any extensions.
[    4.459609] exynos-dp 145b0000.dp-controller: EDID Read success!
[    4.461703] exynos-dp 145b0000.dp-controller: Link Training Clock Recovery success
[    4.463329] exynos-dp 145b0000.dp-controller: Link Training success!
[    4.547638] exynos-dp 145b0000.dp-controller: EDID data does not include any extensions.
[    4.552681] exynos-dp 145b0000.dp-controller: EDID Read success!
[    4.554768] exynos-dp 145b0000.dp-controller: Link Training Clock Recovery success
[    4.556392] exynos-dp 145b0000.dp-controller: Link Training success!
[    4.605445] Console: switching to colour frame buffer device 274x77
[    4.676011] exynos-drm exynos-drm: fb0:  frame buffer device
[    4.681645] exynos-drm exynos-drm: registered panic notifier
[    4.698616] [drm] Initialized exynos 1.0.0 20110530 on minor 0
[    4.703221] of_get_named_gpiod_flags: parsed 'gpios' property of node '/gpio-keys/power[0]' - status (0)
[    4.712549] gpio-18 (Power): gpiod_set_debounce: missing set() or set_debounce() operations
[    4.712701] power-domain: Power-off latency exceeded, new value 188750 ns
[    4.712944] power-domain: Power-off latency exceeded, new value 220333 ns
[    4.712968] power-domain: Power-off latency exceeded, new value 192042 ns
[    4.713303] power-domain: Power-off latency exceeded, new value 313000 ns
[    4.748143] input: gpio-keys as /devices/platform/gpio-keys/input/input2
[    4.754881] s3c-rtc 101e0000.rtc: setting system clock to 2014-11-19 16:02:50 UTC (1416412970)
[    4.785110] TPS65090_RAILSLDO2: disabling
[    4.787671] TPS65090_RAILSLDO1: disabling
[    4.793747] TPS65090_RAILSDCDC3: disabling
~$off
# PYBOOT: Exception: kernel: ERROR: failed to boot: <class 'pexpect.TIMEOUT'>
# PYBOOT: Time: 112.26 seconds.
# PYBOOT: Result: FAIL

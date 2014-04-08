From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: AFTR does not work on arndale 5250
Date: Tue, 08 Apr 2014 16:27:41 +0200
Message-ID: <5344075D.2030203@linaro.org>
References: <533EAE57.1080202@linaro.org>	<5343D709.10708@samsung.com> <CAGm_ybjL-oA_C=VH4MMt_X45hrdKt8GMkwQtq5EJ94TvA4iqYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:56550 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757274AbaDHO1Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 10:27:25 -0400
Received: by mail-wg0-f42.google.com with SMTP id y10so1033357wgg.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 07:27:23 -0700 (PDT)
In-Reply-To: <CAGm_ybjL-oA_C=VH4MMt_X45hrdKt8GMkwQtq5EJ94TvA4iqYw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, sunil joshi <joshi@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>

On 04/08/2014 03:32 PM, Vikas Sajjan wrote:
>   Hi Daniel,
>
>   I checked AFTR on v3.14 (
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/?=
id=3Drefs/tags/v3.14)
>   on exynos5250 based chromebook (exynos5250-snow.dtb)
>
> I am able to hotplug CPU1  (echo 0 > /sys/devices/system/cpu/cpu1/onl=
ine).
> I can see, it enters exynos4_enter_core0_aftr() when I hotplug CPU1.

Hi,

thanks a lot for your help.

I reproduced it on my arndale board with linux-samsung/for-next and on=20
v3.14.

Used the exynos_defconfig, enabled cpuidle and used exynos5250-arndale.=
dtb.

I unplugged the cpu1 and then =3D> reboot

echo 0 > /sys/devices/system/cpu/cpu1/online
[   10.220448] IRQ153 no longer affine to CPU1
[   10.220595] CPU1: shutdown
# [    0.000000] PERCPU: Embedded 7 pages/cpu @ee7c1000 s8192 r8192=20
d12288 u32768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.=20
Total pages: 516624
[    0.000000] Kernel command line: console=3Dtty0=20
console=3DttySAC2,115200n8 drm_kms_helper.edid_firmware=3Dedid-1920x108=
0.fw=20
  root=3DUUID=3Dfd363
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8=20
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144=20
bytes)
[    0.000000] Memory: 2047332K/2072576K available (3678K kernel code,=20
228K rwdata, 1148K rodata, 224K init, 263K bss, 25244K reserved, )
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc04bebfc   (4827 kB)
[    0.000000]       .init : 0xc04bf000 - 0xc04f7000   ( 224 kB)
[    0.000000]       .data : 0xc04f8000 - 0xc05312c0   ( 229 kB)
[    0.000000]        .bss : 0xc05312cc - 0xc0573274   ( 264 kB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
2, Nodes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2=
=2E
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu=
_ids=3D2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] Exynos5250: clock setup completed, armclk=3D1000000000
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps=20
every 2863311519744ns
[    0.000000] Switching to timer-based delay loop
[    0.000162] Console: colour dummy device 80x30
[    0.000510] console [tty0] enabled
[    0.000537] Calibrating delay loop (skipped), value calculated using=
=20
timer frequency.. 48.00 BogoMIPS (lpj=3D120000)
[    0.000568] pid_max: default: 32768 minimum: 301
[    0.000793] Mount-cache hash table entries: 512
[    0.013127] CPU: Testing write buffer coherency: ok
[    0.013342] CPU0: update cpu_power 1024
[    0.013361] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.013389] Setting up static identity map for 0x4037df28 - 0x4037df=
80
[    0.040384] CPU1: Booted secondary processor
[    0.040423] CPU1: update cpu_power 1024
[    0.040427] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.040511] Brought up 2 CPUs
[    0.040552] SMP: Total of 2 processors activated.
[    0.040564] CPU: All CPU(s) started in HYP mode.
[    0.040576] CPU: Virtualization extensions available.
[    0.041035] devtmpfs: initialized
[    0.044703] VFP support v0.3: implementor 41 architecture 4 part 30=20
variant f rev 0
[    0.045189] pinctrl core: initialized pinctrl subsystem
[    0.045595] regulator-dummy: no parameters
[    0.045937] NET: Registered protocol family 16
[    0.046099] DMA: preallocated 256 KiB pool for atomic coherent=20
allocations
[    0.047025] cpuidle: using governor menu
[    0.053567] exynos-audss-clk 3810000.audss-clock-controller: setup=20
completed
[    0.061129] EXYNOS5250 PMU Initialize
[    0.073526] bio: create slab <bio-0> at 0
[    0.074229] MAIN_DC: no parameters
[    0.074479] VDD_33ON_2.8V: 2800 mV
[    0.074707] hdmi-en: no parameters
[    0.076562] SCSI subsystem initialized
[    0.077200] usbcore: registered new interface driver usbfs
[    0.077339] usbcore: registered new interface driver hub
[    0.077497] usbcore: registered new device driver usb
[    0.077983] s3c-i2c 12c60000.i2c: slave address 0x66
[    0.078004] s3c-i2c 12c60000.i2c: bus frequency set to 18 KHz
[    0.140328] VDD_ALIVE_1.0V: 1100 mV
[    0.160365] VDD_28IO_DP_1.35V: 1200 mV
[    0.180403] VDD_COMMON1_1.8V: 1800 mV
[    0.195432] VDD_IOPERI_1.8V: 1800 mV
[    0.215469] VDD_EXT_1.8V: 1800 mV
[    0.235505] VDD_MPLL_1.1V: 1100 mV
[    0.255542] VDD_XPLL_1.1V: 1100 mV
[    0.275579] VDD_COMMON2_1.0V: 1000 mV
[    0.290609] VDD_33ON_3.0V: 3000 mV
[    0.310644] VDD_COMMON3_1.8V: 1800 mV
[    0.330680] VDD_ABB2_1.8V: 1800 mV
[    0.350718] VDD_USB_3.0V: 3000 mV
[    0.370756] VDDQ_C2C_W_1.8V: 1800 mV
[    0.390794] VDD18_ABB0_3_1.8V: 1800 mV
[    0.410832] VDD10_COMMON4_1.0V: 1000 mV
[    0.430869] VDD18_HSIC_1.8V: 1800 mV
[    0.450907] VDDQ_MMC2_3_2.8V: 2800 mV
[    0.465937] VDD_33ON_2.8V: 2800 mV
[    0.480966] EXT_33_OFF: 3300 mV
[    0.495994] EXT_28_OFF: 2800 mV
[    0.511023] PVDD_LDO25: 1200 mV
[    0.526050] EXT_18_OFF: 1800 mV
[    0.541079] vdd_mif: 950 <--> 1200 mV at 1000 mV
[    0.556107] vdd_arm: 912 <--> 1300 mV at 1100 mV
[    0.571135] vdd_int: 900 <--> 1200 mV at 1000 mV
[    0.591173] vdd_g3d: 1000 mV
[    0.606202] VDD_MEM_1.35V: 750 <--> 1350 mV at 1200 mV
[    0.621231] PVDD_BUCK7: at 2050 mV
[    0.636258] PVDD_BUCK8: at 1350 mV
[    0.646278] VDD_33_OFF_EXT1: 750 <--> 3000 mV at 2850 mV
[    0.651602] s3c-i2c 12c60000.i2c: i2c-0: S3C I2C adapter
[    0.651718] s3c-i2c 12c80000.i2c: slave address 0x50
[    0.651738] s3c-i2c 12c80000.i2c: bus frequency set to 65 KHz
[    0.652194] s3c-i2c 12c80000.i2c: i2c-2: S3C I2C adapter
[    0.652298] s3c-i2c 12c90000.i2c: slave address 0x00
[    0.652316] s3c-i2c 12c90000.i2c: bus frequency set to 65 KHz
[    0.652766] s3c-i2c 12c90000.i2c: i2c-3: S3C I2C adapter
[    0.652845] s3c-i2c 12ce0000.i2c: slave address 0x38
[    0.652864] s3c-i2c 12ce0000.i2c: bus frequency set to 65 KHz
[    0.653298] s3c-i2c 12ce0000.i2c: i2c-8: S3C I2C adapter
[    0.653378] s3c-i2c 121d0000.i2c: slave address 0x38
[    0.653396] s3c-i2c 121d0000.i2c: bus frequency set to 39 KHz
[    0.653832] s3c-i2c 121d0000.i2c: i2c-9: S3C I2C adapter
[    0.655268] Switched to clocksource arch_sys_counter
[    0.668675] NET: Registered protocol family 2
[    0.669130] TCP established hash table entries: 8192 (order: 3, 3276=
8=20
bytes)
[    0.669217] TCP bind hash table entries: 8192 (order: 5, 163840 byte=
s)
[    0.669391] TCP: Hash tables configured (established 8192 bind 8192)
[    0.669445] TCP: reno registered
[    0.669463] UDP hash table entries: 512 (order: 2, 24576 bytes)
[    0.669509] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes)
[    0.669702] NET: Registered protocol family 1
[    0.669893] Trying to unpack rootfs image as initramfs...
[    0.766244] Freeing initrd memory: 2280K (c2001000 - c223b000)
[    0.767913] futex hash table entries: 512 (order: 3, 32768 bytes)
[    0.768229] bounce pool size: 64 pages
[    0.782215] ROMFS MTD (C) 2007 Red Hat, Inc.
[    0.782471] msgmni has been set to 1443
[    0.782988] io scheduler noop registered
[    0.783004] io scheduler deadline registered
[    0.783497] io scheduler cfq registered (default)
[    0.788490] exynos-dp 145b0000.dp-controller: unable to find phy
[    0.788518] platform 145b0000.dp-controller: Driver exynos-dp=20
requests probe deferral
[    0.794020] dma-pl330 121a0000.pdma: Loaded driver for PL330 DMAC-23=
64208
[    0.794042] dma-pl330 121a0000.pdma:         DBUFF-32x4bytes=20
Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.798710] dma-pl330 121b0000.pdma: Loaded driver for PL330 DMAC-23=
64208
[    0.798732] dma-pl330 121b0000.pdma:         DBUFF-32x4bytes=20
Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.799988] dma-pl330 10800000.mdma: Loaded driver for PL330 DMAC-23=
64208
[    0.800009] dma-pl330 10800000.mdma:         DBUFF-64x8bytes=20
Num_Chans-8 Num_Peri-1 Num_Events-32
[    0.801290] dma-pl330 11c10000.mdma: Loaded driver for PL330 DMAC-23=
64208
[    0.801310] dma-pl330 11c10000.mdma:         DBUFF-64x8bytes=20
Num_Chans-8 Num_Peri-1 Num_Events-32
[    0.889992] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.892000] 12c00000.serial: ttySAC0 at MMIO 0x12c00000 (irq =3D 83,=
=20
base_baud =3D 0) is a S3C6400/10
[    0.892377] 12c10000.serial: ttySAC1 at MMIO 0x12c10000 (irq =3D 84,=
=20
base_baud =3D 0) is a S3C6400/10
[    0.892759] 12c20000.serial: ttySAC2 at MMIO 0x12c20000 (irq =3D 85,=
=20
base_baud =3D 0) is a S3C6400/10
[    1.670559] console [ttySAC2] enabled
[    1.674585] 12c30000.serial: ttySAC3 at MMIO 0x12c30000 (irq =3D 86,=
=20
base_baud =3D 0) is a S3C6400/10
[    1.692699] brd: module loaded
[    1.698718] loop: module loaded
[    1.701256] usbcore: registered new interface driver asix
[    1.705903] usbcore: registered new interface driver ax88179_178a
[    1.711976] usbcore: registered new interface driver cdc_ether
[    1.717787] usbcore: registered new interface driver r815x
[    1.723269] usbcore: registered new interface driver smsc75xx
[    1.729002] usbcore: registered new interface driver smsc95xx
[    1.734708] usbcore: registered new interface driver net1080
[    1.740364] usbcore: registered new interface driver cdc_subset
[    1.746252] usbcore: registered new interface driver zaurus
[    1.751843] usbcore: registered new interface driver cdc_ncm
[    1.758245] dwc3 12000000.dwc3: no usb2 phy configured
[    1.762472] platform 12000000.dwc3: Driver dwc3 requests probe defer=
ral
[    1.769390] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
[    1.775567] ehci-exynos: EHCI EXYNOS driver
[    1.779837] unable to find transceiver of type USB2 PHY
[    1.784947] exynos-ehci 12110000.usb: no platform data or transceive=
r=20
defined
[    1.792066] platform 12110000.usb: Driver exynos-ehci requests probe=
=20
deferral
[    1.799448] usbcore: registered new interface driver usb-storage
[    1.805626] samsung-usb3phy 12100000.usbphy: Can't get usb-phy sysre=
g=20
cfg register
[    1.813271] mousedev: PS/2 mouse device common for all mice
[    1.818949] s3c-rtc 101e0000.rtc: rtc disabled, re-enabling
[    1.824152] s3c-rtc 101e0000.rtc: rtc core: registered s3c as rtc0
[    1.830003] s3c-rtc 101e0000.rtc: warning: invalid RTC value so=20
initializing it
[    1.838186] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30)=20
initialised: dm-devel@redhat.com
[    1.845812] sdhci: Secure Digital Host Controller Interface driver
[    1.851862] sdhci: Copyright(c) Pierre Ossman
[    1.856406] Synopsys Designware Multimedia Card Interface Driver
[    1.862711] dwmmc_exynos 12200000.mmc: Using internal DMA controller=
=2E
[    1.868623] dwmmc_exynos 12200000.mmc: Version ID is 241a
[    1.874109] dwmmc_exynos 12200000.mmc: DW MMC controller at irq 107,=
=20
32 bit host data width, 128 deep fifo
[    1.910297] dwmmc_exynos 12200000.mmc: 1 slots initialized
[    1.914562] dwmmc_exynos 12220000.mmc: Using internal DMA controller=
=2E
[    1.920781] dwmmc_exynos 12220000.mmc: Version ID is 241a
[    1.927261] dwmmc_exynos 12220000.mmc: DW MMC controller at irq 109,=
=20
32 bit host data width, 128 deep fifo
[    1.965297] dwmmc_exynos 12220000.mmc: 1 slots initialized
[    1.971127] usbcore: registered new interface driver usbhid
[    1.975228] usbhid: USB HID core driver
[    1.979226] TCP: cubic registered
[    1.982364] NET: Registered protocol family 17
[    1.986819] NET: Registered protocol family 15
[    1.991283] Registering SWP/SWPB emulation handler
[    2.003036] mmc0: BKOPS_EN bit is not set
[    2.006888] mmc_host mmc0: Bus speed (slot 0) =3D 50000000Hz (slot r=
eq=20
52000000Hz, actual 50000000HZ div =3D 0)
[    2.015394] EXT_28_OFF: disabling
[    2.018807] mmc_host mmc0: Bus speed (slot 0) =3D 100000000Hz (slot =
req=20
52000000Hz, actual 50000000HZ div =3D 1)
[    2.028501] mmc0: new high speed DDR MMC card at address 0001
[    2.034499] isa bounce pool size: 16 pages
[    2.038289] mmcblk0: mmc0:0001 M4G1FA 3.72 GiB
[    2.039592] VDD_33ON_2.8V: disabling
[    2.046459] mmcblk0boot0: mmc0:0001 M4G1FA partition 1 1.00 MiB
[    2.046462] exynos-dp 145b0000.dp-controller: unable to find phy
[    2.046485] platform 145b0000.dp-controller: Driver exynos-dp=20
requests probe deferral
[    2.066149] mmcblk0boot1: mmc0:0001 M4G1FA partition 2 1.00 MiB
[    2.072039] mmcblk0rpmb: mmc0:0001 M4G1FA partition 3 128 KiB
[    2.079125]  mmcblk0: p1 p2 p3 p4
[    2.083379]  mmcblk0boot1: unknown partition table
[    2.087640]  mmcblk0boot0: unknown partition table
[    2.124893] mmc_host mmc1: Bus speed (slot 0) =3D 50000000Hz (slot r=
eq=20
50000000Hz, actual 50000000HZ div =3D 0)
[    2.133243] mmc1: new high speed SDHC card at address 1234
[    2.139010] mmcblk1: mmc1:1234 SA04G 3.67 GiB
[    2.144781]  mmcblk1: p1 p2 p3
[    2.247302] samsung-usb2phy 12130000.usbphy: Already power on PHY
[    2.251948] unable to find transceiver
[    2.255665] exynos-ehci 12110000.usb: EHCI Host Controller
[    2.261156] exynos-ehci 12110000.usb: new USB bus registered,=20
assigned bus number 1
[    2.268838] exynos-ehci 12110000.usb: irq 103, io mem 0x12110000
[    2.280294] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    2.285642] hub 1-0:1.0: USB hub found
[    2.288583] hub 1-0:1.0: 3 ports detected
[    2.292965] exynos-dp 145b0000.dp-controller: unable to find phy
[    2.298569] platform 145b0000.dp-controller: Driver exynos-dp=20
requests probe deferral
[    2.307380] input: gpio_keys.4 as /devices/gpio_keys.4/input/input0
[    2.313083] s3c-rtc 101e0000.rtc: setting system clock to 2000-01-01=
=20
00:00:01 UTC (946684801)
[    2.321189] exynos-dp 145b0000.dp-controller: unable to find phy
[    2.327125] platform 145b0000.dp-controller: Driver exynos-dp=20
requests probe deferral
[    2.335530] Freeing unused kernel memory: 224K (c04bf000 - c04f7000)
[    2.380582] systemd-udevd[1257]: starting version 204
[    2.786139] EXT4-fs (mmcblk1p3): mounted filesystem with ordered dat=
a=20
mode. Opts: (null)
[    3.542945] random: nonblocking pool is initialized
[    3.546909] EXT4-fs (mmcblk1p3): re-mounted. Opts: data=3Dordered
[   10.848487] Unable to handle kernel paging request at virtual addres=
s=20
410fc0f4
[   12.070655] pgd =3D c0004000
[   12.073340] [410fc0f4] *pgd=3D00000000
[   12.076901] Internal error: Oops: 80000005 [#1] PREEMPT SMP ARM
[   12.082802] Modules linked in:
[   12.085839] CPU: 0 PID: 0 Comm: swapper/0 Not tainted=20
3.14.0-rc1-00079-g82cd447 #467
[   12.093571] task: c0502ce8 ti: c04f8000 task.ti: c04f8000
[   12.098948] PC is at 0x410fc0f4
[   12.102076] LR is at cpu_init+0x28/0x70
[   12.105892] pc : [<410fc0f4>]    lr : [<c0010428>]    psr: 800001d3
[   12.105892] sp : c04f9f48  ip : 00000000  fp : ee7c1158
[   12.117356] r10: c05311d9  r9 : 410fc0f4  r8 : ee7c1158
[   12.122557] r7 : c05046fc  r6 : ed830c40  r5 : c0019cd0  r4 : 000000=
00
[   12.129068] r3 : 2e2cc000  r2 : 405316c0  r1 : 6e0c006a  r0 : 000000=
00
[   12.135579] Flags: Nzcv  IRQs off  FIQs off  Mode SVC_32  ISA ARM=20
Segment kernel
[   12.143047] Control: 10c5387d  Table: 6e0c006a  DAC: 00000015
[   12.148772] Process swapper/0 (pid: 0, stack limit =3D 0xc04f8240)
[   12.154761] Stack: (0xc04f9f48 to 0xc04fa000)
[   12.159101] 9f40:                   00000000 00000000 00000018=20
c04f9f68 c02c52c4 c02a9c50
[   12.167265] 9f60: 60000013 ffffffff dabfc321 00000000 ee7c1690=20
ee7c1158 c056bcbc ee7c1158
[   12.175425] 9f80: c04f68c0 c04f68c0 00000000 c04f8000 c0500494=20
c0380aac c05311d9 00000001
[   12.183584] 9fa0: 410fc0f4 c05311d9 c04f9fb4 c037a454 00000000=20
c00588c4 c04e1b78 c04bfb08
[   12.191743] 9fc0: ffffffff ffffffff c04bf57c 00000000 00000000=20
c04e1b78 00000000 10c5387d
[   12.199902] 9fe0: c050040c c04e1b74 c0503d44 4000406a 00000000=20
40008074 00000000 00000000
[   12.208067] [<c0010428>] (cpu_init) from [<00000000>] (  (null))
[   12.214046] Code: bad PC value
[   12.217083] ---[ end trace 6b959f570500b802 ]---
[   12.221683] Kernel panic - not syncing: Attempted to kill the idle t=
ask!
[   13.316370] SMP: failed to stop secondary CPUs




> On Tue, Apr 8, 2014 at 4:31 PM, Tomasz Figa <t.figa@samsung.com> wrot=
e:
>> Hi Daniel,
>>
>>
>> On 04.04.2014 15:06, Daniel Lezcano wrote:
>>>
>>>
>>> Hi,
>>>
>>> I tried to make the idle AFTR state working on arndale 5250 but tha=
t
>>> leads to a kernel reboot and crash.
>>>
>>> How to reproduce ?
>>>
>>> echo 0 > /sys/devices/system/cpu/cpu1/online
>>>
>>> Reproductible on v3.14 and samsung/for-next
>>>
>>> Any ideas ?
>>
>>
>> Added some people that I know that have been working with Arndale.
>>
>> Best regards,
>> Tomasz
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: Boot regression on Arndale Octa
Date: Sun, 22 Jun 2014 22:32:49 +0200
Message-ID: <53A73D71.7010600@suse.de>
References: <53A7009C.3090003@suse.de> <53A71891.2080403@gmail.com> <53A7278C.3050804@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010206090208040306020007"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:32940 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751153AbaFVUcx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 16:32:53 -0400
In-Reply-To: <53A7278C.3050804@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010206090208040306020007
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 22.06.2014 20:59, schrieb Andreas Färber:
> Hi Tomasz,
> 
> Am 22.06.2014 19:55, schrieb Tomasz Figa:
>> On 22.06.2014 18:13, Andreas Färber wrote:
>>> Both on kgene's for-next 053341b6993a3e838cfa35c9f594fb94ee3da9ce and on
>>> Linus' 401c58fcbbf570e7e4a8ee0e21ffd829deb4de0b my Arndale Octa board
>>> fails to boot with an "Unhandled fault: synchronous external abort
>>> (0x210)". This is a regression from v3.15, 100% reproducible.
>>>
>>
>> A couple of ideas to get more information:
>>
>>  - What config do you use?
> 
> Attached. It's basically a 3.15'ish exynos_defconfig, updated using
> `make oldconfig` plus some manually enabled systemd (CONFIG_FHANDLE=y,
> CONFIG_FANOTIFY=y, CONFIG_AUTOFS4=m) and Exynos options.
> 
> Compiler is gcc 4.8.2.
> 
>>  - Does it boot with exynos devfreq disabled in kernel config?
> 
> I do see CONFIG_ARM_EXYNOS5_BUS_DEVFREQ=y; not sure if I've already
> tested without, will try.

No improvement without DEVFREQ. Log attached.

> I already verified that 5250 based Spring
> boots with a similar config (patchset upcoming). Next I'm trying 5410
> based ODROID-XU for comparison.

ODROID-XU works, too (without DEVFREQ).

>>  - Why the "> [    6.268412] clk: Not disabling unused clocks" line is
>> there? What's your kernel command line?
> 
> console=ttySAC3,115200n8 root=/dev/mmcblk1p2 rootfstype=ext4 rw rootwait
> clk_ignore_unused
> 
> I had tried the latter because the issue occurred directly after a list
> of clocks were disabled, but it did not help unfortunately.

I notice that this time the trouble starts before the clocks already.
Could this be related to the MMC issues reported for other chips?

Regards,
Andreas

-- 
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imendörffer; HRB 16746 AG Nürnberg

--------------010206090208040306020007
Content-Type: text/x-log;
 name="arndale-octa-3.16-nodevfreq.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="arndale-octa-3.16-nodevfreq.log"

U-Boot 2012.07-g8c348a3-divty (Apr r4 2014 - 03:02:27) for ARNDALE OCTA

CPU: Exynos5420 Rev2.0 [Samsung SOC on SMP Platform Base on ARM CortexA15]
APLL = 800MHz, KPLL = 600MHz
MPLL = 532MHz, BPLL = 800MHz

Board: ARNDAL� OCTA
DRAM:  2 GiB
WARNING: Caches not enabled

TrustZone Enabled BSP
BL1 version: 

Checking Boot Mode ... SDMMC
MMC:   S5P_MSHC2: 0, S5P_MSHC0: 1
MMC Device 0: 29.9 GiB
MMC Device 1: 3.6 GiB
MMC Device 2: MMC Device 2 not found
there are pending interrupts 0x00000001
In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0 
Loading file "boot.scr" from mmc device 0:1 (xxa1)
928 bytes read
## Executing script at r0008000
Loading file "zImage" from mmc device 0:1 (xxa1)
3073776 bytes read
Loading file "�tb/exynos5420-arndale-octa.dtb" fr�
                                                  j���device 01 (xxa1)
32888 bytes read
## Flattened Device Tree blob at 21000000
   Booting using the fdt blob at 0x21000000
   Loading Device Tree to 2fff4000, end 2ffff077 ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.16.0-rc1-00004-ge8d1bfc (X�ɕ�͑ɽ��� (gc version 4.8.2 20140404 [gcc-4_8-brcnch revision 209122] (SUSE Linux) ) #1 SMP PREEMPT Sun Jun 22 22:13:41 CEST 2014
[    0.000000] CPU: ARMv7 Processor [412fc0f3] revision 3 (ARMv79, cr=30c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] Machine model: Insignal Arnda|e Octa evaluation board based on EXYNOS5420
[    0.000000] Forcing write-allocate cache policy for SMP
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Runnin���Ɂsecure fimware.
[    0.000000] PERCPU: Embedded 7 pages/cpu @ebb79000 s7808 r8192 d12672 u72768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1696w83
[    0.000000] Kernel command line: console=ttySAC3,115200n8 root=/dev/mmcblk1p2 rootfstype=ext4 rw rootwait clk_ignore_unused
[ ��r������PID hashtable entries: 4096 (order: 2, 16384��ѕͥ
[   0.000000] Dentry cache�+͡�tale entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-c�che hash table entries: 65536 (order: 6, 262144 bytes)
[   �r�������Memory: 672524K/6793212K available (4109K kernel code, 249K rwdata, 1292K rodata, 275K init, 283K bss, 60688K reserved, 6023164K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vecto�  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]   �6�ᵅ� : 0xffc0000 - 0xffe00000   (2048 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfm00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    �  ������   �r���с:0xc0008000  0xc054e7<8   (5402 kF)
[    0.000000]       .init : 0xc054f000 - 0xc0593e80   ( 276 kB)
[    0.p00000]       .data : 0xc0594000 - 0xc05d2580   ���Z     �
[   0.000000]        .bss : 0xc05d258c - 0xc06192c0   ( 284 kB)
[    0.000000] SLUB: HU�����6, Order=0-, MinObjmcts=0, CPUs=8, Nodes=1
[    0.000000] Preemptible hierarchical �CU implementation.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] GIC physical location is 0x10481000
[    0.000000] L2C: failed to init: -19
[    0.000007] sched_clock: 64 bits at 24MHz, vesolution 41ns, wraps every 2863311519744ns
[    0.000356] Console: colour dummy device 80x30
[   �r���¢�CalZ,ѥ���delayloop... 1590.88 BogoMIPS (lpj=3977216)
[    0.045029] pid_max: default: 32768 minimum: 301
[  ��r������Oount-cche �a�h table entries: 2048 (order: 1, 8192 bytes)
[    0.045230] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.045972] CPU: Testing write buffer coherency: ok
[    0.046325] CPU0: update cpu_capacity 1535
[    0.046339] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    �  �����Settig up static identity map for 0x203e7338 - 0x203e7390
[    0.046775] ARM CCI driver probed
[    0.046842] Exynos MCPM support installed
[  ��r������CPU1: Boted secondary processor
[    0.095004] CPU1: update cpu_capacity 1535
[    0.095011] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.107575] CPU2: Booted secondary processor
[    0.125004] CPU2: update cpu_capacity 1535
[    0.125011] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.135564] CPU3: Booted secondary processor
[    0.155005] CPU3: update cpu_capacity 1535
[    0.155012] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    1.165033] CPU4: failed to come online
[    2.175050] CPU5: failed to come online
[    3.185067] CPU6: failed to come online
[    4.195083] CPU7: failed to come online
[    4.1951LSɽ՝��up 4 CPUs
                          [    4.195127] SMP: Total of 4 processors activated.
[    4.195138] CPU: WARNING: CPU(s) started in wrong/inconsistent modes (primary CPU mode 0x13)
[    4.195147] CPU: This may indicate a broken bootloader or firmware.
[    4.195879] devtmpfs:`initialized
[    4.205568] VFP support v0.3: implementor 41�X�,+�����ɕ� part 30 vriant f rev 0
[    4.206370] pinctrl core: initialized pinctrl subsystem
[    4.206906] regulator-dummy: no parameters
[    4.225453] �Q������ѕ���protocolfamily 16
[    4.225659] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    4.227770] cpuidle: using governor ladder
[    4.227809] cpuidle: using governor menu
[    4.237526] exynos-audss-clk 3810000.audss-clock-controller: setup completed
[    4.248283] EXYNOS: PMU not supported
[    4.284714] SCSI subsystem initialized
[    4.285621] usbcore: registered new interface driver usbfs
[    4.285819] usbcore: registered new interface driver hub
[    4.292375] Switched to clocksource mct-frcr usb
[    4.312127] NET: Registered protocol family 2
[    4.312925] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    4.313034] TCP bind hash table entries: 8192 (order: 5, 163840 bytes)
[    4.313228] TCP: Hash tables configured (established 8192 bind 8192)
[    4.313288] TCP: reno registered
[    4.313305] UDP hash table entries: 512 (order: 2, 24576 bytes)
[    4.313352] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes)
[    4.313611WrQ� Regisered protocol family 1
[    4.313970] kvm [1]: HYP mode not available
[    4.316705] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    4.338982] ROMFS MTD (C) 2007 Red Hat, Inc.
[    4.339349] msgmni has been set to 1385
[    4.340267] bounce: pool size: 64 pages
[    4.340745] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    4.340767] io scheduler noop registered
[    4.340806] io scheduler deadline registered
[    4.341546] io s�heduler cfq registered (default)
[    4.352983] 12100000.phy supply v�us not found, using dummy rggulator
[    4.358589] dma-pl330 3880000.adma: Loaded driver for PL330 DMAC-2364208
[    4.358606] dma-pl330 3880000.adma:  DBUFF-4x8bytes Num_Chans-6 Num_Peri-16 Num_Events-6
[    4.364913] d[XK��0 121a0000pdma: Loaded driver for PL330 DMAC-2364208
[    4.364929] dma-pl330 121a0000.pdma:         DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
[    4.371160] dma-pl330 121b0000.pdma: Loaded driver for PL330 DMAC-2364208
[    4.371176] dma-pl330 121b0000.pdma:         DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
[    4.372911] dma-pl330 10800000.mdma: Loaded driver for PL330 DMAC-2364208
[   ��i��ʺ�dma-pl30 10800000.mdma:      ����ɢ��bytes um_Chans-8 Num_Peri-1 Num_Events-32
[    4.504736] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    4.507303] 12c00000.serial: ttySAC0 at MMIO 0x12c00000 (irq = 83, base_baud = 0) is a S3C6400/10
[    4.507956] 12c10000.serial: ttySAC1 at MMIO 0x12c10000 (irq = 84��͕}�Ց�= 0) isa S3C6400/10
[    4.508571] 12c20000.serial: ttySAC2 at MMIO 0x12c20000 (irq = 85, base_baud = 0) is a S3C6400/10
[    4.509165] 12c30000.serial: ttySAC3 at MMIO 0x12c30000 (irq = 86, base_baud = 0) is a S3C6400/10
[    5.127526] console [ttySAC3] enabled
[    5.143882] brd: module loaded
[    5.151061] loop: module loaded
[    5.153998] usbcore: registered new interface driver askx
[    5.158234] usbcore: registY�r�݁iterface drver ax88179_178a
[    5.164282] usbcore: registered new interface driver cdc_ether
[    5.170122] usbcore: registered new interface driver smsc75xx
[   �M)�����usbcor: registered new interface driver smsc95xx
[    5.181518] usbcore: registered new interface driver net1080
[    5.187151] usbcore: registered new interface driver cdc_subset
[    5.193049] usbcore: registered new interface driver zaurus
[    M)�²��usbcorg: egistered new interface driver cdc_ncm
[    5.205020] usb@12000000 supply vdd33 not found, usin� dummy regulator
[    5.210659] usb@12000000 supply vdd10 not found, using dummy regulator
[    5.418414] usb@12400000 supply vdd33 not found, using dummy regulator
[    5.423=05] usb@12400000 supply vdd10 not found, using dummy regulator
[    5.630822] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    5.635892] ehci-exynos: EHCI EXYNOS driver
[    5.640486] exynos-ehci 12110000.usb: EHCI Host Controller
[    5.645537] exynos-ehci 12110000.usb: new USB bus registered, assigned bus number 1
[ �r�������eynos-ehci 1110000.usb: irq 103, io mem 0x12110000
[    5.667426] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    5.673107] hub 1-0:1.0: USB hub found
[    5.675706] hub 1-0:1.0: 3 ports dmtected
[    5.680312] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    5.685847] ohci-exynos: OHCI EXYNOS driver
[    5.690296] exynos-ohci 12120000.usb: USB Host Controller
[    5.695406] exynos-ohci 12120000.usb: new USB bus registered, assigned bus number 2
[    5.703026] exynos-ohci 12120000.usb:�Z��103, io em 0x12120000
[    5.767530] hub 2-0:1.0: USB hub found
[    5.769831] hub 2-0:1.0: 3 ports detected
[    5.774684] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    5.779466] xhci-hcd xhci-hcd.2.auto: ~ew USB bus registered, assigned bus number 3
[    5.787090] xhci-hcd xhci-hcd.2.auto: irq 104, io mem 0x12000000
[    5.793940] hub 3-0:1.0: USB hub found
[    5.796606] hub 3-0:1.0: 1 port detected
[    5.800894] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    5.805982] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assignel bus number 4
[    5.814721] hub 4-0:1.0: USB hub found
[    5.817316] hub 4-0:1.0: 1 port detected
[    5.821693] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    5.826701] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 5
[    5.834473] xhci-hcd xhci-hcd.5.auto: irq 105, io mem 0x12400000
[    5.841345] hub 5-0:1.0: USB hub found
[    5.844035] hub 5-0:1.0: 1 port detected
[    5.848293] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
[    5.853382] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 6
[    5.862110] hub 6-0:1.0: USB hub found
[    5.864756] hub 6-0:1.0: q port detected
[    5.869288] usbcore: registered new interface driver usb-storage
[    5.876034] mousedev: PS/2 mouse device common for all mice
[    5.880953] s3c-rtc 101e0000.rtc: rtc disabled, re-enabling
[    5.886136] s3c-rtc 101e0000.rtc: rtc core: registered s3c as rtc0
[    5.896623] PVDD_ALIVE_1V0: 1000 mV 
[    5.899881] PVDD_APIO_1V8: 1800 mV 
[    5.903745] PVDD_APIO_MMCON_1V8: 1800 mV 
[    5.907398] PVDD_ADC_1V8: 1800 mV 
[ ��rʊ����AY}11}�V8: 180 mV 
[    5.914354] PVDD_ANAIP_1V0: 1000 mV 
[    5.917934] PVDD_ANAIP_1V8: 1800 mV 
[    5.921434] PVDD_ABB_1V8: 1800 mV 
[    5.925281] PVDD_USB_3V3: 3000 mV 
[    5.928814] PVDD_PRE_1^8: 1800 mV 
[    5.932337] PVDD_USB_1V0: 1000 mV 
[    5.935431] PVDD_HSIC_1V8: 1800 mV 
[    5.938894] PVDD_APIO_MMCOFF_2V8: 2800 mV 
[    5.94298�Wb=�4 at 3000 m 
[    5.945975] PVDD_PERI_2V8: 3300 mV 
[    5.949462] PVDD_PERI_3V3: 2200 mV 
[    5.952944] LDO17: at 3300 mV 
[    5.955950] PVDD_EMMC_1V8: 1800 mV 
[    5.959428] PVDD_TFLASH_2V8: 2800 mV 
[    5.963081] PVDD_BTWIFI_1V8: 1800 mV 
[    M)�����PVDD_CAMIO_1V8: 1800 mV 
[    5.970337] LDO22: at 1200 mV 
[    5.973825] PVDD_MIFS_1V1: 1200 mV 
_    5.976976] PVDD_CAM1_AVDD_2V8: 2800 mV 
[    5.980904] LDO25: at 1800 mV 
[    5.983930] PVDD_CAM0_AF_2V8: 3000 mV 
[    5.987472] usb 1-1: new high-speed USB device number 2 using exynos-ehci
[    5.987731] PVDD_G3DS_1V0: 1200 mV 
[    5.989480] PVDD_TSP_3V3: 3300 mV 
[    5.991213] PVDD_AUDIO_1V8: 1800 mV 
[    5.992998] LDO30: at 1800 mV 
[   �M)ʢ���PVDD_PRI_1V8: 1800 mV 
[    5.996445] PVDD_LCD_1V8: 1800 mV 
[    5.998243] PVDD_CAM0R���: 180 mV 
[    5.999970] LDO34: at 3000 mV 
[    6.001698] PVDD_CAM0_DVDD_1V2: 1200 mV 
[    6.003498] LDO36: at 1800 mV 
[    6.005235] LDO37: at 1800 mV 
[    6.006962] PVDD_CAM0_�VDD_2V8: 2800 mV 
[    6.009291] PVDD_MIF_1V1: 800 <--> 1100 mV at 1100 m^ 
[    6.011547] vdd_arm: 800 <--> 1000 mV at 1000 mV 
[    6.013913] PVDD_INT_1V0: 800 <--> 1000 mV at 1000 mV 
[    6.015550] PVDD_G3D_1V0: 800 <--> 1000 mV at 1000 mV 
[    6.017839] PVDD_LPDDR3_1V2: 800 <--> 1200 mV at 1200 mV 
[    6.020052] PVDD_KFC_1V0: 800 <--> 1000 mV at 1000 mV 
[    6.022266] VIN_LLDO_1V4: 800 <--> 1400 mV at 900 mV 
[    6.024556] VIN_MLDO_2V0: 800 <--> 2000 mV at 1225 mV 
[    6.026757] VIN_HLDO_3V5: 3000 <--> 3500 mV at 5000 mV 
[    6.028496]`PVDD_EMMCF_2V8: 2800 mV 
[    6.040384] s3c2410-wdt 101d0000.watchdog: watchdog inactive, reset disabled, irq disabled
[    6.043841]`device-mapper: ioctl: 4.27.0-ioctl (2013-10-30) initialised: dm-devel@redhat.com
[    6.049632] sdhci: Secure Digital Host Controller Interface driver
[    6.049643] sdhci: Copyright(c) Pierre Ossman
[    6.050514] Synopsys Designware Multimedia Card Interface Driver
[    6.052589] dwmmc_exynos 12200000.mmc: num-slots property not found, assuming 1 slot is available
[    6.053551] dwmmc_exynos 12200000.mmc: Using internal DMA controller.
[    6.053567] dwmmc_exynos 12200000.mmc: Version ID is 250a
[    6.054042] dwmmc_exynos 12200000.mmc: DW MMC controller at irq 107, 64 bit host data width, 64 deep fifo
[    6.054089] of_get_named_gpiod_flags: can't parse gpios property of node '/mmc@12200000[0]'
[    6.054098] of_get_�amed_gpiod_flags: can't parse gpios property of node '/mmc@12200000[0]'
[    6.082499] dwmmc_exynos 12200000.mmc: 1 slots initialized
[    6.083153] dwmmc_exynos 12220000.mmc: num-slots property not found, assuming 1 slot is available
[    6.084026] dwmmc_exynos 12220000.mmc: Using internal DMA co�troller.
{    6.084042] dwmmc_exynos 12220000.mmc: Version ID is 250a
[    6.084454] dwmmc_exynos 12220000.mmc: DW MMC controller at irq 1�N  ���сhos data width, 64 deep fifo
[    6.084556] of_get_named_gpiod_flags: can't parse gpios property of node '/mmc@12220000[0]'
[    6.084570] of_get_named_gpiod_flags: can't parse gpios property of node '/mmc@12220000[0]'
[    6.112498] dwmmc_exynos 12220000.mmc: 1 slots initialized
[    6.114854] s5p-sss driver registered
[    6.118529] usbcore: registered new interface driver usbhid
[    6.118538] usbhid: USB HID core driver
[    6.118820] TCP: cubic registered
[    6.118845] NET: Registered protocol family 17
[    6.118966] NET: Registered protocol family 15
[    6.119117] Registering SWP/SWPB emulation handler
[    6.119149] big.LITTLE switcher initializing
[    6.119156] bL_switcher_halve_cpus: no CPU pairing possible
[    6.119164] big.LITTLE switcher initialization failed
[    6.121508] of_get_named_gpiod_flags exited with status 0
[    6.121584] gpio-31: gpiod_set_debounc�: missing set() or set_debounce() operations
[    6.122672] input: gpio_keys as /devicew/gpio_keys/input/input0
[    6.125376] mmc0: BKOPS_EN bit is not set
[    6.125422] s3c-rtc 101e0000.rtc: setting system clock to 2000-01-02 02:40:29 UTC (946780829)
[    6.126878] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ div = 0)
[    6.127564] mmc_host mmc0: Bus speed (slot 0) = 100000000Hz (slot req 52000000Hz, actual 50000000HZ div = 1)
[    6.127957] mmc0: new DDR MMC card at address 0001
[    6.129119] mmcblk0: mmc0:0001 M4G1FB 3.64 GiB 
[    6.129486] mmcblk0boot0: mmc0:0001 M4G1FB partition 1 1.00 MiB
[    6.129817] mmcblk0boot1: mmc0:0001 M4G1FB partition 2 1.00 MiB
[    6.130140] mmcblk0rpm�'j���0001 M4G1FBpartition 3 128 KiB
[    6.132941]  mmcblk0: p1 p2 p3 p4
[    6.132957] Unhandled fault: synchronous external abort (0x21�Jс0xf017008
[    6.132973] Internal error: : 210 [#1] PREEMPT SMP ARM
[    6.132994] Modules linked in:
[    6.133008] CPU: 2 PID: 6 Comm: kworker/u16:0 Not tainted 3.16.0-rc1-00004-ge8d1bfc #1
[    6.133037] Workqueue: kmmcd mmc_rescan
[    6.133047] task: ecc13c00 ti: eccac000 task.ti: eccac000
[    6.133066] PC is at rescan_partitions+0xe0/0x2bc
[    6.133077] LR is at 0xf0170000
[    6.133089] pc : [<c01d34b0>]    lr : [<f0170000>]    psr:`20000113
[    6.133089] sp : eccadc68  ip : 00000000  fp : 00000000
[    6.133101] r10: 00000001  r9 : ecd1d080  r8 : eb2d0600
[    6.133112] r7 : eb490000  r6 : eb490000  r5 : 00000000  r4 : 00000008
{    6.133123] v3 : c04016e0  r2 : 00000013  r1 : 00000000  r0 : 00000001
[    6.133135] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
[    6.133146] Control: 30c5387d  Table: 20003000  DA�: 55555555
[    6.133157] Process kworker/u16:0 (pid: 6, stack limit = 0xeccac240)
[    6.133168] Stack: (0xeccadc68 to 0xecca�000)
[    6.133181] dc60:                   c05d6f04 c03e586c eb490010 00000000 00000001 eccac000
[    6.133194] dc80: c05a5720 eb318218 c05a55f0 eb490100 eb3180e8 eb490000 00000000 eb3180e8
[   ��)����dca0: 0000000 00000000 00000000 eb490000 eb2d0600 eb490010`00000000 p0000001
[    6.133221] dcc0: 00000000 c0102ecc 00000000 00000000 00000001 eb490000 eb490000 00000000
[    6.133233] dce0: eb2d060c eb318000 eb2d0670 00000000 00000003 c0103170 00000003 00000001
[    6.133246] dd00: c05a7ad4 c0101c58`eccadd14 eb2d0640 eb2d0600 0b300000 eb2d0640 00000001
[    6.133258] dd20: eb490000 eb2d0600 eb2d060c eb318000 eb2d0670 00000000 00000003 c01d1328
[    6.133272] dd40: c01cfa98 c01d0b6c eb2d0600 00000000 0000008���0000000000002 ecf90000
[    6.133283] dd60: ecf91c00 ecf91800 ecf91800 ecf91abc 000001a4 ecf91c00 ecf91800 eccaddc6
[    6.133296] dd80: e,V�"�0 c031108 00000056 ecf91f5c 00000003 ecf90000 ecf91c00 c0311444
[    6.133310] dda0: 00000003 eccaddc6 00000008 ecd1a9d8 c04da9c0 ecf91a98 00000000 34362e33
[    6.133322] ddc0: 42694720 3231c000 694b2038 c0000042 00000001 c0610;dc ecf91c08 00000000
[    6.133335] dde0: c05cac54���������5a904 eccac08 ecc13800 c03066d4 c03066c0 c0�MS��
[    6133348] de00: 00000000 ecf91c08 c0257c44 ecfb9808 00000000 c025628c ecf7ec98 ece29244
[    6.137363] de20: ecf91c08 ecf91c3c c05ca824 c0257a1c ecf91c10 ecf91c08 c05ca824 c0257118
[    6.133373] de40: ecf91c10 00000000 ecf91c08 c02556cc ecc13800 c03df3f0 c04f2474 eccade74
[    6.133387] de60: 000�LX�*���100 ecf91c08c04c42ac 00000001 c0418cec 00000000 c0306af4
[    6.133399] dm80: c04f2420 c04c42ac c04f23dc 00000001 00000000 ecfb9800 00000000 ecfb9800
[    6.133411] dea0: 00061a80 c0309580 00061a80 40ff8080 00000000 ecfb99f4 c0418ce0 c0306330
[    6.133424] dec0: ecc69100 ecfb99f4 ecc13800 ece3fg00 00000000 c0042c68 c0593700 c05d246c
[    6.1334s6] dee0: eccac010 c059c45c 00000001 ecc69100 ecc13800 ecc13820 eccac010 eccac000
[    6.133449] df00: ecc69118 00000088 ecc13800 c004350c c05d2430 ecc13800 ecc13820 ecc13854
[    6.133461] df20: ecc13970 c05960c0 00000000 ecc66e00 00000000 ecc69100 c00434bc 00000000
[    6.133475] df40: 00000000 00000000 00000000 c0048bc8 00000001 00000000 eccadf54 ecc69100
[    6.133488] df60: 00000000 00000000 dead4mad ffffffff ffffffff eccadf74 eccadf74 00000000
[    6.133501] df80: 00000000 dead4ead ffffffff ffffff�*������0 ccadf90 eccadfac ecc66e00
[    6.133513] dfa0: c0048af0 00000000 00000000 c001c9b8 00000000 00000000 00000000 00000000
[    6.133527] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    6.133=40] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 eccadff4 00000000
[    6.133566] [<c01d34b0>] (rescan_partitions) from [<c0102ecc>] (__blkdev_get+0x28c/0x38c)
[    6.133582] [<c0102ecc>] (__blkdev_get) from [<c0103L��(blkdev_gt+0x1a4/0x320)
[    6.133597] [<c0103170>] (blkdev_get) from [<c01d1328>] (add_disk+0x33c/0x438)
[    6.133616] [<c01d1328>_�)��}��ͭ�from [<c031008>] (mmc_add_disk+0x1c/0xf8)
[    6.133633] [<c0311008>] (mmc_add_disk) from [<c0311444>] (mmc_blk_probe+0x220/0x29c)
[    6.133650] [<c0311444>] (mmc_blk_probe) from [<c03066d4>] (mmc_bus_probe+0x14/0x18)
[    6.133668] [<c03066d4>] (mmc_bus_probe) from [<c0277aa8>] (really_probe+0x84/0x220)
[    6.133686] [<c0257aa8>] (really_probe) from [<c025628c>] (bus_for_each_drv+0x58/0x8c)
[    6.133701] [<c025628c>] (bus_for_each_drv) from [<c0257a1c>] (device_attach+0x78/0x80)
[    6.133717] [<c0257a1c>] (device_attach) from [<c0257118>] (bus_probe_device+0x84/0xa8)
[    6.133731] [<c0257118>] (bus_probe_device) from [<c02556cc>] (device_add+0x440/0x520)
[    6.133746] [<c02556cc>] (device_add) from [<c0306af4>] (mmc_add_card+0xec/0x248)
[    6.133765] [<c0306af4>] (mmc_add_card) from [<c0309580>] (mmc_attach_mmc+0xa4/0x160)
[   ��)�����[<c030980>] (mmc_attach_mmc) from [<c0306330>] (mmc_rescan+0x2b0/0x308)
[    6.133806] [<c0306330>] (mmc_rescan) from [<c0042c68>] (pro���}��ework+0xf4/0x364)
[    6.133825] [<c0042c68>] (process_one_work) from [<c004350c>] (worker_thread+0x50/0x5ap)
[    6.133843] [<c004350c>] (worker_thread) from [<c0048bc8>] (kthread+0xd8/0xf0)
[    6.133863] [<c0048bc8>] (kthread) from [<c001c9b8>] (�et_from_fork+0x14/0x3c)
[    6.133880] Code: da000009 e599e024 e3a01000 e3a00001 (e1ce28d8) 
[    6.133898] ---[ end trace ccc03f6fd5e7fa0c ]---
[    6.133991] Unable to handle kernel paging request at virtual address ffffffe0
[    6.134003] pgd = c0003000
[    6.134037]�+�����V�*pd=8000002000700s, jpmd=4f7fd003, *pte=00000000
[    6.134049] Internal error: Oops: 207 [#2] PREEMPT SMP ARM
[    6.134066] Modules linked in:
[    6.134080] CPU: 2 PID: 6 Comm: kworker/u16:0 Tainted: G      D       3.16.0-rc1-00004-ge8d1bfc #1
[    6.134099] task: ecc13c00 ti: eccac000 task.ti: eccac000
[    6.134313] PC is at kthread_data+0x4/0xc
[    6.134126] LR is at wq_worker_sleeping+0xc/0xc0
[    6.134138] pc : [<c0049174>]    lr : [<c0043b3c>]    psr: 20000193
[    6.134138_ s� > eccadac0  ip : ecc13c5c  fp : eccadb04
[    6.134147] r10: ecc13e7c  r9 : c03ec21c  r8 : c059c75c
[    6.134159] r7 : c0593700  r6 : ecc13c00  r5 : ebb8a700  ���������j
                                                                      [   6.134169] r3 : 00000000  r2 : 00000000  r1 : 00000002  r0 : ecc13c00
[    6.134181] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
[    6.134194] Control: 30c5387d  Table: 20003000  DAC: 55555555
[    6.1342p4] Process kworker/u16:0 (pid: 6, stack limit = 0xeccac240)
[    6.134214] Stack: (0xeccadac0 to 0xeccae000)
[    6.134228] dac0: 00000002 c03e2bd0 c0593700 c0593700 c0593700 c05d246c eccac008 c059c45c
[    6.134240] dae0: 00000000 00000001 ecc13bf8 ecc13df8 ecc13bf8 eccac000`ecc13df8 ecc12p00
[    6.134253] db00: eccL�,��0f5cc eccadb8 00000001 eccac000 ecc13e40 eccadb18 eccadb18
[    6.134266] db20: 00000001 c05a05a0 0000000b c04c42ac eccac000 00000210 c05d2a44 e���0
[    6.34280] db40: eccac000 g001fac4 eccag240 0000000b 00000000 60000193 c04b8930 00000610
[    6.134292] db60: 00000007 c05a08cc f0170088 eccadc20 ecd1d080 00000001 00000000 c0008544
[    6.134305] db80: 000000���������������������������������2�17008 00000006 60000113
[    6.134318] dba0: 00000000 20000113 00000000 c03e6bc4 c05a36e8 c0064a30 eccac000 00000015
[    6.134332] dbc0: 00000002 c006a274 00000000 c006ac4c 00000000 0���������������������j
         [    6.13445] dbe0: c05d6b26 00000015 004fee80 00000000 ec18e3e0 00�������������,*�
[    6.14358] dc00: c04c0e24 c0098a20 c01d34b0 20000113 ffffffff eccadc54 eb2d0600 c0020358
[    6.134370] dc20: 00000001 00000000 00000013 c04016e0 00000008 00000000 eb490000 eb490000
[    6.134385] dc40: eb2d0600 ecd1d080 00��������������������*������8 f0170000 c0d34b0
[    6.134398] dc60: 20000113 ffffffff c05d6f04 c03e586c eb490010 00000000 00000001 eccac000
[    6.134410] dc80: c05a5720 eb318218 c05a55f0 eb490100 eb3180e8 eb490000 00000000 eb3180e8
[    6.134423] ���: 0000000 00000000 00000000 eb490000 eb2d0600 eb490010 00000000 00000001
[    6.134435] dcc0: 00000000 c0102ecc 00000000 00000000 00000001 eb490000 eb490000 00000000
[    6.134449] dce0: eb2d060c eb318000 eb2d0670 00000000 00000003 c0103170 00000003 00000001
[    6.134461] dd00: c05a7ad4 c0101c58 e�����4 eb2d040 eb2d0600 0b300000 eb2d0640 00000001
[    6.134475] dd20: eb490000 eb2d0600 eb2d060c eb318000 eb2d0670 00000000 00000003 c01d1328
[    6.134487] dd40: c01cfa98 c01d0b6c`eb2d0600 00000000 00�����0000 00000002 ec[    6.134500] dd60: ecf91c00 ecf91800 ecf91800 ecf91abc 000001a4 ecf91c00 ecf91800 eccaddc6
[    6.134513] dd80: �cf91d90 c0311008 00000056 ecf91f5c 00000003 ecf90000 ecf91c00 c0�����
           [    6.13526] dda0: 00000003 eccaddc6 00000008 ecd1a9d8 c04da9c0 ecf91a98 00000000 34362e33
[    6.134538] ddc0: 42694720 3231c000 694b2038 c0000042 00000001 c06109dc ecf91c08 00000000
[    6.134551] dde0: c05cac54 00000002 c05ca904 eccac018 ecc13800 c03066d4 c03066c0 c0257aa8
[    6.134564] de00: 00000000 ecf91c08 c0257c44 ecfb9808 00000000 c025628c ecf7ec98 ece29244
[    6.134577] de20: ecf91c08 ecf91c3c c05ca824 c0257a1c ecf91c10 ecf91c08 c05ca82< c0257118
[    6.134591] de40: ecf91c10 00000000 ecf91c08 c02556cc ecc13800 c03df3f0 c04f2474 eccade74
[    6.13460�"��0: 0061a80 ecf91c00 ecf91c08 c04c42ac 00000001 c0418cec 00000000 c0306af4
[    6.134619] de80: c04f2420 c04c42ac c04f23dc 00000001 00000000 ecfb9800 00000000 ecfby800
[    6.134633] dea0: 00061a80 c0309580 00061a80 40ff8080 00000000 ecfb99f4 c0418ce0 c0306730
[    6.134646] dec0: ecc69100 ecfb99f4 ecc13800 ece3fc00 00000000 c0042c68 c0593700 c05d246c
[    6.134661] dee0: eccac010 c059c45c 00000001 ecc69100 ecc13800 ecc13820 eccac010 eccac000
[    6.134675] df00: ecc69118 00000088 ecc13800 c004350c c05d2430 ecc13800 ecc13820 ecc13854
[    6.134688] df20: ecc13970 c05960c0 00000000 ecc66e00 00000000 �cc69100 c00434bc 00000000
[    6.134701] df40: 00000000 00000000 00�����048bc8 0000001 00000000 eccadf54 ecc69100
[    6.134713] df60: 00000000 00000000 lead4ead ffffffff`ffffffff eccadf74 eccadf74 00000001
[    6.134726] df80: 00010001 dead4ead ffffffff ffffffff e�����0eccadf90 ecadfac ecc66e00
[    6.134739] dfa0: c0048af0 00�������������019b8 00000000 00000000 00000000 00000000
[    6.134750] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    6.134764] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 eccadff4 00000000
[    6.134783] [<c0049174>] (kthvead_data) from [<c0043b3c>] (wq_worker_sleeping+0xc/0xc0)
[    6.134804] [<c0043b3c>] (wq_worker_sleeping) from [<c03e2bd0>] (__schedule+0x354/0x520)
[    6.134822] [<c03e2bd0>] (__schedule) from [<c002f5cc>] (do_exit+0x648/0x8f8)
[    6.134838] [<c002f5cc>] (do_exit) from [<c001fac4>] (die+0x230/0x2e8)
[    6.134855] +�01fac4>] die) from [<c0008544>] (do_DataAbort+0x90/0x94)
[    6.134870] [<c0008544>] (do_DataAbort) from [<c0020358>] (__dabt_svc+0x38/0x60)
[    6.134880] Exception stack(0xeccadc20 to 0xeccadc68)
[    6.134893] dc20: 00000001 00000000 00000013 c04016e0 00000008 00000000 eb490000 eb490000
[    6.134906] dc40: eb2d0600 ecd1d080 00000001 00000000 00000000 eccadc68 f0170000 c01d34b0
[    6.134916] dc60: 20000113 fnffffff
[    6.134935] [<c0020358>] (__dabt_svc) from [<c01d34b0>] (�escan_partitions+0xe0/0x2bc)
[    6.134951] [<c01d34b0>] (rescan_partitions) from [<c0102ecc>] (__blkdev_get+0x28c/0x38c)
[    6.134964] [<c0102ecc>] (__blkdev_get) from [<c0103170>] (blkdev_get+0x1a4/0x320)
[    6.134978] [<c0103L��(blkde_get) from [<c01d1328>] (add_disk+0x33c/0x438)
[    6.134995] [<c01d1328>] (add_disk) from [<c0311008>] (mmc_add_disk+0x1c/0xf8)
[    6.135010] [<c0311008>] (mmc_add_disk) from [<c0311444>] (mmc_blk_probe+0x220/0x29c)
[    6.135029] [<c0311444>] (mmc_blk_probe) from [<c03066d4>] (mmc_bus_probe+0x14/0x18)
[    6.135045] [<c03066d4>] (mmc_bus_probe) from [<c0257aa8>] (really_probe+0x84/0x220)
[    6.135063] [<c0257aa8>] (really_probe) from [<c025628c>] (bus_for_each_drv+0x58/0x8c9
[    6.135079] [<c025628c>] (bus_for_each_drv) from [<c0257a1c>] (device_attach+0x78/0x80)
[    6.135094] [<c0257a1c>] (device_attach) from [<c0257118>] (bus_probe_device+0x84/0xa8)
[    6.1351p7] [<c0257118>] (bus_probe_de�Z�V   2ɽ��<c02556cc>](device_add+0x440/0x520)
[    6.135122] [<c02556cc>] (device_add) from [<c0306af4>] (mmc_add_card+0xec/0x248)
[    6.135139] [<c0306af4>] (mmc_add_card) from [<c0309580>] (mmc_attach_mmc+0xa[    6.135156] [<c0309580>] (mmg_attach_mmc) from [<c0706330>] (mmc_rescan+0x2b0/0x308)
[    6.L�S���[<c006330>]`(mmc_rescan) from [<c0042c68>] (process_one_work+0xf4/0x364)
[    6.135192] [<c0042c68>] (process_on�_work) from [<c004350c>] (worker_thread+0x50/0x5a0)
[    6.135209] [<c004350c>] (worker_thread) from [<c0048bc8>] (kthread+0xd8/0xf0)
[    6.135226] [<c�����>] (khread) from [<c001c9b8>] (ret_from_fork+0x14o0x3c)
[    6.135240] Code: e5130028 e7e00150 e12fff1e e5903250 (e5130020) 
[    6.135258] ---[ end trace ccc03f6fd5e7fa0d ]---
[    6.135266] Fixing recursive fault but reboot is needed!
[    6.141102] clk: Not disabling unused clocks
[    7.504055] Unhandled fault: synchronous external �bort (0x210) at 0xf017203d
[    7.510392] Internal error: : 210 [#3] PREEMPT SMP ARM
                                                         [    7.515502] Modules linked in:
[    7.518539] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G      D       3.16.0-rc1-00004-ge8d1bfc #1
[    7.527116] task: ecc12000 ti: ecc84000 task.ti: ecc84000
[    7.532494] PC is at n_tty_open+0x68/0x118
                                             [    7.536563] LR is at n_tty_open+0x64/0x118
[    7.540635] pc : [<c023011c>]    lr : [<c0230118>]    psr: a0000113
[    7.540635] sp : ecc85d10  ip : 0�����2�: 0000000
[    7.552071] r10: 00000002  r9 : c05f9050  r8 : 00500001
[    7.557271] r7 : 0000224c  r6 : ecfbd000  r5 : 00000000  r4 : f0172000
[    7.563769] r3 : f0174694  r2 : c060eedc  r1 : c04da71c  r0 : f0174280
[    7.570269] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
[    7.577548] Control: 30c5387d  Table: 20003000  DAC: fffffffd
[`   7.583267] Process swapper/0 (pid: 1, stack limit = 0xecc84240)
[    7.589246] Stack: (0xec�85d10 to 0xecc���Jj[    7.59351] 5d00:                                     c02300b4 ecfbd000 ecfbd1bc mb29ff00
[    7.601727] 5d20: c040a9c4 c0233f8c 00000000 eb29ff00 ecfbd000 c02345e4 eb19a480 ecfbd000
[    7.609872] 5d40: 00000003 c022d080 ecc85e70 c006b984 ece3e500 00000001 eb19a480 c022dbe8
[    7.618017] 5d60: eb404820 c05bd428 c060f340�,�"530 0000001 00000003 00000001 c060eea0
[    7.626163] 5d80: eb404820 ece3e500 c040a9c4 00000000 00000000 00�����*���5e70 c0d8864
[    7.634308] 5la0: ece3e508 00000000 0������*��e500 eb44820 ece3e508 c00d87c8 c00d2e10
[    7.642454] 5dc0: 0p000000 ecc85e>c ecc85f34 00000002 00000000 00000000 00000000 c00d30ec
[    7.650599] 5de0: ecc85eb0 c00e0550 ecc84000 c00de484 000080d0 2b5e7000 00000001�Y�,����
           [    7.65745] 5e00: ece3e500 00000026 eb402558 00000000 00000000 00000000 0f4756ea 00000007
[    7.666890] 5e20: ecc2e015 eb404820 ece3e500 ece3e500 ecc85eb0 ecc85f34 ecc85e70 ffffff9c
[    7.675036] 5e40: 00000000 00000000 ecc84000 c00e0�54 ecc85e6c ebb7cf10 ecc2e000 c03e062c
[    7.683181] 5e60: 000000d0 c00dddf0 00000000 00�����*���dd0 eb40268 00000000 80080008
[    7.691327] 5e80: 00000000 ecc85f34 00000001 ecc2e000 ffffff9c c054f514 00000085 c0577448
[    7.699473] 7ea0: c0577440 c00e22a8 00000041 00000000 ecc1d3d0 eb402688 0f4756ea 00000007
[ ��r������5ec0: ec2e015 c05a7500 00000000 eb402000 eb404820 00000101 00000004 00000018
[    7.715763] 5ee0: 00000000 00000000 ecc86008 c03e6b80 00000002 c00edfc8 c05f9050 00000002
[    7.723908] 5f00: 00000001 00000002 ecc2e000 ffffff9c c05d25c0 00000002 ecc2e000 nfffff9c
+��������5f0: 00000000 c00d406c 00000085 00006fb4 00000000 00000002 00000000 00000026
[    7.740200] 5f40: 00000100 00000001 c05d25c0 c0591154 00000007 c05d25c0 c05d25c0 c054f514
[    7.748345] 5f60: 00000085 c054fd20 00000007 00000007 c054f514 c03e6c04 ebb7a700 c004faf8
[    7.756490] 5f80: 2b5e7000 c05d25c0 c03ddd84 00000000 00000000 00000000 00000000 00000000
[ ��r������5fa0: 0000000 c03ddd94 00000000 c001c9b8 00000000 00��������������������j
    [    7.72781] 5fc0: 00000000 00000000�����������������������������������������������j
         [    7.80926] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 ecc85ff4 00000000
[    7.789080] [<c023011c>] (n_tty_open) from [<c0233f8c>] (tty_ldisc_open.isra.4+0x3c/0x7c)
[    7.797222] [<c0233f8c>] (tty_ldisc_open.isra.4) from [<c02345e4>] (tty_ldisc_setup+0x18/0x58)
[    7.805801] [<c02345e4>] (tty_ldisc_setup) from [<c022d080>] (tty_init_dev+0xa0/0x198)
[    7.813687] [<c022d080>] (tty_init_dev) from [<c022dbe8>] (tty_open+0x2c8/0x5bc)
[    7.x21052] [<c022dbe8>] (tty_open) from [<c00d8864>] (chrdev_open+0x9c/0x178)
[    7.828245] [<c00d8864>] (chrdev_open) from [<c00d2e10>] (do_dentry_open.isra.15+0xdc/0x2e8)
[    7.836650] [<c00d2e10>] (do_dentry_open.isra.15) from [<c00d30�c>] (finish_open+0x20/0x38)
[    7.844969] [<c00d30ec>] (finish_open) from [<c00e0550>] (do_last.isra.55+0x3e8/0xc38)
[    7.852854] [<c00e0550>] (do_last.isra.55) from [<c00e0e54>] (path_openat+0xb4/0x5e0)
[    7.860653] [<c00e0e54>] (path_openat) from [<c00e22a8>] (do_f�lp_open+0x2c/0x80)
[    7.868105] [<c00e22a8>] (do_filp_o�en) from �<c00d406c>] (do_sys_open+0x10c/px1d0)
[    7.875733] [<c00���] (do_ys_open) from [<c054fd20>] (kernel_init_freeable+0x160/0x1d8)
[  ��r�¢����[<054fd20>] (kernel_init_freeable) from [<c03ddd94>] (kernel_init+0x10/0xe8)
[    7.892197] [<c03ddd94>] (kernel_init) from [<c001c9b8>] (ret_from_fork+0x14/0x3c)
[    7.899731] Code: e34c104d e34c2060 ebf8d1fd e5864224 (e5d4303d) 
[    7.905797] ---� end trace �cc03f6fd5e7fa0e ]---
[    7.910498] Kernel panic - not syncing: Attempted to kill inZW.�ѽ���0x000000b
[    7.910498] 
[    7.919491] CPU3: stopping
[    7.922175] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D       3.16.0-rc1-00004-ge8d1bfc #1
[    7.930762] [<c00226l4>] (unwind_backtrace) from [<c001f890>] (show_stack+0x10/px14)
[    7.938470] [<c001f890>] (show_stack) from [<c03e16b8>] (dump_stack+0x80/0xc0)
[    7.945661] [<c03e16b8>] (dump_�tack) from [<c0021978>] (handle_IPI+0x17c/0x18c)
[    7.953025] [<c0021978>] (handle_IPI) from [<c0008640>] (gic_handle_irq+0x64/0x68)
[    7.960563] [<c0008640>] (gic_handle_irq) from [<c0020�,��(__irqsvc+0x40/0x70)
[    7.968011] Exception stack(pxeccc3f70 to 0xeccc3fb8)
[    7.973039] 3f60:                                     eccc3fb8 00000018 d7e5e9a5 00000001
[    7.981186] 3f80: d7c747d9 00000001 ebb91af8 c05ca50c 00000000 c05d2473 eccc2000`00000000
[    7.989330] 3fa0: fffffff8 eccc3fb8 c0077c30 c0301bb0 60000113 ffffffff
[    7.995921] [<c00203c0>] (__irq_svc) from +�301b0>] (�puidle_enter_state+0x50/0xe0)
[    8.003806] [<c0301bb0>] (cpuidle_enter_state) from [<c0061854>] (,�}�х���}�����0x04/0x228)
[    8.012555] [<c0061854>] (cpu_startup_entry) from [<200086e4>] (0x200086e�JC��r��ʢ��CPU1: stpping
[    8.022173] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D       3.16.0-rc1-00004-ge8d1bfc #1
[    8.030759] [<c00226d4>] (unwind_backtrace) from [<c001f890>] (show_stack+0x10/0x14)
[  ��r��¢��[<c001f89>] (show_stack) from [<c03e16b8>] (dump_stack+0x80/0xc0)
[    8.045660] [<c03e16b8>] (dump_stack) from [<c0021978>] (handle_IPI+0x17c/0x18c)
[    8.053024] [<c0021978>] (handle_IPI) from [<c0008640>] (gic_handle_irq+0x64/0x68)
[    8.060562] [<c0008640>] (gic_handle_irq) from [<c00203c0>] (__irq_svc+0x40/0x70)
[    8.068010] Exception stack(0xeccbff70 to 0xeccbffb8)
[    8.073038] ff60:              �*������� 00000018 7e5eb6f 00000001
{    8.081184] ff80: bf18e1eb 00000001 ebb81af8 c05ca50c 00000000 c05d2473 eccbe000 00000000
[    8.089328] ffa0: fffffff8 eccbffb8 c0077c30 c0301bb0 60000113 ffffffff
[    8.095919] [<c00203c0>] (__irq_svc) from +�301b0>] (cpuidle_enter_state+0x50/0xe0)
[    8.103803] [<c0301bb0>] (cpuidle_enter_state) from [<c0061854>] (cpu_startup_entry+0x204/0x228)
[    8.112553] [<c0061854>] (cpu�startup_entry) from [<200086e4>] (0x200086e4)
[    9.048235] SMP: failed to stop secondary CPUs
[    9.051200] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    9.051200] 
[   33.975789] BUG: spinlock lockup suspected on CPU$&  Z�ɭ�ɽu16:06
[   33.980658]  lock: 0xebb8a700, .magic: dead4ead, .owner: kworker/u16:0/6, .owner_cpu: 2
[   33.988629] CPU: 2 PID: 6 Comm: kworker/}16:0 Tainted: G      D       3.16.0-rc1-00004-ge8d1bfc #1
[   33.997568] [<c00226d4>] (unwind_ba�ktrace) from [<c001f890>] (show_stack+0x10/0x14)
[   34.005271] [<c001f890>] (show_stack) from [<c03e16b8>] (dump_stack+0x80/0xc0)
[   &�  �����[<c03e1b8>] (dump_stack) from [<c0066a90>] (do_raw_spin_lock+0x118/0x18c)
[   &�  �������c0066a0>] (do_raw_spin_lock) from [<c03e2938>] (__sch�dule+0xbc/0x520)
[  �&�  ����[<c03e2938] (__schedule) from [<c002f810>] (do_exit+0x88c/0x8f8)
[   34.035251] [<c002f810�WB"�}��� from [<c01fac4>] (die+0x230/0x2e8)
[   34.041751] [<c001fac4>] (die) from [<c03deae0>] (__do_kernel_fault.part.9+0x64/0x74)
[   34.049552] [<c03deae0>] (__do_kernel_fault.part.9) from [<c0024614>] (do_page_fault+0x14c/0x280JC�+��r����[<c002464>] (do_page_fault) from [<c00084e4>] (do_DataAbort+0x30/0x94)
[   &�  ������<c00084e4>](do_DataAb�rt) from [<c0020358>] (__dabt_svc+0x38/0x60)
[   34.073375] Exception stack(0xeccada78 to 0xeccadac0)
[   34.078402] da60:                                                       ecc13c00 00000002
[   34.086549] da80: 00000000 00000000 00000002 ebb8a700 ecc13c00 c0593700 c059c75c c03ec21c
[   34.094695] �aa0: ecc13e7c eccadb04 ecc13c5c eccadac0 c0043b3c c0049174 20000193 fffffff�C�+�����¢��[<0020358>] (__dabt_svc) from [<c0049174>] (kthread_data+0x4/0xc)
[   34.110038] [<c0049174>] (kthread_data) from [<c0043b3c>] (wq_worker_sleeping+0xc/0xc0)
[   34.118009] [<c0043b3�>] (wq_worker_sleeping) from [<c03e2bd0>] (__schedule+0x354/0x520)
[   34.126066] [<c03e2bd0>] (__schedule) from [<c002f5cc>] (do_exit+0x648/0x8f8)
[   34.133169] [<c002f5cc>] (do_exit) from [<c001fac4>] (die+0x230/0x2e8)
[   34.139>69] [<c001fac4>] (die) from [<c0008544>] (doDataAbort+0x90/0x94)
[   34.146428] [<c0008544>] (do_DataAbort) from [<c0020358>] (__dabt_svc+0x38/0x60)
[   34.153789] Exception stack(0xeccadc20 to 0xeccadc68)
[   34.158818] dc20: 00000001 00000000 00000013 c04016e0 00000008 00000000 eb49p000 eb490000
[   34.166964] dc40: eb2d0600 ecd1d080 00000001 00000000 00000000 eccadc68 f0170000 c01d34b0
[   34.175107] dc60: 20000113 ffffffff
[   34.178581] [<c0020358>] (__dabt_svc) from [<c01d34b0>] (rescan_partitions+0xe0/0x2bc)
[   34.186465] [<c01d3�,��(rescn_partitions) from +�02ecc>] (_blkdev_get+0x28c/0x38c)
[   34.194607] [<c0102ecc>] (__blkdev_get) from [<c0103170>] (blkdev_get+0x1a4/0x320)
[   34.202147] [<c0103170>] (blkdev_get) from [<c01d1328>] (add_disk+0x33c/0x438)
[   34.209342] [<c01�L&��(add_dik) from [<c0311008>] (mmc_add_disk+0x1c/0xf8)
[   34.216533] [<c0311008>] (mmc_add_disk) from [<c0311444>] (mmc_blk_probe+0x220/0x29c)
[   34.224s34] [<c0311444>] (mmc_blk_probe) from [<c03066d4>] (mmc_bus_probe+0x14/0x18)
[   34.232046] [<c03066d4>] (mmc_bus_probe) from [<c0257aa8>] (really_probe+0x84/0x220)
[   34.239755] [<�0257aa8>] (really_probe) from [<c025628c>] (bus_for_each_drv+0x58/0x8c9
[   34.247641] [<c025628c>] (bus_for_each_�rv) from [<c0257a1c>] (device_attach+0x78/0x80)
[   34.255613] [<c0257a1c>] (device_attach) from [<c0257118>] (bus_probe_device+0x84/0xa8)
[   34.263M��[<c027118>] (bus_probe_device) from [<c02556cc>] (device_add+0x440/0x520)
[   34.271471] [<c02556cc>] (device_add) from [<c0306af4>] (mmc_add_card+0xec/0x248)
[   34.278926] [<c0306af4>] (mmc_add_card) from [<c0309580>] (mmc_attach_mmc+0xa4/0x160)
[   34.286724] [<c0309580>] (mmc_attach_mmc) from [<c0306330>] (mmc_rescan+0x2b0/0x308)
[   34.294437] [<c0306330>] (mmc_rescan) from [<c0042c68>] (process_one_work+0xf4/0x364)
[   34.302236] [<c0042c68>] (process_one_work) from [<c004350c>] (worker_thread+0x50/0x5a0)
[   34.310294] [<c004350c>] (worker_thread) from [<c0048bc8>] (kthread+0xd8/0xf0)
[   34.317487] [<c0048bc8>] (kthread) from [<c001c9b8>] (ret_from_fork+0x14/0x3��H

--------------010206090208040306020007--

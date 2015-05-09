From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Sat, 09 May 2015 14:20:23 +0200
Message-ID: <554DFB87.7020306@gmx.net>
References: <1430430651-22416-1-git-send-email-gustavo@padovan.org>	<554D2FC7.1070208@gmx.net> <CAAQKjZPCQZV7DxTuf12NyPbT2H5PJhNQs4CwtM8g563Zuw8-6w@mail.gmail.com> <554DF9DE.7000200@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:58205 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750955AbbEIMUc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 May 2015 08:20:32 -0400
In-Reply-To: <554DF9DE.7000200@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>

Tobias Jakobi wrote:
> Hello Inki,
> 
> 
> Inki Dae wrote:
>> Hi,
>>
>> 2015-05-09 6:51 GMT+09:00 Tobias Jakobi <liquid.acid@gmx.net>:
>>> Hello,
>>>
>>> I've tested this on my Hardkernel Odroid-X2 (connected via HDMI to a
>>> 1080p panel).
>>>
>>> Run the usual modetest tests (just primary plane, primary plane with
>>> vsync, primary plane with overlay, primary plane with overlay and video
>>> overlay, overlay partially outside of crtc area, etc.) and haven't
>>> noticed any issues so far.
>>
>> As I mentioned several times, it works well in case that only one crtc
>> driver is enabled. Could you check it again after you enable two or
>> more crtc drivers such as FIMD and HDMI or FIMD, HDMI and VIDI
>> together? For this, dts file for X2 should contain their device nodes
>> and also should be configurated though menuconfig.
> I've enabled VIDI and FIMD and confirmed that they should up properly in
> modetest before applying the series.
This should read "...show up properly..."



> 
> Booting with the atomic series works fine, but I get a segfault when
> calling modetest. I've attached the kernel log below.
> 
> 
> 
>>> Kernel log is 'clean', so the series works fine for me.
>>>
>>> You can add my
>>> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>
>> So you didn't test it correctly yet.
> I tested the common usage scenario. In fact I can't really test with
> FIMD anyway, since I don't have any panel that I can attach to the LCD
> expansion port. Regardless of whether the kernel oopses or anything with
> atomic, I can never make sure that the FIMD visuals are actually correct.
> 
> 
> With best wishes,
> Tobias
> 
>> Thanks,
>> Inki Dae
>>
> 
> 
> 
> Kernel log (after triggering segfault with modetest):
>> liquid@chidori ~/sourcecode/video/drm/tests/modetest $ dmesg
>> [    0.000000] Booting Linux on physical CPU 0xa00
>> [    0.000000] Initializing cgroup subsys cpuset
>> [    0.000000] Initializing cgroup subsys cpuacct
>> [    0.000000] Linux version 4.1.0-rc2-debug+ (liquid@chidori) (gcc version 4.8.3 (Gentoo 4.8.3 p1.1, pie-0.5.9) ) #4 SMP PREEMPT Sat May 9 05:11:08 CEST 2015
>> [    0.000000] CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c5387d
>> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>> [    0.000000] Machine model: Hardkernel ODROID-X2 board based on Exynos4412
>> [    0.000000] earlycon: no match for ttySAC1,115200n8
>> [    0.000000] bootconsole [earlycon0] enabled
>> [    0.000000] Reserved memory: created CMA memory pool at 0x77000000, size 16 MiB
>> [    0.000000] Reserved memory: initialized node region@77000000, compatible id shared-dma-pool
>> [    0.000000] Reserved memory: created CMA memory pool at 0x78000000, size 16 MiB
>> [    0.000000] Reserved memory: initialized node region@78000000, compatible id shared-dma-pool
>> [    0.000000] cma: Reserved 128 MiB at 0xb7c00000
>> [    0.000000] Memory policy: Data cache writealloc
>> [    0.000000] Samsung CPU ID: 0xe4412220
>> [    0.000000] On node 0 totalpages: 524032
>> [    0.000000] free_area_init_node: node 0, pgdat c0712980, node_mem_map ee7f5000
>> [    0.000000]   Normal zone: 1520 pages used for memmap
>> [    0.000000]   Normal zone: 0 pages reserved
>> [    0.000000]   Normal zone: 194560 pages, LIFO batch:31
>> [    0.000000]   HighMem zone: 329472 pages, LIFO batch:31
>> [    0.000000] Running under secure firmware.
>> [    0.000000] PERCPU: Embedded 12 pages/cpu @ee786000 s17600 r8192 d23360 u49152
>> [    0.000000] pcpu-alloc: s17600 r8192 d23360 u49152 alloc=12*4096
>> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 522512
>> [    0.000000] Kernel command line: video=HDMI-A-1:1280x720M@60 console=ttySAC1,115200n8 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait ro earlyprintk
>> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
>> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
>> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
>> [    0.000000] Memory: 1907080K/2096128K available (5067K kernel code, 230K rwdata, 1696K rodata, 228K init, 255K bss, 25208K reserved, 163840K cma-reserved, 1154048K highmem)
>> [    0.000000] Virtual kernel memory layout:
>>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>>     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
>>     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
>>     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
>>     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
>>     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
>>       .text : 0xc0008000 - 0xc06a2fb4   (6764 kB)
>>       .init : 0xc06a3000 - 0xc06dc000   ( 228 kB)
>>       .data : 0xc06dc000 - 0xc0715a18   ( 231 kB)
>>        .bss : 0xc0718000 - 0xc0757d28   ( 256 kB)
>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>> [    0.000000] Preemptible hierarchical RCU implementation.
>> [    0.000000] NR_IRQS:16 nr_irqs:16 16
>> [    0.000000] L2C: platform modifies aux control register: 0x02070000 -> 0x3e470001
>> [    0.000000] L2C: platform provided aux values permit register corruption.
>> [    0.000000] L2C: DT/platform modifies aux control register: 0x02070000 -> 0x3e470001
>> [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
>> [    0.000000] L2C-310: enabling full line of zeros but not enabled in Cortex-A9
>> [    0.000000] L2C-310 ID prefetch enabled, offset 8 lines
>> [    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
>> [    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
>> [    0.000000] L2C-310: CACHE_ID 0x4100c4c8, AUX_CTRL 0x7e470001
>> [    0.000000] Exynos4x12 clocks: sclk_apll = 1000000000, sclk_mpll = 800000000
>> 	sclk_epll = 96000000, sclk_vpll = 350000000, arm_clk = 1000000000
>> [    0.000000] Switching to timer-based delay loop, resolution 41ns
>> [    0.000000] clocksource mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
>> [    0.000004] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
>> [    0.008102] Console: colour dummy device 80x30
>> [    0.012477] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=120000)
>> [    0.022869] pid_max: default: 32768 minimum: 301
>> [    0.027653] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
>> [    0.034253] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
>> [    0.041876] Initializing cgroup subsys devices
>> [    0.046262] CPU: Testing write buffer coherency: ok
>> [    0.051455] CPU0: thread -1, cpu 0, socket 10, mpidr 80000a00
>> [    0.057537] Setting up static identity map for 0x40008240 - 0x40008298
>> [    0.100275] CPU1: thread -1, cpu 1, socket 10, mpidr 80000a01
>> [    0.110261] CPU2: thread -1, cpu 2, socket 10, mpidr 80000a02
>> [    0.120255] CPU3: thread -1, cpu 3, socket 10, mpidr 80000a03
>> [    0.120323] Brought up 4 CPUs
>> [    0.140659] SMP: Total of 4 processors activated (192.00 BogoMIPS).
>> [    0.146993] CPU: All CPU(s) started in SVC mode.
>> [    0.152261] devtmpfs: initialized
>> [    0.156913] VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 4
>> [    0.164971] lcd0-power-domain@10023C80 has as child subdomain: tv-power-domain@10023C20.
>> [    0.173550] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 9556302231375000 ns
>> [    0.188296] pinctrl core: initialized pinctrl subsystem
>> [    0.193978] regulator-dummy: no parameters
>> [    0.217531] NET: Registered protocol family 16
>> [    0.223901] DMA: preallocated 256 KiB pool for atomic coherent allocations
>> [    0.249814] cpuidle: using governor ladder
>> [    0.264814] cpuidle: using governor menu
>> [    0.282638] exynos-audss-clk 3810000.clock-controller: setup completed
>> [    0.319093] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watchpoint registers.
>> [    0.327028] hw-breakpoint: maximum watchpoint size is 4 bytes.
>> [    0.342381] sysvdd: 5000 mV 
>> [    0.342441] reg-fixed-voltage regulators:regulator@0: sysvdd supplying 5000000uV
>> [    0.342800] p3v3: 3300 mV 
>> [    0.342852] reg-fixed-voltage regulators:regulator@1: p3v3 supplying 3300000uV
>> [    0.343165] p3v3_en: GPIO 9 is already used
>> [    0.343184] p3v3_en: 3300 mV 
>> [    0.343238] reg-fixed-voltage regulator_p3v3: p3v3_en supplying 3300000uV
>> [    0.344896] SCSI subsystem initialized
>> [    0.348809] usbcore: registered new interface driver usbfs
>> [    0.354306] usbcore: registered new interface driver hub
>> [    0.359991] usbcore: registered new device driver usb
>> [    0.365659] s3c-i2c 13860000.i2c: slave address 0x10
>> [    0.370560] s3c-i2c 13860000.i2c: bus frequency set to 390 KHz
>> [    0.378650] max77686-pmic max77686-pmic: max77686_pmic_probe
>> [    0.379376] vdd_alive_1.0V: 1000 mV 
>> [    0.380142] vddq_m1_m2_1.8V: 1800 mV 
>> [    0.380879] vddq_ext_1.8V: 1800 mV 
>> [    0.381613] vddq_mmc2_2.8V: 2800 mV 
>> [    0.382365] vddq_mmc1_mmc3_1.8V: 1800 mV 
>> [    0.383103] vdd_mpll_1.0V: 1000 mV 
>> [    0.383853] vdd_epll_1.0V: 1000 mV 
>> [    0.384455] vdd_hdmi_1.0V: 1000 mV 
>> [    0.385219] vt_core_1.0V: 1000 mV 
>> [    0.385823] vddq_mipihsi_1.8V: 1800 mV 
>> [    0.386564] vdd_abb1_1.8V: 1800 mV 
>> [    0.387332] vdd_usb_otg_3.3V: 3300 mV 
>> [    0.388084] vddq_c2c_w_1.8V: 1800 mV 
>> [    0.388835] vdd_abb0_abb2_1.8V: 1800 mV 
>> [    0.389588] vdd_otg_hsic_1.0V: 1000 mV 
>> [    0.390337] vdd_hsic_1.8V: 1800 mV 
>> [    0.390967] vddq_cam_1.8V: 1800 mV 
>> [    0.391730] vddq_isp_1.8V: 1800 mV 
>> [    0.392345] vt_cam_1.8V: 1800 mV 
>> [    0.393212] vddq_emmc_1.8V: 1800 <--> 3000 mV at 1800 mV 
>> [    0.394094] tflash_2.8V: 2800 mV 
>> [    0.394749] unused_2.8V: 2800 mV 
>> [    0.395386] vdd_touch_2.8V: 2800 mV 
>> [    0.396009] vdd_touchled_3.3V: 3300 mV 
>> [    0.396781] vddq_lcd_1.8V: 1800 mV 
>> [    0.397404] vdd_motor_3.0V: 3000 mV 
>> [    0.398166] vdd_mif: 850 <--> 1100 mV at 1100 mV 
>> [    0.398926] vdd_arm: 900 <--> 1400 mV at 1037 mV 
>> [    0.399686] vdd_int: 850 <--> 1150 mV at 1000 mV 
>> [    0.400321] vdd_g3d: 50mV offset 
>> [    0.401097] vddq_ckem1_1.2V: 1200 mV 
>> [    0.401890] input_ldo_1.35V: 1350 mV 
>> [    0.402670] input_ldo_2.0V: 2000 mV 
>> [    0.403289] vddf_emmc_2.85V: 2850 mV 
>> [    0.404054] io_1.2V: 1200 mV 
>> [    0.404442] s3c-i2c 13860000.i2c: i2c-0: S3C I2C adapter
>> [    0.409941] s3c-i2c 13870000.i2c: slave address 0x10
>> [    0.414835] s3c-i2c 13870000.i2c: bus frequency set to 390 KHz
>> [    0.421169] s3c-i2c 13870000.i2c: i2c-1: S3C I2C adapter
>> [    0.426581] s3c-i2c 13880000.i2c: slave address 0x00
>> [    0.431474] s3c-i2c 13880000.i2c: bus frequency set to 97 KHz
>> [    0.437534] s3c-i2c 13880000.i2c: i2c-2: S3C I2C adapter
>> [    0.442905] s3c-i2c 138e0000.i2c: slave address 0x00
>> [    0.447809] s3c-i2c 138e0000.i2c: bus frequency set to 97 KHz
>> [    0.454028] s3c-i2c 138e0000.i2c: i2c-8: S3C I2C adapter
>> [    0.459490] Linux video capture interface: v2.00
>> [    0.464682] Advanced Linux Sound Architecture Driver Initialized.
>> [    0.471666] Switched to clocksource mct-frc
>> [    0.491175] NET: Registered protocol family 2
>> [    0.496182] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
>> [    0.503240] TCP bind hash table entries: 8192 (order: 5, 163840 bytes)
>> [    0.509948] TCP: Hash tables configured (established 8192 bind 8192)
>> [    0.516298] UDP hash table entries: 512 (order: 2, 24576 bytes)
>> [    0.522262] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes)
>> [    0.528879] NET: Registered protocol family 1
>> [    0.533652] CPU PMU: Failed to parse <no-node>/interrupt-affinity[0]
>> [    0.539981] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 counters available
>> [    0.552811] futex hash table entries: 1024 (order: 4, 65536 bytes)
>> [    0.559052] audit: initializing netlink subsys (disabled)
>> [    0.564437] audit: type=2000 audit(0.535:1): initialized
>> [    0.585260] alg: No test for stdrng (krng)
>> [    0.617700] bounce: pool size: 64 pages
>> [    0.621703] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
>> [    0.629039] io scheduler noop registered
>> [    0.633026] io scheduler deadline registered
>> [    0.637703] io scheduler cfq registered (default)
>> [    0.642891] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply from device tree
>> [    0.642907] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply property in node /exynos-usbphy@125B0000 failed
>> [    0.643115] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply from device tree
>> [    0.643129] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply property in node /exynos-usbphy@125B0000 failed
>> [    0.643291] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply from device tree
>> [    0.643304] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply property in node /exynos-usbphy@125B0000 failed
>> [    0.643471] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply from device tree
>> [    0.643485] samsung-usb2-phy 125b0000.exynos-usbphy: Looking up phy-supply property in node /exynos-usbphy@125B0000 failed
>> [    0.649998] dma-pl330 12680000.pdma: Loaded driver for PL330 DMAC-141330
>> [    0.656639] dma-pl330 12680000.pdma: 	DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
>> [    0.670196] dma-pl330 12690000.pdma: Loaded driver for PL330 DMAC-141330
>> [    0.676840] dma-pl330 12690000.pdma: 	DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
>> [    0.686800] dma-pl330 12850000.mdma: Loaded driver for PL330 DMAC-141330
>> [    0.693432] dma-pl330 12850000.mdma: 	DBUFF-64x8bytes Num_Chans-8 Num_Peri-1 Num_Events-32
>> [    0.702961] 13800000.serial: ttySAC0 at MMIO 0x13800000 (irq = 70, base_baud = 0) is a S3C6400/10
>> [    0.712302] 13810000.serial: ttySAC1 at MMIO 0x13810000 (irq = 71, base_baud = 0) is a S3C6400/10
>> [    0.721180] console [ttySAC1] enabled
>> [    0.728499] bootconsole [earlycon0] disabled
>> [    0.737620] 13820000.serial: ttySAC2 at MMIO 0x13820000 (irq = 72, base_baud = 0) is a S3C6400/10
>> [    0.741352] 13830000.serial: ttySAC3 at MMIO 0x13830000 (irq = 73, base_baud = 0) is a S3C6400/10
>> [    0.750813] [drm] Initialized drm 1.1.0 20060810
>> [    0.759713] exynos-hdmi 12d00000.hdmi: Looking up vdd-supply from device tree
>> [    0.759807] exynos-hdmi 12d00000.hdmi: Looking up vdd_osc-supply from device tree
>> [    0.759878] exynos-hdmi 12d00000.hdmi: Looking up vdd_pll-supply from device tree
>> [    0.759945] exynos-hdmi 12d00000.hdmi: Looking up hdmi-en-supply from device tree
>> [    0.759958] exynos-hdmi 12d00000.hdmi: Looking up hdmi-en-supply property in node /hdmi@12D00000 failed
>> [    0.759983] 12d00000.hdmi supply hdmi-en not found, using dummy regulator
>> [    0.762761] s5p-g2d 10800000.g2d: The exynos g2d(ver 4.1) successfully probed
>> [    0.770698] exynos-drm-fimc 11820000.fimc: drm fimc registered successfully.
>> [    0.776400] exynos-drm-fimc 11830000.fimc: drm fimc registered successfully.
>> [    0.783136] exynos-drm-ipp exynos-drm-ipp: drm ipp registered successfully.
>> [    0.790616] exynos-drm exynos-drm: bound exynos-drm-vidi (ops vidi_component_ops)
>> [    0.798083] exynos-sysmmu 11e20000.sysmmu: Enabled
>> [    0.798099] exynos4-fb 11c00000.fimd: exynos_iommu_attach_device: Attached IOMMU with pgtable 0x6d950000 
>> [    0.798117] exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>> [    0.804690] exynos-sysmmu 12e20000.sysmmu: Enabled
>> [    0.804704] exynos-mixer 12c10000.mixer: exynos_iommu_attach_device: Attached IOMMU with pgtable 0x6d950000 
>> [    0.804735] exynos-drm exynos-drm: bound 12c10000.mixer (ops mixer_component_ops)
>> [    0.811804] exynos-drm exynos-drm: bound 12d00000.hdmi (ops hdmi_component_ops)
>> [    0.818780] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [    0.825370] [drm] No driver support for vblank timestamp query.
>> [    0.831580] exynos-sysmmu 10a40000.sysmmu: Enabled
>> [    0.831594] s5p-g2d 10800000.g2d: exynos_iommu_attach_device: Attached IOMMU with pgtable 0x6d950000 
>> [    0.832024] exynos-sysmmu 11a40000.sysmmu: Enabled
>> [    0.832037] exynos-drm-fimc 11820000.fimc: exynos_iommu_attach_device: Attached IOMMU with pgtable 0x6d950000 
>> [    0.832069] exynos-sysmmu 11a50000.sysmmu: Enabled
>> [    0.832081] exynos-drm-fimc 11830000.fimc: exynos_iommu_attach_device: Attached IOMMU with pgtable 0x6d950000 
>> [    0.869747] exynos-drm exynos-drm: fb0:  frame buffer device
>> [    0.869817] exynos-drm exynos-drm: registered panic notifier
>> [    0.875429] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>> [    0.885490] loop: module loaded
>> [    0.886394] usbcore: registered new interface driver smsc95xx
>> [    0.890357] dwc2 12480000.hsotg: registering common handler for irq67
>> [    0.890455] dwc2 12480000.hsotg: mapped PA 12480000 to VA f01c0000
>> [    0.890609] dwc2 12480000.hsotg: NonPeriodic TXFIFO size: 1024
>> [    0.890619] dwc2 12480000.hsotg: RXFIFO size: 2048
>> [    0.890629] dwc2 12480000.hsotg: Periodic TXFIFO 0 size: 0
>> [    0.890638] dwc2 12480000.hsotg: Periodic TXFIFO 1 size: 256
>> [    0.890646] dwc2 12480000.hsotg: Periodic TXFIFO 2 size: 256
>> [    0.890655] dwc2 12480000.hsotg: Periodic TXFIFO 3 size: 256
>> [    0.890664] dwc2 12480000.hsotg: Periodic TXFIFO 4 size: 256
>> [    0.890672] dwc2 12480000.hsotg: Periodic TXFIFO 5 size: 768
>> [    0.890680] dwc2 12480000.hsotg: Periodic TXFIFO 6 size: 768
>> [    0.890689] dwc2 12480000.hsotg: Periodic TXFIFO 7 size: 768
>> [    0.890697] dwc2 12480000.hsotg: Periodic TXFIFO 8 size: 768
>> [    0.890706] dwc2 12480000.hsotg: Periodic TXFIFO 9 size: 0
>> [    0.890714] dwc2 12480000.hsotg: Periodic TXFIFO10 size: 0
>> [    0.890723] dwc2 12480000.hsotg: Periodic TXFIFO11 size: 0
>> [    0.890731] dwc2 12480000.hsotg: Periodic TXFIFO12 size: 0
>> [    0.890740] dwc2 12480000.hsotg: Periodic TXFIFO13 size: 0
>> [    0.890748] dwc2 12480000.hsotg: Periodic TXFIFO14 size: 0
>> [    0.890756] dwc2 12480000.hsotg: Periodic TXFIFO15 size: 0
>> [    0.890845] dwc2 12480000.hsotg: Looking up vusb_d-supply from device tree
>> [    0.891134] dwc2 12480000.hsotg: Looking up vusb_a-supply from device tree
>> [    0.891412] dwc2 12480000.hsotg: pdev 0xee29a600
>> [    0.916698] dwc2 12480000.hsotg: resetting core
>> [    0.916710] dwc2 12480000.hsotg: reset successful
>> [    0.916759] dwc2 12480000.hsotg: EPs: 16, dedicated fifos, 7808 entries in SPRAM
>> [    0.918510] dwc2 12480000.hsotg: GRXFSIZ=0x00001f00, GNPTXFSIZ=0x03001f00
>> [    0.918522] dwc2 12480000.hsotg: FIFOs reset, timeout at 100
>> [    0.919174] dwc2 12480000.hsotg: DCFG=0x08200000, DCTL=0x00000002, DIEPMSK=0000000f
>> [    0.926168] dwc2 12480000.hsotg: GAHBCFG=0x00000000, GHWCFG1=0x00000000
>> [    0.932761] dwc2 12480000.hsotg: GRXFSIZ=0x00000800, GNPTXFSIZ=0x04000800
>> [    0.939529] dwc2 12480000.hsotg: DPTx[1] FSize=256, StAddr=0x00000c00
>> [    0.945953] dwc2 12480000.hsotg: DPTx[2] FSize=256, StAddr=0x00000d00
>> [    0.952376] dwc2 12480000.hsotg: DPTx[3] FSize=256, StAddr=0x00000e00
>> [    0.958799] dwc2 12480000.hsotg: DPTx[4] FSize=256, StAddr=0x00000f00
>> [    0.965221] dwc2 12480000.hsotg: DPTx[5] FSize=768, StAddr=0x00001000
>> [    0.971645] dwc2 12480000.hsotg: DPTx[6] FSize=768, StAddr=0x00001300
>> [    0.978071] dwc2 12480000.hsotg: DPTx[7] FSize=768, StAddr=0x00001600
>> [    0.984492] dwc2 12480000.hsotg: DPTx[8] FSize=768, StAddr=0x00001900
>> [    0.990915] dwc2 12480000.hsotg: DPTx[9] FSize=768, StAddr=0x00003a00
>> [    0.997339] dwc2 12480000.hsotg: DPTx[10] FSize=768, StAddr=0x00003d00
>> [    1.003848] dwc2 12480000.hsotg: DPTx[11] FSize=768, StAddr=0x00004000
>> [    1.010359] dwc2 12480000.hsotg: DPTx[12] FSize=768, StAddr=0x00004300
>> [    1.016869] dwc2 12480000.hsotg: DPTx[13] FSize=768, StAddr=0x00004600
>> [    1.023378] dwc2 12480000.hsotg: DPTx[14] FSize=768, StAddr=0x00004900
>> [    1.029895] dwc2 12480000.hsotg: DPTx[15] FSize=768, StAddr=0x00004c00
>> [    1.036400] dwc2 12480000.hsotg: ep0-in: EPCTL=0x00008000, SIZ=0x00000000, DMA=0xfaea717b
>> [    1.044560] dwc2 12480000.hsotg: ep0-out: EPCTL=0x00008000, SIZ=0x00000000, DMA=0x463c36f1
>> [    1.052805] dwc2 12480000.hsotg: ep1-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xc1c96fe3
>> [    1.060964] dwc2 12480000.hsotg: ep1-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x0a5ff495
>> [    1.069210] dwc2 12480000.hsotg: ep2-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x157e47e4
>> [    1.077369] dwc2 12480000.hsotg: ep2-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xf86e1204
>> [    1.085615] dwc2 12480000.hsotg: ep3-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x1165f7ee
>> [    1.093774] dwc2 12480000.hsotg: ep3-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x1826c196
>> [    1.102020] dwc2 12480000.hsotg: ep4-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xed08cae0
>> [    1.110179] dwc2 12480000.hsotg: ep4-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x10d40640
>> [    1.118425] dwc2 12480000.hsotg: ep5-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x5d89bf7a
>> [    1.126584] dwc2 12480000.hsotg: ep5-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xa2448680
>> [    1.134830] dwc2 12480000.hsotg: ep6-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x3ffe411c
>> [    1.142990] dwc2 12480000.hsotg: ep6-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x4b8c6202
>> [    1.151236] dwc2 12480000.hsotg: ep7-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x1973d37f
>> [    1.159395] dwc2 12480000.hsotg: ep7-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x2541e654
>> [    1.167641] dwc2 12480000.hsotg: ep8-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xbfde1ff2
>> [    1.175800] dwc2 12480000.hsotg: ep8-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x27341467
>> [    1.184051] dwc2 12480000.hsotg: ep9-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xd335fffd
>> [    1.192207] dwc2 12480000.hsotg: ep9-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xc8843b0d
>> [    1.200452] dwc2 12480000.hsotg: ep10-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xf66f29f7
>> [    1.208698] dwc2 12480000.hsotg: ep10-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x9ba428e6
>> [    1.217031] dwc2 12480000.hsotg: ep11-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xbb1f9b9d
>> [    1.225276] dwc2 12480000.hsotg: ep11-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x0d34b128
>> [    1.233609] dwc2 12480000.hsotg: ep12-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xf177e671
>> [    1.241856] dwc2 12480000.hsotg: ep12-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x85725105
>> [    1.250188] dwc2 12480000.hsotg: ep13-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0xe1557ecb
>> [    1.258434] dwc2 12480000.hsotg: ep13-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x8b013e1b
>> [    1.266766] dwc2 12480000.hsotg: ep14-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x37e77bee
>> [    1.275012] dwc2 12480000.hsotg: ep14-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x29a24008
>> [    1.283346] dwc2 12480000.hsotg: ep15-in: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x95c8ddee
>> [    1.291591] dwc2 12480000.hsotg: ep15-out: EPCTL=0x00000000, SIZ=0x00000000, DMA=0x10402de7
>> [    1.299923] dwc2 12480000.hsotg: DVBUSDIS=0x000017d7, DVBUSPULSE=000005b8
>> [    1.306912] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
>> [    1.313213] ehci-exynos: EHCI EXYNOS driver
>> [    1.317878] exynos-ehci 12580000.ehci: EHCI Host Controller
>> [    1.322958] exynos-ehci 12580000.ehci: new USB bus registered, assigned bus number 1
>> [    1.330955] exynos-ehci 12580000.ehci: irq 68, io mem 0x12580000
>> [    1.341699] exynos-ehci 12580000.ehci: USB 2.0 started, EHCI 1.00
>> [    1.342894] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
>> [    1.349490] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> [    1.356694] usb usb1: Product: EHCI Host Controller
>> [    1.361534] usb usb1: Manufacturer: Linux 4.1.0-rc2-debug+ ehci_hcd
>> [    1.367802] usb usb1: SerialNumber: 12580000.ehci
>> [    1.373360] hub 1-0:1.0: USB hub found
>> [    1.376235] hub 1-0:1.0: 3 ports detected
>> [    1.381237] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>> [    1.386397] ohci-exynos: OHCI EXYNOS driver
>> [    1.391074] usb3503 0-0008: Looking up ext-supply from device tree
>> [    1.391088] usb3503 0-0008: Looking up ext-supply property in node /i2c@13860000/usb3503@08 failed
>> [    1.606796] usb3503 0-0008: switched to HUB mode
>> [    1.606855] usb3503 0-0008: usb3503_probe: probed in hub mode
>> [    1.612295] max77686-rtc max77686-rtc: max77686_rtc_probe
>> [    1.716735] usb 1-2: new high-speed USB device number 2 using exynos-ehci
>> [    1.718456] rtc rtc0: max77686-rtc: dev (254:0)
>> [    1.718479] max77686-rtc max77686-rtc: rtc core: registered max77686-rtc as rtc0
>> [    1.726018] s3c-rtc 10070000.rtc: s3c2410_rtc: tick irq 65, alarm irq 64
>> [    1.726123] s3c-rtc 10070000.rtc: failed to find rtc source clock
>> [    1.731625] i2c /dev entries driver
>> [    1.736264] exynos-tmu 100c0000.tmu: Looking up vtmu-supply from device tree
>> [    1.737858] s3c2410-wdt 10060000.watchdog: watchdog inactive, reset disabled, irq disabled
>> [    1.743829] device-mapper: ioctl: 4.31.0-ioctl (2015-3-12) initialised: dm-devel@redhat.com
>> [    1.753589] sdhci: Secure Digital Host Controller Interface driver
>> [    1.757553] sdhci: Copyright(c) Pierre Ossman
>> [    1.762233] s3c-sdhci 12530000.sdhci: clock source 2: mmc_busclk.2 (100000000 Hz)
>> [    1.769400] s3c-sdhci 12530000.sdhci: Got CD GPIO
>> [    1.774315] s3c-sdhci 12530000.sdhci: Looking up vmmc-supply from device tree
>> [    1.774370] s3c-sdhci 12530000.sdhci: Looking up vqmmc-supply from device tree
>> [    1.801804] mmc0: SDHCI controller on samsung-hsmmc [12530000.sdhci] using ADMA
>> [    1.803615] Synopsys Designware Multimedia Card Interface Driver
>> [    1.810179] dwmmc_exynos 12550000.mmc: IDMAC supports 32-bit address mode.
>> [    1.816396] dwmmc_exynos 12550000.mmc: Using internal DMA controller.
>> [    1.822753] dwmmc_exynos 12550000.mmc: Version ID is 240a
>> [    1.828160] dwmmc_exynos 12550000.mmc: DW MMC controller at irq 120, 32 bit host data width, 128 deep fifo
>> [    1.837784] dwmmc_exynos 12550000.mmc: Looking up vmmc-supply from device tree
>> [    1.837835] dwmmc_exynos 12550000.mmc: Looking up vqmmc-supply from device tree
>> [    1.838022] dwmmc_exynos 12550000.mmc: allocated mmc-pwrseq
>> [    1.847021] usb 1-2: New USB device found, idVendor=0424, idProduct=3503
>> [    1.849991] usb 1-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>> [    1.857677] hub 1-2:1.0: USB hub found
>> [    1.860896] hub 1-2:1.0: 3 ports detected
>> [    1.871734] dwmmc_exynos 12550000.mmc: 1 slots initialized
>> [    1.872744] alg: skcipher: encryption failed on test 1 for ecb-aes-s5p: ret=22
>> [    1.878884] s5p-sss driver registered
>> [    1.882581] hidraw: raw HID events driver (C) Jiri Kosina
>> [    1.887989] usbcore: registered new interface driver usbhid
>> [    1.893384] usbhid: USB HID core driver
>> [    1.897650] exynos-memory-bus memory_bus@0: Looking up vdd-mem-supply from device tree
>> [    1.897892] exynos-memory-bus memory_bus@0: unable to get devfreq-event device : ppmu-event3-dmc0
>> [    1.906108] exynos-memory-bus memory_bus@0: failed to initialize memory-bus
>> [    1.913094] exynos-memory-bus memory_bus@1: Looking up vdd-mem-supply from device tree
>> [    1.913300] exynos-memory-bus memory_bus@1: unable to get devfreq-event device : ppmu-event3-leftbus
>> [    1.922157] exynos-memory-bus memory_bus@1: failed to initialize memory-bus
>> [    1.932582] oprofile: using arm/armv7-ca9
>> [    1.933680] NET: Registered protocol family 10
>> [    1.937986] sit: IPv6 over IPv4 tunneling driver
>> [    1.942596] NET: Registered protocol family 17
>> [    1.946602] ThumbEE CPU extension supported.
>> [    1.950753] Registering SWP/SWPB emulation handler
>> [    1.956569] s3c-rtc 10070000.rtc: s3c2410_rtc: tick irq 65, alarm irq 64
>> [    1.956916] s3c-rtc 10070000.rtc: s3c2410_rtc: RTCCON=01
>> [    1.956972] s3c-rtc 10070000.rtc: read time 2015.02.17 07:06:53
>> [    1.956995] s3c-rtc 10070000.rtc: read time 2015.02.17 07:06:53
>> [    1.957006] s3c-rtc 10070000.rtc: read alarm 0, 1900.00.00 00:00:00
>> [    1.957016] s3c-rtc 10070000.rtc: read time 2015.02.17 07:06:53
>> [    1.957023] rtc rtc1: alarm rollover: day
>> [    1.957033] s3c-rtc 10070000.rtc: read time 2015.02.17 07:06:53
>> [    1.957205] rtc rtc1: s3c: dev (254:1)
>> [    1.957219] s3c-rtc 10070000.rtc: rtc core: registered s3c as rtc1
>> [    1.962037] exynos-memory-bus memory_bus@0: Looking up vdd-mem-supply from device tree
>> [    1.962624] exynos-memory-bus memory_bus@1: Looking up vdd-mem-supply from device tree
>> [    1.986841] max98090 1-0010: MAX98090 REVID=0x43
>> [    1.991838] asoc-simple-card sound: HiFi <-> 3830000.i2s mapping ok
>> [    1.995035] input: gpio_keys as /devices/platform/gpio_keys/input/input0
>> [    2.016336] vdd_hdmi_1.0V: disabling
>> [    2.017365] ALSA device list:
>> [    2.017400]   #0: Odroid-X2
>> [    2.020316] Waiting for root device /dev/mmcblk0p2...
>> [    2.068120] mmc0: new high speed SDXC card at address aaaa
>> [    2.068524] mmcblk0: mmc0:aaaa SE64G 59.4 GiB 
>> [    2.073463]  mmcblk0: p1 p2 p3
>> [    2.136398] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
>> [    2.138872] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
>> [    2.145739] Freeing unused kernel memory: 228K (c06a3000 - c06dc000)
>> [    2.146787] usb 1-2.1: new high-speed USB device number 3 using exynos-ehci
>> [    2.252221] usb 1-2.1: New USB device found, idVendor=0424, idProduct=9514
>> [    2.253473] usb 1-2.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>> [    2.262134] hub 1-2.1:1.0: USB hub found
>> [    2.264949] hub 1-2.1:1.0: 5 ports detected
>> [    2.351966] usb 1-2.2: new high-speed USB device number 4 using exynos-ehci
>> [    2.462315] usb 1-2.2: New USB device found, idVendor=8564, idProduct=1000
>> [    2.463559] usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> [    2.470879] usb 1-2.2: Product: Mass Storage Device
>> [    2.475844] usb 1-2.2: Manufacturer: JetFlash
>> [    2.480098] usb 1-2.2: SerialNumber: 059FKI3OMNH24FV4
>> [    2.566973] usb 1-2.1.1: new high-speed USB device number 5 using exynos-ehci
>> [    2.672331] usb 1-2.1.1: New USB device found, idVendor=0424, idProduct=ec00
>> [    2.673746] usb 1-2.1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>> [    2.684870] smsc95xx v1.0.4
>> [    2.736342] smsc95xx 1-2.1.1:1.0 eth0: register 'smsc95xx' at usb-12580000.ehci-2.1.1, smsc95xx USB 2.0 Ethernet, ae:74:f4:b9:9c:4c
>> [    2.826794] usb 1-2.1.3: new full-speed USB device number 6 using exynos-ehci
>> [    2.935809] usb 1-2.1.3: New USB device found, idVendor=0b05, idProduct=17cb
>> [    2.937269] usb 1-2.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> [    2.944751] usb 1-2.1.3: Product: BCM20702A0
>> [    2.948981] usb 1-2.1.3: Manufacturer: Broadcom Corp
>> [    2.953943] usb 1-2.1.3: SerialNumber: 000272C64311
>> [    3.910324] systemd-udevd[1035]: starting version 216
>> [    3.956260] random: systemd-udevd urandom read with 40 bits of entropy available
>> [    4.166911] s5p-jpeg 11840000.jpeg-codec: sclk clock not available
>> [    4.167137] s5p-jpeg 11840000.jpeg-codec: encoder device registered as /dev/video0
>> [    4.167312] s5p-jpeg 11840000.jpeg-codec: decoder device registered as /dev/video1
>> [    4.167317] s5p-jpeg 11840000.jpeg-codec: Samsung S5P JPEG codec
>> [    4.220028] usb-storage 1-2.2:1.0: USB Mass Storage device detected
>> [    4.220486] scsi host0: usb-storage 1-2.2:1.0
>> [    4.227433] usbcore: registered new interface driver usb-storage
>> [    4.261527] Bluetooth: Core ver 2.20
>> [    4.261588] NET: Registered protocol family 31
>> [    4.261594] Bluetooth: HCI device and connection manager initialized
>> [    4.261613] Bluetooth: HCI socket layer initialized
>> [    4.261625] Bluetooth: L2CAP socket layer initialized
>> [    4.262569] Bluetooth: SCO socket layer initialized
>> [    4.321779] usbcore: registered new interface driver btusb
>> [    4.328530] Bluetooth: hci0: BCM: chip id 63
>> [    4.329532] Bluetooth: hci0: BCM20702A1 (001.002.014) build 0000
>> [    4.342542] bluetooth hci0: Direct firmware load for brcm/BCM20702A1-0b05-17cb.hcd failed with error -2
>> [    4.342559] Bluetooth: hci0: BCM: patch brcm/BCM20702A1-0b05-17cb.hcd not found
>> [    5.607589] scsi 0:0:0:0: Direct-Access     JetFlash Transcend 32GB   1100 PQ: 0 ANSI: 6
>> [    5.609550] sd 0:0:0:0: [sda] 61702144 512-byte logical blocks: (31.5 GB/29.4 GiB)
>> [    5.610410] sd 0:0:0:0: [sda] Write Protect is off
>> [    5.610419] sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
>> [    5.611308] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [    5.626977]  sda: sda1 sda2 sda3
>> [    5.631039] sd 0:0:0:0: [sda] Attached SCSI removable disk
>> [    5.976906] raid6: int32x1  gen()   253 MB/s
>> [    6.061767] raid6: int32x1  xor()   219 MB/s
>> [    6.146703] raid6: int32x2  gen()   344 MB/s
>> [    6.231703] raid6: int32x2  xor()   263 MB/s
>> [    6.316761] raid6: int32x4  gen()   397 MB/s
>> [    6.401717] raid6: int32x4  xor()   273 MB/s
>> [    6.486674] raid6: int32x8  gen()   393 MB/s
>> [    6.571969] raid6: int32x8  xor()   254 MB/s
>> [    6.656781] raid6: neonx1   gen()  1046 MB/s
>> [    6.741728] raid6: neonx2   gen()  1446 MB/s
>> [    6.826739] raid6: neonx4   gen()  1503 MB/s
>> [    6.909713] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
>> [    6.911704] raid6: neonx8   gen()  1042 MB/s
>> [    6.911719] raid6: using algorithm neonx4 gen() 1503 MB/s
>> [    6.911731] raid6: using intx1 recovery algorithm
>> [    6.923619] xor: measuring software checksum speed
>> [    6.971708]    arm4regs  :  2887.200 MB/sec
>> [    7.021701]    8regs     :  1896.800 MB/sec
>> [    7.071699]    32regs    :  1459.200 MB/sec
>> [    7.121697]    neon      :  1756.800 MB/sec
>> [    7.121709] xor: using function: arm4regs (2887.200 MB/sec)
>> [    7.229707] Btrfs loaded
>> [    7.232454] BTRFS: device label odroid_portage devid 1 transid 473 /dev/sda1
>> [    7.259786] EXT4-fs (sda2): mounting ext3 file system using the ext4 subsystem
>> [    7.271365] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
>> [    7.286692] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
>> [    7.289609] EXT4-fs (mmcblk0p3): mounting ext3 file system using the ext4 subsystem
>> [    7.303613] EXT4-fs (mmcblk0p3): mounted filesystem with ordered data mode. Opts: (null)
>> [    7.645277] random: nonblocking pool is initialized
>> [    9.578598] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>> [    9.578626] Bluetooth: BNEP socket layer initialized
>> [    9.842243] bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.
>> [    9.865029] device br0 entered promiscuous mode
>> [   13.865314] smsc95xx 1-2.1.1:1.0 eth0: hardware isn't capable of remote wakeup
>> [   13.865405] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>> [   34.735378] device bnep0 entered promiscuous mode
>> [   34.737823] br0: port 1(bnep0) entered forwarding state
>> [   34.737920] br0: port 1(bnep0) entered forwarding state
>> [   34.744828] ------------[ cut here ]------------
>> [   34.744903] WARNING: CPU: 1 PID: 2276 at kernel/sched/core.c:7291 __might_sleep+0x94/0xa0()
>> [   34.744957] do not call blocking ops when !TASK_RUNNING; state=1 set at [<bf245250>] bnep_session+0xa4/0x858 [bnep]
>> [   34.744981] Modules linked in: cmac ecb bridge stp llc bnep btrfs xor xor_neon zlib_inflate zlib_deflate raid6_pq btusb btbcm btintel bluetooth usb_storage s5p_jpeg videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_core
>> [   34.745233] CPU: 1 PID: 2276 Comm: kbnepd bnep0 Not tainted 4.1.0-rc2-debug+ #4
>> [   34.745257] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [   34.745277] Backtrace: 
>> [   34.745341] [<c0013270>] (dump_backtrace) from [<c0013488>] (show_stack+0x18/0x1c)
>> [   34.745363]  r6:c06f9a08 r5:ffffffff r4:00000000 r3:dc8ba300
>> [   34.745454] [<c0013470>] (show_stack) from [<c04f1d98>] (dump_stack+0x88/0xc8)
>> [   34.745502] [<c04f1d10>] (dump_stack) from [<c002e634>] (warn_slowpath_common+0x88/0xb8)
>> [   34.745522]  r6:c0604f3c r5:00001c7b r4:edbb3da8 r3:dc8ba300
>> [   34.745597] [<c002e5ac>] (warn_slowpath_common) from [<c002e69c>] (warn_slowpath_fmt+0x38/0x40)
>> [   34.745617]  r8:edb56c00 r7:c0713770 r6:00000000 r5:00000943 r4:c06648d8
>> [   34.745703] [<c002e668>] (warn_slowpath_fmt) from [<c004e068>] (__might_sleep+0x94/0xa0)
>> [   34.745722]  r3:00000001 r2:c0605064
>> [   34.745780] [<c004dfd4>] (__might_sleep) from [<c040ce7c>] (lock_sock_nested+0x28/0x6c)
>> [   34.745801]  r7:00000004 r6:edba2c00 r5:edba2460 r4:edba2400
>> [   34.745996] [<c040ce54>] (lock_sock_nested) from [<bf06a474>] (l2cap_sock_sendmsg+0x48/0xe4 [bluetooth])
>> [   34.746020]  r5:ec12ad2c r4:edba2400
>> [   34.746183] [<bf06a42c>] (l2cap_sock_sendmsg [bluetooth]) from [<c04097e8>] (sock_sendmsg+0x1c/0x2c)
>> [   34.746213]  r8:edb56c00 r7:ec12a800 r6:edba248c r5:ec8748c0 r4:ec12ad2c r3:bf06a42c
>> [   34.746342] [<c04097cc>] (sock_sendmsg) from [<c04098ec>] (kernel_sendmsg+0x38/0x40)
>> [   34.746405] [<c04098b4>] (kernel_sendmsg) from [<bf245050>] (bnep_send_rsp+0x50/0x58 [bnep])
>> [   34.746431]  r5:ec8748c0 r4:00000100
>> [   34.746514] [<bf245000>] (bnep_send_rsp [bnep]) from [<bf2450d4>] (bnep_rx_control+0x7c/0x154 [bnep])
>> [   34.746542]  r5:00000001 r4:ec12ad00
>> [   34.746815] [<bf245058>] (bnep_rx_control [bnep]) from [<bf245820>] (bnep_session+0x674/0x858 [bnep])
>> [   34.746846]  r5:00000001 r4:ec12ad00
>> [   34.746940] [<bf2451ac>] (bnep_session [bnep]) from [<c0048ae8>] (kthread+0xf4/0x110)
>> [   34.746961]  r10:00000000 r9:00000000 r8:00000000 r7:bf2451ac r6:ec12ad00 r5:00000000
>> [   34.747031]  r4:ec0d2d00
>> [   34.747086] [<c00489f4>] (kthread) from [<c000fac0>] (ret_from_fork+0x14/0x34)
>> [   34.747106]  r7:00000000 r6:00000000 r5:c00489f4 r4:ec0d2d00
>> [   34.747167] ---[ end trace 2dd031423862af06 ]---
>> [  133.283940] Unable to handle kernel NULL pointer dereference at virtual address 000000a4
>> [  133.283962] pgd = ec35c000
>> [  133.283976] [000000a4] *pgd=6c32d831, *pte=00000000, *ppte=00000000
>> [  133.284010] Internal error: Oops: 17 [#1] PREEMPT SMP ARM
>> [  133.284084] Modules linked in: cmac ecb bridge stp llc bnep btrfs xor xor_neon zlib_inflate zlib_deflate raid6_pq btusb btbcm btintel bluetooth usb_storage s5p_jpeg videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_core
>> [  133.304170] CPU: 2 PID: 2430 Comm: lt-modetest Tainted: G        W       4.1.0-rc2-debug+ #4
>> [  133.312582] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [  133.318661] task: ec2af8c0 ti: ec166000 task.ti: ec166000
>> [  133.324053] PC is at exynos_plane_atomic_update+0x44/0x2a8
>> [  133.329520] LR is at drm_atomic_helper_commit_planes+0xd8/0x1bc
>> [  133.335415] pc : [<c02b4130>]    lr : [<c028c2ec>]    psr: 60070053
>> sp : ec167d38  ip : 00000000  fp : ec167d84
>> [  133.346868] r10: 00000001  r9 : ee32c400  r8 : 00000000
>> [  133.352077] r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : ee15a308
>> [  133.358587] r3 : 00000000  r2 : ec112580  r1 : 00000000  r0 : 00000000
>> [  133.365099] Flags: nZCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment user
>> [  133.372297] Control: 10c5387d  Table: 6c35c04a  DAC: 00000015
>> [  133.378025] Process lt-modetest (pid: 2430, stack limit = 0xec166218)
>> [  133.384449] Stack: (0xec167d38 to 0xec168000)
>> [  133.388790] 7d20:                                                       ee272800 00000000
>> [  133.396950] 7d40: ec112300 ee32c400 ec167d7c ec167d58 00000000 c02b1b54 ec112300 ec112300
>> [  133.405109] 7d60: 00000000 ee15a308 ed957780 c053d40c ee32c400 00000001 ec167dac ec167d88
>> [  133.413268] 7d80: c028c2ec c02b40f8 00000000 0000000b ec112300 00000000 ee272800 00000000
>> [  133.421427] 7da0: ec167dd4 ec167db0 c028e69c c028c220 c02b2774 ec112300 ee272800 ee100200
>> [  133.429586] 7dc0: 00000000 ee32c400 ec167de4 ec167dd8 c02b2788 c028e590 ec167dfc ec167de8
>> [  133.437745] 7de0: c02af91c c02b2780 00000003 ec112300 ec167e34 ec167e00 c028d24c c02af8dc
>> [  133.445905] 7e00: c02aea0c c02ae484 00000000 00000000 00000028 00000001 ee32c400 ee100300
>> [  133.454064] 7e20: ee272800 00000000 ec167e54 ec167e38 c029f140 c028cf3c 00000000 00000028
>> [  133.462223] 7e40: 00000001 ee100200 ec167e8c ec167e58 c0290c28 c029f0ec ec167e7c ec167e68
>> [  133.470383] 7e60: c004fc84 ee272800 c0749014 ee272858 ee272800 ee272834 edbc4780 ee27294c
>> [  133.478541] 7e80: ec167e9c ec167e90 c02b264c c0290b48 ec167eac ec167ea0 c02b105c c02b2630
>> [  133.486701] 7ea0: ec167ecc ec167eb0 c0294560 c02b1058 00000000 edb4c800 edb4c8a8 ee272858
>> [  133.494860] 7ec0: ec167f1c ec167ed0 c0294970 c0294530 c004fc84 ec102308 00000001 00000002
>> [  133.503019] 7ee0: ee272800 60070053 ee272954 ee102680 c004e03c ec102300 ee11b090 ee182e10
>> [  133.511178] 7f00: edc0dc78 ee11b090 00000008 00000000 ec167f5c ec167f20 c0103c14 c029463c
>> [  133.519337] 7f20: 00000000 00000000 00000000 ec102308 ec167f54 ec2afcc4 00000000 c0718ef8
>> [  133.527497] 7f40: ec2af8c0 c000fbc4 ec166000 00000000 ec167f6c ec167f60 c0103dc4 c0103b80
>> [  133.535656] 7f60: ec167f8c ec167f70 c0047310 c0103dc0 ec166000 c000fbc4 ec167fb0 00000006
>> [  133.543815] 7f80: ec167fac ec167f90 c0012e88 c0047264 00000000 00000003 00000001 00000000
>> [  133.551974] 7fa0: 00000000 ec167fb0 c000fa64 c0012e0c 00000000 00000000 013b8450 00000000
>> [  133.560133] 7fc0: 00000003 00000001 00000000 00000006 000120a4 0001b354 be8fd2b3 00000000
>> [  133.568293] 7fe0: 00000000 be8fcda4 b6f1975c b6ef257c 60070050 00000003 00000000 00000000
>> [  133.576449] Backtrace: 
>> [  133.578887] [<c02b40ec>] (exynos_plane_atomic_update) from [<c028c2ec>] (drm_atomic_helper_commit_planes+0xd8/0x1bc)
>> [  133.589383]  r10:00000001 r9:ee32c400 r8:c053d40c r7:ed957780 r6:ee15a308 r5:00000000
>> [  133.597195]  r4:ec112300
>> [  133.599717] [<c028c214>] (drm_atomic_helper_commit_planes) from [<c028e69c>] (drm_atomic_helper_commit+0x118/0x170)
>> [  133.610128]  r8:00000000 r7:ee272800 r6:00000000 r5:ec112300 r4:0000000b r3:00000000
>> [  133.617857] [<c028e584>] (drm_atomic_helper_commit) from [<c02b2788>] (exynos_atomic_commit+0x14/0x18)
>> [  133.627141]  r8:ee32c400 r7:00000000 r6:ee100200 r5:ee272800 r4:ec112300 r3:c02b2774
>> [  133.634869] [<c02b2774>] (exynos_atomic_commit) from [<c02af91c>] (drm_atomic_commit+0x4c/0x6c)
>> [  133.643549] [<c02af8d0>] (drm_atomic_commit) from [<c028d24c>] (drm_atomic_helper_set_config+0x31c/0x428)
>> [  133.653094]  r5:ec112300 r4:00000003
>> [  133.656660] [<c028cf30>] (drm_atomic_helper_set_config) from [<c029f140>] (drm_mode_set_config_internal+0x60/0xdc)
>> [  133.666982]  r10:00000000 r9:ee272800 r8:ee100300 r7:ee32c400 r6:00000001 r5:00000028
>> [  133.674794]  r4:00000000
>> [  133.677317] [<c029f0e0>] (drm_mode_set_config_internal) from [<c0290c28>] (drm_fb_helper_restore_fbdev_mode_unlocked+0xec/0x140)
>> [  133.688856]  r7:ee100200 r6:00000001 r5:00000028 r4:00000000
>> [  133.694501] [<c0290b3c>] (drm_fb_helper_restore_fbdev_mode_unlocked) from [<c02b264c>] (exynos_drm_fbdev_restore_mode+0x28/0x2c)
>> [  133.706042]  r10:ee27294c r9:edbc4780 r8:ee272834 r7:ee272800 r6:ee272858 r5:c0749014
>> [  133.713854]  r4:ee272800
>> [  133.716374] [<c02b2624>] (exynos_drm_fbdev_restore_mode) from [<c02b105c>] (exynos_drm_lastclose+0x10/0x14)
>> [  133.726096] [<c02b104c>] (exynos_drm_lastclose) from [<c0294560>] (drm_lastclose+0x3c/0x10c)
>> [  133.734514] [<c0294524>] (drm_lastclose) from [<c0294970>] (drm_release+0x340/0x4e0)
>> [  133.742238]  r6:ee272858 r5:edb4c8a8 r4:edb4c800 r3:00000000
>> [  133.747885] [<c0294630>] (drm_release) from [<c0103c14>] (__fput+0xa0/0x1e4)
>> [  133.754910]  r10:00000000 r9:00000008 r8:ee11b090 r7:edc0dc78 r6:ee182e10 r5:ee11b090
>> [  133.762722]  r4:ec102300
>> [  133.765243] [<c0103b74>] (__fput) from [<c0103dc4>] (____fput+0x10/0x14)
>> [  133.771923]  r10:00000000 r9:ec166000 r8:c000fbc4 r7:ec2af8c0 r6:c0718ef8 r5:00000000
>> [  133.779735]  r4:ec2afcc4
>> [  133.782258] [<c0103db4>] (____fput) from [<c0047310>] (task_work_run+0xb8/0xfc)
>> [  133.789550] [<c0047258>] (task_work_run) from [<c0012e88>] (do_work_pending+0x88/0xa8)
>> [  133.797442]  r7:00000006 r6:ec167fb0 r5:c000fbc4 r4:ec166000
>> [  133.803088] [<c0012e00>] (do_work_pending) from [<c000fa64>] (work_pending+0xc/0x20)
>> [  133.810809]  r6:00000000 r5:00000001 r4:00000003 r3:00000000
>> [  133.816454] Code: e5927014 e5921018 e592301c e1d202be (e59590a4) 
>> [  133.822608] ---[ end trace 2dd031423862af07 ]---
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

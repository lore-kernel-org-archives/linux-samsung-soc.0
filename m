From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFT 0/3] usb: usb3503: Fix probing on Arndale board (missing phy)
Date: Fri, 09 Oct 2015 12:18:19 -0700
Message-ID: <7hoag797gk.fsf@deeprootsystems.com>
References: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:35139 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754127AbbJITSW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Oct 2015 15:18:22 -0400
Received: by pabve7 with SMTP id ve7so35800487pab.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2015 12:18:21 -0700 (PDT)
In-Reply-To: <1444177807-15524-1-git-send-email-k.kozlowski@samsung.com>
	(Krzysztof Kozlowski's message of "Wed, 07 Oct 2015 09:30:04 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@freescale.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Ben Gamari <ben@smart-cactus.org>, Wolfram Sang <wsa@the-dreams.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, riku.voipio@linaro.org

--=-=-=
Content-Type: text/plain

Hi Krzystof,

Krzysztof Kozlowski <k.kozlowski@samsung.com> writes:

> Introduction
> ============
> This patchset tries to fix probing of usb3503 on Arndale board
> if the Samsung PHY driver is probed later (or built as a module).
>
> *The patchset was not tested on Arndale board.*
> I don't have that board. Please test it and say if the usb3503 deferred probe
> works fine and the issue is solved.

FYI... I built this series on top of  next-20151009 and using
exynos_defconfig.  I booted it on my arndale, and I still don't see the
networking come up.  Full boot log attached.

Kevin


--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=boot-arndale.txt

Connected to arndale console [channel connected] (~$quit to exit)
(user:khilman) is already connected


# PYBOOT: console: connected.
~$hardreset

Command(arndale console)> hardreset
(user:khilman) Reboot arndale


U-Boot 2013.01.-rc1-dirty (Jun 28 2013 - 07:14:48) for ARNDALE5250

CPU:Exynos5250@1000MHz

Board:  for ARNDALE5250
I2C:   ready
DRAM:  2 GiB
WARNING: Caches not enabled

Checking Boot Mode ... SDMMC
MMC:   EXYNOS DWMMC: 0, EXYNOS DWMMC: 1, EXYNOS DWMMC: 2
In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
(Re)start USB...
USB0:   USB EHCI 1.00
scanning bus 0 for devices... 4 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
       scanning usb for ethernet devices... 1 Ethernet Device(s) found
Hit any key to stop autoboot: 

# PYBOOT: u-boot: taking control.
 3  0 
ARNDALE5250 # 
ARNDALE5250 # version
version

U-Boot 2013.01.-rc1-dirty (Jun 28 2013 - 07:14:48) for ARNDALE5250
arm-linux-gnueabi-gcc (Ubuntu/Linaro 4.7.2-1ubuntu1) 4.7.2
GNU ld (GNU Binutils for Ubuntu) 2.22.90.20120919
ARNDALE5250 # setenv bootargs console=tty0 console=ttySAC2,115200n8 rw root=/dev/mmcblk1p3 rootwait rootfstype=ext4
setenv bootargs console=tty0 console=ttySAC2,115200n8 rw root=/dev/mmcblk1p3 rootwait rootfstype=ext4
ARNDALE5250 # setenv netargs 'setenv bootargs ${bootargs} "ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:::none:192.168.1.3"'
setenv netargs 'setenv bootargs ${bootargs} "ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:::none:192.168.1.3"'
ARNDALE5250 # if test -n ${initenv}; then run initenv; fi
if test -n ${initenv}; then run initenv; fi
ARNDALE5250 # if test -n ${preboot}; then run preboot; fi
if test -n ${preboot}; then run preboot; fi
(Re)start USB...
USB0:   USB EHCI 1.00
scanning bus 0 for devices... 4 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
       scanning usb for ethernet devices... 1 Ethernet Device(s) found
ARNDALE5250 # setenv autoload no; setenv autoboot no
setenv autoload no; setenv autoboot no
ARNDALE5250 #dhcp
 dhcp
Waiting for Ethernet connection... done.
BOOTP broadcast 1
DHCP client bound to address 192.168.1.167
ARNDALE5250 #setenv serverip 192.168.1.2
 setenv serverip 192.168.1.2
ARNDALE5250 # if test -n ${netargs}; then run netargs; fi
if test -n ${netargs}; then run netargs; fi
ARNDALE5250 # tftp 0x41000000 192.168.1.2:tmp/arndale-o13inu/zImage
tftp 0x41000000 192.168.1.2:tmp/arndale-o13inu/zImage
Waiting for Ethernet connection... done.
Using asx0 device
TFTP from server 192.168.1.2; our IP address is 192.168.1.167
Filename 'tmp/arndale-o13inu/zImage'.
Load address: 0x41000000
Loading: *#################################################################
 #################################################################
 #################################################################
 #################################################################
 ###########################
done
Bytes transferred = 4209056 (4039a0 hex)
ARNDALE5250 # tftp 0x42000000 192.168.1.2:tmp/arndale-o13inu/initrd-vFFjKf.cpio.gz
tftp 0x42000000 192.168.1.2:tmp/arndale-o13inu/initrd-vFFjKf.cpio.gz
Waiting for Ethernet connection... done.
Using asx0 device
TFTP from server 192.168.1.2; our IP address is 192.168.1.167
Filename 'tmp/arndale-o13inu/initrd-vFFjKf.cpio.gz'.
Load address: 0x42000000
Loading: *#################################################################
 #################################################################
 #################################################################
 #################################################################
 #################################################################
 ################
done
Bytes transferred = 5001043 (4c4f53 hex)
ARNDALE5250 #tftp 0x41f00000 192.168.1.2:tmp/arndale-o13inu/tmp_2g_yE.dtb
 tftp 0x41f00000 192.168.1.2:tmp/arndale-o13inu/tmp_2g_yE.dtb
Waiting for Ethernet connection... done.
Using asx0 device
TFTP from server 192.168.1.2; our IP address is 192.168.1.167
Filename 'tmp/arndale-o13inu/tmp_2g_yE.dtb'.
Load address: 0x41f00000
Loading: *###
done
Bytes transferred = 42207 (a4df hex)
ARNDALE5250 # printenv bootargs
printenv bootargs
bootargs=console=tty0 console=ttySAC2,115200n8 rw root=/dev/mmcblk1p3 rootwait rootfstype=ext4 ip=192.168.1.167:192.168.1.2:192.168.1.254:255.255.255.0:::none:192.168.1.3
ARNDALE5250 #bootz 0x41000000 - 0x41f00000

# PYBOOT: u-boot: jumping to kernel image
 bootz 0x41000000 - 0x41f00000
## Flattened Device Tree blob at 41f00000
   Booting using the fdt blob at 0x41f00000
   Using Device Tree in place at 41f00000, end 41f0d4de

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.3.0-rc4-next-20151009-06709-g4b92b96f4ad7 (khilman@paris) (gcc version 4.7.3 (Ubuntu/Linaro 4.7.3-12ubuntu1) ) #15 SMP PREEMPT Fri Oct 9 11:32:11 PDT 2015
[    0.000000] CPU: ARMv7 Processor [410fc0f4] revision 4 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] Machine model: Insignal Arndale evaluation board based on EXYNOS5250
[    0.000000] cma: Reserved 64 MiB at 0xbc000000
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Samsung CPU ID: 0x43520010
[    0.000000] PERCPU: Embedded 12 pages/cpu @eefaa000 s18880 r8192 d22080 u49152
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 518656
[    0.000000] Kernel command line: console=tty0 console=ttySAC2,115200n8 rw root=/dev/mmcblk1p3 rootwait rootfstype=ext4 ip=192.168.1.167:192.168.1.2:192.168.1.254:255.255.255.0:::none:192.168.1.3
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 1984248K/2080768K available (5642K kernel code, 238K rwdata, 2020K rodata, 424K init, 315K bss, 30984K reserved, 65536K cma-reserved, 1245184K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0783e2c   (7664 kB)
[    0.000000]       .init : 0xc0784000 - 0xc07ee000   ( 424 kB)
[    0.000000]       .data : 0xc07ee000 - 0xc0829ac0   ( 239 kB)
[    0.000000]        .bss : 0xc082c000 - 0xc087ac98   ( 316 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] Build-time adjustment of leaf fanout to 32.
[    0.000000] RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=32, nr_cpu_ids=2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] GIC physical location is 0x10481000
[    0.000000] L2C: failed to init: -19
[    0.000000] Exynos5250: clock setup completed, armclk=1000000000
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000000] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.000000] Switching to timer-based delay loop, resolution 41ns
[    0.000005] Ignoring duplicate/late registration of read_current_timer delay
[    0.000019] clocksource: mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
[    0.000036] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
[    0.000500] Console: colour dummy device 80x30
[    0.001021] console [tty0] enabled
[    0.001050] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=120000)
[    0.001088] pid_max: default: 32768 minimum: 301
[    0.001255] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001279] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001883] CPU: Testing write buffer coherency: ok
[    0.002098] CPU0: update cpu_capacity 1024
[    0.002120] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.002237] Setting up static identity map for 0x40008280 - 0x400082d8
[    0.045354] CPU1: update cpu_capacity 1024
[    0.045359] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.045430] Brought up 2 CPUs
[    0.045476] SMP: Total of 2 processors activated (96.00 BogoMIPS).
[    0.045493] CPU: All CPU(s) started in HYP mode.
[    0.045509] CPU: Virtualization extensions available.
[    0.046537] devtmpfs: initialized
[    0.062748] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.063475] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 9556302231375000 ns
[    0.064645] pinctrl core: initialized pinctrl subsystem
[    0.065743] NET: Registered protocol family 16
[    0.066740] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.080285] cpuidle: using governor ladder
[    0.095321] cpuidle: using governor menu
[    0.100126] exynos-audss-clk 3810000.audss-clock-controller: setup completed
[    0.167935] SCSI subsystem initialized
[    0.168227] usbcore: registered new interface driver usbfs
[    0.168314] usbcore: registered new interface driver hub
[    0.169201] usbcore: registered new device driver usb
[    0.170046] s3c-i2c 12c60000.i2c: slave address 0x66
[    0.170072] s3c-i2c 12c60000.i2c: bus frequency set to 18 KHz
[    0.491736] VDD_33ON_2.8V: Failed to create debugfs directory
[    0.647588] s3c-i2c 12c60000.i2c: i2c-0: S3C I2C adapter
[    0.647751] s3c-i2c 12c80000.i2c: slave address 0x50
[    0.647775] s3c-i2c 12c80000.i2c: bus frequency set to 65 KHz
[    0.648150] s3c-i2c 12c80000.i2c: i2c-2: S3C I2C adapter
[    0.648290] s3c-i2c 12c90000.i2c: slave address 0x00
[    0.648314] s3c-i2c 12c90000.i2c: bus frequency set to 65 KHz
[    0.648662] s3c-i2c 12c90000.i2c: i2c-3: S3C I2C adapter
[    0.648761] s3c-i2c 12ce0000.i2c: slave address 0x38
[    0.648783] s3c-i2c 12ce0000.i2c: bus frequency set to 65 KHz
[    0.649129] s3c-i2c 12ce0000.i2c: i2c-8: S3C I2C adapter
[    0.649236] s3c-i2c 121d0000.i2c: slave address 0x38
[    0.649258] s3c-i2c 121d0000.i2c: bus frequency set to 39 KHz
[    0.649552] s3c-i2c 121d0000.i2c: i2c-9: S3C I2C adapter
[    0.650097] s2mps11-clk s5m8767-clk: could not find clock sub-node
[    0.650130] s2mps11-clk: probe of s5m8767-clk failed with error -22
[    0.650516] Advanced Linux Sound Architecture Driver Initialized.
[    0.652521] clocksource: Switched to clocksource arch_sys_counter
[    0.664490] NET: Registered protocol family 2
[    0.664944] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.665041] TCP bind hash table entries: 8192 (order: 5, 163840 bytes)
[    0.665217] TCP: Hash tables configured (established 8192 bind 8192)
[    0.665277] UDP hash table entries: 512 (order: 2, 24576 bytes)
[    0.665327] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes)
[    0.665506] NET: Registered protocol family 1
[    0.665771] RPC: Registered named UNIX socket transport module.
[    0.665793] RPC: Registered udp transport module.
[    0.665809] RPC: Registered tcp transport module.
[    0.665824] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.666024] Trying to unpack rootfs image as initramfs...
[    0.938249] Freeing initrd memory: 4884K (c2000000 - c24c5000)
[    0.939603] futex hash table entries: 512 (order: 3, 32768 bytes)
[    0.952560] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    0.953717] bounce: pool size: 64 pages
[    0.953745] io scheduler noop registered
[    0.953770] io scheduler deadline registered
[    0.954005] io scheduler cfq registered (default)
[    0.956204] 12100000.phy supply vbus not found, using dummy regulator
[    0.956293] 12100000.phy supply vbus-boost not found, using dummy regulator
[    0.961350] dma-pl330 121a0000.pdma: Loaded driver for PL330 DMAC-241330
[    0.961381] dma-pl330 121a0000.pdma: DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.964976] dma-pl330 121b0000.pdma: Loaded driver for PL330 DMAC-241330
[    0.965004] dma-pl330 121b0000.pdma: DBUFF-32x4bytes Num_Chans-8 Num_Peri-32 Num_Events-32
[    0.966057] dma-pl330 10800000.mdma: Loaded driver for PL330 DMAC-241330
[    0.966084] dma-pl330 10800000.mdma: DBUFF-64x8bytes Num_Chans-8 Num_Peri-1 Num_Events-32
[    0.967115] dma-pl330 11c10000.mdma: Loaded driver for PL330 DMAC-241330
[    0.967140] dma-pl330 11c10000.mdma: DBUFF-64x8bytes Num_Chans-8 Num_Peri-1 Num_Events-32
[    1.041727] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.043705] 12c00000.serial: ttySAC0 at MMIO 0x12c00000 (irq = 56, base_baud = 0) is a S3C6400/10
[    1.044148] 12c10000.serial: ttySAC1 at MMIO 0x12c10000 (irq = 57, base_baud = 0) is a S3C6400/10
[    1.044549] 12c20000.serial: ttySAC2 at MMIO 0x12c20000 (irq = 58, base_baud = 0) is a S3C6400/10
[    1.804319] console [ttySAC2] enabled
[    1.808353] 12c30000.serial: ttySAC3 at MMIO 0x12c30000 (irq = 59, base_baud = 0) is a S3C6400/10
[    1.818298] [drm] Initialized drm 1.1.0 20060810
[    1.822549] of_graph_get_next_endpoint(): no port node found in /dp-controller@145B0000
[    1.839670] exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
[    1.846168] exynos-drm exynos-drm: bound 145b0000.dp-controller (ops exynos_dp_ops)
[    1.853287] exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
[    1.860856] exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
[    1.867943] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.874528] [drm] No driver support for vblank timestamp query.
[    1.892099] Division by zero in kernel.
[    1.892108] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.3.0-rc4-next-20151009-06709-g4b92b96f4ad7 #15
[    1.892110] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    1.892131] [<c001554c>] (unwind_backtrace) from [<c00122e0>] (show_stack+0x10/0x14)
[    1.892145] [<c00122e0>] (show_stack) from [<c01f19b0>] (dump_stack+0x70/0xbc)
[    1.892157] [<c01f19b0>] (dump_stack) from [<c01f04f4>] (Ldiv0+0x8/0x10)
[    1.892168] [<c01f04f4>] (Ldiv0) from [<c02a672c>] (fimd_commit+0x1f0/0x2b0)
[    1.892178] [<c02a672c>] (fimd_commit) from [<c02a4000>] (exynos_drm_crtc_enable+0x1c/0x28)
[    1.892189] [<c02a4000>] (exynos_drm_crtc_enable) from [<c027f658>] (drm_atomic_helper_commit_modeset_enables+0x94/0x190)
[    1.892200] [<c027f658>] (drm_atomic_helper_commit_modeset_enables) from [<c02a3ac0>] (exynos_atomic_commit_complete+0x2c/0x1c4)
[    1.892209] [<c02a3ac0>] (exynos_atomic_commit_complete) from [<c02a3e94>] (exynos_atomic_commit+0x17c/0x1c4)
[    1.892219] [<c02a3e94>] (exynos_atomic_commit) from [<c02a0e90>] (drm_atomic_commit+0x40/0x64)
[    1.892229] [<c02a0e90>] (drm_atomic_commit) from [<c0281cf4>] (restore_fbdev_mode+0x2c8/0x2ec)
[    1.892240] [<c0281cf4>] (restore_fbdev_mode) from [<c0282c44>] (drm_fb_helper_restore_fbdev_mode_unlocked+0x2c/0x74)
[    1.892249] [<c0282c44>] (drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0282cb8>] (drm_fb_helper_set_par+0x2c/0x54)
[    1.892259] [<c0282cb8>] (drm_fb_helper_set_par) from [<c0228fe0>] (fbcon_init+0x47c/0x4e4)
[    1.892268] [<c0228fe0>] (fbcon_init) from [<c025fc20>] (visual_init+0xb4/0x100)
[    1.892277] [<c025fc20>] (visual_init) from [<c0261bd8>] (do_bind_con_driver+0x134/0x350)
[    1.892286] [<c0261bd8>] (do_bind_con_driver) from [<c0261f64>] (do_take_over_console+0x170/0x1d8)
[    1.892295] [<c0261f64>] (do_take_over_console) from [<c02290ac>] (do_fbcon_takeover+0x64/0xcc)
[    1.892305] [<c02290ac>] (do_fbcon_takeover) from [<c003ce7c>] (notifier_call_chain+0x44/0x84)
[    1.892315] [<c003ce7c>] (notifier_call_chain) from [<c003d08c>] (__blocking_notifier_call_chain+0x48/0x60)
[    1.892324] [<c003d08c>] (__blocking_notifier_call_chain) from [<c003d0bc>] (blocking_notifier_call_chain+0x18/0x20)
[    1.892334] [<c003d0bc>] (blocking_notifier_call_chain) from [<c022e5e4>] (register_framebuffer+0x184/0x268)
[    1.892345] [<c022e5e4>] (register_framebuffer) from [<c0283850>] (drm_fb_helper_initial_config+0x24c/0x3fc)
[    1.892354] [<c0283850>] (drm_fb_helper_initial_config) from [<c02a4754>] (exynos_drm_fbdev_init+0xec/0x14c)
[    1.892362] [<c02a4754>] (exynos_drm_fbdev_init) from [<c02789ac>] (drm_kms_helper_hotplug_event+0x24/0x28)
[    1.892370] [<c02789ac>] (drm_kms_helper_hotplug_event) from [<c02791fc>] (drm_helper_hpd_irq_event+0xd0/0x158)
[    1.892377] [<c02791fc>] (drm_helper_hpd_irq_event) from [<c02a38c0>] (exynos_drm_load+0x140/0x15c)
[    1.892385] [<c02a38c0>] (exynos_drm_load) from [<c028bfc4>] (drm_dev_register+0xa0/0xb4)
[    1.892394] [<c028bfc4>] (drm_dev_register) from [<c028d950>] (drm_platform_init+0x40/0xd0)
[    1.892403] [<c028d950>] (drm_platform_init) from [<c02b61d0>] (try_to_bring_up_master.part.0+0xcc/0x108)
[    1.892412] [<c02b61d0>] (try_to_bring_up_master.part.0) from [<c02b62b4>] (component_master_add_with_match+0xa8/0x124)
[    1.892420] [<c02b62b4>] (component_master_add_with_match) from [<c02a399c>] (exynos_drm_platform_probe+0xc0/0xdc)
[    1.892429] [<c02a399c>] (exynos_drm_platform_probe) from [<c02bb9cc>] (platform_drv_probe+0x50/0xac)
[    1.892436] [<c02bb9cc>] (platform_drv_probe) from [<c02ba43c>] (driver_probe_device+0x1e0/0x2a0)
[    1.892443] [<c02ba43c>] (driver_probe_device) from [<c02ba588>] (__driver_attach+0x8c/0x90)
[    1.892451] [<c02ba588>] (__driver_attach) from [<c02b8b58>] (bus_for_each_dev+0x54/0x88)
[    1.892461] [<c02b8b58>] (bus_for_each_dev) from [<c02b9b1c>] (bus_add_driver+0xe8/0x1f4)
[    1.892469] [<c02b9b1c>] (bus_add_driver) from [<c02bad54>] (driver_register+0x78/0xf4)
[    1.892477] [<c02bad54>] (driver_register) from [<c02a3a50>] (exynos_drm_register_drivers+0x24/0x68)
[    1.892484] [<c02a3a50>] (exynos_drm_register_drivers) from [<c02a3ce4>] (exynos_drm_init+0x88/0xbc)
[    1.892492] [<c02a3ce4>] (exynos_drm_init) from [<c0009748>] (do_one_initcall+0x84/0x1d4)
[    1.892534] [<c0009748>] (do_one_initcall) from [<c0784d94>] (kernel_init_freeable+0x11c/0x1e8)
[    1.892545] [<c0784d94>] (kernel_init_freeable) from [<c0553968>] (kernel_init+0x8/0xec)
[    1.892554] [<c0553968>] (kernel_init) from [<c000f7b8>] (ret_from_fork+0x14/0x3c)
[    1.895349] exynos-dp 145b0000.dp-controller: failed to get hpd plug status
[    1.977198] Console: switching to colour frame buffer device 365x114
[    2.471635] exynos-drm exynos-drm: fb0:  frame buffer device
[    2.487526] [drm] Initialized exynos 1.0.0 20110530 on minor 0
[    2.508940] brd: module loaded
[    2.546839] loop: module loaded
[    2.549502] usbcore: registered new interface driver r8152
[    2.554136] usbcore: registered new interface driver asix
[    2.559482] usbcore: registered new interface driver ax88179_178a
[    2.565570] usbcore: registered new interface driver cdc_ether
[    2.571395] usbcore: registered new interface driver smsc75xx
[    2.577131] usbcore: registered new interface driver smsc95xx
[    2.582841] usbcore: registered new interface driver net1080
[    2.588478] usbcore: registered new interface driver cdc_subset
[    2.594376] usbcore: registered new interface driver zaurus
[    2.599967] usbcore: registered new interface driver cdc_ncm
[    2.606161] exynos-dwc3 usb@12000000: no suspend clk specified
[    2.611378] usb@12000000 supply vdd33 not found, using dummy regulator
[    2.617914] usb@12000000 supply vdd10 not found, using dummy regulator
[    2.827315] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    2.831429] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 1
[    2.839448] xhci-hcd xhci-hcd.2.auto: hcc params 0x0220f04c hci version 0x100 quirks 0x00010010
[    2.847798] xhci-hcd xhci-hcd.2.auto: irq 140, io mem 0x12000000
[    2.853868] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    2.860494] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.867701] usb usb1: Product: xHCI Host Controller
[    2.872533] usb usb1: Manufacturer: Linux 4.3.0-rc4-next-20151009-06709-g4b92b96f4ad7 xhci-hcd
[    2.881167] usb usb1: SerialNumber: xhci-hcd.2.auto
[    2.886652] hub 1-0:1.0: USB hub found
[    2.889736] hub 1-0:1.0: 1 port detected
[    2.894002] xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
[    2.899133] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 2
[    2.906825] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    2.921596] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    2.933658] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.946113] usb usb2: Product: xHCI Host Controller
[    2.956186] usb usb2: Manufacturer: Linux 4.3.0-rc4-next-20151009-06709-g4b92b96f4ad7 xhci-hcd
[    2.970073] usb usb2: SerialNumber: xhci-hcd.2.auto
[    2.980849] hub 2-0:1.0: USB hub found
[    2.989822] hub 2-0:1.0: 1 port detected
[    2.999427] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.011144] ehci-exynos: EHCI EXYNOS driver
[    3.020824] exynos-ehci 12110000.usb: EHCI Host Controller
[    3.031467] exynos-ehci 12110000.usb: new USB bus registered, assigned bus number 3
[    3.044463] exynos-ehci 12110000.usb: irq 103, io mem 0x12110000
[    3.062533] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    3.073764] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002
[    3.085646] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.098058] usb usb3: Product: EHCI Host Controller
[    3.107995] usb usb3: Manufacturer: Linux 4.3.0-rc4-next-20151009-06709-g4b92b96f4ad7 ehci_hcd
[    3.121704] usb usb3: SerialNumber: 12110000.usb
[    3.132021] hub 3-0:1.0: USB hub found
[    3.140810] hub 3-0:1.0: 3 ports detected
[    3.150534] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.161717] ohci-exynos: OHCI EXYNOS driver
[    3.171047] exynos-ohci 12120000.usb: USB Host Controller
[    3.181389] exynos-ohci 12120000.usb: new USB bus registered, assigned bus number 4
[    3.194099] exynos-ohci 12120000.usb: irq 103, io mem 0x12120000
[    3.261693] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
[    3.273374] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.285460] usb usb4: Product: USB Host Controller
[    3.295090] usb usb4: Manufacturer: Linux 4.3.0-rc4-next-20151009-06709-g4b92b96f4ad7 ohci_hcd
[    3.308595] usb usb4: SerialNumber: 12120000.usb
[    3.318705] hub 4-0:1.0: USB hub found
[    3.327283] hub 4-0:1.0: 3 ports detected
[    3.336853] usbcore: registered new interface driver usb-storage
[    3.358155] usb3503 usb-hub: switched to HUB mode
[    3.367644] usb3503 usb-hub: usb3503_probe: probed in hub mode
[    3.378409] using random self ethernet address
[    3.387602] using random host ethernet address
[    3.397306] usb0: HOST MAC 1e:41:6c:8b:c0:f9
[    3.406230] usb0: MAC 9e:76:63:1e:59:7e
[    3.414608] using random self ethernet address
[    3.423557] using random host ethernet address
[    3.437554] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
[    3.448726] g_ether gadget: g_ether ready
[    3.457859] mousedev: PS/2 mouse device common for all mice
[    3.469234] s3c-rtc 101e0000.rtc: failed to find rtc source clock
[    3.479829] s3c-rtc: probe of 101e0000.rtc failed with error -2
[    3.519530] s5m-rtc s5m-rtc: rtc core: registered s5m-rtc as rtc0
[    3.531818] i2c /dev entries driver
[    3.543304] thermal thermal_zone0: failed to read out thermal zone (-22)
[    3.554515] 10060000.tmu supply vtmu not found, using dummy regulator
[    3.566502] s3c2410-wdt 101d0000.watchdog: watchdog inactive, reset disabled, irq disabled
[    3.580000] device-mapper: ioctl: 4.33.0-ioctl (2015-8-18) initialised: dm-devel@redhat.com
[    3.612983] sdhci: Secure Digital Host Controller Interface driver
[    3.621462] sdhci: Copyright(c) Pierre Ossman
[    3.628192] Synopsys Designware Multimedia Card Interface Driver
[    3.636912] dwmmc_exynos 12200000.mmc: IDMAC supports 32-bit address mode.
[    3.646032] dwmmc_exynos 12200000.mmc: Using internal DMA controller.
[    3.654648] dwmmc_exynos 12200000.mmc: Version ID is 241a
[    3.662202] dwmmc_exynos 12200000.mmc: DW MMC controller at irq 101,32 bit host data width,128 deep fifo
[    3.673931] dwmmc_exynos 12200000.mmc: No vqmmc regulator found
[    3.707555] dwmmc_exynos 12200000.mmc: 1 slots initialized
[    3.715351] dwmmc_exynos 12220000.mmc: IDMAC supports 32-bit address mode.
[    3.725349] dwmmc_exynos 12220000.mmc: Using internal DMA controller.
[    3.735818] dwmmc_exynos 12220000.mmc: Version ID is 241a
[    3.743247] dwmmc_exynos 12220000.mmc: DW MMC controller at irq 102,32 bit host data width,128 deep fifo
[    3.754752] dwmmc_exynos 12220000.mmc: No vqmmc regulator found
[    3.792543] dwmmc_exynos 12220000.mmc: 1 slots initialized
[    3.801233] usbcore: registered new interface driver usbhid
[    3.808806] usbhid: USB HID core driver
[    3.818199] NET: Registered protocol family 10
[    3.827239] mmc0: MAN_BKOPS_EN bit is not set
[    3.833735] sit: IPv6 over IPv4 tunneling driver
[    3.840806] NET: Registered protocol family 17
[    3.847175] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ div = 0)
[    3.858943] NET: Registered protocol family 15
[    3.865494] Registering SWP/SWPB emulation handler
[    3.872407] mmc_host mmc0: Bus speed (slot 0) = 100000000Hz (slot req 52000000Hz, actual 50000000HZ div = 1)
[    3.884734] mmc0: new DDR MMC card at address 0001
[    3.892214] input: gpio_keys as /devices/platform/gpio_keys/input/input0
[    3.906703] mmcblk0: mmc0:0001 M4G1FA 3.72 GiB 
[    3.913251] s5m-rtc s5m-rtc: setting system clock to 2000-10-05 10:17:10 UTC (970741030)
[    3.932554] mmcblk0boot0: mmc0:0001 M4G1FA partition 1 1.00 MiB
[    3.940672] IPv6: ADDRCONF(NETDEV_UP): usb0: link is not ready
[    3.953746] mmcblk0boot1: mmc0:0001 M4G1FA partition 2 1.00 MiB
[    3.966886] mmcblk0rpmb: mmc0:0001 M4G1FA partition 3 128 KiB
[    3.975783]  mmcblk0: p1 p2 p3 p4
[    4.016575] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
[    4.028560] mmc1: new high speed SDHC card at address 1234
[    4.041614] mmcblk1: mmc1:1234 SA04G 3.63 GiB 
[    4.049736]  mmcblk1: p1 p2 p3
[   13.947511] Waiting up to 110 more seconds for network.
[   23.952509] Waiting up to 100 more seconds for network.
[   33.957510] Waiting up to 90 more seconds for network.
[   43.962509] Waiting up to 80 more seconds for network.
[   53.967513] Waiting up to 70 more seconds for network.
[   63.972536] Waiting up to 60 more seconds for network.
[   73.982520] Waiting up to 50 more seconds for network.
[   83.987518] Waiting up to 40 more seconds for network.
~$off
# PYBOOT: Exception: kernel: ERROR: Timeout waiting for kernel to finish booting.
#
# PYBOOT: cmdline: pyboot -s -w -m modules.tar.xz arndale arch/arm/boot/zImage arch/arm/boot/dts/exynos5250-arndale.dtb
# PYBOOT: Time: 122.05 (bootloader: 28.87, setup: 0.19, kernel: 0.00)
# PYBOOT: Result: FAIL

--=-=-=--

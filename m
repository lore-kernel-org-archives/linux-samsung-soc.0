From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Kernel crash on smdk2416 board with linux-3.0.0-rc2.
Date: Wed, 8 Jun 2011 18:00:56 +0530
Message-ID: <BANLkTikJKULndG_3PMpn92GwU9ccAVgyMw@mail.gmail.com>
References: <BANLkTinbFwww=Fwh9wPh05g0WCPP_4_LJA@mail.gmail.com>
	<201106081409.33169.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:45655 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752012Ab1FHMa5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 08:30:57 -0400
Received: by qwk3 with SMTP id 3so190324qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jun 2011 05:30:56 -0700 (PDT)
In-Reply-To: <201106081409.33169.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 8 June 2011 17:39, Heiko St=FCbner <heiko@sntech.de> wrote:
> Hi Thomas,
>
> Am Dienstag 07 Juni 2011 schrieb Thomas Abraham:
>> In linux-3.0.0-rc2, for smdk2416 board, the kernel crashes while
>> booting up. The boot log is listed below. By turning of usb support,
>> the kernel boots up. This issue was not observed in linux-2.6.39
>> stable.
> fix could be 1d4a4bde6b1cd4c8bbe1dd20dee18416a62b9c51
> http://git.kernel.org/?p=3Dlinux/kernel/git/gregkh/usb-2.6.git;a=3Dco=
mmit;h=3D1d4a4bde6b1cd4c8bbe1dd20dee18416a62b9c51
>
> which will probably be in -rc3

Thanks for the link. I saw the same crash with smdk6410 and this fix
should resolve the crash.

Thanks,
Thomas.

>
>> Starting kernel ...
>>
>> Uncompressing Linux... done, booting the kernel.
>> Linux version 3.0.0-rc2-dirty (thomas@localhost.localdomain) (gcc
>> version 4.4.1 (Sourcery G++ Lite 2009q3-67) ) #4 Tue Jun 7 17:41:20
>> IST 2011
>> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
>> CPU: VIVT data cache, VIVT instruction cache
>> Machine: SMDK2416
>> Memory policy: ECC disabled, Data cache writeback
>> CPU S3C2416/S3C2450 (id 0x32450003)
>> S3C24XX Clocks, Copyright 2004 Simtec Electronics
>> CPU: MPLL on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk 66.=
666 MHz
>> CPU: EPLL on 96.000 MHz, usb-bus 48.000 MHz
>> Built 1 zonelists in Zone order, mobility grouping on. =A0Total page=
s: 16256
>> Kernel command line: root=3D/dev/hda1 ro init=3D/bin/bash console=3D=
ttySAC0
>> PID hash table entries: 256 (order: -2, 1024 bytes)
>> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
>> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
>> Memory: 64MB =3D 64MB total
>> Memory: 60008k/60008k available, 5528k reserved, 0K highmem
>> Virtual kernel memory layout:
>> =A0 =A0 vector =A0: 0xffff0000 - 0xffff1000 =A0 ( =A0 4 kB)
>> =A0 =A0 fixmap =A0: 0xfff00000 - 0xfffe0000 =A0 ( 896 kB)
>> =A0 =A0 DMA =A0 =A0 : 0xffc00000 - 0xffe00000 =A0 ( =A0 2 MB)
>> =A0 =A0 vmalloc : 0xc4800000 - 0xf6000000 =A0 ( 792 MB)
>> =A0 =A0 lowmem =A0: 0xc0000000 - 0xc4000000 =A0 ( =A064 MB)
>> =A0 =A0 modules : 0xbf000000 - 0xc0000000 =A0 ( =A016 MB)
>> =A0 =A0 =A0 .init : 0xc0008000 - 0xc002a000 =A0 ( 136 kB)
>> =A0 =A0 =A0 .text : 0xc002a000 - 0xc047a000 =A0 (4416 kB)
>> =A0 =A0 =A0 .data : 0xc047a000 - 0xc04a0cc0 =A0 ( 156 kB)
>> NR_IRQS:99
>> irq: clearing subpending status 00000003
>> irq: clearing subpending status 00000002
>> Console: colour dummy device 80x30
>> console [ttySAC0] enabled
>> Calibrating delay loop... 199.47 BogoMIPS (lpj=3D498688)
>> pid_max: default: 32768 minimum: 301
>> Mount-cache hash table entries: 512
>> CPU: Testing write buffer coherency: ok
>> NET: Registered protocol family 16
>> S3C Power Management, Copyright 2004 Simtec Electronics
>> S3C2416: Initializing architecture
>> S3C2416: IRQ Support
>> bio: create slab <bio-0> at 0
>> SCSI subsystem initialized
>> usbcore: registered new interface driver usbfs
>> usbcore: registered new interface driver hub
>> usbcore: registered new device driver usb
>> s3c-i2c s3c2410-i2c: slave address 0x10
>> s3c-i2c s3c2410-i2c: bus frequency set to 65 KHz
>> s3c-i2c s3c2410-i2c: i2c-0: S3C I2C adapter
>> Advanced Linux Sound Architecture Driver Version 1.0.24.
>> NET: Registered protocol family 2
>> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
>> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
>> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
>> TCP: Hash tables configured (established 2048 bind 2048)
>> TCP reno registered
>> UDP hash table entries: 256 (order: 0, 4096 bytes)
>> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
>> NET: Registered protocol family 1
>> RPC: Registered named UNIX socket transport module.
>> RPC: Registered udp transport module.
>> RPC: Registered tcp transport module.
>> RPC: Registered tcp NFSv4.1 backchannel transport module.
>> NetWinder Floating Point Emulator V0.97 (extended precision)
>> JFFS2 version 2.2. (NAND) (SUMMARY) =A0=C2=A9 2001-2006 Red Hat, Inc=
=2E
>> ROMFS MTD (C) 2007 Red Hat, Inc.
>> msgmni has been set to 117
>> io scheduler noop registered
>> io scheduler deadline registered
>> io scheduler cfq registered (default)
>> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
>> s3c2440-uart.0: ttySAC0 at MMIO 0x50000000 (irq =3D 70) is a S3C2440
>> s3c2440-uart.1: ttySAC1 at MMIO 0x50004000 (irq =3D 73) is a S3C2440
>> s3c2440-uart.2: ttySAC2 at MMIO 0x50008000 (irq =3D 76) is a S3C2440
>> s3c2440-uart.3: ttySAC3 at MMIO 0x5000c000 (irq =3D 94) is a S3C2440
>> lp: driver loaded but no devices found
>> ppdev: user-space parallel port driver
>> brd: module loaded
>> loop: module loaded
>> Uniform Multi-Platform E-IDE driver
>> ide-gd driver 1.18
>> ide-cd driver 5.00
>> S3C24XX NAND Driver, (c) 2004 Simtec Electronics
>> s3c24xx-nand s3c2412-nand: Tacls=3D3, 22ns Twrph0=3D8 60ns, Twrph1=3D=
3 22ns
>> s3c24xx-nand s3c2412-nand: System booted from NAND
>> s3c24xx-nand s3c2412-nand: NAND soft ECC
>> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64Mi=
B
>> 3,3V 8-bit)
>> Scanning device for bad blocks
>> Bad eraseblock 0 at 0x000000000000
>> Bad eraseblock 1 at 0x000000004000
>> Bad eraseblock 2 at 0x000000008000
>> Bad eraseblock 3 at 0x00000000c000
>> Bad eraseblock 4 at 0x000000010000
>> Bad eraseblock 5 at 0x000000014000
>> Bad eraseblock 6 at 0x000000018000
>> Bad eraseblock 7 at 0x00000001c000
>> Bad eraseblock 8 at 0x000000020000
>> Bad eraseblock 9 at 0x000000024000
>> Bad eraseblock 10 at 0x000000028000
>> Bad eraseblock 11 at 0x00000002c000
>> Bad eraseblock 12 at 0x000000030000
>> Bad eraseblock 13 at 0x000000034000
>> Bad eraseblock 14 at 0x000000038000
>> Bad eraseblock 15 at 0x00000003c000
>> Creating 8 MTD partitions on "NAND":
>> 0x000000000000-0x000000004000 : "Boot Agent"
>> 0x000000000000-0x000000200000 : "S3C2410 flash partition 1"
>> 0x000000400000-0x000000800000 : "S3C2410 flash partition 2"
>> 0x000000800000-0x000000a00000 : "S3C2410 flash partition 3"
>> 0x000000a00000-0x000000e00000 : "S3C2410 flash partition 4"
>> 0x000000e00000-0x000001800000 : "S3C2410 flash partition 5"
>> 0x000001800000-0x000003000000 : "S3C2410 flash partition 6"
>> 0x000003000000-0x000004000000 : "S3C2410 flash partition 7"
>> dm9000 Ethernet Driver, V1.31
>> usbmon: debugfs is not available
>> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>> s3c2410-ohci s3c2410-ohci: S3C24XX OHCI
>> s3c2410-ohci s3c2410-ohci: new USB bus registered, assigned bus numb=
er 1
>> s3c2410-ohci s3c2410-ohci: irq 42, io mem 0x49000000
>> s3c2410-ohci s3c2410-ohci: init err (00000000 0000)
>> ohci_hcd: can't start s3c24xx
>> s3c2410-ohci s3c2410-ohci: startup error -75
>> s3c2410-ohci s3c2410-ohci: USB bus 1 deregistered
>> kernel BUG at fs/dcache.c:419!
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 00000000 pgd =3D c0004000
>> [00000000] *pgd=3D00000000
>> Internal error: Oops: 805 [#1]
>> Modules linked in:
>> CPU: 0 =A0 =A0Not tainted =A0(3.0.0-rc2-dirty #4)
>> PC is at __bug+0x20/0x2c
>> LR is at console_unlock+0x178/0x1d4
>> pc : [<c003a9c4>] =A0 =A0lr : [<c004d774>] =A0 =A0psr: 60000013
>> sp : c3819d34 =A0ip : 00000000 =A0fp : c3819d40
>> r10: 00000001 =A0r9 : 00000000 =A0r8 : c3400190
>> r7 : c3408e70 =A0r6 : c3401894 =A0r5 : 00000000 =A0r4 : c0488a34
>> r3 : 00000000 =A0r2 : c0483974 =A0r1 : c0483974 =A0r0 : 00000025
>> Flags: nZCv =A0IRQs on =A0FIQs on =A0Mode SVC_32 =A0ISA ARM =A0Segme=
nt kernel
>> Control: 0005317f =A0Table: 30004000 =A0DAC: 00000017
>> Process swapper (pid: 1, stack limit =3D 0xc3818260)
>> Stack: (0xc3819d34 to 0xc381a000)
>> 9d20: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0c3819d5c c3819d44
>> c00cc2e8 9d40: c003a9b4 c3401894 c3401914 c3408e58 c3819d80 c3819d60
>> c027d594 c00cc184 9d60: c39f1c00 00000000 00000000 c39f1c00 00000004
>> c3819db8 c3819d84 c027d964 9d80: c027d510 c39f1c00 c39ec8e0 49000000
>> 00000000 00000000 fffffffe 00000000 9da0: 00000000 c39f1c00 00000004
>> c3819ddc c3819dbc c006cef4 c027d930 c04953a0 9dc0: 00000000 c39f1c00
>> 00000004 c04953ac c3819e04 c3819de0 c006d434 c006ceb8 9de0: 00000000
>> c39f1c00 c0494dbc 0000002a 49000000 00000000 c3819e18 c3819e08 9e00:
>> c006d468 c006d3f0 00000000 c3819e28 c3819e1c c027bbd4 c006d458 c3819=
e40
>> 9e20: c3819e2c c026e000 c027bbc8 c39f1c00 ffffffb5 c3819e74 c3819e44
>> c026fac0 9e40: c026dfb4 49000000 00000000 c39f1800 c39f1c00 c0482b20
>> c0482c04 c04c3a98 9e60: 00000000 00000000 c3819e9c c3819e78 c038e350
>> c026f990 00000000 00000001 9e80: c04c2db4 c0482b28 c0495490 c001e9f8
>> c3819eac c3819ea0 c020b950 c038e1b0 9ea0: c3819ed0 c3819eb0 c020a31c
>> c020b940 c0482b28 c0495490 c0482b5c 00000000 9ec0: c001e9f8 c3819eec
>> c3819ed4 c020a4b4 c020a2a4 c0495490 c3819ef0 c020a420 9ee0: c3819f14
>> c3819ef0 c0209ab4 c020a430 c3804798 c383b2f0 c0495490 c0490058 9f00:
>> c39d44a0 00000000 c3819f24 c3819f18 c020a180 c0209a58 c3819f54 c3819=
f28
>> 9f20: c0209270 c020a170 c041bce8 c3818000 c0495490 00000000 00000000
>> c001e9f8 9f40: 00000000 00000000 c3819f78 c3819f58 c020aad8 c02091d8
>> c3818000 c04c359c 9f60: c04a0d00 00000000 c001e9f8 c3819f88 c3819f7c
>> c020be5c c020aa68 c3819fa0 9f80: c3819f8c c001ea48 c020be20 c3818000
>> c0025428 c3819fdc c3819fa4 c002a3a4 9fa0: c001ea08 c0020000 00000063
>> c0487be0 c0050870 00000013 c0025378 c0025428 9fc0: c0050870 00000013
>> 00000000 00000000 c3819ff4 c3819fe0 c0008440 c002a37c 9fe0: 00000000
>> c00083a8 00000000 c3819ff8 c0050870 c00083b8 ffffbfff ffffffff Backt=
race:
>> [<c003a9a4>] (__bug+0x0/0x2c) from [<c00cc2e8>] (dput+0x174/0x180)
>> [<c00cc174>] (dput+0x0/0x180) from [<c027d594>] (fs_remove_file+0x94=
/0x168)
>> =A0r6:c3408e58 r5:c3401914 r4:c3401894
>> [<c027d500>] (fs_remove_file+0x0/0x168) from [<c027d964>]
>> (usbfs_notify+0x44/0x314)
>> =A0r8:00000004 r7:c39f1c00 r6:00000000 r5:00000000 r4:c39f1c00
>> [<c027d920>] (usbfs_notify+0x0/0x314) from [<c006cef4>]
>> (notifier_call_chain+0x4c/0x8c)
>> =A0r8:00000004 r7:c39f1c00 r6:00000000 r5:00000000 r4:fffffffe
>> [<c006cea8>] (notifier_call_chain+0x0/0x8c) from [<c006d434>]
>> (__blocking_notifier_call_chain+0x54/0x68)
>> =A0r8:c04953ac r7:00000004 r6:c39f1c00 r5:00000000 r4:c04953a0
>> [<c006d3e0>] (__blocking_notifier_call_chain+0x0/0x68) from
>> [<c006d468>] (blocking_notifier_call_chain+0x20/0x24)
>> =A0r8:00000000 r7:49000000 r6:0000002a r5:c0494dbc r4:c39f1c00
>> [<c006d448>] (blocking_notifier_call_chain+0x0/0x24) from [<c027bbd4=
>]
>> (usb_notify_remove_bus+0x1c/0x24)
>> [<c027bbb8>] (usb_notify_remove_bus+0x0/0x24) from [<c026e000>]
>> (usb_deregister_bus+0x5c/0x80)
>> [<c026dfa4>] (usb_deregister_bus+0x0/0x80) from [<c026fac0>]
>> (usb_add_hcd+0x140/0x604)
>> =A0r5:ffffffb5 r4:c39f1c00
>> [<c026f980>] (usb_add_hcd+0x0/0x604) from [<c038e350>]
>> (ohci_hcd_s3c2410_drv_probe+0x1b0/0x238)
>> [<c038e1a0>] (ohci_hcd_s3c2410_drv_probe+0x0/0x238) from [<c020b950>=
]
>> (platform_drv_probe+0x20/0x24)
>> =A0r8:c001e9f8 r7:c0495490 r6:c0482b28 r5:c04c2db4 r4:00000001
>> [<c020b930>] (platform_drv_probe+0x0/0x24) from [<c020a31c>]
>> (driver_probe_device+0x88/0x18c)
>> [<c020a294>] (driver_probe_device+0x0/0x18c) from [<c020a4b4>]
>> (__driver_attach+0x94/0x98)
>> =A0r8:c001e9f8 r7:00000000 r6:c0482b5c r5:c0495490 r4:c0482b28
>> [<c020a420>] (__driver_attach+0x0/0x98) from [<c0209ab4>]
>> (bus_for_each_dev+0x6c/0x94)
>> =A0r6:c020a420 r5:c3819ef0 r4:c0495490
>> [<c0209a48>] (bus_for_each_dev+0x0/0x94) from [<c020a180>]
>> (driver_attach+0x20/0x28)
>> =A0r7:00000000 r6:c39d44a0 r5:c0490058 r4:c0495490
>> [<c020a160>] (driver_attach+0x0/0x28) from [<c0209270>]
>> (bus_add_driver+0xa8/0x290)
>> [<c02091c8>] (bus_add_driver+0x0/0x290) from [<c020aad8>]
>> (driver_register+0x80/0x194)
>> [<c020aa58>] (driver_register+0x0/0x194) from [<c020be5c>]
>> (platform_driver_register+0x4c/0x60)
>> =A0r8:c001e9f8 r7:00000000 r6:c04a0d00 r5:c04c359c r4:c3818000
>> [<c020be10>] (platform_driver_register+0x0/0x60) from [<c001ea48>]
>> (ohci_hcd_mod_init+0x50/0xa8)
>> [<c001e9f8>] (ohci_hcd_mod_init+0x0/0xa8) from [<c002a3a4>]
>> (do_one_initcall+0x38/0x188)
>> =A0r5:c0025428 r4:c3818000
>> [<c002a36c>] (do_one_initcall+0x0/0x188) from [<c0008440>]
>> (kernel_init+0x98/0x140)
>> [<c00083a8>] (kernel_init+0x0/0x140) from [<c0050870>] (do_exit+0x0/=
0x6d8)
>> =A0r5:c00083a8 r4:00000000
>> Code: e1a01000 e59f000c eb0d5349 e3a03000 (e5833000)
>> ---[ end trace 1e50d88169275d87 ]---
>> Kernel panic - not syncing: Attempted to kill init!
>> Backtrace:
>> [<c003ac2c>] (dump_backtrace+0x0/0x10c) from [<c038f554>]
>> (dump_stack+0x18/0x1c) r6:c0484f0c r5:c04a1138 r4:c04a1138
>> [<c038f53c>] (dump_stack+0x0/0x1c) from [<c038f5bc>] (panic+0x64/0x1=
90)
>> [<c038f558>] (panic+0x0/0x190) from [<c0050f18>] (do_exit+0x6a8/0x6d=
8)
>> =A0r3:60000013 r2:c3818000 r1:c3815e80 r0:c041ccec
>> [<c0050870>] (do_exit+0x0/0x6d8) from [<c003b074>] (die+0x18c/0x1c4)
>> [<c003aee8>] (die+0x0/0x1c4) from [<c003d1dc>]
>> (__do_kernel_fault+0x6c/0x8c) r8:00000000 r7:00000805 r6:00000000
>> r5:00000000 r4:c3819cec
>> [<c003d170>] (__do_kernel_fault+0x0/0x8c) from [<c003d338>]
>> (do_page_fault+0x13c/0x1e0)
>> =A0r8:c3819cec r7:00000805 r6:00000000 r5:00000000 r4:00000000
>> [<c003d1fc>] (do_page_fault+0x0/0x1e0) from [<c003d4f4>]
>> (do_translation_fault+0xa4/0xac)
>> [<c003d450>] (do_translation_fault+0x0/0xac) from [<c002a2d4>]
>> (do_DataAbort+0x3c/0xa4)
>> =A0r7:c3819cec r6:00000000 r5:c047f6ac r4:00000805
>> [<c002a298>] (do_DataAbort+0x0/0xa4) from [<c00374c0>]
>> (__dabt_svc+0x40/0x60) Exception stack(0xc3819cec to 0xc3819d34)
>> 9ce0: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00000002=
5 c0483974 c0483974 00000000
>> c0488a34 9d00: 00000000 c3401894 c3408e70 c3400190 00000000 00000001
>> c3819d40 00000000 9d20: c3819d34 c004d774 c003a9c4 60000013 ffffffff
>> =A0r7:c3408e70 r6:c3401894 r5:c3819d20 r4:ffffffff
>> [<c003a9a4>] (__bug+0x0/0x2c) from [<c00cc2e8>] (dput+0x174/0x180)
>> [<c00cc174>] (dput+0x0/0x180) from [<c027d594>] (fs_remove_file+0x94=
/0x168)
>> =A0r6:c3408e58 r5:c3401914 r4:c3401894
>> [<c027d500>] (fs_remove_file+0x0/0x168) from [<c027d964>]
>> (usbfs_notify+0x44/0x314)
>> =A0r8:00000004 r7:c39f1c00 r6:00000000 r5:00000000 r4:c39f1c00
>> [<c027d920>] (usbfs_notify+0x0/0x314) from [<c006cef4>]
>> (notifier_call_chain+0x4c/0x8c)
>> =A0r8:00000004 r7:c39f1c00 r6:00000000 r5:00000000 r4:fffffffe
>> [<c006cea8>] (notifier_call_chain+0x0/0x8c) from [<c006d434>]
>> (__blocking_notifier_call_chain+0x54/0x68)
>> =A0r8:c04953ac r7:00000004 r6:c39f1c00 r5:00000000 r4:c04953a0
>> [<c006d3e0>] (__blocking_notifier_call_chain+0x0/0x68) from
>> [<c006d468>] (blocking_notifier_call_chain+0x20/0x24)
>> =A0r8:00000000 r7:49000000 r6:0000002a r5:c0494dbc r4:c39f1c00
>> [<c006d448>] (blocking_notifier_call_chain+0x0/0x24) from [<c027bbd4=
>]
>> (usb_notify_remove_bus+0x1c/0x24)
>> [<c027bbb8>] (usb_notify_remove_bus+0x0/0x24) from [<c026e000>]
>> (usb_deregister_bus+0x5c/0x80)
>> [<c026dfa4>] (usb_deregister_bus+0x0/0x80) from [<c026fac0>]
>> (usb_add_hcd+0x140/0x604)
>> =A0r5:ffffffb5 r4:c39f1c00
>> [<c026f980>] (usb_add_hcd+0x0/0x604) from [<c038e350>]
>> (ohci_hcd_s3c2410_drv_probe+0x1b0/0x238)
>> [<c038e1a0>] (ohci_hcd_s3c2410_drv_probe+0x0/0x238) from [<c020b950>=
]
>> (platform_drv_probe+0x20/0x24)
>> =A0r8:c001e9f8 r7:c0495490 r6:c0482b28 r5:c04c2db4 r4:00000001
>> [<c020b930>] (platform_drv_probe+0x0/0x24) from [<c020a31c>]
>> (driver_probe_device+0x88/0x18c)
>> [<c020a294>] (driver_probe_device+0x0/0x18c) from [<c020a4b4>]
>> (__driver_attach+0x94/0x98)
>> =A0r8:c001e9f8 r7:00000000 r6:c0482b5c r5:c0495490 r4:c0482b28
>> [<c020a420>] (__driver_attach+0x0/0x98) from [<c0209ab4>]
>> (bus_for_each_dev+0x6c/0x94)
>> =A0r6:c020a420 r5:c3819ef0 r4:c0495490
>> [<c0209a48>] (bus_for_each_dev+0x0/0x94) from [<c020a180>]
>> (driver_attach+0x20/0x28)
>> =A0r7:00000000 r6:c39d44a0 r5:c0490058 r4:c0495490
>> [<c020a160>] (driver_attach+0x0/0x28) from [<c0209270>]
>> (bus_add_driver+0xa8/0x290)
>> [<c02091c8>] (bus_add_driver+0x0/0x290) from [<c020aad8>]
>> (driver_register+0x80/0x194)
>> [<c020aa58>] (driver_register+0x0/0x194) from [<c020be5c>]
>> (platform_driver_register+0x4c/0x60)
>> =A0r8:c001e9f8 r7:00000000 r6:c04a0d00 r5:c04c359c r4:c3818000
>> [<c020be10>] (platform_driver_register+0x0/0x60) from [<c001ea48>]
>> (ohci_hcd_mod_init+0x50/0xa8)
>> [<c001e9f8>] (ohci_hcd_mod_init+0x0/0xa8) from [<c002a3a4>]
>> (do_one_initcall+0x38/0x188)
>> =A0r5:c0025428 r4:c3818000
>> [<c002a36c>] (do_one_initcall+0x0/0x188) from [<c0008440>]
>> (kernel_init+0x98/0x140)
>> [<c00083a8>] (kernel_init+0x0/0x140) from [<c0050870>] (do_exit+0x0/=
0x6d8)
>> =A0r5:c00083a8 r4:00000000
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in the body of a message to majordomo@vger.kernel=
=2Eorg
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>

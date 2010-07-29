From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: not coming prompt in 2.6.33.6 kernel
Date: Thu, 29 Jul 2010 09:53:11 +0800
Message-ID: <AANLkTikgq_Fb0ZfT-b+9zOA5w2pDpNgwnUqe919hAsnd@mail.gmail.com>
References: <AANLkTikgB9OF6mRqZ2KgQYuCQ4JcF7N6oTJyUbrYq0t7@mail.gmail.com>
	<20100728094344.GA9142@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:43691 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222Ab0G2BxM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jul 2010 21:53:12 -0400
Received: by vws3 with SMTP id 3so136170vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jul 2010 18:53:11 -0700 (PDT)
In-Reply-To: <20100728094344.GA9142@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: nitin vishnoi <nitvishnoi@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org

2010/7/28 Ben Dooks <ben-linux@fluff.org>:
> On Wed, Jul 28, 2010 at 08:51:06AM +0530, nitin vishnoi wrote:
>> Hi
>>
>> I am porting the 2.6.33.6 kernel,which i took from kernel.org.I am t=
rying to
>> port it on samsung-s3c2451 board.
>> But i am not getting the shell prompt,due to getting the following e=
rror.Any
>> body can tell due to what this error i am getting?
>>
>> Starting kernel ...
>>
>>
>> Uncompressing Linux... done, booting the kernel.
>> Linux version 2.6.33.6 (root@ubntu-desktop) (gcc version 4.2.2) #12 =
Mon Jul
>> 26 18:39:19 IST 2010
>> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
>> CPU: VIVT data cache, VIVT instruction cache
>> Machine: SMDK2450
>> Ignoring unrecognised tag 0x00000000
>> Memory policy: ECC disabled, Data cache writeback
>> CPU S3C2450 EVT3 (id 0x32450003)
>> SPA =C2=A0 epll =C2=A080200102 =C2=A0Mpll =C2=A080640061 =C2=A0 clkd=
iv0 557
>> S3C24XX Clocks, (c) 2004 Simtec Electronics
>> S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk=
 66.666
>> MHz
>> S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz
>> Built 1 zonelists in Zone order, mobility grouping on. =C2=A0Total p=
ages: 16256
>> Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,16M ramdis=
k=3D32768
>> init=3D/bin/sh console=3DttySAC3,115200 mem=3D64M
>> PID hash table entries: 256 (order: -2, 1024 bytes)
>> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
>> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
>> Memory: 64MB =3D 64MB total
>> Memory: 45432KB available (2588K code, 271K data, 116K init, 0K high=
mem)
>> Hierarchical RCU implementation.
>> NR_IRQS:109
>> irq: clearing subpending status 02000006
>> irq: clearing subpending status 02000002
>> timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007=
ae2
>> Console: colour dummy device 80x30
>> console [ttySAC3] enabled
>> Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)
>> Mount-cache hash table entries: 512
>> CPU: Testing write buffer coherency: ok
>> NET: Registered protocol family 16
>> whats up blady
>> hello
>> entered machine init
>> S3C Power Management, Copyright 2004 Simtec Electronics
>> S3C2450: Initialising architecture
>> SPA s3c2450_init
>> S3C2450: IRQ Support
>> bio: create slab <bio-0> at 0
>> SCSI subsystem initialized
>> NET: Registered protocol family 2
>> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
>> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
>> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
>> TCP: Hash tables configured (established 2048 bind 2048)
>> TCP reno registered
>> UDP hash table entries: 256 (order: 0, 4096 bytes)
>> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
>> NET: Registered protocol family 1
>> Trying to unpack rootfs image as initramfs...
>> rootfs image is not initramfs (no cpio magic); looks like an initrd
>> Freeing initrd memory: 16384K
>> NetWinder Floating Point Emulator V0.97 (double precision)
>> JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
>> ROMFS MTD (C) 2007 Red Hat, Inc.
>> msgmni has been set to 120
>> alg: No test for stdrng (krng)
>> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
>> io scheduler noop registered
>> io scheduler deadline registered
>> io scheduler cfq registered (default)
>> brd: module loaded
>> loop: module loaded
>> Uniform Multi-Platform E-IDE driver
>> ide-gd driver 1.18
>> ide-cd driver 5.00
>> PPP generic driver version 2.4.2
>> PPP Deflate Compression module registered
>> PPP BSD Compression module registered
>> PPP MPPE Compression module registered
>> NET: Registered protocol family 24
>> SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
>> CSLIP: code copyright 1989 Regents of the University of California.
>> mice: PS/2 mouse device common for all mice
>> TCP cubic registered
>> RAMDISK: gzip image found at block 0
>> EXT2-fs (ram0): warning: maximal mount count reached, running e2fsck=
 is
>> recommended
>> VFS: Mounted root (ext2 filesystem) on device 1:0.
>> Freeing init memory: 116K
>> Warning: unable to open an initial console.
>> Kernel panic - not syncing: Attempted to kill init!
>> [<c002b900>] (unwind_backtrace+0x0/0xe0) from [<c003fe9c>]
>> (panic+0x40/0x12c)
>> [<c003fe9c>] (panic+0x40/0x12c) from [<c0042cac>] (do_exit+0x58/0x57=
c)
>> [<c0042cac>] (do_exit+0x58/0x57c) from [<c0043254>]
>> (do_group_exit+0x84/0xb8)
>> [<c0043254>] (do_group_exit+0x84/0xb8) from [<c004329c>]
>> (sys_exit_group+0x14/0x20)
>> [<c004329c>] (sys_exit_group+0x14/0x20) from [<c0025e80>]
>> (ret_fast_syscall+0x0/0x28)
>
> looks like whatever you're trying to run as init doesn't have /dev/co=
nsole
> available.
Ben, I make sure there is /dev/console in his rootfs directory.
nitin vishnoi, do you confirm you need the ext to mount the ramdisk?

maybe you can decrease 'ramdisk=3D32768' to 'ramdisk=3D8192'.

>there seems to be no evidence of UARTs being added in the
> setup, are they being registered with the serial driver properly?
>
> --
> Ben
>
> Q: =C2=A0 =C2=A0 =C2=A0What's a light-year?
> A: =C2=A0 =C2=A0 =C2=A0One-third less calories than a regular year.
>
>



--=20
*linux-arm-kernel mailing list
mail addr:linux-arm-kernel@lists.infradead.org
you can subscribe by:
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

* linux-arm-NUC900 mailing list
mail addr:NUC900@googlegroups.com
main web: https://groups.google.com/group/NUC900
you can subscribe it by sending me mail:
mcuos.com@gmail.com

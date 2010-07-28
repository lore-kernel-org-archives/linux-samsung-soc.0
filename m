From: nitin vishnoi <nitvishnoi@gmail.com>
Subject: Re: not coming prompt in 2.6.33.6 kernel
Date: Wed, 28 Jul 2010 17:11:04 +0530
Message-ID: <AANLkTik6DTM5kAbH=M0-9CS596QHX+9EsnNf_VZpWtn7@mail.gmail.com>
References: <AANLkTikgB9OF6mRqZ2KgQYuCQ4JcF7N6oTJyUbrYq0t7@mail.gmail.com>
	<20100728094344.GA9142@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1904054488=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20100728094344.GA9142@trinity.fluff.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, Wan ZongShun <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1904054488==
Content-Type: multipart/alternative; boundary=000e0cd185c2c35341048c7117d0

--000e0cd185c2c35341048c7117d0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

which uart we required?
already it is registered thats why i am getting bootup messages through
ttySAC3 debug port.

On Wed, Jul 28, 2010 at 3:13 PM, Ben Dooks <ben-linux@fluff.org> wrote:

> On Wed, Jul 28, 2010 at 08:51:06AM +0530, nitin vishnoi wrote:
> > Hi
> >
> > I am porting the 2.6.33.6 kernel,which i took from kernel.org.I am tryi=
ng
> to
> > port it on samsung-s3c2451 board.
> > But i am not getting the shell prompt,due to getting the following
> error.Any
> > body can tell due to what this error i am getting?
> >
> > Starting kernel ...
> >
> >
> > Uncompressing Linux... done, booting the kernel.
> > Linux version 2.6.33.6 (root@ubntu-desktop) (gcc version 4.2.2) #12 Mon
> Jul
> > 26 18:39:19 IST 2010
> > CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
> > CPU: VIVT data cache, VIVT instruction cache
> > Machine: SMDK2450
> > Ignoring unrecognised tag 0x00000000
> > Memory policy: ECC disabled, Data cache writeback
> > CPU S3C2450 EVT3 (id 0x32450003)
> > SPA   epll  80200102  Mpll  80640061   clkdiv0 557
> > S3C24XX Clocks, (c) 2004 Simtec Electronics
> > S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk
> 66.666
> > MHz
> > S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz
> > Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
> 16256
> > Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,16M ramdisk=
=3D32768
> > init=3D/bin/sh console=3DttySAC3,115200 mem=3D64M
> > PID hash table entries: 256 (order: -2, 1024 bytes)
> > Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> > Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> > Memory: 64MB =3D 64MB total
> > Memory: 45432KB available (2588K code, 271K data, 116K init, 0K highmem=
)
> > Hierarchical RCU implementation.
> > NR_IRQS:109
> > irq: clearing subpending status 02000006
> > irq: clearing subpending status 02000002
> > timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae2
> > Console: colour dummy device 80x30
> > console [ttySAC3] enabled
> > Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)
> > Mount-cache hash table entries: 512
> > CPU: Testing write buffer coherency: ok
> > NET: Registered protocol family 16
> > whats up blady
> > hello
> > entered machine init
> > S3C Power Management, Copyright 2004 Simtec Electronics
> > S3C2450: Initialising architecture
> > SPA s3c2450_init
> > S3C2450: IRQ Support
> > bio: create slab <bio-0> at 0
> > SCSI subsystem initialized
> > NET: Registered protocol family 2
> > IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> > TCP established hash table entries: 2048 (order: 2, 16384 bytes)
> > TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
> > TCP: Hash tables configured (established 2048 bind 2048)
> > TCP reno registered
> > UDP hash table entries: 256 (order: 0, 4096 bytes)
> > UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> > NET: Registered protocol family 1
> > Trying to unpack rootfs image as initramfs...
> > rootfs image is not initramfs (no cpio magic); looks like an initrd
> > Freeing initrd memory: 16384K
> > NetWinder Floating Point Emulator V0.97 (double precision)
> > JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
> > ROMFS MTD (C) 2007 Red Hat, Inc.
> > msgmni has been set to 120
> > alg: No test for stdrng (krng)
> > Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
> > io scheduler noop registered
> > io scheduler deadline registered
> > io scheduler cfq registered (default)
> > brd: module loaded
> > loop: module loaded
> > Uniform Multi-Platform E-IDE driver
> > ide-gd driver 1.18
> > ide-cd driver 5.00
> > PPP generic driver version 2.4.2
> > PPP Deflate Compression module registered
> > PPP BSD Compression module registered
> > PPP MPPE Compression module registered
> > NET: Registered protocol family 24
> > SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
> > CSLIP: code copyright 1989 Regents of the University of California.
> > mice: PS/2 mouse device common for all mice
> > TCP cubic registered
> > RAMDISK: gzip image found at block 0
> > EXT2-fs (ram0): warning: maximal mount count reached, running e2fsck is
> > recommended
> > VFS: Mounted root (ext2 filesystem) on device 1:0.
> > Freeing init memory: 116K
> > Warning: unable to open an initial console.
> > Kernel panic - not syncing: Attempted to kill init!
> > [<c002b900>] (unwind_backtrace+0x0/0xe0) from [<c003fe9c>]
> > (panic+0x40/0x12c)
> > [<c003fe9c>] (panic+0x40/0x12c) from [<c0042cac>] (do_exit+0x58/0x57c)
> > [<c0042cac>] (do_exit+0x58/0x57c) from [<c0043254>]
> > (do_group_exit+0x84/0xb8)
> > [<c0043254>] (do_group_exit+0x84/0xb8) from [<c004329c>]
> > (sys_exit_group+0x14/0x20)
> > [<c004329c>] (sys_exit_group+0x14/0x20) from [<c0025e80>]
> > (ret_fast_syscall+0x0/0x28)
>
> looks like whatever you're trying to run as init doesn't have /dev/consol=
e
> available. there seems to be no evidence of UARTs being added in the
> setup, are they being registered with the serial driver properly?
>
> --
> Ben
>
> Q:      What's a light-year?
> A:      One-third less calories than a regular year.
>
>

--000e0cd185c2c35341048c7117d0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br>which uart we required?<br>already it is registered thats why i am gett=
ing bootup messages through ttySAC3 debug port.<br><br><div class=3D"gmail_=
quote">On Wed, Jul 28, 2010 at 3:13 PM, Ben Dooks <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ben-linux@fluff.org">ben-linux@fluff.org</a>&gt;</span> wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">On Wed, Jul 28, 2=
010 at 08:51:06AM +0530, nitin vishnoi wrote:<br>
&gt; Hi<br>
&gt;<br>
&gt; I am porting the 2.6.33.6 kernel,which i took from kernel.org.I am try=
ing to<br>
&gt; port it on samsung-s3c2451 board.<br>
&gt; But i am not getting the shell prompt,due to getting the following err=
or.Any<br>
&gt; body can tell due to what this error i am getting?<br>
&gt;<br>
&gt; Starting kernel ...<br>
&gt;<br>
&gt;<br>
&gt; Uncompressing Linux... done, booting the kernel.<br>
&gt; Linux version 2.6.33.6 (root@ubntu-desktop) (gcc version 4.2.2) #12 Mo=
n Jul<br>
&gt; 26 18:39:19 IST 2010<br>
&gt; CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177<br>
&gt; CPU: VIVT data cache, VIVT instruction cache<br>
&gt; Machine: SMDK2450<br>
&gt; Ignoring unrecognised tag 0x00000000<br>
&gt; Memory policy: ECC disabled, Data cache writeback<br>
&gt; CPU S3C2450 EVT3 (id 0x32450003)<br>
&gt; SPA =A0 epll =A080200102 =A0Mpll =A080640061 =A0 clkdiv0 557<br>
&gt; S3C24XX Clocks, (c) 2004 Simtec Electronics<br>
&gt; S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk 6=
6.666<br>
&gt; MHz<br>
&gt; S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz<br>
&gt; Built 1 zonelists in Zone order, mobility grouping on. =A0Total pages:=
 16256<br>
&gt; Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,16M ramdisk=
=3D32768<br>
&gt; init=3D/bin/sh console=3DttySAC3,115200 mem=3D64M<br>
&gt; PID hash table entries: 256 (order: -2, 1024 bytes)<br>
&gt; Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)<br>
&gt; Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)<br>
&gt; Memory: 64MB =3D 64MB total<br>
&gt; Memory: 45432KB available (2588K code, 271K data, 116K init, 0K highme=
m)<br>
&gt; Hierarchical RCU implementation.<br>
&gt; NR_IRQS:109<br>
&gt; irq: clearing subpending status 02000006<br>
&gt; irq: clearing subpending status 02000002<br>
&gt; timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae=
2<br>
&gt; Console: colour dummy device 80x30<br>
&gt; console [ttySAC3] enabled<br>
&gt; Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)<br>
&gt; Mount-cache hash table entries: 512<br>
&gt; CPU: Testing write buffer coherency: ok<br>
&gt; NET: Registered protocol family 16<br>
&gt; whats up blady<br>
&gt; hello<br>
&gt; entered machine init<br>
&gt; S3C Power Management, Copyright 2004 Simtec Electronics<br>
&gt; S3C2450: Initialising architecture<br>
&gt; SPA s3c2450_init<br>
&gt; S3C2450: IRQ Support<br>
&gt; bio: create slab &lt;bio-0&gt; at 0<br>
&gt; SCSI subsystem initialized<br>
&gt; NET: Registered protocol family 2<br>
&gt; IP route cache hash table entries: 1024 (order: 0, 4096 bytes)<br>
&gt; TCP established hash table entries: 2048 (order: 2, 16384 bytes)<br>
&gt; TCP bind hash table entries: 2048 (order: 1, 8192 bytes)<br>
&gt; TCP: Hash tables configured (established 2048 bind 2048)<br>
&gt; TCP reno registered<br>
&gt; UDP hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt; UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt; NET: Registered protocol family 1<br>
&gt; Trying to unpack rootfs image as initramfs...<br>
&gt; rootfs image is not initramfs (no cpio magic); looks like an initrd<br=
>
&gt; Freeing initrd memory: 16384K<br>
&gt; NetWinder Floating Point Emulator V0.97 (double precision)<br>
&gt; JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.<br>
&gt; ROMFS MTD (C) 2007 Red Hat, Inc.<br>
&gt; msgmni has been set to 120<br>
&gt; alg: No test for stdrng (krng)<br>
&gt; Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)<b=
r>
&gt; io scheduler noop registered<br>
&gt; io scheduler deadline registered<br>
&gt; io scheduler cfq registered (default)<br>
&gt; brd: module loaded<br>
&gt; loop: module loaded<br>
&gt; Uniform Multi-Platform E-IDE driver<br>
&gt; ide-gd driver 1.18<br>
&gt; ide-cd driver 5.00<br>
&gt; PPP generic driver version 2.4.2<br>
&gt; PPP Deflate Compression module registered<br>
&gt; PPP BSD Compression module registered<br>
&gt; PPP MPPE Compression module registered<br>
&gt; NET: Registered protocol family 24<br>
&gt; SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).<br>
&gt; CSLIP: code copyright 1989 Regents of the University of California.<br=
>
&gt; mice: PS/2 mouse device common for all mice<br>
&gt; TCP cubic registered<br>
&gt; RAMDISK: gzip image found at block 0<br>
&gt; EXT2-fs (ram0): warning: maximal mount count reached, running e2fsck i=
s<br>
&gt; recommended<br>
&gt; VFS: Mounted root (ext2 filesystem) on device 1:0.<br>
&gt; Freeing init memory: 116K<br>
&gt; Warning: unable to open an initial console.<br>
&gt; Kernel panic - not syncing: Attempted to kill init!<br>
&gt; [&lt;c002b900&gt;] (unwind_backtrace+0x0/0xe0) from [&lt;c003fe9c&gt;]=
<br>
&gt; (panic+0x40/0x12c)<br>
&gt; [&lt;c003fe9c&gt;] (panic+0x40/0x12c) from [&lt;c0042cac&gt;] (do_exit=
+0x58/0x57c)<br>
&gt; [&lt;c0042cac&gt;] (do_exit+0x58/0x57c) from [&lt;c0043254&gt;]<br>
&gt; (do_group_exit+0x84/0xb8)<br>
&gt; [&lt;c0043254&gt;] (do_group_exit+0x84/0xb8) from [&lt;c004329c&gt;]<b=
r>
&gt; (sys_exit_group+0x14/0x20)<br>
&gt; [&lt;c004329c&gt;] (sys_exit_group+0x14/0x20) from [&lt;c0025e80&gt;]<=
br>
&gt; (ret_fast_syscall+0x0/0x28)<br>
<br>
looks like whatever you&#39;re trying to run as init doesn&#39;t have /dev/=
console<br>
available. there seems to be no evidence of UARTs being added in the<br>
setup, are they being registered with the serial driver properly?<br>
<font color=3D"#888888"><br>
--<br>
Ben<br>
<br>
Q: =A0 =A0 =A0What&#39;s a light-year?<br>
A: =A0 =A0 =A0One-third less calories than a regular year.<br>
<br>
</font></blockquote></div><br>

--000e0cd185c2c35341048c7117d0--


--===============1904054488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1904054488==--

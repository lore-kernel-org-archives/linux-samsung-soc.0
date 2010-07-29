From: nitin vishnoi <nitvishnoi@gmail.com>
Subject: Re: not coming prompt in 2.6.33.6 kernel
Date: Thu, 29 Jul 2010 09:08:45 +0530
Message-ID: <AANLkTik7aamACw+YDJibSiveGeQ4B4VCF8GH9jO8BzX6@mail.gmail.com>
References: <AANLkTikgB9OF6mRqZ2KgQYuCQ4JcF7N6oTJyUbrYq0t7@mail.gmail.com>
	<20100728094344.GA9142@trinity.fluff.org>
	<AANLkTikgq_Fb0ZfT-b+9zOA5w2pDpNgwnUqe919hAsnd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0176149469=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AANLkTikgq_Fb0ZfT-b+9zOA5w2pDpNgwnUqe919hAsnd@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wan ZongShun <mcuos.com@gmail.com>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0176149469==
Content-Type: multipart/alternative; boundary=000e0cd4b308b3a07f048c7e78e1

--000e0cd4b308b3a07f048c7e78e1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Now i ported the 2.6.31.14 which i took from kernel.org stable kernel
version on 2451 samsung board.But still not getting prompt.I made the same
changes only like 2.6.33.6 but i am not getting error like previous log
which i sent for 2.6.33.6.Not i am getting the following log.

Starting kernel ...


Uncompressing
Linux...................................................................
done, booting the kernel.
Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.2.2) #12 Wed Ju=
l
28 17:19:29 IST 2010
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: SMDK2450
Ignoring unrecognised tag 0x00000000
Memory policy: ECC disabled, Data cache writeback
CPU S3C2450 EVT3 (id 0x32450003)
SPA   epll  80200102  Mpll  80640061   clkdiv0 557
S3C24XX Clocks, (c) 2004 Simtec Electronics
S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk 66.666
MHz
S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: root=3D/dev/ram initrd=3D0x30800000,8M ramdisk=3D8192
init=3D/bin/sh  console=3DttySAC3,115200 mem=3D64M
PID hash table entries: 256 (order: 8, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB =3D 64MB total
Memory: 54520KB available (1784K code, 223K data, 88K init, 0K highmem)
Hierarchical RCU implementation.
NR_IRQS:109
irq: clearing subpending status 02000006
irq: clearing subpending status 02000002
timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae2
console [ttySAC3] enabled
Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
whats up blady
hello
entered machine init
S3C Power Management, Copyright 2004 Simtec Electronics
S3C2450: Initialising architecture
SPA s3c2450_init
S3C2450: IRQ Support
bio: create slab <bio-0> at 0
Trying to unpack rootfs image as initramfs...
rootfs image is not initramfs (no cpio magic); looks like an initrd
Freeing initrd memory: 8192K
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
ROMFS MTD (C) 2007 Red Hat, Inc.
msgmni has been set to 122
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
brd: module loaded
loop: module loaded
RAMDISK: gzip image found at block 0
EXT2-fs warning: maximal mount count reached, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 88K
Warning: unable to open an initial console.
Kernel panic - not syncing: Attempted to kill init!





On Thu, Jul 29, 2010 at 7:23 AM, Wan ZongShun <mcuos.com@gmail.com> wrote:

> 2010/7/28 Ben Dooks <ben-linux@fluff.org>:
> > On Wed, Jul 28, 2010 at 08:51:06AM +0530, nitin vishnoi wrote:
> >> Hi
> >>
> >> I am porting the 2.6.33.6 kernel,which i took from kernel.org.I am
> trying to
> >> port it on samsung-s3c2451 board.
> >> But i am not getting the shell prompt,due to getting the following
> error.Any
> >> body can tell due to what this error i am getting?
> >>
> >> Starting kernel ...
> >>
> >>
> >> Uncompressing Linux... done, booting the kernel.
> >> Linux version 2.6.33.6 (root@ubntu-desktop) (gcc version 4.2.2) #12 Mo=
n
> Jul
> >> 26 18:39:19 IST 2010
> >> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177
> >> CPU: VIVT data cache, VIVT instruction cache
> >> Machine: SMDK2450
> >> Ignoring unrecognised tag 0x00000000
> >> Memory policy: ECC disabled, Data cache writeback
> >> CPU S3C2450 EVT3 (id 0x32450003)
> >> SPA   epll  80200102  Mpll  80640061   clkdiv0 557
> >> S3C24XX Clocks, (c) 2004 Simtec Electronics
> >> S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk
> 66.666
> >> MHz
> >> S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz
> >> Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
> 16256
> >> Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,16M ramdisk=
=3D32768
> >> init=3D/bin/sh console=3DttySAC3,115200 mem=3D64M
> >> PID hash table entries: 256 (order: -2, 1024 bytes)
> >> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> >> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> >> Memory: 64MB =3D 64MB total
> >> Memory: 45432KB available (2588K code, 271K data, 116K init, 0K highme=
m)
> >> Hierarchical RCU implementation.
> >> NR_IRQS:109
> >> irq: clearing subpending status 02000006
> >> irq: clearing subpending status 02000002
> >> timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae=
2
> >> Console: colour dummy device 80x30
> >> console [ttySAC3] enabled
> >> Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)
> >> Mount-cache hash table entries: 512
> >> CPU: Testing write buffer coherency: ok
> >> NET: Registered protocol family 16
> >> whats up blady
> >> hello
> >> entered machine init
> >> S3C Power Management, Copyright 2004 Simtec Electronics
> >> S3C2450: Initialising architecture
> >> SPA s3c2450_init
> >> S3C2450: IRQ Support
> >> bio: create slab <bio-0> at 0
> >> SCSI subsystem initialized
> >> NET: Registered protocol family 2
> >> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> >> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
> >> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
> >> TCP: Hash tables configured (established 2048 bind 2048)
> >> TCP reno registered
> >> UDP hash table entries: 256 (order: 0, 4096 bytes)
> >> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> >> NET: Registered protocol family 1
> >> Trying to unpack rootfs image as initramfs...
> >> rootfs image is not initramfs (no cpio magic); looks like an initrd
> >> Freeing initrd memory: 16384K
> >> NetWinder Floating Point Emulator V0.97 (double precision)
> >> JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
> >> ROMFS MTD (C) 2007 Red Hat, Inc.
> >> msgmni has been set to 120
> >> alg: No test for stdrng (krng)
> >> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
> >> io scheduler noop registered
> >> io scheduler deadline registered
> >> io scheduler cfq registered (default)
> >> brd: module loaded
> >> loop: module loaded
> >> Uniform Multi-Platform E-IDE driver
> >> ide-gd driver 1.18
> >> ide-cd driver 5.00
> >> PPP generic driver version 2.4.2
> >> PPP Deflate Compression module registered
> >> PPP BSD Compression module registered
> >> PPP MPPE Compression module registered
> >> NET: Registered protocol family 24
> >> SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
> >> CSLIP: code copyright 1989 Regents of the University of California.
> >> mice: PS/2 mouse device common for all mice
> >> TCP cubic registered
> >> RAMDISK: gzip image found at block 0
> >> EXT2-fs (ram0): warning: maximal mount count reached, running e2fsck i=
s
> >> recommended
> >> VFS: Mounted root (ext2 filesystem) on device 1:0.
> >> Freeing init memory: 116K
> >> Warning: unable to open an initial console.
> >> Kernel panic - not syncing: Attempted to kill init!
> >> [<c002b900>] (unwind_backtrace+0x0/0xe0) from [<c003fe9c>]
> >> (panic+0x40/0x12c)
> >> [<c003fe9c>] (panic+0x40/0x12c) from [<c0042cac>] (do_exit+0x58/0x57c)
> >> [<c0042cac>] (do_exit+0x58/0x57c) from [<c0043254>]
> >> (do_group_exit+0x84/0xb8)
> >> [<c0043254>] (do_group_exit+0x84/0xb8) from [<c004329c>]
> >> (sys_exit_group+0x14/0x20)
> >> [<c004329c>] (sys_exit_group+0x14/0x20) from [<c0025e80>]
> >> (ret_fast_syscall+0x0/0x28)
> >
> > looks like whatever you're trying to run as init doesn't have
> /dev/console
> > available.
> Ben, I make sure there is /dev/console in his rootfs directory.
> nitin vishnoi, do you confirm you need the ext to mount the ramdisk?
>
> maybe you can decrease 'ramdisk=3D32768' to 'ramdisk=3D8192'.
>
> >there seems to be no evidence of UARTs being added in the
> > setup, are they being registered with the serial driver properly?
> >
> > --
> > Ben
> >
> > Q:      What's a light-year?
> > A:      One-third less calories than a regular year.
> >
> >
>
>
>
> --
> *linux-arm-kernel mailing list
> mail addr:linux-arm-kernel@lists.infradead.org<addr%3Alinux-arm-kernel@li=
sts.infradead.org>
> you can subscribe by:
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> * linux-arm-NUC900 mailing list
> mail addr:NUC900@googlegroups.com <addr%3ANUC900@googlegroups.com>
> main web: https://groups.google.com/group/NUC900
> you can subscribe it by sending me mail:
> mcuos.com@gmail.com
>

--000e0cd4b308b3a07f048c7e78e1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Now i ported the 2.6.31.14 which i took from <a href=3D"http://kernel.org">=
kernel.org</a> stable kernel version on 2451 samsung board.But still not ge=
tting prompt.I made the same changes only like 2.6.33.6 but i am not gettin=
g error like previous log which i sent for 2.6.33.6.Not i am getting the fo=
llowing log.<br>
<br>Starting kernel ...<br><br><br>Uncompressing Linux.....................=
.............................................. done, booting the kernel.<br=
>Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.2.2) #12 Wed J=
ul 28 17:19:29 IST 2010<br>
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177<br>CPU: VIV=
T data cache, VIVT instruction cache<br>Machine: SMDK2450<br>Ignoring unrec=
ognised tag 0x00000000<br>Memory policy: ECC disabled, Data cache writeback=
<br>
CPU S3C2450 EVT3 (id 0x32450003)<br>SPA=A0=A0 epll=A0 80200102=A0 Mpll=A0 8=
0640061=A0=A0 clkdiv0 557 <br>S3C24XX Clocks, (c) 2004 Simtec Electronics<b=
r>S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk 66.6=
66 MHz<br>
S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz<br>Built 1 zonelists in Zon=
e order, mobility grouping on.=A0 Total pages: 16256<br>Kernel command line=
: root=3D/dev/ram initrd=3D0x30800000,8M ramdisk=3D8192 init=3D/bin/sh=A0 c=
onsole=3DttySAC3,115200 mem=3D64M<br>
PID hash table entries: 256 (order: 8, 1024 bytes)<br>Dentry cache hash tab=
le entries: 8192 (order: 3, 32768 bytes)<br>Inode-cache hash table entries:=
 4096 (order: 2, 16384 bytes)<br>Memory: 64MB =3D 64MB total<br>Memory: 545=
20KB available (1784K code, 223K data, 88K init, 0K highmem)<br>
Hierarchical RCU implementation.<br>NR_IRQS:109<br>irq: clearing subpending=
 status 02000006<br>irq: clearing subpending status 02000002<br>timer tcon=
=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae2<br>console [t=
tySAC3] enabled<br>
Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)<br>Mount-cache has=
h table entries: 512<br>CPU: Testing write buffer coherency: ok<br>whats up=
 blady <br>hello=A0 <br>entered machine init <br>S3C Power Management, Copy=
right 2004 Simtec Electronics<br>
S3C2450: Initialising architecture<br>SPA s3c2450_init=A0 <br>S3C2450: IRQ =
Support<br>bio: create slab &lt;bio-0&gt; at 0<br>Trying to unpack rootfs i=
mage as initramfs...<br>rootfs image is not initramfs (no cpio magic); look=
s like an initrd<br>
Freeing initrd memory: 8192K<br>NetWinder Floating Point Emulator V0.97 (do=
uble precision)<br>JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.=
<br>ROMFS MTD (C) 2007 Red Hat, Inc.<br>msgmni has been set to 122<br>alg: =
No test for stdrng (krng)<br>
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)<br>io =
scheduler noop registered<br>io scheduler anticipatory registered<br>io sch=
eduler deadline registered<br>io scheduler cfq registered (default)<br>
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br>brd: module load=
ed<br>loop: module loaded<br>RAMDISK: gzip image found at block 0<br>EXT2-f=
s warning: maximal mount count reached, running e2fsck is recommended<br>
VFS: Mounted root (ext2 filesystem) on device 1:0.<br>Freeing init memory: =
88K<br>Warning: unable to open an initial console.<br>Kernel panic - not sy=
ncing: Attempted to kill init!<br><br><br><br><br><br><div class=3D"gmail_q=
uote">
On Thu, Jul 29, 2010 at 7:23 AM, Wan ZongShun <span dir=3D"ltr">&lt;<a href=
=3D"http://mcuos.com">mcuos.com</a>@<a href=3D"http://gmail.com">gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"border-=
left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left=
: 1ex;">
2010/7/28 Ben Dooks &lt;<a href=3D"mailto:ben-linux@fluff.org">ben-linux@fl=
uff.org</a>&gt;:<br>
&gt; On Wed, Jul 28, 2010 at 08:51:06AM +0530, nitin vishnoi wrote:<br>
&gt;&gt; Hi<br>
&gt;&gt;<br>
&gt;&gt; I am porting the 2.6.33.6 kernel,which i took from kernel.org.I am=
 trying to<br>
&gt;&gt; port it on samsung-s3c2451 board.<br>
&gt;&gt; But i am not getting the shell prompt,due to getting the following=
 error.Any<br>
&gt;&gt; body can tell due to what this error i am getting?<br>
&gt;&gt;<br>
&gt;&gt; Starting kernel ...<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Uncompressing Linux... done, booting the kernel.<br>
&gt;&gt; Linux version 2.6.33.6 (root@ubntu-desktop) (gcc version 4.2.2) #1=
2 Mon Jul<br>
&gt;&gt; 26 18:39:19 IST 2010<br>
&gt;&gt; CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177<br=
>
&gt;&gt; CPU: VIVT data cache, VIVT instruction cache<br>
&gt;&gt; Machine: SMDK2450<br>
&gt;&gt; Ignoring unrecognised tag 0x00000000<br>
&gt;&gt; Memory policy: ECC disabled, Data cache writeback<br>
&gt;&gt; CPU S3C2450 EVT3 (id 0x32450003)<br>
&gt;&gt; SPA =A0 epll =A080200102 =A0Mpll =A080640061 =A0 clkdiv0 557<br>
&gt;&gt; S3C24XX Clocks, (c) 2004 Simtec Electronics<br>
&gt;&gt; S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pc=
lk 66.666<br>
&gt;&gt; MHz<br>
&gt;&gt; S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz<br>
&gt;&gt; Built 1 zonelists in Zone order, mobility grouping on. =A0Total pa=
ges: 16256<br>
&gt;&gt; Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,16M ramd=
isk=3D32768<br>
&gt;&gt; init=3D/bin/sh console=3DttySAC3,115200 mem=3D64M<br>
&gt;&gt; PID hash table entries: 256 (order: -2, 1024 bytes)<br>
&gt;&gt; Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)<br>
&gt;&gt; Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)<br>
&gt;&gt; Memory: 64MB =3D 64MB total<br>
&gt;&gt; Memory: 45432KB available (2588K code, 271K data, 116K init, 0K hi=
ghmem)<br>
&gt;&gt; Hierarchical RCU implementation.<br>
&gt;&gt; NR_IRQS:109<br>
&gt;&gt; irq: clearing subpending status 02000006<br>
&gt;&gt; irq: clearing subpending status 02000002<br>
&gt;&gt; timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 000=
07ae2<br>
&gt;&gt; Console: colour dummy device 80x30<br>
&gt;&gt; console [ttySAC3] enabled<br>
&gt;&gt; Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)<br>
&gt;&gt; Mount-cache hash table entries: 512<br>
&gt;&gt; CPU: Testing write buffer coherency: ok<br>
&gt;&gt; NET: Registered protocol family 16<br>
&gt;&gt; whats up blady<br>
&gt;&gt; hello<br>
&gt;&gt; entered machine init<br>
&gt;&gt; S3C Power Management, Copyright 2004 Simtec Electronics<br>
&gt;&gt; S3C2450: Initialising architecture<br>
&gt;&gt; SPA s3c2450_init<br>
&gt;&gt; S3C2450: IRQ Support<br>
&gt;&gt; bio: create slab &lt;bio-0&gt; at 0<br>
&gt;&gt; SCSI subsystem initialized<br>
&gt;&gt; NET: Registered protocol family 2<br>
&gt;&gt; IP route cache hash table entries: 1024 (order: 0, 4096 bytes)<br>
&gt;&gt; TCP established hash table entries: 2048 (order: 2, 16384 bytes)<b=
r>
&gt;&gt; TCP bind hash table entries: 2048 (order: 1, 8192 bytes)<br>
&gt;&gt; TCP: Hash tables configured (established 2048 bind 2048)<br>
&gt;&gt; TCP reno registered<br>
&gt;&gt; UDP hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt;&gt; UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt;&gt; NET: Registered protocol family 1<br>
&gt;&gt; Trying to unpack rootfs image as initramfs...<br>
&gt;&gt; rootfs image is not initramfs (no cpio magic); looks like an initr=
d<br>
&gt;&gt; Freeing initrd memory: 16384K<br>
&gt;&gt; NetWinder Floating Point Emulator V0.97 (double precision)<br>
&gt;&gt; JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.<br>
&gt;&gt; ROMFS MTD (C) 2007 Red Hat, Inc.<br>
&gt;&gt; msgmni has been set to 120<br>
&gt;&gt; alg: No test for stdrng (krng)<br>
&gt;&gt; Block layer SCSI generic (bsg) driver version 0.4 loaded (major 25=
4)<br>
&gt;&gt; io scheduler noop registered<br>
&gt;&gt; io scheduler deadline registered<br>
&gt;&gt; io scheduler cfq registered (default)<br>
&gt;&gt; brd: module loaded<br>
&gt;&gt; loop: module loaded<br>
&gt;&gt; Uniform Multi-Platform E-IDE driver<br>
&gt;&gt; ide-gd driver 1.18<br>
&gt;&gt; ide-cd driver 5.00<br>
&gt;&gt; PPP generic driver version 2.4.2<br>
&gt;&gt; PPP Deflate Compression module registered<br>
&gt;&gt; PPP BSD Compression module registered<br>
&gt;&gt; PPP MPPE Compression module registered<br>
&gt;&gt; NET: Registered protocol family 24<br>
&gt;&gt; SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).=
<br>
&gt;&gt; CSLIP: code copyright 1989 Regents of the University of California=
.<br>
&gt;&gt; mice: PS/2 mouse device common for all mice<br>
&gt;&gt; TCP cubic registered<br>
&gt;&gt; RAMDISK: gzip image found at block 0<br>
&gt;&gt; EXT2-fs (ram0): warning: maximal mount count reached, running e2fs=
ck is<br>
&gt;&gt; recommended<br>
&gt;&gt; VFS: Mounted root (ext2 filesystem) on device 1:0.<br>
&gt;&gt; Freeing init memory: 116K<br>
&gt;&gt; Warning: unable to open an initial console.<br>
&gt;&gt; Kernel panic - not syncing: Attempted to kill init!<br>
&gt;&gt; [&lt;c002b900&gt;] (unwind_backtrace+0x0/0xe0) from [&lt;c003fe9c&=
gt;]<br>
&gt;&gt; (panic+0x40/0x12c)<br>
&gt;&gt; [&lt;c003fe9c&gt;] (panic+0x40/0x12c) from [&lt;c0042cac&gt;] (do_=
exit+0x58/0x57c)<br>
&gt;&gt; [&lt;c0042cac&gt;] (do_exit+0x58/0x57c) from [&lt;c0043254&gt;]<br=
>
&gt;&gt; (do_group_exit+0x84/0xb8)<br>
&gt;&gt; [&lt;c0043254&gt;] (do_group_exit+0x84/0xb8) from [&lt;c004329c&gt=
;]<br>
&gt;&gt; (sys_exit_group+0x14/0x20)<br>
&gt;&gt; [&lt;c004329c&gt;] (sys_exit_group+0x14/0x20) from [&lt;c0025e80&g=
t;]<br>
&gt;&gt; (ret_fast_syscall+0x0/0x28)<br>
&gt;<br>
&gt; looks like whatever you&#39;re trying to run as init doesn&#39;t have =
/dev/console<br>
&gt; available.<br>
Ben, I make sure there is /dev/console in his rootfs directory.<br>
nitin vishnoi, do you confirm you need the ext to mount the ramdisk?<br>
<br>
maybe you can decrease &#39;ramdisk=3D32768&#39; to &#39;ramdisk=3D8192&#39=
;.<br>
<br>
&gt;there seems to be no evidence of UARTs being added in the<br>
&gt; setup, are they being registered with the serial driver properly?<br>
&gt;<br>
&gt; --<br>
&gt; Ben<br>
&gt;<br>
&gt; Q: =A0 =A0 =A0What&#39;s a light-year?<br>
&gt; A: =A0 =A0 =A0One-third less calories than a regular year.<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
*linux-arm-kernel mailing list<br>
mail <a href=3D"mailto:addr%3Alinux-arm-kernel@lists.infradead.org">addr:li=
nux-arm-kernel@lists.infradead.org</a><br>
you can subscribe by:<br>
<div class=3D"im"><a href=3D"http://lists.infradead.org/mailman/listinfo/li=
nux-arm-kernel" target=3D"_blank">http://lists.infradead.org/mailman/listin=
fo/linux-arm-kernel</a><br>
<br>
</div>* linux-arm-NUC900 mailing list<br>
mail <a href=3D"mailto:addr%3ANUC900@googlegroups.com">addr:NUC900@googlegr=
oups.com</a><br>
main web: <a href=3D"https://groups.google.com/group/NUC900" target=3D"_bla=
nk">https://groups.google.com/group/NUC900</a><br>
you can subscribe it by sending me mail:<br>
<a href=3D"http://mcuos.com" target=3D"_blank">mcuos.com</a>@<a href=3D"htt=
p://gmail.com" target=3D"_blank">gmail.com</a><br>
</blockquote></div><br>

--000e0cd4b308b3a07f048c7e78e1--


--===============0176149469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0176149469==--

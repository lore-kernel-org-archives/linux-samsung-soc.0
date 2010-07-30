From: nitin vishnoi <nitvishnoi@gmail.com>
Subject: Re: not coming prompt in 2.6.33.6 kernel
Date: Fri, 30 Jul 2010 09:25:39 +0530
Message-ID: <AANLkTimUqNU_QMJ_-BoahtnJ=9kzzUkYnP=W4c_9vDs-@mail.gmail.com>
References: <AANLkTikgB9OF6mRqZ2KgQYuCQ4JcF7N6oTJyUbrYq0t7@mail.gmail.com>
	<20100728094344.GA9142@trinity.fluff.org>
	<AANLkTikgq_Fb0ZfT-b+9zOA5w2pDpNgwnUqe919hAsnd@mail.gmail.com>
	<20100729090854.GC14880@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0404535496=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20100729090854.GC14880@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, Wan ZongShun <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0404535496==
Content-Type: multipart/alternative; boundary=0016362837a0fbb376048c92d278

--0016362837a0fbb376048c92d278
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

i am gettting the following error while porting 2.6.31.4 kernel on s3c2451
board.

Starting kernel ...


Uncompressing
Linux......................................................................=
.
done, booting the kernel.
Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.1.2) #19 Fri Ju=
l
30 09:14:47 IST 2010
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
Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,8M ramdisk=3D2457=
6
init=3D/bin/sh  console=3DttySAC3,115200 mem=3D64M
PID hash table entries: 256 (order: 8, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB =3D 64MB total
Memory: 54392KB available (1888K code, 245K data, 92K init, 0K highmem)
Hierarchical RCU implementation.
NR_IRQS:109
irq: clearing subpending status 02000006
irq: clearing subpending status 02000002
timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae2
Console: colour dummy device 80x30
s3c24xx_serial_init_ports: initialising ports...
console [ttySAC3] enabled
Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
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
uncompression error
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem) on device 1:0.
Freeing init memory: 92K
Warning: unable to open an initial console.
Kernel panic - not syncing: Attempted to kill init!

what may be the reason.

On Thu, Jul 29, 2010 at 2:38 PM, Russell King - ARM Linux <
linux@arm.linux.org.uk> wrote:

> On Thu, Jul 29, 2010 at 09:53:11AM +0800, Wan ZongShun wrote:
> > >> Console: colour dummy device 80x30
> > >> console [ttySAC3] enabled
>
> Okay, so the kernel console driver appears...
>
> > >> Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)
> > >> Mount-cache hash table entries: 512
> > >> CPU: Testing write buffer coherency: ok
> > >> NET: Registered protocol family 16
> > >> whats up blady
> > >> hello
> > >> entered machine init
> > >> S3C Power Management, Copyright 2004 Simtec Electronics
> > >> S3C2450: Initialising architecture
> > >> SPA s3c2450_init
> > >> S3C2450: IRQ Support
> > >> bio: create slab <bio-0> at 0
> > >> SCSI subsystem initialized
> > >> NET: Registered protocol family 2
> > >> IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
> > >> TCP established hash table entries: 2048 (order: 2, 16384 bytes)
> > >> TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
> > >> TCP: Hash tables configured (established 2048 bind 2048)
> > >> TCP reno registered
> > >> UDP hash table entries: 256 (order: 0, 4096 bytes)
> > >> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> > >> NET: Registered protocol family 1
> > >> Trying to unpack rootfs image as initramfs...
> > >> rootfs image is not initramfs (no cpio magic); looks like an initrd
> > >> Freeing initrd memory: 16384K
> > >> NetWinder Floating Point Emulator V0.97 (double precision)
> > >> JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
> > >> ROMFS MTD (C) 2007 Red Hat, Inc.
> > >> msgmni has been set to 120
> > >> alg: No test for stdrng (krng)
> > >> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
> > >> io scheduler noop registered
> > >> io scheduler deadline registered
> > >> io scheduler cfq registered (default)
> > >> brd: module loaded
> > >> loop: module loaded
> > >> Uniform Multi-Platform E-IDE driver
> > >> ide-gd driver 1.18
> > >> ide-cd driver 5.00
> > >> PPP generic driver version 2.4.2
> > >> PPP Deflate Compression module registered
> > >> PPP BSD Compression module registered
> > >> PPP MPPE Compression module registered
> > >> NET: Registered protocol family 24
> > >> SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
> > >> CSLIP: code copyright 1989 Regents of the University of California.
> > >> mice: PS/2 mouse device common for all mice
> > >> TCP cubic registered
> > >> RAMDISK: gzip image found at block 0
> > >> EXT2-fs (ram0): warning: maximal mount count reached, running e2fsck
> is
> > >> recommended
> > >> VFS: Mounted root (ext2 filesystem) on device 1:0.
> > >> Freeing init memory: 116K
> > >> Warning: unable to open an initial console.
>
> But nowhere in these messages do I see the user-level tty drivers for the
> serial ports - which means that you don't have a userland console driver.
>

--0016362837a0fbb376048c92d278
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

i am gettting the following error while porting 2.6.31.4 kernel on s3c2451 =
board.<br>
<br>
Starting kernel ...<br>
<br>
<br>
Uncompressing Linux........................................................=
............... done, booting the kernel.<br>
Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.1.2) #19 Fri Ju=
l 30 09:14:47 IST 2010<br>
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177<br>
CPU: VIVT data cache, VIVT instruction cache<br>
Machine: SMDK2450<br>
Ignoring unrecognised tag 0x00000000<br>
Memory policy: ECC disabled, Data cache writeback<br>
CPU S3C2450 EVT3 (id 0x32450003)<br>
SPA=A0=A0 epll=A0 80200102=A0 Mpll=A0 80640061=A0=A0 clkdiv0 557 <br>
S3C24XX Clocks, (c) 2004 Simtec Electronics<br>
S3C2450: mpll on 800.000 MHz, cpu 400.000 MHz, mem 133.333 MHz, pclk 66.666=
 MHz<br>
S3C2450: epll on 96.000 MHz, usb-bus 48.000 MHz<br>
Built 1 zonelists in Zone order, mobility grouping on.=A0 Total pages: 1625=
6<br>
Kernel command line: root=3D/dev/ram0 initrd=3D0x30800000,8M ramdisk=3D2457=
6 init=3D/bin/sh=A0 console=3DttySAC3,115200 mem=3D64M<br>
PID hash table entries: 256 (order: 8, 1024 bytes)<br>
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)<br>
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)<br>
Memory: 64MB =3D 64MB total<br>
Memory: 54392KB available (1888K code, 245K data, 92K init, 0K highmem)<br>
Hierarchical RCU implementation.<br>
NR_IRQS:109<br>
irq: clearing subpending status 02000006<br>
irq: clearing subpending status 02000002<br>
timer tcon=3D00000000, tcnt 28af, tcfg 00000f00,00000000, usec 00007ae2<br>
Console: colour dummy device 80x30<br>
s3c24xx_serial_init_ports: initialising ports...<br>
console [ttySAC3] enabled<br>
Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)<br>
Mount-cache hash table entries: 512<br>
CPU: Testing write buffer coherency: ok<br>
entered machine init <br>
S3C Power Management, Copyright 2004 Simtec Electronics<br>
S3C2450: Initialising architecture<br>
SPA s3c2450_init=A0 <br>
S3C2450: IRQ Support<br>
bio: create slab &lt;bio-0&gt; at 0<br>
Trying to unpack rootfs image as initramfs...<br>
rootfs image is not initramfs (no cpio magic); looks like an initrd<br>
Freeing initrd memory: 8192K<br>
NetWinder Floating Point Emulator V0.97 (double precision)<br>
JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.<br>
ROMFS MTD (C) 2007 Red Hat, Inc.<br>
msgmni has been set to 122<br>
alg: No test for stdrng (krng)<br>
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)<br>
io scheduler noop registered<br>
io scheduler anticipatory registered<br>
io scheduler deadline registered<br>
io scheduler cfq registered (default)<br>
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br>
brd: module loaded<br>
loop: module loaded<br>
RAMDISK: gzip image found at block 0<br>
uncompression error<br>
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended<br>
VFS: Mounted root (ext2 filesystem) on device 1:0.<br>
Freeing init memory: 92K<br>
Warning: unable to open an initial console.<br>
Kernel panic - not syncing: Attempted to kill init!<br>
<br>
what may be the reason.<br><br><div class=3D"gmail_quote">On Thu, Jul 29, 2=
010 at 2:38 PM, Russell King - ARM Linux <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:linux@arm.linux.org.uk">linux@arm.linux.org.uk</a>&gt;</span> wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class=3D"im"=
>On Thu, Jul 29, 2010 at 09:53:11AM +0800, Wan ZongShun wrote:<br>
&gt; &gt;&gt; Console: colour dummy device 80x30<br>
&gt; &gt;&gt; console [ttySAC3] enabled<br>
<br>
</div>Okay, so the kernel console driver appears...<br>
<div><div></div><div class=3D"h5"><br>
&gt; &gt;&gt; Calibrating delay loop... 398.95 BogoMIPS (lpj=3D997376)<br>
&gt; &gt;&gt; Mount-cache hash table entries: 512<br>
&gt; &gt;&gt; CPU: Testing write buffer coherency: ok<br>
&gt; &gt;&gt; NET: Registered protocol family 16<br>
&gt; &gt;&gt; whats up blady<br>
&gt; &gt;&gt; hello<br>
&gt; &gt;&gt; entered machine init<br>
&gt; &gt;&gt; S3C Power Management, Copyright 2004 Simtec Electronics<br>
&gt; &gt;&gt; S3C2450: Initialising architecture<br>
&gt; &gt;&gt; SPA s3c2450_init<br>
&gt; &gt;&gt; S3C2450: IRQ Support<br>
&gt; &gt;&gt; bio: create slab &lt;bio-0&gt; at 0<br>
&gt; &gt;&gt; SCSI subsystem initialized<br>
&gt; &gt;&gt; NET: Registered protocol family 2<br>
&gt; &gt;&gt; IP route cache hash table entries: 1024 (order: 0, 4096 bytes=
)<br>
&gt; &gt;&gt; TCP established hash table entries: 2048 (order: 2, 16384 byt=
es)<br>
&gt; &gt;&gt; TCP bind hash table entries: 2048 (order: 1, 8192 bytes)<br>
&gt; &gt;&gt; TCP: Hash tables configured (established 2048 bind 2048)<br>
&gt; &gt;&gt; TCP reno registered<br>
&gt; &gt;&gt; UDP hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt; &gt;&gt; UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt; &gt;&gt; NET: Registered protocol family 1<br>
&gt; &gt;&gt; Trying to unpack rootfs image as initramfs...<br>
&gt; &gt;&gt; rootfs image is not initramfs (no cpio magic); looks like an =
initrd<br>
&gt; &gt;&gt; Freeing initrd memory: 16384K<br>
&gt; &gt;&gt; NetWinder Floating Point Emulator V0.97 (double precision)<br=
>
&gt; &gt;&gt; JFFS2 version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.<br>
&gt; &gt;&gt; ROMFS MTD (C) 2007 Red Hat, Inc.<br>
&gt; &gt;&gt; msgmni has been set to 120<br>
&gt; &gt;&gt; alg: No test for stdrng (krng)<br>
&gt; &gt;&gt; Block layer SCSI generic (bsg) driver version 0.4 loaded (maj=
or 254)<br>
&gt; &gt;&gt; io scheduler noop registered<br>
&gt; &gt;&gt; io scheduler deadline registered<br>
&gt; &gt;&gt; io scheduler cfq registered (default)<br>
&gt; &gt;&gt; brd: module loaded<br>
&gt; &gt;&gt; loop: module loaded<br>
&gt; &gt;&gt; Uniform Multi-Platform E-IDE driver<br>
&gt; &gt;&gt; ide-gd driver 1.18<br>
&gt; &gt;&gt; ide-cd driver 5.00<br>
&gt; &gt;&gt; PPP generic driver version 2.4.2<br>
&gt; &gt;&gt; PPP Deflate Compression module registered<br>
&gt; &gt;&gt; PPP BSD Compression module registered<br>
&gt; &gt;&gt; PPP MPPE Compression module registered<br>
&gt; &gt;&gt; NET: Registered protocol family 24<br>
&gt; &gt;&gt; SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D=
256).<br>
&gt; &gt;&gt; CSLIP: code copyright 1989 Regents of the University of Calif=
ornia.<br>
&gt; &gt;&gt; mice: PS/2 mouse device common for all mice<br>
&gt; &gt;&gt; TCP cubic registered<br>
&gt; &gt;&gt; RAMDISK: gzip image found at block 0<br>
&gt; &gt;&gt; EXT2-fs (ram0): warning: maximal mount count reached, running=
 e2fsck is<br>
&gt; &gt;&gt; recommended<br>
&gt; &gt;&gt; VFS: Mounted root (ext2 filesystem) on device 1:0.<br>
&gt; &gt;&gt; Freeing init memory: 116K<br>
&gt; &gt;&gt; Warning: unable to open an initial console.<br>
<br>
</div></div>But nowhere in these messages do I see the user-level tty drive=
rs for the<br>
serial ports - which means that you don&#39;t have a userland console drive=
r.<br>
</blockquote></div><br>

--0016362837a0fbb376048c92d278--


--===============0404535496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0404535496==--

From: nitin vishnoi <nitvishnoi@gmail.com>
Subject: Re: not coming prompt in 2.6.33.6 kernel
Date: Mon, 2 Aug 2010 11:42:07 +0530
Message-ID: <AANLkTikZwzfY4kJ-9i5Y87vA7HMutRJUM5-5Y_HnQeb=@mail.gmail.com>
References: <AANLkTikgB9OF6mRqZ2KgQYuCQ4JcF7N6oTJyUbrYq0t7@mail.gmail.com>
	<20100728094344.GA9142@trinity.fluff.org>
	<AANLkTikgq_Fb0ZfT-b+9zOA5w2pDpNgwnUqe919hAsnd@mail.gmail.com>
	<AANLkTin8STiQqvjZo-atA9jhz1OLWuk2k61-VYnZrcD8@mail.gmail.com>
	<AANLkTim8KEn7-dFpHdbYs0Wvi_hxjrbmUmhEQ2nMOtHj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1496672757=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AANLkTim8KEn7-dFpHdbYs0Wvi_hxjrbmUmhEQ2nMOtHj@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Fuzzey <mfuzzey@gmail.com>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, Wan ZongShun <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1496672757==
Content-Type: multipart/alternative; boundary=000e0cd29ca68948e2048cd11440

--000e0cd29ca68948e2048cd11440
Content-Type: text/plain; charset=ISO-8859-1

Hi
Finally i got the prompt,
the problem was in toolchain.I compiled the busybox and kernel with other
new toolchain and made the ramdisk filesystem.Than i got the prompt.

Regards

Nitin

On Fri, Jul 30, 2010 at 8:55 PM, Martin Fuzzey <mfuzzey@gmail.com> wrote:

> Hi,
> On Fri, Jul 30, 2010 at 12:40 PM, nitin vishnoi <nitvishnoi@gmail.com>
> wrote:
> > Hi now i am able the uart info also.Bu stil not getting the prompt.
> > and getting the following log.
> >
> > Starting kernel ...
> >
> >
> > Uncompressing
> >
> Linux......................................................................
> > done, booting the kernel.
> > Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.1.2) #34 Fri
> Jul
> > 30 15:33:38 IST 2010
> > CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
> > CPU: VIVT data cache, VIVT instruction cache
> > Kernel command line: root=/dev/ram initrd=0x30800000,8M ramdisk=24576
> > init=/sbin/init console=ttySAC3,115200 mem=64M
> > RAMDISK: gzip image found at block 0
> > EXT2-fs warning: maximal mount count reached, running e2fsck is
> recommended
> > VFS: Mounted root (ext2 filesystem) on device 1:0.
> > Freeing init memory: 88K
> > Kernel panic - not syncing: Attempted to kill init!
> >
>
> Looks like the init process is terminating unexpectedly.
> What's /sbin/init for you?
> How is it compiled? (could it be a OABI / EABI issue?)
>
> What happens if you try booting with  init=/bin/sh   ?
> or try using a script like this as init
>
> #! /bin/sh
> echo "Test stdout"
> echo "Test console" > /dev/console
> echo "Test tty1" > /dev/tty1
> /bin/ls -l /dev > /dev/tty1
>
> Cheers,
> Martin
>

--000e0cd29ca68948e2048cd11440
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi <br>Finally i got the prompt,<br>the problem was in toolchain.I compiled=
 the busybox and kernel with other new toolchain and made the ramdisk files=
ystem.Than i got the prompt.<br><br>Regards<br><br>Nitin<br><br><div class=
=3D"gmail_quote">
On Fri, Jul 30, 2010 at 8:55 PM, Martin Fuzzey <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mfuzzey@gmail.com">mfuzzey@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 2=
04, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Hi,<br>
On Fri, Jul 30, 2010 at 12:40 PM, nitin vishnoi &lt;<a href=3D"mailto:nitvi=
shnoi@gmail.com">nitvishnoi@gmail.com</a>&gt; wrote:<br>
&gt; Hi now i am able the uart info also.Bu stil not getting the prompt.<br=
>
&gt; and getting the following log.<br>
&gt;<br>
&gt; Starting kernel ...<br>
&gt;<br>
&gt;<br>
&gt; Uncompressing<br>
&gt; Linux.................................................................=
.....<br>
&gt; done, booting the kernel.<br>
&gt; Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.1.2) #34 F=
ri Jul<br>
&gt; 30 15:33:38 IST 2010<br>
&gt; CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00053177<br>
&gt; CPU: VIVT data cache, VIVT instruction cache<br>
&gt; Kernel command line: root=3D/dev/ram initrd=3D0x30800000,8M ramdisk=3D=
24576<br>
&gt; init=3D/sbin/init console=3DttySAC3,115200 mem=3D64M<br>
&gt; RAMDISK: gzip image found at block 0<br>
&gt; EXT2-fs warning: maximal mount count reached, running e2fsck is recomm=
ended<br>
&gt; VFS: Mounted root (ext2 filesystem) on device 1:0.<br>
&gt; Freeing init memory: 88K<br>
&gt; Kernel panic - not syncing: Attempted to kill init!<br>
&gt;<br>
<br>
Looks like the init process is terminating unexpectedly.<br>
What&#39;s /sbin/init for you?<br>
How is it compiled? (could it be a OABI / EABI issue?)<br>
<br>
What happens if you try booting with =A0init=3D/bin/sh =A0 ?<br>
or try using a script like this as init<br>
<br>
#! /bin/sh<br>
echo &quot;Test stdout&quot;<br>
echo &quot;Test console&quot; &gt; /dev/console<br>
echo &quot;Test tty1&quot; &gt; /dev/tty1<br>
/bin/ls -l /dev &gt; /dev/tty1<br>
<br>
Cheers,<br>
<font color=3D"#888888">Martin<br>
</font></blockquote></div><br>

--000e0cd29ca68948e2048cd11440--


--===============1496672757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1496672757==--

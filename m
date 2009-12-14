From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] ARM: S5P6440: Kconfigs and Makefiles
Date: Mon, 14 Dec 2009 20:00:35 +0900
Message-ID: <000c01ca7cac$a9cec540$fd6c4fc0$%kim@samsung.com>
References: <1260525158-4106-1-git-send-email-kgene.kim@samsung.com>
 <1b68c6790912110529u3256e189s8b7c9bec8d17129b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45905 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756704AbZLNK6s convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 05:58:48 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUN001902HYLX@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 19:58:46 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUN00KWK2HXQD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 19:58:45 +0900 (KST)
In-reply-to: <1b68c6790912110529u3256e189s8b7c9bec8d17129b@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'jassi brar' <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>

On Fri, Dec 11, 2009 at 22:30 +0900, jassi brar wrote:
> On Fri, Dec 11, 2009 at 6:52 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > This patch adds Kconfigs and Makefiles for S5P6440.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> > ---
> >  arch/arm/Kconfig                    |   14 ++++++++++++-
> >  arch/arm/Makefile                   |    2 +
> >  arch/arm/mach-s5p6440/Kconfig       |   21 ++++++++++++++++++++
> >  arch/arm/mach-s5p6440/Makefile      |   19 ++++++++++++++++++
> >  arch/arm/mach-s5p6440/Makefile.boot |    2 +
> >  arch/arm/plat-s5p/Kconfig           |   36
> +++++++++++++++++++++++++++++++++++
> >  arch/arm/plat-s5p/Makefile          |   25 +++++++++++++++++++++++=
+
> >  7 files changed, 118 insertions(+), 1 deletions(-)
> >  create mode 100644 arch/arm/mach-s5p6440/Kconfig
> >  create mode 100644 arch/arm/mach-s5p6440/Makefile
> >  create mode 100644 arch/arm/mach-s5p6440/Makefile.boot
> >  create mode 100644 arch/arm/plat-s5p/Kconfig
> >  create mode 100644 arch/arm/plat-s5p/Makefile
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 78b6060..c9cb8ee 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -588,6 +588,13 @@ config ARCH_S3C64XX
> >        help
> >          Samsung S3C64XX series based systems
> >
> > +config ARCH_S5P6440
> > +       bool "Samsung S5P6440"
> > +       select GENERIC_GPIO
> > +       select HAVE_CLK
> > +       help
> > +         Samsung S5P6440 CPU based systems
> > +
> >  config ARCH_S5PC1XX
> >        bool "Samsung S5PC1XX"
> >        select GENERIC_GPIO
> > @@ -707,6 +714,7 @@ source "arch/arm/plat-samsung/Kconfig"
> >  source "arch/arm/plat-s3c24xx/Kconfig"
> >  source "arch/arm/plat-s3c64xx/Kconfig"
> >  source "arch/arm/plat-s3c/Kconfig"
> > +source "arch/arm/plat-s5p/Kconfig"
> >  source "arch/arm/plat-s5pc1xx/Kconfig"
> Issue of s5p64xx hogging namespace might arise for s5pc1xx.
> (s5p ought to be inclusive to s5pc1xx too, not just s5p64xx)
Yes, you=E2=80=99re right. As you mentioned plat-s5p can support all s5=
p series. Although current plat-s5p is for s5p6440, but the common plat=
 code of all s5p series will be included there. Of course, all Samsung =
SoCs' common plat code will be included to plat-samsung.


> >  if ARCH_S3C2410
> > @@ -723,6 +731,10 @@ source "arch/arm/mach-s3c6400/Kconfig"
> >  source "arch/arm/mach-s3c6410/Kconfig"
> >  endif
> >
> > +if ARCH_S5P6440
> > +source "arch/arm/mach-s5p6440/Kconfig"
> > +endif
> > +
> >  source "arch/arm/plat-stmp3xxx/Kconfig"
> >
> >  if ARCH_S5PC1XX
> > @@ -1005,7 +1017,7 @@ config PREEMPT
> >  config HZ
> >        int
> >        default 128 if ARCH_L7200
> > -       default 200 if ARCH_EBSA110 || ARCH_S3C2410
> > +       default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P6440
> >        default OMAP_32K_TIMER_HZ if ARCH_OMAP && OMAP_32K_TIMER
> >        default AT91_TIMER_HZ if ARCH_AT91
> >        default 100
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index a026565..376da2b 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -151,6 +151,7 @@ machine-$(CONFIG_ARCH_S3C2410)              :=3D
> s3c2410 s3c2400 s3c2412 s3c2440 s3c2442 s3c24
> >  machine-$(CONFIG_ARCH_S3C24A0)         :=3D s3c24a0
> >  machine-$(CONFIG_ARCH_S3C64XX)         :=3D s3c6400 s3c6410
> >  machine-$(CONFIG_ARCH_S5PC1XX)         :=3D s5pc100
> > +machine-$(CONFIG_ARCH_S5P6440)         :=3D s5p6440
> >  machine-$(CONFIG_ARCH_SA1100)          :=3D sa1100
> >  machine-$(CONFIG_ARCH_SHARK)           :=3D shark
> >  machine-$(CONFIG_ARCH_STMP378X)                :=3D stmp378x
> > @@ -170,6 +171,7 @@ plat-$(CONFIG_PLAT_PXA)             :=3D pxa
> >  plat-$(CONFIG_PLAT_S3C24XX)    :=3D s3c24xx s3c samsung
> >  plat-$(CONFIG_PLAT_S3C64XX)    :=3D s3c64xx s3c samsung
> >  plat-$(CONFIG_PLAT_S5PC1XX)    :=3D s5pc1xx s3c samsung
> > +plat-$(CONFIG_PLAT_S5P)                :=3D s5p samsung s3c
>=20
> ^^^^^^^^^^^^^^^^^
> Nitpicking :)   Why not play along?        :=3D s5p s3c samsung
Hmm...Soon plat-s5p may not need the codes of plat-s3c. So, I expressed=
 so.


> >  plat-$(CONFIG_ARCH_STMP3XXX)   :=3D stmp3xxx
> >
> >  ifeq ($(CONFIG_ARCH_EBSA110),y)
> > diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/=
Kconfig
> > new file mode 100644
> > index 0000000..421546b
> > --- /dev/null
> > +++ b/arch/arm/mach-s5p6440/Kconfig
> > @@ -0,0 +1,21 @@
> > +# arch/arm/mach-s5p6440/Kconfig
> > +#
> > +# Copyright (c) 2009 Samsung Electronics
> > +#              http://www.samsung.com/
> > +#
> > +# Licensed under GPLv2
> > +
> > +# Configuration options for the S5P6440 CPU
> > +
> > +config CPU_S5P6440
> > +       bool
> > +       select CPU_S5P6440_INIT
> > +       select CPU_S5P6440_CLOCK
> > +       help
> > +         Enable S5P6440 CPU support
> > +
> > +config MACH_SMDK6440
> > +       bool "SMDK6440"
> > +       select CPU_S5P6440
> > +       help
> > +         Machine support for the Samsung SMDK6440
> > diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440=
/Makefile
> > new file mode 100644
> > index 0000000..272e2b2
> > --- /dev/null
> > +++ b/arch/arm/mach-s5p6440/Makefile
> > @@ -0,0 +1,19 @@
> > +# arch/arm/mach-s5p6440/Makefile
> > +#
> > +# Copyright (c) 2009 Samsung Electronics
> > +#              http://www.samsung.com/
> > +#
> > +# Licensed under GPLv2
> > +
> > +obj-y                          :=3D
> > +obj-m                          :=3D
> > +obj-n                          :=3D
> > +obj-                           :=3D
> > +
> > +# Core support for S5P6440 system
> > +
> > +obj-$(CONFIG_CPU_S5P6440)      +=3D cpu.o
> > +
> > +# machine support
> > +
> > +obj-$(CONFIG_MACH_SMDK6440)    +=3D mach-smdk6440.o
> Shouldn't machine support come separate?
I'm sorry that because of relativity between patch files, I couldn't se=
parate patch files so.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.

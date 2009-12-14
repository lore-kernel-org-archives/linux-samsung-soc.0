From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] ARM: S5P6440: Kconfigs and Makefiles
Date: Mon, 14 Dec 2009 20:28:28 +0900
Message-ID: <000f01ca7cb0$8ef6fcc0$ace4f640$%kim@samsung.com>
References: <1260525158-4106-1-git-send-email-kgene.kim@samsung.com>
 <1b68c6790912122054me5686e8h1e7d25749613e5b3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45884 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756873AbZLNL0k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 06:26:40 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUN00HOU3SE15@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:26:39 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUN00ENM3SE00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:26:38 +0900 (KST)
In-reply-to: <1b68c6790912122054me5686e8h1e7d25749613e5b3@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'jassi brar' <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>

On Sun, Dec 13, 2009 at 13:55 +0900, jassi brar wrote:
> On Fri, Dec 11, 2009 at 6:52 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
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
> >  arch/arm/plat-s5p/Makefile          |   25 ++++++++++++++++++++++++
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
> >
> >  if ARCH_S3C2410
> > @@ -723,6 +731,10 @@ source "arch/arm/mach-s3c6400/Kconfig"
> >  source "arch/arm/mach-s3c6410/Kconfig"
> >  endif
> >
> > +if ARCH_S5P6440
> > +source "arch/arm/mach-s5p6440/Kconfig"
> > +endif
> > +
> Why does samsung support don't parse the Kconfig like other archs and
> have special checks "if ARCH_xxx" ? Why not include it as the
> first thing in the Kconfig just like every other mach/platform?
> 
> I think, for 6440, the check could be put inside the Kconfig and another
> patch maybe submitted to do the same for other Samsung SoCs as well.
I did follow up other Samsung's SoC code style. But as you mentioned, other mach/platform differs. Hmm... I will check which one is better or right.


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
> > @@ -151,6 +151,7 @@ machine-$(CONFIG_ARCH_S3C2410)              :=
> s3c2410 s3c2400 s3c2412 s3c2440 s3c2442 s3c24
> >  machine-$(CONFIG_ARCH_S3C24A0)         := s3c24a0
> >  machine-$(CONFIG_ARCH_S3C64XX)         := s3c6400 s3c6410
> >  machine-$(CONFIG_ARCH_S5PC1XX)         := s5pc100
> > +machine-$(CONFIG_ARCH_S5P6440)         := s5p6440
> option for 6440 shud come before c100 as per alpha-numeric sort, which is
> used for the list of machines.
Ok, I will change it.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.

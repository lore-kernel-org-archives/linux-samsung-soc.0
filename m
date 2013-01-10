From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5 v3]  S3C / S5PC100: add clockevent/clocksource support
Date: Wed, 09 Jan 2013 16:38:11 -0800
Message-ID: <00ac01cdeeca$c6e281b0$54a78510$@samsung.com>
References: <50885608.1030503@openwide.fr> <6825637.7rn5o5FT8e@flatron>
 <50EDF297.4020908@openwide.fr> <10694299.cZC5vmGaMJ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52013 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932224Ab3AJAia (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 19:38:30 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGD002ZIWEKYD20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 09:38:25 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGD00MOWWFY69B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 09:38:25 +0900 (KST)
In-reply-to: <10694299.cZC5vmGaMJ@flatron>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Romain Naour' <romain.naour@openwide.fr>
Cc: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Tomasz Figa wrote:
> 
> Hi Romain, Kukjin,
> 
> On Wednesday 09 of January 2013 23:43:35 Romain Naour wrote:
> > This series of patches converts the s3c and s5pc100 timer driver to the
> > clocksource/clockevent API. I made some test on a mini2440 board and I
> > had to reduce timers frequency to 1MHz in order to produce a timer's
> > overflow every 64ms. Initial timer's frequency (8,45MHz) provide only
> > 7ms between each overflow. It is not enough. As timers were previously
> > used to produce an IRQ at 200Hz, some board (Osiris, Anubis board) use
> > an external 12MHz signal to clock the timers (tclk1). So, I changed
> > their configuration to select internal pclk clock instead, but I can't
> > test it.
> >
> > Since clockevent/clocksource API becomes available, we can use High
> > Resolution Timer and Tickless mode.
> >
> > Most of the work is already done in s5p-time.c (renamed samsung-time.c).
> > I added some #define for s3c24xx and s5pc100 case.
> >
> >
> > Naour Romain (5):
> >   Rename s5p-time to samsung-time
> >   Add samsung-time support for s3c24xx
> >   Add samsung-time support for s3c64xx
> >   Add samsung-time support for s5pc100
> >   Remove unused plat-samsung/time.c
> >
> >  arch/arm/Kconfig                                   |   9 +-
> >  arch/arm/mach-exynos/Kconfig                       |   2 +-
> >  arch/arm/mach-exynos/mach-universal_c210.c         |   6 +-
> >  arch/arm/mach-s3c24xx/Kconfig                      |   6 +
> >  arch/arm/mach-s3c24xx/mach-amlm5900.c              |   5 +-
> >  arch/arm/mach-s3c24xx/mach-anubis.c                |   4 +-
> >  arch/arm/mach-s3c24xx/mach-at2440evb.c             |   4 +-
> >  arch/arm/mach-s3c24xx/mach-bast.c                  |   4 +-
> >  arch/arm/mach-s3c24xx/mach-gta02.c                 |   4 +-
> >  arch/arm/mach-s3c24xx/mach-h1940.c                 |   5 +-
> >  arch/arm/mach-s3c24xx/mach-jive.c                  |   4 +-
> >  arch/arm/mach-s3c24xx/mach-mini2440.c              |   4 +-
> >  arch/arm/mach-s3c24xx/mach-n30.c                   |   6 +-
> >  arch/arm/mach-s3c24xx/mach-nexcoder.c              |   4 +-
> >  arch/arm/mach-s3c24xx/mach-osiris.c                |   4 +-
> >  arch/arm/mach-s3c24xx/mach-otom.c                  |   4 +-
> >  arch/arm/mach-s3c24xx/mach-qt2410.c                |   4 +-
> >  arch/arm/mach-s3c24xx/mach-rx1950.c                |   4 +-
> >  arch/arm/mach-s3c24xx/mach-rx3715.c                |   4 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2410.c              |   4 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2413.c              |   8 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2416.c              |   4 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2440.c              |   4 +-
> >  arch/arm/mach-s3c24xx/mach-smdk2443.c              |   4 +-
> >  arch/arm/mach-s3c24xx/mach-tct_hammer.c            |   4 +-
> >  arch/arm/mach-s3c24xx/mach-vr1000.c                |   4 +-
> >  arch/arm/mach-s3c24xx/mach-vstms.c                 |   5 +-
> >  arch/arm/mach-s3c64xx/Kconfig                      |   2 +
> >  arch/arm/mach-s3c64xx/mach-anw6410.c               |   4 +-
> >  arch/arm/mach-s3c64xx/mach-crag6410.c              |   4 +-
> >  arch/arm/mach-s3c64xx/mach-hmt.c                   |   4 +-
> >  arch/arm/mach-s3c64xx/mach-mini6410.c              |   4 +-
> >  arch/arm/mach-s3c64xx/mach-ncp.c                   |   4 +-
> >  arch/arm/mach-s3c64xx/mach-real6410.c              |   4 +-
> >  arch/arm/mach-s3c64xx/mach-smartq.c                |   2 +
> >  arch/arm/mach-s3c64xx/mach-smartq5.c               |   3 +-
> >  arch/arm/mach-s3c64xx/mach-smartq7.c               |   3 +-
> >  arch/arm/mach-s3c64xx/mach-smdk6400.c              |   4 +-
> >  arch/arm/mach-s3c64xx/mach-smdk6410.c              |   4 +-
> >  arch/arm/mach-s5p64x0/Kconfig                      |   4 +-
> >  arch/arm/mach-s5p64x0/mach-smdk6440.c              |   6 +-
> >  arch/arm/mach-s5p64x0/mach-smdk6450.c              |   6 +-
> >  arch/arm/mach-s5pc100/Kconfig                      |   1 +
> >  arch/arm/mach-s5pc100/mach-smdkc100.c              |   4 +-
> >  arch/arm/mach-s5pv210/Kconfig                      |   2 +-
> >  arch/arm/mach-s5pv210/mach-aquila.c                |   6 +-
> >  arch/arm/mach-s5pv210/mach-goni.c                  |   6 +-
> >  arch/arm/mach-s5pv210/mach-smdkc110.c              |   6 +-
> >  arch/arm/mach-s5pv210/mach-smdkv210.c              |   6 +-
> >  arch/arm/mach-s5pv210/mach-torbreck.c              |   6 +-
> >  arch/arm/plat-samsung/Kconfig                      |   2 +-
> >  arch/arm/plat-samsung/Makefile                     |   3 +-
> >  arch/arm/plat-samsung/include/plat/cpu.h           |   5 -
> >  arch/arm/plat-samsung/include/plat/s5p-time.h      |  40 ---
> >  arch/arm/plat-samsung/include/plat/samsung-time.h  |  51 ++++
> >  .../plat-samsung/{s5p-time.c => samsung-time.c}    | 144 +++++------
> >  arch/arm/plat-samsung/time.c                       | 285
> > --------------------- 57 files changed, 274 insertions(+), 475
> > deletions(-)
> >  delete mode 100644 arch/arm/plat-samsung/include/plat/s5p-time.h
> >  create mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
> >  rename arch/arm/plat-samsung/{s5p-time.c => samsung-time.c} (68%)
> >  delete mode 100644 arch/arm/plat-samsung/time.c
> 
> The whole series looks good to me.
> 
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
> Also I tested it on a Tiny6410 (Mini6410-compatible) board.
> 
> Tested-by: Tomasz Figa <tomasz.figa@gmail.com>
> 
Looks good to me, Romain thanks.
BTW, which one is right "Naour Romain" or "Romain Naour"?
I'm looking at your name both "From: Romain Naour..." and "Signed-off-by:
Naour Romain...".

Tomasz, thanks for your review and test on s3c64xx board.

Heiko, can you test this on your s3c24xx board?

- Kukjin

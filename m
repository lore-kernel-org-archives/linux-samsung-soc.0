From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCHv2 0/4] Updated s5p-tv platform definitions
Date: Thu, 21 Jul 2011 12:23:30 +0200
Message-ID: <001001cc4790$3d3c3380$b7b49a80$%szyprowski@samsung.com>
References: <1311235722-29893-1-git-send-email-m.szyprowski@samsung.com>
 <001001cc478b$cb3bc560$61b35020$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59236 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408Ab1GUKY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 06:24:27 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOO00M9PI8Q8J@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 11:24:26 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOO001Z3I8O8J@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 11:24:25 +0100 (BST)
In-reply-to: <001001cc478b$cb3bc560$61b35020$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hello,

On Thursday, July 21, 2011 11:52 AM Kukjin Kim wrote:

> > This patch series contains platform definitions for s5p-tv driver
> > rebased onto latest for-next branch (including generic GIC and clockdev
> > changes).
> >
> > Changes since v1:
> > - renamed i2c8 to common i2c-hdmiphy
> > - moved common vpll code to plat-s5p/clocks.c
> > - added check for pll locking
> > - various minor coding style fixes here and there
> >
> > Best regards
> > --
> > Marek Szyprowski
> > Samsung Poland R&D Center
> >
> >
> > Patch summary:
> >
> > Tomasz Stanislawski (4):
> >   ARM: Samsung: add i2c hdmiphy controller definitions
> >   ARM: S5P: add support for tv device
> >   ARM: Exynos4: enable TV support on Universal_C210 board
> >   ARM: S5PV210: enable TV support on GONI board
> >
> >  arch/arm/mach-exynos4/Kconfig                    |    2 +
> >  arch/arm/mach-exynos4/clock.c                    |  140
> > +++++++++++++++++++++-
> >  arch/arm/mach-exynos4/cpu.c                      |    4 +
> >  arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h |   16 +++
> >  arch/arm/mach-exynos4/include/mach/irqs.h        |    4 +
> >  arch/arm/mach-exynos4/include/mach/map.h         |   12 ++
> >  arch/arm/mach-exynos4/include/mach/regs-pmu.h    |    6 +
> >  arch/arm/mach-exynos4/mach-universal_c210.c      |   74 ++++++++++++
> >  arch/arm/mach-s5pv210/Kconfig                    |    1 +
> >  arch/arm/mach-s5pv210/clock.c                    |   87 ++++++++++++--
> >  arch/arm/mach-s5pv210/cpu.c                      |    4 +
> >  arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h |   16 +++
> >  arch/arm/mach-s5pv210/include/mach/irqs.h        |    4 +-
> >  arch/arm/mach-s5pv210/include/mach/map.h         |   13 ++
> >  arch/arm/mach-s5pv210/include/mach/regs-clock.h  |    9 +-
> >  arch/arm/mach-s5pv210/mach-goni.c                |    9 ++
> >  arch/arm/plat-s5p/Kconfig                        |   10 ++
> >  arch/arm/plat-s5p/Makefile                       |    2 +
> >  arch/arm/plat-s5p/clock.c                        |   73 +++++++++++
> >  arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 +++++++++
> >  arch/arm/plat-s5p/dev-tv.c                       |  100 +++++++++++++++
> >  arch/arm/plat-s5p/include/plat/s5p-clock.h       |    4 +
> >  arch/arm/plat-samsung/include/plat/devs.h        |    6 +
> >  arch/arm/plat-samsung/include/plat/iic.h         |    1 +
> >  arch/arm/plat-samsung/include/plat/tv-core.h     |   44 +++++++
> >  25 files changed, 684 insertions(+), 16 deletions(-)
> >  create mode 100644 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
> >  create mode 100644 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
> >  create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
> >  create mode 100644 arch/arm/plat-s5p/dev-tv.c
> >  create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h
> >
> > --
> > 1.7.1.569.g6f426
> 
> Hi Marek,
> 
> Looks good but happens following build failure with
> s5pc100_defconfig/s5p64x0_defconfig.
> Because they have no VPLL :(
> 
> arch/arm/kernel/return_address.c:62: warning: #warning "TODO: return_address
> should use unwind tables"
> arch/arm/plat-s5p/clock.c: In function 's5p_vpll_set_rate':
> arch/arm/plat-s5p/clock.c:237: error: 'S5P_VPLL_CON0' undeclared (first use
> in this function)
> arch/arm/plat-s5p/clock.c:237: error: (Each undeclared identifier is
> reported only once
> arch/arm/plat-s5p/clock.c:237: error: for each function it appears in.)
> arch/arm/plat-s5p/clock.c:243: error: 'S5P_VPLL_CON1' undeclared (first use
> in this function)
> arch/arm/plat-s5p/clock.c:272: error: 'S5P_VPLLCON0_LOCKED_SHIFT' undeclared
> (first use in this function)
> make[1]: *** [arch/arm/plat-s5p/clock.o] Error 1

Huh... Right, I forgot about other platforms. What do you think about making 
this vpll code compiled conditionally only for EXYNOS4 and S5PV210? The other
solution is to move it into a separate file.

> First of all, I will send 'pull request' without this series...
> 
> I'm not sure can have a chance to send 'pull request' again for this merge
> window.

Ok, I understand.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center

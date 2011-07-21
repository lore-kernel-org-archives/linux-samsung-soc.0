From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 0/4] Updated s5p-tv platform definitions
Date: Thu, 21 Jul 2011 18:51:34 +0900
Message-ID: <001001cc478b$cb3bc560$61b35020$%kim@samsung.com>
References: <1311235722-29893-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16392 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab1GUJvn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 05:51:43 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOO009XBGPV6WR0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 18:51:42 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOO006RBGQ6PG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 18:51:42 +0900 (KST)
In-reply-to: <1311235722-29893-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Tomasz Stanislawski' <t.stanislaws@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi,

> This patch series contains platform definitions for s5p-tv driver
> rebased onto latest for-next branch (including generic GIC and clockdev
> changes).
> 
> Changes since v1:
> - renamed i2c8 to common i2c-hdmiphy
> - moved common vpll code to plat-s5p/clocks.c
> - added check for pll locking
> - various minor coding style fixes here and there
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
> Patch summary:
> 
> Tomasz Stanislawski (4):
>   ARM: Samsung: add i2c hdmiphy controller definitions
>   ARM: S5P: add support for tv device
>   ARM: Exynos4: enable TV support on Universal_C210 board
>   ARM: S5PV210: enable TV support on GONI board
> 
>  arch/arm/mach-exynos4/Kconfig                    |    2 +
>  arch/arm/mach-exynos4/clock.c                    |  140
> +++++++++++++++++++++-
>  arch/arm/mach-exynos4/cpu.c                      |    4 +
>  arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h |   16 +++
>  arch/arm/mach-exynos4/include/mach/irqs.h        |    4 +
>  arch/arm/mach-exynos4/include/mach/map.h         |   12 ++
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h    |    6 +
>  arch/arm/mach-exynos4/mach-universal_c210.c      |   74 ++++++++++++
>  arch/arm/mach-s5pv210/Kconfig                    |    1 +
>  arch/arm/mach-s5pv210/clock.c                    |   87 ++++++++++++--
>  arch/arm/mach-s5pv210/cpu.c                      |    4 +
>  arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h |   16 +++
>  arch/arm/mach-s5pv210/include/mach/irqs.h        |    4 +-
>  arch/arm/mach-s5pv210/include/mach/map.h         |   13 ++
>  arch/arm/mach-s5pv210/include/mach/regs-clock.h  |    9 +-
>  arch/arm/mach-s5pv210/mach-goni.c                |    9 ++
>  arch/arm/plat-s5p/Kconfig                        |   10 ++
>  arch/arm/plat-s5p/Makefile                       |    2 +
>  arch/arm/plat-s5p/clock.c                        |   73 +++++++++++
>  arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 +++++++++
>  arch/arm/plat-s5p/dev-tv.c                       |  100 +++++++++++++++
>  arch/arm/plat-s5p/include/plat/s5p-clock.h       |    4 +
>  arch/arm/plat-samsung/include/plat/devs.h        |    6 +
>  arch/arm/plat-samsung/include/plat/iic.h         |    1 +
>  arch/arm/plat-samsung/include/plat/tv-core.h     |   44 +++++++
>  25 files changed, 684 insertions(+), 16 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
>  create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
>  create mode 100644 arch/arm/plat-s5p/dev-tv.c
>  create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h
> 
> --
> 1.7.1.569.g6f426

Hi Marek,

Looks good but happens following build failure with
s5pc100_defconfig/s5p64x0_defconfig.
Because they have no VPLL :(

arch/arm/kernel/return_address.c:62: warning: #warning "TODO: return_address
should use unwind tables"
arch/arm/plat-s5p/clock.c: In function 's5p_vpll_set_rate':
arch/arm/plat-s5p/clock.c:237: error: 'S5P_VPLL_CON0' undeclared (first use
in this function)
arch/arm/plat-s5p/clock.c:237: error: (Each undeclared identifier is
reported only once
arch/arm/plat-s5p/clock.c:237: error: for each function it appears in.)
arch/arm/plat-s5p/clock.c:243: error: 'S5P_VPLL_CON1' undeclared (first use
in this function)
arch/arm/plat-s5p/clock.c:272: error: 'S5P_VPLLCON0_LOCKED_SHIFT' undeclared
(first use in this function)
make[1]: *** [arch/arm/plat-s5p/clock.o] Error 1

First of all, I will send 'pull request' without this series...

I'm not sure can have a chance to send 'pull request' again for this merge
window.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

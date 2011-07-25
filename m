From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv3 0/4] Updated s5p-tv platform definitions
Date: Mon, 25 Jul 2011 09:55:43 +0200
Message-ID: <1311580547-9468-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60230 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392Ab1GYHzx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 03:55:53 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOV005V5Q14GQ@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 08:55:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOV00LJJQ1270@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 08:55:51 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hello,

This patch series contains platform definitions for s5p-tv driver
rebased onto latest for-next branch (including generic GIC and clockdev
changes).

Changes since v2:
- moved vpll code to plat-s5p/clock-vpll.c

Changes since v1:
- renamed i2c8 to common i2c-hdmiphy
- moved common vpll code to plat-s5p/clock.c
- added check for pll locking
- various minor coding style fixes here and there

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center


Patch summary:

Tomasz Stanislawski (4):
  ARM: Samsung: add i2c hdmiphy controller definitions
  ARM: S5P: add support for tv device
  ARM: Exynos4: enable TV support on Universal_C210 board
  ARM: S5PV210: enable TV support on GONI board

 arch/arm/mach-exynos4/Kconfig                    |    3 +
 arch/arm/mach-exynos4/clock.c                    |  140 +++++++++++++++++++++-
 arch/arm/mach-exynos4/cpu.c                      |    2 +
 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h |   16 +++
 arch/arm/mach-exynos4/include/mach/irqs.h        |    4 +
 arch/arm/mach-exynos4/include/mach/map.h         |   12 ++
 arch/arm/mach-exynos4/include/mach/regs-pmu.h    |    6 +
 arch/arm/mach-exynos4/mach-universal_c210.c      |   74 ++++++++++++
 arch/arm/mach-s5pv210/Kconfig                    |    2 +
 arch/arm/mach-s5pv210/clock.c                    |   87 ++++++++++++--
 arch/arm/mach-s5pv210/cpu.c                      |    4 +
 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h |   16 +++
 arch/arm/mach-s5pv210/include/mach/irqs.h        |    4 +-
 arch/arm/mach-s5pv210/include/mach/map.h         |   13 ++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h  |    9 +-
 arch/arm/mach-s5pv210/mach-goni.c                |    9 ++
 arch/arm/plat-s5p/Kconfig                        |   15 +++
 arch/arm/plat-s5p/Makefile                       |    3 +
 arch/arm/plat-s5p/clock-vpll.c                   |   93 ++++++++++++++
 arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 +++++++++
 arch/arm/plat-s5p/dev-tv.c                       |  100 +++++++++++++++
 arch/arm/plat-s5p/include/plat/s5p-clock.h       |    4 +
 arch/arm/plat-samsung/include/plat/devs.h        |    6 +
 arch/arm/plat-samsung/include/plat/iic.h         |    1 +
 arch/arm/plat-samsung/include/plat/tv-core.h     |   44 +++++++
 25 files changed, 710 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
 create mode 100644 arch/arm/plat-s5p/clock-vpll.c
 create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
 create mode 100644 arch/arm/plat-s5p/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

-- 
1.7.1.569.g6f426

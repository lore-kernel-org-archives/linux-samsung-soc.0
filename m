From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH v4 0/4] Updated s5p-tv platform definitions
Date: Fri, 12 Aug 2011 11:45:38 +0200
Message-ID: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:26838 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709Ab1HLJpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 05:45:50 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LPT000JB74C5T40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 10:45:48 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPT00CYE74BPW@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 10:45:47 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Hello,

This patch series contains platform definitions for s5p-tv driver
rebased onto latest for-next branch (including generic GIC and clockdev
changes).

Changes since v3:
- vpll code was fixed and moved back to mach-dependant code
- changed naming from IIC to I2C

Changes since v2:
- moved vpll code to plat-s5p/clock-vpll.c

Changes since v1:
- renamed i2c8 to common i2c-hdmiphy
- moved common vpll code to plat-s5p/clock.c
- added check for pll locking
- various minor coding style fixes here and there

Best regards

Tomasz Stanislawski (4):
  ARM: Samsung: add i2c hdmiphy controller definitions
  ARM: S5P: add support for tv device
  ARM: Exynos4: enable TV support on Universal_C210 board
  ARM: S5PV210: enable TV support on GONI board

 arch/arm/mach-exynos4/Kconfig                    |    2 +
 arch/arm/mach-exynos4/clock.c                    |  200 +++++++++++++++++++++-
 arch/arm/mach-exynos4/cpu.c                      |    2 +
 arch/arm/mach-exynos4/include/mach/i2c-hdmiphy.h |   16 ++
 arch/arm/mach-exynos4/include/mach/irqs.h        |    4 +
 arch/arm/mach-exynos4/include/mach/map.h         |   12 ++
 arch/arm/mach-exynos4/include/mach/regs-pmu.h    |    6 +
 arch/arm/mach-exynos4/mach-universal_c210.c      |   74 ++++++++
 arch/arm/mach-s5pv210/Kconfig                    |    1 +
 arch/arm/mach-s5pv210/clock.c                    |  137 ++++++++++++++--
 arch/arm/mach-s5pv210/cpu.c                      |    4 +
 arch/arm/mach-s5pv210/include/mach/i2c-hdmiphy.h |   16 ++
 arch/arm/mach-s5pv210/include/mach/irqs.h        |    4 +-
 arch/arm/mach-s5pv210/include/mach/map.h         |   13 ++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h  |    3 +-
 arch/arm/mach-s5pv210/mach-goni.c                |    9 +
 arch/arm/plat-s5p/Kconfig                        |   10 +
 arch/arm/plat-s5p/Makefile                       |    2 +
 arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 +++++++
 arch/arm/plat-s5p/dev-tv.c                       |   98 +++++++++++
 arch/arm/plat-s5p/include/plat/pll.h             |   14 ++-
 arch/arm/plat-samsung/include/plat/devs.h        |    6 +
 arch/arm/plat-samsung/include/plat/iic.h         |    1 +
 arch/arm/plat-samsung/include/plat/tv-core.h     |   44 +++++
 24 files changed, 720 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/i2c-hdmiphy.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/i2c-hdmiphy.h
 create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
 create mode 100644 arch/arm/plat-s5p/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

-- 
1.7.6

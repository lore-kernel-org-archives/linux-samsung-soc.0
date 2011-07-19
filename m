From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/8] Updated s5p-tv platform definitions
Date: Tue, 19 Jul 2011 10:44:19 +0200
Message-ID: <1311065067-20324-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27914 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391Ab1GSIoe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 04:44:34 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOK00I6WOA8HA20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:32 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOK00G6DOA73S@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jul 2011 09:44:31 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>

Hello,

This patch series contains platform definitions for s5p-tv driver
rebased onto latest for-next branch (including generic GIC and clockdev
changes).

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center


Patch summary:

Tomasz Stanislawski (8):
  ARM: Samsung: add i2c8 controller definitions
  ARM: Exynos4: add support for i2c8 controller (for HDMIPHY)
  ARM: S5PV210: add support for i2c3 controller (for HDMIPHY)
  ARM: S5P: add support for tv device
  ARM: Exynos4: add support for TV device
  ARM: Exynos4: enable TV support on Universal_C210 board
  ARM: S5PV210: add support for TV device
  ARM: S5PV210: enable TV support on GONI board

 arch/arm/mach-exynos4/Kconfig                   |    2 +
 arch/arm/mach-exynos4/clock.c                   |  211 +++++++++++++++++++++++
 arch/arm/mach-exynos4/cpu.c                     |    6 +
 arch/arm/mach-exynos4/include/mach/irqs.h       |    5 +
 arch/arm/mach-exynos4/include/mach/map.h        |   27 +++
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    1 +
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    6 +
 arch/arm/mach-exynos4/mach-universal_c210.c     |   76 ++++++++
 arch/arm/mach-s5pv210/Kconfig                   |    8 +
 arch/arm/mach-s5pv210/Makefile                  |    1 +
 arch/arm/mach-s5pv210/clock.c                   |  162 ++++++++++++++++--
 arch/arm/mach-s5pv210/cpu.c                     |    5 +
 arch/arm/mach-s5pv210/include/mach/irqs.h       |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h        |   18 ++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    7 +-
 arch/arm/mach-s5pv210/mach-goni.c               |    9 +
 arch/arm/mach-s5pv210/setup-i2c3.c              |   26 +++
 arch/arm/plat-s5p/Kconfig                       |    5 +
 arch/arm/plat-s5p/Makefile                      |    1 +
 arch/arm/plat-s5p/dev-tv.c                      |  100 +++++++++++
 arch/arm/plat-samsung/Kconfig                   |    5 +
 arch/arm/plat-samsung/Makefile                  |    1 +
 arch/arm/plat-samsung/dev-i2c8.c                |   58 ++++++
 arch/arm/plat-samsung/include/plat/devs.h       |    6 +
 arch/arm/plat-samsung/include/plat/iic-core.h   |   14 ++
 arch/arm/plat-samsung/include/plat/iic.h        |    1 +
 arch/arm/plat-samsung/include/plat/tv-core.h    |   44 +++++
 27 files changed, 793 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-i2c3.c
 create mode 100644 arch/arm/plat-s5p/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c8.c
 create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

-- 
1.7.1.569.g6f426

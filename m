From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH v4 0/9] TV driver for Samsung S5P platform (platform-part)
Date: Wed, 25 May 2011 14:29:15 +0200
Message-ID: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9212 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756919Ab1EYMa1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 08:30:27 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LLR0064M415UK@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:29 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLR008WZ413FN@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:28 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello Everyone,
This patchset introduce TV devices to Samsung S5P platform. It includes Goni
(S5PV210 machine) and Universal (Exynos4 machine) boards. The patchset is
dedicated for 2.6.39 kernel. Moreover, the patchset adds following auxiliary
entities and features:
- I2C controllers for HDMI physical interface
- power regulators
- TV clocks, include ops for fout_vpll clock
- fixes to power domain driver (only for Exynos4)
- dependecies between TV and Power Domain devices (only for Exynos4)

Please refer to post 'TV driver for Samsung S5P platform (media part)' for
sources of the TV driver.

The most recent changes:
- TV becomes S5P platform device
- support for Universal-c210 and Goni boards
- code cleanup after Kukjin Kim's review

Tomasz Stanislawski (9):
  arm: exynos4: pd: fixes block gating and code cleanup
  i2c-s3c2410: fix I2C dedicated for hdmiphy
  arm: exynos4: i2c: add controller 8 (HDMIPHY)
  arm: s5pv210: i2c: add controller 3 (HDMIPHY)
  arm: plat-s5p: add TV support
  arm: exynos4: add TV support
  arm: exynos4: universal_c210: add TV support
  arm: s5pv210: add TV support
  arm: s5pv210: goni: add TV support

 arch/arm/mach-exynos4/Kconfig                   |    3 +
 arch/arm/mach-exynos4/clock.c                   |  223 ++++++++++++++++++++++-
 arch/arm/mach-exynos4/cpu.c                     |    7 +
 arch/arm/mach-exynos4/dev-pd.c                  |   93 +++++++---
 arch/arm/mach-exynos4/include/mach/irqs.h       |    8 +
 arch/arm/mach-exynos4/include/mach/map.h        |   27 +++
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    8 +
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    6 +
 arch/arm/mach-exynos4/mach-universal_c210.c     |   80 ++++++++
 arch/arm/mach-s5pv210/Kconfig                   |    8 +
 arch/arm/mach-s5pv210/Makefile                  |    1 +
 arch/arm/mach-s5pv210/clock.c                   |  169 ++++++++++++++++--
 arch/arm/mach-s5pv210/cpu.c                     |    6 +
 arch/arm/mach-s5pv210/include/mach/irqs.h       |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h        |   19 ++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    7 +-
 arch/arm/mach-s5pv210/mach-goni.c               |    9 +
 arch/arm/mach-s5pv210/setup-i2c3.c              |   27 +++
 arch/arm/plat-s5p/Kconfig                       |    5 +
 arch/arm/plat-s5p/Makefile                      |    1 +
 arch/arm/plat-s5p/dev-tv.c                      |  100 ++++++++++
 arch/arm/plat-samsung/Kconfig                   |    5 +
 arch/arm/plat-samsung/Makefile                  |    1 +
 arch/arm/plat-samsung/dev-i2c8.c                |   68 +++++++
 arch/arm/plat-samsung/include/plat/devs.h       |    6 +
 arch/arm/plat-samsung/include/plat/iic-core.h   |   14 ++
 arch/arm/plat-samsung/include/plat/iic.h        |    1 +
 arch/arm/plat-samsung/include/plat/pd.h         |    1 +
 arch/arm/plat-samsung/include/plat/tv-core.h    |   45 +++++
 drivers/i2c/busses/i2c-s3c2410.c                |   36 ++++-
 30 files changed, 947 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-i2c3.c
 create mode 100644 arch/arm/plat-s5p/dev-tv.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c8.c
 create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

-- 
1.7.5.1

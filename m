From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [RFC][PATCH v2 0/7] Add clkdev support for Samsung platforms
Date: Fri, 27 May 2011 20:56:29 +0530
Message-ID: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11659 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380Ab1E0PTU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 11:19:20 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLV00AJ9180Y240@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:18 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLV00IAA17ZX8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 May 2011 00:19:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch series adds clkdev support for all Samsung platforms. clkdev
support is a prerequisite for adding device tree and common clock
features on Samsung platforms.

Changes since v1:

1. Removed the clock id field from clock instances.
2. Fixed incorrect naming of guards in mach/clkdev.h files.

Thomas Abraham (7):
  ARM: SAMSUNG: Add clkdev infrastructure
  ARM: S3C24XX: Add clkdev support
  ARM: S3C64XX: Add clkdev support
  ARM: S5P64X0: Add clkdev support
  ARM: S5PC100: Add clkdev support
  ARM: S5PV210: Add clkdev support
  ARM: Exynos4: Add clkdev support

 arch/arm/Kconfig                            |    6 +
 arch/arm/mach-exynos4/clock.c               |  178 +++++++++------------------
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +
 arch/arm/mach-exynos4/time.c                |    2 +
 arch/arm/mach-s3c2412/clock.c               |   36 +-----
 arch/arm/mach-s3c2416/clock.c               |   10 +-
 arch/arm/mach-s3c2440/clock.c               |    3 -
 arch/arm/mach-s3c2443/clock.c               |   16 +--
 arch/arm/mach-s3c64xx/clock.c               |   86 ++++---------
 arch/arm/mach-s3c64xx/include/mach/clkdev.h |    7 +
 arch/arm/mach-s5p64x0/clock-s5p6440.c       |   74 +++--------
 arch/arm/mach-s5p64x0/clock-s5p6450.c       |   68 +++--------
 arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 +
 arch/arm/mach-s5pc100/clock.c               |  163 ++++++------------------
 arch/arm/mach-s5pc100/include/mach/clkdev.h |    7 +
 arch/arm/mach-s5pv210/clock.c               |  130 ++++++--------------
 arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 +
 arch/arm/plat-s3c24xx/clock-dclk.c          |    4 -
 arch/arm/plat-s3c24xx/include/mach/clkdev.h |    7 +
 arch/arm/plat-s3c24xx/s3c2410-clock.c       |   21 +---
 arch/arm/plat-s3c24xx/s3c2443-clock.c       |   39 +-----
 arch/arm/plat-s5p/s5p-time.c                |    9 ++
 arch/arm/plat-samsung/clock.c               |   98 +--------------
 arch/arm/plat-samsung/include/plat/clock.h  |    3 +
 arch/arm/plat-samsung/pwm-clock.c           |   10 ++
 arch/arm/plat-samsung/time.c                |    2 +
 26 files changed, 300 insertions(+), 700 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
 create mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h

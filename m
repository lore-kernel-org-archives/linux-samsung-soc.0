From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [RFC][PATCH 0/7] ARM: Add clkdev support for Samsung's platforms
Date: Fri, 20 May 2011 02:48:19 +0530
Message-ID: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12916 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932606Ab1ESVLV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:21 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00BKZO6OS4F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:20 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:20 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Thomas Abraham (7):
  ARM: SAMSUNG: Add clkdev infrastructure
  ARM: S3C24XX: Add clkdev support
  ARM: S3C64XX: Add clkdev support
  ARM: S5P64X0: Add clkdev support
  ARM: S5PC100: Add clkdev support
  ARM: S5PV210: Add clkdev support
  ARM: Exynos4: Add clkdev support

 arch/arm/Kconfig                            |    6 ++
 arch/arm/mach-exynos4/clock.c               |   63 +++++++++++++++++++-
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 ++
 arch/arm/mach-exynos4/time.c                |    2 +
 arch/arm/mach-s3c2412/clock.c               |    3 +
 arch/arm/mach-s3c2416/clock.c               |    5 ++
 arch/arm/mach-s3c2443/clock.c               |    4 +
 arch/arm/mach-s3c64xx/clock.c               |   25 ++++++++
 arch/arm/mach-s3c64xx/include/mach/clkdev.h |    7 ++
 arch/arm/mach-s5p64x0/clock-s5p6440.c       |   20 +++++++
 arch/arm/mach-s5p64x0/clock-s5p6450.c       |   19 ++++++
 arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 ++
 arch/arm/mach-s5pc100/clock.c               |   42 +++++++++++++-
 arch/arm/mach-s5pc100/include/mach/clkdev.h |    7 ++
 arch/arm/mach-s5pv210/clock.c               |   42 +++++++++++++-
 arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 ++
 arch/arm/plat-s3c24xx/include/mach/clkdev.h |    7 ++
 arch/arm/plat-s3c24xx/s3c2410-clock.c       |    3 +
 arch/arm/plat-s3c24xx/s3c2443-clock.c       |    4 +
 arch/arm/plat-s5p/s5p-time.c                |    9 +++
 arch/arm/plat-samsung/clock.c               |   83 ++-------------------------
 arch/arm/plat-samsung/include/plat/clock.h  |    3 +
 arch/arm/plat-samsung/pwm-clock.c           |   10 +++
 arch/arm/plat-samsung/time.c                |    2 +
 24 files changed, 303 insertions(+), 84 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
 create mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h

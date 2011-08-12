From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 0/5] S5P64X0 PM Support
Date: Fri, 12 Aug 2011 15:56:22 +0530
Message-ID: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42193 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273Ab1HLKZc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:25:32 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT00DB48YJOVR0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:31 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00ESK8YEI1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:31 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

The patchset adds Power Mangement support for S5P64X0. The first
four patches lay the groundwork for adding PM support, while the
final patch adds the SoC specific PM code.
Tested using external interrupts as wake-up sources on SMDK6440
and SMDK6450.

Abhilash Kesavan (5):
  ARM: S5P: Make the common S5P PM code conditionally compile
  ARM: SAMSUNG: Make the sleep code common for S3C64XX and newer SoCs
  ARM: S5P64X0: Add pm save/restore functions for GPIO banks
  ARM: S5P64X0: Fix incorrect serial clock name
  ARM: S5P64X0: Add Power Management support

 arch/arm/Kconfig                                |    2 +-
 arch/arm/mach-exynos4/Kconfig                   |    2 +
 arch/arm/mach-exynos4/Makefile                  |    2 +-
 arch/arm/mach-exynos4/sleep.S                   |   54 ------
 arch/arm/mach-s3c64xx/Kconfig                   |    1 +
 arch/arm/mach-s3c64xx/Makefile                  |    1 -
 arch/arm/mach-s3c64xx/sleep.S                   |   72 --------
 arch/arm/mach-s5p64x0/Kconfig                   |    4 +
 arch/arm/mach-s5p64x0/Makefile                  |    1 +
 arch/arm/mach-s5p64x0/clock-s5p6440.c           |    2 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c           |    2 +-
 arch/arm/mach-s5p64x0/gpiolib.c                 |    1 +
 arch/arm/mach-s5p64x0/include/mach/map.h        |    1 +
 arch/arm/mach-s5p64x0/include/mach/pm-core.h    |  117 +++++++++++++
 arch/arm/mach-s5p64x0/include/mach/regs-clock.h |   33 ++++
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h  |   19 ++
 arch/arm/mach-s5p64x0/init.c                    |    2 +-
 arch/arm/mach-s5p64x0/irq-eint.c                |    2 +
 arch/arm/mach-s5p64x0/irq-pm.c                  |   92 ++++++++++
 arch/arm/mach-s5p64x0/pm.c                      |  204 +++++++++++++++++++++++
 arch/arm/mach-s5pv210/Kconfig                   |    2 +
 arch/arm/mach-s5pv210/Makefile                  |    2 +-
 arch/arm/mach-s5pv210/sleep.S                   |   52 ------
 arch/arm/plat-s5p/Kconfig                       |    6 +
 arch/arm/plat-s5p/Makefile                      |    3 +-
 arch/arm/plat-samsung/Kconfig                   |    7 +
 arch/arm/plat-samsung/Makefile                  |    1 +
 arch/arm/plat-samsung/sleep.S                   |   80 +++++++++
 drivers/gpio/gpio-plat-samsung.c                |    4 +-
 29 files changed, 583 insertions(+), 188 deletions(-)
 delete mode 100644 arch/arm/mach-exynos4/sleep.S
 delete mode 100644 arch/arm/mach-s3c64xx/sleep.S
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/pm-core.h
 create mode 100644 arch/arm/mach-s5p64x0/irq-pm.c
 create mode 100644 arch/arm/mach-s5p64x0/pm.c
 delete mode 100644 arch/arm/mach-s5pv210/sleep.S
 create mode 100644 arch/arm/plat-samsung/sleep.S

--
1.7.4.1

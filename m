From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH V2 0/3] S5P64X0 PM Support
Date: Tue, 27 Sep 2011 16:22:41 -0400
Message-ID: <1317154964-22600-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20887 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752878Ab1I0KdM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Sep 2011 06:33:12 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS6005U0FYSLSM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 19:33:11 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS60049OFZ1NM00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 19:33:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

The patchset adds Power Mangement support for S5P64X0. The first
two patches lay the groundwork for adding PM support, while the
final patch adds the SoC specific PM code.

Changes since V1:
- Changed register naming as per User Manual.
- Dropped the pm-gpio warning patch as it will be taken care in the gpio
  movement patch by Kukjin Kim.
- Used soc_is_* for differentiating between 6440 and 6450.
- Merged all the sleep files of S5P SoCs while leaving the S3C64XX sleep
  code as is.

Abhilash Kesavan (3):
  ARM: S5P: Make the common S5P PM code conditionally compile
  ARM: S5P: Make the sleep code common for S5P series SoCs
  ARM: S5P64X0: Add Power Management support

 arch/arm/Kconfig                                |    2 +-
 arch/arm/mach-exynos4/Kconfig                   |    4 +
 arch/arm/mach-exynos4/Makefile                  |    2 +-
 arch/arm/mach-s5p64x0/Kconfig                   |    4 +
 arch/arm/mach-s5p64x0/Makefile                  |    1 +
 arch/arm/mach-s5p64x0/include/mach/map.h        |    1 +
 arch/arm/mach-s5p64x0/include/mach/pm-core.h    |  117 +++++++++++++
 arch/arm/mach-s5p64x0/include/mach/regs-clock.h |   33 ++++
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h  |   19 ++
 arch/arm/mach-s5p64x0/irq-eint.c                |    2 +
 arch/arm/mach-s5p64x0/irq-pm.c                  |   92 ++++++++++
 arch/arm/mach-s5p64x0/pm.c                      |  204 +++++++++++++++++++++++
 arch/arm/mach-s5pv210/Kconfig                   |    2 +
 arch/arm/mach-s5pv210/Makefile                  |    2 +-
 arch/arm/mach-s5pv210/sleep.S                   |   52 ------
 arch/arm/plat-s5p/Kconfig                       |   12 ++
 arch/arm/plat-s5p/Makefile                      |    4 +-
 arch/arm/{mach-exynos4 => plat-s5p}/sleep.S     |   13 +-
 18 files changed, 500 insertions(+), 66 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/pm-core.h
 create mode 100644 arch/arm/mach-s5p64x0/irq-pm.c
 create mode 100644 arch/arm/mach-s5p64x0/pm.c
 delete mode 100644 arch/arm/mach-s5pv210/sleep.S
 rename arch/arm/{mach-exynos4 => plat-s5p}/sleep.S (81%)

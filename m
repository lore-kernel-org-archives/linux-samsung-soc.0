From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 0/5] ARM: SAMSUNG: Add clkdev support for Samsung platforms
Date: Thu, 14 Apr 2011 14:53:38 +0530
Message-ID: <1302773023-26524-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37480 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756942Ab1DNJTf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2011 05:19:35 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJM0029GXWMOF30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 18:19:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJM00GH3XWGFX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 18:19:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch series adds clkdev support for Samsung platforms and specifically
enables clkdev support for Samsung's Exynos4 platforms. The first two
patches in this series are prerequisite patches for enabling clkdev on all
Samsung platforms. The third patch in this series is a simple fix for clock
name and id for dw_mmc controller on Exynos4 platforms.

Thomas Abraham (5):
  serial: samsung: Fix unintended usage of uart port 0 as console
  serial: s5pv210: Remove redundant console_initcall
  ARM: EXYNOS4: Fix clock name and clock id for dw_mmc controller
  ARM: SAMSUNG: Add clkdev infrastructure
  ARM: EXYNOS4: Add clkdev support

 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-exynos4/clock.c               |   63 +++++++++++++++++++++++++--
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +++
 arch/arm/mach-exynos4/time.c                |    2 +
 arch/arm/plat-samsung/clock.c               |   18 ++++++++
 arch/arm/plat-samsung/include/plat/clock.h  |    7 +++
 arch/arm/plat-samsung/pwm-clock.c           |   10 ++++
 drivers/tty/serial/s5pv210.c                |    7 ---
 drivers/tty/serial/samsung.c                |    9 ++--
 9 files changed, 108 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h

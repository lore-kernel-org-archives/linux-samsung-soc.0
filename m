From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 0/6] Prerequisite patches for device tree for Samsung's Exynos4
 platform
Date: Sat, 19 Mar 2011 13:20:13 +0530
Message-ID: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11474 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395Ab1CSHwA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Mar 2011 03:52:00 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIA002KDOIM1L60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:51:58 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIA00APIOIIEL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:51:58 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patchset is a prerequisite for device tree patches for exynos4. It
includes the following changes.

1. Adds clkdev support for exynos4.
2. Removes redundant console registration for exynos4 and s5pv210.
3. Trival bug fixes.

Thomas Abraham (6):
  ARM: EXYNOS4: Fix addruart macro
  serial: samsung: Fix unintended usage of uart port 0 as console
  serial: s5pv210: Remove redundant console_initcall
  ARM: SAMSUNG: Add clkdev support
  ARM: SAMSUNG: Add clkdev support for exynos4
  ARM: Remove clkdev.o build in arch/arm/common/Makefile

 arch/arm/common/Makefile                         |    1 -
 arch/arm/mach-exynos4/Kconfig                    |    1 +
 arch/arm/mach-exynos4/clock.c                    |   57 ++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/clkdev.h      |    7 +++
 arch/arm/mach-exynos4/include/mach/debug-macro.S |    4 +-
 arch/arm/mach-exynos4/time.c                     |    2 +
 arch/arm/plat-samsung/clock.c                    |   18 +++++++
 arch/arm/plat-samsung/include/plat/clock.h       |    5 ++
 arch/arm/plat-samsung/pwm-clock.c                |   10 ++++
 drivers/tty/serial/s5pv210.c                     |    7 ---
 drivers/tty/serial/samsung.c                     |    9 ++--
 11 files changed, 106 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h

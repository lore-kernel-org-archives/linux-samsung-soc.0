From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 0/5] Prerequisite patches to support device tree on
 Samsung's Exynos4 platform
Date: Mon, 28 Mar 2011 16:37:35 +0530
Message-ID: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64059 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676Ab1C1LHh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2011 07:07:37 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIR00BXOLKMS5A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIR00B5JLKIZA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patchset is a prerequisite for device tree patches on Exynos4. It
includes the following changes.

1. Adds clkdev support for Exynos4
2. Removes redundant console registration for Exynos4 and clkdev.
3. Modifies samsung serial driver to keep a copy of platform data and use it.

Changes since V1:

1. Fixed incorrect devname for clocks.
2. Moved CLKDEV_LOOKUP to arch/arm/Kconfig

Thomas Abraham (5):
  serial: samsung: Fix unintended usage of uart port 0 as console
  serial: s5pv210: Remove redundant console_initcall
  ARM: SAMSUNG: Add clkdev support
  ARM: SAMSUNG: Add clkdev support for exynos4
  serial: samsung: Keep a copy a pdev->dev.platform_data and use it

 arch/arm/Kconfig                            |    1 +
 arch/arm/mach-exynos4/clock.c               |   57 +++++++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 +++
 arch/arm/mach-exynos4/time.c                |    2 +
 arch/arm/plat-samsung/clock.c               |   18 ++++++++
 arch/arm/plat-samsung/include/plat/clock.h  |    5 ++
 arch/arm/plat-samsung/pwm-clock.c           |   10 +++++
 drivers/tty/serial/s5pv210.c                |   19 +++++----
 drivers/tty/serial/samsung.c                |   35 +++++++++++-----
 drivers/tty/serial/samsung.h                |    3 +
 10 files changed, 137 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h

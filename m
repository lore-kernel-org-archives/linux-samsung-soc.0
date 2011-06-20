From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/6] Add basic device tree support for Samsung's Exynos4
 platform
Date: Mon, 20 Jun 2011 16:32:26 +0530
Message-ID: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48394 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736Ab1FTKxH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 06:53:07 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN300JC04WB33H0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:53:05 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN300JSM4W4PB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:53:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org

This patch series adds a basic device tree based boot for Samsung's Exynos4
platforms and specifically for smdkv310 board. Device tree based driver
probe is added for uart, sdhci and watchdog drivers. These patches
enable booting to console on smdkv310 board with some of the devices
initialized with data from the device tree.

This patch series is based on
git.secretlab.ca/git/linux-2.6.git devicetree/test

and depends on the following patches which are not yet available in
the devicetree/test branch.

1. [PATCH] ARM: EXYNOS4: Fix card detection for sdhci 0 and 2
[http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg04704.html]

2. [PATCH] ARM: EXYNOS4: Fix missing S5P_VA_AUDSS definition
[http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg04866.html]

3. [PATCH 0/9] Add clkdev support for Samsung platforms
[http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg04874.html]

4. Consolidate the clkdev header files
[http://patchwork.ozlabs.org/patch/97862/]

Thomas Abraham (6):
  serial: samsung: Keep a copy of platform data in driver's private data
  serial: samsung: Add device tree support for s5pv210 uart driver
  watchdog: s3c2410: Add support for device tree based probe
  mmc: sdhci-s3c: Add support for device tree based probe
  arm: dts: Add nodes in smdkv310 device tree source file
  arm: exynos4: Add a new Exynos4 device tree enabled machine

 Documentation/devicetree/bindings/arm/samsung.txt  |    3 +-
 .../bindings/tty/serial/samsung_uart.txt           |   50 +++++++
 .../devicetree/bindings/watchdog/samsung-wdt.txt   |   12 ++
 arch/arm/boot/dts/exynos4-smdkv310.dts             |  135 +++++++++++++++++++-
 arch/arm/mach-exynos4/Kconfig                      |   11 ++
 arch/arm/mach-exynos4/Makefile                     |    1 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c            |   94 ++++++++++++++
 drivers/mmc/host/sdhci-s3c.c                       |   11 ++
 drivers/tty/serial/s5pv210.c                       |   39 +++++-
 drivers/tty/serial/samsung.c                       |  114 ++++++++++++++++-
 drivers/tty/serial/samsung.h                       |    4 +-
 drivers/watchdog/s3c2410_wdt.c                     |   10 ++
 12 files changed, 473 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/tty/serial/samsung_uart.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c

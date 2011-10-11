From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] ARM: Samsung: Add basic device tree support for Exynos4
 boards
Date: Tue, 11 Oct 2011 19:43:14 +0530
Message-ID: <1318342396-26178-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59609 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752151Ab1JKOLq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 10:11:46 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSW00BB0NFK8Z00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 23:11:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSW00BYLNFF5S40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 23:11:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

This patchset adds a new basic device tree enabled machine/board file which is
based on the Samsung's Exynos4 family of SoC's. Also included in this patchset is the
dts file for Exynos4210 SoC, Samsung's SMDKV310 board and Insignal's Origen board.

The Exynos4210 dts file includes support for IRQ, GPIO, WDT, RTC, UART, SDHCI, Keypad,
DMA and I2C controllers. As device tree coverage for Exynos4210 increases, additional
device nodes to represent the controllers should be added.

The device tree enabled machine file enables boot on two boards based on the
Exynos4210 SoC. This provides a starting point to add additional device tree support
on these boards, migrate other existing Exynos4 based boards to use device tree
and enable device tree based boot on new upcoming boards.

This patchset has been tested on the following tree:
  https://github.com/kgene/linux-samsung.git   branch: for-next

Thomas Abraham (2):
  ARM: Samsung: Add Exynos4 device tree enabled board file
  ARM: dts: Add intial dts file for Exynos4210 SoC, SMDKV310 and Origen board

 .../devicetree/bindings/arm/insignal-boards.txt    |    8 +
 .../devicetree/bindings/arm/samsung-boards.txt     |    8 +
 arch/arm/boot/dts/exynos4210-origen.dts            |  137 +++++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |  182 +++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |  403 ++++++++++++++++++++
 arch/arm/mach-exynos4/Kconfig                      |   14 +
 arch/arm/mach-exynos4/Makefile                     |    2 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c            |   85 ++++
 8 files changed, 839 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/insignal-boards.txt
 create mode 100644 Documentation/devicetree/bindings/arm/samsung-boards.txt
 create mode 100644 arch/arm/boot/dts/exynos4210-origen.dts
 create mode 100644 arch/arm/boot/dts/exynos4210-smdkv310.dts
 create mode 100644 arch/arm/boot/dts/exynos4210.dtsi
 create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c

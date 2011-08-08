From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: RFC[PATCH 0/6] ARM: S5P64X0: Add SDHCI support using clkdev
Date: Mon, 08 Aug 2011 14:17:50 +0530
Message-ID: <1312793277-18689-1-git-send-email-rajeshwari.s@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11894 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877Ab1HHItr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 04:49:47 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPL00AWCPUNLPT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 17:49:45 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPL00BGTPUTHJ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 17:49:46 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, cjb@laptop.org, ben-linux@fluff.org

S5P64X0 supports 3 Channel MMC/SDHCI/SDIO.
This patchset adds the pin-mux setup and enables the HSMMC device
for S5P64X0 using clkdev support.

This patch series is based on the latest
git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next
Tested on SMDK6440 and SMDK6450.

Rajeshwari Shinde (6):

o To Ben Dooks, Chris Ball 
  SDHCI: S3C: Use bus clocks created using clkdev

o To Kukjin Kim
  ARM: S5P64X0: Enable SDHCI device
  ARM: S5P64X0: Add support for pin-mux setup for SDHCI controllers
  ARM: S5P64X0: Populate default platform data for SDHCI devices
  ARM: S5P64X0: Enable SDHCI support
  ARM: S5P64X0: Add clkdev bus lookup support

 arch/arm/mach-s5p64x0/Kconfig                      |   30 ++++++
 arch/arm/mach-s5p64x0/Makefile                     |    2 +
 arch/arm/mach-s5p64x0/cpu.c                        |    9 ++
 .../include/mach/s5p64x0-common-sdhci.h            |   17 +++
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |   15 +++
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |   15 +++
 arch/arm/mach-s5p64x0/s5p64x0-common-sdhci.c       |   41 ++++++++
 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c           |  109 ++++++++++++++++++++
 arch/arm/mach-s5p64x0/setup-sdhci.c                |   46 ++++++++
 arch/arm/plat-samsung/Makefile                     |    1 +
 arch/arm/plat-samsung/clkdev-busalias.c            |   44 ++++++++
 arch/arm/plat-samsung/include/plat/sdhci.h         |   58 +++++++++++
 drivers/mmc/host/sdhci-s3c.c                       |    6 +-
 13 files changed, 389 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/s5p64x0-common-sdhci.h
 create mode 100644 arch/arm/mach-s5p64x0/s5p64x0-common-sdhci.c
 create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c
 create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci.c
 create mode 100644 arch/arm/plat-samsung/clkdev-busalias.c

-- 
1.7.4.4

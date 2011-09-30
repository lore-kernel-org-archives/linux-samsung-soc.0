From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/2]: Add SPI Support on Exynos4
Date: Fri, 30 Sep 2011 17:09:38 +0530
Message-ID: <1317382780-3083-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40864 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756648Ab1I3Ld4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 07:33:56 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSC001GY2S5FKS0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Sep 2011 20:33:54 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSC00KJD2SD4140@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Sep 2011 20:33:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk

This patchset adds SPI support and register the SPI bus clock
with clkdev using generic connection ID on EXYNOS4. This patch
set is depend on the following patches as it uses a common macro
CLKDEV_INIT to create clk_lookup structure and it also avoids
passing clock names through platform data.

ARM: CLKDEV: Add Common Macro for clk_lookup
ARM: SAMSUNG: Remove SPI bus clocks from platform data

Padmavathi Venna (2):
  ARM: EXYNOS4: Add SPI support to EXYNOS4
  SPI: EXYNOS4: Enable the SPI driver for EXYNOS4

 arch/arm/mach-exynos4/Kconfig                    |    1 +
 arch/arm/mach-exynos4/Makefile                   |    1 +
 arch/arm/mach-exynos4/clock.c                    |   82 +++++---
 arch/arm/mach-exynos4/dev-spi.c                  |  225 ++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/irqs.h        |    3 +
 arch/arm/mach-exynos4/include/mach/map.h         |    3 +
 arch/arm/mach-exynos4/include/mach/spi-clocks.h  |   16 ++
 arch/arm/mach-exynos4/mach-smdkv310.c            |  127 ++++++++++++-
 arch/arm/plat-samsung/include/plat/devs.h        |    3 +
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    1 +
 drivers/spi/Kconfig                              |    2 +-
 11 files changed, 432 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/dev-spi.c
 create mode 100644 arch/arm/mach-exynos4/include/mach/spi-clocks.h

-- 
1.7.4.4

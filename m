From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 0/2]: Add SPI Support on Exynos4
Date: Mon, 10 Oct 2011 13:38:03 +0530
Message-ID: <1318234084-19960-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28665 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455Ab1JJIDS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 04:03:18 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00L2MBP6CVS0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 17:03:17 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSU00BS2BPBKU80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 17:03:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com

This patchset adds SPI support and register the SPI bus clock
with clkdev using generic connection ID on EXYNOS4. This patch
set is depend on the following patches as it uses a common macro
CLKDEV_INIT to create clk_lookup structure and it also avoids
passing clock names through platform data.

ARM: CLKDEV: Add Common Macro for clk_lookup
ARM: SAMSUNG: Remove SPI bus clocks from platform data

V1 patch series are:
  http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg06986.html
  ARM: EXYNOS4: Add SPI support to EXYNOS4
  SPI: EXYNOS4: Enable the SPI driver for EXYNOS4

Changes Since V1:
	Reworked the patches as per the following link. Patch series in
        the following link removed & and , from the macro declaration and added
        in the macro defination.
        http://www.spinics.net/lists/arm-kernel/msg143663.html

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

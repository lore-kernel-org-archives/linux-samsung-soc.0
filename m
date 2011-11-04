From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4] Add SPI Support on Exynos4
Date: Fri, 04 Nov 2011 09:00:05 -0400
Message-ID: <1320411606-11518-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29957 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805Ab1KDDFT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Nov 2011 23:05:19 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU40056L8KFLQE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2011 12:05:18 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU400KTF8KNGP90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2011 12:05:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk

This patch adds SPI support and register the SPI bus clock
with clkdev using generic connection ID on EXYNOS4. This patch
is dependent on 

[PATCH 1/6] ARM: SAMSUNG: Consolidation of SPI platform devices to plat-samsung

V2 Changes:
Reworked the patches as per the following link. Patch series in
the following link removed & and , from the macro declaration and added
in the macro defination.
http://www.spinics.net/lists/arm-kernel/msg143663.html

V4 Changes:
Rebased on latest for-next branch. Reworked the patche based on SPI 
platform device consolidation.This patchset is dependent on the following patch.
[PATCH 1/5] ARM: SAMSUNG: Consolidation of SPI platform devices to plat-samsung.

Padmavathi Venna (1):
  ARM: EXYNOS4: Add SPI support

 arch/arm/mach-exynos4/Kconfig                   |    5 ++
 arch/arm/mach-exynos4/Makefile                  |    1 +
 arch/arm/mach-exynos4/clock.c                   |   72 +++++++++++++---------
 arch/arm/mach-exynos4/include/mach/irqs.h       |    3 +
 arch/arm/mach-exynos4/include/mach/map.h        |    6 ++
 arch/arm/mach-exynos4/include/mach/spi-clocks.h |   16 +++++
 arch/arm/mach-exynos4/mach-smdkv310.c           |   35 +++++++++++
 arch/arm/mach-exynos4/setup-spi.c               |   47 +++++++++++++++
 8 files changed, 155 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/include/mach/spi-clocks.h
 create mode 100644 arch/arm/mach-exynos4/setup-spi.c

From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/6] ARM: Exynos: Enable SPI platform support for Exynos4
 and Exynos5
Date: Sun, 03 Jun 2012 18:12:43 +0530
Message-ID: <1338727369-18241-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30650 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab2FCM1t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:27:49 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M51008O7JYB3OB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:48 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5100119JY60A40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:27:47 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Changes since v1:
- Minor fixes based on comments from Olof, Kukjin and Padma.
- Rebased to Linux 3.5-rc1

This patch set enables device tree based platform support for the three spi
controllers on Samsung's Exynos4 and Exynos5 SoC's.

Thomas Abraham (6):
  ARM: Exynos4: Fix the incorrect hierarchy of spi controller bus clock
  ARM: Exynos5: Add spi clock support
  ARM: Exynos4: Enable platform support for SPI controllers
  ARM: Exynos5: Enable platform support for SPI controllers
  ARM: dts: Add nodes for spi controllers for Samsung Exynos4 platforms
  ARM: dts: Add nodes for spi controllers for Samsung Exynos5 platforms

 arch/arm/boot/dts/exynos4210-origen.dts   |   12 ++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts |   38 +++++++++++
 arch/arm/boot/dts/exynos4210.dtsi         |   36 +++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   38 +++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   36 +++++++++++
 arch/arm/mach-exynos/clock-exynos4.c      |   48 ++++++++++++---
 arch/arm/mach-exynos/clock-exynos5.c      |   98 +++++++++++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/irqs.h  |    4 +
 arch/arm/mach-exynos/include/mach/map.h   |    3 +
 arch/arm/mach-exynos/mach-exynos4-dt.c    |    6 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    6 ++
 11 files changed, 317 insertions(+), 8 deletions(-)

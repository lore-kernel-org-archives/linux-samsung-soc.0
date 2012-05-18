From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/6] ARM: Exynos: Enable SPI platform support for Exynos4 and
 Exynos5
Date: Fri, 18 May 2012 15:16:26 +0530
Message-ID: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13958 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967899Ab2ERJcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 May 2012 05:32:43 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M47002F3P67QHP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 18:32:42 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4700FF3P67SH60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 18:32:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jaswinder.singh@linaro.org

This patch set enables device tree based platform support for the three spi
controllers on Samsung's Exynos4 and Exynos5 SoC's.

Thomas Abraham (6):
  ARM: Exynos4: Fix the incorrect hierarchy of spi controller bus clock
  ARM: Exynos5: Add spi clock support
  ARM: Exynos4: Enable platform support for SPI controllers
  ARM: Exynos5: Enable platform support for SPI controllers
  ARM: dts: Add nodes for spi controllers for Samsung Exynos4 platforms
  ARM: dts: Add nodes for spi controllers for Samsung Exynos5 platforms

 arch/arm/boot/dts/exynos4210-origen.dts        |   12 +++
 arch/arm/boot/dts/exynos4210-smdkv310.dts      |   44 +++++++++++
 arch/arm/boot/dts/exynos4210.dtsi              |   30 +++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts      |   47 +++++++++++-
 arch/arm/boot/dts/exynos5250.dtsi              |   46 +++++++++++
 arch/arm/mach-exynos/Kconfig                   |    2 +
 arch/arm/mach-exynos/clock-exynos4.c           |   48 ++++++++++--
 arch/arm/mach-exynos/clock-exynos5.c           |   98 ++++++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/irqs.h       |    4 +
 arch/arm/mach-exynos/include/mach/map.h        |    3 +
 arch/arm/mach-exynos/include/mach/regs-clock.h |    4 +
 arch/arm/mach-exynos/mach-exynos4-dt.c         |    6 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c         |    6 ++
 13 files changed, 341 insertions(+), 9 deletions(-)

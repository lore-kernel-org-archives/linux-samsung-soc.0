From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/3] DW-MSHC support on Exynos4412-TRATS2 board
Date: Thu, 12 Dec 2013 17:18:00 +0100
Message-ID: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53010 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466Ab3LLQS2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:18:28 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXP00CN2BYQIR60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 16:18:26 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>

This series fixes spotted issues with DW-MSHC support on Exynos4x12
SoCs and then enables DW-MSHC controller to handle eMMC memory on
Exynos4412-TRATS2 board. As opposed to using sdhci-s3c for eMMC,
MMC 4.4 extensions can be used and in general performance is improved.

Tested on Exynos4412-TRATS2 board.

Tomasz Figa (3):
  clk: samsung: exynos4: Fix definition of div_mmc_pre4 divider
  ARM: dts: exynos4x12: Fix definition of MSHC device tree nodes
  ARM: dts: exynos4412-trats2: Use MSHC controller for eMMC memory

 arch/arm/boot/dts/exynos4412-odroidx.dts |  5 +----
 arch/arm/boot/dts/exynos4412-origen.dts  |  5 +----
 arch/arm/boot/dts/exynos4412-trats2.dts  | 20 ++++++++++++++++----
 arch/arm/boot/dts/exynos4412.dtsi        |  8 --------
 arch/arm/boot/dts/exynos4x12.dtsi        | 13 +++++++++++++
 drivers/clk/samsung/clk-exynos4.c        |  3 ++-
 6 files changed, 33 insertions(+), 21 deletions(-)

-- 
1.8.4.3

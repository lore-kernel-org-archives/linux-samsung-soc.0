From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v2 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Fri, 26 Oct 2012 14:59:04 +0530
Message-ID: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53580 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757844Ab2JZJGF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 05:06:05 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCH00GTZT9JGMT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 18:05:54 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCH00BAFT8G5T90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 18:05:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, amit.kachhap@linaro.org, Amit Daniel Kachhap <amit.daniel@samsung.com>

From: Amit Daniel Kachhap <amit.daniel@samsung.com>

These TMU enablement patches are needed for exynos4 and exynos5 TMU
driver already merged(drivers/thermal/exynos_thermal.c).

This patchset is based on Samsung Maintainer's tree,
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next

Amit Daniel Kachhap (2):
  ARM: exynos4: Add devicetree node for TMU driver
  ARM: exynos5: Add devicetree node for TMU driver

 arch/arm/boot/dts/exynos4210.dtsi        |    7 +++++++
 arch/arm/boot/dts/exynos5250.dtsi        |    6 ++++++
 arch/arm/mach-exynos/clock-exynos4.c     |    4 ++++
 arch/arm/mach-exynos/clock-exynos5.c     |    5 +++++
 arch/arm/mach-exynos/include/mach/irqs.h |    3 +++
 arch/arm/mach-exynos/include/mach/map.h  |    3 +++
 arch/arm/mach-exynos/mach-exynos4-dt.c   |    2 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c   |    2 ++
 8 files changed, 32 insertions(+), 0 deletions(-)

From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/4] ARM: EXYNOS: Kconfig cleanup
Date: Mon, 08 Oct 2012 15:02:21 +0200
Message-ID: <1349701345-2681-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22786 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083Ab2JHNCq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 09:02:46 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBK00AE6S8LS250@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 22:02:45 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBK00KZWS8CAK90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 22:02:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch series aims to consolidate low level Kconfig entries for Exynos
SoC series by adding missing or removing wrong dependencies, renaming
entries to match a single naming convention and introducing a common
parent entry for EXYNOS4212 and EXYNOS4412.

See particular patches for more detailed descriptions.

Tomasz Figa (4):
  ARM: EXYNOS: Kconfig: Rename CPU_EXYNOS4210 to SOC_EXYNOS4210
  ARM: EXYNOS: Kconfig: Sort out dependencies between options
  ARM: EXYNOS: Kconfig: Group EXYNOS{4212,4412} into EXYNOS4X12
  ARM: EXYNOS: Kconfig: Remove dependencies on particular SoCs from DT
    machines

 arch/arm/mach-exynos/Kconfig             | 42 +++++++++++++++-----------------
 arch/arm/mach-exynos/Makefile            |  4 +--
 arch/arm/mach-exynos/common.h            |  4 +--
 arch/arm/plat-samsung/include/plat/cpu.h |  2 +-
 drivers/cpufreq/Kconfig.arm              |  4 +--
 drivers/devfreq/Kconfig                  |  2 +-
 drivers/mmc/host/sdhci-s3c.c             |  2 +-
 drivers/tty/serial/samsung.c             |  3 +--
 8 files changed, 30 insertions(+), 33 deletions(-)

-- 
1.7.12

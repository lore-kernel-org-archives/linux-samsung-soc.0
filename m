From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/4] ARM: Exynos: Fixes for Exynos5 device tree support
Date: Tue, 27 Mar 2012 14:56:01 +0530
Message-ID: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40102 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754011Ab2C0JVp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 05:21:45 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1J004UTDZNHD80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:21:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1J003DJDYYQZJ0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:21:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

This series includes general fixes for Exynos5 device tree support. This
is based on the following tree. Both Exynos4 and Exynos5 device tree
support have been tested when this series.

http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git [for-next]


Thomas Abraham (4):
  ARM: Exynos: Use CHIP_ID to detect cpu type during decompression setup
  ARM: Exynos: Remove a new bus_type instance for Exynos5
  ARM: Exynos5: Fix incorrect initialization of GIC
  ARM: Exynos5: Add PDMA and MDMA physical base address defines

 arch/arm/mach-exynos/common.c                  |   21 +++------------------
 arch/arm/mach-exynos/include/mach/map.h        |    5 +++++
 arch/arm/mach-exynos/include/mach/uncompress.h |    6 +++++-
 arch/arm/mach-exynos/mach-exynos5-dt.c         |    3 ++-
 4 files changed, 15 insertions(+), 20 deletions(-)

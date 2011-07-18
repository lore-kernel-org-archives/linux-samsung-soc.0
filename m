From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/4] Updated s5p-mfc platform definitions
Date: Mon, 18 Jul 2011 15:30:36 +0200
Message-ID: <1310995840-20660-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56060 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753405Ab1GRNbL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 09:31:11 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOJ0041D6VXAN@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:31:09 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOJ00HIH6VWTK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:31:08 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hello,

This patch series contains platform definitions for s5p-mfc driver
rebased onto latest for-next branch (including generic GIC and clockdev
changes).

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center


Patch summary:

Kamil Debski (3):
  ARM: Add support for MFC device to plat-s5p, mach-s5pv210 and
    mach-exynos4
  ARM: S5PV210: Enable MFC on Goni
  ARM: EXYNOS4: Enable MFC on universal_c210

Marek Szyprowski (1):
  ARM: EXYNOS4: Enable MFC on Samsung NURI

 arch/arm/Kconfig                            |    2 +
 arch/arm/mach-exynos4/Kconfig               |    4 +
 arch/arm/mach-exynos4/clock.c               |   61 +++++++++++++
 arch/arm/mach-exynos4/include/mach/map.h    |    2 +
 arch/arm/mach-exynos4/mach-nuri.c           |   13 +++
 arch/arm/mach-exynos4/mach-universal_c210.c |   13 +++
 arch/arm/mach-s5pv210/Kconfig               |    1 +
 arch/arm/mach-s5pv210/clock.c               |    7 ++
 arch/arm/mach-s5pv210/include/mach/map.h    |    3 +
 arch/arm/mach-s5pv210/mach-goni.c           |   10 ++
 arch/arm/plat-s5p/Kconfig                   |    5 +
 arch/arm/plat-s5p/Makefile                  |    2 +-
 arch/arm/plat-s5p/dev-mfc.c                 |  125 +++++++++++++++++++++++++++
 arch/arm/plat-s5p/include/plat/mfc.h        |   28 ++++++
 arch/arm/plat-samsung/include/plat/devs.h   |    3 +
 15 files changed, 278 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc.c
 create mode 100644 arch/arm/plat-s5p/include/plat/mfc.h

-- 
1.7.1.569.g6f426

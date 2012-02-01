From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCHv3 0/3] ARM: Exynos: JPEG board definition and device register
Date: Wed, 01 Feb 2012 12:19:22 +0100
Message-ID: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33452 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753473Ab2BALTb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 06:19:31 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYP0011UOSHGZ@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 11:19:29 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYP00EKVOSGA2@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 11:19:29 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Dear All,

This patch series adds board definition code and device registration code
for JPEG IP found in Exynos4 SoC on universal_c210 and nuri boards.

It includes changes after Tushar's review - thanks, Tushar.

Andrzej Pietrasiewicz (3):
  ARM: Exynos: JPEG board definition
  ARM: Exynos: Register JPEG on universal_c210
  ARM: Exynos: Register JPEG on nuri

 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/clock.c               |    5 +++++
 arch/arm/mach-exynos/include/mach/map.h    |    3 +++
 arch/arm/mach-exynos/mach-nuri.c           |    2 ++
 arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
 arch/arm/plat-s5p/Kconfig                  |    5 +++++
 arch/arm/plat-samsung/devs.c               |   18 ++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h  |    1 +
 8 files changed, 38 insertions(+), 0 deletions(-)

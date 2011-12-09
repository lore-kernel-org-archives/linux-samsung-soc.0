From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 0/3] Samsung S5P platform modification required for G2D driver
Date: Fri, 09 Dec 2011 17:04:39 +0100
Message-ID: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43372 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab1LIQE5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 11:04:57 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LVY0044Q207IA70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2011 16:04:55 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LVY00AYB207NK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2011 16:04:55 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, kgene.kim@samsung.com

Hi,

This series of patches contains necessary platform modification required by the
G2D driver. G2D is a 2D-graphics acceleration engine present in the S5PC110 and
Exynos4 Samsung SoCs.

The patches have been rebased to the newest kgene/for-next branch. The driver
is currently staging for 3.3 in Mauro's repository, so please include these
patches for the next release.

Best wishes,
Kamil Debski

Kamil Debski (3):
  s5p-g2d: add G2D to plat-s5p and mach-exynos4
  s5p-g2d: add G2D to mach-nuri
  s5p-g2d: add G2D to mach-universal

 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/include/mach/map.h    |    3 +++
 arch/arm/mach-exynos/mach-nuri.c           |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |    1 +
 arch/arm/plat-s5p/Kconfig                  |    5 +++++
 arch/arm/plat-samsung/devs.c               |   28 ++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h  |    1 +
 7 files changed, 41 insertions(+), 0 deletions(-)

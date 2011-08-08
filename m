From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 0/3] Samsung S5P platform modification required for G2D driver
Date: Mon, 08 Aug 2011 19:16:56 +0200
Message-ID: <1312823819-14713-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22348 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217Ab1HHRRJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 13:17:09 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LPM002EFDCK0O@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:08 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPM00CE6DCJ4V@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:08 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com

Hi,

This series of patches contains necessary platform modification required by the
G2D driver. G2D is a 2D-graphics acceleration engine present in the S5PC110 and
Exynos4 Samsung SoCs.

Best wishes,
Kamil Debski

Kamil Debski (3):
  s5p-g2d: add G2D to plat-s5p and mach-exynos4
  s5p-g2d: add G2D to mach-nuri
  s5p-g2d: add G2D to mach-universal

 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/include/mach/map.h    |    3 ++
 arch/arm/mach-exynos4/mach-nuri.c           |    1 +
 arch/arm/mach-exynos4/mach-universal_c210.c |    1 +
 arch/arm/plat-s5p/Kconfig                   |    5 +++
 arch/arm/plat-s5p/Makefile                  |    1 +
 arch/arm/plat-s5p/dev-g2d.c                 |   43 +++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h   |    2 +-
 8 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-g2d.c

From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 0/3] Samsung S5P platform modification required for G2D driver
Date: Tue, 27 Dec 2011 14:21:25 +0100
Message-ID: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29467 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753822Ab1L0NVg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 08:21:36 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LWV003OI6FXYM40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 13:21:33 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LWV009T56FXEK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 13:21:33 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com, sachin.kamat@linaro.org

Hi,

This series of patches contains necessary platform modification required by the
G2D driver. G2D is a 2D-graphics acceleration engine present in the S5PC110 and
Exynos4 Samsung SoCs.

I have fixed the errors pointed out by Kukjin Kim an Sachin Kamat. (Thanks!)
Also the patches have been rebased to the newest kgene/for-next branch.

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

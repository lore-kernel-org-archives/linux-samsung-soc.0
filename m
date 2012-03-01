From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Universal C210 and NURI board fixes
Date: Thu, 01 Mar 2012 09:40:18 +0100
Message-ID: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56080 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757726Ab2CAImP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 03:42:15 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M07006LJ6SFHS50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M07001PE6SF6S@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 08:41:03 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hi Kukjin,

I've found a few problems with Universal C210 and NURI boards in the
current linux-next kernel. The provided patches fix the issues with
SDHCI controllers and mysterious touch screen freeze.

Best regards,
Marek Szyprowski


Patch summary: 

Bartlomiej Zolnierkiewicz (1):
  ARM: Exynos: fix touchscreen IRQ setup on Universal C210 board

Marek Szyprowski (2):
  ARM: Exynos: fix SDHCI caps for UniversalC210 and NURI boards
  ARM: Exynos: fix SDHCI device names in regulator definitions

 arch/arm/mach-exynos/mach-nuri.c           |    6 ++++--
 arch/arm/mach-exynos/mach-universal_c210.c |    5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.7.1.569.g6f426

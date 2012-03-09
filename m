From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Add support for DRM display subsystem
Date: Fri, 09 Mar 2012 12:05:02 +0100
Message-ID: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50220 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752365Ab2CILFO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 06:05:14 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0M0075J6SOPM70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:05:12 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0M00I0A6SOZ6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:05:12 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hello,

This patch set adds support for Exysno DRM display subsystem for
Universal C210 and NURI boards. Exynos DRM driver has been merged to 3.3
kernel tree and provides unified and more powerful alternative for
s3c-fb and s5p-tv drivers.

Best regards

Marek Szyprowski
Samsung Poland R&D Center

Patch summary:

Marek Szyprowski (3):
  ARM: Exynos4: add platform device for core DRM subsystem
  ARM: Exynos4: Add DRM core device support for Universal C210 board
  ARM: Exynos4: Add DRM core support for NURI board

 arch/arm/mach-exynos/Kconfig               |    7 ++++++
 arch/arm/mach-exynos/Makefile              |    1 +
 arch/arm/mach-exynos/dev-drm.c             |   29 ++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-nuri.c           |   31 ++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-universal_c210.c |   31 ++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h  |    2 +
 6 files changed, 101 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos/dev-drm.c

-- 
1.7.1.569.g6f426

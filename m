From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Tue, 13 Mar 2012 11:39:36 +0100
Message-ID: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47363 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760489Ab2CMKjs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 06:39:48 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0T00ASXKA532@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 10:39:41 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0T000H2KA84M@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 10:39:45 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hello,

This patch set adds support for Exynos DRM display subsystem for
Universal C210 and NURI boards. Exynos DRM driver has been merged to 3.3
kernel tree and provides unified and more powerful alternative for
s3c-fb and s5p-tv drivers. V2 includes update for the latest changes in
platform data structure (added 'panel' entry).

Best regards

Marek Szyprowski
Samsung Poland R&D Center

Patch summary:

Marek Szyprowski (3):
  ARM: Exynos: add platform device for core DRM subsystem
  ARM: Exynos: Add DRM core device support for Universal C210 board
  ARM: Exynos: Add DRM core support for NURI board

 arch/arm/mach-exynos/Kconfig               |    7 ++++++
 arch/arm/mach-exynos/Makefile              |    1 +
 arch/arm/mach-exynos/dev-drm.c             |   29 ++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-nuri.c           |   33 ++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-universal_c210.c |   33 ++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h  |    2 +
 6 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos/dev-drm.c

-- 
1.7.1.569.g6f426

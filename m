From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 0/3] ARM: S5P: Add support for MFC 5.1 device on S5PV210 and
	EXYNOS4
Date: Wed, 27 Apr 2011 13:43:02 +0200
Message-ID: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65523 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753324Ab1D0Ln2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2011 07:43:28 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LKB00II277YZH90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LKB002VW77XQQ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:09 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, kgene.kim@samsung.com, jtp.park@samsung.com

Hello,

Multi Format Codec 5.1 is a device present in the S5PV210 and EXYNOS4 SoCs by Samsung.
This patch set adds platform and mach data for MFC 5.1.

Best regards,
Kamil Debski

Patch summary:

Kamil Debski (3):
  ARM: S5P: Add MFC 5.1 driver to plat-s5p, mach-s5pv210 and mach-exynos4
  ARM: S5PV210: Enable MFC on Goni & Aquila
  ARM: EXYNOS4: Enable MFC on universal_c210

 arch/arm/mach-exynos4/Kconfig               |    1 +
 arch/arm/mach-exynos4/clock.c               |   63 +++++++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/map.h    |    3 +
 arch/arm/mach-exynos4/mach-universal_c210.c |    8 +++
 arch/arm/mach-s5pv210/Kconfig               |    1 +
 arch/arm/mach-s5pv210/clock.c               |    6 +++
 arch/arm/mach-s5pv210/include/mach/map.h    |    3 +
 arch/arm/mach-s5pv210/mach-aquila.c         |    1 +
 arch/arm/mach-s5pv210/mach-goni.c           |    1 +
 arch/arm/plat-s5p/Kconfig                   |    5 ++
 arch/arm/plat-s5p/Makefile                  |    2 +-
 arch/arm/plat-s5p/dev-mfc.c                 |   49 +++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h   |    1 +
 13 files changed, 143 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc.c

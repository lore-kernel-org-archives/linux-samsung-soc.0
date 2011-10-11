From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: JPEG: board definition and device registration
Date: Tue, 11 Oct 2011 14:19:12 +0200
Message-ID: <1318335553-13355-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45879 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797Ab1JKMT5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 08:19:57 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LSW00GHFI97GR@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 13:19:55 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LSW00F2VI974Z@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 13:19:55 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Dear All,

This patch adds board definition code and device registration code
for JPEG IP found in Exynos4 SoC.

Andrzej Pietrasiewicz

Andrzej Pietrasiewicz (1):
  ARM: EXYNOS4: JPEG: board definition and device registration

 arch/arm/mach-exynos4/Kconfig               |    1 +
 arch/arm/mach-exynos4/clock.c               |    5 +++
 arch/arm/mach-exynos4/include/mach/map.h    |    3 ++
 arch/arm/mach-exynos4/mach-universal_c210.c |    2 +
 arch/arm/plat-s5p/Kconfig                   |    5 +++
 arch/arm/plat-s5p/Makefile                  |    1 +
 arch/arm/plat-s5p/dev-jpeg.c                |   46 +++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h   |    1 +
 8 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-jpeg.c

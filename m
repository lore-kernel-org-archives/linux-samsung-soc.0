From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: Add s3c-hsotg support for Exynos4210 boards
Date: Tue, 13 Mar 2012 09:14:04 +0100
Message-ID: <1331626447-22868-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64094 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754794Ab2CMIOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 04:14:17 -0400
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0T00ILDDJQ3I50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 08:14:14 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0T00D9ODJQYE@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 08:14:14 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

This patch add support for Exynos4210 based targets; namely Universal_C210 and
Nuri.

Tested HW:
- Exynos4210 NURI target rev.1
- Exynos4210 Universal_C210 target rev.0

Joonyoung Shim (1):
  ARM: EXYNOS: Add s3c-hsotg device support for NURI board

Lukasz Majewski (2):
  ARM: EXYNOS: Add usb otg phy control for EXYNOS4210
  ARM: EXYNOS: Add s3c-hsotg device support for Universal C210 board

 arch/arm/mach-exynos/Kconfig                 |    3 +
 arch/arm/mach-exynos/include/mach/irqs.h     |    2 +-
 arch/arm/mach-exynos/include/mach/map.h      |    3 +
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
 arch/arm/mach-exynos/mach-nuri.c             |    9 ++-
 arch/arm/mach-exynos/mach-universal_c210.c   |   14 ++++
 arch/arm/mach-exynos/setup-usb-phy.c         |   95 +++++++++++++++++++-------
 7 files changed, 102 insertions(+), 27 deletions(-)

-- 
1.7.2.3

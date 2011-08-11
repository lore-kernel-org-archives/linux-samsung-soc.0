From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain framework for
 EXYNOS4210
Date: Thu, 11 Aug 2011 13:55:14 +0900
Message-ID: <4E4360B2.2060508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17607 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751771Ab1HKEzi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Aug 2011 00:55:38 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPQ00HHYZ0OC820@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 13:55:36 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPQ00AZ7Z0PUI@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 13:55:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

The following patch set use the generic Power domain Framework instead of
power domain code depend of Samsung SoC.

Chanwoo Choi (4):
  ARM: EXYNOS4: Support for generic I/O power domains on EXYNOS4210
  ARM: EXYNOS4: Support for generic Clock manipulation PM callbacks
  ARM: EXYNOS4: Delete the power-domain code depend on Samsung SoC
  ARM: EXYNOS4: Add power domain to use generic Power domain Framework

 arch/arm/mach-exynos4/Kconfig                      |   10 +-
 arch/arm/mach-exynos4/Makefile                     |    4 +-
 arch/arm/mach-exynos4/dev-pd.c                     |  139 --------------
 arch/arm/mach-exynos4/include/mach/pm-exynos4210.h |   52 ++++++
 arch/arm/mach-exynos4/include/mach/regs-clock.h    |    8 +
 arch/arm/mach-exynos4/mach-nuri.c                  |   21 ++-
 arch/arm/mach-exynos4/mach-smdkc210.c              |   26 ++-
 arch/arm/mach-exynos4/mach-smdkv310.c              |   23 ++-
 arch/arm/mach-exynos4/mach-universal_c210.c        |   21 ++-
 arch/arm/mach-exynos4/pm-exynos4210.c              |  189 ++++++++++++++++++++
 arch/arm/mach-exynos4/pm-runtime.c                 |   56 ++++++
 arch/arm/plat-samsung/Kconfig                      |    8 -
 arch/arm/plat-samsung/Makefile                     |    4 -
 arch/arm/plat-samsung/include/plat/pd.h            |   30 ---
 arch/arm/plat-samsung/pd.c                         |   95 ----------
 15 files changed, 377 insertions(+), 309 deletions(-)
 delete mode 100644 arch/arm/mach-exynos4/dev-pd.c
 create mode 100644 arch/arm/mach-exynos4/include/mach/pm-exynos4210.h
 create mode 100644 arch/arm/mach-exynos4/pm-exynos4210.c
 create mode 100644 arch/arm/mach-exynos4/pm-runtime.c
 delete mode 100644 arch/arm/plat-samsung/include/plat/pd.h
 delete mode 100644 arch/arm/plat-samsung/pd.c

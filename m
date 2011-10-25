From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/3 v3] ARM: EXYNOS4: Support generic Power domain framework
 for EXYNOS4 series
Date: Tue, 25 Oct 2011 19:35:23 +0900
Message-ID: <4EA690EB.2050700@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28733 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753044Ab1JYKgI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Oct 2011 06:36:08 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LTM007Z3ARS2L70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2011 19:36:06 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LTM002A6AS68320@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2011 19:36:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <snjw23@gmail.com>, linux-pm@lists.linux-foundation.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

The following patch set use the generic Power domain framework instead of
power domain code depend on samsung SoC.

It is based 'for-next' branch on git://github/com/kgene/linux-samsung.git.

I refer to the following patch to implement what configure the clock-gating
control register for block to turn off/on:
http://git.infradead.org/users/kmpark/linux-2.6-samsung/commit/39a81876d034dcbdc2a4c4c4b847b3b49e38870c

Patch 1/3 has renamed function and support power domain for EXYNOS4210/4212
Patch 2/3 has just one calling to initalize the poewr domain of EXYNOS4210/4212
Patch 3/3 has no changes

Chanwoo Choi (3):
  ARM: EXYNOS4: Support for generic I/O power domains on
    EXYNOS4210/4212
  ARM: EXYNOS4: Use generic power domain on EXYNOS4210/4212
  ARM: EXYNOS4: Delete the power domain code depend on samsung SoC

 arch/arm/mach-exynos4/Kconfig                   |    7 +-
 arch/arm/mach-exynos4/Makefile                  |    2 +-
 arch/arm/mach-exynos4/dev-pd.c                  |  139 -------------
 arch/arm/mach-exynos4/include/mach/pm-exynos4.h |   50 +++++
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    9 +
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    2 +
 arch/arm/mach-exynos4/mach-armlex4210.c         |    3 +
 arch/arm/mach-exynos4/mach-nuri.c               |   24 ++--
 arch/arm/mach-exynos4/mach-origen.c             |   19 +--
 arch/arm/mach-exynos4/mach-smdk4x12.c           |    3 +
 arch/arm/mach-exynos4/mach-smdkv310.c           |   17 +-
 arch/arm/mach-exynos4/mach-universal_c210.c     |   26 ++--
 arch/arm/mach-exynos4/pm-exynos4.c              |  237 +++++++++++++++++++++++
 arch/arm/plat-samsung/Kconfig                   |    8 -
 arch/arm/plat-samsung/Makefile                  |    4 -
 arch/arm/plat-samsung/include/plat/pd.h         |   30 ---
 arch/arm/plat-samsung/pd.c                      |   95 ---------
 17 files changed, 344 insertions(+), 331 deletions(-)
 delete mode 100644 arch/arm/mach-exynos4/dev-pd.c
 create mode 100644 arch/arm/mach-exynos4/include/mach/pm-exynos4.h
 create mode 100644 arch/arm/mach-exynos4/pm-exynos4.c
 delete mode 100644 arch/arm/plat-samsung/include/plat/pd.h
 delete mode 100644 arch/arm/plat-samsung/pd.c

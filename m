From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/2] Add support to enable ARM PMU for EXYNOS4/5
Date: Thu, 26 Jul 2012 09:35:00 +0900
Message-ID: <1343262902-19073-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18954 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192Ab2GZAf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jul 2012 20:35:27 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7Q004CKSALPD70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jul 2012 09:35:12 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7Q00EOXSAG9140@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jul 2012 09:35:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, Chanho Park <chanho61.park@samsung.com>

This patchset fixes irq numbers of ARM Performance Monitoring unit.
We need to seperate arm-pmu(performance measurement unit) and exynos-pmu(power
management unit). The exynos4 and 5 use 2 more cpu core which has its own pmu.
We should define pmu irq numbers according to the number of cpus.
The pmu irq of exynos4 and 5 uses combiner-irq type. To enable perf(performance
counter), we need to implement a set_irq_affinity function about the combiner-irq.

Chanho Park (2):
  ARM: EXYNOS: Fix ARM PMU irq numbers
  ARM: EXYNOS: Add set_irq_affinity function for combiner_irq

 arch/arm/mach-exynos/common.c            |   30 +++++++++++++++++++++++++-----
 arch/arm/mach-exynos/include/mach/irqs.h |   18 ++++++++++++++++--
 arch/arm/plat-samsung/devs.c             |    9 ++++++++-
 3 files changed, 49 insertions(+), 8 deletions(-)

-- 
1.7.9.5

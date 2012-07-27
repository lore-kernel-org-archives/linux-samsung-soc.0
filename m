From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2 0/3] Add support to enable ARM PMU for EXYNOS4/5
Date: Fri, 27 Jul 2012 17:08:26 +0900
Message-ID: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44318 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab2G0IIg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jul 2012 04:08:36 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7T00BV37YBRVO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jul 2012 17:08:35 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7T007T07Y88OC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jul 2012 17:08:35 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, linux@arm.linux.org.uk, will.deacon@arm.com, Chanho Park <chanho61.park@samsung.com>

This patchset fixes irq numbers of ARM Performance Monitoring unit and enable it
for Perf(Performance Counter) on the exynos 4 and 5. The exynos4 and 5 use 2
more cpu core which has its own pmu. We should define pmu irq numbers according
to the number of cpus.
The pmu irq of exynos4 and 5 uses combiner-irq type.
The exynos4412 especially has 4 extra combined irq groups. We should enable the
groups beacuse two pmu irqs are there. To enable perf, we need also to implement
a set_irq_affinity function about the combiner-irq.
After this patch, we can use the perf for the exynos machine.

Changes from v1:
 - Split arm-pmu init of exynos from plat-samsung
 - Correct combined irqs of exynos4412
 - Use soc_is_xxx function instead of CONFIG_XXX to identify dynamically

Chanho Park (3):
  ARM: EXYNOS: Add set_irq_affinity function for combiner_irq
  ARM: EXYNOS: Correct combined IRQs for exynos4412
  ARM: EXYNOS: Enable PMUs for exynos4/5

 arch/arm/mach-exynos/common.c            |  137 +++++++++++++++++++++++++++---
 arch/arm/mach-exynos/include/mach/irqs.h |   11 ++-
 arch/arm/plat-samsung/devs.c             |    3 +-
 3 files changed, 135 insertions(+), 16 deletions(-)

-- 
1.7.9.5

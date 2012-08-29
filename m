From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 0/4] Add support to enable ARM PMU for EXYNOS
Date: Wed, 29 Aug 2012 10:14:53 +0900
Message-ID: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14144 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239Ab2H2BPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 21:15:13 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9H00MHFSPQEE30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 10:15:11 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9H00IO5ST8BV20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 10:15:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, Chanho Park <chanho61.park@samsung.com>

This patchset fixes irq numbers of ARM Performance Monitoring unit and enable it
for Perf(Performance Counter) on the exynos 4 and 5. The exynos4 and 5 use 2
more cpu cores which has its own pmu.
The exynos uses combiner-irq type for arm-pmu. Especially, the exynos4412 has 4
extra combined irq groups. So, we need to change a max combiner number.
To enable perf, we need also to implement a set_irq_affinity function about the
combiner-irq. After applying this patch, we can use the perf for the exynos
machine.

Changes from v2:
 - Convert to dt binding of exynos5250

Changes from v1:
 - Split arm-pmu init of exynos from plat-samsung
 - Correct combined irqs of exynos4412
 - Use soc_is_xxx function instead of CONFIG_XXX to identify dynamically

Chanho Park (4):
  ARM: EXYNOS: Add set_irq_affinity function for combiner_irq
  ARM: EXYNOS: Correct combined IRQs for exynos4412
  ARM: EXYNOS: Enable PMUs for exynos4
  ARM: EXYNOS: Add arm-pmu DT binding for exynos5250

 arch/arm/boot/dts/exynos5250.dtsi        |    6 ++
 arch/arm/mach-exynos/common.c            |  106 ++++++++++++++++++++++++++----
 arch/arm/mach-exynos/include/mach/irqs.h |   10 ++-
 arch/arm/plat-samsung/devs.c             |    2 +-
 4 files changed, 109 insertions(+), 15 deletions(-)

-- 
1.7.9.5

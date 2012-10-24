From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v5 0/5] Add support to enable ARM PMU for EXYNOS
Date: Wed, 24 Oct 2012 14:34:49 +0900
Message-ID: <1351056894-5790-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12577 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222Ab2JXFfY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Oct 2012 01:35:24 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCD00JNAU6DJ0O0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Oct 2012 14:35:23 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCD0053YU6W5670@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Oct 2012 14:35:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kyungmin.park@samsung.com, sachin.kamat@linaro.org, thomas.abraham@linaro.org, will.deacon@arm.com, Chanho Park <chanho61.park@samsung.com>

This patchset fixes irq numbers of ARM Performance Monitoring unit and enable
it for Perf(Performance Counter) on the exynos 4 and 5. The exynos4 and 5 have 2
more cpu cores which has its own pmu.

The exynos uses combiner-irq type for arm-pmu. Especially, the exynos4412 has 4
extra combined irq groups. So, we need to change a max combiner number and to
retreive it according to each soc types.

To enable perf, we need also to implement a set_irq_affinity function for the
combiner-irq. After applying this patch, we can use the perf for the exynos
machine.

Changes from v4:
 - Use max_combiner_nr() in combiner_cascade_irq
 - Add EXYNOS4412_MAX_COMBINER_NR to clarify a meaning
 - Change combiner_extra_irq to exynos4x12_combiner_extra_irq

Changes from v3:
 - Define max_combiner_nr according to soc types
 - Add armpmu dt binding for exynos4210
 - Clean up soc types comparison from v2

Changes from v2:
 - Convert to dt binding of exynos5250

Changes from v1:
 - Split arm-pmu init of exynos from plat-samsung
 - Correct combined irqs of exynos4412
 - Use soc_is_xxx function instead of CONFIG_XXX to identify dynamically

Chanho Park (5):
  ARM: EXYNOS: Add set_irq_affinity function for combiner_irq
  ARM: EXYNOS: Correct combined IRQs for exynos4
  ARM: EXYNOS: Enable PMUs for exynos4
  ARM: EXYNOS: Add arm-pmu DT binding for exynos5250
  ARM: EXYNOS: Add arm-pmu DT binding for exynos421x

 arch/arm/boot/dts/exynos4210.dtsi        |    6 ++
 arch/arm/boot/dts/exynos5250.dtsi        |    6 ++
 arch/arm/mach-exynos/common.c            |  108 +++++++++++++++++++++++++-----
 arch/arm/mach-exynos/include/mach/irqs.h |   13 +++-
 arch/arm/plat-samsung/devs.c             |    2 +-
 5 files changed, 113 insertions(+), 22 deletions(-)

-- 
1.7.9.5

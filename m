From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH] arm: exynos: add generic function to calculate cpu number
Date: Fri, 25 Apr 2014 11:14:13 +0530
Message-ID: <1398404653-14407-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:38392 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807AbaDYFob (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 01:44:31 -0400
Received: by mail-pb0-f52.google.com with SMTP id rq2so2784446pbb.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 22:44:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, Chander Kashyap <chander.kashyap@linaro.org>, Chander Kashyap <k.chander@samsung.com>

The address of cpu power registers in pmu is based on cpu number
offsets. This function calculate the same. This is essentially
required in case of multicluster SoC's e.g Exynos5420.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
Signed-off-by: Chander Kashyap <k.chander@samsung.com>
---
 arch/arm/mach-exynos/regs-pmu.h |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 4f6a256..217da2e 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -313,4 +313,13 @@
 
 #define EXYNOS5_OPTION_USE_RETENTION				(1 << 4)
 
+#include <asm/cputype.h>
+#define MAX_CPUS_IN_CLUSTER	4
+
+static inline unsigned int exynos_pmu_cpunr(unsigned int mpidr)
+{
+	return ((MPIDR_AFFINITY_LEVEL(mpidr, 1) * MAX_CPUS_IN_CLUSTER)
+		 + MPIDR_AFFINITY_LEVEL(mpidr, 0));
+}
+
 #endif /* __ASM_ARCH_REGS_PMU_H */
-- 
1.7.9.5

From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH v5] arm: exynos: generalize power register address calculation
Date: Tue, 22 Apr 2014 17:55:01 +0530
Message-ID: <1398169501-7251-1-git-send-email-chander.kashyap@linaro.org>
References: <1398068989-9905-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:47978 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932195AbaDVMZP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 08:25:15 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so4809418pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 05:25:15 -0700 (PDT)
In-Reply-To: <1398068989-9905-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, Chander Kashyap <chander.kashyap@linaro.org>, Chander Kashyap <k.chander@samsung.com>

Currently status/configuration power register values are hard-coded for cpu1.

Make it generic so that it is useful for SoC's with more than two cpus.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
Signed-off-by: Chander Kashyap <k.chander@samsung.com>
---
changes in v5:
	1. Fix typo: enynos_pmu_cpunr -> exynos_pmu_cpunr
changes in v4:
	1: Dropped changes in platsmp.c and hotplug.c as those are taken care by
	   Tomasz Patches.
	2. Converted ENYNOS_PMU_CPUNR macro to static inline function
changes in v3:
	1. Move cpunr calculation to a macro
	2. Changed printk format specifier from unsigned hex to unsigned decimal
Changes in v2:
	1. Used existing macros for clusterid and cpuid calculation

 arch/arm/mach-exynos/regs-pmu.h |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 4f6a256..f39e78c 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -105,8 +105,13 @@
 #define S5P_GPS_LOWPWR				S5P_PMUREG(0x139C)
 #define S5P_GPS_ALIVE_LOWPWR			S5P_PMUREG(0x13A0)
 
-#define S5P_ARM_CORE1_CONFIGURATION		S5P_PMUREG(0x2080)
-#define S5P_ARM_CORE1_STATUS			S5P_PMUREG(0x2084)
+#define S5P_ARM_CORE0_CONFIGURATION		S5P_PMUREG(0x2000)
+#define S5P_ARM_CORE0_STATUS			S5P_PMUREG(0x2004)
+
+#define S5P_ARM_CORE_CONFIGURATION(_cpunr) \
+		(S5P_ARM_CORE0_CONFIGURATION + 0x80 * (_cpunr))
+#define S5P_ARM_CORE_STATUS(_cpunr) \
+		(S5P_ARM_CORE0_STATUS + 0x80 * (_cpunr))
 
 #define S5P_PAD_RET_MAUDIO_OPTION		S5P_PMUREG(0x3028)
 #define S5P_PAD_RET_GPIO_OPTION			S5P_PMUREG(0x3108)
@@ -313,4 +318,13 @@
 
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

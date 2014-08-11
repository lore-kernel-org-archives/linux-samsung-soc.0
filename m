From: Chander Kashyap <k.chander@samsung.com>
Subject: [PATCH] ARM: Exynos: remove arm diagnostic and power register save/restore code
Date: Mon, 11 Aug 2014 11:52:44 +0530
Message-ID: <1407738165-10139-1-git-send-email-k.chander@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:61028 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaHKGW6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 02:22:58 -0400
Received: by mail-pd0-f173.google.com with SMTP id w10so10247911pde.32
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Aug 2014 23:22:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, Chander Kashyap <k.chander@samsung.com>

As save/restore of arm "diagnostic" and "power" registers is handled by
generic code, so remove the same.

Signed-off-by: Chander Kashyap <k.chander@samsung.com>
---
 arch/arm/mach-exynos/pm.c |   54 ++-------------------------------------------
 1 file changed, 2 insertions(+), 52 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 18646b7..af99c55 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -134,45 +134,6 @@ void exynos_enter_aftr(void)
 	exynos_sys_powerdown_conf(SYS_AFTR);
 }
 
-/* For Cortex-A9 Diagnostic and Power control register */
-static unsigned int save_arm_register[2];
-
-static void exynos_cpu_save_register(void)
-{
-	unsigned long tmp;
-
-	/* Save Power control register */
-	asm ("mrc p15, 0, %0, c15, c0, 0"
-	     : "=r" (tmp) : : "cc");
-
-	save_arm_register[0] = tmp;
-
-	/* Save Diagnostic register */
-	asm ("mrc p15, 0, %0, c15, c0, 1"
-	     : "=r" (tmp) : : "cc");
-
-	save_arm_register[1] = tmp;
-}
-
-static void exynos_cpu_restore_register(void)
-{
-	unsigned long tmp;
-
-	/* Restore Power control register */
-	tmp = save_arm_register[0];
-
-	asm volatile ("mcr p15, 0, %0, c15, c0, 0"
-		      : : "r" (tmp)
-		      : "cc");
-
-	/* Restore Diagnostic register */
-	tmp = save_arm_register[1];
-
-	asm volatile ("mcr p15, 0, %0, c15, c0, 1"
-		      : : "r" (tmp)
-		      : "cc");
-}
-
 static int exynos_cpu_suspend(unsigned long arg)
 {
 #ifdef CONFIG_CACHE_L2X0
@@ -238,9 +199,6 @@ static int exynos_pm_suspend(void)
 	tmp = (S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0);
 	pmu_raw_writel(tmp, S5P_CENTRAL_SEQ_OPTION);
 
-	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
-		exynos_cpu_save_register();
-
 	return 0;
 }
 
@@ -272,9 +230,6 @@ static void exynos_pm_resume(void)
 	if (exynos_pm_central_resume())
 		goto early_wakeup;
 
-	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
-		exynos_cpu_restore_register();
-
 	/* For release retention */
 
 	pmu_raw_writel((1 << 28), S5P_PAD_RET_MAUDIO_OPTION);
@@ -376,19 +331,14 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 
 	switch (cmd) {
 	case CPU_PM_ENTER:
-		if (cpu == 0) {
+		if (cpu == 0)
 			exynos_pm_central_suspend();
-			if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
-				exynos_cpu_save_register();
-		}
 		break;
 
 	case CPU_PM_EXIT:
 		if (cpu == 0) {
-			if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
+			if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
 				scu_enable(S5P_VA_SCU);
-				exynos_cpu_restore_register();
-			}
 			exynos_pm_central_resume();
 		}
 		break;
-- 
1.7.9.5

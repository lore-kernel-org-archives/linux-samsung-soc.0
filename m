From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 07/17] ARM: exynos: cpuidle: Use the cpu_pm notifier
Date: Fri,  4 Apr 2014 09:47:53 +0200
Message-ID: <1396597683-6969-8-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:62824 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDDHr5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:47:57 -0400
Received: by mail-wi0-f182.google.com with SMTP id d1so687025wiv.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:56 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Use the cpu_pm_enter/exit notifier to group some pm code inside the pm file.

The save and restore code is duplicated across pm.c and cpuidle.c. By using
the cpu_pm notifier, we can factor out the routine.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   24 ------------------------
 arch/arm/mach-exynos/pm.c      |   23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index a1e1882..4b090cf 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -66,26 +66,6 @@ static void exynos_set_wakeupmask(void)
 	__raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
 }
 
-static unsigned int g_pwr_ctrl, g_diag_reg;
-
-static void save_cpu_arch_register(void)
-{
-	/*read power control register*/
-	asm("mrc p15, 0, %0, c15, c0, 0" : "=r"(g_pwr_ctrl) : : "cc");
-	/*read diagnostic register*/
-	asm("mrc p15, 0, %0, c15, c0, 1" : "=r"(g_diag_reg) : : "cc");
-	return;
-}
-
-static void restore_cpu_arch_register(void)
-{
-	/*write power control register*/
-	asm("mcr p15, 0, %0, c15, c0, 0" : : "r"(g_pwr_ctrl) : "cc");
-	/*write diagnostic register*/
-	asm("mcr p15, 0, %0, c15, c0, 1" : : "r"(g_diag_reg) : "cc");
-	return;
-}
-
 static int idle_finisher(unsigned long flags)
 {
 	exynos_set_wakeupmask();
@@ -107,8 +87,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 {
 	unsigned long tmp;
 
-	save_cpu_arch_register();
-
 	/* Setting Central Sequence Register for power down mode */
 	tmp = __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
 	tmp &= ~S5P_CENTRAL_LOWPWR_CFG;
@@ -123,8 +101,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 #endif
 	cpu_pm_exit();
 
-	restore_cpu_arch_register();
-
 	/*
 	 * If PMU failed while entering sleep mode, WFI will be
 	 * ignored by PMU and then exiting cpu_do_idle().
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 2326c67..b2a075e 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
+#include <linux/cpu_pm.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/clk.h>
@@ -376,16 +377,38 @@ early_wakeup:
 	return;
 }
 
+static int exynos_cpu_pm_notifier(struct notifier_block *self,
+				  unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		exynos_cpu_save_register();
+		break;
+
+	case CPU_PM_EXIT:
+		exynos_cpu_restore_register();
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 static struct syscore_ops exynos_pm_syscore_ops = {
 	.suspend	= exynos_pm_suspend,
 	.resume		= exynos_pm_resume,
 };
 
+static struct notifier_block exynos_cpu_pm_notifier_block = {
+	.notifier_call = exynos_cpu_pm_notifier,
+};
 static __init int exynos_pm_syscore_init(void)
 {
 	if (soc_is_exynos5440())
 		return 0;
 
+	if (!soc_is_exynos5250())
+		cpu_pm_register_notifier(&exynos_cpu_pm_notifier_block);
+
 	register_syscore_ops(&exynos_pm_syscore_ops);
 	return 0;
 }
-- 
1.7.9.5

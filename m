From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 11/17] ARM: exynos: cpuidle: Move the power sequence call in the cpu_pm notifier
Date: Fri,  4 Apr 2014 09:47:57 +0200
Message-ID: <1396597683-6969-12-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:61004 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138AbaDDHsD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:48:03 -0400
Received: by mail-wi0-f176.google.com with SMTP id r20so683928wiv.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:48:01 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

The code to initiate and exit the powerdown sequence is the same in pm.c and
cpuidle.c.

Let's split the common part in the pm.c and reuse it from the cpu_pm notifier.

That is one more step forward to make the cpuidle driver arch indenpendant.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   21 ---------------------
 arch/arm/mach-exynos/pm.c      |   22 ++++++++++++++++++----
 2 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 7014654..635b09c 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -77,31 +77,10 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index)
 {
-	unsigned long tmp;
-
-	/* Setting Central Sequence Register for power down mode */
-	tmp = __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
-	tmp &= ~S5P_CENTRAL_LOWPWR_CFG;
-	__raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
-
 	cpu_pm_enter();
 	cpu_suspend(0, idle_finisher);
 	cpu_pm_exit();
 
-	/*
-	 * If PMU failed while entering sleep mode, WFI will be
-	 * ignored by PMU and then exiting cpu_do_idle().
-	 * S5P_CENTRAL_LOWPWR_CFG bit will not be set automatically
-	 * in this situation.
-	 */
-	tmp = __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
-	if (!(tmp & S5P_CENTRAL_LOWPWR_CFG)) {
-		tmp |= S5P_CENTRAL_LOWPWR_CFG;
-		__raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
-		/* Clear wakeup state register */
-		__raw_writel(0x0, S5P_WAKEUP_STAT);
-	}
-
 	return index;
 }
 
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 3f2ddef..b364212 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -301,15 +301,19 @@ static __init int exynos_pm_drvinit(void)
 }
 arch_initcall(exynos_pm_drvinit);
 
-static int exynos_pm_suspend(void)
+static void exynos_pm_central_suspend(void)
 {
 	unsigned long tmp;
 
 	/* Setting Central Sequence Register for power down mode */
-
 	tmp = __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
 	tmp &= ~S5P_CENTRAL_LOWPWR_CFG;
 	__raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
+}
+
+static int exynos_pm_suspend(void)
+{
+	unsigned long tmp;
 
 	/* Setting SEQ_OPTION register */
 
@@ -322,7 +326,7 @@ static int exynos_pm_suspend(void)
 	return 0;
 }
 
-static void exynos_pm_resume(void)
+static int exynos_pm_central_resume(void)
 {
 	unsigned long tmp;
 
@@ -339,9 +343,17 @@ static void exynos_pm_resume(void)
 		/* clear the wakeup state register */
 		__raw_writel(0x0, S5P_WAKEUP_STAT);
 		/* No need to perform below restore code */
-		goto early_wakeup;
+		return -1;
 	}
 
+	return 0;
+}
+
+static void exynos_pm_resume(void)
+{
+	if (exynos_pm_central_resume())
+		goto early_wakeup;
+
 	if (!soc_is_exynos5250())
 		exynos_cpu_restore_register();
 
@@ -385,6 +397,7 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 {
 	switch (cmd) {
 	case CPU_PM_ENTER:
+		exynos_pm_central_suspend();
 		exynos_cpu_save_register();
 		exynos_set_wakeupmask();
 		break;
@@ -392,6 +405,7 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 	case CPU_PM_EXIT:
 		scu_enable(S5P_VA_SCU);
 		exynos_cpu_restore_register();
+		exynos_pm_central_resume();
 		break;
 	}
 
-- 
1.7.9.5

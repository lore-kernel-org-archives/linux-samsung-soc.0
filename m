From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 08/20] ARM: exynos: cpuidle: Move scu_enable in the cpu_pm notifier
Date: Thu, 10 Apr 2014 11:55:39 +0200
Message-ID: <1397123751-1957-9-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:46291 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965605AbaDJJzp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:55:45 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so3683701wgh.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:55:44 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

We make the cpuidle code less arch dependent.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    6 ------
 arch/arm/mach-exynos/pm.c      |    4 ++++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 7f1f4ef..ce31004 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 
 #include <asm/proc-fns.h>
-#include <asm/smp_scu.h>
 #include <asm/suspend.h>
 #include <asm/unified.h>
 #include <asm/cpuidle.h>
@@ -93,11 +92,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 
 	cpu_pm_enter();
 	cpu_suspend(0, idle_finisher);
-
-#ifdef CONFIG_SMP
-	if (!soc_is_exynos5250())
-		scu_enable(S5P_VA_SCU);
-#endif
 	cpu_pm_exit();
 
 	/*
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 67d75fe..aba577f 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -336,6 +336,10 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 
 	case CPU_PM_EXIT:
 		if (cpu == 0) {
+#ifdef CONFIG_SMP
+			if (!soc_is_exynos5250())
+				scu_enable(S5P_VA_SCU);
+#endif
 			exynos_cpu_restore_register();
 		}
 		break;
-- 
1.7.9.5

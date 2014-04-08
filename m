From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V3 09/17] ARM: exynos: cpuidle: Remove ifdef for scu_enable
Date: Tue,  8 Apr 2014 14:19:31 +0200
Message-ID: <1396959579-18268-10-git-send-email-daniel.lezcano@linaro.org>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:43822 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756636AbaDHMTk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 08:19:40 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so842244wgh.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2014 05:19:39 -0700 (PDT)
In-Reply-To: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

The scu_enable function is already a noop in the scu's header file is
CONFIG_SMP=n, so no need to use these macros in the code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/mach-exynos/pm.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index aba577f..9773a00 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -244,7 +244,7 @@ static void exynos_pm_resume(void)
 
 	s3c_pm_do_restore_core(exynos_core_save, ARRAY_SIZE(exynos_core_save));
 
-	if (IS_ENABLED(CONFIG_SMP) && !soc_is_exynos5250())
+	if (!soc_is_exynos5250())
 		scu_enable(S5P_VA_SCU);
 
 early_wakeup:
@@ -336,10 +336,8 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 
 	case CPU_PM_EXIT:
 		if (cpu == 0) {
-#ifdef CONFIG_SMP
 			if (!soc_is_exynos5250())
 				scu_enable(S5P_VA_SCU);
-#endif
 			exynos_cpu_restore_register();
 		}
 		break;
-- 
1.7.9.5

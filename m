From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 09/20] ARM: exynos: cpuidle: Remove ifdef for scu_enable
Date: Thu, 10 Apr 2014 11:55:40 +0200
Message-ID: <1397123751-1957-10-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:60097 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965625AbaDJJzr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:55:47 -0400
Received: by mail-wi0-f180.google.com with SMTP id q5so4665001wiv.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:55:46 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

The scu_enable function is already a noop in the scu's header file is
CONFIG_SMP=n, so no need to use these macros in the code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
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

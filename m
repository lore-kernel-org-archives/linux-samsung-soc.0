From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 09/17] ARM: exynos: cpuidle: Remove ifdef for scu_enable
Date: Fri,  4 Apr 2014 09:47:55 +0200
Message-ID: <1396597683-6969-10-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:58647 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDDHsA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:48:00 -0400
Received: by mail-wg0-f43.google.com with SMTP id x13so2961104wgg.26
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:59 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

The scu_enable function is already a noop in the scu's header file is
CONFIG_SMP=n, so no need to use these macros in the code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/pm.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index f43a004..c0d8640 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -363,10 +363,7 @@ static void exynos_pm_resume(void)
 
 	if (!soc_is_exynos5250()) {
 		exynos4_restore_pll();
-
-#ifdef CONFIG_SMP
 		scu_enable(S5P_VA_SCU);
-#endif
 	}
 
 early_wakeup:
@@ -386,9 +383,7 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 		break;
 
 	case CPU_PM_EXIT:
-#ifdef CONFIG_SMP
 		scu_enable(S5P_VA_SCU);
-#endif
 		exynos_cpu_restore_register();
 		break;
 	}
-- 
1.7.9.5

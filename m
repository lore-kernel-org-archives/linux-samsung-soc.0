From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 08/17] ARM: exynos: cpuidle: Move scu_enable in the cpu_pm notifier
Date: Fri,  4 Apr 2014 09:47:54 +0200
Message-ID: <1396597683-6969-9-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:51957 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDDHr7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:47:59 -0400
Received: by mail-wi0-f175.google.com with SMTP id cc10so686291wib.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:58 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

We make the cpuidle code less arch dependent.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    6 ------
 arch/arm/mach-exynos/pm.c      |    3 +++
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 4b090cf..c63ad05 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 
 #include <asm/proc-fns.h>
-#include <asm/smp_scu.h>
 #include <asm/suspend.h>
 #include <asm/unified.h>
 #include <asm/cpuidle.h>
@@ -94,11 +93,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 
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
index b2a075e..f43a004 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -386,6 +386,9 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
 		break;
 
 	case CPU_PM_EXIT:
+#ifdef CONFIG_SMP
+		scu_enable(S5P_VA_SCU);
+#endif
 		exynos_cpu_restore_register();
 		break;
 	}
-- 
1.7.9.5

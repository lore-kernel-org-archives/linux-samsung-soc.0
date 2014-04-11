From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 06/20] ARM: exynos: cpuidle: Move some code inside the idle_finisher
Date: Fri, 11 Apr 2014 12:40:01 +0200
Message-ID: <1397212815-16068-7-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:56637 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934703AbaDKKkF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:05 -0400
Received: by mail-we0-f179.google.com with SMTP id x48so5153919wes.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:04 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Move the code around to differentiate different section of code and prepare it
to be factored out in the next patches.

The call order changed but hat doesn't have a side effect because they are
independent. The important call is cpu_do_idle() which must be done the last.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index f565186..4d8bcfd 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -68,7 +68,16 @@ static void restore_cpu_arch_register(void)
 
 static int idle_finisher(unsigned long flags)
 {
+	exynos_set_wakeupmask();
+
+	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
+	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
+
+	/* Set value of power down register for aftr mode */
+	exynos_sys_powerdown_conf(SYS_AFTR);
+
 	cpu_do_idle();
+
 	return 1;
 }
 
@@ -78,14 +87,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 {
 	unsigned long tmp;
 
-	exynos_set_wakeupmask();
-
-	/* Set value of power down register for aftr mode */
-	exynos_sys_powerdown_conf(SYS_AFTR);
-
-	__raw_writel(virt_to_phys(exynos_cpu_resume), REG_DIRECTGO_ADDR);
-	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
-
 	save_cpu_arch_register();
 
 	/* Setting Central Sequence Register for power down mode */
-- 
1.7.9.5

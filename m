From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 05/17] ARM: exynos: cpuidle: Move some code inside the idle_finisher
Date: Fri,  4 Apr 2014 09:47:51 +0200
Message-ID: <1396597683-6969-6-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:53480 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDDHrz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:47:55 -0400
Received: by mail-wg0-f42.google.com with SMTP id y10so2990953wgg.25
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:54 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Move the code around to differentiate different section of code and prepare it
to be factored out in the next patches.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 18f6aba..9cd1ed9 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -88,7 +88,16 @@ static void restore_cpu_arch_register(void)
 
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
 
@@ -98,14 +107,6 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 {
 	unsigned long tmp;
 
-	exynos_set_wakeupmask();
-
-	/* Set value of power down register for aftr mode */
-	exynos_sys_powerdown_conf(SYS_AFTR);
-
-	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
-	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
-
 	save_cpu_arch_register();
 
 	/* Setting Central Sequence Register for power down mode */
-- 
1.7.9.5

From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 10/17] ARM: exynos: cpuidle: Move exynos_set_wakeupmask in the cpu_pm notifier
Date: Fri,  4 Apr 2014 09:47:56 +0200
Message-ID: <1396597683-6969-11-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:59969 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbaDDHsB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:48:01 -0400
Received: by mail-wi0-f171.google.com with SMTP id q5so682178wiv.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:48:00 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Let's encapsulate more the PM code inside the PM file by moving the
'exynos_set_wakeupmask' function inside the pm.c and the call in the cpu_pm
notifier.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    7 -------
 arch/arm/mach-exynos/pm.c      |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index c63ad05..7014654 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -59,15 +59,8 @@
 #define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
 #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
 
-/* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
-static void exynos_set_wakeupmask(void)
-{
-	__raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
-}
-
 static int idle_finisher(unsigned long flags)
 {
-	exynos_set_wakeupmask();
 
 	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
 	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index c0d8640..3f2ddef 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -374,12 +374,19 @@ early_wakeup:
 	return;
 }
 
+/* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
+static void exynos_set_wakeupmask(void)
+{
+	__raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
+}
+
 static int exynos_cpu_pm_notifier(struct notifier_block *self,
 				  unsigned long cmd, void *v)
 {
 	switch (cmd) {
 	case CPU_PM_ENTER:
 		exynos_cpu_save_register();
+		exynos_set_wakeupmask();
 		break;
 
 	case CPU_PM_EXIT:
-- 
1.7.9.5

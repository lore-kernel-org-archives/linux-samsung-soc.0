From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V2 03/17] ARM: exynos: cpuidle: change function name prefix
Date: Fri,  4 Apr 2014 15:42:55 +0200
Message-ID: <1396618989-2897-4-git-send-email-daniel.lezcano@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:38759 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384AbaDDNm7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 09:42:59 -0400
Received: by mail-wg0-f46.google.com with SMTP id b13so3507029wgh.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 06:42:58 -0700 (PDT)
In-Reply-To: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

The driver was initially written for exynos4 but the driver is used also for
exynos5.

Change the function prefix name exynos4 -> exynos

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index b7cd75b..16e3325 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -60,7 +60,7 @@
 #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
 
 /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
-static void exynos4_set_wakeupmask(void)
+static void exynos_set_wakeupmask(void)
 {
 	__raw_writel(0x0000ff3e, S5P_WAKEUP_MASK);
 }
@@ -91,13 +91,13 @@ static int idle_finisher(unsigned long flags)
 	return 1;
 }
 
-static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
+static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index)
 {
 	unsigned long tmp;
 
-	exynos4_set_wakeupmask();
+	exynos_set_wakeupmask();
 
 	/* Set value of power down register for aftr mode */
 	exynos_sys_powerdown_conf(SYS_AFTR);
@@ -141,7 +141,7 @@ static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
 	return index;
 }
 
-static int exynos4_enter_lowpower(struct cpuidle_device *dev,
+static int exynos_enter_lowpower(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index)
 {
@@ -154,7 +154,7 @@ static int exynos4_enter_lowpower(struct cpuidle_device *dev,
 	if (new_index == 0)
 		return arm_cpuidle_simple_enter(dev, drv, new_index);
 	else
-		return exynos4_enter_core0_aftr(dev, drv, new_index);
+		return exynos_enter_core0_aftr(dev, drv, new_index);
 }
 
 static void __init exynos5_core_down_clk(void)
@@ -189,13 +189,13 @@ static void __init exynos5_core_down_clk(void)
 	__raw_writel(tmp, EXYNOS5_PWR_CTRL2);
 }
 
-static struct cpuidle_driver exynos4_idle_driver = {
-	.name			= "exynos4_idle",
+static struct cpuidle_driver exynos_idle_driver = {
+	.name			= "exynos_idle",
 	.owner			= THIS_MODULE,
 	.states = {
 		[0] = ARM_CPUIDLE_WFI_STATE,
 		[1] = {
-			.enter			= exynos4_enter_lowpower,
+			.enter			= exynos_enter_lowpower,
 			.exit_latency		= 300,
 			.target_residency	= 100000,
 			.flags			= CPUIDLE_FLAG_TIME_VALID,
@@ -215,9 +215,9 @@ static int exynos_cpuidle_probe(struct platform_device *pdev)
 		exynos5_core_down_clk();
 
 	if (soc_is_exynos5440())
-		exynos4_idle_driver.state_count = 1;
+		exynos_idle_driver.state_count = 1;
 
-	ret = cpuidle_register(&exynos4_idle_driver, NULL);
+	ret = cpuidle_register(&exynos_idle_driver, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register cpuidle driver\n");
 		return ret;
-- 
1.7.9.5

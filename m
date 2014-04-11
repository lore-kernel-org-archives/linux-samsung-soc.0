From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 02/20] ARM: exynos: cpuidle: Prevent forward declaration
Date: Fri, 11 Apr 2014 12:39:57 +0200
Message-ID: <1397212815-16068-3-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:55063 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932575AbaDKKkA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:00 -0400
Received: by mail-wg0-f46.google.com with SMTP id b13so5246112wgh.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:39:59 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Move the structure below the 'exynos4_enter_lowpower' function so no more
need of forward declaration.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |   40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 3e260ba..17df0d8 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -40,30 +40,8 @@
 
 #define S5P_CHECK_AFTR		0xFCBA0D10
 
-static int exynos4_enter_lowpower(struct cpuidle_device *dev,
-				struct cpuidle_driver *drv,
-				int index);
-
 static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_device);
 
-static struct cpuidle_driver exynos4_idle_driver = {
-	.name			= "exynos4_idle",
-	.owner			= THIS_MODULE,
-	.states = {
-		[0] = ARM_CPUIDLE_WFI_STATE,
-		[1] = {
-			.enter			= exynos4_enter_lowpower,
-			.exit_latency		= 300,
-			.target_residency	= 100000,
-			.flags			= CPUIDLE_FLAG_TIME_VALID,
-			.name			= "C1",
-			.desc			= "ARM power down",
-		},
-	},
-	.state_count = 2,
-	.safe_state_index = 0,
-};
-
 /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
 static void exynos4_set_wakeupmask(void)
 {
@@ -162,6 +140,24 @@ static int exynos4_enter_lowpower(struct cpuidle_device *dev,
 		return exynos4_enter_core0_aftr(dev, drv, new_index);
 }
 
+static struct cpuidle_driver exynos4_idle_driver = {
+	.name			= "exynos4_idle",
+	.owner			= THIS_MODULE,
+	.states = {
+		[0] = ARM_CPUIDLE_WFI_STATE,
+		[1] = {
+			.enter			= exynos4_enter_lowpower,
+			.exit_latency		= 300,
+			.target_residency	= 100000,
+			.flags			= CPUIDLE_FLAG_TIME_VALID,
+			.name			= "C1",
+			.desc			= "ARM power down",
+		},
+	},
+	.state_count = 2,
+	.safe_state_index = 0,
+};
+
 static int exynos_cpuidle_probe(struct platform_device *pdev)
 {
 	int cpu_id, ret;
-- 
1.7.9.5

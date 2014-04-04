From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 01/17] ARM: exynos: cpuidle: Prevent forward declaration
Date: Fri,  4 Apr 2014 09:47:47 +0200
Message-ID: <1396597683-6969-2-git-send-email-daniel.lezcano@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:62221 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbaDDHru (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 03:47:50 -0400
Received: by mail-wi0-f179.google.com with SMTP id z2so689737wiv.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 00:47:49 -0700 (PDT)
In-Reply-To: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Move the structure below the 'exynos4_enter_lowpower' function so no more
need of forward declaration.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index f57cb91..bd2142a 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -60,30 +60,8 @@
 #define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
 #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
 
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
@@ -214,6 +192,24 @@ static void __init exynos5_core_down_clk(void)
 	__raw_writel(tmp, EXYNOS5_PWR_CTRL2);
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

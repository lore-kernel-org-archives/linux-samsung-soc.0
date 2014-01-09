From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH 5/6] arm: exynos4-dt: statically add platform device for cpufreq-cpu0 platform driver
Date: Thu,  9 Jan 2014 21:29:24 +0530
Message-ID: <1389283165-17708-6-git-send-email-thomas.ab@samsung.com>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:58748 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751541AbaAIQAt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 11:00:49 -0500
In-Reply-To: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, shawn.guo@linaro.org, viresh.kumar@linaro.org

In order to use the cpufreq-cpu0 driver on Exynos4 based platforms,
statically add the platform device for cpufreq-cpu0 platform driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index d3e54b7..8b8ad41 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -19,11 +19,17 @@
 
 #include "common.h"
 
+static struct platform_device cpufreq_device = {
+	.name		= "cpufreq-cpu0",
+	.id		= -1,
+};
+
 static void __init exynos4_dt_machine_init(void)
 {
 	exynos_cpuidle_init();
 	exynos_cpufreq_init();
 
+	platform_device_register(&cpufreq_device);
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
 
-- 
1.6.6.rc2

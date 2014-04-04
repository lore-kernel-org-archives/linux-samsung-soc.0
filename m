From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V2 15/17] ARM: exynos: cpuidle: Pass the AFTR callback to the platform_data
Date: Fri,  4 Apr 2014 15:43:07 +0200
Message-ID: <1396618989-2897-16-git-send-email-daniel.lezcano@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:55508 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318AbaDDNnS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 09:43:18 -0400
Received: by mail-wi0-f178.google.com with SMTP id bs8so1287422wib.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 06:43:17 -0700 (PDT)
In-Reply-To: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

No more dependency on the arch code. The platform_data field is used to set the
PM callback as the other cpuidle drivers.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-exynos/common.h  |    1 +
 arch/arm/mach-exynos/cpuidle.c |    6 ++++--
 arch/arm/mach-exynos/exynos.c  |    5 +++--
 arch/arm/mach-exynos/pmu.c     |    6 ++++++
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 9ef3f83..7d9432e 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -62,5 +62,6 @@ struct exynos_pmu_conf {
 };
 
 extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
+extern void exynos_sys_powerdown_aftr(void);
 
 #endif /* __ARCH_ARM_MACH_EXYNOS_COMMON_H */
diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 4b94181..149fdeb 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -18,12 +18,12 @@
 
 #include <plat/cpu.h>
 
-#include "common.h"
+static void (*exynos_aftr)(void);
 
 static int idle_finisher(unsigned long flags)
 {
 	/* Set value of power down register for aftr mode */
-	exynos_sys_powerdown_conf(SYS_AFTR);
+	exynos_aftr();
 	cpu_do_idle();
 	return 1;
 }
@@ -80,6 +80,8 @@ static int exynos_cpuidle_probe(struct platform_device *pdev)
 	if (soc_is_exynos5440())
 		exynos_idle_driver.state_count = 1;
 
+	exynos_aftr = (void *)(pdev->dev.platform_data);
+
 	ret = cpuidle_register(&exynos_idle_driver, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register cpuidle driver\n");
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index b567361..451b371 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -221,8 +221,9 @@ void exynos_restart(enum reboot_mode mode, const char *cmd)
 }
 
 static struct platform_device exynos_cpuidle = {
-	.name		= "exynos_cpuidle",
-	.id		= -1,
+	.name              = "exynos_cpuidle",
+	.dev.platform_data = exynos_sys_powerdown_aftr,
+	.id                = -1,
 };
 
 void __init exynos_cpuidle_init(void)
diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index 05c7ce1..fd1ae22 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -389,6 +389,12 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 	}
 }
 
+/* Set value of power down register for aftr mode */
+void exynos_sys_powerdown_aftr(void)
+{
+	exynos_sys_powerdown_conf(SYS_AFTR);
+}
+
 static int __init exynos_pmu_init(void)
 {
 	unsigned int value;
-- 
1.7.9.5

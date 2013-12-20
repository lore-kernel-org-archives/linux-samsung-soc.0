From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH] ARM: EXYNOS: Kill exynos_pm_late_initcall()
Date: Fri, 20 Dec 2013 22:25:58 +0100
Message-ID: <1387574758-28489-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:36247 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751832Ab3LTV0I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 16:26:08 -0500
Received: by mail-we0-f171.google.com with SMTP id q58so3050018wes.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 13:26:06 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The only thing exynos_pm_late_initcall() does is calling
pm_genpd_poweroff_unused(), which is already stubbed when
CONFIG_PM_GENERIC_DOMAINS is not enabled. So replace
exynos_pm_late_initcall() with a direct call to
pm_genpd_poweroff_unused().

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-exynos/common.c     |    3 ++-
 arch/arm/mach-exynos/common.h     |    6 ------
 arch/arm/mach-exynos/pm_domains.c |    6 ------
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 8ae4797..09e6898 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -23,6 +23,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_irq.h>
+#include <linux/pm_domain.h>
 #include <linux/export.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
@@ -324,7 +325,7 @@ void __init exynos_init_late(void)
 		/* to be supported later */
 		return;
 
-	exynos_pm_late_initcall();
+	pm_genpd_poweroff_unused();
 }
 
 static int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index ff9b6a9..0c31b34 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -26,12 +26,6 @@ void exynos_init_late(void);
 
 void exynos_firmware_init(void);
 
-#ifdef CONFIG_PM_GENERIC_DOMAINS
-int exynos_pm_late_initcall(void);
-#else
-static inline int exynos_pm_late_initcall(void) { return 0; }
-#endif
-
 extern struct smp_operations exynos_smp_ops;
 
 extern void exynos_cpu_die(unsigned int cpu);
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index ff50836..8fd2488 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -184,9 +184,3 @@ static __init int exynos4_pm_init_power_domain(void)
 	return 0;
 }
 arch_initcall(exynos4_pm_init_power_domain);
-
-int __init exynos_pm_late_initcall(void)
-{
-	pm_genpd_poweroff_unused();
-	return 0;
-}
-- 
1.7.4.1

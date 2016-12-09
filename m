From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] ARM: EXYNOS: move exynos_pm_init into pm.c and remove
 init_late hook
Date: Fri, 09 Dec 2016 16:01:17 +0530
Message-ID: <1481279477-16463-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58343 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932349AbcLIK3A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 05:29:00 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHW015WHYGAK210@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2016 19:28:58 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

We can safely move exynos_pm_init into pm.c as late_initcall and remove
init_late hook from exynos.c. This will remove extern declarations from
common.h and move PM specific operations in pm.c rather being scattered
across many files.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/common.h  |  6 ------
 arch/arm/mach-exynos/exynos.c  | 10 ----------
 arch/arm/mach-exynos/suspend.c | 13 ++++++++++---
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index fb12d11..cfd55ba 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -134,12 +134,6 @@ void exynos_clear_boot_flag(unsigned int cpu, unsigned int mode);
 
 extern u32 exynos_get_eint_wake_mask(void);
 
-#ifdef CONFIG_PM_SLEEP
-extern void __init exynos_pm_init(void);
-#else
-static inline void exynos_pm_init(void) {}
-#endif
-
 extern void exynos_cpu_resume(void);
 extern void exynos_cpu_resume_ns(void);
 
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index fa08ef9..040ea66 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -58,15 +58,6 @@ void __init exynos_sysram_init(void)
 	}
 }
 
-static void __init exynos_init_late(void)
-{
-	if (of_machine_is_compatible("samsung,exynos5440"))
-		/* to be supported later */
-		return;
-
-	exynos_pm_init();
-}
-
 static int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
 					int depth, void *data)
 {
@@ -216,7 +207,6 @@ DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Flattened Device Tree)")
 	.init_early	= exynos_firmware_init,
 	.init_irq	= exynos_init_irq,
 	.init_machine	= exynos_dt_machine_init,
-	.init_late	= exynos_init_late,
 	.dt_compat	= exynos_dt_compat,
 	.dt_fixup	= exynos_dt_fixup,
 MACHINE_END
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 73df9f3..f318b08 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -698,21 +698,25 @@ static const struct of_device_id exynos_pmu_of_device_ids[] __initconst = {
 
 static struct syscore_ops exynos_pm_syscore_ops;
 
-void __init exynos_pm_init(void)
+static int __init exynos_pm_init(void)
 {
 	const struct of_device_id *match;
 	struct device_node *np;
 	u32 tmp;
 
+	if (of_machine_is_compatible("samsung,exynos5440"))
+		/* to be supported later */
+		return 0;
+
 	np = of_find_matching_node_and_match(NULL, exynos_pmu_of_device_ids, &match);
 	if (!np) {
 		pr_err("Failed to find PMU node\n");
-		return;
+		return -ENODEV;
 	}
 
 	if (WARN_ON(!of_find_property(np, "interrupt-controller", NULL))) {
 		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
-		return;
+		return -ENODEV;
 	}
 
 	pm_data = (const struct exynos_pm_data *) match->data;
@@ -727,4 +731,7 @@ void __init exynos_pm_init(void)
 
 	register_syscore_ops(&exynos_pm_syscore_ops);
 	suspend_set_ops(&exynos_suspend_ops);
+
+	return 0;
 }
+late_initcall(exynos_pm_init);
-- 
2.7.4

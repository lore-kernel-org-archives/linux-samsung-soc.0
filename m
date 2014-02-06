From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 10/12] ARM: EXYNOS: Remove PM initcalls and useless
 indirection
Date: Thu, 06 Feb 2014 20:12:55 +0100
Message-ID: <1391713977-22300-11-git-send-email-t.figa@samsung.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62950 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756847AbaBFTNM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 14:13:12 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00J289DT6LB0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 19:13:05 +0000 (GMT)
In-reply-to: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch simplifies Exynos PM initialization and makes it
multiplatform friendly by replacing initcalls used originally to invoke
all the initialization code with explicit function calls.

In addition, an useless subsys_interface is removed, as all its .add_dev
callback did was setting two function pointers.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c |  1 +
 arch/arm/mach-exynos/common.h |  6 ++++++
 arch/arm/mach-exynos/pm.c     | 50 +++++++++++--------------------------------
 3 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index f18be40..fb4e7dc 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -315,6 +315,7 @@ void __init exynos_init_late(void)
 		return;
 
 	pm_genpd_poweroff_unused();
+	exynos_pm_init();
 }
 
 static int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index f76967b..82e08fb 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -27,6 +27,12 @@ void exynos_init_late(void);
 
 void exynos_firmware_init(void);
 
+#ifdef CONFIG_PM_SLEEP
+extern void __init exynos_pm_init(void);
+#else
+static inline void exynos_pm_init(void) {}
+#endif
+
 extern struct smp_operations exynos_smp_ops;
 
 extern void exynos_cpu_die(unsigned int cpu);
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index ba18214..596ed13 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -92,39 +92,6 @@ static void exynos_pm_prepare(void)
 	__raw_writel(virt_to_phys(s3c_cpu_resume), S5P_INFORM0);
 }
 
-static int exynos_pm_add(struct device *dev, struct subsys_interface *sif)
-{
-	pm_cpu_prep = exynos_pm_prepare;
-	pm_cpu_sleep = exynos_cpu_suspend;
-
-	return 0;
-}
-
-static struct subsys_interface exynos_pm_interface = {
-	.name		= "exynos_pm",
-	.subsys		= &exynos_subsys,
-	.add_dev	= exynos_pm_add,
-};
-
-static __init int exynos_pm_drvinit(void)
-{
-	unsigned int tmp;
-
-	if (soc_is_exynos5440())
-		return 0;
-
-	s3c_pm_init();
-
-	/* All wakeup disable */
-
-	tmp = __raw_readl(S5P_WAKEUP_MASK);
-	tmp |= ((0xFF << 8) | (0x1F << 1));
-	__raw_writel(tmp, S5P_WAKEUP_MASK);
-
-	return subsys_interface_register(&exynos_pm_interface);
-}
-arch_initcall(exynos_pm_drvinit);
-
 static int exynos_pm_suspend(void)
 {
 	unsigned long tmp;
@@ -220,12 +187,19 @@ static struct syscore_ops exynos_pm_syscore_ops = {
 	.resume		= exynos_pm_resume,
 };
 
-static __init int exynos_pm_syscore_init(void)
+void __init exynos_pm_init(void)
 {
-	if (soc_is_exynos5440())
-		return 0;
+	u32 tmp;
+
+	pm_cpu_prep = exynos_pm_prepare;
+	pm_cpu_sleep = exynos_cpu_suspend;
+
+	s3c_pm_init();
+
+	/* All wakeup disable */
+	tmp = __raw_readl(S5P_WAKEUP_MASK);
+	tmp |= ((0xFF << 8) | (0x1F << 1));
+	__raw_writel(tmp, S5P_WAKEUP_MASK);
 
 	register_syscore_ops(&exynos_pm_syscore_ops);
-	return 0;
 }
-arch_initcall(exynos_pm_syscore_init);
-- 
1.8.5.2

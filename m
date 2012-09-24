From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/6] ARM: EXYNOS: Add support for secondary CPU bring-up on
 Exynos4412
Date: Mon, 24 Sep 2012 16:28:30 +0200
Message-ID: <1348496913-25422-4-git-send-email-t.figa@samsung.com>
References: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25369 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238Ab2IXO3V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 10:29:21 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAU00LMGYVTDP10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:28:56 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAU0018OYVOXC80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:28:55 +0900 (KST)
In-reply-to: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, t.figa@samsung.com

Exynos4412 uses different information register for each core. This patch
adjusts the bring-up code to take that into account.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 36c3984..a7f4031 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -34,8 +34,21 @@
 
 extern void exynos4_secondary_startup(void);
 
-#define CPU1_BOOT_REG		(samsung_rev() == EXYNOS4210_REV_1_1 ? \
-				S5P_INFORM5 : S5P_VA_SYSRAM)
+static inline void __iomem *cpu_boot_reg_base(void)
+{
+	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_1_1)
+		return S5P_INFORM5;
+	return S5P_VA_SYSRAM;
+}
+
+static inline void __iomem *cpu_boot_reg(int cpu)
+{
+	void __iomem *boot_reg;
+	boot_reg = cpu_boot_reg_base();
+	if (soc_is_exynos4412())
+		boot_reg += 4*cpu;
+	return boot_reg;
+}
 
 /*
  * control for which core is the next to come out of the secondary
@@ -89,6 +102,7 @@ void __cpuinit platform_secondary_init(unsigned int cpu)
 int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	unsigned long timeout;
+	unsigned long phys_cpu = cpu_logical_map(cpu);
 
 	/*
 	 * Set synchronisation state between this boot processor
@@ -104,7 +118,7 @@ int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
 	 * Note that "pen_release" is the hardware CPU ID, whereas
 	 * "cpu" is Linux's internal ID.
 	 */
-	write_pen_release(cpu_logical_map(cpu));
+	write_pen_release(phys_cpu);
 
 	if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
 		__raw_writel(S5P_CORE_LOCAL_PWR_EN,
@@ -138,7 +152,7 @@ int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
 		smp_rmb();
 
 		__raw_writel(virt_to_phys(exynos4_secondary_startup),
-			CPU1_BOOT_REG);
+							cpu_boot_reg(phys_cpu));
 		gic_raise_softirq(cpumask_of(cpu), 1);
 
 		if (pen_release == -1)
@@ -186,6 +200,8 @@ void __init smp_init_cpus(void)
 
 void __init platform_smp_prepare_cpus(unsigned int max_cpus)
 {
+	int i;
+
 	if (!soc_is_exynos5250())
 		scu_enable(scu_base_addr());
 
@@ -195,6 +211,7 @@ void __init platform_smp_prepare_cpus(unsigned int max_cpus)
 	 * until it receives a soft interrupt, and then the
 	 * secondary CPU branches to this address.
 	 */
-	__raw_writel(virt_to_phys(exynos4_secondary_startup),
-			CPU1_BOOT_REG);
+	for (i = 1; i < max_cpus; ++i)
+		__raw_writel(virt_to_phys(exynos4_secondary_startup),
+					cpu_boot_reg(cpu_logical_map(i)));
 }
-- 
1.7.12

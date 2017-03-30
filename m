From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v9 03/12] ARM: EXYNOS: remove secondary startup initialization
 from smp_prepare_cpus
Date: Thu, 30 Mar 2017 18:46:57 +0530
Message-ID: <1490879826-16754-4-git-send-email-pankaj.dubey@samsung.com>
References: <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170330131424epcas5p4fccfab06e5d77d70d09c3835c3332ee5@epcas5p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53446 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933490AbdC3NO1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 09:14:27 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONM004K3Q41AR50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Mar 2017 22:14:25 +0900 (KST)
In-reply-to: <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, javier@osg.samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

We are taking care of setting secondary cpu boot address in
exynos_boot_secondary just before sending ipi to secondary CPUs,
so we can safely remove this setting from smp_prepare_cpus.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 5a03bff..cb6d199 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -387,38 +387,12 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
 {
-	int i;
-
 	exynos_sysram_init();
 
 	exynos_set_delayed_reset_assertion(true);
 
 	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9)
 		scu_enable(scu_base_addr());
-
-	/*
-	 * Write the address of secondary startup into the
-	 * system-wide flags register. The boot monitor waits
-	 * until it receives a soft interrupt, and then the
-	 * secondary CPU branches to this address.
-	 *
-	 * Try using firmware operation first and fall back to
-	 * boot register if it fails.
-	 */
-	for (i = 1; i < max_cpus; ++i) {
-		unsigned long boot_addr;
-		u32 mpidr;
-		u32 core_id;
-		int ret;
-
-		mpidr = cpu_logical_map(i);
-		core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
-		boot_addr = __pa_symbol(exynos4_secondary_startup);
-
-		ret = exynos_set_boot_addr(core_id, boot_addr);
-		if (ret)
-			break;
-	}
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.7.4

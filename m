From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 6/6] ARM: EXYNOS: Add secure firmware support to secondary
 CPU bring-up
Date: Thu, 25 Oct 2012 17:22:40 +0200
Message-ID: <1351178560-19188-7-git-send-email-t.figa@samsung.com>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44610 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab2JYPXP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Oct 2012 11:23:15 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCG00L3YG23WU40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 00:23:14 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCG008XQG1VUL00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 00:23:14 +0900 (KST)
In-reply-to: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

Boards using secure firmware must use different CPU boot registers and
call secure firmware to boot the CPU.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 4ca8ff1..9f8bdaf 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -25,6 +25,7 @@
 #include <asm/hardware/gic.h>
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
+#include <asm/firmware.h>
 
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
@@ -47,6 +48,8 @@ static inline void __iomem *cpu_boot_reg(int cpu)
 {
 	void __iomem *boot_reg;
 
+	if (!call_firmware_op(cpu_boot_reg, cpu, &boot_reg))
+		return boot_reg;
 	boot_reg = cpu_boot_reg_base();
 	if (soc_is_exynos4412())
 		boot_reg += 4*cpu;
@@ -149,6 +152,10 @@ static int __cpuinit exynos_boot_secondary(unsigned int cpu, struct task_struct
 
 		__raw_writel(virt_to_phys(exynos4_secondary_startup),
 							cpu_boot_reg(phys_cpu));
+
+		/* Call Exynos specific smc call */
+		call_firmware_op(cpu_boot, phys_cpu);
+
 		gic_raise_softirq(cpumask_of(cpu), 0);
 
 		if (pen_release == -1)
-- 
1.7.12

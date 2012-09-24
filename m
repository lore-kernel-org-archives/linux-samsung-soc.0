From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 6/6] ARM: EXYNOS: Add secure firmware support to secondary CPU
 bring-up
Date: Mon, 24 Sep 2012 16:28:33 +0200
Message-ID: <1348496913-25422-7-git-send-email-t.figa@samsung.com>
References: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18098 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834Ab2IXO3I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 10:29:08 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAU004SPYVRKX10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:29:07 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAU0018OYVOXC80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Sep 2012 23:29:07 +0900 (KST)
In-reply-to: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, t.figa@samsung.com

Boards using secure firmware must use different CPU boot registers and
call secure firmware to boot the CPU.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index a7f4031..4a18250 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -25,6 +25,7 @@
 #include <asm/hardware/gic.h>
 #include <asm/smp_plat.h>
 #include <asm/smp_scu.h>
+#include <asm/firmware.h>
 
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
@@ -44,6 +45,8 @@ static inline void __iomem *cpu_boot_reg_base(void)
 static inline void __iomem *cpu_boot_reg(int cpu)
 {
 	void __iomem *boot_reg;
+	if (!call_firmware_op(cpu_boot_reg, cpu, &boot_reg))
+		return boot_reg;
 	boot_reg = cpu_boot_reg_base();
 	if (soc_is_exynos4412())
 		boot_reg += 4*cpu;
@@ -153,6 +156,10 @@ int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 		__raw_writel(virt_to_phys(exynos4_secondary_startup),
 							cpu_boot_reg(phys_cpu));
+
+		/* Call Exynos specific smc call */
+		call_firmware_op(cpu_boot, phys_cpu);
+
 		gic_raise_softirq(cpumask_of(cpu), 1);
 
 		if (pen_release == -1)
-- 
1.7.12

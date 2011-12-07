From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 3/4] arm: exynos4: remove arch_initcall for wakeup interrupt
 source initialization
Date: Wed, 07 Dec 2011 19:29:51 +0530
Message-ID: <1323266392-28330-4-git-send-email-thomas.abraham@linaro.org>
References: <1323266392-28330-1-git-send-email-thomas.abraham@linaro.org>
 <1323266392-28330-2-git-send-email-thomas.abraham@linaro.org>
 <1323266392-28330-3-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13276 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756260Ab1LGN6e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 08:58:34 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVU007956T8LU40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 22:58:33 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVU00BJT6TAY680@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 22:58:33 +0900 (KST)
In-reply-to: <1323266392-28330-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org

The of_irq_init function would be setup to invoke the exynos4_init_irq_eint
function when booting using device tree. The arch_initcall for
exynos4_init_irq_eint would duplicate its invocation in that case. Hence,
arch_initcall for exynos4_init_irq_eint is removed and this function is invoked
from the exynos4_init_irq for non-dt case.

Moreover, with single kernel image build, the exynos4_init_irq_eint has no checks
to ensure that it is running on a exynos4 platform. So it would be appropriate
to invoke it from exynos4_init_irq.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/cpu.c                   |    1 +
 arch/arm/mach-exynos/irq-eint.c              |    2 --
 arch/arm/plat-samsung/include/plat/exynos4.h |    1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 8e09f34..6d27c36 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -278,6 +278,7 @@ void __init exynos4_init_irq(void)
 	 * uses GIC instead of VIC.
 	 */
 	s5p_init_irq(NULL, 0);
+	exynos4_init_irq_eint();
 }
 
 struct sysdev_class exynos4_sysclass = {
diff --git a/arch/arm/mach-exynos/irq-eint.c b/arch/arm/mach-exynos/irq-eint.c
index a65da64..771b156 100644
--- a/arch/arm/mach-exynos/irq-eint.c
+++ b/arch/arm/mach-exynos/irq-eint.c
@@ -233,5 +233,3 @@ int __init exynos4_init_irq_eint(void)
 
 	return 0;
 }
-
-arch_initcall(exynos4_init_irq_eint);
diff --git a/arch/arm/plat-samsung/include/plat/exynos4.h b/arch/arm/plat-samsung/include/plat/exynos4.h
index f546e88..a501461 100644
--- a/arch/arm/plat-samsung/include/plat/exynos4.h
+++ b/arch/arm/plat-samsung/include/plat/exynos4.h
@@ -24,6 +24,7 @@ extern void exynos4_init_irq(void);
 extern void exynos4_map_io(void);
 extern void exynos4_init_clocks(int xtal);
 extern struct sys_timer exynos4_timer;
+extern int exynos4_init_irq_eint(void);
 
 #define exynos4_init_uarts exynos4_common_init_uarts
 
-- 
1.6.6.rc2

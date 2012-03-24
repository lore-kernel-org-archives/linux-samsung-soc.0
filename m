From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 3/4] ARM: Exynos: Remove arch_initcall for wakeup interrupt
 initialization
Date: Sat, 24 Mar 2012 15:11:14 +0530
Message-ID: <1332582075-16204-4-git-send-email-thomas.abraham@linaro.org>
References: <1332582075-16204-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20787 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753143Ab2CXJgi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Mar 2012 05:36:38 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1D006OVUOYDWE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Mar 2012 18:36:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1D00D9XUORGL60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Mar 2012 18:36:37 +0900 (KST)
In-reply-to: <1332582075-16204-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

The of_irq_init function would be setup to invoke the exynos4_init_irq_eint
function when booting using device tree. The arch_initcall for
exynos4_init_irq_eint would duplicate its invocation in that case. Hence,
arch_initcall for exynos4_init_irq_eint is removed and this function is invoked
from the exynos4_init_irq for non-dt case.

Moreover, with single kernel image build, the exynos4_init_irq_eint has no checks
to ensure that it is running on a exynos4 platform. So it would be appropriate
to invoke it from exynos4_init_irq.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Rob Herring <rob.herring@calxeda.com>
---
 arch/arm/mach-exynos/common.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index b69f36a..7aa1919 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -64,6 +64,7 @@ static void exynos4_init_clocks(int xtal);
 static void exynos5_init_clocks(int xtal);
 static void exynos_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 static int exynos_init(void);
+static int exynos_init_irq_eint(void);
 
 static struct cpu_table cpu_ids[] __initdata = {
 	{
@@ -608,6 +609,7 @@ void __init exynos4_init_irq(void)
 	 * uses GIC instead of VIC.
 	 */
 	s5p_init_irq(NULL, 0);
+	exynos_init_irq_eint();
 }
 
 void __init exynos5_init_irq(void)
@@ -620,6 +622,7 @@ void __init exynos5_init_irq(void)
 	 * uses GIC instead of VIC.
 	 */
 	s5p_init_irq(NULL, 0);
+	exynos_init_irq_eint();
 }
 
 struct bus_type exynos4_subsys = {
@@ -1048,4 +1051,3 @@ static int __init exynos_init_irq_eint(void)
 
 	return 0;
 }
-arch_initcall(exynos_init_irq_eint);
-- 
1.6.6.rc2

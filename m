From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 3/4] ARM: Exynos4: Remove arch_initcall for wakeup interrupt
 initialization
Date: Wed, 22 Feb 2012 17:44:17 +0530
Message-ID: <1329912858-32750-4-git-send-email-thomas.abraham@linaro.org>
References: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29415 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab2BVMII (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 07:08:08 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZS001Z0N0P8LB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 21:08:07 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZS00GJLN166U60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 21:08:07 +0900 (KST)
In-reply-to: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
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
---
 arch/arm/mach-exynos/common.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index ed50185..888e703 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -81,6 +81,8 @@ static struct cpu_table cpu_ids[] __initdata = {
 	},
 };
 
+static int exynos4_init_irq_eint(void);
+
 /* Initial IO mappings */
 
 static struct map_desc exynos_iodesc[] __initdata = {
@@ -485,6 +487,7 @@ void __init exynos4_init_irq(void)
 	 * uses GIC instead of VIC.
 	 */
 	s5p_init_irq(NULL, 0);
+	exynos4_init_irq_eint();
 }
 
 struct bus_type exynos4_subsys = {
@@ -775,4 +778,3 @@ static int __init exynos4_init_irq_eint(void)
 	irq_set_handler_data(IRQ_EINT16_31, &eint_data);
 	return 0;
 }
-arch_initcall(exynos4_init_irq_eint);
-- 
1.6.6.rc2

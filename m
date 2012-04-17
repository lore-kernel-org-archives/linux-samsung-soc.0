From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 02/12] ARM: Exynos5: Fix incorrect initialization of GIC
Date: Tue, 17 Apr 2012 11:16:25 +0530
Message-ID: <1334641595-25301-3-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24956 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab2DQFiS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:18 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L00M32ZM06YN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:17 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:17 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Use the of_irq_init() call to setup the gic which also properly registers
the gic device node pointer with gic irq domain, without which all interrupt
specifier translations for gic fail.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/common.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 636d5f8..35ac675 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -532,11 +532,12 @@ void __init exynos4_init_irq(void)
 	s5p_init_irq(NULL, 0);
 }
 
+#ifdef CONFIG_ARCH_EXYNOS5
 void __init exynos5_init_irq(void)
 {
 	int irq;
 
-	gic_init(0, IRQ_PPI(0), S5P_VA_GIC_DIST, S5P_VA_GIC_CPU);
+	of_irq_init(exynos4_dt_irq_match);
 
 	for (irq = 0; irq < EXYNOS5_MAX_COMBINER_NR; irq++) {
 		combiner_init(irq, (void __iomem *)S5P_VA_COMBINER(irq),
@@ -551,6 +552,7 @@ void __init exynos5_init_irq(void)
 	 */
 	s5p_init_irq(NULL, 0);
 }
+#endif /* CONFIG_ARCH_EXYNOS5 */
 
 struct bus_type exynos4_subsys = {
 	.name		= "exynos4-core",
-- 
1.6.6.rc2

From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 10/12] ARM: Exynos: Redefine IRQ_MCT_L0,1 definition
Date: Tue, 17 Apr 2012 11:16:33 +0530
Message-ID: <1334641595-25301-11-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22500 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369Ab2DQFi4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:56 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L005NNZMDADJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:55 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Changhwan Youn <chaos.youn@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

Redefine IRQ_MCT_L0,1 irq definition as it is changed in rev1 of Exynos5.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/mach-exynos/include/mach/irqs.h |    4 ++--
 arch/arm/mach-exynos/mct.c               |   17 +++++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 1161675..86e75f5 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -320,6 +320,8 @@
 #define EXYNOS5_IRQ_SATA		IRQ_SPI(115)
 #define EXYNOS5_IRQ_NFCON		IRQ_SPI(116)
 
+#define EXYNOS5_IRQ_MCT_L0		IRQ_SPI(120)
+#define EXYNOS5_IRQ_MCT_L1		IRQ_SPI(121)
 #define EXYNOS5_IRQ_MMC44		IRQ_SPI(123)
 #define EXYNOS5_IRQ_MDMA1		IRQ_SPI(124)
 #define EXYNOS5_IRQ_FIMC_LITE0		IRQ_SPI(125)
@@ -399,8 +401,6 @@
 #define EXYNOS5_IRQ_FIMD1_SYSTEM	COMBINER_IRQ(18, 6)
 
 #define EXYNOS5_IRQ_EINT0		COMBINER_IRQ(23, 0)
-#define EXYNOS5_IRQ_MCT_L0		COMBINER_IRQ(23, 1)
-#define EXYNOS5_IRQ_MCT_L1		COMBINER_IRQ(23, 2)
 #define EXYNOS5_IRQ_MCT_G0		COMBINER_IRQ(23, 3)
 #define EXYNOS5_IRQ_MCT_G1		COMBINER_IRQ(23, 4)
 #define EXYNOS5_IRQ_MCT_G2		COMBINER_IRQ(23, 5)
diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 897d9a9..b601fb8 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -388,6 +388,7 @@ static int __cpuinit exynos4_local_timer_setup(struct clock_event_device *evt)
 {
 	struct mct_clock_event_device *mevt;
 	unsigned int cpu = smp_processor_id();
+	int mct_lx_irq;
 
 	mevt = this_cpu_ptr(&percpu_mct_tick);
 	mevt->evt = evt;
@@ -414,14 +415,18 @@ static int __cpuinit exynos4_local_timer_setup(struct clock_event_device *evt)
 
 	if (mct_int_type == MCT_INT_SPI) {
 		if (cpu == 0) {
+			mct_lx_irq = soc_is_exynos4210() ? EXYNOS4_IRQ_MCT_L0 :
+						EXYNOS5_IRQ_MCT_L0;
 			mct_tick0_event_irq.dev_id = mevt;
-			evt->irq = EXYNOS4_IRQ_MCT_L0;
-			setup_irq(EXYNOS4_IRQ_MCT_L0, &mct_tick0_event_irq);
+			evt->irq = mct_lx_irq;
+			setup_irq(mct_lx_irq, &mct_tick0_event_irq);
 		} else {
+			mct_lx_irq = soc_is_exynos4210() ? EXYNOS4_IRQ_MCT_L1 :
+						EXYNOS5_IRQ_MCT_L1;
 			mct_tick1_event_irq.dev_id = mevt;
-			evt->irq = EXYNOS4_IRQ_MCT_L1;
-			setup_irq(EXYNOS4_IRQ_MCT_L1, &mct_tick1_event_irq);
-			irq_set_affinity(EXYNOS4_IRQ_MCT_L1, cpumask_of(1));
+			evt->irq = mct_lx_irq;
+			setup_irq(mct_lx_irq, &mct_tick1_event_irq);
+			irq_set_affinity(mct_lx_irq, cpumask_of(1));
 		}
 	} else {
 		enable_percpu_irq(EXYNOS_IRQ_MCT_LOCALTIMER, 0);
@@ -473,7 +478,7 @@ static void __init exynos4_timer_resources(void)
 
 static void __init exynos4_timer_init(void)
 {
-	if (soc_is_exynos4210())
+	if ((soc_is_exynos4210()) || (soc_is_exynos5250()))
 		mct_int_type = MCT_INT_SPI;
 	else
 		mct_int_type = MCT_INT_PPI;
-- 
1.6.6.rc2

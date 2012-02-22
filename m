From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 1/4] ARM: Exynos4: Simplify EINT number to linux irq number
 translation
Date: Wed, 22 Feb 2012 17:44:15 +0530
Message-ID: <1329912858-32750-2-git-send-email-thomas.abraham@linaro.org>
References: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29370 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752697Ab2BVMIF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 07:08:05 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZS001Z0N0P8LB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 21:08:04 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZS00GJLN166U60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 21:08:04 +0900 (KST)
In-reply-to: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

The exynos4_get_irq_nr function that converts a given wakeup interrupt
source number to a linux irq number is simplified and replaced with
the new macro exynos4_irq_eint_to_gic_irq.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/common.c |   26 +++-----------------------
 1 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index ac5ac0e..7dd9dd0 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -550,27 +550,7 @@ void __init exynos4_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 static DEFINE_SPINLOCK(eint_lock);
 
 static unsigned int eint0_15_data[16];
-
-static unsigned int exynos4_get_irq_nr(unsigned int number)
-{
-	u32 ret = 0;
-
-	switch (number) {
-	case 0 ... 3:
-		ret = (number + IRQ_EINT0);
-		break;
-	case 4 ... 7:
-		ret = (number + (IRQ_EINT4 - 4));
-		break;
-	case 8 ... 15:
-		ret = (number + (IRQ_EINT8 - 8));
-		break;
-	default:
-		printk(KERN_ERR "number available : %d\n", number);
-	}
-
-	return ret;
-}
+#define exynos4_irq_eint_to_gic_irq(number) (IRQ_EINT0 + number)
 
 static inline void exynos4_irq_eint_mask(struct irq_data *data)
 {
@@ -748,9 +728,9 @@ static int __init exynos4_init_irq_eint(void)
 	for (irq = 0 ; irq <= 15 ; irq++) {
 		eint0_15_data[irq] = IRQ_EINT(irq);
 
-		irq_set_handler_data(exynos4_get_irq_nr(irq),
+		irq_set_handler_data(exynos4_irq_eint_to_gic_irq(irq),
 				     &eint0_15_data[irq]);
-		irq_set_chained_handler(exynos4_get_irq_nr(irq),
+		irq_set_chained_handler(exynos4_irq_eint_to_gic_irq(irq),
 					exynos4_irq_eint0_15);
 	}
 
-- 
1.6.6.rc2

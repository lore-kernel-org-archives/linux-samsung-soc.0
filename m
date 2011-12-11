From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 1/4] ARM: Exynos4: Simplify EINT number to linux irq number
 translation
Date: Sun, 11 Dec 2011 12:21:38 +0530
Message-ID: <1323586301-24537-2-git-send-email-thomas.abraham@linaro.org>
References: <1323586301-24537-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57780 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877Ab1LKGuP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 01:50:15 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW100EEG1NOAF00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 11 Dec 2011 15:50:14 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW100EBB1NIOE80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sun, 11 Dec 2011 15:50:14 +0900 (KST)
In-reply-to: <1323586301-24537-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

The exynos4_get_irq_nr function that converts a given wakeup interrupt
source number to a linux irq number is simplified and replaced with
the new macro exynos4_irq_eint_to_gic_irq.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/irq-eint.c |   25 +++----------------------
 1 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-exynos/irq-eint.c b/arch/arm/mach-exynos/irq-eint.c
index badb8c6..5e89412 100644
--- a/arch/arm/mach-exynos/irq-eint.c
+++ b/arch/arm/mach-exynos/irq-eint.c
@@ -29,26 +29,7 @@ static DEFINE_SPINLOCK(eint_lock);
 
 static unsigned int eint0_15_data[16];
 
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
@@ -225,9 +206,9 @@ int __init exynos4_init_irq_eint(void)
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

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] irqchip: exynos: cleanup non-DT stuff in exynos-combiner
Date: Tue, 16 Jul 2013 12:22:14 +0900
Message-ID: <027401ce81d3$ad706570$08513050$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43373 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753764Ab3GPDW0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 23:22:26 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ0000VGEP7RD90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Jul 2013 12:22:19 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: tglx@linutronix.de


For EXYNOS SoCs, only can support for DT so removes non-DT stuff
in exynos-combiner.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/irqchip/exynos-combiner.c |   44 +------------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 4c68265..868ed40 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -19,10 +19,6 @@
 #include <linux/of_irq.h>
 #include <asm/mach/irq.h>
 
-#ifdef CONFIG_EXYNOS_ATAGS
-#include <plat/cpu.h>
-#endif
-
 #include "irqchip.h"
 
 #define COMBINER_ENABLE_SET	0x0
@@ -138,7 +134,6 @@ static void __init combiner_init_one(struct combiner_chip_data *combiner_data,
 	__raw_writel(combiner_data->irq_mask, base + COMBINER_ENABLE_CLEAR);
 }
 
-#ifdef CONFIG_OF
 static int combiner_irq_domain_xlate(struct irq_domain *d,
 				     struct device_node *controller,
 				     const u32 *intspec, unsigned int intsize,
@@ -156,16 +151,6 @@ static int combiner_irq_domain_xlate(struct irq_domain *d,
 
 	return 0;
 }
-#else
-static int combiner_irq_domain_xlate(struct irq_domain *d,
-				     struct device_node *controller,
-				     const u32 *intspec, unsigned int intsize,
-				     unsigned long *out_hwirq,
-				     unsigned int *out_type)
-{
-	return -EINVAL;
-}
-#endif
 
 static int combiner_irq_domain_map(struct irq_domain *d, unsigned int irq,
 				   irq_hw_number_t hw)
@@ -184,26 +169,6 @@ static struct irq_domain_ops combiner_irq_domain_ops = {
 	.map	= combiner_irq_domain_map,
 };
 
-static unsigned int combiner_lookup_irq(int group)
-{
-#ifdef CONFIG_EXYNOS_ATAGS
-	if (group < EXYNOS4210_MAX_COMBINER_NR || soc_is_exynos5250())
-		return IRQ_SPI(group);
-
-	switch (group) {
-	case 16:
-		return IRQ_SPI(107);
-	case 17:
-		return IRQ_SPI(108);
-	case 18:
-		return IRQ_SPI(48);
-	case 19:
-		return IRQ_SPI(42);
-	}
-#endif
-	return 0;
-}
-
 static void __init combiner_init(void __iomem *combiner_base,
 				 struct device_node *np,
 				 unsigned int max_nr,
@@ -229,12 +194,7 @@ static void __init combiner_init(void __iomem *combiner_base,
 	}
 
 	for (i = 0; i < max_nr; i++) {
-#ifdef CONFIG_OF
-		if (np)
-			irq = irq_of_parse_and_map(np, i);
-		else
-#endif
-			irq = combiner_lookup_irq(i);
+		irq = irq_of_parse_and_map(np, i);
 
 		combiner_init_one(&combiner_data[i], i,
 				  combiner_base + (i >> 2) * 0x10, irq);
@@ -242,7 +202,6 @@ static void __init combiner_init(void __iomem *combiner_base,
 	}
 }
 
-#ifdef CONFIG_OF
 static int __init combiner_of_init(struct device_node *np,
 				   struct device_node *parent)
 {
@@ -275,4 +234,3 @@ static int __init combiner_of_init(struct device_node *np,
 }
 IRQCHIP_DECLARE(exynos4210_combiner, "samsung,exynos4210-combiner",
 		combiner_of_init);
-#endif
-- 
1.7.10.4

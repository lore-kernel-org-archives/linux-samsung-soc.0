From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2 1/3] ARM: EXYNOS: Add set_irq_affinity function for
 combiner_irq
Date: Fri, 27 Jul 2012 17:08:27 +0900
Message-ID: <1343376509-5881-2-git-send-email-chanho61.park@samsung.com>
References: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20831 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752459Ab2G0IIi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jul 2012 04:08:38 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7T00BBR7YBY0U0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jul 2012 17:08:37 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7T007T07Y88OC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jul 2012 17:08:36 +0900 (KST)
In-reply-to: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, linux@arm.linux.org.uk, will.deacon@arm.com, Chanho Park <chanho61.park@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds set_irq_affinity function for combiner_irq. We need this
function to enable a arm-pmu because the irq of exynos's pmu is declared
combiner_irq.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c |   30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 4eb39cd..f194bbc 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -405,6 +405,7 @@ struct combiner_chip_data {
 	unsigned int irq_offset;
 	unsigned int irq_mask;
 	void __iomem *base;
+	unsigned int parent_irq;
 };
 
 static struct irq_domain *combiner_irq_domain;
@@ -461,10 +462,28 @@ static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+#ifdef CONFIG_SMP
+static int combiner_set_affinity(struct irq_data *d,
+				 const struct cpumask *mask_val, bool force)
+{
+	struct combiner_chip_data *chip_data = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_get_chip(chip_data->parent_irq);
+	struct irq_data *data = irq_get_irq_data(chip_data->parent_irq);
+
+	if (chip && chip->irq_set_affinity)
+		return chip->irq_set_affinity(data, mask_val, force);
+	else
+		return -EINVAL;
+}
+#endif
+
 static struct irq_chip combiner_chip = {
-	.name		= "COMBINER",
-	.irq_mask	= combiner_mask_irq,
-	.irq_unmask	= combiner_unmask_irq,
+	.name			= "COMBINER",
+	.irq_mask		= combiner_mask_irq,
+	.irq_unmask		= combiner_unmask_irq,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= combiner_set_affinity,
+#endif
 };
 
 static void __init combiner_cascade_irq(unsigned int combiner_nr, unsigned int irq)
@@ -484,12 +503,13 @@ static void __init combiner_cascade_irq(unsigned int combiner_nr, unsigned int i
 }
 
 static void __init combiner_init_one(unsigned int combiner_nr,
-				     void __iomem *base)
+				     void __iomem *base, unsigned int irq)
 {
 	combiner_data[combiner_nr].base = base;
 	combiner_data[combiner_nr].irq_offset = irq_find_mapping(
 		combiner_irq_domain, combiner_nr * MAX_IRQ_IN_COMBINER);
 	combiner_data[combiner_nr].irq_mask = 0xff << ((combiner_nr % 4) << 3);
+	combiner_data[combiner_nr].parent_irq = irq;
 
 	/* Disable all interrupts */
 	__raw_writel(combiner_data[combiner_nr].irq_mask,
@@ -573,12 +593,12 @@ static void __init combiner_init(void __iomem *combiner_base,
 	}
 
 	for (i = 0; i < max_nr; i++) {
-		combiner_init_one(i, combiner_base + (i >> 2) * 0x10);
 		irq = IRQ_SPI(i);
 #ifdef CONFIG_OF
 		if (np)
 			irq = irq_of_parse_and_map(np, i);
 #endif
+		combiner_init_one(i, combiner_base + (i >> 2) * 0x10, irq);
 		combiner_cascade_irq(i, irq);
 	}
 }
-- 
1.7.9.5

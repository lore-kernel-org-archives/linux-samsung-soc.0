From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/7] irqchip: exynos: allocate combiner_data dynamically
Date: Fri, 12 Apr 2013 16:03:23 +0200
Message-ID: <1365775405-115297-6-git-send-email-arnd@arndb.de>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:57565 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290Ab3DLODv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 10:03:51 -0400
In-Reply-To: <1365775405-115297-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>

The number of combiners on a given SoC is a platform specific
constant, and we cannot encode this number on a multiplatform
kernel since the header file defining it is not available.

Allocating the structure dynamically ends up cleaner anyway
since we keep all the data local.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/exynos-combiner.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index d868383..7fcdeee 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/slab.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
@@ -37,7 +38,6 @@ struct combiner_chip_data {
 };
 
 static struct irq_domain *combiner_irq_domain;
-static struct combiner_chip_data combiner_data[MAX_COMBINER_NR];
 
 static inline void __iomem *combiner_base(struct irq_data *data)
 {
@@ -114,26 +114,26 @@ static struct irq_chip combiner_chip = {
 #endif
 };
 
-static void __init combiner_cascade_irq(unsigned int combiner_nr,
+static void __init combiner_cascade_irq(struct combiner_chip_data *combiner_data,
 					unsigned int irq)
 {
-	if (irq_set_handler_data(irq, &combiner_data[combiner_nr]) != 0)
+	if (irq_set_handler_data(irq, combiner_data) != 0)
 		BUG();
 	irq_set_chained_handler(irq, combiner_handle_cascade_irq);
 }
 
-static void __init combiner_init_one(unsigned int combiner_nr,
+static void __init combiner_init_one(struct combiner_chip_data *combiner_data,
+				     unsigned int combiner_nr,
 				     void __iomem *base, unsigned int irq)
 {
-	combiner_data[combiner_nr].base = base;
-	combiner_data[combiner_nr].irq_offset = irq_find_mapping(
+	combiner_data->base = base;
+	combiner_data->irq_offset = irq_find_mapping(
 		combiner_irq_domain, combiner_nr * IRQ_IN_COMBINER);
-	combiner_data[combiner_nr].irq_mask = 0xff << ((combiner_nr % 4) << 3);
-	combiner_data[combiner_nr].parent_irq = irq;
+	combiner_data->irq_mask = 0xff << ((combiner_nr % 4) << 3);
+	combiner_data->parent_irq = irq;
 
 	/* Disable all interrupts */
-	__raw_writel(combiner_data[combiner_nr].irq_mask,
-		     base + COMBINER_ENABLE_CLEAR);
+	__raw_writel(combiner_data->irq_mask, base + COMBINER_ENABLE_CLEAR);
 }
 
 #ifdef CONFIG_OF
@@ -168,6 +168,8 @@ static int combiner_irq_domain_xlate(struct irq_domain *d,
 static int combiner_irq_domain_map(struct irq_domain *d, unsigned int irq,
 				   irq_hw_number_t hw)
 {
+	struct combiner_chip_data *combiner_data = d->host_data;
+
 	irq_set_chip_and_handler(irq, &combiner_chip, handle_level_irq);
 	irq_set_chip_data(irq, &combiner_data[hw >> 3]);
 	set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
@@ -202,6 +204,7 @@ void __init combiner_init(void __iomem *combiner_base,
 {
 	int i, irq, irq_base;
 	unsigned int nr_irq;
+	struct combiner_chip_data *combiner_data;
 
 	nr_irq = max_nr * IRQ_IN_COMBINER;
 
@@ -211,8 +214,14 @@ void __init combiner_init(void __iomem *combiner_base,
 		pr_warning("%s: irq desc alloc failed. Continuing with %d as linux irq base\n", __func__, irq_base);
 	}
 
+	combiner_data = kcalloc(max_nr, sizeof (*combiner_data), GFP_KERNEL);
+	if (!combiner_data) {
+		pr_warning("%s: could not allocate combiner data\n", __func__);
+		return;
+	}
+
 	combiner_irq_domain = irq_domain_add_legacy(np, nr_irq, irq_base, 0,
-				&combiner_irq_domain_ops, &combiner_data);
+				&combiner_irq_domain_ops, combiner_data);
 	if (WARN_ON(!combiner_irq_domain)) {
 		pr_warning("%s: irq domain init failed\n", __func__);
 		return;
@@ -227,8 +236,9 @@ void __init combiner_init(void __iomem *combiner_base,
 		if (np)
 			irq = irq_of_parse_and_map(np, i);
 #endif
-		combiner_init_one(i, combiner_base + (i >> 2) * 0x10, irq);
-		combiner_cascade_irq(i, irq);
+		combiner_init_one(&combiner_data[i], i,
+				  combiner_base + (i >> 2) * 0x10, irq);
+		combiner_cascade_irq(&combiner_data[i], irq);
 	}
 }
 
-- 
1.8.1.2

From: Jonathan Kliegman <kliegs@chromium.org>
Subject: [PATCH 1/3] ARM: exynos: Save combiner registers on suspend
Date: Fri, 20 Jul 2012 14:14:34 -0400
Message-ID: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:39930 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507Ab2GTSOu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jul 2012 14:14:50 -0400
Received: by yhmm54 with SMTP id m54so4268223yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jul 2012 11:14:50 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jonathan Kliegman <kliegs@chromium.org>

The interupt combiner registers need to be saved on suspend resume
or its interrupts (trackpad and keyboard most noticeably) won't work
after resume.

Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
---
 arch/arm/mach-exynos/common.c |   74 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 4eb39cd..1b28aa6 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -22,6 +22,7 @@
 #include <linux/export.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
+#include <linux/cpu_pm.h>
 
 #include <asm/proc-fns.h>
 #include <asm/exception.h>
@@ -405,10 +406,14 @@ struct combiner_chip_data {
 	unsigned int irq_offset;
 	unsigned int irq_mask;
 	void __iomem *base;
+#ifdef CONFIG_PM
+	bool saved_on;
+#endif
 };
 
 static struct irq_domain *combiner_irq_domain;
 static struct combiner_chip_data combiner_data[MAX_COMBINER_NR];
+static unsigned int rt_max_combiner_nr;
 
 static inline void __iomem *combiner_base(struct irq_data *data)
 {
@@ -535,6 +540,55 @@ static int combiner_irq_domain_map(struct irq_domain *d, unsigned int irq,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static void combiner_save(void)
+{
+	int i;
+
+	for (i = 0; i < rt_max_combiner_nr; i++) {
+		if (combiner_data[i].irq_mask &
+		    __raw_readl(combiner_data[i].base + COMBINER_ENABLE_SET)) {
+			combiner_data[i].saved_on = true;
+		} else {
+			combiner_data[i].saved_on = false;
+		}
+	}
+}
+
+static void combiner_restore(void)
+{
+	int i;
+
+	for (i = 0; i < rt_max_combiner_nr; i++) {
+		if (!combiner_data[i].saved_on)
+			continue;
+
+		__raw_writel(combiner_data[i].irq_mask,
+			     combiner_data[i].base + COMBINER_ENABLE_SET);
+	}
+}
+
+
+static int combiner_notifier(struct notifier_block *self, unsigned long cmd,
+			     void *v)
+{
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		combiner_save();
+		break;
+	case CPU_PM_EXIT:
+		combiner_restore();
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block combiner_notifier_block = {
+	.notifier_call = combiner_notifier,
+};
+#endif
+
 static struct irq_domain_ops combiner_irq_domain_ops = {
 	.xlate	= combiner_irq_domain_xlate,
 	.map	= combiner_irq_domain_map,
@@ -544,20 +598,21 @@ static void __init combiner_init(void __iomem *combiner_base,
 				 struct device_node *np)
 {
 	int i, irq, irq_base;
-	unsigned int max_nr, nr_irq;
+	unsigned int nr_irq;
 
 	if (np) {
-		if (of_property_read_u32(np, "samsung,combiner-nr", &max_nr)) {
+		if (of_property_read_u32(np, "samsung,combiner-nr",
+					 &rt_max_combiner_nr)) {
 			pr_warning("%s: number of combiners not specified, "
 				"setting default as %d.\n",
 				__func__, EXYNOS4_MAX_COMBINER_NR);
-			max_nr = EXYNOS4_MAX_COMBINER_NR;
+			rt_max_combiner_nr = EXYNOS4_MAX_COMBINER_NR;
 		}
 	} else {
-		max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
-						EXYNOS4_MAX_COMBINER_NR;
+		rt_max_combiner_nr = soc_is_exynos5250() ?
+			EXYNOS5_MAX_COMBINER_NR : EXYNOS4_MAX_COMBINER_NR;
 	}
-	nr_irq = max_nr * MAX_IRQ_IN_COMBINER;
+	nr_irq = rt_max_combiner_nr * MAX_IRQ_IN_COMBINER;
 
 	irq_base = irq_alloc_descs(COMBINER_IRQ(0, 0), 1, nr_irq, 0);
 	if (IS_ERR_VALUE(irq_base)) {
@@ -572,7 +627,7 @@ static void __init combiner_init(void __iomem *combiner_base,
 		return;
 	}
 
-	for (i = 0; i < max_nr; i++) {
+	for (i = 0; i < rt_max_combiner_nr; i++) {
 		combiner_init_one(i, combiner_base + (i >> 2) * 0x10);
 		irq = IRQ_SPI(i);
 #ifdef CONFIG_OF
@@ -581,6 +636,11 @@ static void __init combiner_init(void __iomem *combiner_base,
 #endif
 		combiner_cascade_irq(i, irq);
 	}
+
+#ifdef CONFIG_PM
+	/* Setup suspend/resume combiner saving */
+	cpu_pm_register_notifier(&combiner_notifier_block);
+#endif
 }
 
 #ifdef CONFIG_OF
-- 
1.7.7.3

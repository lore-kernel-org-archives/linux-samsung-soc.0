From: Jonathan Kliegman <kliegs@chromium.org>
Subject: [PATCH 3/3] ARM: exynos: Size combiner_data dynamically after dt parsing
Date: Fri, 20 Jul 2012 14:14:36 -0400
Message-ID: <1342808076-29985-3-git-send-email-kliegs@chromium.org>
References: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64515 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507Ab2GTSOy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jul 2012 14:14:54 -0400
Received: by yenl2 with SMTP id l2so4273003yen.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jul 2012 11:14:53 -0700 (PDT)
In-Reply-To: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jonathan Kliegman <kliegs@chromium.org>

The number of combiner_data entries depends on the device tree parsing
now.  Allocate the array based on the results of the parsing or fall
back on EXYNOS4 or EXYNOS5 defaults based on the SOC running.

Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
---
 arch/arm/mach-exynos/common.c |   41 +++++++++++++++++++++++++----------------
 1 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 3627869..5075e0c 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -412,7 +412,7 @@ struct combiner_chip_data {
 };
 
 static struct irq_domain *combiner_irq_domain;
-static struct combiner_chip_data combiner_data[MAX_COMBINER_NR];
+static struct combiner_chip_data *combiner_data;
 static unsigned int rt_max_combiner_nr;
 
 static inline void __iomem *combiner_base(struct irq_data *data)
@@ -474,15 +474,6 @@ static struct irq_chip combiner_chip = {
 
 static void __init combiner_cascade_irq(unsigned int combiner_nr, unsigned int irq)
 {
-	unsigned int max_nr;
-
-	if (soc_is_exynos5250())
-		max_nr = EXYNOS5_MAX_COMBINER_NR;
-	else
-		max_nr = EXYNOS4_MAX_COMBINER_NR;
-
-	if (combiner_nr >= max_nr)
-		BUG();
 	if (irq_set_handler_data(irq, &combiner_data[combiner_nr]) != 0)
 		BUG();
 	irq_set_chained_handler(irq, combiner_handle_cascade_irq);
@@ -598,20 +589,37 @@ static void __init combiner_init(void __iomem *combiner_base,
 				 struct device_node *np)
 {
 	int i, irq, irq_base;
-	unsigned int nr_irq;
+	unsigned int nr_irq, soc_max_nr;
+
+	soc_max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
+		EXYNOS4_MAX_COMBINER_NR;
 
 	if (np) {
 		if (of_property_read_u32(np, "samsung,combiner-nr",
 					 &rt_max_combiner_nr)) {
+			rt_max_combiner_nr = soc_max_nr;
 			pr_warning("%s: number of combiners not specified, "
-				"setting default as %d.\n",
-				__func__, EXYNOS4_MAX_COMBINER_NR);
-			rt_max_combiner_nr = EXYNOS4_MAX_COMBINER_NR;
+				   "setting default as %d.\n",
+				   __func__, rt_max_combiner_nr);
 		}
 	} else {
-		rt_max_combiner_nr = soc_is_exynos5250() ?
-			EXYNOS5_MAX_COMBINER_NR : EXYNOS4_MAX_COMBINER_NR;
+		rt_max_combiner_nr = soc_max_nr;
 	}
+	if (WARN_ON(rt_max_combiner_nr > soc_max_nr)) {
+		pr_warning("%s: more combiners specified (%d) than "
+			   "architecture (%d) supports.",
+			   __func__, rt_max_combiner_nr, soc_max_nr);
+		return;
+	}
+
+	combiner_data = kmalloc(sizeof(struct combiner_chip_data) *
+				rt_max_combiner_nr, GFP_KERNEL);
+	if (WARN_ON(!combiner_data)) {
+		pr_warning("%s: combiner_data memory allocation failed for %d "
+			   "entries", __func__, rt_max_combiner_nr);
+		return;
+	}
+
 	nr_irq = rt_max_combiner_nr * MAX_IRQ_IN_COMBINER;
 
 	irq_base = irq_alloc_descs(COMBINER_IRQ(0, 0), 1, nr_irq, 0);
@@ -624,6 +632,7 @@ static void __init combiner_init(void __iomem *combiner_base,
 				&combiner_irq_domain_ops, &combiner_data);
 	if (WARN_ON(!combiner_irq_domain)) {
 		pr_warning("%s: irq domain init failed\n", __func__);
+		kfree(combiner_data);
 		return;
 	}
 
-- 
1.7.7.3

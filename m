From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 2/4] ARM: EXYNOS: Correct combined IRQs for exynos4412
Date: Wed, 29 Aug 2012 10:14:55 +0900
Message-ID: <1346202897-27306-3-git-send-email-chanho61.park@samsung.com>
References: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14164 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600Ab2H2BPW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 21:15:22 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9H00MHFSPQEE30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 10:15:15 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9H00IO5ST8BV20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 10:15:15 +0900 (KST)
In-reply-to: <1346202897-27306-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, Chanho Park <chanho61.park@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch corrects combined IRQs for exynos4412 platform. The exynos4412 has
four extra combined irq group. Each irq is mapped to IRQ_SPI(xx). Unfortunately,
extra combined IRQs isn't sequential. So, we need to map the irq manually.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c            |   31 ++++++++++++++++++++++++------
 arch/arm/mach-exynos/include/mach/irqs.h |    2 +-
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index f194bbc..be61564 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -560,23 +560,39 @@ static struct irq_domain_ops combiner_irq_domain_ops = {
 	.map	= combiner_irq_domain_map,
 };
 
+static unsigned int get_combiner_extra_irq(int group)
+{
+	switch (group) {
+	case 16:
+		return IRQ_SPI(107);
+	case 17:
+		return IRQ_SPI(108);
+	case 18:
+		return IRQ_SPI(48);
+	case 19:
+		return IRQ_SPI(42);
+	default:
+		return 0;
+	}
+}
+
 static void __init combiner_init(void __iomem *combiner_base,
 				 struct device_node *np)
 {
 	int i, irq, irq_base;
 	unsigned int max_nr, nr_irq;
 
+	max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
+					EXYNOS4_MAX_COMBINER_NR;
+
 	if (np) {
 		if (of_property_read_u32(np, "samsung,combiner-nr", &max_nr)) {
 			pr_warning("%s: number of combiners not specified, "
 				"setting default as %d.\n",
-				__func__, EXYNOS4_MAX_COMBINER_NR);
-			max_nr = EXYNOS4_MAX_COMBINER_NR;
+				__func__, max_nr);
 		}
-	} else {
-		max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
-						EXYNOS4_MAX_COMBINER_NR;
 	}
+
 	nr_irq = max_nr * MAX_IRQ_IN_COMBINER;
 
 	irq_base = irq_alloc_descs(COMBINER_IRQ(0, 0), 1, nr_irq, 0);
@@ -593,7 +609,10 @@ static void __init combiner_init(void __iomem *combiner_base,
 	}
 
 	for (i = 0; i < max_nr; i++) {
-		irq = IRQ_SPI(i);
+		if (i < 16 || soc_is_exynos5250())
+			irq = IRQ_SPI(i);
+		else
+			irq = get_combiner_extra_irq(i);
 #ifdef CONFIG_OF
 		if (np)
 			irq = irq_of_parse_and_map(np, i);
diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 35bced6..357ed7f 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -165,7 +165,7 @@
 #define EXYNOS4_IRQ_FIMD0_VSYNC		COMBINER_IRQ(11, 1)
 #define EXYNOS4_IRQ_FIMD0_SYSTEM	COMBINER_IRQ(11, 2)
 
-#define EXYNOS4_MAX_COMBINER_NR		16
+#define EXYNOS4_MAX_COMBINER_NR		20
 
 #define EXYNOS4_IRQ_GPIO1_NR_GROUPS	16
 #define EXYNOS4_IRQ_GPIO2_NR_GROUPS	9
-- 
1.7.9.5

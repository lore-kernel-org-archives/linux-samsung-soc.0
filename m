From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 2/5] ARM: EXYNOS: Correct combined IRQs for exynos4
Date: Mon, 08 Oct 2012 11:17:07 +0900
Message-ID: <1349662630-11607-3-git-send-email-chanho61.park@samsung.com>
References: <1349662630-11607-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45360 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092Ab2JHCRc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Oct 2012 22:17:32 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBJ00869Y92K8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 11:17:31 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBJ00IX1YD3KJK0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 11:17:31 +0900 (KST)
In-reply-to: <1349662630-11607-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, sachin.kamat@linaro.org, will.deacon@arm.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, Chanho Park <chanho61.park@samsung.com>

This patch corrects combined IRQs for exynos4 series platform. The exynos4412
has four extra combined irq group and the exynos4212 has two more combined irqs
than exynos4210. Each irq is mapped to IRQ_SPI(xx). Unfortunately, extra 4
combined IRQs isn't sequential. So, we need to map the irqs manually.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c            |   42 +++++++++++++++++++++++++-----
 arch/arm/mach-exynos/include/mach/irqs.h |    4 ++-
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 709245e..fdd582a 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -560,23 +560,50 @@ static struct irq_domain_ops combiner_irq_domain_ops = {
 	.map	= combiner_irq_domain_map,
 };
 
+static unsigned int combiner_extra_irq(int group)
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
+static unsigned int max_combiner_nr(void)
+{
+	if (soc_is_exynos5250())
+		return EXYNOS5_MAX_COMBINER_NR;
+	else if (soc_is_exynos4412())
+		return EXYNOS4_MAX_COMBINER_NR;
+	else if (soc_is_exynos4212())
+		return EXYNOS4212_MAX_COMBINER_NR;
+	else
+		return EXYNOS4210_MAX_COMBINER_NR;
+}
+
 static void __init combiner_init(void __iomem *combiner_base,
 				 struct device_node *np)
 {
 	int i, irq, irq_base;
 	unsigned int max_nr, nr_irq;
 
+	max_nr = max_combiner_nr();
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
@@ -593,7 +620,10 @@ static void __init combiner_init(void __iomem *combiner_base,
 	}
 
 	for (i = 0; i < max_nr; i++) {
-		irq = IRQ_SPI(i);
+		if (i < EXYNOS4210_MAX_COMBINER_NR || soc_is_exynos5250())
+			irq = IRQ_SPI(i);
+		else
+			irq = combiner_extra_irq(i);
 #ifdef CONFIG_OF
 		if (np)
 			irq = irq_of_parse_and_map(np, i);
diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 35bced6..3a83546 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -165,7 +165,9 @@
 #define EXYNOS4_IRQ_FIMD0_VSYNC		COMBINER_IRQ(11, 1)
 #define EXYNOS4_IRQ_FIMD0_SYSTEM	COMBINER_IRQ(11, 2)
 
-#define EXYNOS4_MAX_COMBINER_NR		16
+#define EXYNOS4210_MAX_COMBINER_NR	16
+#define EXYNOS4212_MAX_COMBINER_NR	18
+#define EXYNOS4_MAX_COMBINER_NR		20
 
 #define EXYNOS4_IRQ_GPIO1_NR_GROUPS	16
 #define EXYNOS4_IRQ_GPIO2_NR_GROUPS	9
-- 
1.7.9.5

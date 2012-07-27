From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2 2/3] ARM: EXYNOS: Correct combined IRQs for exynos4412
Date: Fri, 27 Jul 2012 17:08:28 +0900
Message-ID: <1343376509-5881-3-git-send-email-chanho61.park@samsung.com>
References: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44434 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752459Ab2G0IIt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jul 2012 04:08:49 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7T00BV37YBRVO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jul 2012 17:08:48 +0900 (KST)
Received: from localhost.localdomain ([10.90.51.45])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7T007T07Y88OC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jul 2012 17:08:48 +0900 (KST)
In-reply-to: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, linux@arm.linux.org.uk, will.deacon@arm.com, Chanho Park <chanho61.park@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch corrects combined IRQs for exynos4412 platform. The exynos4412 has
four extra combined irq group. Each irq is mapped to IRQ_SPI(xx). Unfortunately,
extra combined IRQs isn't sequential. So, we need to map the irq manually.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/common.c            |   42 +++++++++++++++++++++++++-----
 arch/arm/mach-exynos/include/mach/irqs.h |    3 ++-
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index f194bbc..499791a 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -560,6 +560,32 @@ static struct irq_domain_ops combiner_irq_domain_ops = {
 	.map	= combiner_irq_domain_map,
 };
 
+static inline unsigned int get_combiner_max_nr(void)
+{
+	if (soc_is_exynos5250())
+		return EXYNOS5_MAX_COMBINER_NR;
+	else if (soc_is_exynos4412())
+		return EXYNOS4_MAX_COMBINER_NR;
+	else
+		return EXYNOS42XX_MAX_COMBINER_NR;
+}
+
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
@@ -570,13 +596,12 @@ static void __init combiner_init(void __iomem *combiner_base,
 		if (of_property_read_u32(np, "samsung,combiner-nr", &max_nr)) {
 			pr_warning("%s: number of combiners not specified, "
 				"setting default as %d.\n",
-				__func__, EXYNOS4_MAX_COMBINER_NR);
-			max_nr = EXYNOS4_MAX_COMBINER_NR;
+				__func__, get_combiner_max_nr());
+			max_nr = get_combiner_max_nr();
 		}
-	} else {
-		max_nr = soc_is_exynos5250() ? EXYNOS5_MAX_COMBINER_NR :
-						EXYNOS4_MAX_COMBINER_NR;
-	}
+	} else
+		max_nr = get_combiner_max_nr();
+
 	nr_irq = max_nr * MAX_IRQ_IN_COMBINER;
 
 	irq_base = irq_alloc_descs(COMBINER_IRQ(0, 0), 1, nr_irq, 0);
@@ -593,7 +618,10 @@ static void __init combiner_init(void __iomem *combiner_base,
 	}
 
 	for (i = 0; i < max_nr; i++) {
-		irq = IRQ_SPI(i);
+		if (soc_is_exynos4412() && i >= 16)
+			irq = get_combiner_extra_irq(i);
+		else
+			irq = IRQ_SPI(i);
 #ifdef CONFIG_OF
 		if (np)
 			irq = irq_of_parse_and_map(np, i);
diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 35bced6..12b4f48 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -165,7 +165,8 @@
 #define EXYNOS4_IRQ_FIMD0_VSYNC		COMBINER_IRQ(11, 1)
 #define EXYNOS4_IRQ_FIMD0_SYSTEM	COMBINER_IRQ(11, 2)
 
-#define EXYNOS4_MAX_COMBINER_NR		16
+#define EXYNOS42XX_MAX_COMBINER_NR	16
+#define EXYNOS4_MAX_COMBINER_NR		20
 
 #define EXYNOS4_IRQ_GPIO1_NR_GROUPS	16
 #define EXYNOS4_IRQ_GPIO2_NR_GROUPS	9
-- 
1.7.9.5

From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [[PATCH v2] 08/11] irqchip: exynos: fix usage of __raw IO
Date: Tue, 21 Jun 2016 11:20:29 +0100
Message-ID: <1466504432-24187-9-git-send-email-ben.dooks@codethink.co.uk>
References: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:49260 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751975AbcFUKUf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 06:20:35 -0400
In-Reply-To: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: matthew.leach@codethink.co.uk, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier w <marc.zyngier@arm.com>

Fix the use of __raw IO accesors when the readl/writel_relaxed
are better. This should fix issues if the kernel is running as
big endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Jason Cooper <jason@lakedaemon.net>
CC: Marc Zyngier <marc.zyngier@arm.com>w
---
 drivers/irqchip/exynos-combiner.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index ead15be..b78a169 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -55,14 +55,14 @@ static void combiner_mask_irq(struct irq_data *data)
 {
 	u32 mask = 1 << (data->hwirq % 32);
 
-	__raw_writel(mask, combiner_base(data) + COMBINER_ENABLE_CLEAR);
+	writel_relaxed(mask, combiner_base(data) + COMBINER_ENABLE_CLEAR);
 }
 
 static void combiner_unmask_irq(struct irq_data *data)
 {
 	u32 mask = 1 << (data->hwirq % 32);
 
-	__raw_writel(mask, combiner_base(data) + COMBINER_ENABLE_SET);
+	writel_relaxed(mask, combiner_base(data) + COMBINER_ENABLE_SET);
 }
 
 static void combiner_handle_cascade_irq(struct irq_desc *desc)
@@ -75,7 +75,7 @@ static void combiner_handle_cascade_irq(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	spin_lock(&irq_controller_lock);
-	status = __raw_readl(chip_data->base + COMBINER_INT_STATUS);
+	status = readl_relaxed(chip_data->base + COMBINER_INT_STATUS);
 	spin_unlock(&irq_controller_lock);
 	status &= chip_data->irq_mask;
 
@@ -135,7 +135,7 @@ static void __init combiner_init_one(struct combiner_chip_data *combiner_data,
 	combiner_data->parent_irq = irq;
 
 	/* Disable all interrupts */
-	__raw_writel(combiner_data->irq_mask, base + COMBINER_ENABLE_CLEAR);
+	writel_relaxed(combiner_data->irq_mask, base + COMBINER_ENABLE_CLEAR);
 }
 
 static int combiner_irq_domain_xlate(struct irq_domain *d,
@@ -218,7 +218,7 @@ static int combiner_suspend(void)
 
 	for (i = 0; i < max_nr; i++)
 		combiner_data[i].pm_save =
-			__raw_readl(combiner_data[i].base + COMBINER_ENABLE_SET);
+			readl_relaxed(combiner_data[i].base + COMBINER_ENABLE_SET);
 
 	return 0;
 }
@@ -235,9 +235,9 @@ static void combiner_resume(void)
 	int i;
 
 	for (i = 0; i < max_nr; i++) {
-		__raw_writel(combiner_data[i].irq_mask,
+		writel_relaxed(combiner_data[i].irq_mask,
 			     combiner_data[i].base + COMBINER_ENABLE_CLEAR);
-		__raw_writel(combiner_data[i].pm_save,
+		writel_relaxed(combiner_data[i].pm_save,
 			     combiner_data[i].base + COMBINER_ENABLE_SET);
 	}
 }
-- 
2.8.1

From: Matthew Leach <matthew@mattleach.net>
Subject: [PATCH v2 1/3] irqchip: exynos_combiner: fixup reg access on be
Date: Wed, 22 Jun 2016 17:57:01 +0100
Message-ID: <20160622165703.7775-2-matthew@mattleach.net>
References: <20160622165703.7775-1-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160622165703.7775-1-matthew@mattleach.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Matthew Leach <matthew@mattleach.net>, linux-samsung-soc@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Use the byte-order aware big endian accessors, allowing for kernels
running under big-endian.

Signed-off-by: Matthew Leach <matthew@mattleach.net>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Jason Cooper <jason@lakedaemon.net>
CC: Marc Zyngier <marc.zyngier@arm.com>
CC: Kukjin Kim <kgene@kernel.org>
CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
---
 drivers/irqchip/exynos-combiner.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index ead15be..97ae34c 100644
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
@@ -235,10 +235,10 @@ static void combiner_resume(void)
 	int i;
 
 	for (i = 0; i < max_nr; i++) {
-		__raw_writel(combiner_data[i].irq_mask,
-			     combiner_data[i].base + COMBINER_ENABLE_CLEAR);
-		__raw_writel(combiner_data[i].pm_save,
-			     combiner_data[i].base + COMBINER_ENABLE_SET);
+		writel_relaxed(combiner_data[i].irq_mask,
+			       combiner_data[i].base + COMBINER_ENABLE_CLEAR);
+		writel_relaxed(combiner_data[i].pm_save,
+			       combiner_data[i].base + COMBINER_ENABLE_SET);
 	}
 }
 
-- 
2.8.3

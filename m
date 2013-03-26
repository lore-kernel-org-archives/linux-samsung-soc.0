From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v6 6/7] irqchip: s3c24xx: make interrupt handling independent of irq_domain structure
Date: Tue, 26 Mar 2013 23:09:57 +0100
Message-ID: <201303262309.57990.heiko@sntech.de>
References: <201303262305.49725.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:32882 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751615Ab3CZWJw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 18:09:52 -0400
In-Reply-To: <201303262305.49725.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Keep a pointer to the corresponding s3c_irq_data struct as irq_chip_data.
This removes the need to fetch the intc struct from the irq_domains
host_data, thus making it independent of the underlying irq_domain
structure.

Also keep the real register offset of the interrupt in the s3c_irq_data
struct to make it independent of the hwirq structure in the irq_domain

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/irqchip/irq-s3c24xx.c |   25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index 9914abd..02b82db 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -43,6 +43,7 @@
 
 struct s3c_irq_data {
 	unsigned int type;
+	unsigned long offset;
 	unsigned long parent_irq;
 
 	/* data gets filled during init */
@@ -79,15 +80,15 @@ static struct s3c_irq_intc *s3c_intc[3];
 
 static void s3c_irq_mask(struct irq_data *data)
 {
-	struct s3c_irq_intc *intc = data->domain->host_data;
+	struct s3c_irq_data *irq_data = irq_data_get_irq_chip_data(data);
+	struct s3c_irq_intc *intc = irq_data->intc;
 	struct s3c_irq_intc *parent_intc = intc->parent;
-	struct s3c_irq_data *irq_data = &intc->irqs[data->hwirq];
 	struct s3c_irq_data *parent_data;
 	unsigned long mask;
 	unsigned int irqno;
 
 	mask = __raw_readl(intc->reg_mask);
-	mask |= (1UL << data->hwirq);
+	mask |= (1UL << irq_data->offset);
 	__raw_writel(mask, intc->reg_mask);
 
 	if (parent_intc) {
@@ -104,14 +105,14 @@ static void s3c_irq_mask(struct irq_data *data)
 
 static void s3c_irq_unmask(struct irq_data *data)
 {
-	struct s3c_irq_intc *intc = data->domain->host_data;
+	struct s3c_irq_data *irq_data = irq_data_get_irq_chip_data(data);
+	struct s3c_irq_intc *intc = irq_data->intc;
 	struct s3c_irq_intc *parent_intc = intc->parent;
-	struct s3c_irq_data *irq_data = &intc->irqs[data->hwirq];
 	unsigned long mask;
 	unsigned int irqno;
 
 	mask = __raw_readl(intc->reg_mask);
-	mask &= ~(1UL << data->hwirq);
+	mask &= ~(1UL << irq_data->offset);
 	__raw_writel(mask, intc->reg_mask);
 
 	if (parent_intc) {
@@ -123,8 +124,9 @@ static void s3c_irq_unmask(struct irq_data *data)
 
 static inline void s3c_irq_ack(struct irq_data *data)
 {
-	struct s3c_irq_intc *intc = data->domain->host_data;
-	unsigned long bitval = 1UL << data->hwirq;
+	struct s3c_irq_data *irq_data = irq_data_get_irq_chip_data(data);
+	struct s3c_irq_intc *intc = irq_data->intc;
+	unsigned long bitval = 1UL << irq_data->offset;
 
 	__raw_writel(bitval, intc->reg_pending);
 	if (intc->reg_intpnd)
@@ -291,8 +293,7 @@ static struct irq_chip s3c_irq_eint0t4 = {
 static void s3c_irq_demux(unsigned int irq, struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct s3c_irq_intc *intc = desc->irq_data.domain->host_data;
-	struct s3c_irq_data *irq_data = &intc->irqs[desc->irq_data.hwirq];
+	struct s3c_irq_data *irq_data = irq_desc_get_chip_data(desc);
 	struct s3c_irq_intc *sub_intc = irq_data->sub_intc;
 	unsigned long src;
 	unsigned long msk;
@@ -406,6 +407,7 @@ static int s3c24xx_irq_map(struct irq_domain *h, unsigned int virq,
 
 	/* attach controller pointer to irq_data */
 	irq_data->intc = intc;
+	irq_data->offset = hw;
 
 	parent_intc = intc->parent;
 
@@ -444,6 +446,9 @@ static int s3c24xx_irq_map(struct irq_domain *h, unsigned int virq,
 		pr_err("irq-s3c24xx: unsupported irqtype %d\n", irq_data->type);
 		return -EINVAL;
 	}
+
+	irq_set_chip_data(virq, irq_data);
+
 	set_irq_flags(virq, IRQF_VALID);
 
 	if (parent_intc && irq_data->type != S3C_IRQTYPE_NONE) {
-- 
1.7.10.4

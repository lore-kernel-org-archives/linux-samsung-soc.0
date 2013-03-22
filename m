From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v4 4/5] irqchip: s3c24xx: add irq_set_type callback for basic interrupt types
Date: Fri, 22 Mar 2013 18:46:04 +0100
Message-ID: <201303221846.04867.heiko@sntech.de>
References: <201303221843.37668.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42551 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422689Ab3CVRqO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 13:46:14 -0400
In-Reply-To: <201303221843.37668.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Enables post-init setting of the desired typehandler for the interrupt.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/irqchip/irq-s3c24xx.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/irqchip/irq-s3c24xx.c b/drivers/irqchip/irq-s3c24xx.c
index a565eb8..7cba4f0 100644
--- a/drivers/irqchip/irq-s3c24xx.c
+++ b/drivers/irqchip/irq-s3c24xx.c
@@ -123,6 +123,28 @@ static inline void s3c_irq_ack(struct irq_data *data)
 		__raw_writel(bitval, intc->reg_intpnd);
 }
 
+static int s3c_irq_type(struct irq_data *data, unsigned int type)
+{
+	switch (type) {
+	case IRQ_TYPE_NONE:
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_set_handler(data->irq, handle_edge_irq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_handler(data->irq, handle_level_irq);
+		break;
+	default:
+		pr_err("No such irq type %d", type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int s3c_irqext_type_set(void __iomem *gpcon_reg,
 			       void __iomem *extint_reg,
 			       unsigned long gpcon_offset,
@@ -228,6 +250,7 @@ static struct irq_chip s3c_irq_chip = {
 	.irq_ack	= s3c_irq_ack,
 	.irq_mask	= s3c_irq_mask,
 	.irq_unmask	= s3c_irq_unmask,
+	.irq_set_type	= s3c_irq_type,
 	.irq_set_wake	= s3c_irq_wake
 };
 
@@ -236,6 +259,7 @@ static struct irq_chip s3c_irq_level_chip = {
 	.irq_mask	= s3c_irq_mask,
 	.irq_unmask	= s3c_irq_unmask,
 	.irq_ack	= s3c_irq_ack,
+	.irq_set_type	= s3c_irq_type,
 };
 
 static struct irq_chip s3c_irqext_chip = {
-- 
1.7.2.3

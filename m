From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 04/10] ARM: S3C24XX: integrate s3c2440 irqs into common init
Date: Sat, 9 Feb 2013 18:14:04 +0100
Message-ID: <201302091814.04577.heiko@sntech.de>
References: <201302091811.05437.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:37519 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760757Ab3BIROK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Feb 2013 12:14:10 -0500
In-Reply-To: <201302091811.05437.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Now all the arch_initcalls for s3c244x irqs are gone.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/irq.c |   46 ++++++++++++------------------------------
 1 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/irq.c b/arch/arm/mach-s3c24xx/irq.c
index 592072b..998e6a8 100644
--- a/arch/arm/mach-s3c24xx/irq.c
+++ b/arch/arm/mach-s3c24xx/irq.c
@@ -840,44 +840,12 @@ static struct irq_chip s3c_irq_wdtac97 = {
 	.irq_ack	= s3c_irq_wdtac97_ack,
 };
 
-static int s3c2440_irq_add(struct device *dev, struct subsys_interface *sif)
+void __init s3c2440_init_irq(void)
 {
 	unsigned int irqno;
 
 	printk("S3C2440: IRQ Support\n");
 
-	/* add new chained handler for wdt, ac7 */
-
-	irq_set_chip_and_handler(IRQ_WDT, &s3c_irq_level_chip,
-				 handle_level_irq);
-	irq_set_chained_handler(IRQ_WDT, s3c_irq_demux_wdtac97);
-
-	for (irqno = IRQ_S3C2440_WDT; irqno <= IRQ_S3C2440_AC97; irqno++) {
-		irq_set_chip_and_handler(irqno, &s3c_irq_wdtac97,
-					 handle_level_irq);
-		set_irq_flags(irqno, IRQF_VALID);
-	}
-
-	return 0;
-}
-
-static struct subsys_interface s3c2440_irq_interface = {
-	.name		= "s3c2440_irq",
-	.subsys		= &s3c2440_subsys,
-	.add_dev	= s3c2440_irq_add,
-};
-
-static int s3c2440_irq_init(void)
-{
-	return subsys_interface_register(&s3c2440_irq_interface);
-}
-
-arch_initcall(s3c2440_irq_init);
-
-void __init s3c2440_init_irq(void)
-{
-	unsigned int irqno;
-
 	s3c24xx_init_irq();
 
 	irq_set_chip_and_handler(IRQ_NFCON, &s3c_irq_level_chip,
@@ -895,6 +863,18 @@ void __init s3c2440_init_irq(void)
 					 handle_level_irq);
 		set_irq_flags(irqno, IRQF_VALID);
 	}
+
+	/* add new chained handler for wdt, ac7 */
+
+	irq_set_chip_and_handler(IRQ_WDT, &s3c_irq_level_chip,
+				 handle_level_irq);
+	irq_set_chained_handler(IRQ_WDT, s3c_irq_demux_wdtac97);
+
+	for (irqno = IRQ_S3C2440_WDT; irqno <= IRQ_S3C2440_AC97; irqno++) {
+		irq_set_chip_and_handler(irqno, &s3c_irq_wdtac97,
+					 handle_level_irq);
+		set_irq_flags(irqno, IRQF_VALID);
+	}
 }
 #endif
 
-- 
1.7.2.3

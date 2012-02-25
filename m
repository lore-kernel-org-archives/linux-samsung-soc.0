From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: [PATCH] s3c24xx: Fix level irqs on external interrupts.
Date: Sat, 25 Feb 2012 17:33:08 +0100
Message-ID: <1330187588-2636-2-git-send-email-GNUtoo@no-log.org>
References: <1330187588-2636-1-git-send-email-GNUtoo@no-log.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp202.alice.it ([82.57.200.98]:51887 "EHLO smtp202.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757106Ab2BYQdR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Feb 2012 11:33:17 -0500
In-Reply-To: <1330187588-2636-1-git-send-email-GNUtoo@no-log.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Martin Jansa <Martin.Jansa@gmail.com>

From: Lars-Peter Clausen <lars@metafoo.de>

Although the external interrupts support level and edge triggered irqs their
handler is currently always set to handle_edge_irq().
While being technically wrong for a level triggered irq to be handled by
handle_edge_irq() it will cause serious problems in combination with a oneshot
irq. handle_edge_irq() will unmask the irq immediately and as a result the irq
will be triggered again before the threaded irq handler had a chance to run and
clear the irq source.

Thus level triggered irqs should be handled by handle_level_irq.
According to the specs the irq controller will remember if an irq has been
triggered while it had been masked and will issue it when the irq gets
unmasked. Thus it is sufficient to use handle_level_irq() for edge triggered
irqs as well. Hence handle_level_irq() can always be used for external
interrupts.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 arch/arm/plat-s3c24xx/irq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
index bc42c04..a429996 100644
--- a/arch/arm/plat-s3c24xx/irq.c
+++ b/arch/arm/plat-s3c24xx/irq.c
@@ -625,14 +625,14 @@ void __init s3c24xx_init_irq(void)
 	for (irqno = IRQ_EINT0; irqno <= IRQ_EINT3; irqno++) {
 		irqdbf("registering irq %d (ext int)\n", irqno);
 		irq_set_chip_and_handler(irqno, &s3c_irq_eint0t4,
-					 handle_edge_irq);
+					 handle_level_irq);
 		set_irq_flags(irqno, IRQF_VALID);
 	}
 
 	for (irqno = IRQ_EINT4; irqno <= IRQ_EINT23; irqno++) {
 		irqdbf("registering irq %d (extended s3c irq)\n", irqno);
 		irq_set_chip_and_handler(irqno, &s3c_irqext_chip,
-					 handle_edge_irq);
+					 handle_level_irq);
 		set_irq_flags(irqno, IRQF_VALID);
 	}
 
-- 
1.7.4.1

From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH] ARM: S3C24XX: Fix interrupt pending register offset of the EINT controller
Date: Mon,  8 Apr 2013 21:53:07 +0200
Message-ID: <1365450787-14473-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:59518 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935775Ab3DHTxS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 15:53:18 -0400
Received: by mail-ee0-f42.google.com with SMTP id d4so1740208eek.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 12:53:17 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The external pending interrupt register address (EINTPEND) offset is
0xa8, not 0x08. Without this patch the external interrupts are not
properly acknowledged, which may lead to an interrupt storm and the
system hang as soon as any external interrupt is requested.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---

This patch is for _3.9_. I'm going to send a similar patch for 3.10-rc2
for drivers/irqchip/irq-s3c24xx.c.
---
 arch/arm/mach-s3c24xx/irq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/irq.c b/arch/arm/mach-s3c24xx/irq.c
index cb9f5e0..d8ba9be 100644
--- a/arch/arm/mach-s3c24xx/irq.c
+++ b/arch/arm/mach-s3c24xx/irq.c
@@ -500,7 +500,7 @@ struct s3c_irq_intc *s3c24xx_init_intc(struct device_node *np,
 		base = (void *)0xfd000000;

 		intc->reg_mask = base + 0xa4;
-		intc->reg_pending = base + 0x08;
+		intc->reg_pending = base + 0xa8;
 		irq_num = 20;
 		irq_start = S3C2410_IRQ(32);
 		irq_offset = 4;
--
1.7.4.1

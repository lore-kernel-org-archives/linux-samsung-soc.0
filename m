From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Samsung: gpio-interrupts: fix offset calculation
Date: Tue, 18 Oct 2011 12:16:22 +0200
Message-ID: <1318932982-15745-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22880 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753973Ab1JRKQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Oct 2011 06:16:33 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LT9004LAB7IUY30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Oct 2011 11:16:30 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LT9006COB7HC2@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Oct 2011 11:16:30 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Offsets of the irq controller registers were calculated correctly only
for first GPIO bank. This patch fixes calculation of the register
offsets for all GPIO banks.

Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/irq-gpioint.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-s5p/irq-gpioint.c b/arch/arm/plat-s5p/irq-gpioint.c
index a566523..1fdfaa4 100644
--- a/arch/arm/plat-s5p/irq-gpioint.c
+++ b/arch/arm/plat-s5p/irq-gpioint.c
@@ -163,9 +163,9 @@ static __init int s5p_gpioint_add(struct samsung_gpio_chip *chip)
 	ct->chip.irq_mask = irq_gc_mask_set_bit;
 	ct->chip.irq_unmask = irq_gc_mask_clr_bit;
 	ct->chip.irq_set_type = s5p_gpioint_set_type,
-	ct->regs.ack = PEND_OFFSET + REG_OFFSET(chip->group);
-	ct->regs.mask = MASK_OFFSET + REG_OFFSET(chip->group);
-	ct->regs.type = CON_OFFSET + REG_OFFSET(chip->group);
+	ct->regs.ack = PEND_OFFSET + REG_OFFSET(group - bank->start);
+	ct->regs.mask = MASK_OFFSET + REG_OFFSET(group - bank->start);
+	ct->regs.type = CON_OFFSET + REG_OFFSET(group - bank->start);
 	irq_setup_generic_chip(gc, IRQ_MSK(chip->chip.ngpio),
 			       IRQ_GC_INIT_MASK_CACHE,
 			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
-- 
1.7.1.569.g6f426

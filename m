From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: Samsung: Add chained enrty/exit call to timer
 interrupt handler
Date: Tue, 26 Jul 2011 07:50:55 +0200
Message-ID: <1311659456-6659-2-git-send-email-m.szyprowski@samsung.com>
References: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28632 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342Ab1GZFvG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 01:51:06 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOX008W9EX2WR@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 06:51:02 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOX009JTEX1K8@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 06:51:01 +0100 (BST)
In-reply-to: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

This patch adds chained IRQ enter/exit functions to timer
interrupt handler in order to function correctly on primary
controllers with different methods of flow control.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/irq-vic-timer.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/irq-vic-timer.c b/arch/arm/plat-samsung/irq-vic-timer.c
index a607546..6df9e33 100644
--- a/arch/arm/plat-samsung/irq-vic-timer.c
+++ b/arch/arm/plat-samsung/irq-vic-timer.c
@@ -22,9 +22,14 @@
 #include <plat/irq-vic-timer.h>
 #include <plat/regs-timer.h>
 
+#include <asm/mach/irq.h>
+
 static void s3c_irq_demux_vic_timer(unsigned int irq, struct irq_desc *desc)
 {
+	struct irq_chip *chip = irq_get_chip(irq);
+	chained_irq_enter(chip, desc);
 	generic_handle_irq((int)desc->irq_data.handler_data);
+	chained_irq_exit(chip, desc);
 }
 
 /* We assume the IRQ_TIMER0..IRQ_TIMER4 range is continuous. */
-- 
1.7.1.569.g6f426

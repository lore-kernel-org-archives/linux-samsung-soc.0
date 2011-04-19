From: Changhwan Youn <chaos.youn@samsung.com>
Subject: [PATCH 1/3] ARM: SAMSUNG: add entry and exit functions for uart interrupt chained handler
Date: Tue, 19 Apr 2011 10:45:24 +0900
Message-ID: <1303177526-11744-2-git-send-email-chaos.youn@samsung.com>
References: <1303177526-11744-1-git-send-email-chaos.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35724 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753918Ab1DSCRH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2011 22:17:07 -0400
In-Reply-To: <1303177526-11744-1-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Changhwan Youn <chaos.youn@samsung.com>

This functions are added for properly controlling primary controller
in uart interrupt chained handler.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/plat-samsung/irq-uart.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/irq-uart.c b/arch/arm/plat-samsung/irq-uart.c
index 4e77035..24da4d4 100644
--- a/arch/arm/plat-samsung/irq-uart.c
+++ b/arch/arm/plat-samsung/irq-uart.c
@@ -23,6 +23,7 @@
 #include <plat/irq-uart.h>
 #include <plat/regs-serial.h>
 #include <plat/cpu.h>
+#include <asm/mach/irq.h>
 
 /* Note, we make use of the fact that the parent IRQs, IRQ_UART[0..3]
  * are consecutive when looking up the interrupt in the demux routines.
@@ -86,6 +87,9 @@ static void s3c_irq_demux_uart(unsigned int irq, struct irq_desc *desc)
 	struct s3c_uart_irq *uirq = desc->irq_data.handler_data;
 	u32 pend = __raw_readl(uirq->regs + S3C64XX_UINTP);
 	int base = uirq->base_irq;
+	struct irq_chip *chip = get_irq_chip(irq);
+
+	chained_irq_enter(chip, desc);
 
 	if (pend & (1 << 0))
 		generic_handle_irq(base);
@@ -95,6 +99,8 @@ static void s3c_irq_demux_uart(unsigned int irq, struct irq_desc *desc)
 		generic_handle_irq(base + 2);
 	if (pend & (1 << 3))
 		generic_handle_irq(base + 3);
+
+	chained_irq_exit(chip, desc);
 }
 
 static struct irq_chip s3c_irq_uart = {
-- 
1.7.1

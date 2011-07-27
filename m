From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: Exynos4: add required chained_irq_enter/exit to eint
 code
Date: Wed, 27 Jul 2011 12:13:20 +0200
Message-ID: <1311761601-1570-2-git-send-email-m.szyprowski@samsung.com>
References: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19350 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754041Ab1G0KNm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 06:13:42 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOZ008HOLQUGS@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 11:13:42 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOZ00JB8LQSVX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 11:13:40 +0100 (BST)
In-reply-to: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

This patch adds chained IRQ enter/exit functions to external interrupt
handler in order to function correctly on primary controllers with
different methods of flow control.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/irq-eint.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/irq-eint.c b/arch/arm/mach-exynos4/irq-eint.c
index 9d87d2a..badb8c6 100644
--- a/arch/arm/mach-exynos4/irq-eint.c
+++ b/arch/arm/mach-exynos4/irq-eint.c
@@ -23,6 +23,8 @@
 
 #include <mach/regs-gpio.h>
 
+#include <asm/mach/irq.h>
+
 static DEFINE_SPINLOCK(eint_lock);
 
 static unsigned int eint0_15_data[16];
@@ -184,8 +186,11 @@ static inline void exynos4_irq_demux_eint(unsigned int start)
 
 static void exynos4_irq_demux_eint16_31(unsigned int irq, struct irq_desc *desc)
 {
+	struct irq_chip *chip = irq_get_chip(irq);
+	chained_irq_enter(chip, desc);
 	exynos4_irq_demux_eint(IRQ_EINT(16));
 	exynos4_irq_demux_eint(IRQ_EINT(24));
+	chained_irq_exit(chip, desc);
 }
 
 static void exynos4_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
@@ -193,6 +198,7 @@ static void exynos4_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
 	u32 *irq_data = irq_get_handler_data(irq);
 	struct irq_chip *chip = irq_get_chip(irq);
 
+	chained_irq_enter(chip, desc);
 	chip->irq_mask(&desc->irq_data);
 
 	if (chip->irq_ack)
@@ -201,6 +207,7 @@ static void exynos4_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
 	generic_handle_irq(*irq_data);
 
 	chip->irq_unmask(&desc->irq_data);
+	chained_irq_exit(chip, desc);
 }
 
 int __init exynos4_init_irq_eint(void)
-- 
1.7.1.569.g6f426

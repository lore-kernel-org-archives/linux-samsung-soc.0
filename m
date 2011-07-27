From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: S5P: add required chained_irq_enter/exit to gpio-int
 code
Date: Wed, 27 Jul 2011 12:13:21 +0200
Message-ID: <1311761601-1570-3-git-send-email-m.szyprowski@samsung.com>
References: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63369 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754041Ab1G0KNo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 06:13:44 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOZ00K71LQV6F@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 11:13:43 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOZ00KY8LQUIM@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 11:13:42 +0100 (BST)
In-reply-to: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

This patch adds chained IRQ enter/exit functions to gpio interrupt
handler in order to function correctly on primary controllers with
different methods of flow control.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/irq-gpioint.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/irq-gpioint.c b/arch/arm/plat-s5p/irq-gpioint.c
index 135abda..905711f 100644
--- a/arch/arm/plat-s5p/irq-gpioint.c
+++ b/arch/arm/plat-s5p/irq-gpioint.c
@@ -23,6 +23,8 @@
 #include <plat/gpio-core.h>
 #include <plat/gpio-cfg.h>
 
+#include <asm/mach/irq.h>
+
 #define GPIO_BASE(chip)		(((unsigned long)(chip)->base) & 0xFFFFF000u)
 
 #define CON_OFFSET		0x700
@@ -81,6 +83,9 @@ static void s5p_gpioint_handler(unsigned int irq, struct irq_desc *desc)
 	int group, pend_offset, mask_offset;
 	unsigned int pend, mask;
 
+	struct irq_chip *chip = irq_get_chip(irq);
+	chained_irq_enter(chip, desc);
+
 	for (group = 0; group < bank->nr_groups; group++) {
 		struct s3c_gpio_chip *chip = bank->chips[group];
 		if (!chip)
@@ -102,6 +107,7 @@ static void s5p_gpioint_handler(unsigned int irq, struct irq_desc *desc)
 			pend &= ~BIT(offset);
 		}
 	}
+	chained_irq_exit(chip, desc);
 }
 
 static __init int s5p_gpioint_add(struct s3c_gpio_chip *chip)
-- 
1.7.1.569.g6f426

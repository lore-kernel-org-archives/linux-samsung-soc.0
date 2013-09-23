From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: [PATCH] DT: S5P: If detected device tree skip irq init
Date: Mon, 23 Sep 2013 12:13:42 +0200
Message-ID: <1379931222-29307-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21843 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753390Ab3IWKN4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 06:13:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, t.figa@samsung.com, m.szyprowski@samsung.com, Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

It prevents from executing code already called by device tree.

Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/s5p-irq-eint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/plat-samsung/s5p-irq-eint.c b/arch/arm/plat-samsung/s5p-irq-eint.c
index faa6516..ebee4dc 100644
--- a/arch/arm/plat-samsung/s5p-irq-eint.c
+++ b/arch/arm/plat-samsung/s5p-irq-eint.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/gpio.h>
 #include <linux/irqchip/arm-vic.h>
+#include <linux/of.h>
 
 #include <plat/regs-irqtype.h>
 
@@ -202,6 +203,9 @@ static int __init s5p_init_irq_eint(void)
 {
 	int irq;
 
+	if (of_have_populated_dt())
+		return -ENODEV;
+
 	for (irq = IRQ_EINT(0); irq <= IRQ_EINT(15); irq++)
 		irq_set_chip(irq, &s5p_irq_vic_eint);
 
-- 
1.8.1.2

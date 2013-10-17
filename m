From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] irqchip: exynos: Remove hardcoded irqbase
Date: Thu, 17 Oct 2013 16:34:41 +0530
Message-ID: <1382007881-1161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:51365 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753343Ab3JQLFc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 07:05:32 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so2566364pad.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2013 04:05:31 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tglx@linutronix.de, sachin.kamat@linaro.org

Now that Exynos platforms are DT only, hard-coded irqbase is not
necessary.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/irqchip/exynos-combiner.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 868ed40..08538df 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -207,7 +207,7 @@ static int __init combiner_of_init(struct device_node *np,
 {
 	void __iomem *combiner_base;
 	unsigned int max_nr = 20;
-	int irq_base = -1;
+	int irq_base = 0;
 
 	combiner_base = of_iomap(np, 0);
 	if (!combiner_base) {
@@ -221,13 +221,6 @@ static int __init combiner_of_init(struct device_node *np,
 			__func__, max_nr);
 	}
 
-	/* 
-	 * FIXME: This is a hardwired COMBINER_IRQ(0,0). Once all devices
-	 * get their IRQ from DT, remove this in order to get dynamic
-	 * allocation.
-	 */
-	irq_base = 160;
-
 	combiner_init(combiner_base, np, max_nr, irq_base);
 
 	return 0;
-- 
1.7.9.5

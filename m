From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] irqchip: exynos-combiner: Staticize combiner_init
Date: Wed, 26 Jun 2013 17:06:37 +0530
Message-ID: <1372246597-32323-2-git-send-email-sachin.kamat@linaro.org>
References: <1372246597-32323-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:33098 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752307Ab3FZLv6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 07:51:58 -0400
Received: by mail-pb0-f48.google.com with SMTP id ma3so13946070pbc.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2013 04:51:58 -0700 (PDT)
In-Reply-To: <1372246597-32323-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, tglx@linutronix.de, t.figa@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org, patches@linaro.org

combiner_init() is referenced only in this file. Make it
static.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/irqchip/exynos-combiner.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index a9d2b2f..4c68265 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -204,10 +204,10 @@ static unsigned int combiner_lookup_irq(int group)
 	return 0;
 }
 
-void __init combiner_init(void __iomem *combiner_base,
-			  struct device_node *np,
-			  unsigned int max_nr,
-			  int irq_base)
+static void __init combiner_init(void __iomem *combiner_base,
+				 struct device_node *np,
+				 unsigned int max_nr,
+				 int irq_base)
 {
 	int i, irq;
 	unsigned int nr_irq;
-- 
1.7.9.5

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2] ARM: S5PV310: Optimize interrupt source searching code
Date: Tue, 28 Sep 2010 13:22:17 +0900
Message-ID: <1285647737-28820-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55273 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab0I1ElX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 00:41:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

It is reported by Junseok Jung that using clz instruction is
better instead of using for-loop to find the interrupt source.
This patch modifies interrupt source searching code using __ffs().
The __ffs() is implemented using clz instruction.

Suggested-by: Junseok Jung <jundols.jung@samsung.com>
Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1:
- Modified to ffs as per Troy Kisky's pointing out
  In this case, the ffs is more suitable according to original code.

 arch/arm/mach-s5pv310/irq-combiner.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s5pv310/irq-combiner.c b/arch/arm/mach-s5pv310/irq-combiner.c
index 0f70521..c3f88c3 100644
--- a/arch/arm/mach-s5pv310/irq-combiner.c
+++ b/arch/arm/mach-s5pv310/irq-combiner.c
@@ -66,11 +66,7 @@ static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
 	if (status == 0)
 		goto out;
 
-	for (combiner_irq = 0; combiner_irq < 32; combiner_irq++) {
-		if (status & 0x1)
-			break;
-		status >>= 1;
-	}
+	combiner_irq = __ffs(status);
 
 	cascade_irq = combiner_irq + (chip_data->irq_offset & ~31);
 	if (unlikely(cascade_irq >= NR_IRQS))
-- 
1.6.2.5

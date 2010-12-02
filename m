From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] ARM: S5PV310: Add irq_mask to handle combiner irqs properly
Date: Thu,  2 Dec 2010 18:36:12 +0900
Message-ID: <1291282572-11735-3-git-send-email-kgene.kim@samsung.com>
References: <1291282572-11735-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60108 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053Ab0LBJxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:53:10 -0500
In-Reply-To: <1291282572-11735-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

The 4 combiner groups use same registers to handle the interrupt.
In previous implementation, the whole registers are checked to find
which interupt is occurred and thus interrupt in other groups can
be detected. This patch adds irq_mask to solve this problem.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/irq-combiner.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv310/irq-combiner.c b/arch/arm/mach-s5pv310/irq-combiner.c
index c3f88c3..aad5c3d 100644
--- a/arch/arm/mach-s5pv310/irq-combiner.c
+++ b/arch/arm/mach-s5pv310/irq-combiner.c
@@ -24,6 +24,7 @@ static DEFINE_SPINLOCK(irq_controller_lock);
 
 struct combiner_chip_data {
 	unsigned int irq_offset;
+	unsigned int irq_mask;
 	void __iomem *base;
 };
 
@@ -62,6 +63,7 @@ static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
 	spin_lock(&irq_controller_lock);
 	status = __raw_readl(chip_data->base + COMBINER_INT_STATUS);
 	spin_unlock(&irq_controller_lock);
+	status &= chip_data->irq_mask;
 
 	if (status == 0)
 		goto out;
@@ -104,10 +106,12 @@ void __init combiner_init(unsigned int combiner_nr, void __iomem *base,
 
 	combiner_data[combiner_nr].base = base;
 	combiner_data[combiner_nr].irq_offset = irq_start;
+	combiner_data[combiner_nr].irq_mask = 0xff << ((combiner_nr % 4) << 3);
 
 	/* Disable all interrupts */
 
-	__raw_writel(0xffffffff, base + COMBINER_ENABLE_CLEAR);
+	__raw_writel(combiner_data[combiner_nr].irq_mask,
+		     base + COMBINER_ENABLE_CLEAR);
 
 	/* Setup the Linux IRQ subsystem */
 
-- 
1.6.2.5

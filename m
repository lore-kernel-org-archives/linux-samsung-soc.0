From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: S5P: Can handle edge interrupt handler
Date: Fri, 10 Feb 2012 22:02:42 +0900
Message-ID: <017401cce7f4$4623f5a0$d26be0e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65066 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757427Ab2BJNCn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 08:02:43 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600FQWHK8Z4W0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 22:02:42 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600HE4HKIJM80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 22:02:42 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, keyyoung.park@samsung.com

From: KeyYoung Park <keyyoung.park@samsung.com>

While wake up, if external interrupt uses handle_level_irq
as handle_irq (it actually uses edge type irq), That interrupt is missed.
So, if external uses edge type irq, it should use handle_edge_irq.

Signed-off-by: KeyYoung Park <keyyoung.park@samsung.com>
Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-s5p/irq-eint.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-eint.c
index c496b35..6ed395e 100644
--- a/arch/arm/plat-s5p/irq-eint.c
+++ b/arch/arm/plat-s5p/irq-eint.c
@@ -65,6 +65,7 @@ static int s5p_irq_eint_set_type(struct irq_data *data, unsigned int type)
 	int shift;
 	u32 ctrl, mask;
 	u32 newvalue = 0;
+	struct irq_desc *desc = irq_to_desc(data->irq);
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -115,6 +116,11 @@ static int s5p_irq_eint_set_type(struct irq_data *data, unsigned int type)
 	else
 		printk(KERN_ERR "No such irq number %d", offs);
 
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		desc->handle_irq = handle_edge_irq;
+	else
+		desc->handle_irq = handle_level_irq;
+
 	return 0;
 }
 
-- 
1.7.1

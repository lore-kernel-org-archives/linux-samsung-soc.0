From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/2] dma: pl330: split off common code to give back descriptors
Date: Tue, 02 Apr 2013 21:01:15 +0900
Message-ID: <1364904076-3130-2-git-send-email-chanho61.park@samsung.com>
References: <1364904076-3130-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18314 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754730Ab3DBMCb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 08:02:31 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM00B9GMRREYR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 21:02:30 +0900 (KST)
In-reply-to: <1364904076-3130-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com
Cc: boojin.kim@samsung.com, jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, Chanho Park <chanho61.park@samsung.com>

This patch adds __pl330_giveback_descs which give back descriptors when fails
allocating descriptors. It requires to eliminate duplication for
pl330_prep_dma_sg which will be added later.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/dma/pl330.c |   38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 7181531..47ed13f 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2795,6 +2795,28 @@ pl330_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
 	return &desc->txd;
 }
 
+static void __pl330_giveback_desc(struct dma_pl330_dmac *pdmac,
+				  struct dma_pl330_desc *first)
+{
+	unsigned long flags;
+	struct dma_pl330_desc *desc;
+
+	if (!first)
+		return;
+
+	spin_lock_irqsave(&pdmac->pool_lock, flags);
+
+	while (!list_empty(&first->node)) {
+		desc = list_entry(first->node.next,
+				struct dma_pl330_desc, node);
+		list_move_tail(&desc->node, &pdmac->desc_pool);
+	}
+
+	list_move_tail(&first->node, &pdmac->desc_pool);
+
+	spin_unlock_irqrestore(&pdmac->pool_lock, flags);
+}
+
 static struct dma_async_tx_descriptor *
 pl330_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		unsigned int sg_len, enum dma_transfer_direction direction,
@@ -2803,7 +2825,6 @@ pl330_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	struct dma_pl330_desc *first, *desc = NULL;
 	struct dma_pl330_chan *pch = to_pchan(chan);
 	struct scatterlist *sg;
-	unsigned long flags;
 	int i;
 	dma_addr_t addr;
 
@@ -2823,20 +2844,7 @@ pl330_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 			dev_err(pch->dmac->pif.dev,
 				"%s:%d Unable to fetch desc\n",
 				__func__, __LINE__);
-			if (!first)
-				return NULL;
-
-			spin_lock_irqsave(&pdmac->pool_lock, flags);
-
-			while (!list_empty(&first->node)) {
-				desc = list_entry(first->node.next,
-						struct dma_pl330_desc, node);
-				list_move_tail(&desc->node, &pdmac->desc_pool);
-			}
-
-			list_move_tail(&first->node, &pdmac->desc_pool);
-
-			spin_unlock_irqrestore(&pdmac->pool_lock, flags);
+			__pl330_giveback_desc(pdmac, first);
 
 			return NULL;
 		}
-- 
1.7.9.5

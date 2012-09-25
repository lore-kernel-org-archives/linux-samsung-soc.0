From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH 2/3] DMA: PL330: Change allocation method to properly free DMA descriptors
Date: Tue, 25 Sep 2012 14:27:35 +0530
Message-ID: <1348563456-30569-3-git-send-email-inderpal.singh@linaro.org>
References: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1348563456-30569-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jassisinghbrar@gmail.com, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

In probe, memory for multiple DMA descriptors were being allocated at once
and then it was being split and added into DMA pool one by one. The address
of this memory allocation is not being saved anywhere. To free this memory,
the address is required. Initially the first node of the pool will be
pointed by this address but as we use this pool the descs will shuffle and
hence we will lose the track of the address.

This patch does following:

1. Allocates DMA descs one by one and then adds them to pool so that all
   descs can be fetched and memory freed one by one. This way runtime
   added descs can also be freed.
2. Free DMA descs in case of error in probe and in module's remove function

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 drivers/dma/pl330.c |   28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 10c6b6a..04d83e6 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2541,20 +2541,19 @@ static int add_desc(struct dma_pl330_dmac *pdmac, gfp_t flg, int count)
 	if (!pdmac)
 		return 0;
 
-	desc = kmalloc(count * sizeof(*desc), flg);
-	if (!desc)
-		return 0;
-
 	spin_lock_irqsave(&pdmac->pool_lock, flags);
 
 	for (i = 0; i < count; i++) {
-		_init_desc(&desc[i]);
-		list_add_tail(&desc[i].node, &pdmac->desc_pool);
+		desc = kmalloc(sizeof(*desc), flg);
+		if (!desc)
+			break;
+		_init_desc(desc);
+		list_add_tail(&desc->node, &pdmac->desc_pool);
 	}
 
 	spin_unlock_irqrestore(&pdmac->pool_lock, flags);
 
-	return count;
+	return i;
 }
 
 static struct dma_pl330_desc *
@@ -2857,6 +2856,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	struct dma_pl330_platdata *pdat;
 	struct dma_pl330_dmac *pdmac;
 	struct dma_pl330_chan *pch;
+	struct dma_pl330_desc *desc;
 	struct pl330_info *pi;
 	struct dma_device *pd;
 	struct resource *res;
@@ -2978,6 +2978,12 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 probe_err5:
 	kfree(pdmac->peripherals);
 probe_err4:
+	while (!list_empty(&pdmac->desc_pool)) {
+		desc = list_entry(pdmac->desc_pool.next,
+				struct dma_pl330_desc, node);
+		list_del(&desc->node);
+		kfree(desc);
+	}
 	pl330_del(pi);
 probe_err3:
 	free_irq(irq, pi);
@@ -2994,6 +3000,7 @@ static int __devexit pl330_remove(struct amba_device *adev)
 {
 	struct dma_pl330_dmac *pdmac = amba_get_drvdata(adev);
 	struct dma_pl330_chan *pch, *_p;
+	struct dma_pl330_desc *desc;
 	struct pl330_info *pi;
 	struct resource *res;
 	int irq;
@@ -3015,6 +3022,13 @@ static int __devexit pl330_remove(struct amba_device *adev)
 		pl330_free_chan_resources(&pch->chan);
 	}
 
+	while (!list_empty(&pdmac->desc_pool)) {
+		desc = list_entry(pdmac->desc_pool.next,
+				struct dma_pl330_desc, node);
+		list_del(&desc->node);
+		kfree(desc);
+	}
+
 	pi = &pdmac->pif;
 
 	pl330_del(pi);
-- 
1.7.9.5

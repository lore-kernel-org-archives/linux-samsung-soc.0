From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH v2 3/4] DMA: PL330: Balance module remove function with probe
Date: Fri,  5 Oct 2012 15:47:55 +0530
Message-ID: <1349432276-22919-4-git-send-email-inderpal.singh@linaro.org>
References: <1349432276-22919-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1349432276-22919-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jassisinghbrar@gmail.com, boojin.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Since peripheral channel resources are not being allocated at probe,
no need to flush the channels and free the resources in remove function.
In case, the channel is in use by some client, return EBUSY.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 drivers/dma/pl330.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index bf71ff7..4b7a34d 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -3009,18 +3009,21 @@ static int __devexit pl330_remove(struct amba_device *adev)
 	if (!pdmac)
 		return 0;
 
+	/* check if any client is using any channel */
+	list_for_each_entry(pch, &pdmac->ddma.channels,
+			chan.device_node) {
+
+		if (pch->chan.client_count)
+			return -EBUSY;
+	}
+
 	amba_set_drvdata(adev, NULL);
 
-	/* Idle the DMAC */
 	list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
 			chan.device_node) {
 
 		/* Remove the channel */
 		list_del(&pch->chan.device_node);
-
-		/* Flush the channel */
-		pl330_control(&pch->chan, DMA_TERMINATE_ALL, 0);
-		pl330_free_chan_resources(&pch->chan);
 	}
 
 	while (!list_empty(&pdmac->desc_pool)) {
-- 
1.7.9.5

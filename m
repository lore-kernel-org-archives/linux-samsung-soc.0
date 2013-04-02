From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3] DMA: PL330: Add check if device tree compatible
Date: Tue, 02 Apr 2013 16:46:45 +0530
Message-ID: <1364901405-16541-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13555 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932534Ab3DBLQa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 07:16:30 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM00BYHKN9EYP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 20:16:29 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, vinod.koul@intel.com, boojin.kim@samsung.com

This patch register the dma controller with generic dma helpers only
in DT case. This also adds some extra error handling in the driver.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
---

Based on Vinod Koul next branch.

Changes since V2:
	- Removed pl330_free_chan_resources for error handling in probe. 

Changes since V1:
	- return silently when of_dma_controller_register fails, as
	  suggested by Arnd.

 drivers/dma/pl330.c |   33 ++++++++++++++++++++++-----------
 1 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 345e2a1..fa388c1c 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2882,7 +2882,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct dma_pl330_platdata *pdat;
 	struct dma_pl330_dmac *pdmac;
-	struct dma_pl330_chan *pch;
+	struct dma_pl330_chan *pch, *_p;
 	struct pl330_info *pi;
 	struct dma_device *pd;
 	struct resource *res;
@@ -2984,7 +2984,17 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	ret = dma_async_device_register(pd);
 	if (ret) {
 		dev_err(&adev->dev, "unable to register DMAC\n");
-		goto probe_err2;
+		goto probe_err3;
+	}
+
+	if (adev->dev.of_node) {
+		ret = of_dma_controller_register(adev->dev.of_node,
+					 of_dma_pl330_xlate, pdmac);
+		if (ret) {
+			dev_err(&adev->dev,
+				"unable to register DMA to the generic"
+				"DT DMA helpers\n");
+		}
 	}
 
 	dev_info(&adev->dev,
@@ -2995,16 +3005,15 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 		pi->pcfg.data_bus_width / 8, pi->pcfg.num_chan,
 		pi->pcfg.num_peri, pi->pcfg.num_events);
 
-	ret = of_dma_controller_register(adev->dev.of_node,
-					 of_dma_pl330_xlate, pdmac);
-	if (ret) {
-		dev_err(&adev->dev,
-		"unable to register DMA to the generic DT DMA helpers\n");
-		goto probe_err2;
-	}
-
 	return 0;
+probe_err3:
+	amba_set_drvdata(adev, NULL);
 
+	/* Idle the DMAC */
+	list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
+			chan.device_node)
+		/* Remove the channel */
+		list_del(&pch->chan.device_node);
 probe_err2:
 	pl330_del(pi);
 probe_err1:
@@ -3023,8 +3032,10 @@ static int pl330_remove(struct amba_device *adev)
 	if (!pdmac)
 		return 0;
 
-	of_dma_controller_free(adev->dev.of_node);
+	if (adev->dev.of_node)
+		of_dma_controller_free(adev->dev.of_node);
 
+	dma_async_device_unregister(&pdmac->ddma);
 	amba_set_drvdata(adev, NULL);
 
 	/* Idle the DMAC */
-- 
1.7.4.4

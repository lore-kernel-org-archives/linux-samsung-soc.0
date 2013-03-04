From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] DMA: PL330: Add check if device tree compatible
Date: Mon, 04 Mar 2013 10:59:03 +0530
Message-ID: <1362374943-29312-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19670 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101Ab3CDF2L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 00:28:11 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ40098OF6T1M50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:28:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, padma.v@samsung.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com

This patch register the dma controller with generic dma helpers only
in DT case. This also adds some extra error handling in the driver.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
---

Based on Vinod Koul next branch

 drivers/dma/pl330.c |   41 ++++++++++++++++++++++++++++++-----------
 1 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 7181531..bdad8de 100644
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
+			"unable to register DMA to the generic DT DMA helpers\n");
+			goto probe_err4;
+		}
 	}
 
 	dev_info(&adev->dev,
@@ -2995,16 +3005,23 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
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
+probe_err4:
+	dma_async_device_unregister(pd);
+probe_err3:
+	amba_set_drvdata(adev, NULL);
 
+	/* Idle the DMAC */
+	list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
+			chan.device_node) {
+
+		/* Remove the channel */
+		list_del(&pch->chan.device_node);
+
+		/* Flush the channel */
+		pl330_control(&pch->chan, DMA_TERMINATE_ALL, 0);
+		pl330_free_chan_resources(&pch->chan);
+	}
 probe_err2:
 	pl330_del(pi);
 probe_err1:
@@ -3023,8 +3040,10 @@ static int pl330_remove(struct amba_device *adev)
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

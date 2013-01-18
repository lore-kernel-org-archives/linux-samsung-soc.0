From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/4] DMA: PL330: Register the DMA controller with the generic
 DMA helpers
Date: Fri, 18 Jan 2013 17:03:42 +0530
Message-ID: <1358508824-20352-3-git-send-email-padma.v@samsung.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22055 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab3ARLh1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:37:27 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00D6JKAEA5F0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:37:26 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00M2KK3GTU10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:37:26 +0900 (KST)
In-reply-to: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org

This patch registers the pl330 dma controller driver with the generic
device tree dma helper functions.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/dma/pl330.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index b0a9080..b80ef97 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2874,6 +2874,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	struct dma_pl330_platdata *pdat;
 	struct dma_pl330_dmac *pdmac;
 	struct dma_pl330_chan *pch;
+	struct of_dma_filter_info *pfi;
 	struct pl330_info *pi;
 	struct dma_device *pd;
 	struct resource *res;
@@ -2990,6 +2991,23 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 		pi->pcfg.data_bus_width / 8, pi->pcfg.num_chan,
 		pi->pcfg.num_peri, pi->pcfg.num_events);
 
+	pfi = devm_kzalloc(&adev->dev, sizeof(*pfi), GFP_KERNEL);
+	if (!pfi) {
+		dev_err(&adev->dev, "unable to allocate mem\n");
+		return -ENOMEM;
+	}
+
+	pfi->dma_cap = pd->cap_mask;
+	pfi->filter_fn = pl330_filter;
+
+	ret = of_dma_controller_register(adev->dev.of_node,
+					 of_dma_pl330_xlate, pfi);
+	if (ret) {
+		dev_err(&adev->dev, "unable to register DMA to the\
+					generic DT DMA helpers\n");
+		goto probe_err2;
+	}
+
 	return 0;
 
 probe_err4:
@@ -3016,6 +3034,8 @@ static int pl330_remove(struct amba_device *adev)
 	if (!pdmac)
 		return 0;
 
+	of_dma_controller_free(adev->dev.of_node);
+
 	amba_set_drvdata(adev, NULL);
 
 	/* Idle the DMAC */
-- 
1.7.4.4

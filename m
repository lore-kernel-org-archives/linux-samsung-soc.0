From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 3/5] DMA: PL330: Register the DMA controller with the
 generic DMA helpers
Date: Wed, 06 Feb 2013 11:48:47 +0530
Message-ID: <1360131529-2847-4-git-send-email-padma.v@samsung.com>
References: <1360131529-2847-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60509 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab3BFGSb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 01:18:31 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHS00ESTC6I63N0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 15:18:30 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHS001KWC6CC970@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 15:18:30 +0900 (KST)
In-reply-to: <1360131529-2847-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

This patch registers the pl330 dma controller driver with the generic
device tree dma helper functions.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/pl330.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index e68c83b..3fca247 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2999,6 +2999,14 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 		pi->pcfg.data_bus_width / 8, pi->pcfg.num_chan,
 		pi->pcfg.num_peri, pi->pcfg.num_events);
 
+	ret = of_dma_controller_register(adev->dev.of_node,
+					 of_dma_pl330_xlate, pdmac);
+	if (ret) {
+		dev_err(&adev->dev,
+		"unable to register DMA to the generic DT DMA helpers\n");
+		goto probe_err2;
+	}
+
 	return 0;
 
 probe_err4:
@@ -3025,6 +3033,8 @@ static int pl330_remove(struct amba_device *adev)
 	if (!pdmac)
 		return 0;
 
+	of_dma_controller_free(adev->dev.of_node);
+
 	amba_set_drvdata(adev, NULL);
 
 	/* Idle the DMAC */
-- 
1.7.4.4

From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 3/4] DMA: PL330: Register the DMA controller with the
 generic DMA helpers
Date: Thu, 14 Feb 2013 09:10:07 +0530
Message-ID: <1360813208-9498-4-git-send-email-padma.v@samsung.com>
References: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24222 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754399Ab3BNDjw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 22:39:52 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI6001GZY5Z1UD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 12:39:51 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MI600N0PY5X1F30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 12:39:51 +0900 (KST)
In-reply-to: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

This patch registers the pl330 dma controller driver with the generic
device tree dma helper functions.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/pl330.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index f5d47e6..fc9c800 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2995,6 +2995,14 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
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
 
 probe_err2:
@@ -3015,6 +3023,8 @@ static int __devexit pl330_remove(struct amba_device *adev)
 	if (!pdmac)
 		return 0;
 
+	of_dma_controller_free(adev->dev.of_node);
+
 	amba_set_drvdata(adev, NULL);
 
 	/* Idle the DMAC */
-- 
1.7.4.4

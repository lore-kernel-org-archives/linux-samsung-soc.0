From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi/s3c64xx: Take runtime PM reference even if DMA is not supported
Date: Tue, 13 Aug 2013 19:03:30 +0100
Message-ID: <1376417010-15514-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:43104 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758641Ab3HMSDf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 14:03:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Girish K S <ks.giri@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

We always need the device to be runtime PM enabled to use it so just skip
the DMA initialisation not the entire prepare when polling.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 9b4e54d..23c93af 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -426,27 +426,26 @@ static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
 	dma_cap_mask_t mask;
 	int ret;
 
-	if (is_polling(sdd))
-		return 0;
-
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-
-	/* Acquire DMA channels */
-	sdd->rx_dma.ch = dma_request_slave_channel_compat(mask, filter,
-				(void *)sdd->rx_dma.dmach, dev, "rx");
-	if (!sdd->rx_dma.ch) {
-		dev_err(dev, "Failed to get RX DMA channel\n");
-		ret = -EBUSY;
-		goto out;
-	}
+	if (!is_polling(sdd)) {
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_SLAVE, mask);
+
+		/* Acquire DMA channels */
+		sdd->rx_dma.ch = dma_request_slave_channel_compat(mask, filter,
+				   (void *)sdd->rx_dma.dmach, dev, "rx");
+		if (!sdd->rx_dma.ch) {
+			dev_err(dev, "Failed to get RX DMA channel\n");
+			ret = -EBUSY;
+			goto out;
+		}
 
-	sdd->tx_dma.ch = dma_request_slave_channel_compat(mask, filter,
-				(void *)sdd->tx_dma.dmach, dev, "tx");
-	if (!sdd->tx_dma.ch) {
-		dev_err(dev, "Failed to get TX DMA channel\n");
-		ret = -EBUSY;
-		goto out_rx;
+		sdd->tx_dma.ch = dma_request_slave_channel_compat(mask, filter,
+				   (void *)sdd->tx_dma.dmach, dev, "tx");
+		if (!sdd->tx_dma.ch) {
+			dev_err(dev, "Failed to get TX DMA channel\n");
+			ret = -EBUSY;
+			goto out_rx;
+		}
 	}
 
 	ret = pm_runtime_get_sync(&sdd->pdev->dev);
-- 
1.8.4.rc2

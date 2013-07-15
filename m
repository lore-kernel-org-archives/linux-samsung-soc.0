From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/2] spi: s3c64xx: fix checkpatch error and warnings
Date: Mon, 15 Jul 2013 14:35:40 +0900
Message-ID: <006001ce811d$24a152b0$6de3f810$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59887 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753235Ab3GOFfm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 01:35:42 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>, Jingoo Han <jg1.han@samsung.com>

Fix the following checkpatch error and warnings:

  ERROR: "(foo*)" should be "(foo *)"
  WARNING: line over 80 characters
  WARNING: quoted string split across lines

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 21ba0a0..dc861c0 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -338,8 +338,10 @@ static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
 	req.cap = DMA_SLAVE;
 	req.client = &s3c64xx_spi_dma_client;
 
-	sdd->rx_dma.ch = (void *)sdd->ops->request(sdd->rx_dma.dmach, &req, dev, "rx");
-	sdd->tx_dma.ch = (void *)sdd->ops->request(sdd->tx_dma.dmach, &req, dev, "tx");
+	sdd->rx_dma.ch = (void *)sdd->ops->request(sdd->rx_dma.dmach,
+						&req, dev, "rx");
+	sdd->tx_dma.ch = (void *)sdd->ops->request(sdd->tx_dma.dmach,
+						&req, dev, "tx");
 
 	return 1;
 }
@@ -439,7 +441,7 @@ static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
 
 	/* Acquire DMA channels */
 	sdd->rx_dma.ch = dma_request_slave_channel_compat(mask, filter,
-				(void*)sdd->rx_dma.dmach, dev, "rx");
+				(void *)sdd->rx_dma.dmach, dev, "rx");
 	if (!sdd->rx_dma.ch) {
 		dev_err(dev, "Failed to get RX DMA channel\n");
 		ret = -EBUSY;
@@ -447,7 +449,7 @@ static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
 	}
 
 	sdd->tx_dma.ch = dma_request_slave_channel_compat(mask, filter,
-				(void*)sdd->tx_dma.dmach, dev, "tx");
+				(void *)sdd->tx_dma.dmach, dev, "tx");
 	if (!sdd->tx_dma.ch) {
 		dev_err(dev, "Failed to get TX DMA channel\n");
 		ret = -EBUSY;
@@ -1361,16 +1363,14 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	if (!sdd->pdev->dev.of_node) {
 		res = platform_get_resource(pdev, IORESOURCE_DMA,  0);
 		if (!res) {
-			dev_warn(&pdev->dev, "Unable to get SPI tx dma "
-					"resource. Switching to poll mode\n");
+			dev_warn(&pdev->dev, "Unable to get SPI tx dma resource. Switching to poll mode\n");
 			sdd->port_conf->quirks = S3C64XX_SPI_QUIRK_POLL;
 		} else
 			sdd->tx_dma.dmach = res->start;
 
 		res = platform_get_resource(pdev, IORESOURCE_DMA,  1);
 		if (!res) {
-			dev_warn(&pdev->dev, "Unable to get SPI rx dma "
-					"resource. Switching to poll mode\n");
+			dev_warn(&pdev->dev, "Unable to get SPI rx dma resource. Switching to poll mode\n");
 			sdd->port_conf->quirks = S3C64XX_SPI_QUIRK_POLL;
 		} else
 			sdd->rx_dma.dmach = res->start;
-- 
1.7.10.4

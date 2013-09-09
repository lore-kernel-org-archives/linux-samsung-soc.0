From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 4/6] spi: spi-s3c64xx: Remove redundant code
Date: Mon, 09 Sep 2013 16:09:24 +0200
Message-ID: <1378735766-12330-5-git-send-email-l.czerwinski@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415Ab3IIOJj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:39 -0400
In-reply-to: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

So far physical address (used to set dma transfer) was obtained from
mapping virtual address of the client buffer address and passed in spi message.
Deprecated code uses dma_map_single() and dma_unmap_single().

Now mapping of virtual address is replaced by data transfer from
client buffer to contiguous regions allocated by dma_alloc_coherent().
Physical address of dma buffers is used to set dma transfer.

This makes functions: s3c64xx_spi_map_mssg(), s3c64xx_spi_unmap()
redundant hence they are removed.

Signed-off-by: Lukasz Czerwinski <l.czerwinski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   77 ---------------------------------------------
 1 file changed, 77 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 1ec1244..3c20b73 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -716,83 +716,6 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
 	}
 }
 
-#define XFER_DMAADDR_INVALID DMA_BIT_MASK(32)
-
-static int s3c64xx_spi_map_mssg(struct s3c64xx_spi_driver_data *sdd,
-						struct spi_message *msg)
-{
-	struct device *dev = &sdd->pdev->dev;
-	struct spi_transfer *xfer;
-
-	if (is_polling(sdd) || msg->is_dma_mapped)
-		return 0;
-
-	/* First mark all xfer unmapped */
-	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
-		xfer->rx_dma = XFER_DMAADDR_INVALID;
-		xfer->tx_dma = XFER_DMAADDR_INVALID;
-	}
-
-	/* Map until end or first fail */
-	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
-
-		if (xfer->len <= ((FIFO_LVL_MASK(sdd) >> 1) + 1))
-			continue;
-
-		if (xfer->tx_buf != NULL) {
-			xfer->tx_dma = dma_map_single(dev,
-					(void *)xfer->tx_buf, xfer->len,
-					DMA_TO_DEVICE);
-			if (dma_mapping_error(dev, xfer->tx_dma)) {
-				dev_err(dev, "dma_map_single Tx failed\n");
-				xfer->tx_dma = XFER_DMAADDR_INVALID;
-				return -ENOMEM;
-			}
-		}
-
-		if (xfer->rx_buf != NULL) {
-			xfer->rx_dma = dma_map_single(dev, xfer->rx_buf,
-						xfer->len, DMA_FROM_DEVICE);
-			if (dma_mapping_error(dev, xfer->rx_dma)) {
-				dev_err(dev, "dma_map_single Rx failed\n");
-				dma_unmap_single(dev, xfer->tx_dma,
-						xfer->len, DMA_TO_DEVICE);
-				xfer->tx_dma = XFER_DMAADDR_INVALID;
-				xfer->rx_dma = XFER_DMAADDR_INVALID;
-				return -ENOMEM;
-			}
-		}
-	}
-
-	return 0;
-}
-
-static void s3c64xx_spi_unmap_mssg(struct s3c64xx_spi_driver_data *sdd,
-						struct spi_message *msg)
-{
-	struct device *dev = &sdd->pdev->dev;
-	struct spi_transfer *xfer;
-
-	if (is_polling(sdd) || msg->is_dma_mapped)
-		return;
-
-	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
-
-		if (xfer->len <= ((FIFO_LVL_MASK(sdd) >> 1) + 1))
-			continue;
-
-		if (xfer->rx_buf != NULL
-				&& xfer->rx_dma != XFER_DMAADDR_INVALID)
-			dma_unmap_single(dev, xfer->rx_dma,
-						xfer->len, DMA_FROM_DEVICE);
-
-		if (xfer->tx_buf != NULL
-				&& xfer->tx_dma != XFER_DMAADDR_INVALID)
-			dma_unmap_single(dev, xfer->tx_dma,
-						xfer->len, DMA_TO_DEVICE);
-	}
-}
-
 static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 					    struct spi_message *msg)
 {
-- 
1.7.9.5

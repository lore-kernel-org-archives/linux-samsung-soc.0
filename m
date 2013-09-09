From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 6/6] spi: spi-s3c64xx: Move DMA initialization
Date: Mon, 09 Sep 2013 16:09:26 +0200
Message-ID: <1378735766-12330-7-git-send-email-l.czerwinski@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415Ab3IIOJk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:40 -0400
In-reply-to: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

This patch removes DMA channel initialization and deinitialization for each
transfer. Now DMA channel is requested only at the driver initialization
and stored in driver data.

This solution optimizes execution time of the send_message loop because
driver doesn't request DMA channel for each transfer anymore. It uses already
requested DMA channel from s3c64xx_spi_dma_data struct.

Signed-off-by: Lukasz Czerwinski <l.czerwinski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   98 +++++++++++++++++++--------------------------
 1 file changed, 42 insertions(+), 56 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 9335f66..602e8fa 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -323,59 +323,20 @@ static void s3c64xx_prepare_dma(struct s3c64xx_spi_dma_data *dma, unsigned len)
 static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
 {
 	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(spi);
-	dma_filter_fn filter = sdd->cntrlr_info->filter;
 	struct device *dev = &sdd->pdev->dev;
-	dma_cap_mask_t mask;
 	int ret;
 
-	if (!is_polling(sdd)) {
-		dma_cap_zero(mask);
-		dma_cap_set(DMA_SLAVE, mask);
-
-		/* Acquire DMA channels */
-		sdd->rx_dma.ch = dma_request_slave_channel_compat(mask, filter,
-				   (void *)sdd->rx_dma.dmach, dev, "rx");
-		if (!sdd->rx_dma.ch) {
-			dev_err(dev, "Failed to get RX DMA channel\n");
-			ret = -EBUSY;
-			goto out;
-		}
-
-		sdd->tx_dma.ch = dma_request_slave_channel_compat(mask, filter,
-				   (void *)sdd->tx_dma.dmach, dev, "tx");
-		if (!sdd->tx_dma.ch) {
-			dev_err(dev, "Failed to get TX DMA channel\n");
-			ret = -EBUSY;
-			goto out_rx;
-		}
-	}
-
 	ret = pm_runtime_get_sync(&sdd->pdev->dev);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "Failed to enable device: %d\n", ret);
-		goto out_tx;
-	}
 
 	return 0;
-
-out_tx:
-	dma_release_channel(sdd->tx_dma.ch);
-out_rx:
-	dma_release_channel(sdd->rx_dma.ch);
-out:
-	return ret;
 }
 
 static int s3c64xx_spi_unprepare_transfer(struct spi_master *spi)
 {
 	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(spi);
 
-	/* Free DMA channels */
-	if (!is_polling(sdd)) {
-		dma_release_channel(sdd->rx_dma.ch);
-		dma_release_channel(sdd->tx_dma.ch);
-	}
-
 	pm_runtime_put(&sdd->pdev->dev);
 	return 0;
 }
@@ -428,7 +389,6 @@ static void s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 	chcfg &= ~S3C64XX_SPI_CH_TXCH_ON;
 
 	if (dma_mode) {
-		chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
 	} else {
 		/* Always shift in data in FIFO, even if xfer is Tx only,
 		 * this helps setting PCKT_CNT value for generating clocks
@@ -1121,26 +1081,54 @@ static inline struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 			 platform_get_device_id(pdev)->driver_data;
 }
 
-static int s3c64xx_init_buffer(struct s3c64xx_spi_driver_data *sdd,
-			  struct s3c64xx_spi_dma_data *dma)
+static int s3c64xx_init_dmach(struct s3c64xx_spi_driver_data *sdd,
+			      struct s3c64xx_spi_dma_data *dma,
+			      bool dma_to_memory)
 {
 	struct device *dev = &sdd->pdev->dev;
+	struct dma_chan *dma_chan;
+	dma_filter_fn filter = sdd->cntrlr_info->filter;
+	dma_cap_mask_t mask;
+	int ret;
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_SLAVE, mask);
+
+	dma_chan = dma_request_slave_channel_compat(mask,
+			filter, (void *)dma->dmach, dev,
+			dma_to_memory ? "rx" : "tx");
+	if (!dma_chan) {
+		dev_err(dev, "Failed to get %d DMA channel\n", dma->dmach);
+		return -EBUSY;
+	}
 
 	dma->vbuf = dma_alloc_coherent(dev, S3C64XX_SPI_DMA_BUF_SIZE,
 			&dma->dma_phys, GFP_KERNEL);
+	if (!dma->vbuf) {
+		ret = -ENOMEM;
+		goto release;
+	}
 
-	if (!dma->vbuf)
-		return -ENOMEM;
+	dma->ch = dma_chan;
 
 	return 0;
+release:
+	dma_release_channel(dma_chan);
+
+	return ret;
+
 }
 
-static void s3c64xx_deinit_buffer(struct s3c64xx_spi_driver_data *sdd,
+static void s3c64xx_deinit_dmach(struct s3c64xx_spi_driver_data *sdd,
 			struct s3c64xx_spi_dma_data *dma)
 {
 	struct device *dev = &sdd->pdev->dev;
 
+	if (!dma->dmach)
+		return;
+
 	dma_free_coherent(dev, sdd->dma_buf_size, dma->vbuf, dma->dma_phys);
+	dma_release_channel(dma->ch);
 }
 
 static int s3c64xx_spi_probe(struct platform_device *pdev)
@@ -1226,14 +1214,12 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	}
 
 	sdd->dma_buf_size = S3C64XX_SPI_DMA_BUF_SIZE;
-	if (s3c64xx_init_buffer(sdd, &sdd->rx_dma) < 0) {
-		ret = -ENOMEM;
+	ret = s3c64xx_init_dmach(sdd, &sdd->rx_dma, true);
+	if (ret < 0)
 		goto err0;
-	}
-	if (s3c64xx_init_buffer(sdd, &sdd->tx_dma) < 0) {
-		ret = -ENOMEM;
+	ret = s3c64xx_init_dmach(sdd, &sdd->tx_dma, false);
+	if (ret < 0)
 		goto err0;
-	}
 
 	sdd->tx_dma.direction = DMA_MEM_TO_DEV;
 	sdd->rx_dma.direction = DMA_DEV_TO_MEM;
@@ -1334,9 +1320,9 @@ err2:
 	clk_disable_unprepare(sdd->clk);
 err0:
 	if (sdd->rx_dma.vbuf)
-		s3c64xx_deinit_buffer(sdd, &sdd->rx_dma);
+		s3c64xx_deinit_dmach(sdd, &sdd->rx_dma);
 	if (sdd->tx_dma.vbuf)
-		s3c64xx_deinit_buffer(sdd, &sdd->tx_dma);
+		s3c64xx_deinit_dmach(sdd, &sdd->tx_dma);
 
 	spi_master_put(master);
 
@@ -1355,10 +1341,10 @@ static int s3c64xx_spi_remove(struct platform_device *pdev)
 	writel(0, sdd->regs + S3C64XX_SPI_INT_EN);
 
 	if (sdd->rx_dma.vbuf)
-		s3c64xx_deinit_buffer(sdd, &sdd->rx_dma);
+		s3c64xx_deinit_dmach(sdd, &sdd->rx_dma);
 
 	if (sdd->tx_dma.vbuf)
-		s3c64xx_deinit_buffer(sdd, &sdd->tx_dma);
+		s3c64xx_deinit_dmach(sdd, &sdd->tx_dma);
 
 	clk_disable_unprepare(sdd->src_clk);
 
-- 
1.7.9.5

From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 3/6] spi: spi-s3c64xx: Add coherent buffers for DMA
 transfers
Date: Mon, 09 Sep 2013 16:09:23 +0200
Message-ID: <1378735766-12330-4-git-send-email-l.czerwinski@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab3IIOJi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:38 -0400
In-reply-to: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

The spi-s3c64xx currently doesn't support transfers from non-contiguous
client buffers.

This patch adds two coherent buffers which allow transfers from
non-contiguous client buffers without extra coherent memory allocation
in the client driver.

Buffer size is hardcoded to 16kB for Tx/Rx. Client drivers shouldn't
exceed that value.

Signed-off-by: Lukasz Czerwinski <l.czerwinski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |  107 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 28e8c71..1ec1244 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -113,6 +113,7 @@
 #define S3C64XX_SPI_SWAP_TX_EN			(1<<0)
 
 #define S3C64XX_SPI_FBCLK_MSK		(3<<0)
+#define S3C64XX_SPI_DMA_BUF_SIZE	(16 * SZ_1K)
 
 #define FIFO_LVL_MASK(i) ((i)->port_conf->fifo_lvl_mask[i->port_id])
 #define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & \
@@ -133,6 +134,8 @@
 #define TXBUSY    (1<<3)
 
 struct s3c64xx_spi_dma_data {
+	u32 *vbuf;
+	dma_addr_t dma_phys;
 	struct dma_chan *ch;
 	enum dma_transfer_direction direction;
 	unsigned int dmach;
@@ -178,6 +181,7 @@ struct s3c64xx_spi_port_config {
  * @xfer_completion: To indicate completion of xfer task.
  * @cur_mode: Stores the active configuration of the controller.
  * @cur_bpw: Stores the active bits per word settings.
+ * @dma_buf_size: Stores buffer size for Rx/Tx.
  * @cur_speed: Stores the active xfer clock speed.
  */
 struct s3c64xx_spi_driver_data {
@@ -194,6 +198,7 @@ struct s3c64xx_spi_driver_data {
 	unsigned                        state;
 	unsigned                        cur_mode, cur_bpw;
 	unsigned                        cur_speed;
+	unsigned                        dma_buf_size;
 	struct s3c64xx_spi_dma_data	rx_dma;
 	struct s3c64xx_spi_dma_data	tx_dma;
 
@@ -279,8 +284,7 @@ static void s3c64xx_spi_dmacb(void *data)
 	spin_unlock_irqrestore(&sdd->lock, flags);
 }
 
-static void s3c64xx_prepare_dma(struct s3c64xx_spi_dma_data *dma,
-					unsigned len, dma_addr_t buf)
+static void s3c64xx_prepare_dma(struct s3c64xx_spi_dma_data *dma, unsigned len)
 {
 	struct s3c64xx_spi_driver_data *sdd;
 	struct dma_slave_config config;
@@ -306,7 +310,7 @@ static void s3c64xx_prepare_dma(struct s3c64xx_spi_dma_data *dma,
 		dmaengine_slave_config(dma->ch, &config);
 	}
 
-	desc = dmaengine_prep_slave_single(dma->ch, buf, len,
+	desc = dmaengine_prep_slave_single(dma->ch, dma->dma_phys, len,
 					dma->direction, DMA_PREP_INTERRUPT);
 
 	desc->callback = s3c64xx_spi_dmacb;
@@ -382,6 +386,34 @@ static void s3c64xx_spi_dma_stop(struct s3c64xx_spi_driver_data *sdd,
 	dmaengine_terminate_all(dma->ch);
 }
 
+static void s3c64xx_copy_txbuf_to_spi(struct s3c64xx_spi_driver_data *sdd,
+				    struct spi_transfer *xfer)
+{
+	struct device *dev = &sdd->pdev->dev;
+
+	dma_sync_single_for_cpu(dev, sdd->tx_dma.dma_phys,
+			sdd->dma_buf_size, DMA_TO_DEVICE);
+
+	memcpy(sdd->tx_dma.vbuf, xfer->tx_buf, xfer->len);
+
+	dma_sync_single_for_device(dev, sdd->tx_dma.dma_phys,
+			sdd->dma_buf_size, DMA_TO_DEVICE);
+}
+
+static void s3c64xx_copy_spi_to_rxbuf(struct s3c64xx_spi_driver_data *sdd,
+				    struct spi_transfer *xfer)
+{
+	struct device *dev = &sdd->pdev->dev;
+
+	dma_sync_single_for_cpu(dev, sdd->rx_dma.dma_phys,
+			sdd->dma_buf_size, DMA_FROM_DEVICE);
+
+	memcpy(xfer->rx_buf, sdd->rx_dma.vbuf, xfer->len);
+
+	dma_sync_single_for_device(dev, sdd->rx_dma.dma_phys,
+			sdd->dma_buf_size, DMA_FROM_DEVICE);
+}
+
 static void s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 				struct spi_device *spi,
 				struct spi_transfer *xfer, int dma_mode)
@@ -413,8 +445,8 @@ static void s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 		chcfg |= S3C64XX_SPI_CH_TXCH_ON;
 		if (dma_mode) {
 			modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
-			s3c64xx_prepare_dma(&sdd->tx_dma,
-					xfer->len, xfer->tx_dma);
+			s3c64xx_copy_txbuf_to_spi(sdd, xfer);
+			s3c64xx_prepare_dma(&sdd->tx_dma, xfer->len);
 		} else {
 			switch (sdd->cur_bpw) {
 			case 32:
@@ -446,8 +478,8 @@ static void s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 			writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
 					| S3C64XX_SPI_PACKET_CNT_EN,
 					regs + S3C64XX_SPI_PACKET_CNT);
-			s3c64xx_prepare_dma(&sdd->rx_dma,
-					xfer->len, xfer->rx_dma);
+			s3c64xx_copy_spi_to_rxbuf(sdd, xfer);
+			s3c64xx_prepare_dma(&sdd->rx_dma, xfer->len);
 		}
 	}
 
@@ -782,14 +814,6 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 		s3c64xx_spi_config(sdd);
 	}
 
-	/* Map all the transfers if needed */
-	if (s3c64xx_spi_map_mssg(sdd, msg)) {
-		dev_err(&spi->dev,
-			"Xfer: Unable to map message buffers!\n");
-		status = -ENOMEM;
-		goto out;
-	}
-
 	/* Configure feedback delay */
 	writel(cs->fb_delay & 0x3, sdd->regs + S3C64XX_SPI_FB_CLK);
 
@@ -804,6 +828,14 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 		bpw = xfer->bits_per_word;
 		speed = xfer->speed_hz ? : spi->max_speed_hz;
 
+		if (xfer->len > sdd->dma_buf_size) {
+			dev_err(&spi->dev,
+					"Message length exceeds dma buffer size %d>%d\n",
+					xfer->len, sdd->dma_buf_size);
+			status = -EIO;
+			goto out;
+		}
+
 		if (xfer->len % (bpw / 8)) {
 			dev_err(&spi->dev,
 				"Xfer length(%u) not a multiple of word size(%u)\n",
@@ -881,8 +913,6 @@ out:
 	else
 		sdd->tgl_spi = spi;
 
-	s3c64xx_spi_unmap_mssg(sdd, msg);
-
 	msg->status = status;
 
 	spi_finalize_current_message(master);
@@ -1168,6 +1198,28 @@ static inline struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 			 platform_get_device_id(pdev)->driver_data;
 }
 
+static int s3c64xx_init_buffer(struct s3c64xx_spi_driver_data *sdd,
+			  struct s3c64xx_spi_dma_data *dma)
+{
+	struct device *dev = &sdd->pdev->dev;
+
+	dma->vbuf = dma_alloc_coherent(dev, S3C64XX_SPI_DMA_BUF_SIZE,
+			&dma->dma_phys, GFP_KERNEL);
+
+	if (!dma->vbuf)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void s3c64xx_deinit_buffer(struct s3c64xx_spi_driver_data *sdd,
+			struct s3c64xx_spi_dma_data *dma)
+{
+	struct device *dev = &sdd->pdev->dev;
+
+	dma_free_coherent(dev, sdd->dma_buf_size, dma->vbuf, dma->dma_phys);
+}
+
 static int s3c64xx_spi_probe(struct platform_device *pdev)
 {
 	struct resource	*mem_res;
@@ -1250,6 +1302,16 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 			sdd->rx_dma.dmach = res->start;
 	}
 
+	sdd->dma_buf_size = S3C64XX_SPI_DMA_BUF_SIZE;
+	if (s3c64xx_init_buffer(sdd, &sdd->rx_dma) < 0) {
+		ret = -ENOMEM;
+		goto err0;
+	}
+	if (s3c64xx_init_buffer(sdd, &sdd->tx_dma) < 0) {
+		ret = -ENOMEM;
+		goto err0;
+	}
+
 	sdd->tx_dma.direction = DMA_MEM_TO_DEV;
 	sdd->rx_dma.direction = DMA_DEV_TO_MEM;
 
@@ -1348,6 +1410,11 @@ err3:
 err2:
 	clk_disable_unprepare(sdd->clk);
 err0:
+	if (sdd->rx_dma.vbuf)
+		s3c64xx_deinit_buffer(sdd, &sdd->rx_dma);
+	if (sdd->tx_dma.vbuf)
+		s3c64xx_deinit_buffer(sdd, &sdd->tx_dma);
+
 	spi_master_put(master);
 
 	return ret;
@@ -1364,6 +1431,12 @@ static int s3c64xx_spi_remove(struct platform_device *pdev)
 
 	writel(0, sdd->regs + S3C64XX_SPI_INT_EN);
 
+	if (sdd->rx_dma.vbuf)
+		s3c64xx_deinit_buffer(sdd, &sdd->rx_dma);
+
+	if (sdd->tx_dma.vbuf)
+		s3c64xx_deinit_buffer(sdd, &sdd->tx_dma);
+
 	clk_disable_unprepare(sdd->src_clk);
 
 	clk_disable_unprepare(sdd->clk);
-- 
1.7.9.5

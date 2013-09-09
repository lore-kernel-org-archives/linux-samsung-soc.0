From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 2/6] spi: spi-s3c64xx: Correct functions namespacing
Date: Mon, 09 Sep 2013 16:09:22 +0200
Message-ID: <1378735766-12330-3-git-send-email-l.czerwinski@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415Ab3IIOJh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:37 -0400
In-reply-to: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

This path adds missing s3c64xx_ prefixes to functions in the driver.

Signed-off-by: Lukasz Czerwinski <l.czerwinski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 106bc09..28e8c71 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -279,7 +279,7 @@ static void s3c64xx_spi_dmacb(void *data)
 	spin_unlock_irqrestore(&sdd->lock, flags);
 }
 
-static void prepare_dma(struct s3c64xx_spi_dma_data *dma,
+static void s3c64xx_prepare_dma(struct s3c64xx_spi_dma_data *dma,
 					unsigned len, dma_addr_t buf)
 {
 	struct s3c64xx_spi_driver_data *sdd;
@@ -382,7 +382,7 @@ static void s3c64xx_spi_dma_stop(struct s3c64xx_spi_driver_data *sdd,
 	dmaengine_terminate_all(dma->ch);
 }
 
-static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
+static void s3c64xx_enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 				struct spi_device *spi,
 				struct spi_transfer *xfer, int dma_mode)
 {
@@ -413,7 +413,8 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 		chcfg |= S3C64XX_SPI_CH_TXCH_ON;
 		if (dma_mode) {
 			modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
-			prepare_dma(&sdd->tx_dma, xfer->len, xfer->tx_dma);
+			s3c64xx_prepare_dma(&sdd->tx_dma,
+					xfer->len, xfer->tx_dma);
 		} else {
 			switch (sdd->cur_bpw) {
 			case 32:
@@ -445,7 +446,8 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 			writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
 					| S3C64XX_SPI_PACKET_CNT_EN,
 					regs + S3C64XX_SPI_PACKET_CNT);
-			prepare_dma(&sdd->rx_dma, xfer->len, xfer->rx_dma);
+			s3c64xx_prepare_dma(&sdd->rx_dma,
+					xfer->len, xfer->rx_dma);
 		}
 	}
 
@@ -453,7 +455,7 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 	writel(chcfg, regs + S3C64XX_SPI_CH_CFG);
 }
 
-static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
+static inline void s3c64xx_enable_cs(struct s3c64xx_spi_driver_data *sdd,
 						struct spi_device *spi)
 {
 	struct s3c64xx_spi_csinfo *cs;
@@ -498,7 +500,7 @@ static u32 s3c64xx_spi_wait_for_timeout(struct s3c64xx_spi_driver_data *sdd,
 	return RX_FIFO_LVL(status, sdd);
 }
 
-static int wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
+static int s3c64xx_wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
 				struct spi_transfer *xfer, int dma_mode)
 {
 	void __iomem *regs = sdd->regs;
@@ -596,7 +598,7 @@ static int wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
 	return 0;
 }
 
-static inline void disable_cs(struct s3c64xx_spi_driver_data *sdd,
+static inline void s3c64xx_disable_cs(struct s3c64xx_spi_driver_data *sdd,
 						struct spi_device *spi)
 {
 	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
@@ -829,14 +831,14 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 		sdd->state &= ~RXBUSY;
 		sdd->state &= ~TXBUSY;
 
-		enable_datapath(sdd, spi, xfer, use_dma);
+		s3c64xx_enable_datapath(sdd, spi, xfer, use_dma);
 
 		/* Slave Select */
-		enable_cs(sdd, spi);
+		s3c64xx_enable_cs(sdd, spi);
 
 		spin_unlock_irqrestore(&sdd->lock, flags);
 
-		status = wait_for_xfer(sdd, xfer, use_dma);
+		status = s3c64xx_wait_for_xfer(sdd, xfer, use_dma);
 
 		if (status) {
 			dev_err(&spi->dev, "I/O Error: rx-%d tx-%d res:rx-%c tx-%c len-%d\n",
@@ -875,7 +877,7 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 
 out:
 	if (!cs_toggle || status)
-		disable_cs(sdd, spi);
+		s3c64xx_disable_cs(sdd, spi);
 	else
 		sdd->tgl_spi = spi;
 
@@ -1014,12 +1016,12 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 	}
 
 	pm_runtime_put(&sdd->pdev->dev);
-	disable_cs(sdd, spi);
+	s3c64xx_disable_cs(sdd, spi);
 	return 0;
 
 setup_exit:
 	/* setup() returns with device de-selected */
-	disable_cs(sdd, spi);
+	s3c64xx_disable_cs(sdd, spi);
 
 	gpio_free(cs->line);
 	spi_set_ctldata(spi, NULL);
-- 
1.7.9.5

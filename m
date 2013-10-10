From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] spi/s3c64xx: Use core message handling
Date: Thu, 10 Oct 2013 11:44:54 +0100
Message-ID: <1381401894-17606-2-git-send-email-broonie@kernel.org>
References: <1381401894-17606-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36584 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753264Ab3JJKvB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 06:51:01 -0400
In-Reply-To: <1381401894-17606-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 152 +++++++++++++++++-----------------------------
 1 file changed, 56 insertions(+), 96 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index c7b36c0..25eb352 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -879,121 +879,81 @@ static int s3c64xx_spi_prepare_message(struct spi_master *master,
 	return 0;
 }
 
-static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
-					    struct spi_message *msg)
+static int s3c64xx_spi_transfer_one(struct spi_master *master,
+				    struct spi_device *spi,
+				    struct spi_transfer *xfer)
 {
 	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
-	struct spi_device *spi = msg->spi;
-	struct spi_transfer *xfer;
-	int status = 0, cs_toggle = 0;
+	int status;
 	u32 speed;
 	u8 bpw;
+	unsigned long flags;
+	int use_dma;
 
-	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
-
-		unsigned long flags;
-		int use_dma;
-
-		INIT_COMPLETION(sdd->xfer_completion);
-
-		/* Only BPW and Speed may change across transfers */
-		bpw = xfer->bits_per_word;
-		speed = xfer->speed_hz ? : spi->max_speed_hz;
-
-		if (xfer->len % (bpw / 8)) {
-			dev_err(&spi->dev,
-				"Xfer length(%u) not a multiple of word size(%u)\n",
-				xfer->len, bpw / 8);
-			status = -EIO;
-			goto out;
-		}
-
-		if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
-			sdd->cur_bpw = bpw;
-			sdd->cur_speed = speed;
-			s3c64xx_spi_config(sdd);
-		}
-
-		/* Slave Select */
-		enable_cs(sdd, spi);
-
-		/* Polling method for xfers not bigger than FIFO capacity */
-		use_dma = 0;
-		if (!is_polling(sdd) &&
-			(sdd->rx_dma.ch && sdd->tx_dma.ch &&
-			(xfer->len > ((FIFO_LVL_MASK(sdd) >> 1) + 1))))
-			use_dma = 1;
-
-		spin_lock_irqsave(&sdd->lock, flags);
+	INIT_COMPLETION(sdd->xfer_completion);
 
-		/* Pending only which is to be done */
-		sdd->state &= ~RXBUSY;
-		sdd->state &= ~TXBUSY;
+	/* Only BPW and Speed may change across transfers */
+	bpw = xfer->bits_per_word;
+	speed = xfer->speed_hz ? : spi->max_speed_hz;
 
-		enable_datapath(sdd, spi, xfer, use_dma);
-
-		/* Start the signals */
-		writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
+	if (xfer->len % (bpw / 8)) {
+		dev_err(&spi->dev,
+			"Xfer length(%u) not a multiple of word size(%u)\n",
+			xfer->len, bpw / 8);
+		return -EIO;
+	}
 
-		/* Start the signals */
-		writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
+	if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
+		sdd->cur_bpw = bpw;
+		sdd->cur_speed = speed;
+		s3c64xx_spi_config(sdd);
+	}
 
-		spin_unlock_irqrestore(&sdd->lock, flags);
+	/* Polling method for xfers not bigger than FIFO capacity */
+	use_dma = 0;
+	if (!is_polling(sdd) &&
+	    (sdd->rx_dma.ch && sdd->tx_dma.ch &&
+	     (xfer->len > ((FIFO_LVL_MASK(sdd) >> 1) + 1))))
+		use_dma = 1;
 
-		status = wait_for_xfer(sdd, xfer, use_dma);
+	spin_lock_irqsave(&sdd->lock, flags);
 
-		if (status) {
-			dev_err(&spi->dev, "I/O Error: rx-%d tx-%d res:rx-%c tx-%c len-%d\n",
-				xfer->rx_buf ? 1 : 0, xfer->tx_buf ? 1 : 0,
-				(sdd->state & RXBUSY) ? 'f' : 'p',
-				(sdd->state & TXBUSY) ? 'f' : 'p',
-				xfer->len);
+	/* Pending only which is to be done */
+	sdd->state &= ~RXBUSY;
+	sdd->state &= ~TXBUSY;
 
-			if (use_dma) {
-				if (xfer->tx_buf != NULL
-						&& (sdd->state & TXBUSY))
-					s3c64xx_spi_dma_stop(sdd, &sdd->tx_dma);
-				if (xfer->rx_buf != NULL
-						&& (sdd->state & RXBUSY))
-					s3c64xx_spi_dma_stop(sdd, &sdd->rx_dma);
-			}
+	enable_datapath(sdd, spi, xfer, use_dma);
 
-			goto out;
-		}
+	/* Start the signals */
+	writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 
-		flush_fifo(sdd);
+	/* Start the signals */
+	writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 
-		if (xfer->delay_usecs)
-			udelay(xfer->delay_usecs);
+	spin_unlock_irqrestore(&sdd->lock, flags);
 
-		if (xfer->cs_change) {
-			/* Hint that the next mssg is gonna be
-			   for the same device */
-			if (list_is_last(&xfer->transfer_list,
-						&msg->transfers))
-				cs_toggle = 1;
+	status = wait_for_xfer(sdd, xfer, use_dma);
+
+	if (status) {
+		dev_err(&spi->dev, "I/O Error: rx-%d tx-%d res:rx-%c tx-%c len-%d\n",
+			xfer->rx_buf ? 1 : 0, xfer->tx_buf ? 1 : 0,
+			(sdd->state & RXBUSY) ? 'f' : 'p',
+			(sdd->state & TXBUSY) ? 'f' : 'p',
+			xfer->len);
+
+		if (use_dma) {
+			if (xfer->tx_buf != NULL
+			    && (sdd->state & TXBUSY))
+				s3c64xx_spi_dma_stop(sdd, &sdd->tx_dma);
+			if (xfer->rx_buf != NULL
+			    && (sdd->state & RXBUSY))
+				s3c64xx_spi_dma_stop(sdd, &sdd->rx_dma);
 		}
-
-		msg->actual_length += xfer->len;
-	}
-
-out:
-	if (!cs_toggle || status) {
-		/* Quiese the signals */
-		writel(S3C64XX_SPI_SLAVE_SIG_INACT,
-		       sdd->regs + S3C64XX_SPI_SLAVE_SEL);
-		disable_cs(sdd, spi);
 	} else {
-		sdd->tgl_spi = spi;
+		flush_fifo(sdd);
 	}
 
-	s3c64xx_spi_unmap_mssg(sdd, msg);
-
-	msg->status = status;
-
-	spi_finalize_current_message(master);
-
-	return 0;
+	return status;
 }
 
 static int s3c64xx_spi_unprepare_message(struct spi_master *master,
@@ -1379,7 +1339,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	master->cleanup = s3c64xx_spi_cleanup;
 	master->prepare_transfer_hardware = s3c64xx_spi_prepare_transfer;
 	master->prepare_message = s3c64xx_spi_prepare_message;
-	master->transfer_one_message = s3c64xx_spi_transfer_one_message;
+	master->transfer_one = s3c64xx_spi_transfer_one;
 	master->unprepare_message = s3c64xx_spi_unprepare_message;
 	master->unprepare_transfer_hardware = s3c64xx_spi_unprepare_transfer;
 	master->num_chipselect = sci->num_cs;
-- 
1.8.4.rc3

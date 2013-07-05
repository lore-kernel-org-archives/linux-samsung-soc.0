From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi/s3c64xx: Remove unused message queue
Date: Fri,  5 Jul 2013 18:56:33 +0100
Message-ID: <1373046993-1349-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:42957 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212Ab3GER5B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 13:57:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Since the driver has been converted to use the core message pump code
the only use of the messsage queue in the driver is a check to see if
it is empty which will always succeed since nothing ever adds to the
queue. Just remove the queue.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index eb53df2..def13e8 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -172,7 +172,6 @@ struct s3c64xx_spi_port_config {
  * @master: Pointer to the SPI Protocol master.
  * @cntrlr_info: Platform specific data for the controller this driver manages.
  * @tgl_spi: Pointer to the last CS left untoggled by the cs_change hint.
- * @queue: To log SPI xfer requests.
  * @lock: Controller specific lock.
  * @state: Set of FLAGS to indicate status.
  * @rx_dmach: Controller's DMA channel for Rx.
@@ -193,7 +192,6 @@ struct s3c64xx_spi_driver_data {
 	struct spi_master               *master;
 	struct s3c64xx_spi_info  *cntrlr_info;
 	struct spi_device               *tgl_spi;
-	struct list_head                queue;
 	spinlock_t                      lock;
 	unsigned long                   sfr_start;
 	struct completion               xfer_completion;
@@ -1053,8 +1051,6 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
 	struct s3c64xx_spi_driver_data *sdd;
 	struct s3c64xx_spi_info *sci;
-	struct spi_message *msg;
-	unsigned long flags;
 	int err;
 
 	sdd = spi_master_get_devdata(spi->master);
@@ -1085,21 +1081,6 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 
 	sci = sdd->cntrlr_info;
 
-	spin_lock_irqsave(&sdd->lock, flags);
-
-	list_for_each_entry(msg, &sdd->queue, queue) {
-		/* Is some mssg is already queued for this device */
-		if (msg->spi == spi) {
-			dev_err(&spi->dev,
-				"setup: attempt while mssg in queue!\n");
-			spin_unlock_irqrestore(&sdd->lock, flags);
-			err = -EBUSY;
-			goto err_msgq;
-		}
-	}
-
-	spin_unlock_irqrestore(&sdd->lock, flags);
-
 	pm_runtime_get_sync(&sdd->pdev->dev);
 
 	/* Check if we can provide the requested rate */
@@ -1146,7 +1127,6 @@ setup_exit:
 	/* setup() returns with device de-selected */
 	disable_cs(sdd, spi);
 
-err_msgq:
 	gpio_free(cs->line);
 	spi_set_ctldata(spi, NULL);
 
@@ -1439,7 +1419,6 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sdd->lock);
 	init_completion(&sdd->xfer_completion);
-	INIT_LIST_HEAD(&sdd->queue);
 
 	ret = devm_request_irq(&pdev->dev, irq, s3c64xx_spi_irq, 0,
 				"spi-s3c64xx", sdd);
-- 
1.8.3.2

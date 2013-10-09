From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] spi/s3c64xx: Use prepare_message() and unprepare_message()
Date: Wed,  9 Oct 2013 18:01:44 +0100
Message-ID: <1381338104-5550-2-git-send-email-broonie@kernel.org>
References: <1381338104-5550-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45225 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752216Ab3JIRBy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Oct 2013 13:01:54 -0400
In-Reply-To: <1381338104-5550-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Lukasz Czerwinski <l.czerwinski@samsung.com>, s.nawrocki@samsung.com
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

This is of very little value in itself but will be useful once the loop
iterating over the transfers is also factored out into the core.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8e732a1..c7b36c0 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -849,16 +849,12 @@ static void s3c64xx_spi_unmap_mssg(struct s3c64xx_spi_driver_data *sdd,
 	}
 }
 
-static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
-					    struct spi_message *msg)
+static int s3c64xx_spi_prepare_message(struct spi_master *master,
+				       struct spi_message *msg)
 {
 	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
 	struct spi_device *spi = msg->spi;
 	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
-	struct spi_transfer *xfer;
-	int status = 0, cs_toggle = 0;
-	u32 speed;
-	u8 bpw;
 
 	/* If Master's(controller) state differs from that needed by Slave */
 	if (sdd->cur_speed != spi->max_speed_hz
@@ -874,13 +870,25 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 	if (s3c64xx_spi_map_mssg(sdd, msg)) {
 		dev_err(&spi->dev,
 			"Xfer: Unable to map message buffers!\n");
-		status = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	/* Configure feedback delay */
 	writel(cs->fb_delay & 0x3, sdd->regs + S3C64XX_SPI_FB_CLK);
 
+	return 0;
+}
+
+static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
+					    struct spi_message *msg)
+{
+	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
+	struct spi_device *spi = msg->spi;
+	struct spi_transfer *xfer;
+	int status = 0, cs_toggle = 0;
+	u32 speed;
+	u8 bpw;
+
 	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
 
 		unsigned long flags;
@@ -988,6 +996,16 @@ out:
 	return 0;
 }
 
+static int s3c64xx_spi_unprepare_message(struct spi_master *master,
+					    struct spi_message *msg)
+{
+	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
+
+	s3c64xx_spi_unmap_mssg(sdd, msg);
+
+	return 0;
+}
+
 static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
 				struct spi_device *spi)
 {
@@ -1360,7 +1378,9 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	master->setup = s3c64xx_spi_setup;
 	master->cleanup = s3c64xx_spi_cleanup;
 	master->prepare_transfer_hardware = s3c64xx_spi_prepare_transfer;
+	master->prepare_message = s3c64xx_spi_prepare_message;
 	master->transfer_one_message = s3c64xx_spi_transfer_one_message;
+	master->unprepare_message = s3c64xx_spi_unprepare_message;
 	master->unprepare_transfer_hardware = s3c64xx_spi_unprepare_transfer;
 	master->num_chipselect = sci->num_cs;
 	master->dma_alignment = 8;
-- 
1.8.4.rc3

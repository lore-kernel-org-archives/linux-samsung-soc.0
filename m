From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/6] spi/s3c64xx: Use core cs_gpio field
Date: Fri, 27 Sep 2013 20:44:07 +0100
Message-ID: <1380311049-973-4-git-send-email-broonie@kernel.org>
References: <1380311049-973-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57289 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981Ab3I0To7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:44:59 -0400
In-Reply-To: <1380311049-973-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, =?UTF-8?q?=C5=81ukasz=20Czerwi=C5=84ski?= <l.czerwinski@samsung.com>, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Rather than using the driver custom platform data to store the chip select
GPIO use the cs_gpio field provided by the SPI core, supporting future
refectoring.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 7f960db..43caeee 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -558,22 +558,18 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
 						struct spi_device *spi)
 {
-	struct s3c64xx_spi_csinfo *cs;
-
 	if (sdd->tgl_spi != NULL) { /* If last device toggled after mssg */
 		if (sdd->tgl_spi != spi) { /* if last mssg on diff device */
 			/* Deselect the last toggled device */
-			cs = sdd->tgl_spi->controller_data;
-			if (sdd->cs_gpio)
-				gpio_set_value(cs->line,
+			if (spi->cs_gpio >= 0)
+				gpio_set_value(spi->cs_gpio,
 					spi->mode & SPI_CS_HIGH ? 0 : 1);
 		}
 		sdd->tgl_spi = NULL;
 	}
 
-	cs = spi->controller_data;
-	if (sdd->cs_gpio)
-		gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 1 : 0);
+	if (spi->cs_gpio >= 0)
+		gpio_set_value(spi->cs_gpio, spi->mode & SPI_CS_HIGH ? 1 : 0);
 
 	/* Start the signals */
 	writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
@@ -701,13 +697,11 @@ static int wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
 static inline void disable_cs(struct s3c64xx_spi_driver_data *sdd,
 						struct spi_device *spi)
 {
-	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
-
 	if (sdd->tgl_spi == spi)
 		sdd->tgl_spi = NULL;
 
-	if (sdd->cs_gpio)
-		gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 0 : 1);
+	if (spi->cs_gpio >= 0)
+		gpio_set_value(spi->cs_gpio, spi->mode & SPI_CS_HIGH ? 0 : 1);
 
 	/* Quiese the signals */
 	writel(S3C64XX_SPI_SLAVE_SIG_INACT, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
@@ -1070,6 +1064,8 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 					cs->line, err);
 				goto err_gpio_req;
 			}
+
+			spi->cs_gpio = cs->line;
 		}
 
 		spi_set_ctldata(spi, cs);
@@ -1139,8 +1135,8 @@ static void s3c64xx_spi_cleanup(struct spi_device *spi)
 	struct s3c64xx_spi_driver_data *sdd;
 
 	sdd = spi_master_get_devdata(spi->master);
-	if (cs && sdd->cs_gpio) {
-		gpio_free(cs->line);
+	if (spi->cs_gpio) {
+		gpio_free(spi->cs_gpio);
 		if (spi->dev.of_node)
 			kfree(cs);
 	}
-- 
1.8.4.rc3

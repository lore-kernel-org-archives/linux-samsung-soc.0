From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/6] spi/s3c64xx: Factor transfer start out of enable/disable_cs()
Date: Fri, 27 Sep 2013 20:44:08 +0100
Message-ID: <1380311049-973-5-git-send-email-broonie@kernel.org>
References: <1380311049-973-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57298 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981Ab3I0TpB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:45:01 -0400
In-Reply-To: <1380311049-973-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, =?UTF-8?q?=C5=81ukasz=20Czerwi=C5=84ski?= <l.czerwinski@samsung.com>, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The hardware level /CS handling is tied to the start of the data path so
is rolled into the same function as we use to manipulate GPIO /CS. In
order to support factoring out the /CS handling into the core separate the
two and explicitly start transfers separately to the /CS handling.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 43caeee..2ab96fb 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -570,9 +570,6 @@ static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
 
 	if (spi->cs_gpio >= 0)
 		gpio_set_value(spi->cs_gpio, spi->mode & SPI_CS_HIGH ? 1 : 0);
-
-	/* Start the signals */
-	writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 }
 
 static u32 s3c64xx_spi_wait_for_timeout(struct s3c64xx_spi_driver_data *sdd,
@@ -702,9 +699,6 @@ static inline void disable_cs(struct s3c64xx_spi_driver_data *sdd,
 
 	if (spi->cs_gpio >= 0)
 		gpio_set_value(spi->cs_gpio, spi->mode & SPI_CS_HIGH ? 0 : 1);
-
-	/* Quiese the signals */
-	writel(S3C64XX_SPI_SLAVE_SIG_INACT, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 }
 
 static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
@@ -930,6 +924,9 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 		/* Slave Select */
 		enable_cs(sdd, spi);
 
+		/* Start the signals */
+		writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
+
 		spin_unlock_irqrestore(&sdd->lock, flags);
 
 		status = wait_for_xfer(sdd, xfer, use_dma);
@@ -970,10 +967,14 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 	}
 
 out:
-	if (!cs_toggle || status)
+	if (!cs_toggle || status) {
+		/* Quiese the signals */
+		writel(S3C64XX_SPI_SLAVE_SIG_INACT,
+		       sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 		disable_cs(sdd, spi);
-	else
+	} else {
 		sdd->tgl_spi = spi;
+	}
 
 	s3c64xx_spi_unmap_mssg(sdd, msg);
 
@@ -1112,11 +1113,13 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 	}
 
 	pm_runtime_put(&sdd->pdev->dev);
+	writel(S3C64XX_SPI_SLAVE_SIG_INACT, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 	disable_cs(sdd, spi);
 	return 0;
 
 setup_exit:
 	/* setup() returns with device de-selected */
+	writel(S3C64XX_SPI_SLAVE_SIG_INACT, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 	disable_cs(sdd, spi);
 
 	gpio_free(cs->line);
-- 
1.8.4.rc3

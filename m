From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/6] spi/s3c64xx: Enable GPIO /CS prior to starting hardware
Date: Fri, 27 Sep 2013 20:44:09 +0100
Message-ID: <1380311049-973-6-git-send-email-broonie@kernel.org>
References: <1380311049-973-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57321 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754108Ab3I0TpF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 15:45:05 -0400
In-Reply-To: <1380311049-973-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.org, =?UTF-8?q?=C5=81ukasz=20Czerwi=C5=84ski?= <l.czerwinski@samsung.com>, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

To help with bisection of future refactoring to share more of the code for
handling a spi_message pull the enabling of GPIO based /CS prior to all
the hardware setup for starting a transfer.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 2ab96fb..e631232 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -906,6 +906,9 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 			s3c64xx_spi_config(sdd);
 		}
 
+		/* Slave Select */
+		enable_cs(sdd, spi);
+
 		/* Polling method for xfers not bigger than FIFO capacity */
 		use_dma = 0;
 		if (!is_polling(sdd) &&
@@ -921,9 +924,6 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 
 		enable_datapath(sdd, spi, xfer, use_dma);
 
-		/* Slave Select */
-		enable_cs(sdd, spi);
-
 		/* Start the signals */
 		writel(0, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 
-- 
1.8.4.rc3

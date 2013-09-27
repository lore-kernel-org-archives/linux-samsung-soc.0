From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi/s3c64x: Ensure runtime PM is enabled prior to registration
Date: Fri, 27 Sep 2013 11:53:05 +0100
Message-ID: <1380279185-10354-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34273 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871Ab3I0Kxf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Sep 2013 06:53:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linaro-kernel@lists.linaro.rog, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Otherwise we may try to start transfers immediately and then fail to
runtime resume the device causing us not to have clocks enabled.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 84cc6ac..229c6b9 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1428,6 +1428,8 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	       S3C64XX_SPI_INT_TX_OVERRUN_EN | S3C64XX_SPI_INT_TX_UNDERRUN_EN,
 	       sdd->regs + S3C64XX_SPI_INT_EN);
 
+	pm_runtime_enable(&pdev->dev);
+
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "cannot register SPI master: %d\n", ret);
@@ -1440,8 +1442,6 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 					mem_res,
 					sdd->rx_dma.dmach, sdd->tx_dma.dmach);
 
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 
 err3:
-- 
1.8.4.rc3

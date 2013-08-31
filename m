From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] spi/s3c64xx: Use managed registration
Date: Sat, 31 Aug 2013 18:59:51 +0100
Message-ID: <1377971991-1494-2-git-send-email-broonie@kernel.org>
References: <1377971991-1494-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:51156 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754397Ab3HaSAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 Aug 2013 14:00:04 -0400
In-Reply-To: <1377971991-1494-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Also improve the error reporting on failure and remove a duplicate put.
This provides a small code saving.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 512b889..a5cea84 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1428,9 +1428,9 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	       S3C64XX_SPI_INT_TX_OVERRUN_EN | S3C64XX_SPI_INT_TX_UNDERRUN_EN,
 	       sdd->regs + S3C64XX_SPI_INT_EN);
 
-	if (spi_register_master(master)) {
-		dev_err(&pdev->dev, "cannot register SPI master\n");
-		ret = -EBUSY;
+	ret = devm_spi_register_master(&pdev->dev, master);
+	if (ret != 0) {
+		dev_err(&pdev->dev, "cannot register SPI master: %d\n", ret);
 		goto err3;
 	}
 
@@ -1461,16 +1461,12 @@ static int s3c64xx_spi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	spi_unregister_master(master);
-
 	writel(0, sdd->regs + S3C64XX_SPI_INT_EN);
 
 	clk_disable_unprepare(sdd->src_clk);
 
 	clk_disable_unprepare(sdd->clk);
 
-	spi_master_put(master);
-
 	return 0;
 }
 
-- 
1.8.4.rc3

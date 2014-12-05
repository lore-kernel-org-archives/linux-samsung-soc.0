From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi/s3c64xx: Remove redundant runtime PM management
Date: Fri,  5 Dec 2014 20:27:42 +0000
Message-ID: <1417811262-11652-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49636 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbaLEU2F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Dec 2014 15:28:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>

The device already asks the core to hold a runtime PM reference while it
is active so it is redundant to open code that in the driver itself.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-s3c64xx.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 9c616091429d..197bcf093174 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -346,16 +346,8 @@ static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
 		spi->dma_tx = sdd->tx_dma.ch;
 	}
 
-	ret = pm_runtime_get_sync(&sdd->pdev->dev);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable device: %d\n", ret);
-		goto out_tx;
-	}
-
 	return 0;
 
-out_tx:
-	dma_release_channel(sdd->tx_dma.ch);
 out_rx:
 	dma_release_channel(sdd->rx_dma.ch);
 out:
@@ -372,7 +364,6 @@ static int s3c64xx_spi_unprepare_transfer(struct spi_master *spi)
 		dma_release_channel(sdd->tx_dma.ch);
 	}
 
-	pm_runtime_put(&sdd->pdev->dev);
 	return 0;
 }
 
-- 
2.1.3

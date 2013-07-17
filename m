From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] spi: s3c64xx: fix casting warning
Date: Wed, 17 Jul 2013 16:28:26 +0900
Message-ID: <007801ce82bf$3a435a20$aeca0e60$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47284 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab3GQH2a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jul 2013 03:28:30 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>, Jingoo Han <jg1.han@samsung.com>

sdd->ops->request is unsigned int, not unsigned long.
Thus, (void *) is converted to (unsigned long *)(unsigned long),
in order to fix possible sparse warnings.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Cc: Joe Perches <joe@perches.com>
---
 drivers/spi/spi-s3c64xx.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 702a536..7577d79 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -336,10 +336,10 @@ static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
 	req.cap = DMA_SLAVE;
 	req.client = &s3c64xx_spi_dma_client;
 
-	sdd->rx_dma.ch = (void *)sdd->ops->request(sdd->rx_dma.dmach,
-						&req, dev, "rx");
-	sdd->tx_dma.ch = (void *)sdd->ops->request(sdd->tx_dma.dmach,
-						&req, dev, "tx");
+	sdd->rx_dma.ch = (unsigned long *)(unsigned long)sdd->ops->request(
+					sdd->rx_dma.dmach, &req, dev, "rx");
+	sdd->tx_dma.ch = (unsigned long *)(unsigned long)sdd->ops->request(
+					sdd->tx_dma.dmach, &req, dev, "tx");
 
 	return 1;
 }
-- 
1.7.10.4

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 1/3] spi: s3c64xx: Zero dma_slave_config struct in prepare_dma()
Date: Sun, 11 Aug 2013 02:33:28 +0200
Message-ID: <1376181210-14599-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f181.google.com ([209.85.215.181]:52480 "EHLO
	mail-ea0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990Ab3HKAdu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Aug 2013 20:33:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-spi@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>

Not all fields of dma_slave_config struct are being initialized by
prepare_dma() function, leaving those which are not in undefined state,
which can confuse DMA drivers using them.

This patch adds call to memset() to zero the struct before initializing
a subset of its fields.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 62f32c4..1be162c 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -389,6 +389,8 @@ static void prepare_dma(struct s3c64xx_spi_dma_data *dma,
 	struct scatterlist sg;
 	struct dma_async_tx_descriptor *desc;
 
+	memset(&config, 0, sizeof(config));
+
 	if (dma->direction == DMA_DEV_TO_MEM) {
 		sdd = container_of((void *)dma,
 			struct s3c64xx_spi_driver_data, rx_dma);
-- 
1.8.3.2

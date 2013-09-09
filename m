From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 1/6] spi: spi-s3c64xx: Remove platform dependent code
Date: Mon, 09 Sep 2013 16:09:21 +0200
Message-ID: <1378735766-12330-2-git-send-email-l.czerwinski@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab3IIOJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:36 -0400
In-reply-to: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

Since support for generic DMA engine has beed added, there is no need
to keep platform specific code (behind the #ifdef CONFIG_S3C_DMA).

Signed-off-by: Lukasz Czerwinski <l.czerwinski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |  105 +--------------------------------------------
 1 file changed, 1 insertion(+), 104 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 512b889..106bc09 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -34,10 +34,6 @@
 
 #include <linux/platform_data/spi-s3c64xx.h>
 
-#ifdef CONFIG_S3C_DMA
-#include <mach/dma.h>
-#endif
-
 #define MAX_SPI_PORTS		3
 #define S3C64XX_SPI_QUIRK_POLL		(1 << 0)
 
@@ -200,9 +196,7 @@ struct s3c64xx_spi_driver_data {
 	unsigned                        cur_speed;
 	struct s3c64xx_spi_dma_data	rx_dma;
 	struct s3c64xx_spi_dma_data	tx_dma;
-#ifdef CONFIG_S3C_DMA
-	struct samsung_dma_ops		*ops;
-#endif
+
 	struct s3c64xx_spi_port_config	*port_conf;
 	unsigned int			port_id;
 	unsigned long			gpios[4];
@@ -285,102 +279,6 @@ static void s3c64xx_spi_dmacb(void *data)
 	spin_unlock_irqrestore(&sdd->lock, flags);
 }
 
-#ifdef CONFIG_S3C_DMA
-/* FIXME: remove this section once arch/arm/mach-s3c64xx uses dmaengine */
-
-static struct s3c2410_dma_client s3c64xx_spi_dma_client = {
-	.name = "samsung-spi-dma",
-};
-
-static void prepare_dma(struct s3c64xx_spi_dma_data *dma,
-					unsigned len, dma_addr_t buf)
-{
-	struct s3c64xx_spi_driver_data *sdd;
-	struct samsung_dma_prep info;
-	struct samsung_dma_config config;
-
-	if (dma->direction == DMA_DEV_TO_MEM) {
-		sdd = container_of((void *)dma,
-			struct s3c64xx_spi_driver_data, rx_dma);
-		config.direction = sdd->rx_dma.direction;
-		config.fifo = sdd->sfr_start + S3C64XX_SPI_RX_DATA;
-		config.width = sdd->cur_bpw / 8;
-		sdd->ops->config((enum dma_ch)sdd->rx_dma.ch, &config);
-	} else {
-		sdd = container_of((void *)dma,
-			struct s3c64xx_spi_driver_data, tx_dma);
-		config.direction =  sdd->tx_dma.direction;
-		config.fifo = sdd->sfr_start + S3C64XX_SPI_TX_DATA;
-		config.width = sdd->cur_bpw / 8;
-		sdd->ops->config((enum dma_ch)sdd->tx_dma.ch, &config);
-	}
-
-	info.cap = DMA_SLAVE;
-	info.len = len;
-	info.fp = s3c64xx_spi_dmacb;
-	info.fp_param = dma;
-	info.direction = dma->direction;
-	info.buf = buf;
-
-	sdd->ops->prepare((enum dma_ch)dma->ch, &info);
-	sdd->ops->trigger((enum dma_ch)dma->ch);
-}
-
-static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
-{
-	struct samsung_dma_req req;
-	struct device *dev = &sdd->pdev->dev;
-
-	sdd->ops = samsung_dma_get_ops();
-
-	req.cap = DMA_SLAVE;
-	req.client = &s3c64xx_spi_dma_client;
-
-	sdd->rx_dma.ch = (struct dma_chan *)(unsigned long)sdd->ops->request(
-					sdd->rx_dma.dmach, &req, dev, "rx");
-	sdd->tx_dma.ch = (struct dma_chan *)(unsigned long)sdd->ops->request(
-					sdd->tx_dma.dmach, &req, dev, "tx");
-
-	return 1;
-}
-
-static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
-{
-	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(spi);
-
-	/*
-	 * If DMA resource was not available during
-	 * probe, no need to continue with dma requests
-	 * else Acquire DMA channels
-	 */
-	while (!is_polling(sdd) && !acquire_dma(sdd))
-		usleep_range(10000, 11000);
-
-	return 0;
-}
-
-static int s3c64xx_spi_unprepare_transfer(struct spi_master *spi)
-{
-	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(spi);
-
-	/* Free DMA channels */
-	if (!is_polling(sdd)) {
-		sdd->ops->release((enum dma_ch)sdd->rx_dma.ch,
-					&s3c64xx_spi_dma_client);
-		sdd->ops->release((enum dma_ch)sdd->tx_dma.ch,
-					&s3c64xx_spi_dma_client);
-	}
-
-	return 0;
-}
-
-static void s3c64xx_spi_dma_stop(struct s3c64xx_spi_driver_data *sdd,
-				 struct s3c64xx_spi_dma_data *dma)
-{
-	sdd->ops->stop((enum dma_ch)dma->ch);
-}
-#else
-
 static void prepare_dma(struct s3c64xx_spi_dma_data *dma,
 					unsigned len, dma_addr_t buf)
 {
@@ -483,7 +381,6 @@ static void s3c64xx_spi_dma_stop(struct s3c64xx_spi_driver_data *sdd,
 {
 	dmaengine_terminate_all(dma->ch);
 }
-#endif
 
 static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 				struct spi_device *spi,
-- 
1.7.9.5

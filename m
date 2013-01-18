From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 04/10] spi: s3c64xx: Modify SPI driver to use generic DMA DT
 support
Date: Fri, 18 Jan 2013 17:17:03 +0530
Message-ID: <1358509629-20471-5-git-send-email-padma.v@samsung.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48050 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab3ARLyq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:54:46 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00I0SL33Y7X0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:54:45 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00LG7KPYX890@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:54:45 +0900 (KST)
In-reply-to: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

This patch modifies the SPI driver to use generic dma dt bindings
support. This passes all the required arguments to dma dev request
functon which in turn calls the dma_request_slave_channel or dma__
request_channel based on DT or non-DT respectively.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   77 +++++++++++++-------------------------------
 1 files changed, 23 insertions(+), 54 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index ad93231..51a8c42 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -134,7 +134,6 @@ struct s3c64xx_spi_dma_data {
 	unsigned		ch;
 	enum dma_transfer_direction direction;
 	enum dma_ch	dmach;
-	struct property		*dma_prop;
 };
 
 /**
@@ -319,16 +318,15 @@ static void prepare_dma(struct s3c64xx_spi_dma_data *dma,
 static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
 {
 	struct samsung_dma_req req;
+	struct device *dev = &sdd->pdev->dev;
 
 	sdd->ops = samsung_dma_get_ops();
 
 	req.cap = DMA_SLAVE;
 	req.client = &s3c64xx_spi_dma_client;
 
-	req.dt_dmach_prop = sdd->rx_dma.dma_prop;
-	sdd->rx_dma.ch = sdd->ops->request(sdd->rx_dma.dmach, &req);
-	req.dt_dmach_prop = sdd->tx_dma.dma_prop;
-	sdd->tx_dma.ch = sdd->ops->request(sdd->tx_dma.dmach, &req);
+	sdd->rx_dma.ch = sdd->ops->request(sdd->rx_dma.dmach, &req, dev, "rx");
+	sdd->tx_dma.ch = sdd->ops->request(sdd->tx_dma.dmach, &req, dev, "tx");
 
 	return 1;
 }
@@ -1054,49 +1052,6 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_driver_data *sdd, int channel)
 	flush_fifo(sdd);
 }
 
-static int s3c64xx_spi_get_dmares(
-			struct s3c64xx_spi_driver_data *sdd, bool tx)
-{
-	struct platform_device *pdev = sdd->pdev;
-	struct s3c64xx_spi_dma_data *dma_data;
-	struct property *prop;
-	struct resource *res;
-	char prop_name[15], *chan_str;
-
-	if (tx) {
-		dma_data = &sdd->tx_dma;
-		dma_data->direction = DMA_MEM_TO_DEV;
-		chan_str = "tx";
-	} else {
-		dma_data = &sdd->rx_dma;
-		dma_data->direction = DMA_DEV_TO_MEM;
-		chan_str = "rx";
-	}
-
-	if (!sdd->pdev->dev.of_node) {
-		res = platform_get_resource(pdev, IORESOURCE_DMA, tx ? 0 : 1);
-		if (!res) {
-			dev_err(&pdev->dev, "Unable to get SPI-%s dma "
-					"resource\n", chan_str);
-			return -ENXIO;
-		}
-		dma_data->dmach = res->start;
-		return 0;
-	}
-
-	sprintf(prop_name, "%s-dma-channel", chan_str);
-	prop = of_find_property(pdev->dev.of_node, prop_name, NULL);
-	if (!prop) {
-		dev_err(&pdev->dev, "%s dma channel property not specified\n",
-					chan_str);
-		return -ENXIO;
-	}
-
-	dma_data->dmach = DMACH_DT_PROP;
-	dma_data->dma_prop = prop;
-	return 0;
-}
-
 #ifdef CONFIG_OF
 static int s3c64xx_spi_parse_dt_gpio(struct s3c64xx_spi_driver_data *sdd)
 {
@@ -1198,6 +1153,7 @@ static inline struct s3c64xx_spi_port_config *s3c64xx_spi_get_port_config(
 static int __init s3c64xx_spi_probe(struct platform_device *pdev)
 {
 	struct resource	*mem_res;
+	struct resource	*res;
 	struct s3c64xx_spi_driver_data *sdd;
 	struct s3c64xx_spi_info *sci = pdev->dev.platform_data;
 	struct spi_master *master;
@@ -1256,13 +1212,26 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
 
 	sdd->cur_bpw = 8;
 
-	ret = s3c64xx_spi_get_dmares(sdd, true);
-	if (ret)
-		goto err0;
+	if (!sdd->pdev->dev.of_node) {
+		res = platform_get_resource(pdev, IORESOURCE_DMA,  0);
+		if (!res) {
+			dev_err(&pdev->dev, "Unable to get SPI tx dma "
+					"resource\n");
+			return -ENXIO;
+		}
+		sdd->tx_dma.dmach = res->start;
+
+		res = platform_get_resource(pdev, IORESOURCE_DMA,  1);
+		if (!res) {
+			dev_err(&pdev->dev, "Unable to get SPI rx dma "
+					"resource\n");
+			return -ENXIO;
+		}
+		sdd->rx_dma.dmach = res->start;
+	}
 
-	ret = s3c64xx_spi_get_dmares(sdd, false);
-	if (ret)
-		goto err0;
+	sdd->tx_dma.direction = DMA_MEM_TO_DEV;
+	sdd->rx_dma.direction = DMA_DEV_TO_MEM;
 
 	master->dev.of_node = pdev->dev.of_node;
 	master->bus_num = sdd->port_id;
-- 
1.7.4.4

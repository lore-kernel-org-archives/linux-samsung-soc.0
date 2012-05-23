From: Kyoungil Kim <ki0351.kim@samsung.com>
Subject: [PATCH] spi: Change FIFO flush operation and spi channel off
Date: Wed, 23 May 2012 21:29:51 +0900
Message-ID: <009f01cd38df$c00cf6f0$4026e4d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18141 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854Ab2EWM3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 08:29:53 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4H00ALZ6POAFK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 May 2012 21:29:51 +0900 (KST)
Received: from DOKI0351KIM04 ([12.23.119.96])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4H0037O6PRLX10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 May 2012 21:29:51 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Kyoungil Kim' <ki0351.kim@samsung.com>

Setting SW_RST does TX/RX FIFO flush.
After FIFO flush, SW_RST should be cleared.
The above setting and clearing SW_RST operation should be done after spi channel off.

Signed-off-by: Kyoungil Kim <ki0351.kim@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 972a94c..293f097 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -191,6 +191,10 @@ static void flush_fifo(struct s3c64xx_spi_driver_data *sdd)
 	writel(0, regs + S3C64XX_SPI_PACKET_CNT);
 
 	val = readl(regs + S3C64XX_SPI_CH_CFG);
+	val &= ~(S3C64XX_SPI_CH_RXCH_ON | S3C64XX_SPI_CH_TXCH_ON);
+	writel(val, regs + S3C64XX_SPI_CH_CFG);
+
+	val = readl(regs + S3C64XX_SPI_CH_CFG);
 	val |= S3C64XX_SPI_CH_SW_RST;
 	val &= ~S3C64XX_SPI_CH_HS_EN;
 	writel(val, regs + S3C64XX_SPI_CH_CFG);
@@ -224,10 +228,6 @@ static void flush_fifo(struct s3c64xx_spi_driver_data *sdd)
 	val = readl(regs + S3C64XX_SPI_MODE_CFG);
 	val &= ~(S3C64XX_SPI_MODE_TXDMA_ON | S3C64XX_SPI_MODE_RXDMA_ON);
 	writel(val, regs + S3C64XX_SPI_MODE_CFG);
-
-	val = readl(regs + S3C64XX_SPI_CH_CFG);
-	val &= ~(S3C64XX_SPI_CH_RXCH_ON | S3C64XX_SPI_CH_TXCH_ON);
-	writel(val, regs + S3C64XX_SPI_CH_CFG);
 }
 
 static void s3c64xx_spi_dmacb(void *data)
-- 
1.7.1

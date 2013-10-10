From: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
Subject: [RFC/PATCH V2] spi: s3c64xx: Enable Word transfer
Date: Thu, 10 Oct 2013 16:11:37 +0530
Message-ID: <1381401697-25992-1-git-send-email-rajeshwari.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9900 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754781Ab3JJKkL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 06:40:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-spi@vger.kernel.org, sjg@chromium.org, alim.akhtar@samsung.com, dianders@google.com, t.figa@samsung.com, broonie@linaro.org

This patch enables word transfer for s3c64xx spi driver.
User can set bits_per_word to 32 before calling spi_setup,
which would enable the word transfer mode.

Signed-off-by: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
---
Chnages in V2:
	- Reduced the call for s3c64xx_spi_config 
 drivers/spi/spi-s3c64xx.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 512b889..d1b0a2b 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -498,6 +498,17 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
 	chcfg = readl(regs + S3C64XX_SPI_CH_CFG);
 	chcfg &= ~S3C64XX_SPI_CH_TXCH_ON;
 
+	if(sdd->cur_bpw == 32) {
+		/* For word transfer we need to swap bytes */
+		u32 swapcfg = (S3C64XX_SPI_SWAP_TX_EN | S3C64XX_SPI_SWAP_TX_BYTE |
+				S3C64XX_SPI_SWAP_TX_HALF_WORD |
+				S3C64XX_SPI_SWAP_RX_EN |
+				S3C64XX_SPI_SWAP_RX_BYTE |
+				S3C64XX_SPI_SWAP_RX_HALF_WORD);
+		writel(swapcfg, regs + S3C64XX_SPI_SWAP_CFG);
+	} else
+		writel(0, regs + S3C64XX_SPI_SWAP_CFG);
+
 	if (dma_mode) {
 		chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
 	} else {
@@ -905,13 +916,12 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
 		bpw = xfer->bits_per_word;
 		speed = xfer->speed_hz ? : spi->max_speed_hz;
 
-		if (xfer->len % (bpw / 8)) {
-			dev_err(&spi->dev,
-				"Xfer length(%u) not a multiple of word size(%u)\n",
-				xfer->len, bpw / 8);
-			status = -EIO;
-			goto out;
-		}
+		/*
+		 * Enable byte tranfer if transfer length not a multiple of
+		 * word size
+		 */
+		if (xfer->len % (bpw / 8))
+			bpw = 8;
 
 		if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
 			sdd->cur_bpw = bpw;
-- 
1.7.12.4

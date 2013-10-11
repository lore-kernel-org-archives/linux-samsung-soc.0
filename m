From: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
Subject: [RFC/PATCH V3] spi: s3c64xx: Enable Word transfer
Date: Fri, 11 Oct 2013 10:17:48 +0530
Message-ID: <1381466868-27679-1-git-send-email-rajeshwari.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64123 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040Ab3JKEqN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 00:46:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-spi@vger.kernel.org, sjg@chromium.org, alim.akhtar@samsung.com, dianders@google.com, t.figa@samsung.com, broonie@linaro.org, broonie@kernel.org

This patch enables word transfer for s3c64xx spi driver.
User can set bits_per_word to 32 before calling spi_setup,
which would enable the word transfer mode.

Signed-off-by: Rajeshwari S Shinde <rajeshwari.s@samsung.com>
---
Changes in V2
	- Reduced the call for s3c64xx_spi_config.
Changes in V3:
	- Corrected the coding style nits.
 drivers/spi/spi-s3c64xx.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 512b889..cbbeff3 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -498,6 +498,18 @@ static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
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
+	} else {
+		writel(0, regs + S3C64XX_SPI_SWAP_CFG);
+	}
+
 	if (dma_mode) {
 		chcfg &= ~S3C64XX_SPI_CH_RXCH_ON;
 	} else {
@@ -905,13 +917,12 @@ static int s3c64xx_spi_transfer_one_message(struct spi_master *master,
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
+		 * Enable byte transfer if transfer length not a multiple of
+		 * word size
+		 */
+		if (xfer->len % (bpw / 8))
+			bpw = 8;
 
 		if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
 			sdd->cur_bpw = bpw;
-- 
1.7.12.4

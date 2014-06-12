From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/3 v4] spi: s3c64xx: for DT platofrms always get the
 chipselect info from DT node
Date: Thu, 12 Jun 2014 18:43:40 +0530
Message-ID: <1402578821-27338-2-git-send-email-ch.naveen@samsung.com>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14494 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932554AbaFLNSZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 09:18:25 -0400
In-reply-to: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Use controller_data structure only for the Non Device tree  platforms.
For Device tree platforms, always derive the chipselect info from
DT node.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index b888c66..f27e15d 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -795,14 +795,15 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 	int err;
 
 	sdd = spi_master_get_devdata(spi->master);
-	if (!cs && spi->dev.of_node) {
+	if (spi->dev.of_node) {
 		cs = s3c64xx_get_slave_ctrldata(spi);
 		spi->controller_data = cs;
-	}
-
-	/* For the non-DT platforms derive chip selects from controller data */
-	if (!spi->dev.of_node)
+	} else {
+		/* For the non-DT platforms derive chip
+		 * selects from controller data
+		 */
 		spi->cs_gpio = cs->line;
+	}
 
 	if (IS_ERR_OR_NULL(cs)) {
 		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
-- 
1.7.9.5

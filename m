From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/3 v5] spi: s3c64xx: for DT platofrms always get the
 chipselect info from DT node
Date: Fri, 13 Jun 2014 09:29:51 +0530
Message-ID: <1402631992-500-2-git-send-email-ch.naveen@samsung.com>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8941 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292AbaFMECo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 00:02:44 -0400
In-reply-to: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org

Use controller_data structure only for the Non Device tree  platforms.
For Device tree platforms, always derive the chipselect info from
DT node.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Doug Anderson <dianders@chromium.org>
---
Changes since v4:
1. Added reviewed by from Javier and Tested by from Doug

Changes since v3:
New change

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

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 2/3] spi: s3c64xx: Do not request CS GPIO on subsequent calls to .setup()
Date: Sun, 11 Aug 2013 02:33:29 +0200
Message-ID: <1376181210-14599-2-git-send-email-tomasz.figa@gmail.com>
References: <1376181210-14599-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:36450 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990Ab3HKAdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Aug 2013 20:33:52 -0400
In-Reply-To: <1376181210-14599-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-spi@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>

Comments in linux/spi/spi.h and observed behavior show that .setup()
callback can be called multiple times without corresponding calls to
.cleanup(), what was incorrectly assumed by spi-s3c64xx driver, leading
to failures trying to request CS GPIO multiple times.

This patch modifies the behavior of spi-s3c64xx driver to request CS
GPIO only on first call to .setup() after last .cleanup().

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 1be162c..597dc2f 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1068,20 +1068,21 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 		return -ENODEV;
 	}
 
-	/* Request gpio only if cs line is asserted by gpio pins */
-	if (sdd->cs_gpio) {
-		err = gpio_request_one(cs->line, GPIOF_OUT_INIT_HIGH,
-				       dev_name(&spi->dev));
-		if (err) {
-			dev_err(&spi->dev,
-				"Failed to get /CS gpio [%d]: %d\n",
-				cs->line, err);
-			goto err_gpio_req;
+	if (!spi_get_ctldata(spi)) {
+		/* Request gpio only if cs line is asserted by gpio pins */
+		if (sdd->cs_gpio) {
+			err = gpio_request_one(cs->line, GPIOF_OUT_INIT_HIGH,
+					dev_name(&spi->dev));
+			if (err) {
+				dev_err(&spi->dev,
+					"Failed to get /CS gpio [%d]: %d\n",
+					cs->line, err);
+				goto err_gpio_req;
+			}
 		}
-	}
 
-	if (!spi_get_ctldata(spi))
 		spi_set_ctldata(spi, cs);
+	}
 
 	sci = sdd->cntrlr_info;
 
-- 
1.8.3.2

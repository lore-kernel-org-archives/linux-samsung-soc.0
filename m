From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] spi/s3c64xx: Complain if we fail to set a transfer speed
Date: Fri,  4 Jan 2013 21:33:09 +0000
Message-ID: <1357335189-17398-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:39220 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754951Ab3ADVdM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jan 2013 16:33:12 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net, Mark Brown <broonie@opensource.wolfsonmicro.com>

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/spi/spi-s3c64xx.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index ad93231..6495352 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -957,6 +957,8 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 		if (spi->max_speed_hz >= speed) {
 			spi->max_speed_hz = speed;
 		} else {
+			dev_err(&spi->dev, "Can't set %dHz transfer speed\n",
+				spi->max_speed_hz);
 			err = -EINVAL;
 			goto setup_exit;
 		}
-- 
1.7.10.4

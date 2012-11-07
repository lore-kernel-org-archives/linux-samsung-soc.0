From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] spi: s3c64xx: Add fix for crash in spi suspend/resume
Date: Wed, 07 Nov 2012 11:40:12 +0530
Message-ID: <1352268612-9671-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47408 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751011Ab2KGGLW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 01:11:22 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD300F0GT62NO70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 15:11:20 +0900 (KST)
Received: from naveen-linux.sisodomain.com ([107.108.83.161])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MD300H7XT51HN10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Nov 2012 15:11:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net
Cc: naveenkrishna.ch@gmail.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org

From: Abhilash Kesavan <a.kesavan@samsung.com>

The SPI driver makes a gpio_request during initialization. The requested
gpios need to be populated as part of the s3c64xx_spi_driver_data so that
they can be released during suspend and requested again during resume.

Add the missing code to save the requested gpios as part of the driver
data. This fixes a SPI driver suspend crash.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---

This was tested on spi-next branch
http://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git

With S2R patches submitted on mailing list.
http://www.spinics.net/lists/arm-kernel/msg205244.html

 drivers/spi/spi-s3c64xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 01b2f56..57900a8 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1112,7 +1112,7 @@ static int s3c64xx_spi_parse_dt_gpio(struct s3c64xx_spi_driver_data *sdd)
 			dev_err(dev, "invalid gpio[%d]: %d\n", idx, gpio);
 			goto free_gpio;
 		}
-
+		sdd->gpios[idx] = gpio;
 		ret = gpio_request(gpio, "spi-bus");
 		if (ret) {
 			dev_err(dev, "gpio [%d] request failed: %d\n",
-- 
1.7.9.5

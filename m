From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 2/3] spi: s3c64xx: remove a compilation warning with an
 assignment
Date: Tue, 10 Jun 2014 14:30:58 +0530
Message-ID: <1402390859-28287-3-git-send-email-ch.naveen@samsung.com>
References: <1402390859-28287-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17928 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaFJJDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 05:03:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6Y001BV3U9HF80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jun 2014 18:03:45 +0900 (KST)
In-reply-to: <1402390859-28287-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>

This patch returns an integer error value instead of the
pointer.

"warning: return makes integer from pointer without a cast"

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>
---
 drivers/spi/spi-s3c64xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 0c6013f..4594dde 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -817,7 +817,7 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 
 	if (!spi->dev.of_node) {
 		dev_err(&spi->dev, "device node not found\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	sdd = spi_master_get_devdata(spi->master);
-- 
1.7.9.5

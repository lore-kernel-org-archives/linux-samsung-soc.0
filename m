From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 1/6] spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
Date: Sun, 03 Jun 2012 18:05:08 +0530
Message-ID: <1338726913-18076-2-git-send-email-thomas.abraham@linaro.org>
References: <1338726913-18076-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32366 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752995Ab2FCMUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:20:14 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M510011IJLMRJ40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:20:14 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M51004KLJLINJ60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 03 Jun 2012 21:20:14 +0900 (KST)
In-reply-to: <1338726913-18076-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org, broonie@opensource.wolfsonmicro.com

The macro S3C64XX_SPI_ST_TRLCNTZ is not used and hence it is removed.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/spi/spi-s3c64xx.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 972a94c..6a3d51a 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -113,10 +113,6 @@
 
 #define S3C64XX_SPI_FBCLK_MSK		(3<<0)
 
-#define S3C64XX_SPI_ST_TRLCNTZ(v, i) ((((v) >> (i)->rx_lvl_offset) & \
-					(((i)->fifo_lvl_mask + 1))) \
-					? 1 : 0)
-
 #define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & (1 << (i)->tx_st_done)) ? 1 : 0)
 #define TX_FIFO_LVL(v, i) (((v) >> 6) & (i)->fifo_lvl_mask)
 #define RX_FIFO_LVL(v, i) (((v) >> (i)->rx_lvl_offset) & (i)->fifo_lvl_mask)
-- 
1.6.6.rc2

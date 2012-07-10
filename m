From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 1/6] spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
Date: Tue, 10 Jul 2012 19:57:34 +0530
Message-ID: <1341930459-25223-2-git-send-email-thomas.abraham@linaro.org>
References: <1341930459-25223-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13583 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752243Ab2GJOQ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jul 2012 10:16:59 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Y00E4P7OACTV0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 23:16:58 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Y003JQ7JFBF00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 23:16:58 +0900 (KST)
In-reply-to: <1341930459-25223-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: broonie@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

The macro S3C64XX_SPI_ST_TRLCNTZ is not used and hence it is removed.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/spi/spi-s3c64xx.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 3c36cfa..6e60eec 100644
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

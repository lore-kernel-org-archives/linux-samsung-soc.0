From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 01/10] spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
Date: Wed, 09 May 2012 03:34:45 +0530
Message-ID: <1336514694-22393-2-git-send-email-thomas.abraham@linaro.org>
References: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:21675 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756843Ab2EHVwl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 17:52:41 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3Q005OY4RQRBI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 06:52:40 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3Q009L04RKMU40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 06:52:40 +0900 (KST)
In-reply-to: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

The macro S3C64XX_SPI_ST_TRLCNTZ is not used and hence it is removed.

Cc: Jaswinder Singh <jaswinder.singh@linaro.org>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
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

From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] SPI: S5P64X0: Enable SPI driver for S5P6440 and S5P6450
Date: Fri,  3 Dec 2010 10:04:13 +0900
Message-ID: <1291338253-16461-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43597 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758254Ab0LCBSU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 20:18:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

This patch enable the existing S3C64XX series SPI driver for S5P64X0

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 drivers/spi/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 78f9fd0..56e6249 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -304,8 +304,8 @@ config SPI_S3C24XX_GPIO
 
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
-	depends on ARCH_S3C64XX && EXPERIMENTAL
-	select S3C64XX_DMA
+	depends on (ARCH_S3C64XX || ARCH_S5P64X0) && EXPERIMENTAL
+	select S3C64XX_DMA if !ARCH_S5P64X0
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
 
-- 
1.6.6.1

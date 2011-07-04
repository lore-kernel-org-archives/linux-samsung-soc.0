From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/2] SPI: S5PC100: Enable the SPI driver for S5PC100
Date: Mon, 04 Jul 2011 13:44:35 -0400
Message-ID: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55973 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949Ab1GDL45 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 07:56:57 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT004GF56W3MU0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:56:56 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00JO856PYI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:56:56 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: padmavathi venna <padma.v@samsung.com>

From: padmavathi venna <padma.v@samsung.com>

The SPI module on S5PC100 is similar to the earlier Samsung SoCs like
S3C64XX. Enable the existing SPI driver for use on S5PC100.

Signed-off-by: padmavathi venna <padma.v@samsung.com>
---
 drivers/spi/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index de35c3a..91d607b 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -340,7 +340,7 @@ config SPI_S3C24XX_GPIO
 
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
-	depends on (ARCH_S3C64XX || ARCH_S5P64X0)
+	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100)
 	select S3C64XX_DMA if ARCH_S3C64XX
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
-- 
1.7.0.4

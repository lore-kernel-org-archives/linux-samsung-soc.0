From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/2] SPI: S5PV210: Enable the SPI driver for S5PV210
Date: Mon, 04 Jul 2011 13:44:36 -0400
Message-ID: <1309801476-29678-2-git-send-email-padma.v@samsung.com>
References: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55973 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab1GDL45 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 07:56:57 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT004GF56W3MU0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:56:57 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00JO856PYI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:56:57 +0900 (KST)
In-reply-to: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The SPI module on S5PV210 is similar to the earlier Samsung SoCs like
S3C64XX. Enable the existing SPI driver for use on S5PV210.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/spi/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 91d607b..ed1ebea 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -340,7 +340,8 @@ config SPI_S3C24XX_GPIO
 
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
-	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100)
+	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100 \
+			|| ARCH_S5PV210)
 	select S3C64XX_DMA if ARCH_S3C64XX
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
-- 
1.7.0.4

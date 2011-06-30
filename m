From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 7/7] SPI: S5PV210: Enable the SPI driver for S5PV210
Date: Thu, 30 Jun 2011 08:25:23 -0400
Message-ID: <1309436723-662-8-git-send-email-padma.v@samsung.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62759 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758212Ab1F3GiZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 02:38:25 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00KL8BRNPAC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 15:38:24 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL0026NBR6C8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 15:38:24 +0900 (KST)
In-reply-to: <1309436723-662-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

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

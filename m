From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/2] SPI: EXYNOS4: Enable the SPI driver for EXYNOS4
Date: Fri, 30 Sep 2011 17:09:40 +0530
Message-ID: <1317382780-3083-3-git-send-email-padma.v@samsung.com>
References: <1317382780-3083-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40875 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755655Ab1I3Ld6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 07:33:58 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSC001GY2S5FKS0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Sep 2011 20:33:58 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSC00KJD2SD4140@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Sep 2011 20:33:58 +0900 (KST)
In-reply-to: <1317382780-3083-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk

The SPI module on EXYNOS4 is similar to the earlier Samsung SoCs like
S3C64XX. Enable the existing SPI driver for use on EXYNOS4.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/spi/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 52e2900..f3649f6 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -300,7 +300,7 @@ config SPI_S3C24XX_FIQ
 
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
-	depends on (ARCH_S3C64XX || ARCH_S5P64X0)
+	depends on ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_EXYNOS4
 	select S3C64XX_DMA if ARCH_S3C64XX
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
-- 
1.7.4.4

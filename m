From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 1/8] spi: s3c64xx: Do not require legacy DMA API in case of S3C64XX
Date: Wed, 16 Oct 2013 21:10:52 +0200
Message-ID: <1381950659-12703-2-git-send-email-tomasz.figa@gmail.com>
References: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:53723 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761138Ab3JPTLN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 15:11:13 -0400
In-Reply-To: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben-linux@fluff.org>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Tomasz Figa <tomasz.figa@gmail.com>

With support for amba-pl08x driver, on S3C64xx the generic DMA engine
API can be used instead of the private s3c-dma interface.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index eb1f1ef..760d7b6 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -395,7 +395,7 @@ config SPI_S3C24XX_FIQ
 config SPI_S3C64XX
 	tristate "Samsung S3C64XX series type SPI"
 	depends on PLAT_SAMSUNG
-	select S3C64XX_DMA if ARCH_S3C64XX
+	select S3C64XX_DMA if ARCH_S3C64XX && !S3C64XX_PL080
 	help
 	  SPI driver for Samsung S3C64XX and newer SoCs.
 
-- 
1.8.3.2

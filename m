From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 4/8] clk: samsung: s3c64xx: Add aliases for DMA clocks
Date: Wed, 16 Oct 2013 21:10:55 +0200
Message-ID: <1381950659-12703-5-git-send-email-tomasz.figa@gmail.com>
References: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:32944 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761223Ab3JPTLR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 15:11:17 -0400
In-Reply-To: <1381950659-12703-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben-linux@fluff.org>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Tomasz Figa <tomasz.figa@gmail.com>

This patch adds clkdev aliases for clocks used by PL08x DMA driver.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clk/samsung/clk-s3c64xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index 7d2c842..06cf105 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -332,7 +332,9 @@ static struct samsung_clock_alias s3c64xx_clock_aliases[] = {
 	ALIAS(HCLK_HSMMC0, "s3c-sdhci.0", "hsmmc"),
 	ALIAS(HCLK_HSMMC0, "s3c-sdhci.0", "mmc_busclk.0"),
 	ALIAS(HCLK_DMA1, NULL, "dma1"),
+	ALIAS(HCLK_DMA1, "dma-pl080s.1", "apb_pclk"),
 	ALIAS(HCLK_DMA0, NULL, "dma0"),
+	ALIAS(HCLK_DMA0, "dma-pl080s.0", "apb_pclk"),
 	ALIAS(HCLK_CAMIF, "s3c-camif", "camif"),
 	ALIAS(HCLK_LCD, "s3c-fb", "lcd"),
 	ALIAS(PCLK_SPI1, "s3c6410-spi.1", "spi"),
-- 
1.8.3.2

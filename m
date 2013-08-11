From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 14/18] clk: samsung: s3c64xx: Add aliases for DMA clocks
Date: Sun, 11 Aug 2013 19:59:26 +0200
Message-ID: <1376243970-6489-15-git-send-email-tomasz.figa@gmail.com>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Dan Williams <djbw@fb.com>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Vinod Koul <vinod.koul@intel.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds clkdev aliases for clocks used by PL08x DMA driver.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clk/samsung/clk-s3c64xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index eeda567..79ee9a6 100644
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

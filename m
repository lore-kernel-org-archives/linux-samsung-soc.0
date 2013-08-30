From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] clk: s3c64xx: Fix aliases for SPI devices
Date: Fri, 30 Aug 2013 22:47:44 +0100
Message-ID: <1377899264-5917-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47083 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754571Ab3H3Vrv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Aug 2013 17:47:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The clock aliases for SPI devices do not reflect the actual usage in the
driver causing the SPI controller to fail to probe when the clock driver
is in use, fix this up.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/clk/samsung/clk-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index eeda567..d4f4f70 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -356,8 +356,8 @@ static struct samsung_clock_alias s3c64xx_clock_aliases[] = {
 	ALIAS(SCLK_MMC2, "s3c-sdhci.2", "mmc_busclk.2"),
 	ALIAS(SCLK_MMC1, "s3c-sdhci.1", "mmc_busclk.2"),
 	ALIAS(SCLK_MMC0, "s3c-sdhci.0", "mmc_busclk.2"),
-	ALIAS(SCLK_SPI1, "s3c6410-spi.1", "spi-bus"),
-	ALIAS(SCLK_SPI0, "s3c6410-spi.0", "spi-bus"),
+	ALIAS(SCLK_SPI1, "s3c6410-spi.1", "spi_busclk1"),
+	ALIAS(SCLK_SPI0, "s3c6410-spi.0", "spi_busclk0"),
 	ALIAS(SCLK_AUDIO1, "samsung-pcm.1", "audio-bus"),
 	ALIAS(SCLK_AUDIO1, "samsung-i2s.1", "audio-bus"),
 	ALIAS(SCLK_AUDIO0, "samsung-pcm.0", "audio-bus"),
-- 
1.8.4.rc3

From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi/s3c64xx: Rely on the compiler eliminating the OF ID table
Date: Wed, 26 Jun 2013 16:20:17 +0100
Message-ID: <1372260017-24723-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:59641 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752360Ab3FZPUk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Jun 2013 11:20:40 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

This should work with modern compilers, isn't that much of an issue if
it goes wrong and it ensures that the DT-only hardware variants don't
leave unreferenced parameters structures lying around.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 5ec7d39..eb53df2 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1640,7 +1640,6 @@ static struct platform_device_id s3c64xx_spi_driver_ids[] = {
 	{ },
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id s3c64xx_spi_dt_match[] = {
 	{ .compatible = "samsung,exynos4210-spi",
 			.data = (void *)&exynos4_spi_port_config,
@@ -1651,7 +1650,6 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
 	{ },
 };
 MODULE_DEVICE_TABLE(of, s3c64xx_spi_dt_match);
-#endif /* CONFIG_OF */
 
 static struct platform_driver s3c64xx_spi_driver = {
 	.driver = {
-- 
1.8.3.1

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] spi: s3c64xx: Remove unused platform_device_id entries
Date: Tue, 29 Dec 2015 18:34:40 +0100
Message-ID: <1451410480-13935-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44659 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200AbbL2RhI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Dec 2015 12:37:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

s5pv210 and exynos4 are now DT only platforms hence these
entries can now be safely removed from the match table.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8e86e7f..ec697fe 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1370,12 +1370,6 @@ static const struct platform_device_id s3c64xx_spi_driver_ids[] = {
 	}, {
 		.name		= "s3c6410-spi",
 		.driver_data	= (kernel_ulong_t)&s3c6410_spi_port_config,
-	}, {
-		.name		= "s5pv210-spi",
-		.driver_data	= (kernel_ulong_t)&s5pv210_spi_port_config,
-	}, {
-		.name		= "exynos4210-spi",
-		.driver_data	= (kernel_ulong_t)&exynos4_spi_port_config,
 	},
 	{ },
 };
-- 
1.7.9.5

From: Lukasz Czerwinski <l.czerwinski@samsung.com>
Subject: [RFC PATCH 5/6] spi: spi-s3c64xx: Use module_platform_driver()
Date: Mon, 09 Sep 2013 16:09:25 +0200
Message-ID: <1378735766-12330-6-git-send-email-l.czerwinski@samsung.com>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35033 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab3IIOJk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:09:40 -0400
In-reply-to: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

subsys_init_call() initializes driver too early.
It's preventing to move DMA channel allocation at the begining
(driver probe).

This patch reduces and simplifies initalization code by
using module_platform_driver() macro.
It's also efficiently delaying driver startup.

Signed-off-by: Lukasz Czerwinski <l.czerwinski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 3c20b73..9335f66 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1528,22 +1528,13 @@ static struct platform_driver s3c64xx_spi_driver = {
 		.pm = &s3c64xx_spi_pm,
 		.of_match_table = of_match_ptr(s3c64xx_spi_dt_match),
 	},
+	.probe = s3c64xx_spi_probe,
 	.remove = s3c64xx_spi_remove,
 	.id_table = s3c64xx_spi_driver_ids,
 };
 MODULE_ALIAS("platform:s3c64xx-spi");
 
-static int __init s3c64xx_spi_init(void)
-{
-	return platform_driver_probe(&s3c64xx_spi_driver, s3c64xx_spi_probe);
-}
-subsys_initcall(s3c64xx_spi_init);
-
-static void __exit s3c64xx_spi_exit(void)
-{
-	platform_driver_unregister(&s3c64xx_spi_driver);
-}
-module_exit(s3c64xx_spi_exit);
+module_platform_driver(s3c64xx_spi_driver);
 
 MODULE_AUTHOR("Jaswinder Singh <jassi.brar@samsung.com>");
 MODULE_DESCRIPTION("S3C64XX SPI Controller Driver");
-- 
1.7.9.5

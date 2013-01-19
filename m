From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] i2c: s3c2410: Add quirk to exclude GPIO config for exynos5440
Date: Fri, 18 Jan 2013 21:12:03 -0800
Message-ID: <1358572323-24486-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54491 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862Ab3ASFMo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 00:12:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: Wolfram Sang <w.sang@pengutronix.de>, Giridhar Maruthy <giridhar.m@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Giridhar Maruthy <giridhar.m@samsung.com>

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index a290d08..ec141b4 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -109,6 +109,8 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
 static const struct of_device_id s3c24xx_i2c_match[] = {
 	{ .compatible = "samsung,s3c2410-i2c", .data = (void *)0 },
 	{ .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440 },
+	{ .compatible = "samsung,exynos5440-i2c",
+	  .data = (void *)(QUIRK_S3C2440 | QUIRK_NO_GPIO) },
 	{ .compatible = "samsung,s3c2440-hdmiphy-i2c",
 	  .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
 	{},
-- 
1.7.10.4

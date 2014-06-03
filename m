From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue,  3 Jun 2014 14:30:22 +0530
Message-ID: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f67.google.com ([209.85.160.67]:40700 "EHLO
	mail-pb0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbaFCJC6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 05:02:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, kgene.kim@samsung.com, ch.naveen@samsung.com, spk.linux@gmail.com, Olof Johansson <olof@lixom.net>

With multiplatform support enabled for Exynos, class based
instantiation causes a boot time delay due to I2C_CLASS_HWMON
triggered probe. Since class based instantiation has been
deprecated since some time now, remove it for Samsung I2C driver.

Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
Cc: Olof Johansson <olof@lixom.net>
---
 drivers/i2c/busses/i2c-s3c2410.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index bb3a9964f7e0..6f1706cdd9ba 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1135,7 +1135,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	i2c->adap.owner   = THIS_MODULE;
 	i2c->adap.algo    = &s3c24xx_i2c_algorithm;
 	i2c->adap.retries = 2;
-	i2c->adap.class   = I2C_CLASS_HWMON | I2C_CLASS_SPD | I2C_CLASS_DEPRECATED;
 	i2c->tx_setup     = 50;
 
 	init_waitqueue_head(&i2c->wait);
-- 
1.7.9.5

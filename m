From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 3/3] i2c-s3c2410: Refactor ifdefs for PM_SLEEP
Date: Mon, 13 Feb 2012 15:05:04 -0800
Message-ID: <1329174304-12228-3-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1329174304-12228-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56928 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754591Ab2BMXFK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 18:05:10 -0500
In-Reply-To: <1329174304-12228-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, khali@linux-fr.org, w.sang@pengutronix.de
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Use the PM_SLEEP ifdef for system suspend and resume. This is partly
in preparation for adding runtime operations and partly because a user
may in theory choose to enable runtime suspend but not system suspend.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 1cb06c58..5d8e802 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1073,7 +1073,7 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int s3c24xx_i2c_suspend_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1096,10 +1096,14 @@ static int s3c24xx_i2c_resume(struct device *dev)
 
 	return 0;
 }
+#endif
 
+#ifdef CONFIG_PM
 static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
 	.suspend_noirq = s3c24xx_i2c_suspend_noirq,
 	.resume = s3c24xx_i2c_resume,
+#endif
 };
 
 #define S3C24XX_DEV_PM_OPS (&s3c24xx_i2c_dev_pm_ops)
-- 
1.7.9.rc1

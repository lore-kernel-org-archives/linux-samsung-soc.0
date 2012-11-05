From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 1/2] i2c-s3c2410: Refactor ifdefs for PM_SLEEP
Date: Mon,  5 Nov 2012 09:33:38 +0100
Message-ID: <1352104419-31630-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Use the PM_SLEEP ifdef for system suspend and resume. This is partly
in preparation for adding runtime operations and partly because a user
may in theory choose to enable runtime suspend but not system suspend.

Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Reviewed-by: Shubhrajyoti D <shubhrajyoti-l0cyMroinI0@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 3e0335f..f01cdf3 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1118,7 +1118,7 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int s3c24xx_i2c_suspend_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1141,10 +1141,14 @@ static int s3c24xx_i2c_resume(struct device *dev)
 
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
1.7.10.4

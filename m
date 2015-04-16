From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] i2c: s3c2410: Don't enable PM runtime on the adapter device
Date: Thu, 16 Apr 2015 11:10:25 +0100
Message-ID: <1429179025-5352-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:35640 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756900AbbDPKQr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 06:16:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: wsa@the-dreams.de
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, lars@metafoo.de

Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
ops from the bus type, which causes the pm operations on the s3c2410
adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
doesn't get bound to a driver and as such can't have its own pm_runtime
callbacks. Previously this was fine as the bus callbacks would have been
used, but now this can cause devices which use PM runtime and are
attached over I2C to fail to resume.

This commit fixes this issue by just doing the PM operations directly on
the I2C device, rather than the adapter device in the driver and adding
some stub callbacks for runtime suspend and resume.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |   21 ++++++++++++++++-----
 1 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 958c8db..4e6a724 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -784,7 +784,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	int retry;
 	int ret;
 
-	pm_runtime_get_sync(&adap->dev);
+	pm_runtime_get_sync(i2c->dev);
 	ret = clk_enable(i2c->clk);
 	if (ret)
 		return ret;
@@ -795,7 +795,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 
 		if (ret != -EAGAIN) {
 			clk_disable(i2c->clk);
-			pm_runtime_put(&adap->dev);
+			pm_runtime_put(i2c->dev);
 			return ret;
 		}
 
@@ -805,7 +805,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	clk_disable(i2c->clk);
-	pm_runtime_put(&adap->dev);
+	pm_runtime_put(i2c->dev);
 	return -EREMOTEIO;
 }
 
@@ -1253,7 +1253,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2c);
 
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_enable(&i2c->adap.dev);
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
 	return 0;
@@ -1270,7 +1269,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 
 	clk_unprepare(i2c->clk);
 
-	pm_runtime_disable(&i2c->adap.dev);
 	pm_runtime_disable(&pdev->dev);
 
 	s3c24xx_i2c_deregister_cpufreq(i2c);
@@ -1318,6 +1316,16 @@ static int s3c24xx_i2c_resume_noirq(struct device *dev)
 #endif
 
 #ifdef CONFIG_PM
+static int s3c24xx_runtime_resume(struct device *dev)
+{
+	return 0;
+}
+
+static int s3c24xx_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
 static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
 #ifdef CONFIG_PM_SLEEP
 	.suspend_noirq = s3c24xx_i2c_suspend_noirq,
@@ -1327,6 +1335,9 @@ static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
 	.poweroff_noirq = s3c24xx_i2c_suspend_noirq,
 	.restore_noirq = s3c24xx_i2c_resume_noirq,
 #endif
+	SET_RUNTIME_PM_OPS(s3c24xx_runtime_suspend,
+			   s3c24xx_runtime_resume,
+			   NULL)
 };
 
 #define S3C24XX_DEV_PM_OPS (&s3c24xx_i2c_dev_pm_ops)
-- 
1.7.2.5

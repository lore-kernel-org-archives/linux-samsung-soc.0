From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 18:46:40 +0000
Message-ID: <1327171600-5489-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37539 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751107Ab2AUSqo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 13:46:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Add stub runtime_pm calls which go through the flow of enabling and
disabling but don't actually do anything with the device itself as
there's nothing useful we can do. This provides the core PM framework
with information about when the device is idle, enabling chip wide
power savings.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/i2c/busses/i2c-s3c2410.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index e6f982b..3d80bab 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -31,6 +31,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
@@ -564,6 +565,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	int retry;
 	int ret;
 
+	pm_runtime_get_sync(&adap->dev);
 	clk_enable(i2c->clk);
 
 	for (retry = 0; retry < adap->retries; retry++) {
@@ -572,6 +574,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 
 		if (ret != -EAGAIN) {
 			clk_disable(i2c->clk);
+			pm_runtime_put(&adap->dev);
 			return ret;
 		}
 
@@ -581,6 +584,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	clk_disable(i2c->clk);
+	pm_runtime_put(&adap->dev);
 	return -EREMOTEIO;
 }
 
@@ -1013,6 +1017,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	of_i2c_register_devices(&i2c->adap);
 	platform_set_drvdata(pdev, i2c);
 
+	pm_runtime_enable(&pdev->dev);
+
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
 	clk_disable(i2c->clk);
 	return 0;
@@ -1047,6 +1053,8 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 {
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
+
 	s3c24xx_i2c_deregister_cpufreq(i2c);
 
 	i2c_del_adapter(&i2c->adap);
-- 
1.7.7.3

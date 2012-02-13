From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/3] i2c-s3c2410: Add stub runtime power management
Date: Mon, 13 Feb 2012 15:05:03 -0800
Message-ID: <1329174304-12228-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1329174304-12228-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56929 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757957Ab2BMXFK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 18:05:10 -0500
In-Reply-To: <1329174304-12228-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, khali@linux-fr.org, w.sang@pengutronix.de
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Add stub runtime_pm calls which go through the flow of enabling and
disabling but don't actually do anything with the device itself as
there's nothing useful we can do. This provides the core PM framework
with information about when the device is idle, enabling chip wide
power savings.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/i2c/busses/i2c-s3c2410.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index e6f982b..1cb06c58 100644
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
 
+	pm_runtime_get_sync(i2c->dev);
 	clk_enable(i2c->clk);
 
 	for (retry = 0; retry < adap->retries; retry++) {
@@ -572,6 +574,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 
 		if (ret != -EAGAIN) {
 			clk_disable(i2c->clk);
+			pm_runtime_put(i2c->dev);
 			return ret;
 		}
 
@@ -581,6 +584,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	clk_disable(i2c->clk);
+	pm_runtime_put(i2c->dev);
 	return -EREMOTEIO;
 }
 
@@ -930,6 +934,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "clock source %p\n", i2c->clk);
 
 	clk_enable(i2c->clk);
+	pm_runtime_enable(&pdev->dev);
 
 	/* map the registers */
 
@@ -967,7 +972,9 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
 	/* initialise the i2c controller */
 
+	pm_runtime_get(&pdev->dev);
 	ret = s3c24xx_i2c_init(i2c);
+	pm_runtime_put(&pdev->dev);
 	if (ret != 0)
 		goto err_iomap;
 
@@ -1047,6 +1054,8 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 {
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
+
 	s3c24xx_i2c_deregister_cpufreq(i2c);
 
 	i2c_del_adapter(&i2c->adap);
-- 
1.7.9.rc1

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Mon,  5 Dec 2011 14:06:06 +0000
Message-ID: <1323093966-9045-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1323093966-9045-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323093966-9045-1-git-send-email-broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add stub runtime_pm calls which go through the flow of enabling and
disabling but don't actually do anything with the device itself as
there's nothing useful we can do. This provides the core PM framework
with information about when the device is idle, enabling chip wide
power savings.

Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index ed62a7f..065c316 100644
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
@@ -563,6 +564,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	int retry;
 	int ret;
 
+	pm_runtime_get_sync(&adap->dev);
 	clk_enable(i2c->clk);
 
 	for (retry = 0; retry < adap->retries; retry++) {
@@ -571,6 +573,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 
 		if (ret != -EAGAIN) {
 			clk_disable(i2c->clk);
+			pm_runtime_put_sync(&adap->dev);
 			return ret;
 		}
 
@@ -580,6 +583,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	clk_disable(i2c->clk);
+	pm_runtime_put_sync(&adap->dev);
 	return -EREMOTEIO;
 }
 
@@ -1012,6 +1016,9 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	of_i2c_register_devices(&i2c->adap);
 	platform_set_drvdata(pdev, i2c);
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(&i2c->adap.dev);
+
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
 	clk_disable(i2c->clk);
 	return 0;
@@ -1046,6 +1053,9 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 {
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&i2c->adap.dev);
+	pm_runtime_disable(&pdev->dev);
+
 	s3c24xx_i2c_deregister_cpufreq(i2c);
 
 	i2c_del_adapter(&i2c->adap);
-- 
1.7.7.3

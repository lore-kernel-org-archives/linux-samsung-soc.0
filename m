From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] i2c: s3c2410: use clk_prepare_enable and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:26:39 +0900
Message-ID: <1349220399-2318-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55123 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752782Ab2JBX3q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 19:29:46 -0400
Received: by pbbrr4 with SMTP id rr4so9244688pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Oct 2012 16:29:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: ben-linux@fluff.org, w.sang@pengutronix.de, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 4d07dea..3e0335f 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -601,14 +601,14 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	int ret;
 
 	pm_runtime_get_sync(&adap->dev);
-	clk_enable(i2c->clk);
+	clk_prepare_enable(i2c->clk);
 
 	for (retry = 0; retry < adap->retries; retry++) {
 
 		ret = s3c24xx_i2c_doxfer(i2c, msgs, num);
 
 		if (ret != -EAGAIN) {
-			clk_disable(i2c->clk);
+			clk_disable_unprepare(i2c->clk);
 			pm_runtime_put(&adap->dev);
 			return ret;
 		}
@@ -618,7 +618,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 		udelay(100);
 	}
 
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	pm_runtime_put(&adap->dev);
 	return -EREMOTEIO;
 }
@@ -977,7 +977,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "clock source %p\n", i2c->clk);
 
-	clk_enable(i2c->clk);
+	clk_prepare_enable(i2c->clk);
 
 	/* map the registers */
 
@@ -1065,7 +1065,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	pm_runtime_enable(&i2c->adap.dev);
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	return 0;
 
  err_cpufreq:
@@ -1082,7 +1082,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	kfree(i2c->ioarea);
 
  err_clk:
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	clk_put(i2c->clk);
 
  err_noclk:
@@ -1106,7 +1106,7 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 	free_irq(i2c->irq, i2c);
 
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	clk_put(i2c->clk);
 
 	iounmap(i2c->regs);
@@ -1135,9 +1135,9 @@ static int s3c24xx_i2c_resume(struct device *dev)
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c->suspended = 0;
-	clk_enable(i2c->clk);
+	clk_prepare_enable(i2c->clk);
 	s3c24xx_i2c_init(i2c);
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 
 	return 0;
 }
-- 
1.7.4.1

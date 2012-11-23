From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 5/7] i2c: s3c2410: Convert to use devm_request_irq()
Date: Fri, 23 Nov 2012 11:29:11 +0530
Message-ID: <1353650353-17576-6-git-send-email-tushar.behera@linaro.org>
References: <1353650353-17576-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353650353-17576-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 3446af2..3e4143c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1028,8 +1028,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	ret = request_irq(i2c->irq, s3c24xx_i2c_irq, 0,
-			  dev_name(&pdev->dev), i2c);
+	ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
+			       dev_name(&pdev->dev), i2c);
 
 	if (ret != 0) {
 		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
@@ -1039,7 +1039,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	ret = s3c24xx_i2c_register_cpufreq(i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register cpufreq notifier\n");
-		goto err_irq;
+		goto err_clk;
 	}
 
 	/* Note, previous versions of the driver used i2c_add_adapter()
@@ -1070,9 +1070,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
  err_cpufreq:
 	s3c24xx_i2c_deregister_cpufreq(i2c);
 
- err_irq:
-	free_irq(i2c->irq, i2c);
-
  err_clk:
 	clk_disable_unprepare(i2c->clk);
 	return ret;
@@ -1093,7 +1090,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	s3c24xx_i2c_deregister_cpufreq(i2c);
 
 	i2c_del_adapter(&i2c->adap);
-	free_irq(i2c->irq, i2c);
 
 	clk_disable_unprepare(i2c->clk);
 
-- 
1.7.4.1

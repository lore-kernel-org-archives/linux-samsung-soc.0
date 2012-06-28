From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] i2c-s3c2410: Convert to devm_request_and_ioremap()
Date: Thu, 28 Jun 2012 13:55:38 +0100
Message-ID: <1340888138-32710-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51618 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752307Ab2F1Mzl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jun 2012 08:55:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

A small code saving and less error handling to worry about.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |   35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 7fe8c73..ddd5797 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -78,7 +78,6 @@ struct s3c24xx_i2c {
 	void __iomem		*regs;
 	struct clk		*clk;
 	struct device		*dev;
-	struct resource		*ioarea;
 	struct i2c_adapter	adap;
 
 	struct s3c2410_platform_i2c	*pdata;
@@ -988,25 +987,16 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	i2c->ioarea = request_mem_region(res->start, resource_size(res),
-					 pdev->name);
-
-	if (i2c->ioarea == NULL) {
-		dev_err(&pdev->dev, "cannot request IO\n");
-		ret = -ENXIO;
-		goto err_clk;
-	}
-
-	i2c->regs = ioremap(res->start, resource_size(res));
+	i2c->regs = devm_request_and_ioremap(&pdev->dev, res);
 
 	if (i2c->regs == NULL) {
 		dev_err(&pdev->dev, "cannot map IO\n");
 		ret = -ENXIO;
-		goto err_ioarea;
+		goto err_clk;
 	}
 
-	dev_dbg(&pdev->dev, "registers %p (%p, %p)\n",
-		i2c->regs, i2c->ioarea, res);
+	dev_dbg(&pdev->dev, "registers %p (%p)\n",
+		i2c->regs, res);
 
 	/* setup info block for the i2c core */
 
@@ -1017,7 +1007,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
 	ret = s3c24xx_i2c_init(i2c);
 	if (ret != 0)
-		goto err_iomap;
+		goto err_clk;
 
 	/* find the IRQ for this unit (note, this relies on the init call to
 	 * ensure no current IRQs pending
@@ -1026,7 +1016,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	i2c->irq = ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
 		dev_err(&pdev->dev, "cannot find IRQ\n");
-		goto err_iomap;
+		goto err_clk;
 	}
 
 	ret = request_irq(i2c->irq, s3c24xx_i2c_irq, 0,
@@ -1034,7 +1024,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
 	if (ret != 0) {
 		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
-		goto err_iomap;
+		goto err_clk;
 	}
 
 	ret = s3c24xx_i2c_register_cpufreq(i2c);
@@ -1074,13 +1064,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
  err_irq:
 	free_irq(i2c->irq, i2c);
 
- err_iomap:
-	iounmap(i2c->regs);
-
- err_ioarea:
-	release_resource(i2c->ioarea);
-	kfree(i2c->ioarea);
-
  err_clk:
 	clk_disable(i2c->clk);
 	clk_put(i2c->clk);
@@ -1109,11 +1092,7 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	clk_disable(i2c->clk);
 	clk_put(i2c->clk);
 
-	iounmap(i2c->regs);
-
-	release_resource(i2c->ioarea);
 	s3c24xx_i2c_dt_gpio_free(i2c);
-	kfree(i2c->ioarea);
 
 	return 0;
 }
-- 
1.7.10

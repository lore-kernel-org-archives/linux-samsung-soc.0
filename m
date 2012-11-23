From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/7] i2c: s3c2410: Convert to use devm_request_mem_region()
Date: Fri, 23 Nov 2012 11:29:09 +0530
Message-ID: <1353650353-17576-4-git-send-email-tushar.behera@linaro.org>
References: <1353650353-17576-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353650353-17576-1-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 019c3d7..a274ef7 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -987,8 +987,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	i2c->ioarea = request_mem_region(res->start, resource_size(res),
-					 pdev->name);
+	i2c->ioarea = devm_request_mem_region(&pdev->dev, res->start,
+					      resource_size(res), pdev->name);
 
 	if (i2c->ioarea == NULL) {
 		dev_err(&pdev->dev, "cannot request IO\n");
@@ -1001,7 +1001,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	if (i2c->regs == NULL) {
 		dev_err(&pdev->dev, "cannot map IO\n");
 		ret = -ENXIO;
-		goto err_ioarea;
+		goto err_clk;
 	}
 
 	dev_dbg(&pdev->dev, "registers %p (%p, %p)\n",
@@ -1076,10 +1076,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
  err_iomap:
 	iounmap(i2c->regs);
 
- err_ioarea:
-	release_resource(i2c->ioarea);
-	kfree(i2c->ioarea);
-
  err_clk:
 	clk_disable_unprepare(i2c->clk);
 	return ret;
@@ -1106,9 +1102,7 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 
 	iounmap(i2c->regs);
 
-	release_resource(i2c->ioarea);
 	s3c24xx_i2c_dt_gpio_free(i2c);
-	kfree(i2c->ioarea);
 
 	return 0;
 }
-- 
1.7.4.1

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 1/3] i2c-s3c2410: Convert to devm_kzalloc()
Date: Mon, 13 Feb 2012 15:05:02 -0800
Message-ID: <1329174304-12228-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Saves remembering to call kfree(). There's some kfree()s used by the
resource still, these will be removed in 3.4 using the newly added
devm_request_and_ioremap().

Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Reviewed-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 4c17180..e6f982b 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -890,7 +890,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	i2c = kzalloc(sizeof(struct s3c24xx_i2c), GFP_KERNEL);
+	i2c = devm_kzalloc(&pdev->dev, sizeof(struct s3c24xx_i2c), GFP_KERNEL);
 	if (!i2c) {
 		dev_err(&pdev->dev, "no memory for state\n");
 		return -ENOMEM;
@@ -1035,7 +1035,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	clk_put(i2c->clk);
 
  err_noclk:
-	kfree(i2c);
 	return ret;
 }
 
@@ -1061,7 +1060,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	release_resource(i2c->ioarea);
 	s3c24xx_i2c_dt_gpio_free(i2c);
 	kfree(i2c->ioarea);
-	kfree(i2c);
 
 	return 0;
 }
-- 
1.7.9.rc1

From: Inderpal Singh <inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] i2c: s3c2410: free gpios in suspend function
Date: Thu, 27 Dec 2012 09:39:44 +0530
Message-ID: <1356581384-23063-2-git-send-email-inderpal.singh@linaro.org>
References: <1356581384-23063-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356581384-23063-1-git-send-email-inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

While resuming the gpios are being requested again, hence we need
to free the gpios before going to suspend otherwise it gives
"gpio request failed" errors while resuming.

Signed-off-by: Inderpal Singh <inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f1d1f1e..55c1762 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1172,6 +1172,7 @@ static int s3c24xx_i2c_suspend_noirq(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
+	s3c24xx_i2c_dt_gpio_free(i2c);
 	i2c->suspended = 1;
 
 	return 0;
-- 
1.7.9.5

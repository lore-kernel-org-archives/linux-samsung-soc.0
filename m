From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 4/4] i2c: s3c2410: Remove err_cpufreq label
Date: Fri, 23 Nov 2012 14:11:55 +0530
Message-ID: <1353660115-9710-5-git-send-email-tushar.behera@linaro.org>
References: <1353660115-9710-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353660115-9710-1-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

err_cpufreq label is now used only once. It can be removed and related
code can be moved to the caller location.

Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes since V1:
  * Rebased as per the V2 patch series.

 drivers/i2c/busses/i2c-s3c2410.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 3f2d632..ff4408d 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1044,7 +1044,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
-		goto err_cpufreq;
+		s3c24xx_i2c_deregister_cpufreq(i2c);
+		return ret;
 	}
 
 	of_i2c_register_devices(&i2c->adap);
@@ -1055,10 +1056,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
 	return 0;
-
- err_cpufreq:
-	s3c24xx_i2c_deregister_cpufreq(i2c);
-	return ret;
 }
 
 /* s3c24xx_i2c_remove
-- 
1.7.4.1

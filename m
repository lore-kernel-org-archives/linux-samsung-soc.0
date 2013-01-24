From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V3 4/4] i2c: s3c2410: Remove err_cpufreq label
Date: Thu, 24 Jan 2013 15:41:09 +0530
Message-ID: <1359022269-12593-5-git-send-email-tushar.behera@linaro.org>
References: <1359022269-12593-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359022269-12593-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, kgene.kim@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

err_cpufreq label is now used only once. It can be removed and related
code can be moved to the caller location.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes since V2:
  * Rebased to v3.8-rc4.

Changes since V1:
  * Rebased as per the V2 patch series.


 drivers/i2c/busses/i2c-s3c2410.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 4d1ba8d..3479ca7 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1109,7 +1109,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
-		goto err_cpufreq;
+		s3c24xx_i2c_deregister_cpufreq(i2c);
+		return ret;
 	}
 
 	of_i2c_register_devices(&i2c->adap);
@@ -1120,10 +1121,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
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

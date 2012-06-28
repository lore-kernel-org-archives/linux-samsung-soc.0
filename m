From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] i2c-s3c2410: Use plain pm_runtime_put()
Date: Thu, 28 Jun 2012 14:08:26 +0100
Message-ID: <1340888906-1152-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51390 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755138Ab2F1NIs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jun 2012 09:08:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

There's no point in using _sync() as we don't really care if the suspend
has completed immediately.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index ddd5797..c4a4494 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -608,7 +608,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 
 		if (ret != -EAGAIN) {
 			clk_disable(i2c->clk);
-			pm_runtime_put_sync(&adap->dev);
+			pm_runtime_put(&adap->dev);
 			return ret;
 		}
 
@@ -618,7 +618,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	clk_disable(i2c->clk);
-	pm_runtime_put_sync(&adap->dev);
+	pm_runtime_put(&adap->dev);
 	return -EREMOTEIO;
 }
 
-- 
1.7.10

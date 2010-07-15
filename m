From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [patch 1/1] i2c-s3c2410: Enable i2c clock only when doing some transfert
Date: Thu, 15 Jul 2010 15:06:14 +0200
Message-ID: <20100715130636.136905589@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:39032 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933200Ab0GONS1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jul 2010 09:18:27 -0400
Content-Disposition: inline; filename=i2c_enable_clock_only_on_transfert.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

This patch modify the s3c2410 i2c driver behaviour to enable the 
i2c clock only when needed. I'm not sure if this has a big impact
on power usage but at least it's fixing a bug with the uda1380
codec which needs to be hard reset'ed if the i2c clock is enabled
before it's powered on (at least on h1940).

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>

Index: linux-2.6/drivers/i2c/busses/i2c-s3c2410.c
===================================================================
--- linux-2.6.orig/drivers/i2c/busses/i2c-s3c2410.c	2010-07-03 22:47:14.473885834 +0200
+++ linux-2.6/drivers/i2c/busses/i2c-s3c2410.c	2010-07-03 22:48:43.261886656 +0200
@@ -555,18 +555,23 @@ static int s3c24xx_i2c_xfer(struct i2c_a
 	int retry;
 	int ret;
 
+	clk_enable(i2c->clk);
+
 	for (retry = 0; retry < adap->retries; retry++) {
 
 		ret = s3c24xx_i2c_doxfer(i2c, msgs, num);
 
-		if (ret != -EAGAIN)
+		if (ret != -EAGAIN) {
+			clk_disable(i2c->clk);
 			return ret;
+		}
 
 		dev_dbg(i2c->dev, "Retrying transmission (%d)\n", retry);
 
 		udelay(100);
 	}
 
+	clk_disable(i2c->clk);
 	return -EREMOTEIO;
 }
 
@@ -911,6 +916,7 @@ static int s3c24xx_i2c_probe(struct plat
 	platform_set_drvdata(pdev, i2c);
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
+	clk_disable(i2c->clk);
 	return 0;
 
  err_cpufreq:

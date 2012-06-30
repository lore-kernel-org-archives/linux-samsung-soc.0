From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 1/2] leds: Convert S3C24XX LED driver to devm_kzalloc()
Date: Sat, 30 Jun 2012 14:30:25 +0200
Message-ID: <1341059426-22693-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35395 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754598Ab2F3Mag (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jun 2012 08:30:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bryan.wu@canonical.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Ben Dooks <ben-linux@fluff.org>

Use the device managed resource API for simplifying
the error/driver remove paths.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/leds/leds-s3c24xx.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index e6ee105..b816ccb 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -63,7 +63,6 @@ static int s3c24xx_led_remove(struct platform_device *dev)
 	struct s3c24xx_gpio_led *led = pdev_to_gpio(dev);

 	led_classdev_unregister(&led->cdev);
-	kfree(led);

 	return 0;
 }
@@ -74,7 +73,8 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 	struct s3c24xx_gpio_led *led;
 	int ret;

-	led = kzalloc(sizeof(struct s3c24xx_gpio_led), GFP_KERNEL);
+	led = devm_kzalloc(&dev->dev, sizeof(struct s3c24xx_gpio_led),
+			   GFP_KERNEL);
 	if (led == NULL) {
 		dev_err(&dev->dev, "No memory for device\n");
 		return -ENOMEM;
@@ -103,10 +103,8 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 	/* register our new led device */

 	ret = led_classdev_register(&dev->dev, &led->cdev);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(&dev->dev, "led_classdev_register failed\n");
-		kfree(led);
-	}

 	return ret;
 }
--
1.7.4.1

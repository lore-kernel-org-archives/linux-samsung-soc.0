From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 2/2] leds: Convert S3C24XX LED driver to gpiolib API
Date: Sat, 30 Jun 2012 14:30:26 +0200
Message-ID: <1341059426-22693-2-git-send-email-sylvester.nawrocki@gmail.com>
References: <1341059426-22693-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:63967 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754716Ab2F3Mai (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jun 2012 08:30:38 -0400
In-Reply-To: <1341059426-22693-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bryan.wu@canonical.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Ben Dooks <ben-linux@fluff.org>

The s3c2410_gpio* calls are obsolete and have been scheduled for
removal since several kernel releases. Remove them and use common
gpiolib API instead.
This patch also adds gpio_request/gpio_free call for API corectness.

It is a prerequisite for removal of the S3C24XX SoC specific
arch/arm/plat-samsung/include/gpio-fns.h header.

Tested on Micro2440-SDK.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/leds/leds-s3c24xx.c |   34 ++++++++++++++++++++--------------
 1 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index b816ccb..e120640 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -45,17 +45,19 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
 {
 	struct s3c24xx_gpio_led *led = to_gpio(led_cdev);
 	struct s3c24xx_led_platdata *pd = led->pdata;
+	int state = (value ? 1 : 0) ^ (pd->flags & S3C24XX_LEDF_ACTLOW);
 
 	/* there will be a short delay between setting the output and
 	 * going from output to input when using tristate. */
 
-	s3c2410_gpio_setpin(pd->gpio, (value ? 1 : 0) ^
-			    (pd->flags & S3C24XX_LEDF_ACTLOW));
-
-	if (pd->flags & S3C24XX_LEDF_TRISTATE)
-		s3c2410_gpio_cfgpin(pd->gpio,
-			value ? S3C2410_GPIO_OUTPUT : S3C2410_GPIO_INPUT);
+	gpio_set_value(pd->gpio, state);
 
+	if (pd->flags & S3C24XX_LEDF_TRISTATE) {
+		if (value)
+			gpio_direction_output(pd->gpio, state);
+		else
+			gpio_direction_input(pd->gpio);
+	}
 }
 
 static int s3c24xx_led_remove(struct platform_device *dev)
@@ -63,6 +65,7 @@ static int s3c24xx_led_remove(struct platform_device *dev)
 	struct s3c24xx_gpio_led *led = pdev_to_gpio(dev);
 
 	led_classdev_unregister(&led->cdev);
+	gpio_free(led->pdata->gpio);
 
 	return 0;
 }
@@ -89,16 +92,19 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	led->pdata = pdata;
 
+	ret = gpio_request(pdata->gpio, "S3C24XX_LED");
+	if (ret < 0)
+		return ret;
+
 	/* no point in having a pull-up if we are always driving */
 
-	if (pdata->flags & S3C24XX_LEDF_TRISTATE) {
-		s3c2410_gpio_setpin(pdata->gpio, 0);
-		s3c2410_gpio_cfgpin(pdata->gpio, S3C2410_GPIO_INPUT);
-	} else {
-		s3c2410_gpio_pullup(pdata->gpio, 0);
-		s3c2410_gpio_setpin(pdata->gpio, 0);
-		s3c2410_gpio_cfgpin(pdata->gpio, S3C2410_GPIO_OUTPUT);
-	}
+	s3c_gpio_setpull(pdata->gpio, S3C_GPIO_PULL_NONE);
+
+	if (pdata->flags & S3C24XX_LEDF_TRISTATE)
+		gpio_direction_input(pdata->gpio);
+	else
+		gpio_direction_output(pdata->gpio,
+			pdata->flags & S3C24XX_LEDF_ACTLOW ? 1 : 0);
 
 	/* register our new led device */
 
-- 
1.7.4.1

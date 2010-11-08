From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/2] h1940-leds: Fix compile issue introduced by latch-related changes
Date: Mon,  8 Nov 2010 22:31:48 +0200
Message-ID: <1289248308-21272-2-git-send-email-anarsoul@gmail.com>
References: <1289248308-21272-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:38252 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755346Ab0KHUc6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Nov 2010 15:32:58 -0500
Received: by mail-ey0-f174.google.com with SMTP id 27so3089869eye.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2010 12:32:57 -0800 (PST)
In-Reply-To: <1289248308-21272-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Latch API was converted to gpiolib API as result we got this compile
error:

drivers/leds/leds-h1940.c: In function 'h1940_greenled_set':
drivers/leds/leds-h1940.c:33: error: implicit declaration of function
'h1940_latch_control

Adapt h1940-leds driver to new changes and fix compile issue.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/leds/leds-h1940.c |   67 ++++++++++++++++++++++++++++++++-------------
 1 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-h1940.c b/drivers/leds/leds-h1940.c
index 173d104..d9c2729 100644
--- a/drivers/leds/leds-h1940.c
+++ b/drivers/leds/leds-h1940.c
@@ -30,18 +30,18 @@ static void h1940_greenled_set(struct led_classdev *led_dev,
 {
 	switch (value) {
 	case LED_HALF:
-		h1940_latch_control(0, H1940_LATCH_LED_FLASH);
-		s3c2410_gpio_setpin(S3C2410_GPA7, 1);
+		gpio_set_value(H1940_LATCH_LED_FLASH, 1);
+		gpio_set_value(S3C2410_GPA(7), 1);
 		break;
 	case LED_FULL:
-		h1940_latch_control(0, H1940_LATCH_LED_GREEN);
-		s3c2410_gpio_setpin(S3C2410_GPA7, 1);
+		gpio_set_value(H1940_LATCH_LED_GREEN, 1);
+		gpio_set_value(S3C2410_GPA(7), 1);
 		break;
 	default:
 	case LED_OFF:
-		h1940_latch_control(H1940_LATCH_LED_FLASH, 0);
-		h1940_latch_control(H1940_LATCH_LED_GREEN, 0);
-		s3c2410_gpio_setpin(S3C2410_GPA7, 0);
+		gpio_set_value(H1940_LATCH_LED_FLASH, 0);
+		gpio_set_value(H1940_LATCH_LED_GREEN, 0);
+		gpio_set_value(S3C2410_GPA(7), 0);
 		break;
 	}
 }
@@ -60,18 +60,18 @@ static void h1940_redled_set(struct led_classdev *led_dev,
 {
 	switch (value) {
 	case LED_HALF:
-		h1940_latch_control(0, H1940_LATCH_LED_FLASH);
-		s3c2410_gpio_setpin(S3C2410_GPA1, 1);
+		gpio_set_value(H1940_LATCH_LED_FLASH, 1);
+		gpio_set_value(S3C2410_GPA(1), 1);
 		break;
 	case LED_FULL:
-		h1940_latch_control(0, H1940_LATCH_LED_RED);
-		s3c2410_gpio_setpin(S3C2410_GPA1, 1);
+		gpio_set_value(H1940_LATCH_LED_RED, 1);
+		gpio_set_value(S3C2410_GPA(1), 1);
 		break;
 	default:
 	case LED_OFF:
-		h1940_latch_control(H1940_LATCH_LED_FLASH, 0);
-		h1940_latch_control(H1940_LATCH_LED_RED, 0);
-		s3c2410_gpio_setpin(S3C2410_GPA1, 0);
+		gpio_set_value(H1940_LATCH_LED_FLASH, 0);
+		gpio_set_value(H1940_LATCH_LED_RED, 0);
+		gpio_set_value(S3C2410_GPA(1), 0);
 		break;
 	}
 }
@@ -91,11 +91,11 @@ static void h1940_blueled_set(struct led_classdev *led_dev,
 {
 	if (value) {
 		/* flashing Blue */
-		h1940_latch_control(0, H1940_LATCH_LED_FLASH);
-		s3c2410_gpio_setpin(S3C2410_GPA3, 1);
+		gpio_set_value(H1940_LATCH_LED_FLASH, 1);
+		gpio_set_value(S3C2410_GPA(3), 1);
 	} else {
-		h1940_latch_control(H1940_LATCH_LED_FLASH, 0);
-		s3c2410_gpio_setpin(S3C2410_GPA3, 0);
+		gpio_set_value(H1940_LATCH_LED_FLASH, 0);
+		gpio_set_value(S3C2410_GPA(3), 0);
 	}
 
 }
@@ -108,7 +108,24 @@ static struct led_classdev h1940_blueled = {
 
 static int __devinit h1940leds_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, gpioidx = 0;
+	int led_gpios[] = {
+		H1940_LATCH_LED_GREEN,
+		H1940_LATCH_LED_RED,
+		H1940_LATCH_LED_FLASH,
+		S3C2410_GPA(1),
+		S3C2410_GPA(3),
+		S3C2410_GPA(7),
+	};
+
+	for (gpioidx = 0; gpioidx < ARRAY_SIZE(led_gpios); gpioidx++) {
+		ret = gpio_request(led_gpios[gpioidx], "h1940 leds");
+		if (ret < 0)
+			goto err_gpio;
+		ret = gpio_direction_output(led_gpios[gpioidx], 0);
+		if (ret < 0)
+			goto err_gpio;
+	}
 
 	ret = led_classdev_register(&pdev->dev, &h1940_greenled);
 	if (ret)
@@ -129,6 +146,10 @@ err_blue:
 err_red:
 	led_classdev_unregister(&h1940_greenled);
 err_green:
+err_gpio:
+	while (--gpioidx >= 0)
+		gpio_free(led_gpios[gpioidx]);
+
 	return ret;
 }
 
@@ -137,6 +158,14 @@ static int h1940leds_remove(struct platform_device *pdev)
 	led_classdev_unregister(&h1940_greenled);
 	led_classdev_unregister(&h1940_redled);
 	led_classdev_unregister(&h1940_blueled);
+
+	gpio_free(H1940_LATCH_LED_GREEN);
+	gpio_free(H1940_LATCH_LED_RED);
+	gpio_free(H1940_LATCH_LED_FLASH);
+	gpio_free(S3C2410_GPA(1));
+	gpio_free(S3C2410_GPA(3));
+	gpio_free(S3C2410_GPA(7));
+
 	return 0;
 }
 
-- 
1.7.3.2

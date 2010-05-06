From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 06/23] ARM: H1940: Change mach-h1940 to use gpiolib API
Date: Fri,  7 May 2010 08:15:28 +0900
Message-ID: <1273187745-6566-7-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60615 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752798Ab0EFXQD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:03 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change  mach-h1940 to use the gpiolib calls instead of s3c2410_gpio
directly.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-h1940.c    |   15 ++++++++-------
 arch/arm/mach-s3c2412/mach-smdk2413.c |    8 ++++----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index fbedd07..5527f74 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -207,7 +207,7 @@ static int h1940_backlight_init(struct device *dev)
 {
 	gpio_request(S3C2410_GPB(0), "Backlight");
 
-	s3c2410_gpio_setpin(S3C2410_GPB(0), 0);
+	gpio_direction_output(S3C2410_GPB(0), 0);
 	s3c2410_gpio_pullup(S3C2410_GPB(0), 0);
 	s3c2410_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPB0_TOUT0);
 
@@ -216,7 +216,7 @@ static int h1940_backlight_init(struct device *dev)
 
 static void h1940_backlight_exit(struct device *dev)
 {
-	s3c2410_gpio_cfgpin(S3C2410_GPB(0), 1/*S3C2410_GPB0_OUTP*/);
+	gpio_direction_output(S3C2410_GPB(0), 1);
 }
 
 static struct platform_pwm_backlight_data backlight_data = {
@@ -245,18 +245,18 @@ static void h1940_lcd_power_set(struct plat_lcd_data *pd,
 
 	if (!power) {
 		/* set to 3ec */
-		s3c2410_gpio_setpin(S3C2410_GPC(0), 0);
+		gpio_direction_output(S3C2410_GPC(0), 0);
 		/* wait for 3ac */
 		do {
-			value = s3c2410_gpio_getpin(S3C2410_GPC(6));
+			value = gpio_get_value(S3C2410_GPC(6));
 		} while (value);
 		/* set to 38c */
-		s3c2410_gpio_setpin(S3C2410_GPC(5), 0);
+		gpio_direction_output(S3C2410_GPC(5), 0);
 	} else {
 		/* Set to 3ac */
-		s3c2410_gpio_setpin(S3C2410_GPC(5), 1);
+		gpio_direction_output(S3C2410_GPC(5), 1);
 		/* Set to 3ad */
-		s3c2410_gpio_setpin(S3C2410_GPC(0), 1);
+		gpio_direction_output(S3C2410_GPC(0), 1);
 	}
 }
 
@@ -332,6 +332,7 @@ static void __init h1940_init(void)
 	gpio_request(S3C2410_GPC(5), "LCD power");
 	gpio_request(S3C2410_GPC(6), "LCD power");
 
+	gpio_direction_input(S3C2410_GPC(6));
 
 	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
 }
diff --git a/arch/arm/mach-s3c2412/mach-smdk2413.c b/arch/arm/mach-s3c2412/mach-smdk2413.c
index 0392065..faddb36 100644
--- a/arch/arm/mach-s3c2412/mach-smdk2413.c
+++ b/arch/arm/mach-s3c2412/mach-smdk2413.c
@@ -85,10 +85,10 @@ static void smdk2413_udc_pullup(enum s3c2410_udc_cmd_e cmd)
 	switch (cmd)
 	{
 		case S3C2410_UDC_P_ENABLE :
-			s3c2410_gpio_setpin(S3C2410_GPF(2), 1);
+			gpio_set_value(S3C2410_GPF(2), 1);
 			break;
 		case S3C2410_UDC_P_DISABLE :
-			s3c2410_gpio_setpin(S3C2410_GPF(2), 0);
+			gpio_set_value(S3C2410_GPF(2), 0);
 			break;
 		case S3C2410_UDC_P_RESET :
 			break;
@@ -134,8 +134,8 @@ static void __init smdk2413_machine_init(void)
 {	/* Turn off suspend on both USB ports, and switch the
 	 * selectable USB port to USB device mode. */
 
-	s3c2410_gpio_setpin(S3C2410_GPF(2), 0);
-	s3c2410_gpio_cfgpin(S3C2410_GPF(2), S3C2410_GPIO_OUTPUT);
+	WARN_ON(gpio_request(S3C2410_GPF(2), "udc pull"));
+	gpio_direction_output(S3C2410_GPF(2), 0);
 
 	s3c2410_modify_misccr(S3C2410_MISCCR_USBHOST |
 			      S3C2410_MISCCR_USBSUSPND0 |
-- 
1.7.0.4

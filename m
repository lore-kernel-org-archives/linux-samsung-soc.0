From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 05/23] ARM: JIVE: Update mach-jive to use gpiolib API
Date: Fri,  7 May 2010 08:15:27 +0900
Message-ID: <1273187745-6566-6-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60612 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752785Ab0EFXQD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:03 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change mach-jive to use gpiolib for the GPIO lines that are directly
manipulated by it.

Note, we ignore any errors from gpio_request(), unlikely to see any.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2412/mach-jive.c |   19 +++++++++----------
 1 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-s3c2412/mach-jive.c b/arch/arm/mach-s3c2412/mach-jive.c
index 14f4798..d2bb7d2 100644
--- a/arch/arm/mach-s3c2412/mach-jive.c
+++ b/arch/arm/mach-s3c2412/mach-jive.c
@@ -357,8 +357,7 @@ static void jive_lcm_reset(unsigned int set)
 {
 	printk(KERN_DEBUG "%s(%d)\n", __func__, set);
 
-	s3c2410_gpio_setpin(S3C2410_GPG(13), set);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(13), S3C2410_GPIO_OUTPUT);
+	gpio_set_value(S3C2410_GPG(13), set);
 }
 
 #undef LCD_UPPER_MARGIN
@@ -391,7 +390,7 @@ static struct ili9320_platdata jive_lcm_config = {
 
 static void jive_lcd_spi_chipselect(struct s3c2410_spigpio_info *spi, int cs)
 {
-	s3c2410_gpio_setpin(S3C2410_GPB(7), cs ? 0 : 1);
+	gpio_set_value(S3C2410_GPB(7), cs ? 0 : 1);
 }
 
 static struct s3c2410_spigpio_info jive_lcd_spi = {
@@ -413,7 +412,7 @@ static struct platform_device jive_device_lcdspi = {
 
 static void jive_wm8750_chipselect(struct s3c2410_spigpio_info *spi, int cs)
 {
-	s3c2410_gpio_setpin(S3C2410_GPH(10), cs ? 0 : 1);
+	gpio_set_value(S3C2410_GPH(10), cs ? 0 : 1);
 }
 
 static struct s3c2410_spigpio_info jive_wm8750_spi = {
@@ -636,11 +635,11 @@ static void __init jive_machine_init(void)
 
 	/* initialise the spi */
 
-	s3c2410_gpio_setpin(S3C2410_GPG(13), 0);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(13), S3C2410_GPIO_OUTPUT);
+	gpio_request(S3C2410_GPG(13), "lcm reset");
+	gpio_direction_output(S3C2410_GPG(13), 0);
 
-	s3c2410_gpio_setpin(S3C2410_GPB(7), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPB(7), S3C2410_GPIO_OUTPUT);
+	gpio_request(S3C2410_GPB(7), "jive spi");
+	gpio_direction_output(S3C2410_GPB(7), 1);
 
 	s3c2410_gpio_setpin(S3C2410_GPB(6), 0);
 	s3c2410_gpio_cfgpin(S3C2410_GPB(6), S3C2410_GPIO_OUTPUT);
@@ -650,8 +649,8 @@ static void __init jive_machine_init(void)
 
 	/* initialise the WM8750 spi */
 
-	s3c2410_gpio_setpin(S3C2410_GPH(10), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPH(10), S3C2410_GPIO_OUTPUT);
+	gpio_request(S3C2410_GPH(10), "jive wm8750 spi");
+	gpio_direction_output(S3C2410_GPH(10), 1);
 
 	/* Turn off suspend on both USB ports, and switch the
 	 * selectable USB port to USB device mode. */
-- 
1.7.0.4

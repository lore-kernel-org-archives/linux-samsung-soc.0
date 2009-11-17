From: arnaud.patard@rtp-net.org
Subject: [patch 3/4] h1940: add lcd/backlight device definition
Date: Tue, 17 Nov 2009 14:54:58 +0100
Message-ID: <20091117140418.483931579@rtp-net.org>
References: <20091117135455.913565760@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sat78-1-82-232-42-61.fbx.proxad.net ([82.232.42.61]:57544 "EHLO
	jules.rtp-net.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752277AbZKQOM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 09:12:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=h1940_lcd_backlight.patch

Add lcd and backlight device definition. The pwm backlight stuff does not allow to really
set maximum pwm as with my custom driver but it's better to use standard driver instead of
out of tree driver.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-s3c2410/mach-h1940.c |   77 	77 +	0 -	0 !
 1 file changed, 77 insertions(+)

Index: linux/arch/arm/mach-s3c2410/mach-h1940.c
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/mach-h1940.c	2009-11-17 14:06:06.000000000 +0100
+++ linux/arch/arm/mach-s3c2410/mach-h1940.c	2009-11-17 14:08:09.000000000 +0100
@@ -22,6 +22,8 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/pwm_backlight.h>
+#include <video/platform_lcd.h>
 
 #include <linux/mmc/host.h>
 
@@ -195,6 +197,73 @@ static struct s3c24xx_mci_pdata h1940_mm
 	.ocr_avail     = MMC_VDD_32_33,
 };
 
+static int h1940_backlight_init(struct device *dev)
+{
+	gpio_request(S3C2410_GPB(0), "Backlight");
+
+	s3c2410_gpio_setpin(S3C2410_GPB(0), 0);
+	s3c2410_gpio_pullup(S3C2410_GPB(0), 0);
+	s3c2410_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPB0_TOUT0);
+
+	return 0;
+}
+
+static void h1940_backlight_exit(struct device *dev)
+{
+	s3c2410_gpio_cfgpin(S3C2410_GPB(0), 1/*S3C2410_GPB0_OUTP*/);
+}
+
+static struct platform_pwm_backlight_data backlight_data = {
+	.pwm_id         = 0,
+	.max_brightness = 100,
+	.dft_brightness = 50,
+	/* tcnt = 0x31 */
+	.pwm_period_ns  = 36296,
+	.init           = h1940_backlight_init,
+	.exit           = h1940_backlight_exit,
+};
+
+static struct platform_device h1940_backlight = {
+	.name = "pwm-backlight",
+	.dev  = {
+		.parent = &s3c_device_timer[0].dev,
+		.platform_data = &backlight_data,
+	},
+	.id   = -1,
+};
+
+static void h1940_lcd_power_set(struct plat_lcd_data *pd,
+					unsigned int power)
+{
+	int value;
+
+	if (!power) {
+		/* set to 3ec */
+		s3c2410_gpio_setpin(S3C2410_GPC(0), 0);
+		/* wait for 3ac */
+		do {
+			value = s3c2410_gpio_getpin(S3C2410_GPC(6));
+		} while (value);
+		/* set to 38c */
+		s3c2410_gpio_setpin(S3C2410_GPC(5), 0);
+	} else {
+		/* Set to 3ac */
+		s3c2410_gpio_setpin(S3C2410_GPC(5), 1);
+		/* Set to 3ad */
+		s3c2410_gpio_setpin(S3C2410_GPC(0), 1);
+	}
+}
+
+static struct plat_lcd_data h1940_lcd_power_data = {
+	.set_power      = h1940_lcd_power_set,
+};
+
+static struct platform_device h1940_lcd_powerdev = {
+	.name                   = "platform-lcd",
+	.dev.parent             = &s3c_device_lcd.dev,
+	.dev.platform_data      = &h1940_lcd_power_data,
+};
+
 static struct platform_device *h1940_devices[] __initdata = {
 	&s3c_device_usb,
 	&s3c_device_lcd,
@@ -206,6 +275,9 @@ static struct platform_device *h1940_dev
 	&h1940_device_bluetooth,
 	&s3c_device_sdi,
 	&s3c_device_rtc,
+	&s3c_device_timer[0],
+	&h1940_backlight,
+	&h1940_lcd_powerdev,
 };
 
 static void __init h1940_map_io(void)
@@ -249,6 +321,11 @@ static void __init h1940_init(void)
 	      | (0x03 << S3C24XX_PLLCON_SDIVSHIFT);
 	writel(tmp, S3C2410_UPLLCON);
 
+	gpio_request(S3C2410_GPC(0), "LCD power");
+	gpio_request(S3C2410_GPC(5), "LCD power");
+	gpio_request(S3C2410_GPC(6), "LCD power");
+
+
 	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
 }
 

-- 

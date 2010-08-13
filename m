From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 1/5] ARM: S3C64XX: Move SmartQ LCD control platform definition to shared file
Date: Fri, 13 Aug 2010 21:17:52 +0200
Message-ID: <4c659a61.887b0e0a.53f9.ffffccf9@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:44015 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754460Ab0HMTR4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 15:17:56 -0400
Received: by ewy23 with SMTP id 23so1512097ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2010 12:17:54 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, akpm@linux-foundation.org

This shares the common LCD control platform definition used in the Smar=
tQ 5 and
7. This also corrects it as a GPIO bitbanged SPI device instead of an I=
=C2=B2C one,
which was wrong.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/mach-smartq.c  |   32 ++++++++++++++++++++++++++=
++++--
 arch/arm/mach-s3c64xx/mach-smartq5.c |   28 --------------------------=
--
 arch/arm/mach-s3c64xx/mach-smartq7.c |   28 --------------------------=
--
 3 files changed, 30 insertions(+), 58 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64x=
x/mach-smartq.c
index 028d080..54309da 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pwm_backlight.h>
 #include <linux/serial_core.h>
+#include <linux/spi/spi_gpio.h>
 #include <linux/usb/gpio_vbus.h>
=20
 #include <asm/mach-types.h>
@@ -184,6 +185,33 @@ static struct s3c_hwmon_pdata smartq_hwmon_pdata _=
_initdata =3D {
 	},
 };
=20
+static int __init smartq_lcd_setup_gpio(void)
+{
+	int ret;
+
+	ret =3D gpio_request(S3C64XX_GPM(3), "LCD power");
+	if (ret < 0)
+		return ret;
+
+	/* turn power off */
+	gpio_direction_output(S3C64XX_GPM(3), 0);
+
+	return 0;
+}
+
+/* GPM0 -> CS */
+static struct spi_gpio_platform_data smartq_lcd_control =3D {
+	.sck			=3D S3C64XX_GPM(1),
+	.mosi			=3D S3C64XX_GPM(2),
+	.miso			=3D S3C64XX_GPM(2),
+};
+
+static struct platform_device smartq_lcd_control_device =3D {
+	.name			=3D "spi-gpio",
+	.id			=3D 1,
+	.dev.platform_data	=3D &smartq_lcd_control,
+};
+
 static void smartq_lcd_power_set(struct plat_lcd_data *pd, unsigned in=
t power)
 {
 	gpio_direction_output(S3C64XX_GPM(3), power);
@@ -199,7 +227,6 @@ static struct platform_device smartq_lcd_power_devi=
ce =3D {
 	.dev.platform_data	=3D &smartq_lcd_power_data,
 };
=20
-
 static struct platform_device *smartq_devices[] __initdata =3D {
 	&s3c_device_hsmmc1,	/* Init iNAND first, ... */
 	&s3c_device_hsmmc0,	/* ... then the external SD card */
@@ -214,6 +241,7 @@ static struct platform_device *smartq_devices[] __i=
nitdata =3D {
 	&s3c_device_ts,
 	&s3c_device_usb_hsotg,
 	&smartq_backlight_device,
+	&smartq_lcd_control_device,
 	&smartq_lcd_power_device,
 	&smartq_usb_otg_vbus_dev,
 };
@@ -252,7 +280,6 @@ static int __init smartq_power_off_init(void)
 	/* leave power on */
 	gpio_direction_output(S3C64XX_GPK(15), 0);
=20
-
 	pm_power_off =3D smartq_power_off;
=20
 	return ret;
@@ -354,6 +381,7 @@ void __init smartq_machine_init(void)
 	s3c_sdhci2_set_platdata(&smartq_internal_hsmmc_pdata);
 	s3c24xx_ts_set_platdata(&smartq_touchscreen_pdata);
=20
+	WARN_ON(smartq_lcd_setup_gpio());
 	WARN_ON(smartq_power_off_init());
 	WARN_ON(smartq_usb_host_init());
 	WARN_ON(smartq_usb_otg_init());
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64=
xx/mach-smartq5.c
index a065062..2bfa708 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -12,7 +12,6 @@
 #include <linux/fb.h>
 #include <linux/gpio.h>
 #include <linux/gpio_keys.h>
-#include <linux/i2c-gpio.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/leds.h>
@@ -33,31 +32,6 @@
=20
 #include "mach-smartq.h"
=20
-static void __init smartq5_lcd_setup_gpio(void)
-{
-	gpio_request(S3C64XX_GPM(0), "LCD SCEN pin");
-	gpio_request(S3C64XX_GPM(1), "LCD SCL pin");
-	gpio_request(S3C64XX_GPM(2), "LCD SDA pin");
-	gpio_request(S3C64XX_GPM(3), "LCD power");
-
-	/* turn power off */
-	gpio_direction_output(S3C64XX_GPM(0), 1);
-	gpio_direction_input(S3C64XX_GPM(1));
-	gpio_direction_input(S3C64XX_GPM(2));
-	gpio_direction_output(S3C64XX_GPM(3), 0);
-}
-
-static struct i2c_gpio_platform_data smartq5_lcd_control =3D {
-	.sda_pin		=3D S3C64XX_GPM(2),
-	.scl_pin		=3D S3C64XX_GPM(1),
-};
-
-static struct platform_device smartq5_lcd_control_device =3D {
-	.name			=3D "i2c-gpio",
-	.id			=3D 1,
-	.dev.platform_data	=3D &smartq5_lcd_control,
-};
-
 static struct gpio_led smartq5_leds[] __initdata =3D {
 	{
 		.name			=3D "smartq5:green",
@@ -159,7 +133,6 @@ static struct s3c_fb_platdata smartq5_lcd_pdata __i=
nitdata =3D {
 static struct platform_device *smartq5_devices[] __initdata =3D {
 	&smartq5_leds_device,
 	&smartq5_buttons_device,
-	&smartq5_lcd_control_device,
 };
=20
 static void __init smartq5_machine_init(void)
@@ -167,7 +140,6 @@ static void __init smartq5_machine_init(void)
 	s3c_fb_set_platdata(&smartq5_lcd_pdata);
=20
 	smartq_machine_init();
-	smartq5_lcd_setup_gpio();
=20
 	platform_add_devices(smartq5_devices, ARRAY_SIZE(smartq5_devices));
 }
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64=
xx/mach-smartq7.c
index 0ecf451..e50a7d7 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -12,7 +12,6 @@
 #include <linux/fb.h>
 #include <linux/gpio.h>
 #include <linux/gpio_keys.h>
-#include <linux/i2c-gpio.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/leds.h>
@@ -33,31 +32,6 @@
=20
 #include "mach-smartq.h"
=20
-static void __init smartq7_lcd_setup_gpio(void)
-{
-	gpio_request(S3C64XX_GPM(0), "LCD CSB pin");
-	gpio_request(S3C64XX_GPM(3), "LCD power");
-	gpio_request(S3C64XX_GPM(4), "LCD power status");
-
-	/* turn power off */
-	gpio_direction_output(S3C64XX_GPM(0), 1);
-	gpio_direction_output(S3C64XX_GPM(3), 0);
-	gpio_direction_input(S3C64XX_GPM(4));
-}
-
-static struct i2c_gpio_platform_data smartq7_lcd_control =3D {
-	.sda_pin		=3D S3C64XX_GPM(2),
-	.scl_pin		=3D S3C64XX_GPM(1),
-	.sda_is_open_drain	=3D 1,
-	.scl_is_open_drain	=3D 1,
-};
-
-static struct platform_device smartq7_lcd_control_device =3D {
-	.name			=3D "i2c-gpio",
-	.id			=3D 1,
-	.dev.platform_data	=3D &smartq7_lcd_control,
-};
-
 static struct gpio_led smartq7_leds[] __initdata =3D {
 	{
 		.name			=3D "smartq7:red",
@@ -175,7 +149,6 @@ static struct s3c_fb_platdata smartq7_lcd_pdata __i=
nitdata =3D {
 static struct platform_device *smartq7_devices[] __initdata =3D {
 	&smartq7_leds_device,
 	&smartq7_buttons_device,
-	&smartq7_lcd_control_device,
 };
=20
 static void __init smartq7_machine_init(void)
@@ -183,7 +156,6 @@ static void __init smartq7_machine_init(void)
 	s3c_fb_set_platdata(&smartq7_lcd_pdata);
=20
 	smartq_machine_init();
-	smartq7_lcd_setup_gpio();
=20
 	platform_add_devices(smartq7_devices, ARRAY_SIZE(smartq7_devices));
 }
--=20
1.7.0.4

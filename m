From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 4/5] ARM: S3C64XX: Add audio support to SmartQ
Date: Fri, 13 Aug 2010 21:17:59 +0200
Message-ID: <4c659a6d.cf7d0e0a.0e01.ffffcf25@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:42912 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755515Ab0HMTSI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 15:18:08 -0400
Received: by mail-ey0-f174.google.com with SMTP id 5so443699eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2010 12:18:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, akpm@linux-foundation.org

This adds the I=C2=B2C board information for the WM8987 used in the Sma=
rtQ as audio
codec and adds the I=C2=B2C/I=C2=B2S platform drivers.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/mach-smartq.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64x=
x/mach-smartq.c
index 20ddce6..3a9639b 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -227,6 +227,10 @@ static struct platform_device smartq_lcd_power_dev=
ice =3D {
 	.dev.platform_data	=3D &smartq_lcd_power_data,
 };
=20
+static struct i2c_board_info smartq_i2c_devs[] __initdata =3D {
+	{ I2C_BOARD_INFO("wm8987", 0x1a), },
+};
+
 static struct platform_device *smartq_devices[] __initdata =3D {
 	&s3c_device_hsmmc1,	/* Init iNAND first, ... */
 	&s3c_device_hsmmc0,	/* ... then the external SD card */
@@ -240,6 +244,7 @@ static struct platform_device *smartq_devices[] __i=
nitdata =3D {
 	&s3c_device_timer[1],
 	&s3c_device_ts,
 	&s3c_device_usb_hsotg,
+	&s3c64xx_device_iis0,
 	&smartq_backlight_device,
 	&smartq_lcd_control_device,
 	&smartq_lcd_power_device,
@@ -381,6 +386,9 @@ void __init smartq_machine_init(void)
 	s3c_sdhci2_set_platdata(&smartq_internal_hsmmc_pdata);
 	s3c24xx_ts_set_platdata(&smartq_touchscreen_pdata);
=20
+	i2c_register_board_info(0, smartq_i2c_devs,
+				ARRAY_SIZE(smartq_i2c_devs));
+
 	WARN_ON(smartq_lcd_setup_gpio());
 	WARN_ON(smartq_power_off_init());
 	WARN_ON(smartq_usb_host_init());
--=20
1.7.0.4

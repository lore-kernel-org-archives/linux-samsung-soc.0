From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 3/3] ARM: S3C64XX: Add audio support to SmartQ
Date: Sat, 03 Jul 2010 02:46:15 +0200
Message-ID: <4c2e8859.487e0e0a.4485.3e1f@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:61874 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752760Ab0GCAqT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 20:46:19 -0400
Received: by ewy23 with SMTP id 23so1176273ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jul 2010 17:46:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben@simtec.co.uk>

This adds the I=C2=B2C board information for the WM8987 used in the Sma=
rtQ as audio
codec and adds the I=C2=B2C/I=C2=B2S platform drivers.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/mach-smartq.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64x=
x/mach-smartq.c
index 028d080..5d8673b 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -199,6 +199,9 @@ static struct platform_device smartq_lcd_power_devi=
ce =3D {
 	.dev.platform_data	=3D &smartq_lcd_power_data,
 };
=20
+static struct i2c_board_info smartq_i2c_devs[] __initdata =3D {
+	{ I2C_BOARD_INFO("wm8987", 0x1a), },
+};
=20
 static struct platform_device *smartq_devices[] __initdata =3D {
 	&s3c_device_hsmmc1,	/* Init iNAND first, ... */
@@ -213,6 +216,7 @@ static struct platform_device *smartq_devices[] __i=
nitdata =3D {
 	&s3c_device_timer[1],
 	&s3c_device_ts,
 	&s3c_device_usb_hsotg,
+	&s3c64xx_device_iis0,
 	&smartq_backlight_device,
 	&smartq_lcd_power_device,
 	&smartq_usb_otg_vbus_dev,
@@ -354,6 +358,9 @@ void __init smartq_machine_init(void)
 	s3c_sdhci2_set_platdata(&smartq_internal_hsmmc_pdata);
 	s3c24xx_ts_set_platdata(&smartq_touchscreen_pdata);
=20
+	i2c_register_board_info(0, smartq_i2c_devs,
+				ARRAY_SIZE(smartq_i2c_devs));
+
 	WARN_ON(smartq_power_off_init());
 	WARN_ON(smartq_usb_host_init());
 	WARN_ON(smartq_usb_otg_init());
--=20
1.7.0.4

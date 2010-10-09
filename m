From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [patch 1/1] Add definitions for the h1940 buttons.
Date: Sat, 09 Oct 2010 23:37:35 +0200
Message-ID: <20101009213740.708473440@rtp-net.org>
References: <20101009213734.286778338@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:46276 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756096Ab0JIVqj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Oct 2010 17:46:39 -0400
Content-Disposition: inline; filename=buttons.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Add support for the h1940 buttons/keys connected to GPIOs.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-s3c2410/mach-h1940.c |   39 	39 +	0 -	0 !
 1 file changed, 39 insertions(+)

Index: linux/arch/arm/mach-s3c2410/mach-h1940.c
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/mach-h1940.c	2010-10-09 22:26:52.652798539 +0200
+++ linux/arch/arm/mach-s3c2410/mach-h1940.c	2010-10-09 22:27:36.944815754 +0200
@@ -23,6 +23,8 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/input.h>
+#include <linux/gpio_keys.h>
 #include <linux/pwm_backlight.h>
 #include <video/platform_lcd.h>
 
@@ -365,7 +367,44 @@ static struct platform_device h1940_lcd_
 	.dev.platform_data      = &h1940_lcd_power_data,
 };
 
+#define DECLARE_BUTTON(p, k, n, w)	\
+	{				\
+		.gpio		= p,	\
+		.code		= k,	\
+		.desc		= n,	\
+		.wakeup		= w,	\
+		.active_low	= 1,	\
+	}
+
+static struct gpio_keys_button h1940_buttons[] = {
+	DECLARE_BUTTON(S3C2410_GPF(0),       KEY_POWER,          "Power", 1),
+	DECLARE_BUTTON(S3C2410_GPF(6),       KEY_ENTER,         "Select", 1),
+	DECLARE_BUTTON(S3C2410_GPF(7),      KEY_RECORD,         "Record", 0),
+	DECLARE_BUTTON(S3C2410_GPG(0),         KEY_F11,       "Calendar", 0),
+	DECLARE_BUTTON(S3C2410_GPG(2),         KEY_F12,       "Contacts", 0),
+	DECLARE_BUTTON(S3C2410_GPG(3),        KEY_MAIL,           "Mail", 0),
+	DECLARE_BUTTON(S3C2410_GPG(6),        KEY_LEFT,     "Left_arrow", 0),
+	DECLARE_BUTTON(S3C2410_GPG(7),    KEY_HOMEPAGE,           "Home", 0),
+	DECLARE_BUTTON(S3C2410_GPG(8),       KEY_RIGHT,    "Right_arrow", 0),
+	DECLARE_BUTTON(S3C2410_GPG(9),          KEY_UP,       "Up_arrow", 0),
+	DECLARE_BUTTON(S3C2410_GPG(10),       KEY_DOWN,     "Down_arrow", 0),
+};
+
+static struct gpio_keys_platform_data h1940_buttons_data = {
+	.buttons	= h1940_buttons,
+	.nbuttons	= ARRAY_SIZE(h1940_buttons),
+};
+
+static struct platform_device h1940_dev_buttons = {
+	.name		= "gpio-keys",
+	.id		= -1,
+	.dev		= {
+		.platform_data  = &h1940_buttons_data,
+	}
+};
+
 static struct platform_device *h1940_devices[] __initdata = {
+	&h1940_dev_buttons,
 	&s3c_device_ohci,
 	&s3c_device_lcd,
 	&s3c_device_wdt,

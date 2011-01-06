From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/7] ARM: S3C2410: H1940: Add keys device
Date: Thu,  6 Jan 2011 21:52:46 +0200
Message-ID: <1294343572-28518-2-git-send-email-anarsoul@gmail.com>
References: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35968 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753279Ab1AFTyb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 14:54:31 -0500
Received: by mail-ey0-f174.google.com with SMTP id 27so7378165eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2011 11:54:31 -0800 (PST)
In-Reply-To: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>

Add buttons definition for H1940.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2410/mach-h1940.c |   39 ++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index 1a81fe1..641586a 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -23,6 +23,8 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/input.h>
+#include <linux/gpio_keys.h>
 #include <linux/pwm_backlight.h>
 #include <linux/i2c.h>
 #include <video/platform_lcd.h>
@@ -381,7 +383,44 @@ static struct i2c_board_info h1940_i2c_devices[] = {
 	},
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
-- 
1.7.3.2

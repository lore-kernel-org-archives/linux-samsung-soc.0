From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 5/7] ARM: S3C2410: H1940: Fix lcd_power_set function
Date: Thu,  6 Jan 2011 21:52:50 +0200
Message-ID: <1294343572-28518-6-git-send-email-anarsoul@gmail.com>
References: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35968 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495Ab1AFTyl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 14:54:41 -0500
Received: by mail-ey0-f174.google.com with SMTP id 27so7378165eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2011 11:54:40 -0800 (PST)
In-Reply-To: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

Current implementation of lcd_power_set is not reliable, sometimes
it does not enable LCD at all.
Mimic WinCE behavior to fix this issue.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2410/mach-h1940.c |   26 +++++++++++++++-----------
 1 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index 6a3cf78..5531c4c 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -30,6 +30,7 @@
 #include <linux/leds.h>
 #include <linux/pda_power.h>
 #include <linux/s3c_adc_battery.h>
+#include <linux/delay.h>
 
 #include <video/platform_lcd.h>
 
@@ -228,15 +229,15 @@ static struct s3c2410fb_mach_info h1940_fb_info __initdata = {
 	.num_displays = 1,
 	.default_display = 0,
 
-	.lpcsel=	0x02,
-	.gpccon=	0xaa940659,
-	.gpccon_mask=	0xffffffff,
-	.gpcup=		0x0000ffff,
-	.gpcup_mask=	0xffffffff,
-	.gpdcon=	0xaa84aaa0,
-	.gpdcon_mask=	0xffffffff,
-	.gpdup=		0x0000faff,
-	.gpdup_mask=	0xffffffff,
+	.lpcsel =	0x02,
+	.gpccon =	0xaa940659,
+	.gpccon_mask =	0xffffc0f0,
+	.gpcup =	0x0000ffff,
+	.gpcup_mask =	0xffffffff,
+	.gpdcon =	0xaa84aaa0,
+	.gpdcon_mask =	0xffffffff,
+	.gpdup =	0x0000faff,
+	.gpdup_mask =	0xffffffff,
 };
 
 static int power_supply_init(struct device *dev)
@@ -545,14 +546,14 @@ static struct platform_device h1940_backlight = {
 static void h1940_lcd_power_set(struct plat_lcd_data *pd,
 					unsigned int power)
 {
-	int value;
+	int value, retries = 100;
 
 	if (!power) {
 		gpio_set_value(S3C2410_GPC(0), 0);
 		/* wait for 3ac */
 		do {
 			value = gpio_get_value(S3C2410_GPC(6));
-		} while (value);
+		} while (value && retries--);
 
 		gpio_set_value(H1940_LATCH_LCD_P2, 0);
 		gpio_set_value(H1940_LATCH_LCD_P3, 0);
@@ -570,6 +571,9 @@ static void h1940_lcd_power_set(struct plat_lcd_data *pd,
 		gpio_set_value(H1940_LATCH_LCD_P0, 1);
 		gpio_set_value(H1940_LATCH_LCD_P1, 1);
 
+		gpio_direction_input(S3C2410_GPC(1));
+		gpio_direction_input(S3C2410_GPC(4));
+		mdelay(10);
 		s3c_gpio_cfgpin(S3C2410_GPC(1), S3C_GPIO_SFN(2));
 		s3c_gpio_cfgpin(S3C2410_GPC(4), S3C_GPIO_SFN(2));
 
-- 
1.7.3.2

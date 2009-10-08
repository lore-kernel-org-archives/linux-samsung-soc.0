From: thomas.ab@samsung.com
Subject: [PATCH 6/7] S3C6410: Add platform data for S3C IDE controller driver
Date: Thu,  8 Oct 2009 15:52:57 +0900
Message-ID: <1254984777-15321-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55042 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753398AbZJHG4U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2009 02:56:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds platform data for S3C IDE controller driver in
S3C6410 platform.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s3c6410/mach-smdk6410.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c6410/mach-smdk6410.c b/arch/arm/mach-s3c6410/mach-smdk6410.c
index ea51dbe..81b435e 100644
--- a/arch/arm/mach-s3c6410/mach-smdk6410.c
+++ b/arch/arm/mach-s3c6410/mach-smdk6410.c
@@ -50,6 +50,7 @@
 #include <plat/regs-sys.h>
 #include <plat/iic.h>
 #include <plat/fb.h>
+#include <plat/ide.h>
 #include <plat/gpio-cfg.h>
 
 #include <plat/s3c6410.h>
@@ -153,6 +154,10 @@ static struct s3c_fb_platdata smdk6410_lcd_pdata __initdata = {
 	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
 };
 
+static struct s3c_ide_platdata smdk6410_ide_pdata __initdata = {
+	.setup_gpio	= s3c64xx_ide_setup_gpio,
+};
+
 static struct resource smdk6410_smsc911x_resources[] = {
 	[0] = {
 		.start = 0x18000000,
@@ -199,7 +204,7 @@ static struct platform_device *smdk6410_devices[] __initdata = {
 	&s3c_device_usb,
 	&s3c_device_usb_hsotg,
 	&smdk6410_lcd_powerdev,
-
+	&s3c_device_cfcon,
 	&smdk6410_smsc911x,
 };
 
@@ -377,6 +382,7 @@ static void __init smdk6410_machine_init(void)
 	s3c_i2c0_set_platdata(NULL);
 	s3c_i2c1_set_platdata(NULL);
 	s3c_fb_set_platdata(&smdk6410_lcd_pdata);
+	s3c_ide_set_platdata(&smdk6410_ide_pdata);
 
 	gpio_request(S3C64XX_GPN(5), "LCD power");
 	gpio_request(S3C64XX_GPF(13), "LCD power");
-- 
1.5.3.4


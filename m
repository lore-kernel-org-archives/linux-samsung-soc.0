From: arnaud.patard@rtp-net.org
Subject: [patch 1/4] h1940: add mmc device
Date: Tue, 17 Nov 2009 14:54:56 +0100
Message-ID: <20091117140418.208409916@rtp-net.org>
References: <20091117135455.913565760@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sat78-1-82-232-42-61.fbx.proxad.net ([82.232.42.61]:57543 "EHLO
	jules.rtp-net.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752210AbZKQOM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 09:12:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=h1940_add_mmc.patch

This patch add mmc host support to h1940

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-s3c2410/mach-h1940.c |   19 	18 +	1 -	0 !
 1 file changed, 18 insertions(+), 1 deletion(-)

Index: linux/arch/arm/mach-s3c2410/mach-h1940.c
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/mach-h1940.c	2009-11-17 13:59:06.000000000 +0100
+++ linux/arch/arm/mach-s3c2410/mach-h1940.c	2009-11-17 14:04:21.000000000 +0100
@@ -21,6 +21,9 @@
 #include <linux/serial_core.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/gpio.h>
+
+#include <linux/mmc/host.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -32,9 +35,12 @@
 
 #include <plat/regs-serial.h>
 #include <mach/regs-lcd.h>
-#include <mach/regs-gpio.h>
 #include <mach/regs-clock.h>
 
+#include <mach/regs-gpio.h>
+#include <mach/gpio-fns.h>
+#include <mach/gpio-nrs.h>
+
 #include <mach/h1940.h>
 #include <mach/h1940-latch.h>
 #include <mach/fb.h>
@@ -46,6 +52,7 @@
 #include <plat/cpu.h>
 #include <plat/pll.h>
 #include <plat/pm.h>
+#include <plat/mci.h>
 
 static struct map_desc h1940_iodesc[] __initdata = {
 	[0] = {
@@ -181,6 +188,13 @@ static struct platform_device h1940_devi
 	.id               = -1,
 };
 
+static struct s3c24xx_mci_pdata h1940_mmc_cfg = {
+	.gpio_detect   = S3C2410_GPF(5),
+	.gpio_wprotect = S3C2410_GPH(8),
+	.set_power     = NULL,
+	.ocr_avail     = MMC_VDD_32_33,
+};
+
 static struct platform_device *h1940_devices[] __initdata = {
 	&s3c_device_usb,
 	&s3c_device_lcd,
@@ -190,6 +204,7 @@ static struct platform_device *h1940_dev
 	&s3c_device_usbgadget,
 	&h1940_device_leds,
 	&h1940_device_bluetooth,
+	&s3c_device_sdi,
 };
 
 static void __init h1940_map_io(void)
@@ -219,6 +234,8 @@ static void __init h1940_init(void)
  	s3c24xx_udc_set_platdata(&h1940_udc_cfg);
 	s3c_i2c0_set_platdata(NULL);
 
+	s3c_device_sdi.dev.platform_data = &h1940_mmc_cfg;
+
 	/* Turn off suspend on both USB ports, and switch the
 	 * selectable USB port to USB device mode. */
 

-- 

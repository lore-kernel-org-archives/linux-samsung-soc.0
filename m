From: Arnaud Patard <arnaud.patard@rtp-net.org>
Subject: [patch 1/3] h1940: fix touchscreen support
Date: Thu, 22 Apr 2010 10:47:43 +0200
Message-ID: <20100422085503.540779440@lechat.rtp-net.org>
References: <20100422084742.111469156@lechat.rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:39387 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753521Ab0DVI7u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Apr 2010 04:59:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=adc.patch



The touchscreen is using the adc device so it needs to be in the device
list

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>

---
 arch/arm/mach-s3c2410/mach-h1940.c |    3 	2 +	1 -	0 !
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux-2.6/arch/arm/mach-s3c2410/mach-h1940.c
===================================================================
--- linux-2.6.orig/arch/arm/mach-s3c2410/mach-h1940.c	2010-04-21 20:52:55.592109853 +0200
+++ linux-2.6/arch/arm/mach-s3c2410/mach-h1940.c	2010-04-21 22:34:22.856109566 +0200
@@ -271,7 +271,6 @@ static struct platform_device h1940_lcd_
 };
 
 static struct platform_device *h1940_devices[] __initdata = {
-	&s3c_device_ts,
 	&s3c_device_ohci,
 	&s3c_device_lcd,
 	&s3c_device_wdt,
@@ -285,6 +284,8 @@ static struct platform_device *h1940_dev
 	&s3c_device_timer[0],
 	&h1940_backlight,
 	&h1940_lcd_powerdev,
+	&s3c_device_adc,
+	&s3c_device_ts,
 };
 
 static void __init h1940_map_io(void)

-- 

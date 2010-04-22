From: Arnaud Patard <arnaud.patard@rtp-net.org>
Subject: [patch 2/3] s3c2410fb: fix platdata passing
Date: Thu, 22 Apr 2010 10:47:44 +0200
Message-ID: <20100422085504.262797959@lechat.rtp-net.org>
References: <20100422084742.111469156@lechat.rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:39388 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753525Ab0DVI7u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Apr 2010 04:59:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=fb_ioctl_screeninfo.patch


Setting s3c2410fb_mach_info displays field with a struct marked as __initdata
means it won't be available later for ioctls like FBIOPUT_VSCREENINFO and they
will fail. Copying in s3c24xx_fb_set_platdata() is fixing this issue.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/plat-s3c24xx/devs.c |    9 	7 +	2 -	0 !
 1 file changed, 7 insertions(+), 2 deletions(-)

Index: linux-2.6/arch/arm/plat-s3c24xx/devs.c
===================================================================
--- linux-2.6.orig/arch/arm/plat-s3c24xx/devs.c	2010-04-21 22:19:11.944610438 +0200
+++ linux-2.6/arch/arm/plat-s3c24xx/devs.c	2010-04-21 22:59:25.792150599 +0200
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -149,10 +150,14 @@ void __init s3c24xx_fb_set_platdata(stru
 {
 	struct s3c2410fb_mach_info *npd;
 
-	npd = kmalloc(sizeof(*npd), GFP_KERNEL);
+	npd = kmemdup(pd, sizeof(*npd), GFP_KERNEL);
 	if (npd) {
-		memcpy(npd, pd, sizeof(*npd));
 		s3c_device_lcd.dev.platform_data = npd;
+		npd->displays = kmemdup(pd->displays,
+			sizeof(struct s3c2410fb_display) * npd->num_displays,
+			GFP_KERNEL);
+		if (!npd->displays)
+			printk(KERN_ERR "no memory for LCD display data\n");
 	} else {
 		printk(KERN_ERR "no memory for LCD platform data\n");
 	}

-- 

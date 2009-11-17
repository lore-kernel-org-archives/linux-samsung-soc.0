From: arnaud.patard@rtp-net.org
Subject: [patch 2/4] h1940: enable rtc
Date: Tue, 17 Nov 2009 14:54:57 +0100
Message-ID: <20091117140418.345089182@rtp-net.org>
References: <20091117135455.913565760@rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sat78-1-82-232-42-61.fbx.proxad.net ([82.232.42.61]:57540 "EHLO
	jules.rtp-net.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752242AbZKQOM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 09:12:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=rtc.patch

Enable 2410 rtc on h1940

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/mach-s3c2410/mach-h1940.c |    1 	1 +	0 -	0 !
 1 file changed, 1 insertion(+)

Index: linux/arch/arm/mach-s3c2410/mach-h1940.c
===================================================================
--- linux.orig/arch/arm/mach-s3c2410/mach-h1940.c	2009-11-17 14:04:21.000000000 +0100
+++ linux/arch/arm/mach-s3c2410/mach-h1940.c	2009-11-17 14:06:06.000000000 +0100
@@ -205,6 +205,7 @@ static struct platform_device *h1940_dev
 	&h1940_device_leds,
 	&h1940_device_bluetooth,
 	&s3c_device_sdi,
+	&s3c_device_rtc,
 };
 
 static void __init h1940_map_io(void)

-- 

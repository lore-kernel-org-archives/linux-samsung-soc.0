From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 3/6] ARM: s3c24xx: h1940: Add DMA device
Date: Mon, 30 Jun 2014 22:20:06 +0300
Message-ID: <1404156009-3919-3-git-send-email-anarsoul@gmail.com>
References: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:51045 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754543AbaF3TWi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:22:38 -0400
Received: by mail-we0-f172.google.com with SMTP id u57so8515150wes.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:22:37 -0700 (PDT)
In-Reply-To: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Add a corresponding device for a new dmaengine driver.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c24xx/mach-h1940.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index fbf5487..cf36f26 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -623,6 +623,7 @@ static struct platform_device h1940_dev_buttons = {
 
 static struct platform_device *h1940_devices[] __initdata = {
 	&h1940_dev_buttons,
+	&s3c2410_device_dma,
 	&s3c_device_ohci,
 	&s3c_device_lcd,
 	&s3c_device_wdt,
-- 
2.0.0

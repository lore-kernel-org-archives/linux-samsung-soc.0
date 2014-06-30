From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 6/6] ARM: s3c24xx: RX1950: Add DMA device
Date: Mon, 30 Jun 2014 22:20:09 +0300
Message-ID: <1404156009-3919-6-git-send-email-anarsoul@gmail.com>
References: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:41713 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756953AbaF3TWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:22:45 -0400
Received: by mail-wi0-f177.google.com with SMTP id r20so6587776wiv.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:22:43 -0700 (PDT)
In-Reply-To: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Add a corresponding device for a new dmaengine driver.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c24xx/mach-rx1950.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index e2c6541..95b88a6 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -710,6 +710,7 @@ static struct i2c_board_info rx1950_i2c_devices[] = {
 
 static struct platform_device *rx1950_devices[] __initdata = {
 	&s3c2410_device_dclk,
+	&s3c2410_device_dma,
 	&s3c_device_lcd,
 	&s3c_device_wdt,
 	&s3c_device_i2c0,
-- 
2.0.0

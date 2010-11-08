From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/2] ARM: S3C2410: H1940: Adapt h1940-bluetooth to gpiolib changes
Date: Mon,  8 Nov 2010 22:31:47 +0200
Message-ID: <1289248308-21272-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:38252 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755330Ab0KHUcz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Nov 2010 15:32:55 -0500
Received: by eye27 with SMTP id 27so3089869eye.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2010 12:32:54 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Replace in s3c_gpio_cfgpull with s3c_gpio_setpull.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2410/h1940-bluetooth.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c b/arch/arm/mach-s3c2410/h1940-bluetooth.c
index 8aa2f19..6b86a72 100644
--- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
@@ -77,13 +77,13 @@ static int __devinit h1940bt_probe(struct platform_device *pdev)
 
 	/* Configures BT serial port GPIOs */
 	s3c_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
-	s3c_gpio_cfgpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
 	s3c_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
-	s3c_gpio_cfgpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
 	s3c_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
-	s3c_gpio_cfgpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
 	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
-	s3c_gpio_cfgpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
 
 
 	rfk = rfkill_alloc(DRV_NAME, &pdev->dev, RFKILL_TYPE_BLUETOOTH,
-- 
1.7.3.2

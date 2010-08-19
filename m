From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/3] h1940: fix h1940-bluetooth compilation
Date: Thu, 19 Aug 2010 18:00:02 +0300
Message-ID: <1282230003-2020-3-git-send-email-anarsoul@gmail.com>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:64310 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191Ab0HSPBz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Aug 2010 11:01:55 -0400
Received: by mail-ey0-f174.google.com with SMTP id 5so1326788eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Aug 2010 08:01:54 -0700 (PDT)
In-Reply-To: <1282230003-2020-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

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
1.7.2

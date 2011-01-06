From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/7] ARM: S3C2410: H1940: Make h1940-bluetooth.c compile again
Date: Thu,  6 Jan 2011 21:52:47 +0200
Message-ID: <1294343572-28518-3-git-send-email-anarsoul@gmail.com>
References: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35968 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753455Ab1AFTyd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 14:54:33 -0500
Received: by mail-ey0-f174.google.com with SMTP id 27so7378165eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2011 11:54:33 -0800 (PST)
In-Reply-To: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

It was broken by removal of rfkill_set_led_trigger_name function,
and now compiler complains about implicit declaration.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2410/h1940-bluetooth.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c b/arch/arm/mach-s3c2410/h1940-bluetooth.c
index 6b86a72..6c59ef5 100644
--- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
@@ -85,7 +85,6 @@ static int __devinit h1940bt_probe(struct platform_device *pdev)
 	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
 	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
 
-
 	rfk = rfkill_alloc(DRV_NAME, &pdev->dev, RFKILL_TYPE_BLUETOOTH,
 			&h1940bt_rfkill_ops, NULL);
 	if (!rfk) {
@@ -93,8 +92,6 @@ static int __devinit h1940bt_probe(struct platform_device *pdev)
 		goto err_rfk_alloc;
 	}
 
-	rfkill_set_led_trigger_name(rfk, "h1940-bluetooth");
-
 	ret = rfkill_register(rfk);
 	if (ret)
 		goto err_rfkill;
-- 
1.7.3.2

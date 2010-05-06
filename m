From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 11/23] ARM: S3C2410: Change s3c2410_gpio_pullupl(x, 1) to use s3c_gpio_cfgpull()
Date: Fri,  7 May 2010 08:15:33 +0900
Message-ID: <1273187745-6566-12-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60630 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753736Ab0EFXQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:05 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Start moving code that is using the old s3c2410_gpio API to using the
newer s3c_gpio variants by finding all the usages of s3c2410_gpio_pullup()
which disable the pin's pull up and replacing them.

sed 's/s3c2410_gpio_pullup\(.*\), 1/s3c_gpio_cfgpull\1, S3C_GPIO_PULL_NONE/g'

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/h1940-bluetooth.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c b/arch/arm/mach-s3c2410/h1940-bluetooth.c
index 6d06b7e..171a7c3 100644
--- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
@@ -70,13 +70,13 @@ static int __devinit h1940bt_probe(struct platform_device *pdev)
 
 	/* Configures BT serial port GPIOs */
 	s3c2410_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
-	s3c2410_gpio_pullup(S3C2410_GPH(0), 1);
+	s3c_gpio_cfgpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
 	s3c2410_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
-	s3c2410_gpio_pullup(S3C2410_GPH(1), 1);
+	s3c_gpio_cfgpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
 	s3c2410_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
-	s3c2410_gpio_pullup(S3C2410_GPH(2), 1);
+	s3c_gpio_cfgpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
 	s3c2410_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
-	s3c2410_gpio_pullup(S3C2410_GPH(3), 1);
+	s3c_gpio_cfgpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
 
 
 	rfk = rfkill_alloc(DRV_NAME, &pdev->dev, RFKILL_TYPE_BLUETOOTH,
-- 
1.7.0.4

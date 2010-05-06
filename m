From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 04/23] ARM: H1940: Change h1940-bluetooth to use gpiolib API
Date: Fri,  7 May 2010 08:15:26 +0900
Message-ID: <1273187745-6566-5-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60610 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752746Ab0EFXQD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:03 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change the h1940-bluetooth driver to use gpiolib to set the output state
of GPH1.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/h1940-bluetooth.c |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c b/arch/arm/mach-s3c2410/h1940-bluetooth.c
index a3f3c7b..6d06b7e 100644
--- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
@@ -33,14 +33,15 @@ static void h1940bt_enable(int on)
 		h1940_latch_control(0, H1940_LATCH_BLUETOOTH_POWER);
 		/* Reset the chip */
 		mdelay(10);
-		s3c2410_gpio_setpin(S3C2410_GPH(1), 1);
+
+		gpio_set_value(S3C2410_GPH(1), 1);
 		mdelay(10);
-		s3c2410_gpio_setpin(S3C2410_GPH(1), 0);
+		gpio_set_value(S3C2410_GPH(1), 0);
 	}
 	else {
-		s3c2410_gpio_setpin(S3C2410_GPH(1), 1);
+		gpio_set_value(S3C2410_GPH(1), 1);
 		mdelay(10);
-		s3c2410_gpio_setpin(S3C2410_GPH(1), 0);
+		gpio_set_value(S3C2410_GPH(1), 0);
 		mdelay(10);
 		h1940_latch_control(H1940_LATCH_BLUETOOTH_POWER, 0);
 	}
@@ -61,6 +62,12 @@ static int __devinit h1940bt_probe(struct platform_device *pdev)
 	struct rfkill *rfk;
 	int ret = 0;
 
+	ret = gpio_request(S3C2410_GPH(1), dev_name(&pdev->dev));
+	if (ret) {
+		dev_err(&pdev->dev, "could not get GPH1\n");\
+		return ret;
+	}
+
 	/* Configures BT serial port GPIOs */
 	s3c2410_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
 	s3c2410_gpio_pullup(S3C2410_GPH(0), 1);
@@ -100,6 +107,7 @@ static int h1940bt_remove(struct platform_device *pdev)
 	struct rfkill *rfk = platform_get_drvdata(pdev);
 
 	platform_set_drvdata(pdev, NULL);
+	gpio_free(S3C2410_GPH(1));
 
 	if (rfk) {
 		rfkill_unregister(rfk);
-- 
1.7.0.4

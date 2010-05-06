From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 07/23] ARM: QT2410: Update mach-qt2410 to use gpiolib API
Date: Fri,  7 May 2010 08:15:29 +0900
Message-ID: <1273187745-6566-8-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60617 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752890Ab0EFXQD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:03 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change mach-qt2410.c to use gpiolib for the GPIO lines that are directly
manipulated by it.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-qt2410.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-qt2410.c b/arch/arm/mach-s3c2410/mach-qt2410.c
index 92a4ec3..e9762fb 100644
--- a/arch/arm/mach-s3c2410/mach-qt2410.c
+++ b/arch/arm/mach-s3c2410/mach-qt2410.c
@@ -219,10 +219,10 @@ static void spi_gpio_cs(struct s3c2410_spigpio_info *spi, int cs)
 {
 	switch (cs) {
 	case BITBANG_CS_ACTIVE:
-		s3c2410_gpio_setpin(S3C2410_GPB(5), 0);
+		gpio_set_value(S3C2410_GPB(5), 0);
 		break;
 	case BITBANG_CS_INACTIVE:
-		s3c2410_gpio_setpin(S3C2410_GPB(5), 1);
+		gpio_set_value(S3C2410_GPB(5), 1);
 		break;
 	}
 }
@@ -353,7 +353,8 @@ static void __init qt2410_machine_init(void)
 	s3c24xx_udc_set_platdata(&qt2410_udc_cfg);
 	s3c_i2c0_set_platdata(NULL);
 
-	s3c2410_gpio_cfgpin(S3C2410_GPB(5), S3C2410_GPIO_OUTPUT);
+	WARN_ON(gpio_request(S3C2410_GPB(5), "spi cs"));
+	gpio_direction_output(S3C2410_GPB(5), 1);
 
 	platform_add_devices(qt2410_devices, ARRAY_SIZE(qt2410_devices));
 	s3c_pm_init();
-- 
1.7.0.4

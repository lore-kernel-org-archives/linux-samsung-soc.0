From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 05/10] ARM: S3C24XX: Convert the touchscreen setup code to common GPIO API
Date: Sat, 30 Jun 2012 14:08:57 +0200
Message-ID: <1341058142-30438-6-git-send-email-sylvester.nawrocki@gmail.com>
References: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:57054 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754249Ab2F3MJ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jun 2012 08:09:29 -0400
Received: by mail-ey0-f174.google.com with SMTP id k11so1647555eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Jun 2012 05:09:29 -0700 (PDT)
In-Reply-To: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Replace the S3C24XX SoC specific calls with the common gpiolib
API. This removes one more user of an obsolete GPIO API.

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
Tested on Micro2440-SDK.
---
 arch/arm/mach-s3c24xx/setup-ts.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/setup-ts.c b/arch/arm/mach-s3c24xx/setup-ts.c
index ed26386..4e11aff 100644
--- a/arch/arm/mach-s3c24xx/setup-ts.c
+++ b/arch/arm/mach-s3c24xx/setup-ts.c
@@ -16,7 +16,6 @@
 struct platform_device; /* don't need the contents */
 
 #include <mach/hardware.h>
-#include <mach/regs-gpio.h>
 
 /**
  * s3c24xx_ts_cfg_gpio - configure gpio for s3c2410 systems
@@ -27,8 +26,5 @@ struct platform_device; /* don't need the contents */
  */
 void s3c24xx_ts_cfg_gpio(struct platform_device *dev)
 {
-	s3c2410_gpio_cfgpin(S3C2410_GPG(12), S3C2410_GPG12_XMON);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(13), S3C2410_GPG13_nXPON);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(14), S3C2410_GPG14_YMON);
-	s3c2410_gpio_cfgpin(S3C2410_GPG(15), S3C2410_GPG15_nYPON);
+	s3c_gpio_cfgpin_range(S3C2410_GPG(12), 4, S3C_GPIO_SFN(3));
 }
-- 
1.7.4.1

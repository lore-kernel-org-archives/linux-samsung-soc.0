From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 20/23] ARM: S3C2410: Remove the users of s3c2410_gpio_pullup()
Date: Fri,  7 May 2010 08:15:42 +0900
Message-ID: <1273187745-6566-21-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60659 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752890Ab0EFXQJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:09 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Remove the last s3c2410_gpio_pullup() users in arch/arm/mach-s3c2410

Note, since mach-h1940.c is setting output and a pull-up, the call
has vbeen chanerd to S3C_GPIO_PULL_NONE instead of S3C_GPIO_PULL_UP.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-amlm5900.c |    2 +-
 arch/arm/mach-s3c2410/mach-h1940.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-amlm5900.c b/arch/arm/mach-s3c2410/mach-amlm5900.c
index b42a760..34fc05a 100644
--- a/arch/arm/mach-s3c2410/mach-amlm5900.c
+++ b/arch/arm/mach-s3c2410/mach-amlm5900.c
@@ -227,7 +227,7 @@ static void amlm5900_init_pm(void)
 		enable_irq_wake(IRQ_EINT9);
 		/* configure the suspend/resume status pin */
 		s3c_gpio_cfgpin(S3C2410_GPF(2), S3C2410_GPIO_OUTPUT);
-		s3c2410_gpio_pullup(S3C2410_GPF(2), 0);
+		s3c_gpio_setpull(S3C2410_GPF(2), S3C_GPIO_PULL_UP);
 	}
 }
 static void __init amlm5900_init(void)
diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index e2f7e64..9531b4c 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -209,7 +209,7 @@ static int h1940_backlight_init(struct device *dev)
 	gpio_request(S3C2410_GPB(0), "Backlight");
 
 	gpio_direction_output(S3C2410_GPB(0), 0);
-	s3c2410_gpio_pullup(S3C2410_GPB(0), 0);
+	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
 	s3c_gpio_cfgpin(S3C2410_GPB(0), S3C2410_GPB0_TOUT0);
 
 	return 0;
-- 
1.7.0.4

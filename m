From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 09/23] ARM: BAST: Update mach-bast to use gpiolib API
Date: Fri,  7 May 2010 08:15:31 +0900
Message-ID: <1273187745-6566-10-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60624 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753286Ab0EFXQE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:04 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change mach-bast .c to use gpiolib for the GPIO lines that are directly
manipulated by it.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/mach-bast.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-bast.c b/arch/arm/mach-s3c2410/mach-bast.c
index 02b1b62..d03cbe2 100644
--- a/arch/arm/mach-s3c2410/mach-bast.c
+++ b/arch/arm/mach-s3c2410/mach-bast.c
@@ -216,9 +216,7 @@ static struct s3c2410_uartcfg bast_uartcfgs[] __initdata = {
 static int bast_pm_suspend(struct sys_device *sd, pm_message_t state)
 {
 	/* ensure that an nRESET is not generated on resume. */
-	s3c2410_gpio_setpin(S3C2410_GPA(21), 1);
-	s3c2410_gpio_cfgpin(S3C2410_GPA(21), S3C2410_GPIO_OUTPUT);
-
+	gpio_direction_output(S3C2410_GPA(21), 1);
 	return 0;
 }
 
@@ -658,6 +656,8 @@ static void __init bast_init(void)
 	nor_simtec_init();
 	simtec_audio_add(NULL, true, &bast_audio);
 
+	WARN_ON(gpio_request(S3C2410_GPA(21), "bast nreset"));
+	
 	s3c_cpufreq_setboard(&bast_cpufreq);
 }
 
-- 
1.7.0.4

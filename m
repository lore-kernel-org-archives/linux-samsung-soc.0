From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 04/10] ARM: S3C24XX: Convert the PM code to gpiolib API
Date: Sat, 30 Jun 2012 14:08:56 +0200
Message-ID: <1341058142-30438-5-git-send-email-sylvester.nawrocki@gmail.com>
References: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:41567 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754249Ab2F3MJ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jun 2012 08:09:28 -0400
Received: by mail-ee0-f46.google.com with SMTP id t10so1629924eei.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Jun 2012 05:09:27 -0700 (PDT)
In-Reply-To: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Replace deprecated functions with the gpiolib ones.

Cc: ben-linux@fluff.org
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 arch/arm/mach-s3c24xx/pm-s3c2410.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/pm-s3c2410.c b/arch/arm/mach-s3c24xx/pm-s3c2410.c
index 03f706d..949ae05 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2410.c
@@ -77,8 +77,10 @@ static void s3c2410_pm_prepare(void)
 		__raw_writel(calc, phys_to_virt(H1940_SUSPEND_CHECKSUM));
 	}
 
-	if ( machine_is_aml_m5900() )
-		s3c2410_gpio_setpin(S3C2410_GPF(2), 1);
+	if (machine_is_aml_m5900()) {
+		gpio_request_one(S3C2410_GPF(2), GPIOF_OUT_INIT_HIGH, NULL);
+		gpio_free(S3C2410_GPF(2));
+	}
 
 	if (machine_is_rx1950()) {
 		/* According to S3C2442 user's manual, page 7-17,
@@ -103,8 +105,10 @@ static void s3c2410_pm_resume(void)
 	tmp &= S3C2410_GSTATUS2_OFFRESET;
 	__raw_writel(tmp, S3C2410_GSTATUS2);
 
-	if ( machine_is_aml_m5900() )
-		s3c2410_gpio_setpin(S3C2410_GPF(2), 0);
+	if (machine_is_aml_m5900()) {
+		gpio_request_one(S3C2410_GPF(2), GPIOF_OUT_INIT_LOW, NULL);
+		gpio_free(S3C2410_GPF(2));
+	}
 }
 
 struct syscore_ops s3c2410_pm_syscore_ops = {
-- 
1.7.4.1

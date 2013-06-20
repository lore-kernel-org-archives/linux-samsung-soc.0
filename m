From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 15/18] ARM: SAMSUNG: Remove old PWM timer platform devices
Date: Fri, 21 Jun 2013 00:13:00 +0200
Message-ID: <1371766383-29077-16-git-send-email-tomasz.figa@gmail.com>
References: <1371766383-29077-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:58801 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030247Ab3FTWOb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 18:14:31 -0400
In-Reply-To: <1371766383-29077-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>

This patch removes old Samsung PWM timer platform devices that are not
used any more.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/plat-samsung/devs.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 290f63a..8ce0ac0 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1098,24 +1098,6 @@ arch_initcall(s5p_pmu_init);
 /* PWM Timer */
 
 #ifdef CONFIG_SAMSUNG_DEV_PWM
-
-#define DEFINE_S3C_TIMER(_tmr_no)			\
-	.name		= "s3c24xx-pwm",		\
-	.id		= _tmr_no,			\
-
-/*
- * since we already have an static mapping for the timer,
- * we do not bother setting any IO resource for the base.
- */
-
-struct platform_device s3c_device_timer[] = {
-	[0] = { DEFINE_S3C_TIMER(0) },
-	[1] = { DEFINE_S3C_TIMER(1) },
-	[2] = { DEFINE_S3C_TIMER(2) },
-	[3] = { DEFINE_S3C_TIMER(3) },
-	[4] = { DEFINE_S3C_TIMER(4) },
-};
-
 static struct resource samsung_pwm_resource[] = {
 	DEFINE_RES_MEM(SAMSUNG_PA_TIMER, SZ_4K),
 };
-- 
1.8.2.1

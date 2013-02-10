From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 08/12] ARM: SAMSUNG: devs: Drop unnecessary IRQ resources of timer devices
Date: Sun, 10 Feb 2013 14:20:19 +0100
Message-ID: <1360502423-2246-9-git-send-email-tomasz.figa@gmail.com>
References: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:58976 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754791Ab3BJNU4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Feb 2013 08:20:56 -0500
Received: by mail-ea0-f169.google.com with SMTP id d13so2272707eaa.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Feb 2013 05:20:55 -0800 (PST)
In-Reply-To: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, arhuaco@freaks-unidos.net, buserror@gmail.com, christer@weinigel.se, guillaume.gourat@nexvision.tv, jekhor@gmail.com, danders@amltd.com, bhmin@samsung.com, ghcstop@gmail.com, Tomasz Figa <tomasz.figa@gmail.com>

Devices from s3c_device_timer array are used only for PWM driver, which
does not need interrupts. This patch removes IRQ resources of those
devices.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/plat-samsung/devs.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index e1124d9..196aa68 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1137,34 +1137,22 @@ arch_initcall(s5p_pmu_init);
 
 #ifdef CONFIG_SAMSUNG_DEV_PWM
 
-#define TIMER_RESOURCE_SIZE (1)
-
-#define TIMER_RESOURCE(_tmr, _irq)			\
-	(struct resource [TIMER_RESOURCE_SIZE]) {	\
-		[0] = {					\
-			.start	= _irq,			\
-			.end	= _irq,			\
-			.flags	= IORESOURCE_IRQ	\
-		}					\
+#define DEFINE_S3C_TIMER(_tmr_no) {			\
+		.name		= "s3c24xx-pwm",	\
+		.id		= _tmr_no,		\
 	}
 
-#define DEFINE_S3C_TIMER(_tmr_no, _irq)			\
-	.name		= "s3c24xx-pwm",		\
-	.id		= _tmr_no,			\
-	.num_resources	= TIMER_RESOURCE_SIZE,		\
-	.resource	= TIMER_RESOURCE(_tmr_no, _irq),	\
-
 /*
  * since we already have an static mapping for the timer,
  * we do not bother setting any IO resource for the base.
  */
 
 struct platform_device s3c_device_timer[] = {
-	[0] = { DEFINE_S3C_TIMER(0, IRQ_TIMER0) },
-	[1] = { DEFINE_S3C_TIMER(1, IRQ_TIMER1) },
-	[2] = { DEFINE_S3C_TIMER(2, IRQ_TIMER2) },
-	[3] = { DEFINE_S3C_TIMER(3, IRQ_TIMER3) },
-	[4] = { DEFINE_S3C_TIMER(4, IRQ_TIMER4) },
+	[0] = DEFINE_S3C_TIMER(0),
+	[1] = DEFINE_S3C_TIMER(1),
+	[2] = DEFINE_S3C_TIMER(2),
+	[3] = DEFINE_S3C_TIMER(3),
+	[4] = DEFINE_S3C_TIMER(4),
 };
 #endif /* CONFIG_SAMSUNG_DEV_PWM */
 
-- 
1.8.1.2

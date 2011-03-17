From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] ARM: S3C24XX: H1940: RX1950: Change default LED triggers
Date: Thu, 17 Mar 2011 20:04:57 +0200
Message-ID: <1300385097-18283-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:40626 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754926Ab1CQSFv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Mar 2011 14:05:51 -0400
Received: by wwa36 with SMTP id 36so3871799wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Mar 2011 11:05:49 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Change LED triggers to mimic WinMobile behavior:
red blinking when battery is charging,
orange solid when battery is charged.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2410/mach-h1940.c  |    5 +++--
 arch/arm/mach-s3c2440/mach-rx1950.c |   23 ++++++++++++-----------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
index 5531c4c..84a1422 100644
--- a/arch/arm/mach-s3c2410/mach-h1940.c
+++ b/arch/arm/mach-s3c2410/mach-h1940.c
@@ -437,13 +437,14 @@ EXPORT_SYMBOL(h1940_led_blink_set);
 static struct gpio_led h1940_leds_desc[] = {
 	{
 		.name			= "Green",
-		.default_trigger	= "main-battery-charging-or-full",
+		.default_trigger	= "main-battery-full",
 		.gpio			= H1940_LATCH_LED_GREEN,
 		.retain_state_suspended	= 1,
 	},
 	{
 		.name			= "Red",
-		.default_trigger	= "main-battery-full",
+		.default_trigger
+			= "main-battery-charging-blink-full-solid",
 		.gpio			= H1940_LATCH_LED_RED,
 		.retain_state_suspended	= 1,
 	},
diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
index 2d2f4e4..20beee3 100644
--- a/arch/arm/mach-s3c2440/mach-rx1950.c
+++ b/arch/arm/mach-s3c2440/mach-rx1950.c
@@ -311,22 +311,23 @@ static int rx1950_led_blink_set(unsigned gpio, int state,
 
 static struct gpio_led rx1950_leds_desc[] = {
 	{
-		.name				= "Green",
-		.default_trigger	= "main-battery-charging-or-full",
-		.gpio				= S3C2410_GPA(6),
-		.retain_state_suspended		= 1,
+		.name			= "Green",
+		.default_trigger	= "main-battery-full",
+		.gpio			= S3C2410_GPA(6),
+		.retain_state_suspended	= 1,
 	},
 	{
-		.name				= "Red",
-		.default_trigger	= "main-battery-full",
-		.gpio				= S3C2410_GPA(7),
-		.retain_state_suspended		= 1,
+		.name			= "Red",
+		.default_trigger
+			= "main-battery-charging-blink-full-solid",
+		.gpio			= S3C2410_GPA(7),
+		.retain_state_suspended	= 1,
 	},
 	{
-		.name				= "Blue",
+		.name			= "Blue",
 		.default_trigger	= "rx1950-acx-mem",
-		.gpio				= S3C2410_GPA(11),
-		.retain_state_suspended		= 1,
+		.gpio			= S3C2410_GPA(11),
+		.retain_state_suspended	= 1,
 	},
 };
 
-- 
1.7.4.1

From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] ARM: S3C2442: rx1950: Retain LEDs state in suspend
Date: Wed,  8 Dec 2010 22:10:19 +0200
Message-ID: <1291839019-27336-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:65228 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918Ab0LHULM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Dec 2010 15:11:12 -0500
Received: by eyg5 with SMTP id 5so1289532eyg.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Dec 2010 12:11:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

s3c_adc_battery uses LEDs to indicate charging process,
retain LEDs state in suspend, otherwise user have no information if PDA
battery is charging after he put it to suspend.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2440/mach-rx1950.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
index e0622bb..2c41254 100644
--- a/arch/arm/mach-s3c2440/mach-rx1950.c
+++ b/arch/arm/mach-s3c2440/mach-rx1950.c
@@ -268,16 +268,19 @@ static struct gpio_led rx1950_leds_desc[] = {
 		.name				= "Green",
 		.default_trigger	= "main-battery-charging-or-full",
 		.gpio				= S3C2410_GPA(6),
+		.retain_state_suspended		= 1,
 	},
 	{
 		.name				= "Red",
 		.default_trigger	= "main-battery-full",
 		.gpio				= S3C2410_GPA(7),
+		.retain_state_suspended		= 1,
 	},
 	{
 		.name				= "Blue",
 		.default_trigger	= "rx1950-acx-mem",
 		.gpio				= S3C2410_GPA(11),
+		.retain_state_suspended		= 1,
 	},
 };
 
-- 
1.7.3.2

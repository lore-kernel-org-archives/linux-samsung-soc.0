From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 6/7] ARM: S3C2442: RX1950: Retain LEDs state in suspend
Date: Thu,  6 Jan 2011 21:52:51 +0200
Message-ID: <1294343572-28518-7-git-send-email-anarsoul@gmail.com>
References: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:55992 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404Ab1AFTyn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 14:54:43 -0500
Received: by mail-ew0-f46.google.com with SMTP id 5so7535184ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2011 11:54:43 -0800 (PST)
In-Reply-To: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

s3c_adc_battery uses LEDs to indicate charging process,
retain LEDs state in suspend, otherwise user have no information if PDA
battery is charging after he put it to suspend.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2440/mach-rx1950.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
index eab6ae5..e7cc993 100644
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

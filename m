From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: S5PV210: Set 1000ns as PWM backlight period on SMDKV210
Date: Wed,  9 Nov 2011 11:10:36 +0900
Message-ID: <1320804636-19950-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54178 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141Ab1KICar (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Nov 2011 21:30:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Jingoo Han <jg1.han@samsung.com>

The SMDK board uses LT3591 as backlight LED driver of LTE480WV LCD.
According to the LT3591 datasheet, the switching frequency should
be 1MHz. So, PWM period is calculated by following formula:

PWM period = 1/switching frequency
	   = 1/1MHz
	   = 1000ns

Thus, the PWM backlight period should be 1000ns.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index a9106c3..8662ef6 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -273,6 +273,7 @@ static struct samsung_bl_gpio_info smdkv210_bl_gpio_info = {
 
 static struct platform_pwm_backlight_data smdkv210_bl_data = {
 	.pwm_id = 3,
+	.pwm_period_ns = 1000,
 };
 
 static void __init smdkv210_map_io(void)
-- 
1.7.1

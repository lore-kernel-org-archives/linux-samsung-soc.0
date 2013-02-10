From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 07/12] clocksource: samsung-time: Use clk_get_sys for getting clocks
Date: Sun, 10 Feb 2013 14:20:18 +0100
Message-ID: <1360502423-2246-8-git-send-email-tomasz.figa@gmail.com>
References: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:54821 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754918Ab3BJNUy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Feb 2013 08:20:54 -0500
Received: by mail-ee0-f42.google.com with SMTP id b47so2676243eek.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Feb 2013 05:20:53 -0800 (PST)
In-Reply-To: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, arhuaco@freaks-unidos.net, buserror@gmail.com, christer@weinigel.se, guillaume.gourat@nexvision.tv, jekhor@gmail.com, danders@amltd.com, bhmin@samsung.com, ghcstop@gmail.com, Tomasz Figa <tomasz.figa@gmail.com>

This patch removes the need to reference platform_device structs defined
in platform code, by using clk_get_sys instead of clk_get for getting
necessary clocks.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clocksource/samsung-time.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/clocksource/samsung-time.c b/drivers/clocksource/samsung-time.c
index d847036..29fc63f 100644
--- a/drivers/clocksource/samsung-time.c
+++ b/drivers/clocksource/samsung-time.c
@@ -23,8 +23,6 @@
 #include <asm/mach/map.h>
 #include <asm/sched_clock.h>
 
-#include <plat/devs.h>
-
 static void __iomem *timer_base;
 
 #define S3C_TIMERREG(x) (timer_base + (x))
@@ -335,9 +333,6 @@ static void samsung_timer_resume(void)
 void __init samsung_set_timer_source(enum samsung_timer_mode event,
 				 enum samsung_timer_mode source)
 {
-	s3c_device_timer[event].dev.bus = &platform_bus_type;
-	s3c_device_timer[source].dev.bus = &platform_bus_type;
-
 	timer_source.event_id = event;
 	timer_source.source_id = source;
 }
@@ -485,28 +480,24 @@ static void __init samsung_timer_resources(void)
 	clk_enable(timerclk);
 
 	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
-	s3c_device_timer[event_id].id = event_id;
-	s3c_device_timer[event_id].dev.init_name = devname;
 
-	tin_event = clk_get(&s3c_device_timer[event_id].dev, "pwm-tin");
+	tin_event = clk_get_sys(devname, "pwm-tin");
 	if (IS_ERR(tin_event))
 		panic("failed to get pwm-tin clock for event timer");
 
-	tdiv_event = clk_get(&s3c_device_timer[event_id].dev, "pwm-tdiv");
+	tdiv_event = clk_get_sys(devname, "pwm-tdiv");
 	if (IS_ERR(tdiv_event))
 		panic("failed to get pwm-tdiv clock for event timer");
 
 	clk_enable(tin_event);
 
 	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
-	s3c_device_timer[source_id].id = source_id;
-	s3c_device_timer[source_id].dev.init_name = devname;
 
-	tin_source = clk_get(&s3c_device_timer[source_id].dev, "pwm-tin");
+	tin_source = clk_get_sys(devname, "pwm-tin");
 	if (IS_ERR(tin_source))
 		panic("failed to get pwm-tin clock for source timer");
 
-	tdiv_source = clk_get(&s3c_device_timer[source_id].dev, "pwm-tdiv");
+	tdiv_source = clk_get_sys(devname, "pwm-tdiv");
 	if (IS_ERR(tdiv_source))
 		panic("failed to get pwm-tdiv clock for source timer");
 
-- 
1.8.1.2

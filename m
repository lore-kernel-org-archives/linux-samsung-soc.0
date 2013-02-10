From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 03/12] clocksource: samsung-time: Drop useless defines from public header
Date: Sun, 10 Feb 2013 14:20:14 +0100
Message-ID: <1360502423-2246-4-git-send-email-tomasz.figa@gmail.com>
References: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:46265 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754786Ab3BJNUo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Feb 2013 08:20:44 -0500
Received: by mail-ee0-f43.google.com with SMTP id c50so2649728eek.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Feb 2013 05:20:42 -0800 (PST)
In-Reply-To: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, arhuaco@freaks-unidos.net, buserror@gmail.com, christer@weinigel.se, guillaume.gourat@nexvision.tv, jekhor@gmail.com, danders@amltd.com, bhmin@samsung.com, ghcstop@gmail.com, Tomasz Figa <tomasz.figa@gmail.com>

This patch cleans up public header from useless definitions.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/plat-samsung/include/plat/samsung-time.h |  6 ------
 drivers/clocksource/samsung-time.c                | 10 +++++-----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/arm/plat-samsung/include/plat/samsung-time.h
index ba7246e..68432af 100644
--- a/arch/arm/plat-samsung/include/plat/samsung-time.h
+++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
@@ -33,12 +33,6 @@ struct samsung_timer_variant {
 	u16 divisor;
 };
 
-/* Be able to sleep for atleast 4 seconds (usually more) */
-#define SAMSUNG_TIMER_MIN_RANGE	4
-
-#define NON_PERIODIC		0
-#define PERIODIC		1
-
 extern void __init samsung_set_timer_source(enum samsung_timer_mode event,
 					enum samsung_timer_mode source);
 extern void __init samsung_timer_set_variant(
diff --git a/drivers/clocksource/samsung-time.c b/drivers/clocksource/samsung-time.c
index 3017203..a6af801 100644
--- a/drivers/clocksource/samsung-time.c
+++ b/drivers/clocksource/samsung-time.c
@@ -183,7 +183,7 @@ static int samsung_set_next_event(unsigned long cycles,
 				struct clock_event_device *evt)
 {
 	samsung_time_setup(timer_source.event_id, cycles);
-	samsung_time_start(timer_source.event_id, NON_PERIODIC);
+	samsung_time_start(timer_source.event_id, false);
 
 	return 0;
 }
@@ -196,7 +196,7 @@ static void samsung_set_mode(enum clock_event_mode mode,
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
 		samsung_time_setup(timer_source.event_id, clock_count_per_tick);
-		samsung_time_start(timer_source.event_id, PERIODIC);
+		samsung_time_start(timer_source.event_id, true);
 		break;
 
 	case CLOCK_EVT_MODE_ONESHOT:
@@ -220,11 +220,11 @@ static void samsung_timer_resume(void)
 
 	/* event timer restart */
 	samsung_time_setup(timer_source.event_id, clock_count_per_tick);
-	samsung_time_start(timer_source.event_id, PERIODIC);
+	samsung_time_start(timer_source.event_id, true);
 
 	/* source timer restart */
 	samsung_time_setup(timer_source.source_id, tcnt_max);
-	samsung_time_start(timer_source.source_id, PERIODIC);
+	samsung_time_start(timer_source.source_id, true);
 }
 
 void __init samsung_set_timer_source(enum samsung_timer_mode event,
@@ -350,7 +350,7 @@ static void __init samsung_clocksource_init(void)
 	clock_rate = clk_get_rate(tin_source);
 
 	samsung_time_setup(timer_source.source_id, tcnt_max);
-	samsung_time_start(timer_source.source_id, PERIODIC);
+	samsung_time_start(timer_source.source_id, true);
 
 	setup_sched_clock(samsung_read_sched_clock,
 						timer_variant.bits, clock_rate);
-- 
1.8.1.2

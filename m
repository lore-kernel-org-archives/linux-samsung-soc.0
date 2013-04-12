From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v5 02/14] clocksource: samsung-pwm: Clean up platform header
Date: Fri, 12 Apr 2013 21:17:18 +0200
Message-ID: <1365794250-14436-3-git-send-email-t.figa@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11168 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752997Ab3DLTSF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 15:18:05 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML500C6RPLYNJ50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Apr 2013 04:18:03 +0900 (KST)
In-reply-to: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>

This patch moves private definitions out of the public platform header
and also cleans it up from unused and/or unnecessary ones.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/samsung-time.h | 11 -----------
 drivers/clocksource/samsung_pwm.c                 | 15 ++++++++++-----
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/arm/plat-samsung/include/plat/samsung-time.h
index 4cc99bb..ecc423c 100644
--- a/arch/arm/plat-samsung/include/plat/samsung-time.h
+++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
@@ -22,14 +22,6 @@ enum samsung_timer_mode {
 	SAMSUNG_PWM4,
 };
 
-struct samsung_timer_source {
-	unsigned int event_id;
-	unsigned int source_id;
-};
-
-/* Be able to sleep for atleast 4 seconds (usually more) */
-#define SAMSUNG_TIMER_MIN_RANGE	4
-
 #if defined(CONFIG_ARCH_S3C24XX) || defined(CONFIG_ARCH_S5PC100)
 #define TCNT_MAX		0xffff
 #define TSCALER_DIV		25
@@ -42,9 +34,6 @@ struct samsung_timer_source {
 #define TSIZE			32
 #endif
 
-#define NON_PERIODIC		0
-#define PERIODIC		1
-
 extern void __init samsung_set_timer_source(enum samsung_timer_mode event,
 					enum samsung_timer_mode source);
 
diff --git a/drivers/clocksource/samsung_pwm.c b/drivers/clocksource/samsung_pwm.c
index f899cbc..974675b 100644
--- a/drivers/clocksource/samsung_pwm.c
+++ b/drivers/clocksource/samsung_pwm.c
@@ -27,6 +27,11 @@
 #include <plat/regs-timer.h>
 #include <plat/samsung-time.h>
 
+struct samsung_timer_source {
+	unsigned int event_id;
+	unsigned int source_id;
+};
+
 static struct clk *tin_event;
 static struct clk *tin_source;
 static struct clk *tdiv_event;
@@ -182,7 +187,7 @@ static int samsung_set_next_event(unsigned long cycles,
 				struct clock_event_device *evt)
 {
 	samsung_time_setup(timer_source.event_id, cycles);
-	samsung_time_start(timer_source.event_id, NON_PERIODIC);
+	samsung_time_start(timer_source.event_id, false);
 
 	return 0;
 }
@@ -195,7 +200,7 @@ static void samsung_set_mode(enum clock_event_mode mode,
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
 		samsung_time_setup(timer_source.event_id, clock_count_per_tick);
-		samsung_time_start(timer_source.event_id, PERIODIC);
+		samsung_time_start(timer_source.event_id, true);
 		break;
 
 	case CLOCK_EVT_MODE_ONESHOT:
@@ -215,11 +220,11 @@ static void samsung_timer_resume(void)
 {
 	/* event timer restart */
 	samsung_time_setup(timer_source.event_id, clock_count_per_tick);
-	samsung_time_start(timer_source.event_id, PERIODIC);
+	samsung_time_start(timer_source.event_id, true);
 
 	/* source timer restart */
 	samsung_time_setup(timer_source.source_id, TCNT_MAX);
-	samsung_time_start(timer_source.source_id, PERIODIC);
+	samsung_time_start(timer_source.source_id, true);
 }
 
 void __init samsung_set_timer_source(enum samsung_timer_mode event,
@@ -335,7 +340,7 @@ static void __init samsung_clocksource_init(void)
 	clock_rate = clk_get_rate(tin_source);
 
 	samsung_time_setup(timer_source.source_id, TCNT_MAX);
-	samsung_time_start(timer_source.source_id, PERIODIC);
+	samsung_time_start(timer_source.source_id, true);
 
 	setup_sched_clock(samsung_read_sched_clock, TSIZE, clock_rate);
 
-- 
1.8.1.5

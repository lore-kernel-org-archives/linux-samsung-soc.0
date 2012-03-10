From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix cycle count for periodic mode of clock event timers
Date: Sat, 10 Mar 2012 01:59:01 -0800
Message-ID: <1331373541-22580-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41473 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699Ab2CJJ7L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 04:59:11 -0500
Received: by iagz16 with SMTP id z16so3608880iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 01:59:10 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

EXYNOS SOC series use MCT for kernel timer and MCT has two types of
clock event timers, which are mct-comp and mct-tick.
Because the clock rate of each event timer is diffent from the other,
this patch fixes cycles_per_jiffy for each timer's periodic mode.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/mct.c |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 85b5527..3e894ba 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -29,12 +29,13 @@
 #include <mach/regs-mct.h>
 #include <asm/mach/time.h>
 
+#define TICK_BASE_CNT	1
+
 enum {
 	MCT_INT_SPI,
 	MCT_INT_PPI
 };
 
-static unsigned long clk_cnt_per_tick;
 static unsigned long clk_rate;
 static unsigned int mct_int_type;
 
@@ -205,11 +206,14 @@ static int exynos4_comp_set_next_event(unsigned long cycles,
 static void exynos4_comp_set_mode(enum clock_event_mode mode,
 				  struct clock_event_device *evt)
 {
+	unsigned long cycles_per_jiffy;
 	exynos4_mct_comp0_stop();
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
-		exynos4_mct_comp0_start(mode, clk_cnt_per_tick);
+		cycles_per_jiffy =
+			(((unsigned long long) NSEC_PER_SEC / HZ * evt->mult) >> evt->shift);
+		exynos4_mct_comp0_start(mode, cycles_per_jiffy);
 		break;
 
 	case CLOCK_EVT_MODE_ONESHOT:
@@ -248,9 +252,7 @@ static struct irqaction mct_comp_event_irq = {
 
 static void exynos4_clockevent_init(void)
 {
-	clk_cnt_per_tick = clk_rate / 2	/ HZ;
-
-	clockevents_calc_mult_shift(&mct_comp_device, clk_rate / 2, 5);
+	clockevents_calc_mult_shift(&mct_comp_device, clk_rate, 5);
 	mct_comp_device.max_delta_ns =
 		clockevent_delta2ns(0xffffffff, &mct_comp_device);
 	mct_comp_device.min_delta_ns =
@@ -314,12 +316,15 @@ static inline void exynos4_tick_set_mode(enum clock_event_mode mode,
 					 struct clock_event_device *evt)
 {
 	struct mct_clock_event_device *mevt = this_cpu_ptr(&percpu_mct_tick);
+	unsigned long cycles_per_jiffy;
 
 	exynos4_mct_tick_stop(mevt);
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
-		exynos4_mct_tick_start(clk_cnt_per_tick, mevt);
+		cycles_per_jiffy =
+			(((unsigned long long) NSEC_PER_SEC / HZ * evt->mult) >> evt->shift);
+		exynos4_mct_tick_start(cycles_per_jiffy, mevt);
 		break;
 
 	case CLOCK_EVT_MODE_ONESHOT:
@@ -393,7 +398,7 @@ static void exynos4_mct_tick_init(struct clock_event_device *evt)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	evt->rating = 450;
 
-	clockevents_calc_mult_shift(evt, clk_rate / 2, 5);
+	clockevents_calc_mult_shift(evt, clk_rate / (TICK_BASE_CNT + 1), 5);
 	evt->max_delta_ns =
 		clockevent_delta2ns(0x7fffffff, evt);
 	evt->min_delta_ns =
@@ -401,7 +406,7 @@ static void exynos4_mct_tick_init(struct clock_event_device *evt)
 
 	clockevents_register_device(evt);
 
-	exynos4_mct_write(0x1, mevt->base + MCT_L_TCNTB_OFFSET);
+	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
 	if (mct_int_type == MCT_INT_SPI) {
 		if (cpu == 0) {
-- 
1.7.4.4

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Exynos: Mismatch in BogoMIPS values
Date: Wed, 22 Feb 2012 15:42:05 +0900
Message-ID: <016201ccf12d$17b8a160$4729e420$%kim@samsung.com>
References: <CAK9yfHz9e5iEu=3ay0F_WVLeg=+6CtErqX2G4zq7Me+QtJSPWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39489 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab2BVGmI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 01:42:08 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZS00EMA7WD0ER0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 15:42:07 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZS00MX47Y55QV0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2012 15:42:06 +0900 (KST)
In-reply-to: <CAK9yfHz9e5iEu=3ay0F_WVLeg=+6CtErqX2G4zq7Me+QtJSPWQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Sangwook Lee' <sangwook.lee@linaro.org>
Cc: samsung@lists.linaro.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, chaos.youn@samsung.com

Sachin Kamat wrote:
> 
> Hi,
> 
Hi,

> The mismatch in BogoMIPS value between two cores (992 and 1992) is not
> specific to Origen board.
> The same is observed on SMDKV310 board as well. It looks like a common
> Exynos machine problem.
> 
> Including the mailing list for wider dissemination.
> 
> 
I think, you can get the right value of BogoMIPS with following.
If any problems, please let me know.

As a note, let me send following patch after done of sorting for other
exynos5250 arch patches.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Changhwan Youn <chaos.youn@samsung.com>
ARM: EXYNOS: fix cycle count for periodic mode of clock event timers
    
EXYNOS SOC series use MCT for kernel timer and MCT has two types of
clock event timers, which are mct-comp and mct-tick.
Because the clock rate of each event timer is diffent from the other,
this patch fixes cycles_per_jiffy for each timer's periodic mode.
    
Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 667a8e9..2ded1ff 100644
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
 
@@ -205,11 +206,14 @@ static int exynos4_comp_set_next_event(unsigned long
cycles,
 static void exynos4_comp_set_mode(enum clock_event_mode mode,
 				  struct clock_event_device *evt)
 {
+	unsigned long cycles_per_jiffy;
 	exynos4_mct_comp0_stop();
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
-		exynos4_mct_comp0_start(mode, clk_cnt_per_tick);
+		cycles_per_jiffy =
+			(((unsigned long long) NSEC_PER_SEC / HZ *
evt->mult) >> evt->shift);
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
@@ -316,12 +318,15 @@ static inline void exynos4_tick_set_mode(enum
clock_event_mode mode,
 					 struct clock_event_device *evt)
 {
 	struct mct_clock_event_device *mevt =
this_cpu_ptr(&percpu_mct_tick);
+	unsigned long cycles_per_jiffy;
 
 	exynos4_mct_tick_stop(mevt);
 
 	switch (mode) {
 	case CLOCK_EVT_MODE_PERIODIC:
-		exynos4_mct_tick_start(clk_cnt_per_tick, mevt);
+		cycles_per_jiffy =
+			(((unsigned long long) NSEC_PER_SEC / HZ *
evt->mult) >> evt->shift);
+		exynos4_mct_tick_start(cycles_per_jiffy, mevt);
 		break;
 
 	case CLOCK_EVT_MODE_ONESHOT:
@@ -395,7 +400,7 @@ static void exynos4_mct_tick_init(struct
clock_event_device *evt)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	evt->rating = 450;
 
-	clockevents_calc_mult_shift(evt, clk_rate / 2, 5);
+	clockevents_calc_mult_shift(evt, clk_rate / (TICK_BASE_CNT + 1), 5);
 	evt->max_delta_ns =
 		clockevent_delta2ns(0x7fffffff, evt);
 	evt->min_delta_ns =
@@ -403,7 +408,7 @@ static void exynos4_mct_tick_init(struct
clock_event_device *evt)
 
 	clockevents_register_device(evt);
 
-	exynos4_mct_write(0x1, mevt->base + MCT_L_TCNTB_OFFSET);
+	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
 	if (mct_int_type == MCT_INT_SPI) {
 		if (cpu == 0) {

> On 21/02/2012, Sangwook Lee <sangwook.lee@linaro.org> wrote:
> > Maybe, someone missed this.
> [snip]
> 
> >
> > On a side note, with linaro 3.1, when you cat /proc/cpuinfo, we get
> > incorrect numbers for the BOGOMIPS for the 2 cores (900 and 1900),
> > whereas on 3.0.4+ kernel, and the insignal kernel, we get the correct
> > report of 1900 for both cores.
> >
> 
> 
> --
> With warm regards,
> Sachin

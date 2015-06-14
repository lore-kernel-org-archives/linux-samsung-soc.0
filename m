From: Alexey Klimov <klimov.linux@gmail.com>
Subject: [question] [PATCH RFC] clocksource: exynos_mct: remove unneeded
 container_of()
Date: Mon, 15 Jun 2015 01:50:38 +0300
Message-ID: <1434322238.5390.16.camel@mtux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34165 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbbFNWvc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Jun 2015 18:51:32 -0400
Received: by lbbti3 with SMTP id ti3so5948167lbb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Jun 2015 15:51:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, sboyd@codeaurora.org
Cc: klimov.linux@gmail.com, t.dakhran@gmail.com, yury.norov@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, thomas.abraham@linaro.org

Hi Stephen and all,

i'm lazy-looking on commit ee98d27df6827b5ba4bd99cb7d5cb1239b6a1a31
"ARM: EXYNOS4: Divorce mct from local timer API".

I think i miss some point of local timers APIs and other things but why
we are going to get evt pointer from mevt structure in
exynos4_mct_cpu_notify(), pass it to setup function and there we
calculate mevt pointer again from evt by using container_of() macro?

To be simple, does patch below makes any sense or am I wrong somewhere?
Just want to optimize setup function a little. Looks like code performs
useless work.

Tested on odroid-xu3 with PMU spare2 register fix.

Best regards,
Alexey Klimov.

----------
From: Alexey Klimov <klimov.linux@gmail.com>

Patch removes unneeded container_of() macro
in exynos4_local_timer_setup(). Instead let's pass mevt pointer
to setup and stop functions from exynos4_mct_cpu_notify() 
and let them get evt pointer.

Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
---
 drivers/clocksource/exynos_mct.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 83564c9..752a37c 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -446,13 +446,11 @@ static irqreturn_t exynos4_mct_tick_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int exynos4_local_timer_setup(struct clock_event_device *evt)
+static int exynos4_local_timer_setup(struct mct_clock_event_device *mevt)
 {
-	struct mct_clock_event_device *mevt;
+	struct clock_event_device *evt = &mevt->evt;
 	unsigned int cpu = smp_processor_id();
 
-	mevt = container_of(evt, struct mct_clock_event_device, evt);
-
 	mevt->base = EXYNOS4_MCT_L_BASE(cpu);
 	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
 
@@ -484,8 +482,10 @@ static int exynos4_local_timer_setup(struct clock_event_device *evt)
 	return 0;
 }
 
-static void exynos4_local_timer_stop(struct clock_event_device *evt)
+static void exynos4_local_timer_stop(struct mct_clock_event_device *mevt)
 {
+	struct clock_event_device *evt = &mevt->evt;
+
 	evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
 	if (mct_int_type == MCT_INT_SPI)
 		free_irq(evt->irq, this_cpu_ptr(&percpu_mct_tick));
@@ -505,11 +505,11 @@ static int exynos4_mct_cpu_notify(struct notifier_block *self,
 	switch (action & ~CPU_TASKS_FROZEN) {
 	case CPU_STARTING:
 		mevt = this_cpu_ptr(&percpu_mct_tick);
-		exynos4_local_timer_setup(&mevt->evt);
+		exynos4_local_timer_setup(mevt);
 		break;
 	case CPU_DYING:
 		mevt = this_cpu_ptr(&percpu_mct_tick);
-		exynos4_local_timer_stop(&mevt->evt);
+		exynos4_local_timer_stop(mevt);
 		break;
 	}
 
@@ -557,7 +557,7 @@ static void __init exynos4_timer_resources(struct device_node *np, void __iomem
 		goto out_irq;
 
 	/* Immediately configure the timer on the boot CPU */
-	exynos4_local_timer_setup(&mevt->evt);
+	exynos4_local_timer_setup(mevt);
 	return;
 
 out_irq:
-- 
1.9.1

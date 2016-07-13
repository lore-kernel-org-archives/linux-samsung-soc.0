From: Anna-Maria Gleixner <anna-maria@linutronix.de>
Subject: [patch V2 63/67] clocksource/exynos_mct: Convert to hotplug state
 machine
Date: Wed, 13 Jul 2016 17:17:05 -0000
Message-ID: <20160713153338.147940411@linutronix.de>
References: <20160713153219.128052238@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=0034-clocksource-exynos_mct-Convert-to-hotplug-state-mach.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, rt@linutronix.de, Richard Cochran <rcochran@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Anna-Maria Gleixner <anna-maria@linutronix.de>
List-Id: linux-samsung-soc@vger.kernel.org

From: Richard Cochran <rcochran@linutronix.de>

Install the callbacks via the state machine and let the core invoke
the callbacks on the already online CPUs.

Signed-off-by: Richard Cochran <rcochran@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Anna-Maria Gleixner <anna-maria@linutronix.de>
---
 drivers/clocksource/exynos_mct.c |   46 ++++++++++-----------------------------
 include/linux/cpuhotplug.h       |    1 
 2 files changed, 13 insertions(+), 34 deletions(-)

--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -443,10 +443,11 @@ static irqreturn_t exynos4_mct_tick_isr(
 	return IRQ_HANDLED;
 }
 
-static int exynos4_local_timer_setup(struct mct_clock_event_device *mevt)
+static int exynos4_mct_starting_cpu(unsigned int cpu)
 {
+	struct mct_clock_event_device *mevt =
+		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
-	unsigned int cpu = smp_processor_id();
 
 	mevt->base = EXYNOS4_MCT_L_BASE(cpu);
 	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
@@ -480,8 +481,10 @@ static int exynos4_local_timer_setup(str
 	return 0;
 }
 
-static void exynos4_local_timer_stop(struct mct_clock_event_device *mevt)
+static int exynos4_mct_dying_cpu(unsigned int cpu)
 {
+	struct mct_clock_event_device *mevt =
+		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
 	evt->set_state_shutdown(evt);
@@ -491,39 +494,12 @@ static void exynos4_local_timer_stop(str
 	} else {
 		disable_percpu_irq(mct_irqs[MCT_L0_IRQ]);
 	}
+	return 0;
 }
 
-static int exynos4_mct_cpu_notify(struct notifier_block *self,
-					   unsigned long action, void *hcpu)
-{
-	struct mct_clock_event_device *mevt;
-
-	/*
-	 * Grab cpu pointer in each case to avoid spurious
-	 * preemptible warnings
-	 */
-	switch (action & ~CPU_TASKS_FROZEN) {
-	case CPU_STARTING:
-		mevt = this_cpu_ptr(&percpu_mct_tick);
-		exynos4_local_timer_setup(mevt);
-		break;
-	case CPU_DYING:
-		mevt = this_cpu_ptr(&percpu_mct_tick);
-		exynos4_local_timer_stop(mevt);
-		break;
-	}
-
-	return NOTIFY_OK;
-}
-
-static struct notifier_block exynos4_mct_cpu_nb = {
-	.notifier_call = exynos4_mct_cpu_notify,
-};
-
 static int __init exynos4_timer_resources(struct device_node *np, void __iomem *base)
 {
 	int err, cpu;
-	struct mct_clock_event_device *mevt = this_cpu_ptr(&percpu_mct_tick);
 	struct clk *mct_clk, *tick_clk;
 
 	tick_clk = np ? of_clk_get_by_name(np, "fin_pll") :
@@ -570,12 +546,14 @@ static int __init exynos4_timer_resource
 		}
 	}
 
-	err = register_cpu_notifier(&exynos4_mct_cpu_nb);
+	/* Install hotplug callbacks which configure the timer on this CPU */
+	err = cpuhp_setup_state(CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
+				"AP_EXYNOS4_MCT_TIMER_STARTING",
+				exynos4_mct_starting_cpu,
+				exynos4_mct_dying_cpu);
 	if (err)
 		goto out_irq;
 
-	/* Immediately configure the timer on the boot CPU */
-	exynos4_local_timer_setup(mevt);
 	return 0;
 
 out_irq:
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -50,6 +50,7 @@ enum cpuhp_state {
 	CPUHP_AP_ARM_ARCH_TIMER_STARTING,
 	CPUHP_AP_ARM_GLOBAL_TIMER_STARTING,
 	CPUHP_AP_DUMMY_TIMER_STARTING,
+	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
 	CPUHP_AP_ARM_TWD_STARTING,
 	CPUHP_AP_METAG_TIMER_STARTING,
 	CPUHP_AP_QCOM_TIMER_STARTING,

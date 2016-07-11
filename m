From: Anna-Maria Gleixner <anna-maria@linutronix.de>
Subject: [patch 40/66] clocksource/exynos_mct: Convert to hotplug state machine
Date: Mon, 11 Jul 2016 12:28:50 -0000
Message-ID: <20160711122534.019427149@linutronix.de>
References: <20160711122450.923603742@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=0034-clocksource-exynos_mct-Convert-to-hotplug-state-mach.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Richard Cochran <rcochran@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Anna-Maria Gleixner <anna-maria@linutronix.de>
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
 drivers/clocksource/exynos_mct.c |   48 +++++++++------------------------------
 include/linux/cpuhotplug.h       |    1 
 2 files changed, 13 insertions(+), 36 deletions(-)

--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -439,10 +439,11 @@ static irqreturn_t exynos4_mct_tick_isr(
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
@@ -489,37 +490,18 @@ static void exynos4_local_timer_stop(str
 	}
 }
 
-static int exynos4_mct_cpu_notify(struct notifier_block *self,
-					   unsigned long action, void *hcpu)
+static int exynos4_mct_dying_cpu(unsigned int cpu)
 {
-	struct mct_clock_event_device *mevt;
+	struct mct_clock_event_device *mevt =
+		per_cpu_ptr(&percpu_mct_tick, cpu);
 
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
+	exynos4_local_timer_stop(mevt);
+	return 0;
 }
 
-static struct notifier_block exynos4_mct_cpu_nb = {
-	.notifier_call = exynos4_mct_cpu_notify,
-};
-
 static void __init exynos4_timer_resources(struct device_node *np, void __iomem *base)
 {
 	int err, cpu;
-	struct mct_clock_event_device *mevt = this_cpu_ptr(&percpu_mct_tick);
 	struct clk *mct_clk, *tick_clk;
 
 	tick_clk = np ? of_clk_get_by_name(np, "fin_pll") :
@@ -566,16 +548,10 @@ static void __init exynos4_timer_resourc
 		}
 	}
 
-	err = register_cpu_notifier(&exynos4_mct_cpu_nb);
-	if (err)
-		goto out_irq;
-
-	/* Immediately configure the timer on the boot CPU */
-	exynos4_local_timer_setup(mevt);
-	return;
-
-out_irq:
-	free_percpu_irq(mct_irqs[MCT_L0_IRQ], &percpu_mct_tick);
+	/* Install hotplug callbacks which configure the timer on this cpu */
+	cpuhp_setup_state(CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
+			  "AP_EXYNOS4_MCT_TIMER_STARTING",
+			  exynos4_mct_starting_cpu, exynos4_mct_dying_cpu);
 }
 
 static void __init mct_init_dt(struct device_node *np, unsigned int int_type)
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -40,6 +40,7 @@ enum cpuhp_state {
 	CPUHP_AP_ARM_ARCH_TIMER_STARTING,
 	CPUHP_AP_ARM_GLOBAL_TIMER_STARTING,
 	CPUHP_AP_DUMMY_TIMER_STARTING,
+	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
 	CPUHP_AP_NOTIFY_STARTING,
 	CPUHP_AP_ONLINE,

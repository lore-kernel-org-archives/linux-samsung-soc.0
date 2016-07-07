From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 15/93] clocksource/drivers/exynos_mct: Convert init function
 to return error
Date: Thu,  7 Jul 2016 10:00:48 +0200
Message-ID: <1467878526-1238-15-git-send-email-daniel.lezcano@linaro.org>
References: <577E0BED.3020608@linaro.org>
 <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, daniel.lezcano@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The init functions do not return any error. They behave as the following:

 - panic, thus leading to a kernel crash while another timer may work and
   make the system boot up correctly

 or

 - print an error and let the caller unaware if the state of the system

Change that by converting the init functions to return an error conforming
to the CLOCKSOURCE_OF_RET prototype.

Proper error handling (rollback, errno value) will be changed later case
by case, thus this change just return back an error or success in the init
function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clocksource/exynos_mct.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index be09bc0..f6caed0 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -232,7 +232,7 @@ static cycles_t exynos4_read_current_timer(void)
 	return exynos4_read_count_32();
 }
 
-static void __init exynos4_clocksource_init(void)
+static int __init exynos4_clocksource_init(void)
 {
 	exynos4_mct_frc_start();
 
@@ -244,6 +244,8 @@ static void __init exynos4_clocksource_init(void)
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
 	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
+
+	return 0;
 }
 
 static void exynos4_mct_comp0_stop(void)
@@ -335,12 +337,14 @@ static struct irqaction mct_comp_event_irq = {
 	.dev_id		= &mct_comp_device,
 };
 
-static void exynos4_clockevent_init(void)
+static int exynos4_clockevent_init(void)
 {
 	mct_comp_device.cpumask = cpumask_of(0);
 	clockevents_config_and_register(&mct_comp_device, clk_rate,
 					0xf, 0xffffffff);
 	setup_irq(mct_irqs[MCT_G0_IRQ], &mct_comp_event_irq);
+
+	return 0;
 }
 
 static DEFINE_PER_CPU(struct mct_clock_event_device, percpu_mct_tick);
@@ -516,7 +520,7 @@ static struct notifier_block exynos4_mct_cpu_nb = {
 	.notifier_call = exynos4_mct_cpu_notify,
 };
 
-static void __init exynos4_timer_resources(struct device_node *np, void __iomem *base)
+static int __init exynos4_timer_resources(struct device_node *np, void __iomem *base)
 {
 	int err, cpu;
 	struct mct_clock_event_device *mevt = this_cpu_ptr(&percpu_mct_tick);
@@ -572,15 +576,17 @@ static void __init exynos4_timer_resources(struct device_node *np, void __iomem
 
 	/* Immediately configure the timer on the boot CPU */
 	exynos4_local_timer_setup(mevt);
-	return;
+	return 0;
 
 out_irq:
 	free_percpu_irq(mct_irqs[MCT_L0_IRQ], &percpu_mct_tick);
+	return err;
 }
 
-static void __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	u32 nr_irqs, i;
+	int ret;
 
 	mct_int_type = int_type;
 
@@ -600,20 +606,26 @@ static void __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
 		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
-	exynos4_timer_resources(np, of_iomap(np, 0));
-	exynos4_clocksource_init();
-	exynos4_clockevent_init();
+	ret = exynos4_timer_resources(np, of_iomap(np, 0));
+	if (ret)
+		return ret;
+
+	ret = exynos4_clocksource_init();
+	if (ret)
+		return ret;
+
+	return exynos4_clockevent_init();
 }
 
 
-static void __init mct_init_spi(struct device_node *np)
+static int __init mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static void __init mct_init_ppi(struct device_node *np)
+static int __init mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-CLOCKSOURCE_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
-CLOCKSOURCE_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+CLOCKSOURCE_OF_DECLARE_RET(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
+CLOCKSOURCE_OF_DECLARE_RET(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
-- 
1.9.1

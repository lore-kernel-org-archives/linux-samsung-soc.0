From: Romain Naour <romain.naour@openwide.fr>
Subject: [PATCH] S3C24XX: add clockevent/clocksource support
Date: Wed, 24 Oct 2012 22:56:40 +0200
Message-ID: <50885608.1030503@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:59337 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758777Ab2JXVCo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Oct 2012 17:02:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

This patch converts the s3c24xx timer driver to the clocksource/clockevent API.
I made some test on a mini2440 board and I had to reduce timers frequency to 1MHz in order to produce a timer's overflow every 64ms.
Initial timer's frequency (8,45MHz) provide only 7ms between each overflow. It is not enough.
As timers were previously used to produce an IRQ at 200Hz, some board (Osiris, Anubis board) use an external 12MHz signal to clock the timers (tclk1).
So, I changed their configuration to select internal pclk clock instead, but I can't test it.
Also, I created a new file (s3c24xx_time.c) to avoid impacting the s3c64xx.
Kernel rev v3.7-rc1

Do you have any comments on this patch ?

Signed-off-by: Naour Romain <romain.naour@openwide.fr>
---
 arch/arm/Kconfig                     |   3 +-
 arch/arm/plat-s3c24xx/Makefile       |   1 +
 arch/arm/plat-s3c24xx/s3c24xx_time.c | 374 +++++++++++++++++++++++++++++++++++
 3 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/plat-s3c24xx/s3c24xx_time.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 73067ef..80f989b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -737,7 +737,8 @@ config ARCH_SA1100
 config ARCH_S3C24XX
 	bool "Samsung S3C24XX SoCs"
 	select ARCH_HAS_CPUFREQ
-	select ARCH_USES_GETTIMEOFFSET
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
 	select CLKDEV_LOOKUP
 	select GENERIC_GPIO
 	select HAVE_CLK
diff --git a/arch/arm/plat-s3c24xx/Makefile b/arch/arm/plat-s3c24xx/Makefile
index 9f60549c..a0c4830 100644
--- a/arch/arm/plat-s3c24xx/Makefile
+++ b/arch/arm/plat-s3c24xx/Makefile
@@ -14,6 +14,7 @@ obj-				:=
 
 obj-y				+= irq.o
 obj-$(CONFIG_S3C24XX_DCLK)	+= clock-dclk.o
+obj-$(CONFIG_GENERIC_CLOCKEVENTS)   += s3c24xx_time.o
 
 obj-$(CONFIG_CPU_FREQ_S3C24XX)	+= cpu-freq.o
 obj-$(CONFIG_CPU_FREQ_S3C24XX_DEBUGFS) += cpu-freq-debugfs.o
diff --git a/arch/arm/plat-s3c24xx/s3c24xx_time.c b/arch/arm/plat-s3c24xx/s3c24xx_time.c
new file mode 100644
index 0000000..00cad36
--- /dev/null
+++ b/arch/arm/plat-s3c24xx/s3c24xx_time.c
@@ -0,0 +1,374 @@
+/* linux/arch/arm/plat-s3c24xx/s3c24xx_time.c
+ *
+ * Copyright (C) 2012, Romain Naour <romain.naour@openwide.fr>
+ * 
+ * Adapted from linux/arch/arm/plat-samsung/s5p-time.c
+ * 
+ * Copyright (C) 2003-2005 Simtec Electronics
+ *	Ben Dooks, <ben@simtec.co.uk>
+ *
+ * Copyright (C) 2006, 2007 Sebastian Smolorz <ssmolorz@emlix.com>, emlix GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include <linux/sched.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/platform_device.h>
+
+#include <asm/mach/time.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <asm/sched_clock.h>
+#include <asm/mach-types.h>
+
+#include <mach/map.h>
+#include <plat/devs.h>
+#include <plat/regs-timer.h>
+#include <mach/regs-irq.h>
+
+#define S3C24XX_PWM3 3
+#define S3C24XX_PWM4 4
+
+/* Be able to sleep for atleast 4 seconds (usually more) */
+#define S3C24XXTIMER_MIN_RANGE	4
+
+#define TCNT_MAX		0xffff
+#define NON_PERIODIC		0
+#define PERIODIC		1
+
+static struct clk *tin_event;
+static struct clk *tin_source;
+static struct clk *tdiv_event;
+static struct clk *tdiv_source;
+
+static struct clk *timerclk;
+static unsigned long clock_count_per_tick;
+static void s3c24xx_timer_resume(void);
+
+static void s3c24xx_time_stop(unsigned int mode)
+{
+	unsigned long tcon;
+
+	tcon = __raw_readl(S3C2410_TCON);
+
+	switch (mode) {
+	case S3C24XX_PWM3:
+		tcon &= ~S3C2410_TCON_T3START;
+		break;
+
+	case S3C24XX_PWM4:
+		tcon &= ~S3C2410_TCON_T4START;
+		break;
+
+	default:
+		pr_err("Invalid Timer %d\n", mode);
+		break;
+	}
+	__raw_writel(tcon, S3C2410_TCON);
+}
+
+static void s3c24xx_time_start(unsigned int mode, unsigned long tcnt,
+			       bool periodic)
+{
+	unsigned long tcon;
+
+	tcon  = __raw_readl(S3C2410_TCON);
+
+	switch (mode) {
+	case S3C24XX_PWM3:
+
+		__raw_writel(tcnt, S3C2410_TCNTB(S3C24XX_PWM3));
+
+		tcon &= ~(0x0f << 16);
+		tcon |= S3C2410_TCON_T3MANUALUPD;
+
+		/* Manual update */
+		__raw_writel(tcon, S3C2410_TCON);
+
+		tcon |= S3C2410_TCON_T3START;
+		tcon &= ~S3C2410_TCON_T3MANUALUPD;
+
+		if (periodic)
+			tcon |= S3C2410_TCON_T3RELOAD;
+		else
+			tcon &= ~S3C2410_TCON_T3RELOAD;
+		break;
+
+	case S3C24XX_PWM4:
+
+		__raw_writel(tcnt, S3C2410_TCNTB(S3C24XX_PWM4));
+
+		tcon &= ~(0x07 << 20);
+		tcon |= S3C2410_TCON_T4MANUALUPD;
+
+		/* Manual update */
+		__raw_writel(tcon, S3C2410_TCON);
+
+		tcon |= S3C2410_TCON_T4START;
+		tcon &= ~S3C2410_TCON_T4MANUALUPD;
+
+		if (periodic)
+			tcon |= S3C2410_TCON_T4RELOAD;
+		else
+			tcon &= ~S3C2410_TCON_T4RELOAD;
+		break;
+
+	default:
+		pr_err("Invalid Timer %d\n", mode);
+	break;
+	}
+
+	/* Start timers.*/
+	__raw_writel(tcon, S3C2410_TCON);
+}
+
+static int s3c24xx_set_next_event(unsigned long cycles,
+				struct clock_event_device *evt)
+{
+	s3c24xx_time_start(S3C24XX_PWM4, cycles, NON_PERIODIC);
+	return 0;
+}
+
+static void s3c24xx_set_mode(enum clock_event_mode mode,
+				struct clock_event_device *evt)
+{
+	/* Disable timer */
+	s3c24xx_time_stop(S3C24XX_PWM4);
+
+	switch (mode) {
+	case CLOCK_EVT_MODE_PERIODIC:
+		/* Enable the timer and start the periodic tick */
+		s3c24xx_time_start(S3C24XX_PWM4, clock_count_per_tick,
+				   PERIODIC);
+		break;
+
+	case CLOCK_EVT_MODE_ONESHOT:
+		/* Leave the timer disabled, .set_next_event will enable it */
+		break;
+
+	case CLOCK_EVT_MODE_UNUSED:
+	case CLOCK_EVT_MODE_SHUTDOWN:
+		break;
+
+	case CLOCK_EVT_MODE_RESUME:
+		s3c24xx_timer_resume();
+		break;
+	default:
+		/* Just leave in disabled state */
+	break;
+	}
+}
+
+static void s3c24xx_timer_resume(void)
+{
+	/* event timer restart */
+	s3c24xx_time_start(S3C24XX_PWM4, clock_count_per_tick, PERIODIC);
+
+	/* source timer restart */
+	s3c24xx_time_start(S3C24XX_PWM3, TCNT_MAX, PERIODIC);
+}
+
+static struct clock_event_device time_event_device = {
+	.name		= "s3c24xx_event_timer",
+	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
+	.rating		= 200,
+	.set_next_event	= s3c24xx_set_next_event,
+	.set_mode	= s3c24xx_set_mode,
+	.irq = IRQ_TIMER4,
+};
+
+static irqreturn_t s3c24xx_clock_event_isr(int irq, void *dev_id)
+{
+	struct clock_event_device *evt = dev_id;
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static struct irqaction s3c24xx_clock_event_irq = {
+	.name		= "s3c24xx_time_irq",
+	.flags		= IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
+	.handler	= s3c24xx_clock_event_isr,
+	.dev_id		= &time_event_device,
+};
+
+static void __init s3c24xx_clockevent_init(void)
+{
+	unsigned long pclk;
+	unsigned long clock_rate;
+	unsigned int irq_number;
+	struct clk *tscaler;
+
+	/* Don't use tclk1 (12MHz) clock for timers (Anubis, Osiris...)
+	* use pclk instead.
+	*/
+
+	/* for the h1940 (and others), we use the pclk from the core
+	* to generate the timer values. since values around 50 to
+	* 70MHz are not values we can directly generate the timer
+	* value from, we need to pre-scale and divide before using it.
+	*/
+
+	pclk = clk_get_rate(timerclk);
+
+	tscaler = clk_get_parent(tdiv_event);
+
+	/* 50.7MHz dividing by 50 give 1MHz
+	*  (1 tick per usec)
+	*/
+
+	clk_set_rate(tscaler, pclk / 25);
+	clk_set_rate(tdiv_event, pclk / 50);
+
+	clk_set_parent(tin_event, tdiv_event);
+
+	clock_rate = clk_get_rate(tin_event);
+	clock_count_per_tick = clock_rate / HZ;
+
+	clockevents_calc_mult_shift(&time_event_device,
+				    clock_rate, S3C24XXTIMER_MIN_RANGE);
+	time_event_device.max_delta_ns =
+		clockevent_delta2ns(0xffff, &time_event_device);
+	time_event_device.min_delta_ns =
+		clockevent_delta2ns(0x1, &time_event_device);
+
+	time_event_device.cpumask = cpumask_of(0);
+
+	clockevents_register_device(&time_event_device);
+
+	pr_info("S3C244X: tin_event(%d) %ld.%03ld MHz\n", S3C24XX_PWM4,
+		       clock_rate / 1000000, (clock_rate % 1000000) / 1000);
+
+	irq_number = S3C24XX_PWM4 + IRQ_TIMER0;
+
+	setup_irq(irq_number, &s3c24xx_clock_event_irq);
+}
+
+/*
+ * Override the global weak sched_clock symbol with this
+ * local implementation which uses the clocksource to get some
+ * better resolution when scheduling the kernel. We accept that
+ * this wraps around for now, since it is just a relative time
+ * stamp. (Inspired by U300 implementation.)
+ */
+static u32 notrace s3c24xx_read_sched_clock(void)
+{
+	void __iomem *reg = S3C2410_TCNTO(S3C24XX_PWM3);
+
+	if (!reg)
+		return 0;
+
+	return ~__raw_readl(reg);
+}
+
+static void __init s3c24xx_clocksource_init(void)
+{
+	unsigned long pclk;
+	unsigned long clock_rate;
+	unsigned long intmask;
+	void __iomem *reg = S3C2410_TCNTO(S3C24XX_PWM3);
+	struct clk *tscaler;
+
+	pclk = clk_get_rate(timerclk);
+
+	tscaler = clk_get_parent(tdiv_source);
+
+	/* 50.7MHz dividing by 50 give 1MHz
+	*  (1 tick per usec) => timer wrap every 64,7usec
+	*/
+
+	clk_set_rate(tscaler, pclk / 25);
+	clk_set_rate(tdiv_event, pclk / 50);
+
+	clk_set_parent(tin_source, tdiv_source);
+
+	clock_rate = clk_get_rate(tin_source);
+
+	s3c24xx_time_start(S3C24XX_PWM3, TCNT_MAX, PERIODIC);
+
+	__raw_writel(0xffff, S3C2410_TCMPB(S3C24XX_PWM3));
+
+	/* Mask timer3 interrupt. */
+	intmask = __raw_readl(S3C2410_INTMSK);
+	intmask |= 1UL << (IRQ_TIMER3 - IRQ_EINT0);
+	__raw_writel(intmask, S3C2410_INTMSK);
+
+	pr_info("S3C244X: tin_source(%d) %ld.%03ld MHz\n", S3C24XX_PWM3,
+		       clock_rate / 1000000, (clock_rate % 1000000) / 1000);
+
+	setup_sched_clock(s3c24xx_read_sched_clock, 16, clock_rate);
+
+	if (clocksource_mmio_init(reg, "s3c24xx_clocksource_timer",
+			clock_rate, 200, 16, clocksource_mmio_readl_down))
+		panic("s3c24xx_clocksource_timer: can't register clocksource\n");
+}
+
+static void __init s3c24xx_timer_resources(void)
+{
+	char devname[15];
+
+	s3c_device_timer[S3C24XX_PWM4].dev.bus = &platform_bus_type;
+	s3c_device_timer[S3C24XX_PWM3].dev.bus = &platform_bus_type;
+
+	timerclk = clk_get(NULL, "timers");
+	if (IS_ERR(timerclk))
+		panic("failed to get clock for system timer");
+
+	clk_enable(timerclk);
+
+	sprintf(devname, "s3c24xx-pwm.%d", S3C24XX_PWM4);
+	s3c_device_timer[S3C24XX_PWM4].id = S3C24XX_PWM4;
+	s3c_device_timer[S3C24XX_PWM4].dev.init_name = devname;
+
+	tin_event = clk_get(&s3c_device_timer[S3C24XX_PWM4].dev, "pwm-tin");
+	if (IS_ERR(tin_event))
+		panic("failed to get pwm-tin clock for event timer");
+
+	tdiv_event = clk_get(&s3c_device_timer[S3C24XX_PWM4].dev, "pwm-tdiv");
+	if (IS_ERR(tdiv_event))
+		panic("failed to get pwm-tdiv clock for event timer");
+
+	sprintf(devname, "s3c24xx-pwm.%d", S3C24XX_PWM3);
+	s3c_device_timer[S3C24XX_PWM3].id = S3C24XX_PWM3;
+	s3c_device_timer[S3C24XX_PWM3].dev.init_name = devname;
+
+	tin_source = clk_get(&s3c_device_timer[S3C24XX_PWM3].dev, "pwm-tin");
+	if (IS_ERR(tin_source))
+		panic("failed to get pwm-tin clock for source timer");
+
+	tdiv_source = clk_get(&s3c_device_timer[S3C24XX_PWM3].dev, "pwm-tdiv");
+	if (IS_ERR(tdiv_source))
+		panic("failed to get pwm-tdiv clock for source timer");
+
+	clk_enable(tin_event);
+	clk_enable(tin_source);
+}
+
+static void __init s3c24xx_timer_init(void)
+{
+	s3c24xx_timer_resources();
+	s3c24xx_clocksource_init();
+	s3c24xx_clockevent_init();
+}
+
+struct sys_timer s3c24xx_timer = {
+	.init		= s3c24xx_timer_init,
+};
-- 
1.8.0

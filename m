From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: [PATCH v1 2/2] clocksource: mct: cleanup, remove non-dt stuff from mct
Date: Thu, 13 Feb 2014 12:08:43 +0900
Message-ID: <1392260923-31659-3-git-send-email-t.dakhran@samsung.com>
References: <1392260923-31659-1-git-send-email-t.dakhran@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44188 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbaBMDLd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 22:11:33 -0500
In-reply-to: <1392260923-31659-1-git-send-email-t.dakhran@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tarek Dakhran <t.dakhran@gmail.com>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@samsung.com>

mct_init not used anywhere, remove this non-dt stuff.
also remove declaration of mct_init
in arch/arm/mach-exynos/common.h

Signed-off-by: Tarek Dakhran <t.dakhran@samsung.com>
---
 arch/arm/mach-exynos/common.h    |    2 --
 drivers/clocksource/exynos_mct.c |   17 +----------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index f76967b..8945170 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -15,8 +15,6 @@
 #include <linux/reboot.h>
 #include <linux/of.h>
 
-void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
-
 struct map_desc;
 void exynos_init_io(void);
 void exynos4_restart(enum reboot_mode mode, const char *cmd);
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 1cde3de..a94a908 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -548,18 +548,6 @@ out_irq:
 	free_percpu_irq(mct_irqs[MCT_L0_IRQ], &percpu_mct_tick);
 }
 
-void __init mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1)
-{
-	mct_irqs[MCT_G0_IRQ] = irq_g0;
-	mct_irqs[MCT_L0_IRQ] = irq_l0;
-	mct_irqs[MCT_L1_IRQ] = irq_l1;
-	mct_int_type = MCT_INT_SPI;
-
-	exynos4_timer_resources(NULL, base);
-	exynos4_clocksource_init();
-	exynos4_clockevent_init();
-}
-
 static void __init mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	u32 nr_irqs, i;
@@ -574,11 +562,8 @@ static void __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	 * timer irqs are specified after the four global timer
 	 * irqs are specified.
 	 */
-#ifdef CONFIG_OF
 	nr_irqs = of_irq_count(np);
-#else
-	nr_irqs = 0;
-#endif
+
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
 		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
-- 
1.7.10.4

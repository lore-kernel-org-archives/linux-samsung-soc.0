From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 12/12] ARM: exynos: Allow wake-up using GIC interrupts
Date: Thu, 06 Feb 2014 20:12:57 +0100
Message-ID: <1391713977-22300-13-git-send-email-t.figa@samsung.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756785AbaBFTNP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 14:13:15 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00IR19DYXJA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 19:13:10 +0000 (GMT)
In-reply-to: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch restores the ability to receive wake-up events from internal
GIC interrupts, e.g. RTC tick or alarm interrupts.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/pm.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index ada1c83..15af0ce 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -17,6 +17,7 @@
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/io.h>
+#include <linux/irqchip/arm-gic.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 
@@ -35,6 +36,16 @@
 #include "common.h"
 #include "regs-pmu.h"
 
+/**
+ * struct exynos_wkup_irq - Exynos GIC to PMU IRQ mapping
+ * @hwirq: Hardware IRQ signal of the GIC
+ * @mask: Mask in PMU wake-up mask register
+ */
+struct exynos_wkup_irq {
+	unsigned int hwirq;
+	u32 mask;
+};
+
 static struct sleep_save exynos5_sys_save[] = {
 	SAVE_ITEM(EXYNOS5_SYS_I2C_CFG),
 };
@@ -48,8 +59,47 @@ static struct sleep_save exynos_core_save[] = {
 	SAVE_ITEM(S5P_SROM_BC3),
 };
 
+/*
+ * GIC wake-up support
+ */
+
 static u32 exynos_irqwake_intmask = 0xffffffff;
 
+static const struct exynos_wkup_irq exynos4_wkup_irq[] = {
+	{ 76, BIT(1) }, /* RTC alarm */
+	{ 77, BIT(2) }, /* RTC tick */
+	{ /* sentinel */ },
+};
+
+static const struct exynos_wkup_irq exynos5250_wkup_irq[] = {
+	{ 75, BIT(1) }, /* RTC alarm */
+	{ 76, BIT(2) }, /* RTC tick */
+	{ /* sentinel */ },
+};
+
+static int exynos_irq_set_wake(struct irq_data *data, unsigned int state)
+{
+	const struct exynos_wkup_irq *wkup_irq;
+
+	if (soc_is_exynos5250())
+		wkup_irq = exynos5250_wkup_irq;
+	else
+		wkup_irq = exynos4_wkup_irq;
+
+	while (wkup_irq->mask) {
+		if (wkup_irq->hwirq == data->hwirq) {
+			if (!state)
+				exynos_irqwake_intmask |= wkup_irq->mask;
+			else
+				exynos_irqwake_intmask &= ~wkup_irq->mask;
+			return 0;
+		}
+		++wkup_irq;
+	}
+
+	return -ENOENT;
+}
+
 /* For Cortex-A9 Diagnostic and Power control register */
 static unsigned int save_arm_register[2];
 
@@ -258,6 +308,9 @@ void __init exynos_pm_init(void)
 {
 	u32 tmp;
 
+	/* Platform-specific GIC callback */
+	gic_arch_extn.irq_set_wake = exynos_irq_set_wake;
+
 	/* All wakeup disable */
 	tmp = __raw_readl(S5P_WAKEUP_MASK);
 	tmp |= ((0xFF << 8) | (0x1F << 1));
-- 
1.8.5.2

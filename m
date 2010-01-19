From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 04/10] ARM: S5PV210: Add Timer support
Date: Tue, 19 Jan 2010 11:27:47 +0900
Message-ID: <1263868067-30746-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45635 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752422Ab0ASCfQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 21:35:16 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds timer support for S5PV210. S5PV210 uses the PWM timer
for the system clock ticks and so S5PV210 reuses the s3c implementation
of the timer. This patch adds support definitions required by the s3c
timer implementation.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/pwm-clock.h |   67 ++++++++++++++++++++++++
 arch/arm/mach-s5pv210/include/mach/tick.h      |   24 +++++++++
 2 files changed, 91 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/include/mach/pwm-clock.h
 create mode 100644 arch/arm/mach-s5pv210/include/mach/tick.h

diff --git a/arch/arm/mach-s5pv210/include/mach/pwm-clock.h b/arch/arm/mach-s5pv210/include/mach/pwm-clock.h
new file mode 100644
index 0000000..4781f2f
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/pwm-clock.h
@@ -0,0 +1,67 @@
+/* linux/arch/arm/mach-s5pv210/include/mach/pwm-clock.h
+ *
+ * Copyright 2008 Simtec Electronics
+ *      Ben Dooks <ben@simtec.co.uk>
+ *      http://armlinux.simtec.co.uk/
+ *
+ * Copyright 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5PV210 - pwm clock and timer support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_PWMCLK_H
+#define __ASM_ARCH_PWMCLK_H __FILE__
+
+/**
+ * pwm_cfg_src_is_tclk() - return whether the given mux config is a tclk
+ * @cfg: The timer TCFG1 register bits shifted down to 0.
+ *
+ * Return true if the given configuration from TCFG1 is a TCLK instead
+ * any of the TDIV clocks.
+ */
+static inline int pwm_cfg_src_is_tclk(unsigned long tcfg)
+{
+	return tcfg == S3C2410_TCFG1_MUX_TCLK;
+}
+
+/**
+ * tcfg_to_divisor() - convert tcfg1 setting to a divisor
+ * @tcfg1: The tcfg1 setting, shifted down.
+ *
+ * Get the divisor value for the given tcfg1 setting. We assume the
+ * caller has already checked to see if this is not a TCLK source.
+ */
+static inline unsigned long tcfg_to_divisor(unsigned long tcfg1)
+{
+	return 1 << (1 + tcfg1);
+}
+
+/**
+ * pwm_tdiv_has_div1() - does the tdiv setting have a /1
+ *
+ * Return true if we have a /1 in the tdiv setting.
+ */
+static inline unsigned int pwm_tdiv_has_div1(void)
+{
+	return 0;
+}
+
+/**
+ * pwm_tdiv_div_bits() - calculate TCFG1 divisor value.
+ * @div: The divisor to calculate the bit information for.
+ *
+ * Turn a divisor into the necessary bit field for TCFG1.
+ */
+static inline unsigned long pwm_tdiv_div_bits(unsigned int div)
+{
+	return ilog2(div) - 1;
+}
+
+#define S3C_TCFG1_MUX_TCLK S3C2410_TCFG1_MUX_TCLK
+
+#endif /* __ASM_ARCH_PWMCLK_H */
diff --git a/arch/arm/mach-s5pv210/include/mach/tick.h b/arch/arm/mach-s5pv210/include/mach/tick.h
new file mode 100644
index 0000000..6abcb6a
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/tick.h
@@ -0,0 +1,24 @@
+/* linux/arch/arm/mach-s5pv210/include/mach/tick.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5PV210 - Timer tick support definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_TICK_H
+#define __ASM_ARCH_TICK_H __FILE__
+
+static inline u32 s3c24xx_ostimer_pending(void)
+{
+	u32 pend = __raw_readl(S5P_VA_VIC0 + VIC_RAW_STATUS);
+	return pend & (1 << (IRQ_TIMER4_VIC - S5P_IRQ_VIC0(0)));
+}
+
+#define TICK_MAX	(0xffffffff)
+
+#endif /* __ASM_ARCH_TICK_H */
-- 
1.6.2.5

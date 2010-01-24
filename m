From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/6] ARM: S5P6442: Add IRQ support
Date: Mon, 25 Jan 2010 08:54:06 +0900
Message-ID: <1264377246-9202-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48345 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754000Ab0AYABa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 19:01:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds IRQ support for S5P6442. This patch adds interrupt
register definitions, IRQ definitions for various interrupt sources
and new VIC base for VIC2 in irq code.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/irqs.h     |  103 +++++++++++++++++++++++++
 arch/arm/mach-s5p6442/include/mach/regs-irq.h |   19 +++++
 arch/arm/plat-s5p/include/plat/irqs.h         |    4 +-
 3 files changed, 125 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-s5p6442/include/mach/irqs.h
 create mode 100644 arch/arm/mach-s5p6442/include/mach/regs-irq.h

diff --git a/arch/arm/mach-s5p6442/include/mach/irqs.h b/arch/arm/mach-s5p6442/include/mach/irqs.h
new file mode 100644
index 0000000..2c7c39a
--- /dev/null
+++ b/arch/arm/mach-s5p6442/include/mach/irqs.h
@@ -0,0 +1,103 @@
+/* linux/arch/arm/mach-s5p6442/include/mach/irqs.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P6442 - IRQ definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_IRQS_H
+#define __ASM_ARCH_IRQS_H __FILE__
+
+#include <plat/irqs.h>
+
+/* VIC0 */
+#define IRQ_EINT0 		S5P_IRQ_VIC0(0)
+#define IRQ_EINT1 		S5P_IRQ_VIC0(1)
+#define IRQ_EINT2 		S5P_IRQ_VIC0(2)
+#define IRQ_EINT3 		S5P_IRQ_VIC0(3)
+#define IRQ_EINT4 		S5P_IRQ_VIC0(4)
+#define IRQ_EINT5 		S5P_IRQ_VIC0(5)
+#define IRQ_EINT6 		S5P_IRQ_VIC0(6)
+#define IRQ_EINT7 		S5P_IRQ_VIC0(7)
+#define IRQ_EINT8 		S5P_IRQ_VIC0(8)
+#define IRQ_EINT9 		S5P_IRQ_VIC0(9)
+#define IRQ_EINT10 		S5P_IRQ_VIC0(10)
+#define IRQ_EINT11 		S5P_IRQ_VIC0(11)
+#define IRQ_EINT12 		S5P_IRQ_VIC0(12)
+#define IRQ_EINT13 		S5P_IRQ_VIC0(13)
+#define IRQ_EINT14 		S5P_IRQ_VIC0(14)
+#define IRQ_EINT15 		S5P_IRQ_VIC0(15)
+#define IRQ_EINT16_31 		S5P_IRQ_VIC0(16)
+#define IRQ_BATF 		S5P_IRQ_VIC0(17)
+#define IRQ_MDMA 		S5P_IRQ_VIC0(18)
+#define IRQ_PDMA 		S5P_IRQ_VIC0(19)
+#define IRQ_TIMER0_VIC		S5P_IRQ_VIC0(21)
+#define IRQ_TIMER1_VIC		S5P_IRQ_VIC0(22)
+#define IRQ_TIMER2_VIC		S5P_IRQ_VIC0(23)
+#define IRQ_TIMER3_VIC		S5P_IRQ_VIC0(24)
+#define IRQ_TIMER4_VIC		S5P_IRQ_VIC0(25)
+#define IRQ_SYSTIMER		S5P_IRQ_VIC0(26)
+#define IRQ_WDT			S5P_IRQ_VIC0(27)
+#define IRQ_RTC_ALARM		S5P_IRQ_VIC0(28)
+#define IRQ_RTC_TIC		S5P_IRQ_VIC0(29)
+#define IRQ_GPIOINT		S5P_IRQ_VIC0(30)
+
+/* VIC1 */
+#define IRQ_nPMUIRQ 		S5P_IRQ_VIC1(0)
+#define IRQ_ONENAND 		S5P_IRQ_VIC1(7)
+#define IRQ_UART0 		S5P_IRQ_VIC1(10)
+#define IRQ_UART1 		S5P_IRQ_VIC1(11)
+#define IRQ_UART2 		S5P_IRQ_VIC1(12)
+#define IRQ_SPI0 		S5P_IRQ_VIC1(15)
+#define IRQ_IIC 		S5P_IRQ_VIC1(19)
+#define IRQ_IIC1 		S5P_IRQ_VIC1(20)
+#define IRQ_IIC2 		S5P_IRQ_VIC1(21)
+#define IRQ_OTG 		S5P_IRQ_VIC1(24)
+#define IRQ_MSM 		S5P_IRQ_VIC1(25)
+#define IRQ_HSMMC0 		S5P_IRQ_VIC1(26)
+#define IRQ_HSMMC1 		S5P_IRQ_VIC1(27)
+#define IRQ_HSMMC2 		S5P_IRQ_VIC1(28)
+#define IRQ_COMMRX 		S5P_IRQ_VIC1(29)
+#define IRQ_COMMTX 		S5P_IRQ_VIC1(30)
+
+/* VIC2 */
+#define IRQ_LCD0 		S5P_IRQ_VIC2(0)
+#define IRQ_LCD1 		S5P_IRQ_VIC2(1)
+#define IRQ_LCD2 		S5P_IRQ_VIC2(2)
+#define IRQ_LCD3 		S5P_IRQ_VIC2(3)
+#define IRQ_ROTATOR 		S5P_IRQ_VIC2(4)
+#define IRQ_FIMC0 		S5P_IRQ_VIC2(5)
+#define IRQ_FIMC1 		S5P_IRQ_VIC2(6)
+#define IRQ_FIMC2 		S5P_IRQ_VIC2(7)
+#define IRQ_JPEG 		S5P_IRQ_VIC2(8)
+#define IRQ_3D 			S5P_IRQ_VIC2(10)
+#define IRQ_Mixer 		S5P_IRQ_VIC2(11)
+#define IRQ_MFC 		S5P_IRQ_VIC2(14)
+#define IRQ_TVENC 		S5P_IRQ_VIC2(15)
+#define IRQ_I2S0 		S5P_IRQ_VIC2(16)
+#define IRQ_I2S1 		S5P_IRQ_VIC2(17)
+#define IRQ_RP 			S5P_IRQ_VIC2(19)
+#define IRQ_PCM0 		S5P_IRQ_VIC2(20)
+#define IRQ_PCM1 		S5P_IRQ_VIC2(21)
+#define IRQ_ADC 		S5P_IRQ_VIC2(23)
+#define IRQ_PENDN 		S5P_IRQ_VIC2(24)
+#define IRQ_KEYPAD 		S5P_IRQ_VIC2(25)
+#define IRQ_SSS_INT 		S5P_IRQ_VIC2(27)
+#define IRQ_SSS_HASH 		S5P_IRQ_VIC2(28)
+#define IRQ_VIC_END 		S5P_IRQ_VIC2(31)
+
+#define S5P_IRQ_EINT_BASE	(IRQ_VIC_END + 1)
+
+#define S5P_EINT(x)		((x) + S5P_IRQ_EINT_BASE)
+#define IRQ_EINT(x)		S5P_EINT(x)
+
+/* Set the default NR_IRQS */
+
+#define NR_IRQS 		(IRQ_EINT(31) + 1)
+
+#endif /* __ASM_ARCH_IRQS_H */
diff --git a/arch/arm/mach-s5p6442/include/mach/regs-irq.h b/arch/arm/mach-s5p6442/include/mach/regs-irq.h
new file mode 100644
index 0000000..73782b5
--- /dev/null
+++ b/arch/arm/mach-s5p6442/include/mach/regs-irq.h
@@ -0,0 +1,19 @@
+/* linux/arch/arm/mach-s5p6442/include/mach/regs-irq.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5P6442 - IRQ register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_REGS_IRQ_H
+#define __ASM_ARCH_REGS_IRQ_H __FILE__
+
+#include <asm/hardware/vic.h>
+#include <mach/map.h>
+
+#endif /* __ASM_ARCH_REGS_IRQ_H */
diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-s5p/include/plat/irqs.h
index 5d7937d..087902d 100644
--- a/arch/arm/plat-s5p/include/plat/irqs.h
+++ b/arch/arm/plat-s5p/include/plat/irqs.h
@@ -28,6 +28,7 @@
 
 #define S5P_VIC0_BASE		S5P_IRQ(0)
 #define S5P_VIC1_BASE		S5P_IRQ(32)
+#define S5P_VIC2_BASE		S5P_IRQ(64)
 
 #define IRQ_VIC0_BASE		S5P_VIC0_BASE
 #define IRQ_VIC1_BASE		S5P_VIC1_BASE
@@ -71,8 +72,9 @@
 
 #define S5P_IRQ_VIC0(x)		(S5P_VIC0_BASE + (x))
 #define S5P_IRQ_VIC1(x)		(S5P_VIC1_BASE + (x))
+#define S5P_IRQ_VIC2(x)		(S5P_VIC2_BASE + (x))
 
-#define S5P_TIMER_IRQ(x)	S5P_IRQ(64 + (x))
+#define S5P_TIMER_IRQ(x)	S5P_IRQ(96 + (x))
 
 #define IRQ_TIMER0		S5P_TIMER_IRQ(0)
 #define IRQ_TIMER1		S5P_TIMER_IRQ(1)
-- 
1.6.2.5

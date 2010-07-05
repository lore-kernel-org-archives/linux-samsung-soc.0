From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] ARM: S5P: Add PMU device
Date: Mon, 05 Jul 2010 10:46:51 +0900
Message-ID: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8510 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756080Ab0GEBqx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 21:46:53 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5200BAQAA37O00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Jul 2010 10:46:51 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5200C4CAA3ON@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Jul 2010 10:46:51 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

This patch adds an initcall for the s5p platforms so that they register
their PMU IRQs with the PMU framework in the Kernel.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/irqs.h |    2 +-
 arch/arm/mach-s5pc100/include/mach/irqs.h |    1 +
 arch/arm/mach-s5pv210/include/mach/irqs.h |    1 +
 arch/arm/plat-s5p/Makefile                |    1 +
 arch/arm/plat-s5p/dev-pmu.c               |   37 +++++++++++++++++++++++++++++
 5 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-pmu.c

diff --git a/arch/arm/mach-s5p6442/include/mach/irqs.h b/arch/arm/mach-s5p6442/include/mach/irqs.h
index 02c2374..22173cc 100644
--- a/arch/arm/mach-s5p6442/include/mach/irqs.h
+++ b/arch/arm/mach-s5p6442/include/mach/irqs.h
@@ -32,7 +32,7 @@
 #define IRQ_GPIOINT		S5P_IRQ_VIC0(30)
 
 /* VIC1 */
-#define IRQ_nPMUIRQ 		S5P_IRQ_VIC1(0)
+#define IRQ_PMUIRQ		S5P_IRQ_VIC1(0)
 #define IRQ_ONENAND 		S5P_IRQ_VIC1(7)
 #define IRQ_UART0 		S5P_IRQ_VIC1(10)
 #define IRQ_UART1 		S5P_IRQ_VIC1(11)
diff --git a/arch/arm/mach-s5pc100/include/mach/irqs.h b/arch/arm/mach-s5pc100/include/mach/irqs.h
index 28aa551..9cc1b0d 100644
--- a/arch/arm/mach-s5pc100/include/mach/irqs.h
+++ b/arch/arm/mach-s5pc100/include/mach/irqs.h
@@ -110,5 +110,6 @@
 #define IRQ_LCD_FIFO		IRQ_LCD0
 #define IRQ_LCD_VSYNC		IRQ_LCD1
 #define IRQ_LCD_SYSTEM		IRQ_LCD2
+#define IRQ_PMUIRQ		IRQ_CORTEX0
 
 #endif /* __ASM_ARCH_IRQS_H */
diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-s5pv210/include/mach/irqs.h
index 9689537..3972f8d 100644
--- a/arch/arm/mach-s5pv210/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
@@ -128,5 +128,6 @@
 #define IRQ_LCD_FIFO		IRQ_LCD0
 #define IRQ_LCD_VSYNC		IRQ_LCD1
 #define IRQ_LCD_SYSTEM		IRQ_LCD2
+#define IRQ_PMUIRQ		IRQ_CORTEX0
 
 #endif /* ASM_ARCH_IRQS_H */
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 39c242b..7e34194 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -12,6 +12,7 @@ obj-				:=
 
 # Core files
 
+obj-y				+= dev-pmu.o
 obj-y				+= dev-uart.o
 obj-y				+= cpu.o
 obj-y				+= clock.o
diff --git a/arch/arm/plat-s5p/dev-pmu.c b/arch/arm/plat-s5p/dev-pmu.c
new file mode 100644
index 0000000..de3b118
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-pmu.c
@@ -0,0 +1,37 @@
+/*
+ * linux/arch/arm/plat-s5p/dev-pmu.c
+ *
+ * Copyright (C) 2010 Samsung Electronics Co.Ltd
+ * Author: Joonyoung Shim <jy0922.shim@samsung.com>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <asm/pmu.h>
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+static struct resource s5p_pmu_resource = {
+	.start	= IRQ_PMUIRQ,
+	.end	= IRQ_PMUIRQ,
+	.flags	= IORESOURCE_IRQ,
+};
+
+struct platform_device s5p_device_pmu = {
+	.name		= "arm-pmu",
+	.id		= ARM_PMU_DEVICE_CPU,
+	.num_resources	= 1,
+	.resource	= &s5p_pmu_resource,
+};
+
+static int __init s5p_pmu_init(void)
+{
+	platform_device_register(&s5p_device_pmu);
+	return 0;
+}
+arch_initcall(s5p_pmu_init);
-- 
1.7.0.4

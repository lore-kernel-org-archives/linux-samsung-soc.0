From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 08/17] ARM: S5PC1XX: add cpu idle and system reset support
Date: Tue, 13 Oct 2009 09:57:03 +0200
Message-ID: <1255420632-21116-9-git-send-email-m.szyprowski@samsung.com>
References: <1255420632-21116-1-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-2-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-3-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-4-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-5-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-6-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-7-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11613 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759154AbZJMILT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:11:19 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KRG007V60V25S80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG0051W0V1CO@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
In-reply-to: <1255420632-21116-8-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Add CPU idle support by a call to SoC build-in power management core.
Add system reset support by a simple write to system controll register.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/cpu.c                     |   22 ++++++
 arch/arm/mach-s5pc100/include/mach/system.h     |   15 +++-
 arch/arm/plat-s3c/include/plat/cpu.h            |    6 ++
 arch/arm/plat-s5pc1xx/include/plat/regs-power.h |   84 +++++++++++++++++++++++
 4 files changed, 124 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/plat-s5pc1xx/include/plat/regs-power.h

diff --git a/arch/arm/mach-s5pc100/cpu.c b/arch/arm/mach-s5pc100/cpu.c
index 0e71889..a23ca57 100644
--- a/arch/arm/mach-s5pc100/cpu.c
+++ b/arch/arm/mach-s5pc100/cpu.c
@@ -22,6 +22,8 @@
 #include <linux/serial_core.h>
 #include <linux/platform_device.h>
 
+#include <asm/proc-fns.h>
+
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
@@ -32,6 +34,7 @@
 
 #include <plat/cpu-freq.h>
 #include <plat/regs-serial.h>
+#include <plat/regs-power.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
@@ -45,6 +48,23 @@
 static struct map_desc s5pc100_iodesc[] __initdata = {
 };
 
+static void s5pc100_idle(void)
+{
+	unsigned long tmp;
+
+	tmp = __raw_readl(S5PC100_PWR_CFG);
+	tmp &= ~S5PC100_PWRCFG_CFG_DEEP_IDLE;
+	tmp &= ~S5PC100_PWRCFG_CFG_WFI_MASK;
+	tmp |= S5PC100_PWRCFG_CFG_WFI_DEEP_IDLE;
+	__raw_writel(tmp, S5PC100_PWR_CFG);
+
+	tmp = __raw_readl(S5PC100_OTHERS);
+	tmp |= S5PC100_PMU_INT_DISABLE;
+	__raw_writel(tmp, S5PC100_OTHERS);
+
+	cpu_do_idle();
+}
+
 /* s5pc100_map_io
  *
  * register the standard cpu IO areas
@@ -93,5 +113,7 @@ int __init s5pc100_init(void)
 {
 	printk(KERN_DEBUG "S5PC100: Initialising architecture\n");
 
+	s5pc1xx_idle = s5pc100_idle;
+
 	return sysdev_register(&s5pc100_sysdev);
 }
diff --git a/arch/arm/mach-s5pc100/include/mach/system.h b/arch/arm/mach-s5pc100/include/mach/system.h
index e390143..07f0907 100644
--- a/arch/arm/mach-s5pc100/include/mach/system.h
+++ b/arch/arm/mach-s5pc100/include/mach/system.h
@@ -11,14 +11,23 @@
 #ifndef __ASM_ARCH_SYSTEM_H
 #define __ASM_ARCH_SYSTEM_H __FILE__
 
+#include <linux/io.h>
+#include <mach/map.h>
+
+void (*s5pc1xx_idle)(void);
+
 static void arch_idle(void)
 {
-	/* nothing here yet */
+	if (s5pc1xx_idle)
+		s5pc1xx_idle();
 }
 
 static void arch_reset(char mode, const char *cmd)
 {
-	/* nothing here yet */
-}
+	unsigned long reset;
 
+	reset = 0xc100;
+	__raw_writel(reset, S5PC1XX_VA_CLK_OTHER);
+	return;
+}
 #endif /* __ASM_ARCH_IRQ_H */
diff --git a/arch/arm/plat-s3c/include/plat/cpu.h b/arch/arm/plat-s3c/include/plat/cpu.h
index fbc3d49..d1131ca 100644
--- a/arch/arm/plat-s3c/include/plat/cpu.h
+++ b/arch/arm/plat-s3c/include/plat/cpu.h
@@ -12,6 +12,9 @@
 
 /* todo - fix when rmk changes iodescs to use `void __iomem *` */
 
+#ifndef __SAMSUNG_PLAT_CPU_H
+#define __SAMSUNG_PLAT_CPU_H
+
 #define IODESC_ENT(x) { (unsigned long)S3C24XX_VA_##x, __phys_to_pfn(S3C24XX_PA_##x), S3C24XX_SZ_##x, MT_DEVICE }
 
 #ifndef MHZ
@@ -73,3 +76,6 @@ extern struct sysdev_class s3c2443_sysclass;
 extern struct sysdev_class s3c6410_sysclass;
 extern struct sysdev_class s3c64xx_sysclass;
 
+extern void (*s5pc1xx_idle)(void);
+
+#endif
diff --git a/arch/arm/plat-s5pc1xx/include/plat/regs-power.h b/arch/arm/plat-s5pc1xx/include/plat/regs-power.h
new file mode 100644
index 0000000..02ffa49
--- /dev/null
+++ b/arch/arm/plat-s5pc1xx/include/plat/regs-power.h
@@ -0,0 +1,84 @@
+/* arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
+ *
+ * Copyright 2009 Samsung Electronics Co.
+ *	Jongse Won <jongse.won@samsung.com>
+ *
+ * S5PC1XX clock register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARM_REGS_PWR
+#define __ASM_ARM_REGS_PWR __FILE__
+
+#define S5PC1XX_PWRREG(x)			(S5PC1XX_VA_PWR + (x))
+
+/* s5pc100 (0xE0108000) register for power management */
+#define S5PC100_PWR_CFG				S5PC1XX_PWRREG(0x0)
+#define S5PC100_EINT_WAKEUP_MASK		S5PC1XX_PWRREG(0x4)
+#define S5PC100_NORMAL_CFG			S5PC1XX_PWRREG(0x10)
+#define S5PC100_STOP_CFG			S5PC1XX_PWRREG(0x14)
+#define S5PC100_SLEEP_CFG			S5PC1XX_PWRREG(0x18)
+#define S5PC100_STOP_MEM_CFG			S5PC1XX_PWRREG(0x1C)
+#define S5PC100_OSC_FREQ			S5PC1XX_PWRREG(0x100)
+#define S5PC100_OSC_STABLE			S5PC1XX_PWRREG(0x104)
+#define S5PC100_PWR_STABLE			S5PC1XX_PWRREG(0x108)
+#define S5PC100_MTC_STABLE			S5PC1XX_PWRREG(0x110)
+#define S5PC100_CLAMP_STABLE			S5PC1XX_PWRREG(0x114)
+#define S5PC100_OTHERS				S5PC1XX_PWRREG(0x200)
+#define S5PC100_RST_STAT			S5PC1XX_PWRREG(0x300)
+#define S5PC100_WAKEUP_STAT			S5PC1XX_PWRREG(0x304)
+#define S5PC100_BLK_PWR_STAT			S5PC1XX_PWRREG(0x308)
+#define S5PC100_INFORM0				S5PC1XX_PWRREG(0x400)
+#define S5PC100_INFORM1				S5PC1XX_PWRREG(0x404)
+#define S5PC100_INFORM2				S5PC1XX_PWRREG(0x408)
+#define S5PC100_INFORM3				S5PC1XX_PWRREG(0x40C)
+#define S5PC100_INFORM4				S5PC1XX_PWRREG(0x410)
+#define S5PC100_INFORM5				S5PC1XX_PWRREG(0x414)
+#define S5PC100_INFORM6				S5PC1XX_PWRREG(0x418)
+#define S5PC100_INFORM7				S5PC1XX_PWRREG(0x41C)
+#define S5PC100_DCGIDX_MAP0			S5PC1XX_PWRREG(0x500)
+#define S5PC100_DCGIDX_MAP1			S5PC1XX_PWRREG(0x504)
+#define S5PC100_DCGIDX_MAP2			S5PC1XX_PWRREG(0x508)
+#define S5PC100_DCGPERF_MAP0			S5PC1XX_PWRREG(0x50C)
+#define S5PC100_DCGPERF_MAP1			S5PC1XX_PWRREG(0x510)
+#define S5PC100_DVCIDX_MAP			S5PC1XX_PWRREG(0x514)
+#define S5PC100_FREQ_CPU			S5PC1XX_PWRREG(0x518)
+#define S5PC100_FREQ_DPM			S5PC1XX_PWRREG(0x51C)
+#define S5PC100_DVSEMCLK_EN			S5PC1XX_PWRREG(0x520)
+#define S5PC100_APLL_CON_L8			S5PC1XX_PWRREG(0x600)
+#define S5PC100_APLL_CON_L7			S5PC1XX_PWRREG(0x604)
+#define S5PC100_APLL_CON_L6			S5PC1XX_PWRREG(0x608)
+#define S5PC100_APLL_CON_L5			S5PC1XX_PWRREG(0x60C)
+#define S5PC100_APLL_CON_L4			S5PC1XX_PWRREG(0x610)
+#define S5PC100_APLL_CON_L3			S5PC1XX_PWRREG(0x614)
+#define S5PC100_APLL_CON_L2			S5PC1XX_PWRREG(0x618)
+#define S5PC100_APLL_CON_L1			S5PC1XX_PWRREG(0x61C)
+#define S5PC100_IEM_CONTROL			S5PC1XX_PWRREG(0x620)
+#define S5PC100_CLKDIV_IEM_L8			S5PC1XX_PWRREG(0x700)
+#define S5PC100_CLKDIV_IEM_L7			S5PC1XX_PWRREG(0x704)
+#define S5PC100_CLKDIV_IEM_L6			S5PC1XX_PWRREG(0x708)
+#define S5PC100_CLKDIV_IEM_L5			S5PC1XX_PWRREG(0x70C)
+#define S5PC100_CLKDIV_IEM_L4			S5PC1XX_PWRREG(0x710)
+#define S5PC100_CLKDIV_IEM_L3			S5PC1XX_PWRREG(0x714)
+#define S5PC100_CLKDIV_IEM_L2			S5PC1XX_PWRREG(0x718)
+#define S5PC100_CLKDIV_IEM_L1			S5PC1XX_PWRREG(0x71C)
+#define S5PC100_IEM_HPMCLK_DIV			S5PC1XX_PWRREG(0x724)
+
+/* PWR_CFG */
+#define S5PC100_PWRCFG_CFG_DEEP_IDLE		(1 << 31)
+#define S5PC100_PWRCFG_CFG_WFI_MASK		(3 << 5)
+#define S5PC100_PWRCFG_CFG_WFI_IDLE		(0 << 5)
+#define S5PC100_PWRCFG_CFG_WFI_DEEP_IDLE	(1 << 5)
+#define S5PC100_PWRCFG_CFG_WFI_STOP		(2 << 5)
+#define S5PC100_PWRCFG_CFG_WFI_SLEEP		(3 << 5)
+
+/* SLEEP_CFG */
+#define S5PC100_SLEEP_OSC_EN_SLEEP		(1 << 0)
+
+/* OTHERS */
+#define S5PC100_PMU_INT_DISABLE			(1 << 24)
+
+#endif /* __ASM_ARM_REGS_PWR */
-- 
1.6.4

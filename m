From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV310: Cleanup System MMU
Date: Tue,  1 Feb 2011 15:55:01 +0900
Message-ID: <1296543301-25259-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54331 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab1BAHVj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Feb 2011 02:21:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch cleans following up.
- Moved definition of System MMU IPNUM into mach/sysmmu.h
- Removed useless SYSMMU_DEBUG configuration
- Removed useless header file plat/sysmmu.h

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/map.h    |    2 --
 arch/arm/mach-s5pv310/include/mach/sysmmu.h |    5 ++++-
 arch/arm/plat-s5p/Kconfig                   |   24 ++++++++----------------
 arch/arm/plat-s5p/Makefile                  |    2 +-
 arch/arm/plat-s5p/include/plat/sysmmu.h     |   23 -----------------------
 arch/arm/plat-s5p/sysmmu.c                  |    4 +---
 6 files changed, 14 insertions(+), 46 deletions(-)
 delete mode 100644 arch/arm/plat-s5p/include/plat/sysmmu.h

diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 74d4006..3060f78 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -124,8 +124,6 @@
 #define S5PV310_PA_SYSMMU_TV		0x12E20000
 #define S5PV310_PA_SYSMMU_MFC_L		0x13620000
 #define S5PV310_PA_SYSMMU_MFC_R		0x13630000
-#define S5PV310_SYSMMU_TOTAL_IPNUM	16
-#define S5P_SYSMMU_TOTAL_IPNUM		S5PV310_SYSMMU_TOTAL_IPNUM
 
 /* compatibiltiy defines. */
 #define S3C_PA_UART			S5PV310_PA_UART
diff --git a/arch/arm/mach-s5pv310/include/mach/sysmmu.h b/arch/arm/mach-s5pv310/include/mach/sysmmu.h
index 662fe85..598fc5c 100644
--- a/arch/arm/mach-s5pv310/include/mach/sysmmu.h
+++ b/arch/arm/mach-s5pv310/include/mach/sysmmu.h
@@ -13,6 +13,9 @@
 #ifndef __ASM_ARM_ARCH_SYSMMU_H
 #define __ASM_ARM_ARCH_SYSMMU_H __FILE__
 
+#define S5PV310_SYSMMU_TOTAL_IPNUM	16
+#define S5P_SYSMMU_TOTAL_IPNUM		S5PV310_SYSMMU_TOTAL_IPNUM
+
 enum s5pv310_sysmmu_ips {
 	SYSMMU_MDMA,
 	SYSMMU_SSS,
@@ -32,7 +35,7 @@ enum s5pv310_sysmmu_ips {
 	SYSMMU_MFC_R,
 };
 
-static char *sysmmu_ips_name[S5P_SYSMMU_TOTAL_IPNUM] = {
+static char *sysmmu_ips_name[S5PV310_SYSMMU_TOTAL_IPNUM] = {
 	"SYSMMU_MDMA"	,
 	"SYSMMU_SSS"	,
 	"SYSMMU_FIMC0"	,
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index deb3995..557f8c5 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -37,6 +37,14 @@ config S5P_GPIO_INT
 	help
 	  Common code for the GPIO interrupts (other than external interrupts.)
 
+comment "System MMU"
+
+config S5P_SYSTEM_MMU
+	bool "S5P SYSTEM MMU"
+	depends on ARCH_S5PV310
+	help
+	  Say Y here if you want to enable System MMU
+
 config S5P_DEV_FIMC0
 	bool
 	help
@@ -66,19 +74,3 @@ config S5P_DEV_CSIS1
 	bool
 	help
 	  Compile in platform device definitions for MIPI-CSIS channel 1
-
-menuconfig S5P_SYSMMU
-	bool "SYSMMU support"
-	depends on ARCH_S5PV310
-	help
-	  This is a System MMU driver for Samsung ARM based Soc.
-
-if S5P_SYSMMU
-
-config S5P_SYSMMU_DEBUG
-	bool "Enables debug messages"
-	depends on S5P_SYSMMU
-	help
-	  This enables SYSMMU driver debug massages.
-
-endif
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 92efe1a..4bd5cf9 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -19,6 +19,7 @@ obj-y				+= clock.o
 obj-y				+= irq.o
 obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
 obj-$(CONFIG_S5P_GPIO_INT)	+= irq-gpioint.o
+obj-$(CONFIG_S5P_SYSTEM_MMU)	+= sysmmu.o
 obj-$(CONFIG_PM)		+= pm.o
 obj-$(CONFIG_PM)		+= irq-pm.o
 
@@ -30,4 +31,3 @@ obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
-obj-$(CONFIG_S5P_SYSMMU)	+= sysmmu.o
diff --git a/arch/arm/plat-s5p/include/plat/sysmmu.h b/arch/arm/plat-s5p/include/plat/sysmmu.h
deleted file mode 100644
index db298fc..0000000
--- a/arch/arm/plat-s5p/include/plat/sysmmu.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* linux/arch/arm/plat-s5p/include/plat/sysmmu.h
- *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * Samsung sysmmu driver
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_PLAT_S5P_SYSMMU_H
-#define __ASM_PLAT_S5P_SYSMMU_H __FILE__
-
-/* debug macro */
-#ifdef CONFIG_S5P_SYSMMU_DEBUG
-#define sysmmu_debug(fmt, arg...)	printk(KERN_INFO "[%s] " fmt, __func__, ## arg)
-#else
-#define sysmmu_debug(fmt, arg...)	do { } while (0)
-#endif
-
-#endif /* __ASM_PLAT_S5P_SYSMMU_H */
diff --git a/arch/arm/plat-s5p/sysmmu.c b/arch/arm/plat-s5p/sysmmu.c
index d804914..ffe8a48 100644
--- a/arch/arm/plat-s5p/sysmmu.c
+++ b/arch/arm/plat-s5p/sysmmu.c
@@ -16,8 +16,6 @@
 #include <mach/regs-sysmmu.h>
 #include <mach/sysmmu.h>
 
-#include <plat/sysmmu.h>
-
 struct sysmmu_controller s5p_sysmmu_cntlrs[S5P_SYSMMU_TOTAL_IPNUM];
 
 void s5p_sysmmu_register(struct sysmmu_controller *sysmmuconp)
@@ -123,7 +121,7 @@ static int s5p_sysmmu_set_tablebase(sysmmu_ips ips)
 		: "=r" (pg) : : "cc");		\
 		pg &= ~0x3fff;
 
-	sysmmu_debug("CP15 TTBR0 : 0x%x\n", pg);
+	printk(KERN_INFO "%s: CP15 TTBR0 : 0x%x\n", __func__, pg);
 
 	/* Set sysmmu page table base address */
 	__raw_writel(pg, sysmmuconp->regs + S5P_PT_BASE_ADDR);
-- 
1.7.1

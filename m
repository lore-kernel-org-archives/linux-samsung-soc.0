From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] ARM: S3C24XX: header mach/regs-power.h local
Date: Sun, 03 Feb 2013 17:18:30 -0800
Message-ID: <1359940711-29764-2-git-send-email-kgene.kim@samsung.com>
References: <1359940711-29764-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13424 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730Ab3BDBTe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Feb 2013 20:19:34 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHO00LZ9905ME20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Feb 2013 10:19:29 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHO00CIF90C7U10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Feb 2013 10:19:29 +0900 (KST)
In-reply-to: <1359940711-29764-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Since header mach/regs-power.h is used only into mach-s3c24xx/,
this patch moves the header file in local.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/include/mach/regs-power.h |   40 -----------------------
 arch/arm/mach-s3c24xx/irq-s3c2412.c             |    3 +-
 arch/arm/mach-s3c24xx/mach-jive.c               |    3 +-
 arch/arm/mach-s3c24xx/pm-s3c2412.c              |    2 +-
 arch/arm/mach-s3c24xx/pm-s3c2416.c              |    3 +-
 arch/arm/mach-s3c24xx/s3c2412-power.h           |   37 +++++++++++++++++++++
 arch/arm/mach-s3c24xx/s3c2412.c                 |    2 +-
 7 files changed, 45 insertions(+), 45 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-power.h
 create mode 100644 arch/arm/mach-s3c24xx/s3c2412-power.h

diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-power.h b/arch/arm/mach-s3c24xx/include/mach/regs-power.h
deleted file mode 100644
index 4932b87..0000000
--- a/arch/arm/mach-s3c24xx/include/mach/regs-power.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-power.h
- *
- * Copyright (c) 2003-2006 Simtec Electronics <linux@simtec.co.uk>
- *	http://armlinux.simtec.co.uk/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C24XX power control register definitions
-*/
-
-#ifndef __ASM_ARM_REGS_PWR
-#define __ASM_ARM_REGS_PWR __FILE__
-
-#define S3C24XX_PWRREG(x) ((x) + S3C24XX_VA_CLKPWR)
-
-#define S3C2412_PWRMODECON	S3C24XX_PWRREG(0x20)
-#define S3C2412_PWRCFG		S3C24XX_PWRREG(0x24)
-
-#define S3C2412_INFORM0		S3C24XX_PWRREG(0x70)
-#define S3C2412_INFORM1		S3C24XX_PWRREG(0x74)
-#define S3C2412_INFORM2		S3C24XX_PWRREG(0x78)
-#define S3C2412_INFORM3		S3C24XX_PWRREG(0x7C)
-
-#define S3C2412_PWRCFG_BATF_IRQ			(1<<0)
-#define S3C2412_PWRCFG_BATF_IGNORE		(2<<0)
-#define S3C2412_PWRCFG_BATF_SLEEP		(3<<0)
-#define S3C2412_PWRCFG_BATF_MASK		(3<<0)
-
-#define S3C2412_PWRCFG_STANDBYWFI_IGNORE	(0<<6)
-#define S3C2412_PWRCFG_STANDBYWFI_IDLE		(1<<6)
-#define S3C2412_PWRCFG_STANDBYWFI_STOP		(2<<6)
-#define S3C2412_PWRCFG_STANDBYWFI_SLEEP		(3<<6)
-#define S3C2412_PWRCFG_STANDBYWFI_MASK		(3<<6)
-
-#define S3C2412_PWRCFG_RTC_MASKIRQ		(1<<8)
-#define S3C2412_PWRCFG_NAND_NORST		(1<<9)
-
-#endif /* __ASM_ARM_REGS_PWR */
diff --git a/arch/arm/mach-s3c24xx/irq-s3c2412.c b/arch/arm/mach-s3c24xx/irq-s3c2412.c
index e65619d..67d7631 100644
--- a/arch/arm/mach-s3c24xx/irq-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/irq-s3c2412.c
@@ -33,12 +33,13 @@
 
 #include <mach/regs-irq.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-power.h>
 
 #include <plat/cpu.h>
 #include <plat/irq.h>
 #include <plat/pm.h>
 
+#include "s3c2412-power.h"
+
 #define INTMSK(start, end) ((1 << ((end) + 1 - (start))) - 1)
 #define INTMSK_SUB(start, end) (INTMSK(start, end) << ((start - S3C2410_IRQSUB(0))))
 
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index c9954e2..0de85e3 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -35,7 +35,6 @@
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
-#include <mach/regs-power.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-mem.h>
 #include <mach/regs-lcd.h>
@@ -56,6 +55,8 @@
 #include <plat/pm.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 
+#include "s3c2412-power.h"
+
 static struct map_desc jive_iodesc[] __initdata = {
 };
 
diff --git a/arch/arm/mach-s3c24xx/pm-s3c2412.c b/arch/arm/mach-s3c24xx/pm-s3c2412.c
index 206765c..2ce86a4 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2412.c
@@ -26,13 +26,13 @@
 
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-power.h>
 
 #include <plat/cpu.h>
 #include <plat/pm.h>
 #include <plat/s3c2412.h>
 
 #include "regs-dsc.h"
+#include "s3c2412-power.h"
 
 extern void s3c2412_sleep_enter(void);
 
diff --git a/arch/arm/mach-s3c24xx/pm-s3c2416.c b/arch/arm/mach-s3c24xx/pm-s3c2416.c
index 1bd4817..db7435a 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2416.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2416.c
@@ -16,12 +16,13 @@
 
 #include <asm/cacheflush.h>
 
-#include <mach/regs-power.h>
 #include <mach/regs-s3c2443-clock.h>
 
 #include <plat/cpu.h>
 #include <plat/pm.h>
 
+#include "s3c2412-power.h"
+
 extern void s3c2412_sleep_enter(void);
 
 static int s3c2416_cpu_suspend(unsigned long arg)
diff --git a/arch/arm/mach-s3c24xx/s3c2412-power.h b/arch/arm/mach-s3c24xx/s3c2412-power.h
new file mode 100644
index 0000000..1b02c5d
--- /dev/null
+++ b/arch/arm/mach-s3c24xx/s3c2412-power.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright (c) 2003-2006 Simtec Electronics <linux@simtec.co.uk>
+ *	http://armlinux.simtec.co.uk/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ARCH_ARM_MACH_S3C24XX_S3C2412_POWER_H
+#define __ARCH_ARM_MACH_S3C24XX_S3C2412_POWER_H __FILE__
+
+#define S3C24XX_PWRREG(x)			((x) + S3C24XX_VA_CLKPWR)
+
+#define S3C2412_PWRMODECON			S3C24XX_PWRREG(0x20)
+#define S3C2412_PWRCFG				S3C24XX_PWRREG(0x24)
+
+#define S3C2412_INFORM0				S3C24XX_PWRREG(0x70)
+#define S3C2412_INFORM1				S3C24XX_PWRREG(0x74)
+#define S3C2412_INFORM2				S3C24XX_PWRREG(0x78)
+#define S3C2412_INFORM3				S3C24XX_PWRREG(0x7C)
+
+#define S3C2412_PWRCFG_BATF_IRQ			(1 << 0)
+#define S3C2412_PWRCFG_BATF_IGNORE		(2 << 0)
+#define S3C2412_PWRCFG_BATF_SLEEP		(3 << 0)
+#define S3C2412_PWRCFG_BATF_MASK		(3 << 0)
+
+#define S3C2412_PWRCFG_STANDBYWFI_IGNORE	(0 << 6)
+#define S3C2412_PWRCFG_STANDBYWFI_IDLE		(1 << 6)
+#define S3C2412_PWRCFG_STANDBYWFI_STOP		(2 << 6)
+#define S3C2412_PWRCFG_STANDBYWFI_SLEEP		(3 << 6)
+#define S3C2412_PWRCFG_STANDBYWFI_MASK		(3 << 6)
+
+#define S3C2412_PWRCFG_RTC_MASKIRQ		(1 << 8)
+#define S3C2412_PWRCFG_NAND_NORST		(1 << 9)
+
+#endif /* __ARCH_ARM_MACH_S3C24XX_S3C2412_POWER_H */
diff --git a/arch/arm/mach-s3c24xx/s3c2412.c b/arch/arm/mach-s3c24xx/s3c2412.c
index ec0b318..0d59215 100644
--- a/arch/arm/mach-s3c24xx/s3c2412.c
+++ b/arch/arm/mach-s3c24xx/s3c2412.c
@@ -34,7 +34,6 @@
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-power.h>
 
 #include <plat/clock.h>
 #include <plat/cpu.h>
@@ -49,6 +48,7 @@
 
 #include "common.h"
 #include "regs-dsc.h"
+#include "s3c2412-power.h"
 
 #define S3C2412_SWRST			(S3C24XX_VA_CLKPWR + 0x30)
 #define S3C2412_SWRST_RESET		(0x533C2412)
-- 
1.7.10.4

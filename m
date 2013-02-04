From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/3] ARM: S3C24XX: header mach/regs-s3c2412-mem.h local
Date: Sun, 03 Feb 2013 17:18:29 -0800
Message-ID: <1359940711-29764-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13424 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753717Ab3BDBTd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Feb 2013 20:19:33 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHO00LZ9905ME20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Feb 2013 10:19:28 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHO00CIF90C7U10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Feb 2013 10:19:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Since header mach/regs-s3c2412-mem.h is used only into mach-s3c24xx/,
this patch moves the header file in local.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/cpufreq-s3c2412.c            |    3 +-
 .../mach-s3c24xx/include/mach/regs-s3c2412-mem.h   |   48 --------------------
 arch/arm/mach-s3c24xx/iotiming-s3c2412.c           |    4 +-
 arch/arm/mach-s3c24xx/s3c2412.h                    |   26 +++++++++++
 4 files changed, 30 insertions(+), 51 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-s3c2412-mem.h
 create mode 100644 arch/arm/mach-s3c24xx/s3c2412.h

diff --git a/arch/arm/mach-s3c24xx/cpufreq-s3c2412.c b/arch/arm/mach-s3c24xx/cpufreq-s3c2412.c
index c8f05f3..8bf0f3a 100644
--- a/arch/arm/mach-s3c24xx/cpufreq-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/cpufreq-s3c2412.c
@@ -25,12 +25,13 @@
 #include <asm/mach/map.h>
 
 #include <mach/regs-clock.h>
-#include <mach/regs-s3c2412-mem.h>
 
 #include <plat/cpu.h>
 #include <plat/clock.h>
 #include <plat/cpu-freq-core.h>
 
+#include "s3c2412.h"
+
 /* our clock resources. */
 static struct clk *xtal;
 static struct clk *fclk;
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2412-mem.h b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2412-mem.h
deleted file mode 100644
index fb63525..0000000
--- a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2412-mem.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-s3c2412-mem.h
- *
- * Copyright (c) 2008 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *	http://armlinux.simtec.co.uk/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C2412 memory register definitions
-*/
-
-#ifndef __ASM_ARM_REGS_S3C2412_MEM
-#define __ASM_ARM_REGS_S3C2412_MEM
-
-#define S3C2412_MEMREG(x) (S3C24XX_VA_MEMCTRL + (x))
-#define S3C2412_EBIREG(x) (S3C2412_VA_EBI + (x))
-
-#define S3C2412_SSMCREG(x) (S3C2412_VA_SSMC + (x))
-#define S3C2412_SSMC(x, o) (S3C2412_SSMCREG((x * 0x20) + (o)))
-
-#define S3C2412_BANKCFG			S3C2412_MEMREG(0x00)
-#define S3C2412_BANKCON1		S3C2412_MEMREG(0x04)
-#define S3C2412_BANKCON2		S3C2412_MEMREG(0x08)
-#define S3C2412_BANKCON3		S3C2412_MEMREG(0x0C)
-
-#define S3C2412_REFRESH			S3C2412_MEMREG(0x10)
-#define S3C2412_TIMEOUT			S3C2412_MEMREG(0x14)
-
-/* EBI control registers */
-
-#define S3C2412_EBI_PR			S3C2412_EBIREG(0x00)
-#define S3C2412_EBI_BANKCFG		S3C2412_EBIREG(0x04)
-
-/* SSMC control registers */
-
-#define S3C2412_SSMC_BANK(x)		S3C2412_SSMC(x, 0x00)
-#define S3C2412_SMIDCYR(x)		S3C2412_SSMC(x, 0x00)
-#define S3C2412_SMBWSTRD(x)		S3C2412_SSMC(x, 0x04)
-#define S3C2412_SMBWSTWRR(x)		S3C2412_SSMC(x, 0x08)
-#define S3C2412_SMBWSTOENR(x)		S3C2412_SSMC(x, 0x0C)
-#define S3C2412_SMBWSTWENR(x)		S3C2412_SSMC(x, 0x10)
-#define S3C2412_SMBCR(x)		S3C2412_SSMC(x, 0x14)
-#define S3C2412_SMBSR(x)		S3C2412_SSMC(x, 0x18)
-#define S3C2412_SMBWSTBRDR(x)		S3C2412_SSMC(x, 0x1C)
-
-#endif /*  __ASM_ARM_REGS_S3C2412_MEM */
diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
index 9527342..663436d 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
@@ -27,12 +27,12 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-s3c2412-mem.h>
-
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 #include <plat/clock.h>
 
+#include "s3c2412.h"
+
 #define print_ns(x) ((x) / 10), ((x) % 10)
 
 /**
diff --git a/arch/arm/mach-s3c24xx/s3c2412.h b/arch/arm/mach-s3c24xx/s3c2412.h
new file mode 100644
index 0000000..548ced4
--- /dev/null
+++ b/arch/arm/mach-s3c24xx/s3c2412.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2008 Simtec Electronics
+ *	Ben Dooks <ben@simtec.co.uk>
+ *	http://armlinux.simtec.co.uk/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ARCH_ARM_MACH_S3C24XX_S3C2412_H
+#define __ARCH_ARM_REGS_S3C24XX_S3C2412_H __FILE__
+
+#define S3C2412_MEMREG(x)		(S3C24XX_VA_MEMCTRL + (x))
+#define S3C2412_EBIREG(x)		(S3C2412_VA_EBI + (x))
+
+#define S3C2412_SSMCREG(x)		(S3C2412_VA_SSMC + (x))
+#define S3C2412_SSMC(x, o)		(S3C2412_SSMCREG((x * 0x20) + (o)))
+
+#define S3C2412_REFRESH			S3C2412_MEMREG(0x10)
+
+#define S3C2412_EBI_BANKCFG		S3C2412_EBIREG(0x4)
+
+#define S3C2412_SSMC_BANK(x)		S3C2412_SSMC(x, 0x0)
+
+#endif /* __ARCH_ARM_MACH_S3C24XX_S3C2412_H */
-- 
1.7.10.4

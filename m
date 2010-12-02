From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/6] ARM: S5P: Move the SROM register definitions to plat-s5p
Date: Thu,  2 Dec 2010 18:29:16 +0900
Message-ID: <1291282161-1992-2-git-send-email-kgene.kim@samsung.com>
References: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38945 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757368Ab0LBJnM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:12 -0500
In-Reply-To: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

The SROM register difinitions of S5PV310/S5PC210 (mach/regs-srom.h)
can be used to other S5P SoCs such as S5PV210/S5PC110. So moved into
plat/regs-srom.h of plat-s5p directory.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/regs-srom.h |   50 ------------------------
 arch/arm/mach-s5pv310/mach-smdkc210.c          |   31 +++++++--------
 arch/arm/mach-s5pv310/mach-smdkv310.c          |   31 +++++++--------
 arch/arm/plat-s5p/include/plat/regs-srom.h     |   50 ++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 82 deletions(-)
 delete mode 100644 arch/arm/mach-s5pv310/include/mach/regs-srom.h
 create mode 100644 arch/arm/plat-s5p/include/plat/regs-srom.h

diff --git a/arch/arm/mach-s5pv310/include/mach/regs-srom.h b/arch/arm/mach-s5pv310/include/mach/regs-srom.h
deleted file mode 100644
index 1898b3e..0000000
--- a/arch/arm/mach-s5pv310/include/mach/regs-srom.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* linux/arch/arm/mach-s5pv310/include/mach/regs-srom.h
- *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * S5PV310 - SROMC register definitions
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_REGS_SROM_H
-#define __ASM_ARCH_REGS_SROM_H __FILE__
-
-#include <mach/map.h>
-
-#define S5PV310_SROMREG(x)	(S5P_VA_SROMC + (x))
-
-#define S5PV310_SROM_BW		S5PV310_SROMREG(0x0)
-#define S5PV310_SROM_BC0	S5PV310_SROMREG(0x4)
-#define S5PV310_SROM_BC1	S5PV310_SROMREG(0x8)
-#define S5PV310_SROM_BC2	S5PV310_SROMREG(0xc)
-#define S5PV310_SROM_BC3	S5PV310_SROMREG(0x10)
-
-/* one register BW holds 4 x 4-bit packed settings for NCS0 - NCS3 */
-
-#define S5PV310_SROM_BW__DATAWIDTH__SHIFT	0
-#define S5PV310_SROM_BW__ADDRMODE__SHIFT	1
-#define S5PV310_SROM_BW__WAITENABLE__SHIFT	2
-#define S5PV310_SROM_BW__BYTEENABLE__SHIFT	3
-
-#define S5PV310_SROM_BW__CS_MASK		0xf
-
-#define S5PV310_SROM_BW__NCS0__SHIFT		0
-#define S5PV310_SROM_BW__NCS1__SHIFT		4
-#define S5PV310_SROM_BW__NCS2__SHIFT		8
-#define S5PV310_SROM_BW__NCS3__SHIFT		12
-
-/* applies to same to BCS0 - BCS3 */
-
-#define S5PV310_SROM_BCX__PMC__SHIFT		0
-#define S5PV310_SROM_BCX__TACP__SHIFT		4
-#define S5PV310_SROM_BCX__TCAH__SHIFT		8
-#define S5PV310_SROM_BCX__TCOH__SHIFT		12
-#define S5PV310_SROM_BCX__TACC__SHIFT		16
-#define S5PV310_SROM_BCX__TCOS__SHIFT		24
-#define S5PV310_SROM_BCX__TACS__SHIFT		28
-
-#endif /* __ASM_ARCH_REGS_SROM_H */
diff --git a/arch/arm/mach-s5pv310/mach-smdkc210.c b/arch/arm/mach-s5pv310/mach-smdkc210.c
index 2b8d4fc..62956d3 100644
--- a/arch/arm/mach-s5pv310/mach-smdkc210.c
+++ b/arch/arm/mach-s5pv310/mach-smdkc210.c
@@ -19,13 +19,13 @@
 #include <asm/mach-types.h>
 
 #include <plat/regs-serial.h>
+#include <plat/regs-srom.h>
 #include <plat/s5pv310.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/sdhci.h>
 
 #include <mach/map.h>
-#include <mach/regs-srom.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKC210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -154,23 +154,22 @@ static void __init smdkc210_smsc911x_init(void)
 	u32 cs1;
 
 	/* configure nCS1 width to 16 bits */
-	cs1 = __raw_readl(S5PV310_SROM_BW) &
-		    ~(S5PV310_SROM_BW__CS_MASK <<
-				    S5PV310_SROM_BW__NCS1__SHIFT);
-	cs1 |= ((1 << S5PV310_SROM_BW__DATAWIDTH__SHIFT) |
-		(1 << S5PV310_SROM_BW__WAITENABLE__SHIFT) |
-		(1 << S5PV310_SROM_BW__BYTEENABLE__SHIFT)) <<
-		S5PV310_SROM_BW__NCS1__SHIFT;
-	__raw_writel(cs1, S5PV310_SROM_BW);
+	cs1 = __raw_readl(S5P_SROM_BW) &
+		~(S5P_SROM_BW__CS_MASK << S5P_SROM_BW__NCS1__SHIFT);
+	cs1 |= ((1 << S5P_SROM_BW__DATAWIDTH__SHIFT) |
+		(1 << S5P_SROM_BW__WAITENABLE__SHIFT) |
+		(1 << S5P_SROM_BW__BYTEENABLE__SHIFT)) <<
+		S5P_SROM_BW__NCS1__SHIFT;
+	__raw_writel(cs1, S5P_SROM_BW);
 
 	/* set timing for nCS1 suitable for ethernet chip */
-	__raw_writel((0x1 << S5PV310_SROM_BCX__PMC__SHIFT) |
-		     (0x9 << S5PV310_SROM_BCX__TACP__SHIFT) |
-		     (0xc << S5PV310_SROM_BCX__TCAH__SHIFT) |
-		     (0x1 << S5PV310_SROM_BCX__TCOH__SHIFT) |
-		     (0x6 << S5PV310_SROM_BCX__TACC__SHIFT) |
-		     (0x1 << S5PV310_SROM_BCX__TCOS__SHIFT) |
-		     (0x1 << S5PV310_SROM_BCX__TACS__SHIFT), S5PV310_SROM_BC1);
+	__raw_writel((0x1 << S5P_SROM_BCX__PMC__SHIFT) |
+		     (0x9 << S5P_SROM_BCX__TACP__SHIFT) |
+		     (0xc << S5P_SROM_BCX__TCAH__SHIFT) |
+		     (0x1 << S5P_SROM_BCX__TCOH__SHIFT) |
+		     (0x6 << S5P_SROM_BCX__TACC__SHIFT) |
+		     (0x1 << S5P_SROM_BCX__TCOS__SHIFT) |
+		     (0x1 << S5P_SROM_BCX__TACS__SHIFT), S5P_SROM_BC1);
 }
 
 static void __init smdkc210_map_io(void)
diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.c b/arch/arm/mach-s5pv310/mach-smdkv310.c
index 35826d6..3426602 100644
--- a/arch/arm/mach-s5pv310/mach-smdkv310.c
+++ b/arch/arm/mach-s5pv310/mach-smdkv310.c
@@ -19,13 +19,13 @@
 #include <asm/mach-types.h>
 
 #include <plat/regs-serial.h>
+#include <plat/regs-srom.h>
 #include <plat/s5pv310.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/sdhci.h>
 
 #include <mach/map.h>
-#include <mach/regs-srom.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV310_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -154,23 +154,22 @@ static void __init smdkv310_smsc911x_init(void)
 	u32 cs1;
 
 	/* configure nCS1 width to 16 bits */
-	cs1 = __raw_readl(S5PV310_SROM_BW) &
-		    ~(S5PV310_SROM_BW__CS_MASK <<
-				    S5PV310_SROM_BW__NCS1__SHIFT);
-	cs1 |= ((1 << S5PV310_SROM_BW__DATAWIDTH__SHIFT) |
-		(1 << S5PV310_SROM_BW__WAITENABLE__SHIFT) |
-		(1 << S5PV310_SROM_BW__BYTEENABLE__SHIFT)) <<
-		S5PV310_SROM_BW__NCS1__SHIFT;
-	__raw_writel(cs1, S5PV310_SROM_BW);
+	cs1 = __raw_readl(S5P_SROM_BW) &
+		~(S5P_SROM_BW__CS_MASK << S5P_SROM_BW__NCS1__SHIFT);
+	cs1 |= ((1 << S5P_SROM_BW__DATAWIDTH__SHIFT) |
+		(1 << S5P_SROM_BW__WAITENABLE__SHIFT) |
+		(1 << S5P_SROM_BW__BYTEENABLE__SHIFT)) <<
+		S5P_SROM_BW__NCS1__SHIFT;
+	__raw_writel(cs1, S5P_SROM_BW);
 
 	/* set timing for nCS1 suitable for ethernet chip */
-	__raw_writel((0x1 << S5PV310_SROM_BCX__PMC__SHIFT) |
-		     (0x9 << S5PV310_SROM_BCX__TACP__SHIFT) |
-		     (0xc << S5PV310_SROM_BCX__TCAH__SHIFT) |
-		     (0x1 << S5PV310_SROM_BCX__TCOH__SHIFT) |
-		     (0x6 << S5PV310_SROM_BCX__TACC__SHIFT) |
-		     (0x1 << S5PV310_SROM_BCX__TCOS__SHIFT) |
-		     (0x1 << S5PV310_SROM_BCX__TACS__SHIFT), S5PV310_SROM_BC1);
+	__raw_writel((0x1 << S5P_SROM_BCX__PMC__SHIFT) |
+		     (0x9 << S5P_SROM_BCX__TACP__SHIFT) |
+		     (0xc << S5P_SROM_BCX__TCAH__SHIFT) |
+		     (0x1 << S5P_SROM_BCX__TCOH__SHIFT) |
+		     (0x6 << S5P_SROM_BCX__TACC__SHIFT) |
+		     (0x1 << S5P_SROM_BCX__TCOS__SHIFT) |
+		     (0x1 << S5P_SROM_BCX__TACS__SHIFT), S5P_SROM_BC1);
 }
 
 static void __init smdkv310_map_io(void)
diff --git a/arch/arm/plat-s5p/include/plat/regs-srom.h b/arch/arm/plat-s5p/include/plat/regs-srom.h
new file mode 100644
index 0000000..0fdac48
--- /dev/null
+++ b/arch/arm/plat-s5p/include/plat/regs-srom.h
@@ -0,0 +1,50 @@
+/* linux/arch/arm/plat-s5p/include/plat/regs-srom.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * S5P SROMC register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_S5P_REGS_SROM_H
+#define __ASM_PLAT_S5P_REGS_SROM_H __FILE__
+
+#include <mach/map.h>
+
+#define S5P_SROMREG(x)		(S5P_VA_SROMC + (x))
+
+#define S5P_SROM_BW		S5P_SROMREG(0x0)
+#define S5P_SROM_BC0		S5P_SROMREG(0x4)
+#define S5P_SROM_BC1		S5P_SROMREG(0x8)
+#define S5P_SROM_BC2		S5P_SROMREG(0xc)
+#define S5P_SROM_BC3		S5P_SROMREG(0x10)
+
+/* one register BW holds 4 x 4-bit packed settings for NCS0 - NCS3 */
+
+#define S5P_SROM_BW__DATAWIDTH__SHIFT		0
+#define S5P_SROM_BW__ADDRMODE__SHIFT		1
+#define S5P_SROM_BW__WAITENABLE__SHIFT		2
+#define S5P_SROM_BW__BYTEENABLE__SHIFT		3
+
+#define S5P_SROM_BW__CS_MASK			0xf
+
+#define S5P_SROM_BW__NCS0__SHIFT		0
+#define S5P_SROM_BW__NCS1__SHIFT		4
+#define S5P_SROM_BW__NCS2__SHIFT		8
+#define S5P_SROM_BW__NCS3__SHIFT		12
+
+/* applies to same to BCS0 - BCS3 */
+
+#define S5P_SROM_BCX__PMC__SHIFT		0
+#define S5P_SROM_BCX__TACP__SHIFT		4
+#define S5P_SROM_BCX__TCAH__SHIFT		8
+#define S5P_SROM_BCX__TCOH__SHIFT		12
+#define S5P_SROM_BCX__TACC__SHIFT		16
+#define S5P_SROM_BCX__TCOS__SHIFT		24
+#define S5P_SROM_BCX__TACS__SHIFT		28
+
+#endif /* __ASM_PLAT_S5P_REGS_SROM_H */
-- 
1.6.2.5

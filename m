From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P6442: Cleanup map.h file
Date: Thu, 10 Feb 2011 14:44:45 +0900
Message-ID: <1297316686-21138-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55520 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398Ab1BJGNi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Feb 2011 01:13:38 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/map.h |   69 ++++++++++++++++--------------
 1 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/arch/arm/mach-s5p6442/include/mach/map.h b/arch/arm/mach-s5p6442/include/mach/map.h
index 203dd5a..058dab4 100644
--- a/arch/arm/mach-s5p6442/include/mach/map.h
+++ b/arch/arm/mach-s5p6442/include/mach/map.h
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s5p6442/include/mach/map.h
  *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
  * S5P6442 - Memory map definitions
@@ -16,56 +16,61 @@
 #include <plat/map-base.h>
 #include <plat/map-s5p.h>
 
-#define S5P6442_PA_CHIPID	(0xE0000000)
-#define S5P_PA_CHIPID		S5P6442_PA_CHIPID
+#define S5P6442_PA_SDRAM	0x20000000
 
-#define S5P6442_PA_SYSCON	(0xE0100000)
-#define S5P_PA_SYSCON		S5P6442_PA_SYSCON
+#define S5P6442_PA_I2S0		0xC0B00000
+#define S5P6442_PA_I2S1		0xF2200000
 
-#define S5P6442_PA_GPIO		(0xE0200000)
+#define S5P6442_PA_CHIPID	0xE0000000
 
-#define S5P6442_PA_VIC0		(0xE4000000)
-#define S5P6442_PA_VIC1		(0xE4100000)
-#define S5P6442_PA_VIC2		(0xE4200000)
+#define S5P6442_PA_SYSCON	0xE0100000
 
-#define S5P6442_PA_SROMC	(0xE7000000)
-#define S5P_PA_SROMC		S5P6442_PA_SROMC
+#define S5P6442_PA_GPIO		0xE0200000
 
-#define S5P6442_PA_MDMA		0xE8000000
-#define S5P6442_PA_PDMA		0xE9000000
+#define S5P6442_PA_VIC0		0xE4000000
+#define S5P6442_PA_VIC1		0xE4100000
+#define S5P6442_PA_VIC2		0xE4200000
 
-#define S5P6442_PA_TIMER	(0xEA000000)
-#define S5P_PA_TIMER		S5P6442_PA_TIMER
+#define S5P6442_PA_SROMC	0xE7000000
 
-#define S5P6442_PA_SYSTIMER   	(0xEA100000)
+#define S5P6442_PA_MDMA		0xE8000000
+#define S5P6442_PA_PDMA		0xE9000000
 
-#define S5P6442_PA_WATCHDOG	(0xEA200000)
+#define S5P6442_PA_TIMER	0xEA000000
 
-#define S5P6442_PA_UART		(0xEC000000)
+#define S5P6442_PA_SYSTIMER	0xEA100000
 
-#define S5P_PA_UART0		(S5P6442_PA_UART + 0x0)
-#define S5P_PA_UART1		(S5P6442_PA_UART + 0x400)
-#define S5P_PA_UART2		(S5P6442_PA_UART + 0x800)
-#define S5P_SZ_UART		SZ_256
+#define S5P6442_PA_WATCHDOG	0xEA200000
 
-#define S5P6442_PA_IIC0		(0xEC100000)
+#define S5P6442_PA_UART		0xEC000000
 
-#define S5P6442_PA_SDRAM	(0x20000000)
-#define S5P_PA_SDRAM		S5P6442_PA_SDRAM
+#define S5P6442_PA_IIC0		0xEC100000
 
 #define S5P6442_PA_SPI		0xEC300000
 
-/* I2S */
-#define S5P6442_PA_I2S0		0xC0B00000
-#define S5P6442_PA_I2S1		0xF2200000
-
-/* PCM */
 #define S5P6442_PA_PCM0		0xF2400000
 #define S5P6442_PA_PCM1		0xF2500000
 
-/* compatibiltiy defines. */
+/* Compatibiltiy Defines */
+
+#define S3C_PA_IIC		S5P6442_PA_IIC0
 #define S3C_PA_WDT		S5P6442_PA_WATCHDOG
+
+#define S5P_PA_CHIPID		S5P6442_PA_CHIPID
+#define S5P_PA_SDRAM		S5P6442_PA_SDRAM
+#define S5P_PA_SROMC		S5P6442_PA_SROMC
+#define S5P_PA_SYSCON		S5P6442_PA_SYSCON
+#define S5P_PA_TIMER		S5P6442_PA_TIMER
+
+/* UART */
+
 #define S3C_PA_UART		S5P6442_PA_UART
-#define S3C_PA_IIC		S5P6442_PA_IIC0
+
+#define S5P_PA_UART(x)		(S3C_PA_UART + ((x) * S3C_UART_OFFSET))
+#define S5P_PA_UART0		S5P_PA_UART(0)
+#define S5P_PA_UART1		S5P_PA_UART(1)
+#define S5P_PA_UART2		S5P_PA_UART(2)
+
+#define S5P_SZ_UART		SZ_256
 
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.7.1

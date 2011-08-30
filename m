From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Move map header file into plat-samsung
Date: Tue, 30 Aug 2011 21:23:32 +0900
Message-ID: <1314707012-10994-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52810 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751658Ab1H3Mjh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 08:39:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This is required to work consolidation Samsung platform.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c2410/include/mach/map.h           |   52 +++++++++-
 arch/arm/mach-s3c64xx/include/mach/map.h           |    9 +--
 arch/arm/plat-s3c24xx/include/plat/map.h           |  100 --------------------
 arch/arm/plat-samsung/include/plat/map-s3c.h       |   84 ++++++++++++++++
 .../include/plat/map-s5p.h                         |    6 +-
 5 files changed, 134 insertions(+), 117 deletions(-)
 delete mode 100644 arch/arm/plat-s3c24xx/include/plat/map.h
 create mode 100644 arch/arm/plat-samsung/include/plat/map-s3c.h
 rename arch/arm/{plat-s5p => plat-samsung}/include/plat/map-s5p.h (94%)

diff --git a/arch/arm/mach-s3c2410/include/mach/map.h b/arch/arm/mach-s3c2410/include/mach/map.h
index 425552d..4cf495f 100644
--- a/arch/arm/mach-s3c2410/include/mach/map.h
+++ b/arch/arm/mach-s3c2410/include/mach/map.h
@@ -14,9 +14,53 @@
 #define __ASM_ARCH_MAP_H
 
 #include <plat/map-base.h>
-#include <plat/map.h>
 
-#define S3C2410_ADDR(x)		S3C_ADDR(x)
+/*
+ * S3C2410 UART offset is 0x4000 but the other SoCs are 0x400.
+ * So need to define it, and here is to avoid redefinition warning.
+ */
+#define S3C_UART_OFFSET		(0x4000)
+
+#include <plat/map-s3c.h>
+
+/*
+ * interrupt controller is the first thing we put in, to make
+ * the assembly code for the irq detection easier
+ */
+#define S3C2410_PA_IRQ		(0x4A000000)
+#define S3C24XX_SZ_IRQ		SZ_1M
+
+/* memory controller registers */
+#define S3C2410_PA_MEMCTRL	(0x48000000)
+#define S3C24XX_SZ_MEMCTRL	SZ_1M
+
+/* UARTs */
+#define S3C_VA_UARTx(uart)	(S3C_VA_UART + ((uart * S3C_UART_OFFSET)))
+
+/* Timers */
+#define S3C2410_PA_TIMER	(0x51000000)
+#define S3C24XX_SZ_TIMER	SZ_1M
+
+/* Clock and Power management */
+#define S3C24XX_SZ_CLKPWR	SZ_1M
+
+/* USB Device port */
+#define S3C2410_PA_USBDEV	(0x52000000)
+#define S3C24XX_SZ_USBDEV	SZ_1M
+
+/* Watchdog */
+#define S3C2410_PA_WATCHDOG	(0x53000000)
+#define S3C24XX_SZ_WATCHDOG	SZ_1M
+
+/* Standard size definitions for peripheral blocks. */
+
+#define S3C24XX_SZ_UART		SZ_1M
+#define S3C24XX_SZ_IIS		SZ_1M
+#define S3C24XX_SZ_ADC		SZ_1M
+#define S3C24XX_SZ_SPI		SZ_1M
+#define S3C24XX_SZ_SDI		SZ_1M
+#define S3C24XX_SZ_NAND		SZ_1M
+#define S3C24XX_SZ_GPIO		SZ_1M
 
 /* USB host controller */
 #define S3C2410_PA_USBHOST (0x49000000)
@@ -75,10 +119,8 @@
 
 /* S3C2412 memory and IO controls */
 #define S3C2412_PA_SSMC	(0x4F000000)
-#define S3C2412_VA_SSMC	S3C_ADDR_CPU(0x00000000)
 
 #define S3C2412_PA_EBI	(0x48800000)
-#define S3C2412_VA_EBI	S3C_ADDR_CPU(0x00010000)
 
 /* physical addresses of all the chip-select areas */
 
@@ -100,12 +142,10 @@
 #define S3C24XX_PA_DMA      S3C2410_PA_DMA
 #define S3C24XX_PA_CLKPWR   S3C2410_PA_CLKPWR
 #define S3C24XX_PA_LCD      S3C2410_PA_LCD
-#define S3C24XX_PA_UART     S3C2410_PA_UART
 #define S3C24XX_PA_TIMER    S3C2410_PA_TIMER
 #define S3C24XX_PA_USBDEV   S3C2410_PA_USBDEV
 #define S3C24XX_PA_WATCHDOG S3C2410_PA_WATCHDOG
 #define S3C24XX_PA_IIS      S3C2410_PA_IIS
-#define S3C24XX_PA_GPIO     S3C2410_PA_GPIO
 #define S3C24XX_PA_RTC      S3C2410_PA_RTC
 #define S3C24XX_PA_ADC      S3C2410_PA_ADC
 #define S3C24XX_PA_SPI      S3C2410_PA_SPI
diff --git a/arch/arm/mach-s3c64xx/include/mach/map.h b/arch/arm/mach-s3c64xx/include/mach/map.h
index a1f13f0..23a1d71 100644
--- a/arch/arm/mach-s3c64xx/include/mach/map.h
+++ b/arch/arm/mach-s3c64xx/include/mach/map.h
@@ -16,6 +16,7 @@
 #define __ASM_ARCH_MAP_H __FILE__
 
 #include <plat/map-base.h>
+#include <plat/map-s3c.h>
 
 /*
  * Post-mux Chip Select Regions Xm0CSn_
@@ -83,7 +84,6 @@
 #define S3C64XX_PA_IIC1		(0x7F00F000)
 
 #define S3C64XX_PA_GPIO		(0x7F008000)
-#define S3C64XX_VA_GPIO		S3C_ADDR_CPU(0x00000000)
 #define S3C64XX_SZ_GPIO		SZ_4K
 
 #define S3C64XX_PA_SDRAM	(0x50000000)
@@ -94,16 +94,10 @@
 #define S3C64XX_PA_VIC1		(0x71300000)
 
 #define S3C64XX_PA_MODEM	(0x74108000)
-#define S3C64XX_VA_MODEM	S3C_ADDR_CPU(0x00100000)
 
 #define S3C64XX_PA_USBHOST	(0x74300000)
 
 #define S3C64XX_PA_USB_HSPHY	(0x7C100000)
-#define S3C64XX_VA_USB_HSPHY	S3C_ADDR_CPU(0x00200000)
-
-/* place VICs close together */
-#define VA_VIC0			(S3C_VA_IRQ + 0x00)
-#define VA_VIC1			(S3C_VA_IRQ + 0x10000)
 
 /* compatibiltiy defines. */
 #define S3C_PA_TIMER		S3C64XX_PA_TIMER
@@ -119,7 +113,6 @@
 #define S3C_PA_FB		S3C64XX_PA_FB
 #define S3C_PA_USBHOST		S3C64XX_PA_USBHOST
 #define S3C_PA_USB_HSOTG	S3C64XX_PA_USB_HSOTG
-#define S3C_VA_USB_HSPHY	S3C64XX_VA_USB_HSPHY
 #define S3C_PA_RTC		S3C64XX_PA_RTC
 #define S3C_PA_WDT		S3C64XX_PA_WATCHDOG
 
diff --git a/arch/arm/plat-s3c24xx/include/plat/map.h b/arch/arm/plat-s3c24xx/include/plat/map.h
deleted file mode 100644
index bd534d3..0000000
--- a/arch/arm/plat-s3c24xx/include/plat/map.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* linux/include/asm-arm/plat-s3c24xx/map.h
- *
- * Copyright (c) 2008 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *
- * S3C24XX - Memory map definitions
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_PLAT_S3C24XX_MAP_H
-#define __ASM_PLAT_S3C24XX_MAP_H
-
-/* interrupt controller is the first thing we put in, to make
- * the assembly code for the irq detection easier
- */
-#define S3C24XX_VA_IRQ	   S3C_VA_IRQ
-#define S3C2410_PA_IRQ	   (0x4A000000)
-#define S3C24XX_SZ_IRQ	   SZ_1M
-
-/* memory controller registers */
-#define S3C24XX_VA_MEMCTRL S3C_VA_MEM
-#define S3C2410_PA_MEMCTRL (0x48000000)
-#define S3C24XX_SZ_MEMCTRL SZ_1M
-
-/* UARTs */
-#define S3C24XX_VA_UART	   S3C_VA_UART
-#define S3C2410_PA_UART	   (0x50000000)
-#define S3C24XX_SZ_UART	   SZ_1M
-#define S3C_UART_OFFSET	   (0x4000)
-
-#define S3C_VA_UARTx(uart) (S3C_VA_UART + ((uart * S3C_UART_OFFSET)))
-
-/* Timers */
-#define S3C24XX_VA_TIMER   S3C_VA_TIMER
-#define S3C2410_PA_TIMER   (0x51000000)
-#define S3C24XX_SZ_TIMER   SZ_1M
-
-/* Clock and Power management */
-#define S3C24XX_VA_CLKPWR  S3C_VA_SYS
-#define S3C24XX_SZ_CLKPWR  SZ_1M
-
-/* USB Device port */
-#define S3C2410_PA_USBDEV  (0x52000000)
-#define S3C24XX_SZ_USBDEV  SZ_1M
-
-/* Watchdog */
-#define S3C24XX_VA_WATCHDOG S3C_VA_WATCHDOG
-#define S3C2410_PA_WATCHDOG (0x53000000)
-#define S3C24XX_SZ_WATCHDOG SZ_1M
-
-/* Standard size definitions for peripheral blocks. */
-
-#define S3C24XX_SZ_IIS		SZ_1M
-#define S3C24XX_SZ_ADC		SZ_1M
-#define S3C24XX_SZ_SPI		SZ_1M
-#define S3C24XX_SZ_SDI		SZ_1M
-#define S3C24XX_SZ_NAND		SZ_1M
-
-/* GPIO ports */
-
-/* the calculation for the VA of this must ensure that
- * it is the same distance apart from the UART in the
- * phsyical address space, as the initial mapping for the IO
- * is done as a 1:1 mapping. This puts it (currently) at
- * 0xFA800000, which is not in the way of any current mapping
- * by the base system.
-*/
-
-#define S3C2410_PA_GPIO	   (0x56000000)
-#define S3C24XX_VA_GPIO	   ((S3C24XX_PA_GPIO - S3C24XX_PA_UART) + S3C24XX_VA_UART)
-#define S3C24XX_SZ_GPIO	   SZ_1M
-
-
-/* ISA style IO, for each machine to sort out mappings for, if it
- * implements it. We reserve two 16M regions for ISA.
- */
-
-#define S3C24XX_VA_ISA_WORD  S3C2410_ADDR(0x02000000)
-#define S3C24XX_VA_ISA_BYTE  S3C2410_ADDR(0x03000000)
-
-/* deal with the registers that move under the 2412/2413 */
-
-#if defined(CONFIG_CPU_S3C2412) || defined(CONFIG_CPU_S3C2413)
-#ifndef __ASSEMBLY__
-extern void __iomem *s3c24xx_va_gpio2;
-#endif
-#ifdef CONFIG_CPU_S3C2412_ONLY
-#define S3C24XX_VA_GPIO2 (S3C24XX_VA_GPIO + 0x10)
-#else
-#define S3C24XX_VA_GPIO2 s3c24xx_va_gpio2
-#endif
-#else
-#define s3c24xx_va_gpio2 S3C24XX_VA_GPIO
-#define S3C24XX_VA_GPIO2 S3C24XX_VA_GPIO
-#endif
-
-#endif /* __ASM_PLAT_S3C24XX_MAP_H */
diff --git a/arch/arm/plat-samsung/include/plat/map-s3c.h b/arch/arm/plat-samsung/include/plat/map-s3c.h
new file mode 100644
index 0000000..7d04875
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/map-s3c.h
@@ -0,0 +1,84 @@
+/* linux/arch/arm/plat-samsung/include/plat/map-s3c.h
+ *
+ * Copyright (c) 2008 Simtec Electronics
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ * S3C24XX - Memory map definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_MAP_S3C_H
+#define __ASM_PLAT_MAP_S3C_H __FILE__
+
+#define S3C24XX_VA_IRQ		S3C_VA_IRQ
+#define S3C24XX_VA_MEMCTRL	S3C_VA_MEM
+#define S3C24XX_VA_UART		S3C_VA_UART
+
+#define S3C24XX_VA_TIMER	S3C_VA_TIMER
+#define S3C24XX_VA_CLKPWR	S3C_VA_SYS
+#define S3C24XX_VA_WATCHDOG	S3C_VA_WATCHDOG
+
+#define S3C2412_VA_SSMC		S3C_ADDR_CPU(0x00000000)
+#define S3C2412_VA_EBI		S3C_ADDR_CPU(0x00010000)
+
+#define S3C2410_PA_UART		(0x50000000)
+#define S3C24XX_PA_UART		S3C2410_PA_UART
+
+#ifndef S3C_UART_OFFSET
+#define S3C_UART_OFFSET		(0x400)
+#endif
+
+/*
+ * GPIO ports
+ *
+ * the calculation for the VA of this must ensure that
+ * it is the same distance apart from the UART in the
+ * phsyical address space, as the initial mapping for the IO
+ * is done as a 1:1 mapping. This puts it (currently) at
+ * 0xFA800000, which is not in the way of any current mapping
+ * by the base system.
+*/
+
+#define S3C2410_PA_GPIO		(0x56000000)
+#define S3C24XX_PA_GPIO		S3C2410_PA_GPIO
+
+#define S3C24XX_VA_GPIO		((S3C24XX_PA_GPIO - S3C24XX_PA_UART) + S3C24XX_VA_UART)
+#define S3C64XX_VA_GPIO		S3C_ADDR_CPU(0x00000000)
+
+#define S3C64XX_VA_MODEM	S3C_ADDR_CPU(0x00100000)
+#define S3C64XX_VA_USB_HSPHY	S3C_ADDR_CPU(0x00200000)
+
+#define S3C_VA_USB_HSPHY	S3C64XX_VA_USB_HSPHY
+
+/*
+ * ISA style IO, for each machine to sort out mappings for,
+ * if it implements it. We reserve two 16M regions for ISA.
+ */
+
+#define S3C2410_ADDR(x)		S3C_ADDR(x)
+
+#define S3C24XX_VA_ISA_WORD	S3C2410_ADDR(0x02000000)
+#define S3C24XX_VA_ISA_BYTE	S3C2410_ADDR(0x03000000)
+
+/* deal with the registers that move under the 2412/2413 */
+
+#if defined(CONFIG_CPU_S3C2412) || defined(CONFIG_CPU_S3C2413)
+#ifndef __ASSEMBLY__
+extern void __iomem *s3c24xx_va_gpio2;
+#endif
+#ifdef CONFIG_CPU_S3C2412_ONLY
+#define S3C24XX_VA_GPIO2	(S3C24XX_VA_GPIO + 0x10)
+#else
+#define S3C24XX_VA_GPIO2 s3c24xx_va_gpio2
+#endif
+#else
+#define s3c24xx_va_gpio2 S3C24XX_VA_GPIO
+#define S3C24XX_VA_GPIO2 S3C24XX_VA_GPIO
+#endif
+
+#include <plat/map-s5p.h>
+
+#endif /* __ASM_PLAT_MAP_S3C_H */
diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-samsung/include/plat/map-s5p.h
similarity index 94%
rename from arch/arm/plat-s5p/include/plat/map-s5p.h
rename to arch/arm/plat-samsung/include/plat/map-s5p.h
index 36d3551..c2d7bda 100644
--- a/arch/arm/plat-s5p/include/plat/map-s5p.h
+++ b/arch/arm/plat-samsung/include/plat/map-s5p.h
@@ -1,4 +1,4 @@
-/* linux/arch/arm/plat-s5p/include/plat/map-s5p.h
+/* linux/arch/arm/plat-samsung/include/plat/map-s5p.h
  *
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
@@ -40,8 +40,6 @@
 #define S5P_VA_GIC_CPU		S3C_ADDR(0x02810000)
 #define S5P_VA_GIC_DIST		S3C_ADDR(0x02820000)
 
-#define S3C_VA_USB_HSPHY	S3C_ADDR(0x02900000)
-
 #define VA_VIC(x)		(S3C_VA_IRQ + ((x) * 0x10000))
 #define VA_VIC0			VA_VIC(0)
 #define VA_VIC1			VA_VIC(1)
@@ -58,4 +56,6 @@
 #define S3C_UART_OFFSET		(0x400)
 #endif
 
+#include <plat/map-s3c.h>
+
 #endif /* __ASM_PLAT_MAP_S5P_H */
-- 
1.7.1

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Cleanup map.h file
Date: Thu, 10 Feb 2011 14:44:46 +0900
Message-ID: <1297316686-21138-2-git-send-email-kgene.kim@samsung.com>
References: <1297316686-21138-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55523 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab1BJGNj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Feb 2011 01:13:39 -0500
In-Reply-To: <1297316686-21138-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/include/mach/map.h |   83 +++++++++++++++---------------
 1 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index a9365e5..95c9125 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s5p64x0/include/mach/map.h
  *
- * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2009-2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
  * S5P64X0 - Memory map definitions
@@ -16,64 +16,46 @@
 #include <plat/map-base.h>
 #include <plat/map-s5p.h>
 
-#define S5P64X0_PA_SDRAM	(0x20000000)
+#define S5P64X0_PA_SDRAM	0x20000000
 
-#define S5P64X0_PA_CHIPID	(0xE0000000)
-#define S5P_PA_CHIPID		S5P64X0_PA_CHIPID
-
-#define S5P64X0_PA_SYSCON	(0xE0100000)
-#define S5P_PA_SYSCON		S5P64X0_PA_SYSCON
-
-#define S5P64X0_PA_GPIO		(0xE0308000)
-
-#define S5P64X0_PA_VIC0		(0xE4000000)
-#define S5P64X0_PA_VIC1		(0xE4100000)
+#define S5P64X0_PA_CHIPID	0xE0000000
 
-#define S5P64X0_PA_SROMC	(0xE7000000)
-#define S5P_PA_SROMC		S5P64X0_PA_SROMC
-
-#define S5P64X0_PA_PDMA		(0xE9000000)
-
-#define S5P64X0_PA_TIMER	(0xEA000000)
-#define S5P_PA_TIMER		S5P64X0_PA_TIMER
+#define S5P64X0_PA_SYSCON	0xE0100000
 
-#define S5P64X0_PA_RTC		(0xEA100000)
+#define S5P64X0_PA_GPIO		0xE0308000
 
-#define S5P64X0_PA_WDT		(0xEA200000)
+#define S5P64X0_PA_VIC0		0xE4000000
+#define S5P64X0_PA_VIC1		0xE4100000
 
-#define S5P6440_PA_UART(x)	(0xEC000000 + ((x) * S3C_UART_OFFSET))
-#define S5P6450_PA_UART(x)	((x < 5) ? (0xEC800000 + ((x) * S3C_UART_OFFSET)) : (0xEC000000))
+#define S5P64X0_PA_SROMC	0xE7000000
 
-#define S5P_PA_UART0		S5P6450_PA_UART(0)
-#define S5P_PA_UART1		S5P6450_PA_UART(1)
-#define S5P_PA_UART2		S5P6450_PA_UART(2)
-#define S5P_PA_UART3		S5P6450_PA_UART(3)
-#define S5P_PA_UART4		S5P6450_PA_UART(4)
-#define S5P_PA_UART5		S5P6450_PA_UART(5)
+#define S5P64X0_PA_PDMA		0xE9000000
 
-#define S5P_SZ_UART		SZ_256
+#define S5P64X0_PA_TIMER	0xEA000000
+#define S5P64X0_PA_RTC		0xEA100000
+#define S5P64X0_PA_WDT		0xEA200000
 
-#define S5P6440_PA_IIC0		(0xEC104000)
-#define S5P6440_PA_IIC1		(0xEC20F000)
-#define S5P6450_PA_IIC0		(0xEC100000)
-#define S5P6450_PA_IIC1		(0xEC200000)
+#define S5P6440_PA_IIC0		0xEC104000
+#define S5P6440_PA_IIC1		0xEC20F000
+#define S5P6450_PA_IIC0		0xEC100000
+#define S5P6450_PA_IIC1		0xEC200000
 
-#define S5P64X0_PA_SPI0		(0xEC400000)
-#define S5P64X0_PA_SPI1		(0xEC500000)
+#define S5P64X0_PA_SPI0		0xEC400000
+#define S5P64X0_PA_SPI1		0xEC500000
 
-#define S5P64X0_PA_HSOTG	(0xED100000)
+#define S5P64X0_PA_HSOTG	0xED100000
 
 #define S5P64X0_PA_HSMMC(x)	(0xED800000 + ((x) * 0x100000))
 
-#define S5P64X0_PA_I2S		(0xF2000000)
+#define S5P64X0_PA_I2S		0xF2000000
 #define S5P6450_PA_I2S1		0xF2800000
 #define S5P6450_PA_I2S2		0xF2900000
 
-#define S5P64X0_PA_PCM		(0xF2100000)
+#define S5P64X0_PA_PCM		0xF2100000
 
-#define S5P64X0_PA_ADC		(0xF3000000)
+#define S5P64X0_PA_ADC		0xF3000000
 
-/* compatibiltiy defines. */
+/* Compatibiltiy Defines */
 
 #define S3C_PA_HSMMC0		S5P64X0_PA_HSMMC(0)
 #define S3C_PA_HSMMC1		S5P64X0_PA_HSMMC(1)
@@ -83,6 +65,25 @@
 #define S3C_PA_RTC		S5P64X0_PA_RTC
 #define S3C_PA_WDT		S5P64X0_PA_WDT
 
+#define S5P_PA_CHIPID		S5P64X0_PA_CHIPID
+#define S5P_PA_SROMC		S5P64X0_PA_SROMC
+#define S5P_PA_SYSCON		S5P64X0_PA_SYSCON
+#define S5P_PA_TIMER		S5P64X0_PA_TIMER
+
 #define SAMSUNG_PA_ADC		S5P64X0_PA_ADC
 
+/* UART */
+
+#define S5P6440_PA_UART(x)	(0xEC000000 + ((x) * S3C_UART_OFFSET))
+#define S5P6450_PA_UART(x)	((x < 5) ? (0xEC800000 + ((x) * S3C_UART_OFFSET)) : (0xEC000000))
+
+#define S5P_PA_UART0		S5P6450_PA_UART(0)
+#define S5P_PA_UART1		S5P6450_PA_UART(1)
+#define S5P_PA_UART2		S5P6450_PA_UART(2)
+#define S5P_PA_UART3		S5P6450_PA_UART(3)
+#define S5P_PA_UART4		S5P6450_PA_UART(4)
+#define S5P_PA_UART5		S5P6450_PA_UART(5)
+
+#define S5P_SZ_UART		SZ_256
+
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.7.1

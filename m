From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV210: Cleanup map.h file
Date: Tue,  1 Feb 2011 17:49:08 +0900
Message-ID: <1296550149-19084-2-git-send-email-kgene.kim@samsung.com>
References: <1296550149-19084-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52870 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752808Ab1BAJQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Feb 2011 04:16:42 -0500
In-Reply-To: <1296550149-19084-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/map.h |  168 +++++++++++++++---------------
 1 files changed, 83 insertions(+), 85 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 3611492..1dd5883 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s5pv210/include/mach/map.h
  *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
  * S5PV210 - Memory map definitions
@@ -16,122 +16,120 @@
 #include <plat/map-base.h>
 #include <plat/map-s5p.h>
 
-#define S5PV210_PA_SROM_BANK5	(0xA8000000)
+#define S5PV210_PA_SDRAM		0x20000000
 
-#define S5PC110_PA_ONENAND	(0xB0000000)
-#define S5P_PA_ONENAND		S5PC110_PA_ONENAND
+#define S5PV210_PA_SROM_BANK5		0xA8000000
 
-#define S5PC110_PA_ONENAND_DMA	(0xB0600000)
-#define S5P_PA_ONENAND_DMA	S5PC110_PA_ONENAND_DMA
+#define S5PC110_PA_ONENAND		0xB0000000
+#define S5PC110_PA_ONENAND_DMA		0xB0600000
 
-#define S5PV210_PA_CHIPID	(0xE0000000)
-#define S5P_PA_CHIPID		S5PV210_PA_CHIPID
+#define S5PV210_PA_CHIPID		0xE0000000
 
-#define S5PV210_PA_SYSCON	(0xE0100000)
-#define S5P_PA_SYSCON		S5PV210_PA_SYSCON
+#define S5PV210_PA_SYSCON		0xE0100000
 
-#define S5PV210_PA_GPIO		(0xE0200000)
+#define S5PV210_PA_GPIO			0xE0200000
 
-/* SPI */
-#define S5PV210_PA_SPI0		0xE1300000
-#define S5PV210_PA_SPI1		0xE1400000
+#define S5PV210_PA_SPDIF		0xE1100000
 
-#define S5PV210_PA_KEYPAD	(0xE1600000)
+#define S5PV210_PA_SPI0			0xE1300000
+#define S5PV210_PA_SPI1			0xE1400000
 
-#define S5PV210_PA_IIC0		(0xE1800000)
-#define S5PV210_PA_IIC1		(0xFAB00000)
-#define S5PV210_PA_IIC2		(0xE1A00000)
+#define S5PV210_PA_KEYPAD		0xE1600000
 
-#define S5PV210_PA_TIMER	(0xE2500000)
-#define S5P_PA_TIMER		S5PV210_PA_TIMER
+#define S5PV210_PA_ADC			0xE1700000
 
-#define S5PV210_PA_SYSTIMER	(0xE2600000)
+#define S5PV210_PA_IIC0			0xE1800000
+#define S5PV210_PA_IIC1			0xFAB00000
+#define S5PV210_PA_IIC2			0xE1A00000
 
-#define S5PV210_PA_WATCHDOG	(0xE2700000)
+#define S5PV210_PA_AC97			0xE2200000
 
-#define S5PV210_PA_RTC		(0xE2800000)
-#define S5PV210_PA_UART		(0xE2900000)
+#define S5PV210_PA_PCM0			0xE2300000
+#define S5PV210_PA_PCM1			0xE1200000
+#define S5PV210_PA_PCM2			0xE2B00000
 
-#define S5P_PA_UART0		(S5PV210_PA_UART + 0x0)
-#define S5P_PA_UART1		(S5PV210_PA_UART + 0x400)
-#define S5P_PA_UART2		(S5PV210_PA_UART + 0x800)
-#define S5P_PA_UART3		(S5PV210_PA_UART + 0xC00)
+#define S5PV210_PA_TIMER		0xE2500000
+#define S5PV210_PA_SYSTIMER		0xE2600000
+#define S5PV210_PA_WATCHDOG		0xE2700000
+#define S5PV210_PA_RTC			0xE2800000
 
-#define S5P_SZ_UART		SZ_256
+#define S5PV210_PA_UART			0xE2900000
 
-#define S3C_VA_UARTx(x)		(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
+#define S5PV210_PA_SROMC		0xE8000000
 
-#define S5PV210_PA_SROMC	(0xE8000000)
-#define S5P_PA_SROMC		S5PV210_PA_SROMC
+#define S5PV210_PA_CFCON		0xE8200000
 
-#define S5PV210_PA_CFCON	(0xE8200000)
+#define S5PV210_PA_HSMMC(x)		(0xEB000000 + ((x) * 0x100000))
 
-#define S5PV210_PA_MDMA		0xFA200000
-#define S5PV210_PA_PDMA0	0xE0900000
-#define S5PV210_PA_PDMA1	0xE0A00000
+#define S5PV210_PA_HSOTG		0xEC000000
+#define S5PV210_PA_HSPHY		0xEC100000
 
-#define S5PV210_PA_FB		(0xF8000000)
+#define S5PV210_PA_IIS0			0xEEE30000
+#define S5PV210_PA_IIS1			0xE2100000
+#define S5PV210_PA_IIS2			0xE2A00000
 
-#define S5PV210_PA_FIMC0	(0xFB200000)
-#define S5PV210_PA_FIMC1	(0xFB300000)
-#define S5PV210_PA_FIMC2	(0xFB400000)
+#define S5PV210_PA_DMC0			0xF0000000
+#define S5PV210_PA_DMC1			0xF1400000
 
-#define S5PV210_PA_HSMMC(x)	(0xEB000000 + ((x) * 0x100000))
+#define S5PV210_PA_VIC0			0xF2000000
+#define S5PV210_PA_VIC1			0xF2100000
+#define S5PV210_PA_VIC2			0xF2200000
+#define S5PV210_PA_VIC3			0xF2300000
 
-#define S5PV210_PA_HSOTG	(0xEC000000)
-#define S5PV210_PA_HSPHY	(0xEC100000)
+#define S5PV210_PA_FB			0xF8000000
 
-#define S5PV210_PA_VIC0		(0xF2000000)
-#define S5PV210_PA_VIC1		(0xF2100000)
-#define S5PV210_PA_VIC2		(0xF2200000)
-#define S5PV210_PA_VIC3		(0xF2300000)
+#define S5PV210_PA_MDMA			0xFA200000
+#define S5PV210_PA_PDMA0		0xE0900000
+#define S5PV210_PA_PDMA1		0xE0A00000
 
-#define S5PV210_PA_SDRAM	(0x20000000)
-#define S5P_PA_SDRAM		S5PV210_PA_SDRAM
+#define S5PV210_PA_MIPI_CSIS		0xFA600000
 
-/* S/PDIF */
-#define S5PV210_PA_SPDIF	0xE1100000
+#define S5PV210_PA_FIMC0		0xFB200000
+#define S5PV210_PA_FIMC1		0xFB300000
+#define S5PV210_PA_FIMC2		0xFB400000
 
-/* I2S */
-#define S5PV210_PA_IIS0		0xEEE30000
-#define S5PV210_PA_IIS1		0xE2100000
-#define S5PV210_PA_IIS2		0xE2A00000
+/* Compatibiltiy Defines */
 
-/* PCM */
-#define S5PV210_PA_PCM0		0xE2300000
-#define S5PV210_PA_PCM1		0xE1200000
-#define S5PV210_PA_PCM2		0xE2B00000
+#define S3C_PA_FB			S5PV210_PA_FB
+#define S3C_PA_HSMMC0			S5PV210_PA_HSMMC(0)
+#define S3C_PA_HSMMC1			S5PV210_PA_HSMMC(1)
+#define S3C_PA_HSMMC2			S5PV210_PA_HSMMC(2)
+#define S3C_PA_HSMMC3			S5PV210_PA_HSMMC(3)
+#define S3C_PA_IIC			S5PV210_PA_IIC0
+#define S3C_PA_IIC1			S5PV210_PA_IIC1
+#define S3C_PA_IIC2			S5PV210_PA_IIC2
+#define S3C_PA_RTC			S5PV210_PA_RTC
+#define S3C_PA_USB_HSOTG		S5PV210_PA_HSOTG
+#define S3C_PA_WDT			S5PV210_PA_WATCHDOG
 
-/* AC97 */
-#define S5PV210_PA_AC97		0xE2200000
+#define S5P_PA_CHIPID			S5PV210_PA_CHIPID
+#define S5P_PA_FIMC0			S5PV210_PA_FIMC0
+#define S5P_PA_FIMC1			S5PV210_PA_FIMC1
+#define S5P_PA_FIMC2			S5PV210_PA_FIMC2
+#define S5P_PA_MIPI_CSIS0		S5PV210_PA_MIPI_CSIS
+#define S5P_PA_ONENAND			S5PC110_PA_ONENAND
+#define S5P_PA_ONENAND_DMA		S5PC110_PA_ONENAND_DMA
+#define S5P_PA_SDRAM			S5PV210_PA_SDRAM
+#define S5P_PA_SROMC			S5PV210_PA_SROMC
+#define S5P_PA_SYSCON			S5PV210_PA_SYSCON
+#define S5P_PA_TIMER			S5PV210_PA_TIMER
 
-#define S5PV210_PA_ADC		(0xE1700000)
+#define SAMSUNG_PA_ADC			S5PV210_PA_ADC
+#define SAMSUNG_PA_CFCON		S5PV210_PA_CFCON
+#define SAMSUNG_PA_KEYPAD		S5PV210_PA_KEYPAD
 
-#define S5PV210_PA_DMC0		(0xF0000000)
-#define S5PV210_PA_DMC1		(0xF1400000)
+/* UART */
 
-#define S5PV210_PA_MIPI_CSIS	0xFA600000
+#define S3C_VA_UARTx(x)			(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
 
-/* compatibiltiy defines. */
-#define S3C_PA_UART		S5PV210_PA_UART
-#define S3C_PA_HSMMC0		S5PV210_PA_HSMMC(0)
-#define S3C_PA_HSMMC1		S5PV210_PA_HSMMC(1)
-#define S3C_PA_HSMMC2		S5PV210_PA_HSMMC(2)
-#define S3C_PA_HSMMC3		S5PV210_PA_HSMMC(3)
-#define S3C_PA_IIC		S5PV210_PA_IIC0
-#define S3C_PA_IIC1		S5PV210_PA_IIC1
-#define S3C_PA_IIC2		S5PV210_PA_IIC2
-#define S3C_PA_FB		S5PV210_PA_FB
-#define S3C_PA_RTC		S5PV210_PA_RTC
-#define S3C_PA_WDT		S5PV210_PA_WATCHDOG
-#define S3C_PA_USB_HSOTG	S5PV210_PA_HSOTG
-#define S5P_PA_FIMC0		S5PV210_PA_FIMC0
-#define S5P_PA_FIMC1		S5PV210_PA_FIMC1
-#define S5P_PA_FIMC2		S5PV210_PA_FIMC2
-#define S5P_PA_MIPI_CSIS0	S5PV210_PA_MIPI_CSIS
+#define S3C_PA_UART			S5PV210_PA_UART
 
-#define SAMSUNG_PA_ADC		S5PV210_PA_ADC
-#define SAMSUNG_PA_CFCON	S5PV210_PA_CFCON
-#define SAMSUNG_PA_KEYPAD	S5PV210_PA_KEYPAD
+#define S5P_PA_UART(x)			(S3C_PA_UART + ((x) * S3C_UART_OFFSET))
+#define S5P_PA_UART0			S5P_PA_UART(0)
+#define S5P_PA_UART1			S5P_PA_UART(1)
+#define S5P_PA_UART2			S5P_PA_UART(2)
+#define S5P_PA_UART3			S5P_PA_UART(3)
+
+#define S5P_SZ_UART			SZ_256
 
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.7.1

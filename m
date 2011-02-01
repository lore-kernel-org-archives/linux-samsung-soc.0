From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] ARM: S5PC100: Clenaup map.h file
Date: Tue,  1 Feb 2011 17:49:09 +0900
Message-ID: <1296550149-19084-3-git-send-email-kgene.kim@samsung.com>
References: <1296550149-19084-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52864 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752Ab1BAJQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Feb 2011 04:16:42 -0500
In-Reply-To: <1296550149-19084-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pc100/include/mach/map.h |  193 +++++++++++++-----------------
 1 files changed, 83 insertions(+), 110 deletions(-)

diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index 328467b..ccbe6b7 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -1,5 +1,8 @@
 /* linux/arch/arm/mach-s5pc100/include/mach/map.h
  *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
  * Copyright 2009 Samsung Electronics Co.
  *	Byungho Min <bhmin@samsung.com>
  *
@@ -16,145 +19,115 @@
 #include <plat/map-base.h>
 #include <plat/map-s5p.h>
 
-/*
- * map-base.h has already defined virtual memory address
- * S3C_VA_IRQ		S3C_ADDR(0x00000000)	irq controller(s)
- * S3C_VA_SYS		S3C_ADDR(0x00100000)	system control
- * S3C_VA_MEM		S3C_ADDR(0x00200000)	system control (not used)
- * S3C_VA_TIMER		S3C_ADDR(0x00300000)	timer block
- * S3C_VA_WATCHDOG	S3C_ADDR(0x00400000)	watchdog
- * S3C_VA_UART		S3C_ADDR(0x01000000)	UART
- *
- * S5PC100 specific virtual memory address can be defined here
- * S5PC1XX_VA_GPIO	S3C_ADDR(0x00500000)	GPIO
- *
- */
+#define S5PC100_PA_SDRAM		0x20000000
+
+#define S5PC100_PA_ONENAND		0xE7100000
+#define S5PC100_PA_ONENAND_BUF		0xB0000000
+
+#define S5PC100_PA_CHIPID		0xE0000000
 
-#define S5PC100_PA_ONENAND_BUF	(0xB0000000)
-#define S5PC100_SZ_ONENAND_BUF	(SZ_256M - SZ_32M)
+#define S5PC100_PA_SYSCON		0xE0100000
 
-/* Chip ID */
+#define S5PC100_PA_OTHERS		0xE0200000
 
-#define S5PC100_PA_CHIPID	(0xE0000000)
-#define S5P_PA_CHIPID		S5PC100_PA_CHIPID
+#define S5PC100_PA_GPIO			0xE0300000
 
-#define S5PC100_PA_SYSCON	(0xE0100000)
-#define S5P_PA_SYSCON		S5PC100_PA_SYSCON
+#define S5PC100_PA_VIC0			0xE4000000
+#define S5PC100_PA_VIC1			0xE4100000
+#define S5PC100_PA_VIC2			0xE4200000
 
-#define S5PC100_PA_OTHERS	(0xE0200000)
-#define S5PC100_VA_OTHERS	(S3C_VA_SYS + 0x10000)
+#define S5PC100_PA_SROMC		0xE7000000
 
-#define S5PC100_PA_GPIO		(0xE0300000)
-#define S5PC1XX_VA_GPIO		S3C_ADDR(0x00500000)
+#define S5PC100_PA_CFCON		0xE7800000
 
-/* Interrupt */
-#define S5PC100_PA_VIC0		(0xE4000000)
-#define S5PC100_PA_VIC1		(0xE4100000)
-#define S5PC100_PA_VIC2		(0xE4200000)
-#define S5PC100_VA_VIC		S3C_VA_IRQ
-#define S5PC100_VA_VIC_OFFSET	0x10000
-#define S5PC1XX_VA_VIC(x)	(S5PC100_VA_VIC + ((x) * S5PC100_VA_VIC_OFFSET))
+#define S5PC100_PA_MDMA			0xE8100000
+#define S5PC100_PA_PDMA0		0xE9000000
+#define S5PC100_PA_PDMA1		0xE9200000
 
-#define S5PC100_PA_SROMC	(0xE7000000)
-#define S5P_PA_SROMC		S5PC100_PA_SROMC
+#define S5PC100_PA_TIMER		0xEA000000
+#define S5PC100_PA_SYSTIMER		0xEA100000
+#define S5PC100_PA_WATCHDOG		0xEA200000
+#define S5PC100_PA_RTC			0xEA300000
 
-#define S5PC100_PA_ONENAND	(0xE7100000)
+#define S5PC100_PA_UART			0xEC000000
 
-#define S5PC100_PA_CFCON	(0xE7800000)
+#define S5PC100_PA_IIC0			0xEC100000
+#define S5PC100_PA_IIC1			0xEC200000
 
-/* DMA */
-#define S5PC100_PA_MDMA		(0xE8100000)
-#define S5PC100_PA_PDMA0	(0xE9000000)
-#define S5PC100_PA_PDMA1	(0xE9200000)
+#define S5PC100_PA_SPI0			0xEC300000
+#define S5PC100_PA_SPI1			0xEC400000
+#define S5PC100_PA_SPI2			0xEC500000
 
-/* Timer */
-#define S5PC100_PA_TIMER	(0xEA000000)
-#define S5P_PA_TIMER		S5PC100_PA_TIMER
+#define S5PC100_PA_USB_HSOTG		0xED200000
+#define S5PC100_PA_USB_HSPHY		0xED300000
 
-#define S5PC100_PA_SYSTIMER	(0xEA100000)
+#define S5PC100_PA_HSMMC(x)		(0xED800000 + ((x) * 0x100000))
 
-#define S5PC100_PA_WATCHDOG	(0xEA200000)
-#define S5PC100_PA_RTC		(0xEA300000)
+#define S5PC100_PA_FB			0xEE000000
 
-#define S5PC100_PA_UART		(0xEC000000)
+#define S5PC100_PA_FIMC0		0xEE200000
+#define S5PC100_PA_FIMC1		0xEE300000
+#define S5PC100_PA_FIMC2		0xEE400000
 
-#define S5P_PA_UART0		(S5PC100_PA_UART + 0x0)
-#define S5P_PA_UART1		(S5PC100_PA_UART + 0x400)
-#define S5P_PA_UART2		(S5PC100_PA_UART + 0x800)
-#define S5P_PA_UART3		(S5PC100_PA_UART + 0xC00)
-#define S5P_SZ_UART		SZ_256
+#define S5PC100_PA_I2S0			0xF2000000
+#define S5PC100_PA_I2S1			0xF2100000
+#define S5PC100_PA_I2S2			0xF2200000
 
-#define S5PC100_PA_IIC0		(0xEC100000)
-#define S5PC100_PA_IIC1		(0xEC200000)
+#define S5PC100_PA_AC97			0xF2300000
 
-/* SPI */
-#define S5PC100_PA_SPI0		0xEC300000
-#define S5PC100_PA_SPI1		0xEC400000
-#define S5PC100_PA_SPI2		0xEC500000
+#define S5PC100_PA_PCM0			0xF2400000
+#define S5PC100_PA_PCM1			0xF2500000
 
-/* USB HS OTG */
-#define S5PC100_PA_USB_HSOTG	(0xED200000)
-#define S5PC100_PA_USB_HSPHY	(0xED300000)
+#define S5PC100_PA_SPDIF		0xF2600000
 
-#define S5PC100_PA_FB		(0xEE000000)
+#define S5PC100_PA_TSADC		0xF3000000
 
-#define S5PC100_PA_FIMC0	(0xEE200000)
-#define S5PC100_PA_FIMC1	(0xEE300000)
-#define S5PC100_PA_FIMC2	(0xEE400000)
+#define S5PC100_PA_KEYPAD		0xF3100000
 
-#define S5PC100_PA_I2S0		(0xF2000000)
-#define S5PC100_PA_I2S1		(0xF2100000)
-#define S5PC100_PA_I2S2		(0xF2200000)
+/* Compatibiltiy Defines */
 
-#define S5PC100_PA_AC97		0xF2300000
+#define S3C_PA_FB			S5PC100_PA_FB
+#define S3C_PA_HSMMC0			S5PC100_PA_HSMMC(0)
+#define S3C_PA_HSMMC1			S5PC100_PA_HSMMC(1)
+#define S3C_PA_HSMMC2			S5PC100_PA_HSMMC(2)
+#define S3C_PA_IIC			S5PC100_PA_IIC0
+#define S3C_PA_IIC1			S5PC100_PA_IIC1
+#define S3C_PA_KEYPAD			S5PC100_PA_KEYPAD
+#define S3C_PA_ONENAND			S5PC100_PA_ONENAND
+#define S3C_PA_ONENAND_BUF		S5PC100_PA_ONENAND_BUF
+#define S3C_PA_RTC			S5PC100_PA_RTC
+#define S3C_PA_TSADC			S5PC100_PA_TSADC
+#define S3C_PA_USB_HSOTG		S5PC100_PA_USB_HSOTG
+#define S3C_PA_USB_HSPHY		S5PC100_PA_USB_HSPHY
+#define S3C_PA_WDT			S5PC100_PA_WATCHDOG
 
-/* PCM */
-#define S5PC100_PA_PCM0		0xF2400000
-#define S5PC100_PA_PCM1		0xF2500000
+#define S5P_PA_CHIPID			S5PC100_PA_CHIPID
+#define S5P_PA_FIMC0			S5PC100_PA_FIMC0
+#define S5P_PA_FIMC1			S5PC100_PA_FIMC1
+#define S5P_PA_FIMC2			S5PC100_PA_FIMC2
+#define S5P_PA_SDRAM			S5PC100_PA_SDRAM
+#define S5P_PA_SROMC			S5PC100_PA_SROMC
+#define S5P_PA_SYSCON			S5PC100_PA_SYSCON
+#define S5P_PA_TIMER			S5PC100_PA_TIMER
 
-#define S5PC100_PA_SPDIF	0xF2600000
+#define SAMSUNG_PA_ADC			S5PC100_PA_TSADC
+#define SAMSUNG_PA_CFCON		S5PC100_PA_CFCON
+#define SAMSUNG_PA_KEYPAD		S5PC100_PA_KEYPAD
 
-#define S5PC100_PA_TSADC	(0xF3000000)
+#define S5PC100_VA_OTHERS		(S3C_VA_SYS + 0x10000)
 
-/* KEYPAD */
-#define S5PC100_PA_KEYPAD	(0xF3100000)
+#define S3C_SZ_ONENAND_BUF		(SZ_256M - SZ_32M)
 
-#define S5PC100_PA_HSMMC(x)	(0xED800000 + ((x) * 0x100000))
+/* UART */
 
-#define S5PC100_PA_SDRAM	(0x20000000)
-#define S5P_PA_SDRAM		S5PC100_PA_SDRAM
+#define S3C_PA_UART			S5PC100_PA_UART
 
-/* compatibiltiy defines. */
-#define S3C_PA_UART		S5PC100_PA_UART
-#define S3C_PA_IIC		S5PC100_PA_IIC0
-#define S3C_PA_IIC1		S5PC100_PA_IIC1
-#define S3C_PA_FB		S5PC100_PA_FB
-#define S3C_PA_G2D		S5PC100_PA_G2D
-#define S3C_PA_G3D		S5PC100_PA_G3D
-#define S3C_PA_JPEG		S5PC100_PA_JPEG
-#define S3C_PA_ROTATOR		S5PC100_PA_ROTATOR
-#define S5P_VA_VIC0		S5PC1XX_VA_VIC(0)
-#define S5P_VA_VIC1		S5PC1XX_VA_VIC(1)
-#define S5P_VA_VIC2		S5PC1XX_VA_VIC(2)
-#define S3C_PA_USB_HSOTG	S5PC100_PA_USB_HSOTG
-#define S3C_PA_USB_HSPHY	S5PC100_PA_USB_HSPHY
-#define S3C_PA_HSMMC0		S5PC100_PA_HSMMC(0)
-#define S3C_PA_HSMMC1		S5PC100_PA_HSMMC(1)
-#define S3C_PA_HSMMC2		S5PC100_PA_HSMMC(2)
-#define S3C_PA_KEYPAD		S5PC100_PA_KEYPAD
-#define S3C_PA_WDT		S5PC100_PA_WATCHDOG
-#define S3C_PA_TSADC		S5PC100_PA_TSADC
-#define S3C_PA_ONENAND		S5PC100_PA_ONENAND
-#define S3C_PA_ONENAND_BUF	S5PC100_PA_ONENAND_BUF
-#define S3C_SZ_ONENAND_BUF	S5PC100_SZ_ONENAND_BUF
-#define S3C_PA_RTC		S5PC100_PA_RTC
-
-#define SAMSUNG_PA_ADC		S5PC100_PA_TSADC
-#define SAMSUNG_PA_CFCON	S5PC100_PA_CFCON
-#define SAMSUNG_PA_KEYPAD	S5PC100_PA_KEYPAD
+#define S5P_PA_UART(x)			(S3C_PA_UART + ((x) * S3C_UART_OFFSET))
+#define S5P_PA_UART0			S5P_PA_UART(0)
+#define S5P_PA_UART1			S5P_PA_UART(1)
+#define S5P_PA_UART2			S5P_PA_UART(2)
+#define S5P_PA_UART3			S5P_PA_UART(3)
 
-#define S5P_PA_FIMC0		S5PC100_PA_FIMC0
-#define S5P_PA_FIMC1		S5PC100_PA_FIMC1
-#define S5P_PA_FIMC2		S5PC100_PA_FIMC2
+#define S5P_SZ_UART			SZ_256
 
-#endif /* __ASM_ARCH_C100_MAP_H */
+#endif /* __ASM_ARCH_MAP_H */
-- 
1.7.1

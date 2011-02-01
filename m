From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/3] ARM: S5PV310: Cleanup map.h file
Date: Tue,  1 Feb 2011 17:49:07 +0900
Message-ID: <1296550149-19084-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52867 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751916Ab1BAJQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Feb 2011 04:16:42 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/map.h |  149 +++++++++++++++---------------
 1 files changed, 73 insertions(+), 76 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 3060f78..901657f 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s5pv310/include/mach/map.h
  *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
  * S5PV310 - Memory map definitions
@@ -23,90 +23,43 @@
 
 #include <plat/map-s5p.h>
 
-#define S5PV310_PA_SYSRAM		(0x02025000)
+#define S5PV310_PA_SYSRAM		0x02025000
 
-#define S5PV310_PA_SROM_BANK(x)		(0x04000000 + ((x) * 0x01000000))
-
-#define S5PC210_PA_ONENAND		(0x0C000000)
-#define S5P_PA_ONENAND			S5PC210_PA_ONENAND
-
-#define S5PC210_PA_ONENAND_DMA		(0x0C600000)
-#define S5P_PA_ONENAND_DMA		S5PC210_PA_ONENAND_DMA
-
-#define S5PV310_PA_CHIPID		(0x10000000)
-#define S5P_PA_CHIPID			S5PV310_PA_CHIPID
-
-#define S5PV310_PA_SYSCON		(0x10010000)
-#define S5P_PA_SYSCON			S5PV310_PA_SYSCON
+#define S5PV310_PA_I2S0			0x03830000
+#define S5PV310_PA_I2S1			0xE3100000
+#define S5PV310_PA_I2S2			0xE2A00000
 
-#define S5PV310_PA_PMU			(0x10020000)
+#define S5PV310_PA_PCM0			0x03840000
+#define S5PV310_PA_PCM1			0x13980000
+#define S5PV310_PA_PCM2			0x13990000
 
-#define S5PV310_PA_CMU			(0x10030000)
-
-#define S5PV310_PA_WATCHDOG		(0x10060000)
-#define S5PV310_PA_RTC			(0x10070000)
-
-#define S5PV310_PA_DMC0			(0x10400000)
-
-#define S5PV310_PA_COMBINER		(0x10448000)
-
-#define S5PV310_PA_COREPERI		(0x10500000)
-#define S5PV310_PA_GIC_CPU		(0x10500100)
-#define S5PV310_PA_TWD			(0x10500600)
-#define S5PV310_PA_GIC_DIST		(0x10501000)
-#define S5PV310_PA_L2CC			(0x10502000)
-
-/* DMA */
-#define S5PV310_PA_MDMA		0x10810000
-#define S5PV310_PA_PDMA0	0x12680000
-#define S5PV310_PA_PDMA1	0x12690000
-
-#define S5PV310_PA_GPIO1		(0x11400000)
-#define S5PV310_PA_GPIO2		(0x11000000)
-#define S5PV310_PA_GPIO3		(0x03860000)
-
-#define S5PV310_PA_MIPI_CSIS0		0x11880000
-#define S5PV310_PA_MIPI_CSIS1		0x11890000
+#define S5PV310_PA_SROM_BANK(x)		(0x04000000 + ((x) * 0x01000000))
 
-#define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
+#define S5PC210_PA_ONENAND		0x0C000000
+#define S5PC210_PA_ONENAND_DMA		0x0C600000
 
-#define S5PV310_PA_SROMC		(0x12570000)
-#define S5P_PA_SROMC			S5PV310_PA_SROMC
+#define S5PV310_PA_CHIPID		0x10000000
 
-/* S/PDIF */
-#define S5PV310_PA_SPDIF	0xE1100000
+#define S5PV310_PA_SYSCON		0x10010000
+#define S5PV310_PA_PMU			0x10020000
+#define S5PV310_PA_CMU			0x10030000
 
-/* I2S */
-#define S5PV310_PA_I2S0		0x03830000
-#define S5PV310_PA_I2S1		0xE3100000
-#define S5PV310_PA_I2S2		0xE2A00000
+#define S5PV310_PA_WATCHDOG		0x10060000
+#define S5PV310_PA_RTC			0x10070000
 
-/* PCM */
-#define S5PV310_PA_PCM0		0x03840000
-#define S5PV310_PA_PCM1		0x13980000
-#define S5PV310_PA_PCM2		0x13990000
+#define S5PV310_PA_DMC0			0x10400000
 
-/* AC97 */
-#define S5PV310_PA_AC97		0x139A0000
+#define S5PV310_PA_COMBINER		0x10448000
 
-#define S5PV310_PA_UART			(0x13800000)
+#define S5PV310_PA_COREPERI		0x10500000
+#define S5PV310_PA_GIC_CPU		0x10500100
+#define S5PV310_PA_TWD			0x10500600
+#define S5PV310_PA_GIC_DIST		0x10501000
+#define S5PV310_PA_L2CC			0x10502000
 
-#define S5P_PA_UART(x)			(S5PV310_PA_UART + ((x) * S3C_UART_OFFSET))
-#define S5P_PA_UART0			S5P_PA_UART(0)
-#define S5P_PA_UART1			S5P_PA_UART(1)
-#define S5P_PA_UART2			S5P_PA_UART(2)
-#define S5P_PA_UART3			S5P_PA_UART(3)
-#define S5P_PA_UART4			S5P_PA_UART(4)
-
-#define S5P_SZ_UART			SZ_256
-
-#define S5PV310_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
-
-#define S5PV310_PA_TIMER		(0x139D0000)
-#define S5P_PA_TIMER			S5PV310_PA_TIMER
-
-#define S5PV310_PA_SDRAM		(0x40000000)
-#define S5P_PA_SDRAM			S5PV310_PA_SDRAM
+#define S5PV310_PA_MDMA			0x10810000
+#define S5PV310_PA_PDMA0		0x12680000
+#define S5PV310_PA_PDMA1		0x12690000
 
 #define S5PV310_PA_SYSMMU_MDMA		0x10A40000
 #define S5PV310_PA_SYSMMU_SSS		0x10A50000
@@ -125,8 +78,31 @@
 #define S5PV310_PA_SYSMMU_MFC_L		0x13620000
 #define S5PV310_PA_SYSMMU_MFC_R		0x13630000
 
-/* compatibiltiy defines. */
-#define S3C_PA_UART			S5PV310_PA_UART
+#define S5PV310_PA_GPIO1		0x11400000
+#define S5PV310_PA_GPIO2		0x11000000
+#define S5PV310_PA_GPIO3		0x03860000
+
+#define S5PV310_PA_MIPI_CSIS0		0x11880000
+#define S5PV310_PA_MIPI_CSIS1		0x11890000
+
+#define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
+
+#define S5PV310_PA_SROMC		0x12570000
+
+#define S5PV310_PA_UART			0x13800000
+
+#define S5PV310_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
+
+#define S5PV310_PA_AC97			0x139A0000
+
+#define S5PV310_PA_TIMER		0x139D0000
+
+#define S5PV310_PA_SDRAM		0x40000000
+
+#define S5PV310_PA_SPDIF		0xE1100000
+
+/* Compatibiltiy Defines */
+
 #define S3C_PA_HSMMC0			S5PV310_PA_HSMMC(0)
 #define S3C_PA_HSMMC1			S5PV310_PA_HSMMC(1)
 #define S3C_PA_HSMMC2			S5PV310_PA_HSMMC(2)
@@ -141,7 +117,28 @@
 #define S3C_PA_IIC7			S5PV310_PA_IIC(7)
 #define S3C_PA_RTC			S5PV310_PA_RTC
 #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
+
+#define S5P_PA_CHIPID			S5PV310_PA_CHIPID
 #define S5P_PA_MIPI_CSIS0		S5PV310_PA_MIPI_CSIS0
 #define S5P_PA_MIPI_CSIS1		S5PV310_PA_MIPI_CSIS1
+#define S5P_PA_ONENAND			S5PC210_PA_ONENAND
+#define S5P_PA_ONENAND_DMA		S5PC210_PA_ONENAND_DMA
+#define S5P_PA_SDRAM			S5PV310_PA_SDRAM
+#define S5P_PA_SROMC			S5PV310_PA_SROMC
+#define S5P_PA_SYSCON			S5PV310_PA_SYSCON
+#define S5P_PA_TIMER			S5PV310_PA_TIMER
+
+/* UART */
+
+#define S3C_PA_UART			S5PV310_PA_UART
+
+#define S5P_PA_UART(x)			(S3C_PA_UART + ((x) * S3C_UART_OFFSET))
+#define S5P_PA_UART0			S5P_PA_UART(0)
+#define S5P_PA_UART1			S5P_PA_UART(1)
+#define S5P_PA_UART2			S5P_PA_UART(2)
+#define S5P_PA_UART3			S5P_PA_UART(3)
+#define S5P_PA_UART4			S5P_PA_UART(4)
+
+#define S5P_SZ_UART			SZ_256
 
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.7.1

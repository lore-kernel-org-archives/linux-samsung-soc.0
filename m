From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] ARM: S5PC1XX: Fix tabbing in regs-clock.c
Date: Tue, 12 Jan 2010 04:20:17 +0000
Message-ID: <1263270017-25155-9-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-4-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-5-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-6-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-7-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-8-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40846 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753379Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006aA-SI
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-8-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

Fix the tabbing in regs-clock.h

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s5pc1xx/include/plat/regs-clock.h |   70 +++++++++++-----------
 1 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h b/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
index e88562e..53012d0 100644
--- a/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
+++ b/arch/arm/plat-s5pc1xx/include/plat/regs-clock.h
@@ -88,10 +88,10 @@
 #define S5PC100_CLKDIV0_APLL_SHIFT		(0)
 #define S5PC100_CLKDIV0_ARM_MASK		(0x7<<4)
 #define S5PC100_CLKDIV0_ARM_SHIFT		(4)
-#define S5PC100_CLKDIV0_D0_MASK		(0x7<<8)
+#define S5PC100_CLKDIV0_D0_MASK			(0x7<<8)
 #define S5PC100_CLKDIV0_D0_SHIFT		(8)
 #define S5PC100_CLKDIV0_PCLKD0_MASK		(0x7<<12)
-#define S5PC100_CLKDIV0_PCLKD0_SHIFT	(12)
+#define S5PC100_CLKDIV0_PCLKD0_SHIFT		(12)
 #define S5PC100_CLKDIV0_SECSS_MASK		(0x7<<16)
 #define S5PC100_CLKDIV0_SECSS_SHIFT		(16)
 
@@ -102,12 +102,12 @@
 #define S5PC100_CLKDIV1_MPLL_SHIFT		(4)
 #define S5PC100_CLKDIV1_MPLL2_MASK		(0x1<<8)
 #define S5PC100_CLKDIV1_MPLL2_SHIFT		(8)
-#define S5PC100_CLKDIV1_D1_MASK		(0x7<<12)
+#define S5PC100_CLKDIV1_D1_MASK			(0x7<<12)
 #define S5PC100_CLKDIV1_D1_SHIFT		(12)
 #define S5PC100_CLKDIV1_PCLKD1_MASK		(0x7<<16)
-#define S5PC100_CLKDIV1_PCLKD1_SHIFT	(16)
-#define S5PC100_CLKDIV1_ONENAND_MASK	(0x3<<20)
-#define S5PC100_CLKDIV1_ONENAND_SHIFT	(20)
+#define S5PC100_CLKDIV1_PCLKD1_SHIFT		(16)
+#define S5PC100_CLKDIV1_ONENAND_MASK		(0x3<<20)
+#define S5PC100_CLKDIV1_ONENAND_SHIFT		(20)
 #define S5PC100_CLKDIV1_CAM_MASK		(0x1F<<24)
 #define S5PC100_CLKDIV1_CAM_SHIFT		(24)
 
@@ -147,21 +147,21 @@
 #define S5PC100_CLKGATE_D00_TZIC		(1<<1)
 #define S5PC100_CLKGATE_D00_CFCON		(1<<2)
 #define S5PC100_CLKGATE_D00_MDMA		(1<<3)
-#define S5PC100_CLKGATE_D00_G2D		(1<<4)
+#define S5PC100_CLKGATE_D00_G2D			(1<<4)
 #define S5PC100_CLKGATE_D00_SECSS		(1<<5)
 #define S5PC100_CLKGATE_D00_CSSYS		(1<<6)
 
 /* HCLKD0/PCLKD0 Clock Gate 1 Registers */
-#define S5PC100_CLKGATE_D01_DMC		(1<<0)
+#define S5PC100_CLKGATE_D01_DMC			(1<<0)
 #define S5PC100_CLKGATE_D01_SROMC		(1<<1)
 #define S5PC100_CLKGATE_D01_ONENAND		(1<<2)
 #define S5PC100_CLKGATE_D01_NFCON		(1<<3)
 #define S5PC100_CLKGATE_D01_INTMEM		(1<<4)
-#define S5PC100_CLKGATE_D01_EBI		(1<<5)
+#define S5PC100_CLKGATE_D01_EBI			(1<<5)
 
 /* PCLKD0 Clock Gate 2 Registers */
 #define S5PC100_CLKGATE_D02_SECKEY		(1<<1)
-#define S5PC100_CLKGATE_D02_SDM		(1<<2)
+#define S5PC100_CLKGATE_D02_SDM			(1<<2)
 
 /* HCLKD1/PCLKD1 Clock Gate 0 Registers */
 #define S5PC100_CLKGATE_D10_PDMA0		(1<<0)
@@ -174,26 +174,26 @@
 #define S5PC100_CLKGATE_D10_HSMMC2		(1<<7)
 
 /* HCLKD1/PCLKD1 Clock Gate 1 Registers */
-#define S5PC100_CLKGATE_D11_LCD		(1<<0)
+#define S5PC100_CLKGATE_D11_LCD			(1<<0)
 #define S5PC100_CLKGATE_D11_ROTATOR		(1<<1)
 #define S5PC100_CLKGATE_D11_FIMC0		(1<<2)
 #define S5PC100_CLKGATE_D11_FIMC1		(1<<3)
 #define S5PC100_CLKGATE_D11_FIMC2		(1<<4)
 #define S5PC100_CLKGATE_D11_JPEG		(1<<5)
-#define S5PC100_CLKGATE_D11_DSI		(1<<6)
-#define S5PC100_CLKGATE_D11_CSI		(1<<7)
-#define S5PC100_CLKGATE_D11_G3D		(1<<8)
+#define S5PC100_CLKGATE_D11_DSI			(1<<6)
+#define S5PC100_CLKGATE_D11_CSI			(1<<7)
+#define S5PC100_CLKGATE_D11_G3D			(1<<8)
 
 /* HCLKD1/PCLKD1 Clock Gate 2 Registers */
-#define S5PC100_CLKGATE_D12_TV		(1<<0)
-#define S5PC100_CLKGATE_D12_VP		(1<<1)
+#define S5PC100_CLKGATE_D12_TV			(1<<0)
+#define S5PC100_CLKGATE_D12_VP			(1<<1)
 #define S5PC100_CLKGATE_D12_MIXER		(1<<2)
 #define S5PC100_CLKGATE_D12_HDMI		(1<<3)
-#define S5PC100_CLKGATE_D12_MFC		(1<<4)
+#define S5PC100_CLKGATE_D12_MFC			(1<<4)
 
 /* HCLKD1/PCLKD1 Clock Gate 3 Registers */
-#define S5PC100_CLKGATE_D13_CHIPID		(1<<0)
-#define S5PC100_CLKGATE_D13_GPIO		(1<<1)
+#define S5PC100_CLKGATE_D13_CHIPID	(1<<0)
+#define S5PC100_CLKGATE_D13_GPIO	(1<<1)
 #define S5PC100_CLKGATE_D13_APC		(1<<2)
 #define S5PC100_CLKGATE_D13_IEC		(1<<3)
 #define S5PC100_CLKGATE_D13_PWM		(1<<6)
@@ -206,8 +206,8 @@
 #define S5PC100_CLKGATE_D14_UART1		(1<<1)
 #define S5PC100_CLKGATE_D14_UART2		(1<<2)
 #define S5PC100_CLKGATE_D14_UART3		(1<<3)
-#define S5PC100_CLKGATE_D14_IIC		(1<<4)
-#define S5PC100_CLKGATE_D14_HDMI_IIC	(1<<5)
+#define S5PC100_CLKGATE_D14_IIC			(1<<4)
+#define S5PC100_CLKGATE_D14_HDMI_IIC		(1<<5)
 #define S5PC100_CLKGATE_D14_SPI0		(1<<6)
 #define S5PC100_CLKGATE_D14_SPI1		(1<<7)
 #define S5PC100_CLKGATE_D14_SPI2		(1<<8)
@@ -227,7 +227,7 @@
 #define S5PC100_CLKGATE_D15_SPDIF		(1<<6)
 #define S5PC100_CLKGATE_D15_TSADC		(1<<7)
 #define S5PC100_CLKGATE_D15_KEYIF		(1<<8)
-#define S5PC100_CLKGATE_D15_CG		(1<<9)
+#define S5PC100_CLKGATE_D15_CG			(1<<9)
 
 /* HCLKD2 Clock Gate 0 Registers */
 #define S5PC100_CLKGATE_D20_HCLKD2		(1<<0)
@@ -236,22 +236,22 @@
 /* Special Clock Gate 0 Registers */
 #define	S5PC100_CLKGATE_SCLK0_HPM		(1<<0)
 #define	S5PC100_CLKGATE_SCLK0_PWI		(1<<1)
-#define	S5PC100_CLKGATE_SCLK0_ONENAND	(1<<2)
+#define	S5PC100_CLKGATE_SCLK0_ONENAND		(1<<2)
 #define	S5PC100_CLKGATE_SCLK0_UART		(1<<3)
 #define	S5PC100_CLKGATE_SCLK0_SPI0		(1<<4)
 #define	S5PC100_CLKGATE_SCLK0_SPI1		(1<<5)
 #define	S5PC100_CLKGATE_SCLK0_SPI2		(1<<6)
-#define	S5PC100_CLKGATE_SCLK0_SPI0_48	(1<<7)
-#define	S5PC100_CLKGATE_SCLK0_SPI1_48	(1<<8)
-#define	S5PC100_CLKGATE_SCLK0_SPI2_48	(1<<9)
+#define	S5PC100_CLKGATE_SCLK0_SPI0_48		(1<<7)
+#define	S5PC100_CLKGATE_SCLK0_SPI1_48		(1<<8)
+#define	S5PC100_CLKGATE_SCLK0_SPI2_48		(1<<9)
 #define	S5PC100_CLKGATE_SCLK0_IRDA		(1<<10)
-#define	S5PC100_CLKGATE_SCLK0_USBHOST	(1<<11)
+#define	S5PC100_CLKGATE_SCLK0_USBHOST		(1<<11)
 #define	S5PC100_CLKGATE_SCLK0_MMC0		(1<<12)
 #define	S5PC100_CLKGATE_SCLK0_MMC1		(1<<13)
 #define	S5PC100_CLKGATE_SCLK0_MMC2		(1<<14)
-#define	S5PC100_CLKGATE_SCLK0_MMC0_48	(1<<15)
-#define	S5PC100_CLKGATE_SCLK0_MMC1_48	(1<<16)
-#define	S5PC100_CLKGATE_SCLK0_MMC2_48	(1<<17)
+#define	S5PC100_CLKGATE_SCLK0_MMC0_48		(1<<15)
+#define	S5PC100_CLKGATE_SCLK0_MMC1_48		(1<<16)
+#define	S5PC100_CLKGATE_SCLK0_MMC2_48		(1<<17)
 
 /* Special Clock Gate 1 Registers */
 #define	S5PC100_CLKGATE_SCLK1_LCD		(1<<0)
@@ -259,12 +259,12 @@
 #define	S5PC100_CLKGATE_SCLK1_FIMC1		(1<<2)
 #define	S5PC100_CLKGATE_SCLK1_FIMC2		(1<<3)
 #define	S5PC100_CLKGATE_SCLK1_TV54		(1<<4)
-#define	S5PC100_CLKGATE_SCLK1_VDAC54	(1<<5)
+#define	S5PC100_CLKGATE_SCLK1_VDAC54		(1<<5)
 #define	S5PC100_CLKGATE_SCLK1_MIXER		(1<<6)
 #define	S5PC100_CLKGATE_SCLK1_HDMI		(1<<7)
-#define	S5PC100_CLKGATE_SCLK1_AUDIO0	(1<<8)
-#define	S5PC100_CLKGATE_SCLK1_AUDIO1	(1<<9)
-#define	S5PC100_CLKGATE_SCLK1_AUDIO2	(1<<10)
+#define	S5PC100_CLKGATE_SCLK1_AUDIO0		(1<<8)
+#define	S5PC100_CLKGATE_SCLK1_AUDIO1		(1<<9)
+#define	S5PC100_CLKGATE_SCLK1_AUDIO2		(1<<10)
 #define	S5PC100_CLKGATE_SCLK1_SPDIF		(1<<11)
 #define	S5PC100_CLKGATE_SCLK1_CAM		(1<<12)
 
@@ -290,7 +290,7 @@
 
 /* OTHERS Resgister */
 #define S5PC100_OTHERS_USB_SIG_MASK	(1 << 16)
-#define S5PC100_OTHERS_MIPI_DPHY_EN		(1 << 28)
+#define S5PC100_OTHERS_MIPI_DPHY_EN	(1 << 28)
 
 /* MIPI D-PHY Control Register 0 */
 #define S5PC100_MIPI_PHY_CON0_M_RESETN	(1 << 1)
-- 
1.6.0.4

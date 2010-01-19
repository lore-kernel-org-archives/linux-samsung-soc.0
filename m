From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 02/10] ARM: S5PV210: Add clock support for S5PV210
Date: Tue, 19 Jan 2010 11:27:36 +0900
Message-ID: <1263868056-30680-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45644 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892Ab0ASCfR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 21:35:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

This patch adds clock support for S5PV210. This patch adds the clock
register definitions and the various system clocks in S5PV210.
Clocks that are common to other S5P SoC'c are added in the common
S5P clock support.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |  453 +++++++++++++++++++++
 arch/arm/plat-s5p/clock.c                       |   13 +
 arch/arm/plat-s5p/include/plat/s5p-clock.h      |    2 +
 arch/arm/plat-s5p/s5pv210-clock.c               |  494 +++++++++++++++++++++++
 4 files changed, 962 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-clock.h
 create mode 100755 arch/arm/plat-s5p/s5pv210-clock.c

diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
new file mode 100644
index 0000000..e022d0e
--- /dev/null
+++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
@@ -0,0 +1,453 @@
+/* linux/arch/arm/mach-s5pv210/include/mach/regs-clock.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5PV210 - Clock register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_REGS_CLOCK_H
+#define __ASM_ARCH_REGS_CLOCK_H __FILE__
+
+#include <mach/map.h>
+
+#define S5P_CLKREG(x)		(S5P_VA_SYSCON + (x))
+
+#define S5P_APLL_LOCK		S5P_CLKREG(0x00)
+#define S5P_MPLL_LOCK		S5P_CLKREG(0x08)
+#define S5P_EPLL_LOCK		S5P_CLKREG(0x10)
+#define S5P_VPLL_LOCK		S5P_CLKREG(0x20)
+
+#define S5P_APLL_CON		S5P_CLKREG(0x100)
+#define S5P_MPLL_CON		S5P_CLKREG(0x108)
+#define S5P_EPLL_CON		S5P_CLKREG(0x110)
+#define S5P_VPLL_CON		S5P_CLKREG(0x120)
+
+#define S5P_CLK_SRC0		S5P_CLKREG(0x200)
+#define S5P_CLK_SRC1		S5P_CLKREG(0x204)
+#define S5P_CLK_SRC2		S5P_CLKREG(0x208)
+#define S5P_CLK_SRC3		S5P_CLKREG(0x20C)
+#define S5P_CLK_SRC4		S5P_CLKREG(0x210)
+#define S5P_CLK_SRC5		S5P_CLKREG(0x214)
+#define S5P_CLK_SRC6		S5P_CLKREG(0x218)
+
+#define S5P_CLK_SRC_MASK0	S5P_CLKREG(0x280)
+#define S5P_CLK_SRC_MASK1	S5P_CLKREG(0x284)
+
+#define S5P_CLK_DIV0		S5P_CLKREG(0x300)
+#define S5P_CLK_DIV1		S5P_CLKREG(0x304)
+#define S5P_CLK_DIV2		S5P_CLKREG(0x308)
+#define S5P_CLK_DIV3		S5P_CLKREG(0x30C)
+#define S5P_CLK_DIV4		S5P_CLKREG(0x310)
+#define S5P_CLK_DIV5		S5P_CLKREG(0x314)
+#define S5P_CLK_DIV6		S5P_CLKREG(0x318)
+#define S5P_CLK_DIV7		S5P_CLKREG(0x31C)
+
+#define S5P_CLKGATE_MAIN0	S5P_CLKREG(0x400)
+#define S5P_CLKGATE_MAIN1	S5P_CLKREG(0x404)
+#define S5P_CLKGATE_MAIN2	S5P_CLKREG(0x408)
+
+#define S5P_CLKGATE_PERI0	S5P_CLKREG(0x420)
+#define S5P_CLKGATE_PERI1	S5P_CLKREG(0x424)
+
+#define S5P_CLKGATE_SCLK0	S5P_CLKREG(0x440)
+#define S5P_CLKGATE_SCLK1	S5P_CLKREG(0x444)
+#define S5P_CLKGATE_IP0		S5P_CLKREG(0x460)
+#define S5P_CLKGATE_IP1		S5P_CLKREG(0x464)
+#define S5P_CLKGATE_IP2		S5P_CLKREG(0x468)
+#define S5P_CLKGATE_IP3		S5P_CLKREG(0x46C)
+#define S5P_CLKGATE_IP4		S5P_CLKREG(0x470)
+
+#define S5P_CLKGATE_BLOCK	S5P_CLKREG(0x480)
+#define S5P_CLKGATE_BUS0	S5P_CLKREG(0x484)
+#define S5P_CLKGATE_BUS1	S5P_CLKREG(0x488)
+#define S5P_CLK_OUT		S5P_CLKREG(0x500)
+
+/* CLKSRC0 */
+#define S5P_CLKSRC0_MUX200_MASK		(0x1<<16)
+#define S5P_CLKSRC0_MUX166_MASK		(0x1<<20)
+#define S5P_CLKSRC0_MUX133_MASK		(0x1<<24)
+
+/* CLKDIV0 */
+#define S5P_CLKDIV0_APLL_SHIFT		(0)
+#define S5P_CLKDIV0_APLL_MASK		(0x7 << S5P_CLKDIV0_APLL_SHIFT)
+#define S5P_CLKDIV0_A2M_SHIFT		(4)
+#define S5P_CLKDIV0_A2M_MASK		(0x7 << S5P_CLKDIV0_A2M_SHIFT)
+#define S5P_CLKDIV0_HCLK200_SHIFT	(8)
+#define S5P_CLKDIV0_HCLK200_MASK	(0x7 << S5P_CLKDIV0_HCLK200_SHIFT)
+#define S5P_CLKDIV0_PCLK100_SHIFT	(12)
+#define S5P_CLKDIV0_PCLK100_MASK	(0x7 << S5P_CLKDIV0_PCLK100_SHIFT)
+#define S5P_CLKDIV0_HCLK166_SHIFT	(16)
+#define S5P_CLKDIV0_HCLK166_MASK	(0xF << S5P_CLKDIV0_HCLK166_SHIFT)
+#define S5P_CLKDIV0_PCLK83_SHIFT	(20)
+#define S5P_CLKDIV0_PCLK83_MASK		(0x7 << S5P_CLKDIV0_PCLK83_SHIFT)
+#define S5P_CLKDIV0_HCLK133_SHIFT	(24)
+#define S5P_CLKDIV0_HCLK133_MASK	(0xF << S5P_CLKDIV0_HCLK133_SHIFT)
+#define S5P_CLKDIV0_PCLK66_SHIFT	(28)
+#define S5P_CLKDIV0_PCLK66_MASK		(0x7 << S5P_CLKDIV0_PCLK66_SHIFT)
+
+/* Clock Gate Main0 Registers */
+#define S5P_CLKGATE_MAIN0_IPC		(1<<30)
+#define S5P_CLKGATE_MAIN0_ROTATOR	(1<<29)
+#define S5P_CLKGATE_MAIN0_JPEG		(1<<28)
+#define S5P_CLKGATE_MAIN0_FIMC2		(1<<26)
+#define S5P_CLKGATE_MAIN0_FIMC1		(1<<25)
+#define S5P_CLKGATE_MAIN0_FIMC0		(1<<24)
+#define S5P_CLKGATE_MAIN0_G3D		(1<<8)
+#define S5P_CLKGATE_MAIN0_IMEM		(1<<5)
+#define S5P_CLKGATE_MAIN0_PDMA1		(1<<4)
+#define S5P_CLKGATE_MAIN0_PDMA0		(1<<3)
+#define S5P_CLKGATE_MAIN0_MDMA		(1<<2)
+#define S5P_CLKGATE_MAIN0_DMC1		(1<<1)
+#define S5P_CLKGATE_MAIN0_DMC0		(1<<0)
+
+/* Clock Gate Main1 Registers */
+#define S5P_CLKGATE_MAIN1_NFCON		(1<<28)
+#define S5P_CLKGATE_MAIN1_SROMC		(1<<26)
+#define S5P_CLKGATE_MAIN1_CFCON		(1<<25)
+#define S5P_CLKGATE_MAIN1_NANDXL	(1<<24)
+#define S5P_CLKGATE_MAIN1_USBHOST	(1<<17)
+#define S5P_CLKGATE_MAIN1_USBOTG	(1<<16)
+#define S5P_CLKGATE_MAIN1_TVENC		(1<<10)
+#define S5P_CLKGATE_MAIN1_MIXER		(1<<9)
+#define S5P_CLKGATE_MAIN1_VP		(1<<8)
+#define S5P_CLKGATE_MAIN1_MIE		(1<<1)
+#define S5P_CLKGATE_MAIN1_FIMD		(1<<0)
+
+/* Clock Gate Main2 Registers */
+#define S5P_CLKGATE_MAIN2_TZIC3		(1<<31)
+#define S5P_CLKGATE_MAIN2_TZIC2		(1<<30)
+#define S5P_CLKGATE_MAIN2_TZIC1		(1<<29)
+#define S5P_CLKGATE_MAIN2_TZIC0		(1<<28)
+#define S5P_CLKGATE_MAIN2_VIC3		(1<<27)
+#define S5P_CLKGATE_MAIN2_VIC2		(1<<26)
+#define S5P_CLKGATE_MAIN2_VIC1		(1<<25)
+#define S5P_CLKGATE_MAIN2_VIC0		(1<<24)
+#define S5P_CLKGATE_MAIN2_TSI		(1<<20)
+#define S5P_CLKGATE_MAIN2_HSMMC3	(1<<19)
+#define S5P_CLKGATE_MAIN2_HSMMC2	(1<<18)
+#define S5P_CLKGATE_MAIN2_HSMMC1	(1<<17)
+#define S5P_CLKGATE_MAIN2_HSMMC0	(1<<16)
+#define S5P_CLKGATE_MAIN2_HOSTIF	(1<<10)
+#define S5P_CLKGATE_MAIN2_MODEM		(1<<9)
+#define S5P_CLKGATE_MAIN2_CORESIGHT	(1<<8)
+#define S5P_CLKGATE_MAIN2_SDM		(1<<1)
+#define S5P_CLKGATE_MAIN2_SECSS		(1<<0)
+
+/* Clock Gate Peri0 Registers */
+#define S5P_CLKGATE_PERI0_PCM2		(1<<30)
+#define S5P_CLKGATE_PERI0_PCM1		(1<<29)
+#define S5P_CLKGATE_PERI0_PCM0		(1<<28)
+#define S5P_CLKGATE_PERI0_SYSCON	(1<<27)
+#define S5P_CLKGATE_PERI0_GPIO		(1<<26)
+#define S5P_CLKGATE_PERI0_TSADC		(1<<24)
+#define S5P_CLKGATE_PERI0_PWM		(1<<23)
+#define S5P_CLKGATE_PERI0_WDT		(1<<22)
+#define S5P_CLKGATE_PERI0_KEYIF		(1<<21)
+#define S5P_CLKGATE_PERI0_UART3		(1<<20)
+#define S5P_CLKGATE_PERI0_UART2		(1<<19)
+#define S5P_CLKGATE_PERI0_UART1		(1<<18)
+#define S5P_CLKGATE_PERI0_UART0		(1<<17)
+#define S5P_CLKGATE_PERI0_SYSTIMER	(1<<16)
+#define S5P_CLKGATE_PERI0_RTC		(1<<15)
+#define S5P_CLKGATE_PERI0_SPI2		(1<<14)
+#define S5P_CLKGATE_PERI0_SPI1		(1<<13)
+#define S5P_CLKGATE_PERI0_SPI0		(1<<12)
+#define S5P_CLKGATE_PERI0_I2C_HDMI_PHY	(1<<11)
+#define S5P_CLKGATE_PERI0_I2C_HDMI_DDC	(1<<10)
+#define S5P_CLKGATE_PERI0_I2C2		(1<<9)
+#define S5P_CLKGATE_PERI0_I2C1		(1<<8)
+#define S5P_CLKGATE_PERI0_I2C0		(1<<7)
+#define S5P_CLKGATE_PERI0_I2S2		(1<<6)
+#define S5P_CLKGATE_PERI0_I2S1		(1<<5)
+#define S5P_CLKGATE_PERI0_I2S0		(1<<4)
+#define S5P_CLKGATE_PERI0_AC97		(1<<1)
+#define S5P_CLKGATE_PERI0_SPDIF		(1<<0)
+
+/* Clock Gate Peri1 Registers */
+#define S5P_CLKGATE_PERI1_MFC		(1<<19)
+#define S5P_CLKGATE_PERI1_DMC1		(1<<18)
+#define S5P_CLKGATE_PERI1_DMC0		(1<<17)
+#define S5P_CLKGATE_PERI1_MDMA		(1<<16)
+#define S5P_CLKGATE_PERI1_PDMA1		(1<<15)
+#define S5P_CLKGATE_PERI1_PDMA0		(1<<14)
+#define S5P_CLKGATE_PERI1_CSIS		(1<<13)
+#define S5P_CLKGATE_PERI1_DSIM		(1<<12)
+#define S5P_CLKGATE_PERI1_HDMI		(1<<11)
+#define S5P_CLKGATE_PERI1_CORESIGHT	(1<<10)
+#define S5P_CLKGATE_PERI1_SECJTAG	(1<<9)
+#define S5P_CLKGATE_PERI1_TZPC3		(1<<8)
+#define S5P_CLKGATE_PERI1_TZPC2		(1<<7)
+#define S5P_CLKGATE_PERI1_TZPC1		(1<<6)
+#define S5P_CLKGATE_PERI1_TZPC0		(1<<5)
+#define S5P_CLKGATE_PERI1_SDM		(1<<4)
+#define S5P_CLKGATE_PERI1_SECKEY	(1<<3)
+#define S5P_CLKGATE_PERI1_IEM_APC	(1<<2)
+#define S5P_CLKGATE_PERI1_IEM_IEC	(1<<1)
+#define S5P_CLKGATE_PERI1_CHIP_ID	(1<<0)
+
+/* Special Clock Gate 0 Registers */
+#define S5P_CLKGATE_SCLK0_EBI		(1<<31)
+#define S5P_CLKGATE_SCLK0_NANDXL	(1<<30)
+#define S5P_CLKGATE_SCLK0_MFC		(1<<29)
+#define S5P_CLKGATE_SCLK0_G3D		(1<<28)
+#define S5P_CLKGATE_SCLK0_FIMC		(1<<27)
+#define S5P_CLKGATE_SCLK0_CSIS		(1<<26)
+#define S5P_CLKGATE_SCLK0_FIMD		(1<<25)
+#define S5P_CLKGATE_SCLK0_CAM1		(1<<24)
+#define S5P_CLKGATE_SCLK0_CAM0		(1<<23)
+#define S5P_CLKGATE_SCLK0_TVENC		(1<<22)
+#define S5P_CLKGATE_SCLK0_DAC		(1<<21)
+#define S5P_CLKGATE_SCLK0_MIXER		(1<<20)
+#define S5P_CLKGATE_SCLK0_HDMI		(1<<19)
+#define S5P_CLKGATE_SCLK0_SPDIF1	(1<<18)
+#define S5P_CLKGATE_SCLK0_AUDIO2	(1<<17)
+#define S5P_CLKGATE_SCLK0_AUDIO1	(1<<16)
+#define S5P_CLKGATE_SCLK0_AUDIO0	(1<<15)
+#define S5P_CLKGATE_SCLK0_PWM		(1<<14)
+#define S5P_CLKGATE_SCLK0_SPI2		(1<<13)
+#define S5P_CLKGATE_SCLK0_SPI1		(1<<12)
+#define S5P_CLKGATE_SCLK0_SPI0		(1<<11)
+#define S5P_CLKGATE_SCLK0_UART3		(1<<10)
+#define S5P_CLKGATE_SCLK0_UART2		(1<<9)
+#define S5P_CLKGATE_SCLK0_UART1		(1<<8)
+#define S5P_CLKGATE_SCLK0_UART0		(1<<7)
+#define S5P_CLKGATE_SCLK0_MMC3		(1<<6)
+#define S5P_CLKGATE_SCLK0_MMC2		(1<<5)
+#define S5P_CLKGATE_SCLK0_MMC1		(1<<4)
+#define S5P_CLKGATE_SCLK0_MMC0		(1<<3)
+#define S5P_CLKGATE_SCLK0_PWI		(1<<1)
+#define S5P_CLKGATE_SCLK0_HPM		(1<<0)
+
+/* Special Clock Gate 1 Registers */
+#define S5P_CLKGATE_SCLK1_FIMC2_LCLK	(1<<5)
+#define S5P_CLKGATE_SCLK1_FIMC1_LCLK	(1<<4)
+#define S5P_CLKGATE_SCLK1_FIMC0_LCLK	(1<<3)
+#define S5P_CLKGATE_SCLK1_MDNIE_PWM	(1<<2)
+#define S5P_CLKGATE_SCLK1_MDNIE		(1<<1)
+#define S5P_CLKGATE_SCLK1_PIXEL		(1<<0)
+
+/* IP Clock Gate 0 Registers */
+#define S5P_CLKGATE_IP0_CSIS		(1<<31)
+#define S5P_CLKGATE_IP0_IPC		(1<<30)
+#define S5P_CLKGATE_IP0_ROTATOR		(1<<29)
+#define S5P_CLKGATE_IP0_JPEG		(1<<28)
+#define S5P_CLKGATE_IP0_FIMC2		(1<<26)
+#define S5P_CLKGATE_IP0_FIMC1		(1<<25)
+#define S5P_CLKGATE_IP0_FIMC0		(1<<24)
+#define S5P_CLKGATE_IP0_MFC		(1<<16)
+#define S5P_CLKGATE_IP0_G3D		(1<<8)
+#define S5P_CLKGATE_IP0_IMEM		(1<<5)
+#define S5P_CLKGATE_IP0_PDMA1		(1<<4)
+#define S5P_CLKGATE_IP0_PDMA0		(1<<3)
+#define S5P_CLKGATE_IP0_MDMA		(1<<2)
+#define S5P_CLKGATE_IP0_DMC1		(1<<1)
+#define S5P_CLKGATE_IP0_DMC0		(1<<0)
+#define S5P_CLKGATE_IP0_RESERVED	(0x8FEFEC0)
+#define S5P_CLKGATE_IP0_ALWAYS_ON	(S5P_CLKGATE_IP0_PDMA1 |	\
+					S5P_CLKGATE_IP0_PDMA0 |		\
+					S5P_CLKGATE_IP0_MDMA |		\
+					S5P_CLKGATE_IP0_DMC1 |		\
+					S5P_CLKGATE_IP0_DMC0 |		\
+					S5P_CLKGATE_IP0_IMEM |		\
+					S5P_CLKGATE_IP0_G3D)
+
+/* IP Clock Gate 1 Registers */
+#define S5P_CLKGATE_IP1_NFCON		(1<<28)
+#define S5P_CLKGATE_IP1_SROMC		(1<<26)
+#define S5P_CLKGATE_IP1_CFCON		(1<<25)
+#define S5P_CLKGATE_IP1_NANDXL		(1<<24)
+#define S5P_CLKGATE_IP1_USBHOST		(1<<17)
+#define S5P_CLKGATE_IP1_USBOTG		(1<<16)
+#define S5P_CLKGATE_IP1_HDMI		(1<<11)
+#define S5P_CLKGATE_IP1_TVENC		(1<<10)
+#define S5P_CLKGATE_IP1_MIXER		(1<<9)
+#define S5P_CLKGATE_IP1_VP		(1<<8)
+#define S5P_CLKGATE_IP1_DSIM		(1<<2)
+#define S5P_CLKGATE_IP1_MIE		(1<<1)
+#define S5P_CLKGATE_IP1_FIMD		(1<<0)
+#define S5P_CLKGATE_IP1_RESERVED	(0xE8FCF0F8)
+#define S5P_CLKGATE_IP1_ALWAYS_ON	(S5P_CLKGATE_IP1_SROMC |	\
+					S5P_CLKGATE_IP1_NANDXL)
+
+/* IP Clock Gate 2 Registers */
+#define S5P_CLKGATE_IP2_TZIC3		(1<<31)
+#define S5P_CLKGATE_IP2_TZIC2		(1<<30)
+#define S5P_CLKGATE_IP2_TZIC1		(1<<29)
+#define S5P_CLKGATE_IP2_TZIC0		(1<<28)
+#define S5P_CLKGATE_IP2_VIC3		(1<<27)
+#define S5P_CLKGATE_IP2_VIC2		(1<<26)
+#define S5P_CLKGATE_IP2_VIC1		(1<<25)
+#define S5P_CLKGATE_IP2_VIC0		(1<<24)
+#define S5P_CLKGATE_IP2_TSI		(1<<20)
+#define S5P_CLKGATE_IP2_HSMMC3		(1<<19)
+#define S5P_CLKGATE_IP2_HSMMC2		(1<<18)
+#define S5P_CLKGATE_IP2_HSMMC1		(1<<17)
+#define S5P_CLKGATE_IP2_HSMMC0		(1<<16)
+#define S5P_CLKGATE_IP2_SECJTAG		(1<<11)
+#define S5P_CLKGATE_IP2_HOSTIF		(1<<10)
+#define S5P_CLKGATE_IP2_MODEM		(1<<9)
+#define S5P_CLKGATE_IP2_CORESIGHT	(1<<8)
+#define S5P_CLKGATE_IP2_SDM		(1<<1)
+#define S5P_CLKGATE_IP2_SECSS		(1<<0)
+#define S5P_CLKGATE_IP2_RESERVED	(0xE0F0FC)
+#define S5P_CLKGATE_IP2_ALWAYS_ON	(S5P_CLKGATE_IP2_TZIC3 |	\
+					S5P_CLKGATE_IP2_TZIC2 |		\
+					S5P_CLKGATE_IP2_TZIC1 |		\
+					S5P_CLKGATE_IP2_TZIC0 |		\
+					S5P_CLKGATE_IP2_VIC3 |		\
+					S5P_CLKGATE_IP2_VIC2 |		\
+					S5P_CLKGATE_IP2_VIC1 |		\
+					S5P_CLKGATE_IP2_VIC0 |		\
+					S5P_CLKGATE_IP2_SECJTAG |	\
+					S5P_CLKGATE_IP2_CORESIGHT |	\
+					S5P_CLKGATE_IP2_SDM |		\
+					S5P_CLKGATE_IP2_SECSS)
+
+/* IP Clock Gate 3 Registers */
+#define S5P_CLKGATE_IP3_PCM2		(1<<30)
+#define S5P_CLKGATE_IP3_PCM1		(1<<29)
+#define S5P_CLKGATE_IP3_PCM0		(1<<28)
+#define S5P_CLKGATE_IP3_SYSCON		(1<<27)
+#define S5P_CLKGATE_IP3_GPIO		(1<<26)
+#define S5P_CLKGATE_IP3_TSADC		(1<<24)
+#define S5P_CLKGATE_IP3_PWM		(1<<23)
+#define S5P_CLKGATE_IP3_WDT		(1<<22)
+#define S5P_CLKGATE_IP3_KEYIF		(1<<21)
+#define S5P_CLKGATE_IP3_UART3		(1<<20)
+#define S5P_CLKGATE_IP3_UART2		(1<<19)
+#define S5P_CLKGATE_IP3_UART1		(1<<18)
+#define S5P_CLKGATE_IP3_UART0		(1<<17)
+#define S5P_CLKGATE_IP3_SYSTIMER	(1<<16)
+#define S5P_CLKGATE_IP3_RTC		(1<<15)
+#define S5P_CLKGATE_IP3_SPI2		(1<<14)
+#define S5P_CLKGATE_IP3_SPI1		(1<<13)
+#define S5P_CLKGATE_IP3_SPI0		(1<<12)
+#define S5P_CLKGATE_IP3_I2C_HDMI_PHY	(1<<11)
+#define S5P_CLKGATE_IP3_I2C_HDMI_DDC	(1<<10)
+#define S5P_CLKGATE_IP3_I2C2		(1<<9)
+#define S5P_CLKGATE_IP3_I2C1		(1<<8)
+#define S5P_CLKGATE_IP3_I2C0		(1<<7)
+#define S5P_CLKGATE_IP3_I2S2		(1<<6)
+#define S5P_CLKGATE_IP3_I2S1		(1<<5)
+#define S5P_CLKGATE_IP3_I2S0		(1<<4)
+#define S5P_CLKGATE_IP3_AC97		(1<<1)
+#define S5P_CLKGATE_IP3_SPDIF		(1<<0)
+#define S5P_CLKGATE_IP3_RESERVED	(0x8200000C)
+#define S5P_CLKGATE_IP3_ALWAYS_ON	(S5P_CLKGATE_IP3_SYSCON |	\
+					S5P_CLKGATE_IP3_GPIO |		\
+					S5P_CLKGATE_IP3_UART0 |		\
+					S5P_CLKGATE_IP3_UART1 |		\
+					S5P_CLKGATE_IP3_UART2 |		\
+					S5P_CLKGATE_IP3_UART3)
+
+/* IP Clock Gate 4 Registers */
+#define S5P_CLKGATE_IP4_TZPC3		(1<<8)
+#define S5P_CLKGATE_IP4_TZPC2		(1<<7)
+#define S5P_CLKGATE_IP4_TZPC1		(1<<6)
+#define S5P_CLKGATE_IP4_TZPC0		(1<<5)
+#define S5P_CLKGATE_IP4_SECKEY		(1<<3)
+#define S5P_CLKGATE_IP4_IEM_APC		(1<<2)
+#define S5P_CLKGATE_IP4_IEM_IEC		(1<<1)
+#define S5P_CLKGATE_IP4_CHIP_ID		(1<<0)
+#define S5P_CLKGATE_IP4_RESERVED	(0xFFFFFE10)
+#define S5P_CLKGATE_IP4_ALWAYS_ON	(S5P_CLKGATE_IP4_TZPC3 |	\
+					S5P_CLKGATE_IP4_TZPC2 |		\
+					S5P_CLKGATE_IP4_TZPC1 |		\
+					S5P_CLKGATE_IP4_TZPC0 |		\
+					S5P_CLKGATE_IP4_CHIP_ID)
+
+/* Block Clock Gate Registers */
+#define S5P_CLKGATE_BLOCK_INTC		(1<<10)
+#define S5P_CLKGATE_BLOCK_HSMMC		(1<<9)
+#define S5P_CLKGATE_BLOCK_DEBUG		(1<<8)
+#define S5P_CLKGATE_BLOCK_SECURITY	(1<<7)
+#define S5P_CLKGATE_BLOCK_MEMORY	(1<<6)
+#define S5P_CLKGATE_BLOCK_USB		(1<<5)
+#define S5P_CLKGATE_BLOCK_TV		(1<<4)
+#define S5P_CLKGATE_BLOCK_LCD		(1<<3)
+#define S5P_CLKGATE_BLOCK_IMG		(1<<2)
+#define S5P_CLKGATE_BLOCK_MFC		(1<<1)
+#define S5P_CLKGATE_BLOCK_G3D		(1<<0)
+
+/* Registers related to power management */
+#define S5P_PWR_CFG		S5P_CLKREG(0xC000)
+#define S5P_EINT_WAKEUP_MASK	S5P_CLKREG(0xC004)
+#define S5P_WAKEUP_MASK 	S5P_CLKREG(0xC008)
+#define S5P_PWR_MODE		S5P_CLKREG(0xC00C)
+#define S5P_NORMAL_CFG		S5P_CLKREG(0xC010)
+#define S5P_IDLE_CFG		S5P_CLKREG(0xC020)
+#define S5P_STOP_CFG		S5P_CLKREG(0xC030)
+#define S5P_STOP_MEM_CFG	S5P_CLKREG(0xC034)
+#define S5P_SLEEP_CFG		S5P_CLKREG(0xC040)
+
+#define S5P_OSC_FREQ		S5P_CLKREG(0xC100)
+#define S5P_OSC_STABLE		S5P_CLKREG(0xC104)
+#define S5P_PWR_STABLE		S5P_CLKREG(0xC108)
+#define S5P_MTC_STABLE		S5P_CLKREG(0xC110)
+#define S5P_CLAMP_STABLE	S5P_CLKREG(0xC114)
+
+#define S5P_WAKEUP_STAT		S5P_CLKREG(0xC200)
+#define S5P_BLK_PWR_STAT	S5P_CLKREG(0xC204)
+
+#define S5P_OTHERS		S5P_CLKREG(0xE000)
+#define S5P_OM_STAT		S5P_CLKREG(0xE100)
+#define S5P_USB_PHY_CONTROL	S5P_CLKREG(0xE80C)
+#define S5P_DAC_CONTROL		S5P_CLKREG(0xE810)
+
+#define S5P_INFORM0		S5P_CLKREG(0xF000)
+#define S5P_INFORM1		S5P_CLKREG(0xF004)
+#define S5P_INFORM2		S5P_CLKREG(0xF008)
+#define S5P_INFORM3		S5P_CLKREG(0xF00C)
+#define S5P_INFORM4		S5P_CLKREG(0xF010)
+#define S5P_INFORM5		S5P_CLKREG(0xF014)
+#define S5P_INFORM6		S5P_CLKREG(0xF018)
+#define S5P_INFORM7		S5P_CLKREG(0xF01C)
+
+#define S5P_RST_STAT		S5P_CLKREG(0xA000)
+#define S5P_OSC_CON		S5P_CLKREG(0x8000)
+#define S5P_MIPI_PHY_CON0	S5P_CLKREG(0x7200)
+#define S5P_MIPI_PHY_CON1	S5P_CLKREG(0x7204)
+#define S5P_MIPI_CONTROL	S5P_CLKREG(0xE814)
+
+#define S5P_IDLE_CFG_TL_MASK	(3 << 30)
+#define S5P_IDLE_CFG_TM_MASK	(3 << 28)
+#define S5P_IDLE_CFG_TL_ON	(2 << 30)
+#define S5P_IDLE_CFG_TM_ON	(2 << 28)
+#define S5P_IDLE_CFG_DIDLE	(1 << 0)
+
+#define S5P_CFG_WFI_CLEAN		(~(3 << 8))
+#define S5P_CFG_WFI_IDLE		(1 << 8)
+#define S5P_CFG_WFI_STOP		(2 << 8)
+#define S5P_CFG_WFI_SLEEP		(3 << 8)
+
+#define S5P_OTHER_SYS_INT		24
+#define S5P_OTHER_STA_TYPE		23
+#define S5P_OTHER_SYSC_INTOFF		(1 << 0)
+#define STA_TYPE_EXPON			0
+#define STA_TYPE_SFR			1
+
+#define S5P_PWR_STA_EXP_SCALE		0
+#define S5P_PWR_STA_CNT			4
+
+#define S5P_PWR_STABLE_COUNT		85500
+
+#define S5P_SLEEP_CFG_OSC_EN		(1 << 0)
+#define S5P_SLEEP_CFG_USBOSC_EN		(1 << 1)
+
+/* OTHERS Resgister */
+#define S5P_OTHERS_USB_SIG_MASK		(1 << 16)
+#define S5P_OTHERS_MIPI_DPHY_EN		(1 << 28)
+
+/* MIPI */
+#define S5P_MIPI_DPHY_EN		(3)
+
+/* S5P_DAC_CONTROL */
+#define S5P_DAC_ENABLE			(1)
+#define S5P_DAC_DISABLE			(0)
+
+#endif /* __ASM_ARCH_REGS_CLOCK_H */
diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
index 3d3c0f1..519cdb4 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-s5p/clock.c
@@ -33,6 +33,12 @@ struct clk clk_ext_xtal_mux = {
 	.id		= -1,
 };
 
+struct clk clk_27m = {
+	.name		= "clk_27m",
+	.id		= -1,
+	.rate		= 27000000,
+};
+
 /* 48MHz USB Phy clock output */
 struct clk clk_48m = {
 	.name		= "clk_48m",
@@ -104,6 +110,11 @@ struct clksrc_sources clk_src_epll = {
 	.nr_sources	= ARRAY_SIZE(clk_src_epll_list),
 };
 
+struct clk clk_vpll = {
+	.name		= "vpll",
+	.id		= -1,
+};
+
 int s5p_gatectrl(void __iomem *reg, struct clk *clk, int enable)
 {
 	unsigned int ctrlbit = clk->ctrlbit;
@@ -118,10 +129,12 @@ int s5p_gatectrl(void __iomem *reg, struct clk *clk, int enable)
 static struct clk *s5p_clks[] __initdata = {
 	&clk_ext_xtal_mux,
 	&clk_48m,
+	&clk_27m,
 	&clk_fout_apll,
 	&clk_fout_mpll,
 	&clk_fout_epll,
 	&clk_arm,
+	&clk_vpll,
 };
 
 void __init s5p_register_clocks(unsigned long xtal_freq)
diff --git a/arch/arm/plat-s5p/include/plat/s5p-clock.h b/arch/arm/plat-s5p/include/plat/s5p-clock.h
index e1a7444..56fb8b4 100644
--- a/arch/arm/plat-s5p/include/plat/s5p-clock.h
+++ b/arch/arm/plat-s5p/include/plat/s5p-clock.h
@@ -20,6 +20,7 @@
 #define clk_fin_apll clk_ext_xtal_mux
 #define clk_fin_mpll clk_ext_xtal_mux
 #define clk_fin_epll clk_ext_xtal_mux
+#define clk_fin_vpll clk_ext_xtal_mux
 
 extern struct clk clk_ext_xtal_mux;
 extern struct clk clk_48m;
@@ -27,6 +28,7 @@ extern struct clk clk_fout_apll;
 extern struct clk clk_fout_mpll;
 extern struct clk clk_fout_epll;
 extern struct clk clk_arm;
+extern struct clk clk_vpll;
 
 extern struct clksrc_sources clk_src_apll;
 extern struct clksrc_sources clk_src_mpll;
diff --git a/arch/arm/plat-s5p/s5pv210-clock.c b/arch/arm/plat-s5p/s5pv210-clock.c
new file mode 100755
index 0000000..1d43e9b
--- /dev/null
+++ b/arch/arm/plat-s5p/s5pv210-clock.c
@@ -0,0 +1,494 @@
+/* linux/arch/arm/plat-s5p/s5pv210-clock.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S5PV210 - Clock support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/sysdev.h>
+#include <linux/io.h>
+
+#include <mach/map.h>
+
+#include <plat/cpu-freq.h>
+#include <mach/regs-clock.h>
+#include <plat/clock.h>
+#include <plat/cpu.h>
+#include <plat/pll.h>
+#include <plat/s5p-clock.h>
+#include <plat/clock-clksrc.h>
+#include <plat/s5pv210.h>
+
+static int s5pv210_clk_ip0_ctrl(struct clk *clk, int enable)
+{
+	if ((clk->ctrlbit) & (S5P_CLKGATE_IP0_RESERVED |	\
+				S5P_CLKGATE_IP0_ALWAYS_ON))
+		return 0;
+
+	return s5p_gatectrl(S5P_CLKGATE_IP0, clk, enable);
+}
+
+static int s5pv210_clk_ip1_ctrl(struct clk *clk, int enable)
+{
+	if ((clk->ctrlbit) & (S5P_CLKGATE_IP1_RESERVED |	\
+				S5P_CLKGATE_IP1_ALWAYS_ON))
+		return 0;
+
+	return s5p_gatectrl(S5P_CLKGATE_IP1, clk, enable);
+}
+
+static int s5pv210_clk_ip2_ctrl(struct clk *clk, int enable)
+{
+	if ((clk->ctrlbit) & (S5P_CLKGATE_IP2_RESERVED |	\
+				S5P_CLKGATE_IP2_ALWAYS_ON))
+		return 0;
+
+	return s5p_gatectrl(S5P_CLKGATE_IP2, clk, enable);
+}
+
+static int s5pv210_clk_ip3_ctrl(struct clk *clk, int enable)
+{
+	if ((clk->ctrlbit) & (S5P_CLKGATE_IP3_RESERVED |	\
+				S5P_CLKGATE_IP3_ALWAYS_ON))
+		return 0;
+
+	return s5p_gatectrl(S5P_CLKGATE_IP3, clk, enable);
+}
+
+static struct clk clk_h200 = {
+	.name		= "hclk200",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk clk_h100 = {
+	.name		= "hclk100",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk clk_h166 = {
+	.name		= "hclk166",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk clk_h133 = {
+	.name		= "hclk133",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk clk_p100 = {
+	.name		= "pclk100",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk clk_p83 = {
+	.name		= "pclk83",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk clk_p66 = {
+	.name		= "pclk66",
+	.id		= -1,
+	.rate		= 0,
+	.parent		= NULL,
+	.ctrlbit	= 0,
+};
+
+static struct clk *sys_clks[] = {
+	&clk_h200,
+	&clk_h100,
+	&clk_h166,
+	&clk_h133,
+	&clk_p100,
+	&clk_p83,
+	&clk_p66
+};
+
+static struct clk init_clocks_disable[] = {
+	{
+		.name		= "rot",
+		.id		= -1,
+		.parent		= &clk_h166,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP0_ROTATOR,
+	}, {
+		.name		= "otg",
+		.id		= -1,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP1_USBOTG,
+	}, {
+		.name		= "usb-host",
+		.id		= -1,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP1_USBHOST,
+	}, {
+		.name		= "lcd",
+		.id		= -1,
+		.parent		= &clk_h166,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP1_FIMD,
+	}, {
+		.name		= "cfcon",
+		.id		= 0,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip1_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP1_CFCON,
+	}, {
+		.name		= "hsmmc",
+		.id		= 0,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip2_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP2_HSMMC0,
+	}, {
+		.name		= "hsmmc",
+		.id		= 1,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip2_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP2_HSMMC1,
+	}, {
+		.name		= "hsmmc",
+		.id		= 2,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip2_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP2_HSMMC2,
+	}, {
+		.name		= "hsmmc",
+		.id		= 3,
+		.parent		= &clk_h133,
+		.enable		= s5pv210_clk_ip2_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP2_HSMMC3,
+	}, {
+		.name		= "systimer",
+		.id		= -1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_SYSTIMER,
+	}, {
+		.name		= "watchdog",
+		.id		= -1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_WDT,
+	}, {
+		.name		= "rtc",
+		.id		= -1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_RTC,
+	}, {
+		.name		= "uart",
+		.id		= 0,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_UART0,
+	}, {
+		.name		= "uart",
+		.id		= 1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_UART1,
+	}, {
+		.name		= "uart",
+		.id		= 2,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_UART2,
+	}, {
+		.name		= "uart",
+		.id		= 3,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_UART3,
+	}, {
+		.name		= "i2c",
+		.id		= 0,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_I2C0,
+	}, {
+		.name		= "i2c",
+		.id		= 1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_I2C1,
+	}, {
+		.name		= "i2c",
+		.id		= 2,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_I2C2,
+	}, {
+		.name		= "spi",
+		.id		= 0,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_SPI0,
+	}, {
+		.name		= "spi",
+		.id		= 1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_SPI1,
+	}, {
+		.name		= "spi",
+		.id		= 2,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_SPI2,
+	}, {
+		.name		= "timers",
+		.id		= -1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_PWM,
+	}, {
+		.name		= "adc",
+		.id		= -1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_TSADC,
+	}, {
+		.name		= "keypad",
+		.id		= -1,
+		.parent		= &clk_p66,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_KEYIF,
+	}, {
+		.name		= "i2s_v50",
+		.id		= 0,
+		.parent		= &clk_p,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_I2S0, /* I2S0 is v5.0 */
+	}, {
+		.name		= "i2s_v32",
+		.id		= 0,
+		.parent		= &clk_p,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_I2S0, /* I2S1 is v3.2 */
+	}, {
+		.name		= "i2s_v32",
+		.id		= 1,
+		.parent		= &clk_p,
+		.enable		= s5pv210_clk_ip3_ctrl,
+		.ctrlbit	= S5P_CLKGATE_IP3_I2S0, /* I2S2 is v3.2 */
+	}
+};
+
+static struct clksrc_clk clk_mout_apll = {
+	.clk	= {
+		.name		= "mout_apll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_apll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 0, .size = 1 },
+};
+
+static struct clksrc_clk clk_mout_epll = {
+	.clk	= {
+		.name		= "mout_epll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_epll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 8, .size = 1 },
+};
+
+static struct clksrc_clk clk_mout_mpll = {
+	.clk = {
+		.name		= "mout_mpll",
+		.id		= -1,
+	},
+	.sources	= &clk_src_mpll,
+	.reg_src	= { .reg = S5P_CLK_SRC0, .shift = 4, .size = 1 },
+};
+
+static struct clk *clkset_uart_list[] = {
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	&clk_mout_mpll.clk,
+	&clk_mout_epll.clk,
+	NULL,
+	NULL,
+};
+
+static struct clksrc_sources clkset_uart = {
+	.sources	= clkset_uart_list,
+	.nr_sources	= ARRAY_SIZE(clkset_uart_list),
+};
+
+static struct clksrc_clk clksrcs[] = {
+	{
+		.clk	= {
+			.name		= "uclk1",
+			.id		= -1,
+			.ctrlbit	= S5P_CLKGATE_IP3_UART0,
+			.enable		= s5pv210_clk_ip3_ctrl,
+		},
+		.sources = &clkset_uart,
+		.reg_src = { .reg = S5P_CLK_SRC4, .shift = 16, .size = 4 },
+		.reg_div = { .reg = S5P_CLK_DIV4, .shift = 16, .size = 4 },
+	}
+};
+
+/* Clock initialisation code */
+static struct clksrc_clk *init_parents[] = {
+	&clk_mout_apll,
+	&clk_mout_epll,
+	&clk_mout_mpll,
+};
+
+#define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SHIFT) + 1)
+
+void __init_or_cpufreq s5pv210_setup_clocks(void)
+{
+	struct clk *xtal_clk;
+	unsigned long xtal;
+	unsigned long armclk;
+	unsigned long hclk200;
+	unsigned long hclk166;
+	unsigned long hclk133;
+	unsigned long pclk100;
+	unsigned long pclk83;
+	unsigned long pclk66;
+	unsigned long apll;
+	unsigned long mpll;
+	unsigned long epll;
+	unsigned int ptr;
+	u32 clkdiv0, clkdiv1;
+
+	printk(KERN_DEBUG "%s: registering clocks\n", __func__);
+
+	clkdiv0 = __raw_readl(S5P_CLK_DIV0);
+	clkdiv1 = __raw_readl(S5P_CLK_DIV1);
+
+	printk(KERN_DEBUG "%s: clkdiv0 = %08x, clkdiv1 = %08x\n",
+				__func__, clkdiv0, clkdiv1);
+
+	xtal_clk = clk_get(NULL, "xtal");
+	BUG_ON(IS_ERR(xtal_clk));
+
+	xtal = clk_get_rate(xtal_clk);
+	clk_put(xtal_clk);
+
+	printk(KERN_DEBUG "%s: xtal is %ld\n", __func__, xtal);
+
+	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4508);
+	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
+	epll = s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_CON), pll_4500);
+
+	printk(KERN_INFO "S5PV210: PLL settings, A=%ld, M=%ld, E=%ld",
+			apll, mpll, epll);
+
+	armclk = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_APLL);
+	if (__raw_readl(S5P_CLK_SRC0) & S5P_CLKSRC0_MUX200_MASK)
+		hclk200 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK200);
+	else
+		hclk200 = armclk / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK200);
+
+	if (__raw_readl(S5P_CLK_SRC0) & S5P_CLKSRC0_MUX166_MASK) {
+		hclk166 = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_A2M);
+		hclk166 = hclk166 / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK166);
+	} else
+		hclk166 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK166);
+
+	if (__raw_readl(S5P_CLK_SRC0) & S5P_CLKSRC0_MUX133_MASK) {
+		hclk133 = apll / GET_DIV(clkdiv0, S5P_CLKDIV0_A2M);
+		hclk133 = hclk133 / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK133);
+	} else
+		hclk133 = mpll / GET_DIV(clkdiv0, S5P_CLKDIV0_HCLK133);
+
+	pclk100 = hclk200 / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK100);
+	pclk83 = hclk166 / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK83);
+	pclk66 = hclk133 / GET_DIV(clkdiv0, S5P_CLKDIV0_PCLK66);
+
+	printk(KERN_INFO "S5PV210: ARMCLK=%ld, HCLKM=%ld, HCLKD=%ld, \
+			HCLKP=%ld, PCLKM=%ld, PCLKD=%ld, PCLKP=%ld\n",
+	       armclk, hclk200, hclk166, hclk133, pclk100, pclk83, pclk66);
+
+	clk_fout_apll.rate = apll;
+	clk_fout_mpll.rate = mpll;
+	clk_fout_epll.rate = epll;
+
+	clk_f.rate = armclk;
+	clk_h.rate = hclk133;
+	clk_p.rate = pclk66;
+	clk_p66.rate = pclk66;
+	clk_p83.rate = pclk83;
+	clk_h133.rate = hclk133;
+	clk_h166.rate = hclk166;
+	clk_h200.rate = hclk200;
+
+	for (ptr = 0; ptr < ARRAY_SIZE(init_parents); ptr++)
+		s3c_set_clksrc(init_parents[ptr], true);
+
+	for (ptr = 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
+		s3c_set_clksrc(&clksrcs[ptr], true);
+}
+
+static struct clk *clks[] __initdata = {
+	&clk_mout_epll.clk,
+	&clk_mout_mpll.clk,
+};
+
+void __init s5pv210_register_clocks(void)
+{
+	struct clk *clkp;
+	int ret;
+	int ptr;
+
+	ret = s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
+	if (ret > 0)
+		printk(KERN_ERR "Failed to register %u clocks\n", ret);
+
+	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+
+	ret = s3c24xx_register_clocks(sys_clks, ARRAY_SIZE(sys_clks));
+	if (ret > 0)
+		printk(KERN_ERR "Failed to register system clocks\n");
+
+	clkp = init_clocks_disable;
+	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
+		ret = s3c24xx_register_clock(clkp);
+		if (ret < 0) {
+			printk(KERN_ERR "Failed to register clock %s (%d)\n",
+			       clkp->name, ret);
+		}
+		(clkp->enable)(clkp, 0);
+	}
+
+	s3c_pwmclk_init();
+}
-- 
1.6.2.5

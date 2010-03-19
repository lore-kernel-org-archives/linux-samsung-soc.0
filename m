From: Atul Dahiya <atul.dahiya@samsung.com>
Subject: [PATCH 3/3] ARM: S5P6440: Added DMA Pl330 support for samsung S5P6440
 soc.
Date: Fri, 19 Mar 2010 16:33:18 +0530
Message-ID: <1268996598-15544-1-git-send-email-atul.dahiya@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33161 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068Ab0CSLEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Mar 2010 07:04:09 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZJ00CXY02W99@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 20:04:08 +0900 (KST)
Received: from localhost.localdomain ([107.108.83.112])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZJ00HUQ02PF0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 20:04:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, atul.dahiya@samsung.com

This patch adds DAM machine support for S5P6440.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/mach-s5p6440/Makefile           |    2 +-
 arch/arm/mach-s5p6440/cpu.c              |    2 +-
 arch/arm/mach-s5p6440/include/mach/map.h |    3 +
 arch/arm/mach-s5p6440/s5p6440-dma.c      |  166 ++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/mach-s5p6440/s5p6440-dma.c

diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
index 1ad894b..e7f5c6d 100644
--- a/arch/arm/mach-s5p6440/Makefile
+++ b/arch/arm/mach-s5p6440/Makefile
@@ -12,7 +12,7 @@ obj-				:=
 
 # Core support for S5P6440 system
 
-obj-$(CONFIG_CPU_S5P6440)	+= cpu.o init.o clock.o gpio.o
+obj-$(CONFIG_CPU_S5P6440)	+= cpu.o init.o clock.o gpio.o s5p6440-dma.o
 
 # machine support
 
diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.c
index 1794131..ca3b320 100644
--- a/arch/arm/mach-s5p6440/cpu.c
+++ b/arch/arm/mach-s5p6440/cpu.c
@@ -88,7 +88,7 @@ void __init s5p6440_init_irq(void)
 	s5p_init_irq(vic, ARRAY_SIZE(vic));
 }
 
-static struct sysdev_class s5p6440_sysclass = {
+struct sysdev_class s5p6440_sysclass = {
 	.name	= "s5p6440-core",
 };
 
diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach-s5p6440/include/mach/map.h
index 8924e5a..a652406 100644
--- a/arch/arm/mach-s5p6440/include/mach/map.h
+++ b/arch/arm/mach-s5p6440/include/mach/map.h
@@ -32,6 +32,8 @@
 #define S5P6440_PA_VIC1		(0xE4100000)
 #define S5P_PA_VIC1		S5P6440_PA_VIC1
 
+#define S5P6440_PA_DMA		(0xE9000000)
+
 #define S5P6440_PA_TIMER	(0xEA000000)
 #define S5P_PA_TIMER		S5P6440_PA_TIMER
 
@@ -64,5 +66,6 @@
 /* compatibiltiy defines. */
 #define S3C_PA_UART		S5P6440_PA_UART
 #define S3C_PA_IIC		S5P6440_PA_IIC0
+#define S5P_PA_DMA		S5P6440_PA_DMA
 
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-s5p6440/s5p6440-dma.c b/arch/arm/mach-s5p6440/s5p6440-dma.c
new file mode 100644
index 0000000..2bffd03
--- /dev/null
+++ b/arch/arm/mach-s5p6440/s5p6440-dma.c
@@ -0,0 +1,166 @@
+/* linux/arch/arm/mach-s5p6440/s5p6440-dma.c
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ * 		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/sysdev.h>
+#include <linux/serial_core.h>
+#include <asm/dma.h>
+#include <plat/s5p-dma.h>
+#include <plat/cpu.h>
+
+/* DMAC */
+#define MAP0(x) { \
+		[0]	= (x) | DMA_CH_VALID,	\
+		[1]	= (x) | DMA_CH_VALID,	\
+		[2]	= (x) | DMA_CH_VALID,	\
+		[3]	= (x) | DMA_CH_VALID,	\
+		[4]	= (x) | DMA_CH_VALID,	\
+		[5]     = (x) | DMA_CH_VALID,	\
+		[6]	= (x) | DMA_CH_VALID,	\
+		[7]     = (x) | DMA_CH_VALID,	\
+	}
+
+/* DMA request sources  */
+#define S5P6440_DMA0_UART0CH0	0
+#define S5P6440_DMA0_UART0CH1	1
+#define S5P6440_DMA0_UART1CH0	2
+#define S5P6440_DMA0_UART1CH1	3
+#define S5P6440_DMA0_UART2CH0	4
+#define S5P6440_DMA0_UART2CH1	5
+#define S5P6440_DMA0_UART3CH0	6
+#define S5P6440_DMA0_UART3CH1	7
+#define S5P6440_DMA0_PCM0_TX	10
+#define S5P6440_DMA0_PCM0_RX	11
+#define S5P6440_DMA0_I2S0_TX	12
+#define S5P6440_DMA0_I2S0_RX	13
+#define S5P6440_DMA0_SPI0_TX	14
+#define S5P6440_DMA0_SPI0_RX	15
+#define S5P6440_DMA0_SPI1_TX	20
+#define S5P6440_DMA0_SPI1_RX	21
+#define S5P6440_DMA0_PWM	29
+#define S5P6440_DMA_M2M		0
+
+static struct s5p_dma_map __initdata s5p6440_dma_mappings[] = {
+
+	[DMACH_UART00] = {
+		.name		= "uart00",
+		.channels	= MAP0(S5P6440_DMA0_UART0CH0),
+		.hw_addr.from	= S5P6440_DMA0_UART0CH0,
+	},
+	[DMACH_UART01] = {
+		.name		= "uart01",
+		.channels	= MAP0(S5P6440_DMA0_UART0CH1),
+		.hw_addr.from	= S5P6440_DMA0_UART0CH1,
+	},
+	[DMACH_UART10] = {
+		.name		= "uart10",
+		.channels	= MAP0(S5P6440_DMA0_UART1CH0),
+		.hw_addr.from	= S5P6440_DMA0_UART1CH0,
+	},
+	[DMACH_UART11] = {
+		.name		= "uart11",
+		.channels	= MAP0(S5P6440_DMA0_UART1CH1),
+		.hw_addr.from	= S5P6440_DMA0_UART1CH1,
+	},
+	[DMACH_UART20] = {
+		.name		= "uart20",
+		.channels	= MAP0(S5P6440_DMA0_UART2CH0),
+		.hw_addr.from	= S5P6440_DMA0_UART2CH0,
+	},
+	[DMACH_UART21] = {
+		.name		= "uart21",
+		.channels	= MAP0(S5P6440_DMA0_UART2CH1),
+		.hw_addr.from	= S5P6440_DMA0_UART2CH1,
+	},
+	[DMACH_UART30] = {
+		.name		= "uart30",
+		.channels	= MAP0(S5P6440_DMA0_UART3CH0),
+		.hw_addr.from	= S5P6440_DMA0_UART3CH0,
+	},
+	[DMACH_UART31] = {
+		.name		= "uart31",
+		.channels	= MAP0(S5P6440_DMA0_UART3CH1),
+		.hw_addr.from	= S5P6440_DMA0_UART3CH1,
+	},
+	[DMACH_PCM0_IN] = {
+		.name		= "pcm0",
+		.channels	= MAP0(S5P6440_DMA0_PCM0_TX),
+		.hw_addr.from	= S5P6440_DMA0_PCM0_TX,
+	},
+	[DMACH_PCM0_OUT] = {
+		.name		= "pcm1",
+		.channels	= MAP0(S5P6440_DMA0_PCM0_RX),
+		.hw_addr.from	= S5P6440_DMA0_PCM0_RX,
+	},
+	[DMACH_I2S_IN] = {
+		.name		= "i2s0",
+		.channels	= MAP0(S5P6440_DMA0_I2S0_TX),
+		.hw_addr.from	= S5P6440_DMA0_I2S0_TX,
+	},
+	[DMACH_I2S_OUT] = {
+		.name		= "i2s1",
+		.channels	= MAP0(S5P6440_DMA0_I2S0_RX),
+		.hw_addr.from	= S5P6440_DMA0_I2S0_RX,
+	},
+	[DMACH_SPI0_IN] = {
+		.name		= "spi00",
+		.channels	= MAP0(S5P6440_DMA0_SPI0_TX),
+		.hw_addr.from	= S5P6440_DMA0_SPI0_TX,
+	},
+	[DMACH_SPI0_OUT] = {
+		.name		= "spi01",
+		.channels	= MAP0(S5P6440_DMA0_SPI0_RX),
+		.hw_addr.from	= S5P6440_DMA0_SPI0_RX,
+	},
+	[DMACH_SPI1_IN] = {
+		.name		= "spi10",
+		.channels	= MAP0(S5P6440_DMA0_SPI1_TX),
+		.hw_addr.from	= S5P6440_DMA0_SPI1_TX,
+	},
+	[DMACH_SPI1_IN] = {
+		.name		= "spi11",
+		.channels	= MAP0(S5P6440_DMA0_SPI1_RX),
+		.hw_addr.from	= S5P6440_DMA0_SPI1_RX,
+	},
+	[DMACH_PWM] = {
+		.name		= "pwm",
+		.channels	= MAP0(S5P6440_DMA0_PWM),
+		.hw_addr.from	= S5P6440_DMA0_PWM,
+	}
+ };
+
+static void s5p6440_dma_select(struct s5p_dma_chan *chan,
+			       struct s5p_dma_map *map)
+{
+	chan->map = map;
+}
+
+static struct s5p_dma_selection __initdata s5p_dma_sel = {
+	.select		= s5p6440_dma_select,
+	.dcon_mask	= 0,
+	.map		= s5p6440_dma_mappings,
+	.map_size	= ARRAY_SIZE(s5p6440_dma_mappings),
+};
+
+static int __init s5p6440_dma_add(struct sys_device *sysdev)
+{
+	s5p_dma_init(S5P_DMA_CHANNELS, IRQ_DMA0, 0x1000);
+	return s5p_dma_init_map(&s5p_dma_sel);
+}
+
+static struct sysdev_driver s5p6440_dma_driver = {
+	.add	= s5p6440_dma_add,
+};
+
+static int __init s5p6440_dma_init(void)
+{
+	return sysdev_driver_register(&s5p6440_sysclass, &s5p6440_dma_driver);
+
+}
+arch_initcall(s5p6440_dma_init);
-- 
1.6.6

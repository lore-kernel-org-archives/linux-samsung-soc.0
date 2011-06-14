From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 1/3 v2] ARM: Add support for MFC device to plat-s5p,
 mach-s5pv210 and mach-exynos4
Date: Tue, 14 Jun 2011 18:38:58 +0200
Message-ID: <1308069540-24934-2-git-send-email-k.debski@samsung.com>
References: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44460 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751992Ab1FNQjI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 12:39:08 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LMS00MWQGX73820@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 17:39:07 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMS00CJ7GX6E4@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 17:39:06 +0100 (BST)
In-reply-to: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com

Add support for MFC device to plat-s5p, mach-exynos4, mach-s5pv210:
 - clock support
 - memory mapping and reserving
 - s5p_device_mfc platform device

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/Kconfig                          |    2 +
 arch/arm/mach-exynos4/clock.c             |   63 +++++++++++++++
 arch/arm/mach-exynos4/include/mach/map.h  |    2 +
 arch/arm/mach-s5pv210/clock.c             |    6 ++
 arch/arm/mach-s5pv210/include/mach/map.h  |    3 +
 arch/arm/plat-s5p/Kconfig                 |    5 +
 arch/arm/plat-s5p/Makefile                |    2 +-
 arch/arm/plat-s5p/dev-mfc.c               |  125 +++++++++++++++++++++++++++++
 arch/arm/plat-s5p/include/plat/mfc.h      |   28 +++++++
 arch/arm/plat-samsung/include/plat/devs.h |    3 +
 10 files changed, 238 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc.c
 create mode 100644 arch/arm/plat-s5p/include/plat/mfc.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9adc278..c916c9a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -749,6 +749,7 @@ config ARCH_S5PV210
 	bool "Samsung S5PV210/S5PC110"
 	select CPU_V7
 	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_HAS_HOLES_MEMORYMODEL
 	select GENERIC_GPIO
 	select HAVE_CLK
 	select ARM_L1_CACHE_SHIFT_6
@@ -765,6 +766,7 @@ config ARCH_EXYNOS4
 	bool "Samsung EXYNOS4"
 	select CPU_V7
 	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_HAS_HOLES_MEMORYMODEL
 	select GENERIC_GPIO
 	select HAVE_CLK
 	select ARCH_HAS_CPUFREQ
diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index b1b93b9..81554c6 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -617,6 +617,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_image_ctrl,
 		.ctrlbit	= (1 << 0),
 	}, {
+		.name		= "mfc",
+		.id		= -1,
+		.enable		= exynos4_clk_ip_mfc_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "i2c",
 		.id		= 0,
 		.parent		= &clk_aclk_100.clk,
@@ -923,6 +928,54 @@ static struct clksrc_sources clkset_mout_g2d = {
 	.nr_sources	= ARRAY_SIZE(clkset_mout_g2d_list),
 };
 
+static struct clk *clkset_mout_mfc0_list[] = {
+	[0] = &clk_mout_mpll.clk,
+	[1] = &clk_sclk_apll.clk,
+};
+
+static struct clksrc_sources clkset_mout_mfc0 = {
+	.sources	= clkset_mout_mfc0_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc0_list),
+};
+
+static struct clksrc_clk clk_mout_mfc0 = {
+	.clk	= {
+		.name		= "mout_mfc0",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_mfc0,
+	.reg_src	= { .reg = S5P_CLKSRC_MFC, .shift = 0, .size = 1 },
+};
+
+static struct clk *clkset_mout_mfc1_list[] = {
+	[0] = &clk_mout_epll.clk,
+	[1] = &clk_sclk_vpll.clk,
+};
+
+static struct clksrc_sources clkset_mout_mfc1 = {
+	.sources	= clkset_mout_mfc1_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc1_list),
+};
+
+static struct clksrc_clk clk_mout_mfc1 = {
+	.clk	= {
+		.name		= "mout_mfc1",
+		.id		= -1,
+	},
+	.sources	= &clkset_mout_mfc1,
+	.reg_src	= { .reg = S5P_CLKSRC_MFC, .shift = 4, .size = 1 },
+};
+
+static struct clk *clkset_mout_mfc_list[] = {
+	[0] = &clk_mout_mfc0.clk,
+	[1] = &clk_mout_mfc1.clk,
+};
+
+static struct clksrc_sources clkset_mout_mfc = {
+	.sources	= clkset_mout_mfc_list,
+	.nr_sources	= ARRAY_SIZE(clkset_mout_mfc_list),
+};
+
 static struct clksrc_clk clk_dout_mmc0 = {
 	.clk		= {
 		.name		= "dout_mmc0",
@@ -1174,6 +1227,14 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLKDIV_IMAGE, .shift = 0, .size = 4 },
 	}, {
 		.clk		= {
+			.name		= "sclk_mfc",
+			.id		= -1,
+		},
+		.sources = &clkset_mout_mfc,
+		.reg_src = { .reg = S5P_CLKSRC_MFC, .shift = 8, .size = 1 },
+		.reg_div = { .reg = S5P_CLKDIV_MFC, .shift = 0, .size = 4 },
+	}, {
+		.clk		= {
 			.name		= "sclk_mmc",
 			.id		= 0,
 			.parent		= &clk_dout_mmc0.clk,
@@ -1274,6 +1335,8 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_sclk_audio0,
 	&clk_sclk_audio1,
 	&clk_sclk_audio2,
+	&clk_mout_mfc0,
+	&clk_mout_mfc1,
 };
 
 static int xtal_rate;
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 57d8074..6f0a322 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -105,6 +105,7 @@
 
 #define EXYNOS4_PA_EHCI			0x12580000
 #define EXYNOS4_PA_HSPHY		0x125B0000
+#define EXYNOS4_PA_MFC			0x13400000
 
 #define EXYNOS4_PA_UART			0x13800000
 
@@ -146,6 +147,7 @@
 #define S5P_PA_ONENAND_DMA		EXYNOS4_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			EXYNOS4_PA_SDRAM
 #define S5P_PA_SROMC			EXYNOS4_PA_SROMC
+#define S5P_PA_MFC			EXYNOS4_PA_MFC
 #define S5P_PA_SYSCON			EXYNOS4_PA_SYSCON
 #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
 #define S5P_PA_EHCI			EXYNOS4_PA_EHCI
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 2d59949..fbee8a2 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -347,6 +347,12 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
+		.name		= "mfc",
+		.id		= -1,
+		.parent		= &clk_pclk_psys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
 		.name		= "otg",
 		.id		= -1,
 		.parent		= &clk_hclk_psys.clk,
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 1dd5883..aac343c 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -59,6 +59,8 @@
 
 #define S5PV210_PA_CFCON		0xE8200000
 
+#define S5PV210_PA_MFC			0xF1700000
+
 #define S5PV210_PA_HSMMC(x)		(0xEB000000 + ((x) * 0x100000))
 
 #define S5PV210_PA_HSOTG		0xEC000000
@@ -107,6 +109,7 @@
 #define S5P_PA_FIMC1			S5PV210_PA_FIMC1
 #define S5P_PA_FIMC2			S5PV210_PA_FIMC2
 #define S5P_PA_MIPI_CSIS0		S5PV210_PA_MIPI_CSIS
+#define S5P_PA_MFC			S5PV210_PA_MFC
 #define S5P_PA_ONENAND			S5PC110_PA_ONENAND
 #define S5P_PA_ONENAND_DMA		S5PC110_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			S5PV210_PA_SDRAM
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 7f9ff2a..da3fff6 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -5,6 +5,11 @@
 #
 # Licensed under GPLv2
 
+config S5P_DEV_MFC
+	bool
+	help
+	  Compile in platform device definitions for MFC 
+	  
 config PLAT_S5P
 	bool
 	depends on (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS4)
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index e234cc4..18925ab 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_PM)		+= irq-pm.o
 obj-$(CONFIG_S5P_HRT) 		+= s5p-time.o
 
 # devices
-
+obj-$(CONFIG_S5P_DEV_MFC)	+= dev-mfc.o
 obj-$(CONFIG_S5P_DEV_FIMC0)	+= dev-fimc0.o
 obj-$(CONFIG_S5P_DEV_FIMC1)	+= dev-fimc1.o
 obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
diff --git a/arch/arm/plat-s5p/dev-mfc.c b/arch/arm/plat-s5p/dev-mfc.c
new file mode 100644
index 0000000..eabe4bc
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-mfc.c
@@ -0,0 +1,125 @@
+/* linux/arch/arm/plat-s5p/dev-mfc.c
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ *
+ * Base S5P MFC 5.1 resource and device definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/memblock.h>
+#include <linux/ioport.h>
+
+#include <mach/map.h>
+#include <plat/devs.h>
+#include <plat/irqs.h>
+#include <plat/mfc.h>
+
+static struct resource s5p_mfc_resource[] = {
+	[0] = {
+		.start  = S5P_PA_MFC,
+		.end    = S5P_PA_MFC + SZ_64K - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = IRQ_MFC,
+		.end    = IRQ_MFC,
+		.flags  = IORESOURCE_IRQ,
+	}
+};
+
+struct platform_device s5p_device_mfc = {
+	.name          = "s5p-mfc",
+	.id            = -1,
+	.num_resources = ARRAY_SIZE(s5p_mfc_resource),
+	.resource      = s5p_mfc_resource,
+};
+
+/*
+ * MFC hardware has 2 memory interfaces which are modelled as two separate
+ * platform devices to let dma-mapping distinguish between them.
+ *
+ * MFC parent device (s5p_device_mfc) must be registered before memory
+ * interface specific devices (s5p_device_mfc_l and s5p_device_mfc_r).
+ */
+
+static u64 s5p_mfc_dma_mask = DMA_BIT_MASK(32);
+
+struct platform_device s5p_device_mfc_l = {
+	.name          = "s5p-mfc-l",
+	.id            = -1,
+	.dev		= {
+		.parent			= &s5p_device_mfc.dev,
+		.dma_mask		= &s5p_mfc_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
+
+struct platform_device s5p_device_mfc_r = {
+	.name          = "s5p-mfc-r",
+	.id            = -1,
+	.dev		= {
+		.parent			= &s5p_device_mfc.dev,
+		.dma_mask		= &s5p_mfc_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
+
+struct s5p_mfc_reserved_mem
+{
+	phys_addr_t	base;
+	unsigned long	size;
+	struct device	*dev;
+};
+
+static struct s5p_mfc_reserved_mem s5p_mfc_mem[2] __initdata;
+
+void __init s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
+				phys_addr_t lbase, unsigned int lsize)
+{
+	int i;
+
+	s5p_mfc_mem[0].dev = &s5p_device_mfc_r.dev;
+	s5p_mfc_mem[0].base = rbase;
+	s5p_mfc_mem[0].size = rsize;
+
+	s5p_mfc_mem[1].dev = &s5p_device_mfc_l.dev;
+	s5p_mfc_mem[1].base = lbase;
+	s5p_mfc_mem[1].size = lsize;
+	
+
+	for (i=0; i < ARRAY_SIZE(s5p_mfc_mem); i++) {
+		struct s5p_mfc_reserved_mem *area = &s5p_mfc_mem[i];
+		if (memblock_remove(area->base, area->size)) {
+			printk(KERN_ERR "Failed to reserve memory for MFC device (%ld bytes at 0x%08lx)\n",
+			       area->size, (unsigned long) area->base);
+			area->base = 0;
+		}
+	}
+}
+
+static int __init s5p_mfc_memory_init(void)
+{
+	int i;
+
+	for (i=0; i < ARRAY_SIZE(s5p_mfc_mem); i++) {
+		struct s5p_mfc_reserved_mem *area = &s5p_mfc_mem[i];
+		if (!area->base)
+			continue;
+
+		if (dma_declare_coherent_memory(area->dev, area->base,
+				area->base, area->size,
+				DMA_MEMORY_MAP | DMA_MEMORY_EXCLUSIVE) == 0)
+			printk(KERN_ERR "Failed to declare coherent memory for MFC device (%ld bytes at 0x%08lx)\n",
+			       area->size, (unsigned long) area->base);
+	}
+	return 0;
+}
+device_initcall(s5p_mfc_memory_init);
diff --git a/arch/arm/plat-s5p/include/plat/mfc.h b/arch/arm/plat-s5p/include/plat/mfc.h
new file mode 100644
index 0000000..b7b0679
--- /dev/null
+++ b/arch/arm/plat-s5p/include/plat/mfc.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2011 Samsung Electronics Co.Ltd
+ * Author: Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __PLAT_S5P_MFC_H
+#define __PLAT_S5P_MFC_H
+
+/**
+ * s5p_mfc_reserve_mem - function to early reserve memory for MFC driver
+ * @rbase:	base address for MFC 'right' memory interface
+ * @rsize:	size of the memory reserved for MFC 'right' interface
+ * @lbase:	base address for MFC 'left' memory interface
+ * @lsize:	size of the memory reserved for MFC 'left' interface
+ *
+ * This function reserves system memory for both MFC device memory
+ * interfaces and registers it to respective struct device entries as
+ * coherent memory.
+ */
+void __init s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
+				phys_addr_t lbase, unsigned int lsize);
+
+#endif /* __PLAT_S5P_MFC_H */
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 4af108f..df5b13a 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -132,6 +132,9 @@ extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
 
+extern struct platform_device s5p_device_mfc;
+extern struct platform_device s5p_device_mfc_l;
+extern struct platform_device s5p_device_mfc_r;
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
 
-- 
1.6.3.3

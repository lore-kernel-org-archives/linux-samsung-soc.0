From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 1/3] ARM: S5P: Add MFC 5.1 driver to plat-s5p,
	mach-s5pv210 and mach-exynos4
Date: Wed, 27 Apr 2011 13:43:03 +0200
Message-ID: <1303904585-11818-2-git-send-email-k.debski@samsung.com>
References: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62539 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753324Ab1D0LnP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2011 07:43:15 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LKB00M7S781FL@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:13 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LKB006SC780LJ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:13 +0100 (BST)
In-reply-to: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, kgene.kim@samsung.com, jtp.park@samsung.com

Add support for MFC 5.1 device to plat-s5p, mach-exynos4, mach-s5pv210:
 - clock support
 - memory mapping
 - s5p_device_mfc platform device

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/clock.c             |   63 +++++++++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/map.h  |    3 +
 arch/arm/mach-s5pv210/clock.c             |    6 +++
 arch/arm/mach-s5pv210/include/mach/map.h  |    3 +
 arch/arm/plat-s5p/Kconfig                 |    5 ++
 arch/arm/plat-s5p/Makefile                |    2 +-
 arch/arm/plat-s5p/dev-mfc.c               |   49 ++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 8 files changed, 131 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc.c

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 963195e..c43ad2c 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -571,6 +571,11 @@ static struct clk init_clocks_off[] = {
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
@@ -795,6 +800,54 @@ static struct clksrc_sources clkset_mout_g2d = {
 	.nr_sources	= ARRAY_SIZE(clkset_mout_g2d_list),
 };
 
+
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
 static struct clksrc_clk clk_dout_mmc0 = {
 	.clk		= {
 		.name		= "dout_mmc0",
@@ -1046,6 +1099,14 @@ static struct clksrc_clk clksrcs[] = {
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
@@ -1122,6 +1183,8 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_dout_mmc2,
 	&clk_dout_mmc3,
 	&clk_dout_mmc4,
+	&clk_mout_mfc0,
+	&clk_mout_mfc1,
 };
 
 static int xtal_rate;
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 6330b73..8395732 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -101,6 +101,8 @@
 
 #define EXYNOS4_PA_SROMC		0x12570000
 
+#define EXYNOS4_PA_MFC			0x13400000
+
 #define EXYNOS4_PA_UART			0x13800000
 
 #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
@@ -141,6 +143,7 @@
 #define S5P_PA_ONENAND_DMA		EXYNOS4_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			EXYNOS4_PA_SDRAM
 #define S5P_PA_SROMC			EXYNOS4_PA_SROMC
+#define S5P_PA_MFC			EXYNOS4_PA_MFC
 #define S5P_PA_SYSCON			EXYNOS4_PA_SYSCON
 #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
 
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
index 1dd5883..c290284 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -59,6 +59,8 @@
 
 #define S5PV210_PA_CFCON		0xE8200000
 
+#define S5PV210_PA_MFC			(0xF1700000)
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
index 9a7805b..07265e0 100644
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
 	depends on (ARCH_S5P64X0 || ARCH_S5P6442 || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS4)
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 42afff7..271bb54 100644
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
index 0000000..0dfcb1a
--- /dev/null
+++ b/arch/arm/plat-s5p/dev-mfc.c
@@ -0,0 +1,49 @@
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
+#include <linux/ioport.h>
+
+#include <mach/map.h>
+#include <plat/devs.h>
+#include <plat/irqs.h>
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
+static u64 s5p_mfc_dma_mask = DMA_BIT_MASK(32);
+
+struct platform_device s5p_device_mfc = {
+	.name          = "s5p-mfc",
+	.id            = -1,
+	.num_resources = ARRAY_SIZE(s5p_mfc_resource),
+	.resource      = s5p_mfc_resource,
+	.dev		= {
+		.dma_mask		= &s5p_mfc_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
+};
+
+EXPORT_SYMBOL(s5p_device_mfc);
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 0ae5dd0..1ad5ae1 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -138,6 +138,7 @@ extern struct platform_device s5p_device_fimc0;
 extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
 extern struct platform_device s5p_device_fimc3;
+extern struct platform_device s5p_device_mfc;
 
 extern struct platform_device s5p_device_mipi_csis0;
 extern struct platform_device s5p_device_mipi_csis1;
-- 
1.6.3.3
